import 'package:core_ai/src/prompt/ai_provider_id.dart';
import 'package:core_textile/core_textile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_job.freezed.dart';
part 'ai_job.g.dart';

/// Lifecycle states of an AI job (Architecture V2 §19 flow: plan → route →
/// execute → result).
///
/// Frozen initial set; future states are appended (never renamed). The
/// legal transition order is encoded as data on the vocabulary
/// ([canTransitionTo], the frozen `AiPipelineStage.previous` precedent):
/// planned → queued → running → succeeded | failed | cancelled, with
/// cancellation also reachable before execution starts. Advancing a job at
/// runtime belongs to the orchestrator slice — M12B ships the state
/// machine as values only.
enum AiJobStatus {
  /// Created by a plan or tool; not yet routed (§6 step 6).
  planned('planned', 'Planned'),

  /// Accepted for execution; awaiting a provider slot (§19 routing).
  queued('queued', 'Queued'),

  /// Provider adapter executing (the frozen `AiPipelineStage.execution`).
  running('running', 'Running'),

  /// Provider returned success; results proceed toward staging. Terminal.
  succeeded('succeeded', 'Succeeded'),

  /// Provider or validation failure. Terminal.
  failed('failed', 'Failed'),

  /// Explicitly cancelled before completion. Terminal.
  cancelled('cancelled', 'Cancelled');

  const AiJobStatus(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Whether this state ends the job's lifecycle.
  bool get isTerminal =>
      this == succeeded || this == failed || this == cancelled;

  /// Whether the lifecycle permits moving from this state to [next].
  ///
  /// planned → queued | cancelled; queued → running | cancelled;
  /// running → succeeded | failed | cancelled; terminal states go nowhere.
  bool canTransitionTo(AiJobStatus next) {
    return switch (this) {
      planned => next == queued || next == cancelled,
      queued => next == running || next == cancelled,
      running => next == succeeded || next == failed || next == cancelled,
      succeeded || failed || cancelled => false,
    };
  }

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static AiJobStatus fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown AiJobStatus wire name',
      ),
    );
  }
}

/// The immutable identity of one AI compute request — the typed unit the
/// remaining AI subsystems consume: routed by the API Manager (§10),
/// planned into Execution Plans (§6 step 6, `steps: [AiJob|Command]`),
/// listed by the Dashboard (§11 "recent AI jobs"), priced by
/// [CreditEstimator]s before compute is spent.
///
/// Constitutional invariants carried structurally:
/// - **I3** — [scopeNodeIds]/[scopeMaskIds] are the job's *declared* scope
///   (the automated zero-drift test's declared-set input). Ids only, never
///   resolved objects; enforcement stays with the frozen bus validation
///   and the orchestrator slice.
/// - **I5** — [provider]/[model] record the serving provider/model once
///   routed ("every job records the serving provider/model", §10); null
///   until the API Manager slice stamps them.
/// - **I6** — [operation] is carried verbatim; nothing in this model or
///   package derives `AiOperation.redesignTextilePrint` from any other
///   operation. Whole-design regeneration is only ever explicitly
///   labelled.
///
/// Jobs never store raw conversation — only the compiled-prompt hash
/// (the frozen `AiProvenanceRecord.promptHash` linkage convention).
@freezed
abstract class AiJob with _$AiJob {
  @Assert(
    'failureReason == null || status == AiJobStatus.failed',
    'failureReason is populated only when status is failed',
  )
  const factory AiJob({
    /// Stable UUID of this job.
    required String id,

    /// The frozen textile operation being executed (invariant I6).
    @JsonKey(fromJson: _operationFromJson, toJson: _operationToJson)
    required AiOperation operation,

    /// Declared scope: semantic-node ids (invariant I3).
    @Default(<String>[]) List<String> scopeNodeIds,

    /// Declared scope: mask ids (§6 "scope masks"; invariant I3).
    @Default(<String>[]) List<String> scopeMaskIds,

    /// Hash of the producing `CompiledPrompt` — the same linkage the
    /// frozen `AiProvenanceRecord.promptHash` and `AiProposal.promptHash`
    /// use. No raw conversation is ever held.
    required String promptHash,

    /// Template the prompt compiler applied.
    String? templateId,

    /// Capability classes this job requires — the API Manager's future
    /// routing input (§10). Declared here, routed later.
    @JsonKey(fromJson: _capabilitiesFromJson, toJson: _capabilitiesToJson)
    @Default(<AiCapability>{})
    Set<AiCapability> requiredCapabilities,

    /// Lifecycle state.
    @Default(AiJobStatus.planned)
    @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)
    AiJobStatus status,

    /// The serving provider (invariant I5) — null until routed.
    @JsonKey(fromJson: _providerFromJson, toJson: _providerToJson)
    AiProviderId? provider,

    /// The serving model (invariant I5) — null until routed.
    String? model,

    /// Reproducibility seed (mirrors `CompiledPrompt.seed`).
    int? seed,

    /// Execution parameters (quality tier etc. — kept as data).
    @Default(<String, Object?>{}) Map<String, Object?> parameters,

    /// Populated only with [AiJobStatus.failed] (mirrors
    /// `ProviderResponse.error`).
    String? failureReason,

    @Default(<String, Object?>{}) Map<String, Object?> metadata,
  }) = _AiJob;

  factory AiJob.fromJson(Map<String, Object?> json) => _$AiJobFromJson(json);

  const AiJob._();

  /// Whether the job's lifecycle has ended.
  bool get isTerminal => status.isTerminal;

  /// Read-only invariant-I6 query for the future validation gate (§6
  /// step 7): true only for the explicitly labelled whole-design job type.
  bool get isWholeDesignRegeneration =>
      operation == AiOperation.redesignTextilePrint;

  /// Returns a copy in [next]; throws [StateError] unless the lifecycle
  /// permits the transition (the frozen `AiPipelineRun.advanceTo`
  /// precedent: order unskippable by construction).
  AiJob withStatus(AiJobStatus next) {
    if (!status.canTransitionTo(next)) {
      throw StateError(
        'Illegal job transition: ${status.wireName} → ${next.wireName}',
      );
    }
    return copyWith(status: next);
  }
}

AiOperation _operationFromJson(String wireName) =>
    AiOperation.fromWireName(wireName);

String _operationToJson(AiOperation operation) => operation.wireName;

AiJobStatus _statusFromJson(String wireName) =>
    AiJobStatus.fromWireName(wireName);

String _statusToJson(AiJobStatus status) => status.wireName;

AiProviderId? _providerFromJson(String? wireName) =>
    wireName == null ? null : AiProviderId.fromWireName(wireName);

String? _providerToJson(AiProviderId? provider) => provider?.wireName;

Set<AiCapability> _capabilitiesFromJson(List<Object?> wireNames) =>
    wireNames.map((n) => AiCapability.fromWireName(n! as String)).toSet();

List<String> _capabilitiesToJson(Set<AiCapability> capabilities) =>
    capabilities.map((c) => c.wireName).toList()..sort();
