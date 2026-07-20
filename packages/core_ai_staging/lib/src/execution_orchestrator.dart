import 'package:core_ai/core_ai.dart';
import 'package:core_ai_staging/src/ai_proposal.dart';
import 'package:core_ai_staging/src/proposal_staging_contract.dart';

/// The proposal-assembly seam: turns one executed job and its successful
/// frozen `ProviderResponse` into the [AiProposal] that will be staged.
///
/// Parsing provider payloads into frozen `DocumentCommand`s is
/// provider/operation-specific — the ADR-0013 `responseParser` stage's
/// *content* — and therefore stays behind this injected contract
/// (implementations arrive with the backend/data-layer slices; tests
/// supply fakes, the M11 `_FakeTool` precedent). The returned proposal
/// must arrive `staged` — the frozen `ProposalStagingContract.stage`
/// enforces it.
abstract interface class ProposalAssembler {
  /// Assembles the proposal for [job] (in its `running` state, with the
  /// actual serving provider/model already stamped) from [response].
  AiProposal assemble(AiJob job, ProviderResponse response);
}

/// The execution-orchestration contract: the §19 "backend orchestrator"
/// node — drives one routed job through the frozen execution stages and
/// hands the result to AI Proposal Staging. Asynchronous solely because
/// the frozen `ProviderAdapter.submit` is (`Future<ProviderResponse>`,
/// ADR-0009) — the orchestrator itself performs no IO.
abstract interface class ExecutionOrchestrator {
  /// Executes [decision]'s job against its ranked candidates, submitting
  /// [prompt] — the only artefact an adapter may receive (the frozen
  /// ADR-0009 structural guarantee, preserved verbatim).
  ///
  /// The job must be [AiJobStatus.queued] (what `RoutingDecision.routed`
  /// produces); anything else throws [StateError].
  Future<ExecutionOutcome> execute(
    RoutingRouted decision,
    CompiledPrompt prompt,
  );
}

/// The **Provider Execution Orchestrator** (M12D): the concrete
/// [ExecutionOrchestrator] — the single unbuilt link of the §19 flow,
/// between API Manager routing (M12C) and AI Proposal Staging (M12A).
///
/// A thin async shell over frozen contracts (the M6–M11/M12A runtime
/// pattern). Pure failover mechanics, zero policy:
/// - walks the M12C candidate list **in rank order** — it never
///   re-routes, re-ranks or retries (§10 failover is the ranked list);
/// - resolves each candidate's adapter from the injected
///   [ProviderAdapterRegistry]; a missing adapter is a recorded attempt,
///   not an exception;
/// - transitions the job exclusively through the frozen
///   `AiJob.withStatus` guard: `queued → running` at the first real
///   submission, then `running → succeeded | failed`;
/// - on success re-stamps the job with the **actual serving**
///   provider/model (invariant I5 — the server, not merely the
///   first-ranked candidate), assembles the proposal via the injected
///   [ProposalAssembler], and stages it through the frozen
///   [ProposalStagingContract] — its terminal act. The command bus stays
///   behind staging's `accept` (invariant I2): this class holds no sink;
/// - when no submission was possible, returns the job **unchanged**
///   (still `queued`) — absence of a path is an outcome, not a state
///   change (the `RoutingDecision.noRoute` philosophy).
///
/// Adapters model failure as `ProviderResponse(succeeded: false)` per the
/// frozen contract; a throwing adapter is a contract breach and
/// propagates (the guard-violation philosophy — breaches are programming
/// errors, never converted into outcomes).
final class ProviderExecutionOrchestrator implements ExecutionOrchestrator {
  ProviderExecutionOrchestrator({
    required ProviderAdapterRegistry adapters,
    required ProposalAssembler assembler,
    required ProposalStagingContract staging,
    // ignore: prefer_initializing_formals
  }) : _adapters = adapters,
       // ignore: prefer_initializing_formals
       _assembler = assembler,
       // ignore: prefer_initializing_formals
       _staging = staging;

  final ProviderAdapterRegistry _adapters;
  final ProposalAssembler _assembler;
  final ProposalStagingContract _staging;

  @override
  Future<ExecutionOutcome> execute(
    RoutingRouted decision,
    CompiledPrompt prompt,
  ) async {
    final job = decision.job;
    if (job.status != AiJobStatus.queued) {
      throw StateError(
        'Only a queued job can be executed; '
        '"${job.id}" is ${job.status.wireName}',
      );
    }

    final attempts = <ExecutionAttempt>[];
    AiJob? running;
    String? lastError;

    for (final candidate in decision.candidates) {
      final adapter = _adapters.adapterFor(candidate.provider);
      if (adapter == null) {
        attempts.add(
          ExecutionAttempt(
            profileId: candidate.profileId,
            provider: candidate.provider,
            model: candidate.model,
            succeeded: false,
            error: 'No adapter registered for ${candidate.provider.wireName}',
          ),
        );
        continue;
      }

      // First real submission: queued → running (frozen guard).
      running ??= job.withStatus(AiJobStatus.running);
      final response = await adapter.submit(prompt);

      if (response.succeeded) {
        // Invariant I5: record the ACTUAL serving provider/model.
        final serving = running.copyWith(
          provider: candidate.provider,
          model: candidate.model,
        );
        final proposalId = _staging.stage(
          _assembler.assemble(serving, response),
        );
        attempts.add(
          ExecutionAttempt(
            profileId: candidate.profileId,
            provider: candidate.provider,
            model: candidate.model,
            succeeded: true,
          ),
        );
        return ExecutionOutcome.executed(
          job: serving.withStatus(AiJobStatus.succeeded),
          proposalId: proposalId,
          attempts: attempts,
        );
      }

      lastError =
          response.error ??
          'Provider ${candidate.provider.wireName} reported failure';
      attempts.add(
        ExecutionAttempt(
          profileId: candidate.profileId,
          provider: candidate.provider,
          model: candidate.model,
          succeeded: false,
          error: lastError,
        ),
      );
    }

    if (running == null) {
      // Zero submissions were possible: the job is untouched.
      return ExecutionOutcome.notExecuted(
        job: job,
        attempts: attempts,
        detail: 'No registered adapter for any routed candidate',
      );
    }
    return ExecutionOutcome.failed(
      job: running
          .withStatus(AiJobStatus.failed)
          .copyWith(failureReason: lastError),
      attempts: attempts,
    );
  }
}
