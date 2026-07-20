import 'package:core_ai/core_ai.dart';
import 'package:core_ai_staging/src/ai_proposal.dart';
import 'package:core_ai_staging/src/execution_orchestrator.dart';
import 'package:core_ai_staging/src/execution_plan.dart';
import 'package:core_ai_staging/src/proposal_staging_contract.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'plan_dispatcher.freezed.dart';
part 'plan_dispatcher.g.dart';

/// The outcome of dispatching one plan step (sealed union, explicit
/// `kind` discriminator — the M12C/M12D precedent).
@Freezed(unionKey: 'kind')
sealed class PlanStepOutcome with _$PlanStepOutcome {
  /// A job step went through routing (M12C) and execution (M12D).
  /// [routing] records the decision; [execution] the outcome, null when
  /// routing produced no candidate (the job never reached execution).
  @FreezedUnionValue('job')
  const factory PlanStepOutcome.job({
    required int stepIndex,
    required RoutingDecision routing,
    ExecutionOutcome? execution,
  }) = PlanJobOutcome;

  /// A command step was staged as a proposal (invariant I2: a plan's
  /// commands are AI-proposed output — they reach the bus only through
  /// explicit acceptance in staging).
  @FreezedUnionValue('command')
  const factory PlanStepOutcome.command({
    required int stepIndex,
    required String proposalId,
  }) = PlanCommandOutcome;

  factory PlanStepOutcome.fromJson(Map<String, Object?> json) =>
      _$PlanStepOutcomeFromJson(json);
}

/// The outcome of dispatching a whole plan: the per-step trail (the
/// M12D `ExecutionAttempt` trail philosophy — auditable, in step order).
@freezed
abstract class PlanDispatchResult with _$PlanDispatchResult {
  const factory PlanDispatchResult({
    /// The dispatched plan's id.
    required String planId,

    /// One outcome per dispatched step, in step order.
    @Default(<PlanStepOutcome>[]) List<PlanStepOutcome> outcomes,
  }) = _PlanDispatchResult;

  factory PlanDispatchResult.fromJson(Map<String, Object?> json) =>
      _$PlanDispatchResultFromJson(json);
}

/// The plan-dispatch contract: walks a **validated** plan's steps in
/// order through the completed M12 spine. Asynchronous solely because
/// the M12D `ExecutionOrchestrator.execute` is; the dispatcher itself
/// performs no IO.
abstract interface class PlanDispatcher {
  /// Dispatches [plan]. The caller supplies the [validation] verdict the
  /// step-7 gate produced for exactly this plan; dispatching an invalid
  /// plan throws [StateError] — the gate cannot be skipped (§6: the
  /// validator runs before compute is spent).
  Future<PlanDispatchResult> dispatch(
    ExecutionPlan plan, {
    required PlanValidation validation,
    required List<ProviderProfile> profiles,
    required String author,
  });
}

/// The **Execution Plan Dispatcher** (M12E): pure ordered iteration over
/// existing frozen contracts — zero policy, zero heuristics.
///
/// - **Job steps** go job → [JobRouter] (M12C) → [ExecutionOrchestrator]
///   (M12D). A `noRoute` decision records the outcome and moves on —
///   absence of a path is an outcome, not an exception (the frozen
///   `RoutingDecision.noRoute` philosophy); the §6 plan surface shows
///   the user every step's fate.
/// - **Command steps** become staged [AiProposal]s carrying the plan's
///   provenance precursors (invariant I5) via the frozen
///   [ProposalStagingContract] — never a direct bus emission (invariant
///   I2: this class holds no sink; the bus stays behind staging's
///   `accept`).
/// - Steps dispatch **sequentially in plan order** (§6: the plan
///   executes in order).
final class ExecutionPlanDispatcher implements PlanDispatcher {
  ExecutionPlanDispatcher({
    required JobRouter router,
    required ExecutionOrchestrator orchestrator,
    required ProposalStagingContract staging,
    // ignore: prefer_initializing_formals
  }) : _router = router,
       // ignore: prefer_initializing_formals
       _orchestrator = orchestrator,
       // ignore: prefer_initializing_formals
       _staging = staging;

  final JobRouter _router;
  final ExecutionOrchestrator _orchestrator;
  final ProposalStagingContract _staging;

  @override
  Future<PlanDispatchResult> dispatch(
    ExecutionPlan plan, {
    required PlanValidation validation,
    required List<ProviderProfile> profiles,
    required String author,
  }) async {
    if (!validation.valid) {
      throw StateError(
        'Plan "${plan.id}" failed step-7 validation '
        '(${validation.violations.length} violation(s)); '
        'an invalid plan is never dispatched',
      );
    }

    final outcomes = <PlanStepOutcome>[];
    for (final (i, step) in plan.steps.indexed) {
      switch (step) {
        case PlanJobStep(:final job, :final prompt):
          final decision = _router.route(job, profiles);
          switch (decision) {
            case RoutingRouted():
              final execution = await _orchestrator.execute(decision, prompt);
              outcomes.add(
                PlanStepOutcome.job(
                  stepIndex: i,
                  routing: decision,
                  execution: execution,
                ),
              );
            case RoutingNoRoute():
              outcomes.add(
                PlanStepOutcome.job(stepIndex: i, routing: decision),
              );
          }
        case PlanCommandStep(:final command, :final description):
          final proposalId = _staging.stage(
            AiProposal(
              id: '${plan.id}-step-$i',
              operation: plan.operation,
              commands: [command],
              targetNodeIds: plan.affectedNodeIds,
              promptHash: plan.promptHash,
              provider: plan.provider,
              model: plan.model,
              constraintVersion: plan.constraintVersion,
              toolVersion: plan.toolVersion,
              description: description,
              metadata: {'planId': plan.id, 'stepIndex': i},
            ),
          );
          outcomes.add(
            PlanStepOutcome.command(stepIndex: i, proposalId: proposalId),
          );
      }
    }
    return PlanDispatchResult(planId: plan.id, outcomes: outcomes);
  }
}
