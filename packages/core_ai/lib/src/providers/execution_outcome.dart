import 'package:core_ai/src/jobs/ai_job.dart';
import 'package:core_ai/src/prompt/ai_provider_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'execution_outcome.freezed.dart';
part 'execution_outcome.g.dart';

/// One execution attempt against one routed candidate, in failover order.
/// The attempt trail makes the §10 failover walk auditable.
@freezed
abstract class ExecutionAttempt with _$ExecutionAttempt {
  const factory ExecutionAttempt({
    /// The `RoutedCandidate.profileId` attempted.
    required String profileId,

    /// The candidate's provider (frozen vocabulary).
    @JsonKey(fromJson: _providerFromJson, toJson: _providerToJson)
    required AiProviderId provider,

    /// The candidate's model, when listed.
    String? model,

    /// Whether this attempt produced a successful provider response.
    required bool succeeded,

    /// Why the attempt did not succeed (missing adapter, or the frozen
    /// `ProviderResponse.error`).
    String? error,
  }) = _ExecutionAttempt;

  factory ExecutionAttempt.fromJson(Map<String, Object?> json) =>
      _$ExecutionAttemptFromJson(json);
}

/// The outcome of orchestrating one routed [AiJob] through the frozen
/// execution stages (sealed union — the `CommandResult`/`RoutingDecision`
/// precedent; explicit `kind` discriminator per M12C).
///
/// Every case carries the job in its resulting lifecycle state (the
/// frozen M12B state machine) and the full [ExecutionAttempt] trail.
@Freezed(unionKey: 'kind')
sealed class ExecutionOutcome with _$ExecutionOutcome {
  /// A candidate served the job: the job is `succeeded` with the actual
  /// serving provider/model stamped (invariant I5 — the *server*, not
  /// merely the first-ranked candidate), and the assembled proposal was
  /// staged under [proposalId] (invariant I2: it awaits explicit user
  /// acceptance there; nothing has touched the command bus).
  @FreezedUnionValue('executed')
  const factory ExecutionOutcome.executed({
    required AiJob job,
    required String proposalId,
    @Default(<ExecutionAttempt>[]) List<ExecutionAttempt> attempts,
  }) = ExecutionExecuted;

  /// At least one submission happened and every candidate failed: the job
  /// is `failed` with `failureReason` from the last attempt. Nothing was
  /// staged.
  @FreezedUnionValue('failed')
  const factory ExecutionOutcome.failed({
    required AiJob job,
    @Default(<ExecutionAttempt>[]) List<ExecutionAttempt> attempts,
  }) = ExecutionFailed;

  /// No submission was possible (no registered adapter for any routed
  /// candidate): the job is returned **unchanged** — still `queued` — the
  /// `RoutingDecision.noRoute` philosophy: absence of a path is an
  /// outcome, not a state change. Nothing was staged.
  @FreezedUnionValue('not_executed')
  const factory ExecutionOutcome.notExecuted({
    required AiJob job,
    @Default(<ExecutionAttempt>[]) List<ExecutionAttempt> attempts,
    String? detail,
  }) = ExecutionNotExecuted;

  factory ExecutionOutcome.fromJson(Map<String, Object?> json) =>
      _$ExecutionOutcomeFromJson(json);
}

AiProviderId _providerFromJson(String wireName) =>
    AiProviderId.fromWireName(wireName);

String _providerToJson(AiProviderId provider) => provider.wireName;
