import 'package:core_ai/core_ai.dart';
import 'package:core_document/core_document.dart';
import 'package:core_textile/core_textile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_proposal.freezed.dart';
part 'ai_proposal.g.dart';

/// Lifecycle states of a staged AI proposal (invariant I2; Architecture V2
/// §19: staging → accept | reject | re-roll).
///
/// Frozen initial set; future states are appended (never renamed). The
/// `staged` wire name matches the frozen `core_plugin` event
/// `ai_proposal_staged`.
enum AiProposalStatus {
  /// In the staging area; awaiting review.
  staged('staged', 'Staged'),

  /// User accepted; the proposal's commands were emitted to the bus.
  accepted('accepted', 'Accepted'),

  /// User rejected; the proposal never reached the bus.
  rejected('rejected', 'Rejected'),

  /// Superseded by a re-roll; the successor proposal links back via
  /// `AiProposal.predecessorId`.
  rerolled('rerolled', 'Re-rolled');

  const AiProposalStatus(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static AiProposalStatus fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown AiProposalStatus wire name',
      ),
    );
  }
}

/// The staged AI artefact — the referent of the frozen
/// `ToolPreview.previewId` / `ToolResult.previewId` and of the frozen
/// `core_plugin` event `ai_proposal_staged` (invariant I2: "AI output
/// becomes an AiProposal; only explicit user acceptance emits commands").
///
/// Carries the exact frozen [DocumentCommand]s acceptance will emit plus
/// the provenance precursors known at staging time, so acceptance needs no
/// additional AI-side input. Stores **no raw conversation** — only the
/// compiled-prompt hash, mirroring the frozen `AiProvenanceRecord`
/// (ADR-0014).
@freezed
abstract class AiProposal with _$AiProposal {
  const factory AiProposal({
    /// Stable UUID of this proposal.
    required String id,

    /// The frozen textile operation being proposed (invariant I6:
    /// `redesignTextilePrint` stays a distinct labelled operation — staging
    /// contains no operation-specific branching).
    @JsonKey(fromJson: _operationFromJson, toJson: _operationToJson)
    required AiOperation operation,

    /// The exact frozen commands acceptance will emit, in order.
    @Default(<DocumentCommand>[]) List<DocumentCommand> commands,

    /// Declared scope (invariant I3) — semantic node ids only, never
    /// resolved objects.
    @Default(<String>[]) List<String> targetNodeIds,

    /// Hash of the producing `CompiledPrompt` — the same value the frozen
    /// `AiProvenanceRecord.promptHash` stores.
    required String promptHash,

    /// Template the prompt compiler applied.
    String? templateId,

    /// The serving provider (frozen vocabulary, ADR-0009).
    @JsonKey(fromJson: _providerFromJson, toJson: _providerToJson)
    required AiProviderId provider,

    /// Serving model identifier ("every job records the serving
    /// provider/model", invariant I5).
    required String model,

    /// Version of the constraint engine that guarded the execution
    /// (provenance precursor).
    required String constraintVersion,

    /// Version of the tool that requested the execution (provenance
    /// precursor).
    required String toolVersion,

    /// Execution parameters (seed, quality tier…) — flow into
    /// `AiProvenanceRecord.parameters` on acceptance.
    @Default(<String, Object?>{}) Map<String, Object?> parameters,

    /// Lifecycle state.
    @Default(AiProposalStatus.staged)
    @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)
    AiProposalStatus status,

    /// For re-rolls: the proposal this one supersedes. The staging runtime
    /// overwrites this on `reroll` — lineage is the runtime's fact, not the
    /// caller's claim.
    String? predecessorId,

    /// Human-readable summary for review (mirrors the frozen
    /// `ToolPreview.description`).
    required String description,

    @Default(<String, Object?>{}) Map<String, Object?> metadata,
  }) = _AiProposal;

  factory AiProposal.fromJson(Map<String, Object?> json) =>
      _$AiProposalFromJson(json);
}

AiOperation _operationFromJson(String wireName) =>
    AiOperation.fromWireName(wireName);

String _operationToJson(AiOperation operation) => operation.wireName;

AiProviderId _providerFromJson(String wireName) =>
    AiProviderId.fromWireName(wireName);

String _providerToJson(AiProviderId provider) => provider.wireName;

AiProposalStatus _statusFromJson(String wireName) =>
    AiProposalStatus.fromWireName(wireName);

String _statusToJson(AiProposalStatus status) => status.wireName;
