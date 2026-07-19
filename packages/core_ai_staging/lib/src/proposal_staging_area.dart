import 'package:core_ai/core_ai.dart';
import 'package:core_ai_staging/src/ai_proposal.dart';
import 'package:core_ai_staging/src/proposal_staging_contract.dart';
import 'package:core_common/core_common.dart';
import 'package:core_document/core_document.dart';

/// The **AI Proposal Staging Area** (M12A): the concrete, stateful
/// [ProposalStagingContract] — the constitutional terminus of every AI path.
///
/// A thin stateful shell over frozen contracts (the M6–M11 runtime
/// pattern). It:
/// - holds staged [AiProposal]s in insertion order (deterministic review
///   queue) and keeps every proposal ever staged for audit;
/// - drives one frozen `AiPipelineRun` per proposal using the frozen
///   `advanceTo` — order enforcement is **reused**, never reimplemented
///   (a skipped stage is structurally impossible, ADR-0013);
/// - on [accept] — and only there (invariant I2) — emits the proposal's
///   frozen [DocumentCommand]s through the injected [DocumentCommandSink]
///   with `CommandSource.ai` and one `AiProvenanceRecord` built from the
///   proposal's provenance precursors (invariant I5; the frozen bus
///   independently rejects AI commands without provenance);
/// - never mutates documents, never reduces commands, never owns a
///   `DocumentEngine` (invariant I1: the injected sink is the only bus
///   access).
///
/// Time comes from the frozen `core_common.Clock` seam (engines never call
/// `DateTime.now()` directly); provenance record ids from the frozen
/// `core_common.IdGenerator` seam (the `DocumentEngine.historyIds`
/// precedent).
final class ProposalStagingArea implements ProposalStagingContract {
  ProposalStagingArea({
    required DocumentCommandSink sink,
    Clock clock = const SystemClock(),
    IdGenerator? provenanceIds,
    // ignore: prefer_initializing_formals
  }) : _sink = sink,
       // ignore: prefer_initializing_formals
       _clock = clock,
       _provenanceIds = provenanceIds ?? SequentialIdGenerator(prefix: 'prov');

  final DocumentCommandSink _sink;
  final Clock _clock;
  final IdGenerator _provenanceIds;

  /// Every proposal ever staged, keyed by id (terminal states included —
  /// the review/audit surface). Insertion order is preserved.
  final Map<String, AiProposal> _proposals = <String, AiProposal>{};

  /// The frozen pipeline-run record per proposal id.
  final Map<String, AiPipelineRun> _runs = <String, AiPipelineRun>{};

  /// The frozen stages upstream of staging: a proposal arriving here has
  /// already been conversed, compiled, constrained, routed, executed,
  /// parsed and validated. Staging parks the run at `validation`; the next
  /// stage, `history`, is unreachable except through [accept].
  static const List<AiPipelineStage> _upstreamStages = [
    AiPipelineStage.conversation,
    AiPipelineStage.promptCompiler,
    AiPipelineStage.constraintEngine,
    AiPipelineStage.providerAdapter,
    AiPipelineStage.execution,
    AiPipelineStage.responseParser,
    AiPipelineStage.validation,
  ];

  /// The frozen stages [accept] completes: the back half of the Universal
  /// AI Pipeline (ADR-0013). Approval is unreachable before review by the
  /// frozen `advanceTo` — executed here, not just modelled.
  static const List<AiPipelineStage> _acceptanceStages = [
    AiPipelineStage.history,
    AiPipelineStage.documentUpdate,
    AiPipelineStage.undoStack,
    AiPipelineStage.review,
    AiPipelineStage.approval,
  ];

  @override
  String stage(AiProposal proposal) {
    if (proposal.status != AiProposalStatus.staged) {
      throw ArgumentError.value(
        proposal.status.wireName,
        'proposal',
        'A proposal must arrive with status "staged"',
      );
    }
    if (_proposals.containsKey(proposal.id)) {
      throw ArgumentError.value(
        proposal.id,
        'proposal',
        'A proposal with this id was already staged',
      );
    }
    var run = AiPipelineRun(id: proposal.id);
    for (final stage in _upstreamStages) {
      run = run.advanceTo(stage);
    }
    _proposals[proposal.id] = proposal;
    _runs[proposal.id] = run;
    return proposal.id;
  }

  @override
  AiProposal? proposal(String proposalId) => _proposals[proposalId];

  @override
  List<AiProposal> get staged => List.unmodifiable(
    _proposals.values.where((p) => p.status == AiProposalStatus.staged),
  );

  @override
  CommandResult accept(String proposalId, {required String author}) {
    final proposal = _requireStaged(proposalId);
    if (proposal.commands.isEmpty) {
      throw StateError(
        'Proposal "$proposalId" has no commands to apply — an empty '
        'proposal reaching acceptance is a caller error',
      );
    }

    // Invariant I5: one provenance record from the proposal's precursors.
    // revision/affectedIds are engine-owned: the frozen engine overwrites
    // both at apply (`provenance.copyWith(revision: …, affectedIds: …)`),
    // so staging never guesses them.
    final provenance = AiProvenanceRecord(
      id: _provenanceIds.next(),
      promptHash: proposal.promptHash,
      templateId: proposal.templateId,
      provider: proposal.provider,
      model: proposal.model,
      parameters: proposal.parameters,
      constraintVersion: proposal.constraintVersion,
      toolVersion: proposal.toolVersion,
      timestamp: _clock.now(),
      revision: 0,
      affectedIds: const [],
    );

    late CommandResult last;
    for (final command in proposal.commands) {
      final result = _sink(
        command,
        source: CommandSource.ai,
        author: author,
        provenance: provenance,
      );
      if (!result.wasApplied) {
        // The bus refused: stop immediately, stay staged, return the bus's
        // verdict verbatim. No partial-acceptance state, no rollback here —
        // undo belongs to the frozen history pipeline.
        return result;
      }
      last = result;
    }

    var run = _runs[proposalId]!;
    for (final stage in _acceptanceStages) {
      run = run.advanceTo(stage);
    }
    _runs[proposalId] = run;
    _proposals[proposalId] = proposal.copyWith(
      status: AiProposalStatus.accepted,
    );
    return last;
  }

  @override
  AiProposal reject(String proposalId) {
    _requireStaged(proposalId);
    final updated = _proposals[proposalId]!.copyWith(
      status: AiProposalStatus.rejected,
    );
    _proposals[proposalId] = updated;
    return updated;
  }

  @override
  String reroll(String proposalId, AiProposal replacement) {
    _requireStaged(proposalId);
    if (replacement.status != AiProposalStatus.staged) {
      throw ArgumentError.value(
        replacement.status.wireName,
        'replacement',
        'A replacement must arrive with status "staged"',
      );
    }
    if (_proposals.containsKey(replacement.id)) {
      throw ArgumentError.value(
        replacement.id,
        'replacement',
        'A proposal with this id was already staged',
      );
    }
    _proposals[proposalId] = _proposals[proposalId]!.copyWith(
      status: AiProposalStatus.rerolled,
    );
    // Lineage is the runtime's fact, not the caller's claim.
    return stage(replacement.copyWith(predecessorId: proposalId));
  }

  @override
  AiPipelineRun? pipelineRun(String proposalId) => _runs[proposalId];

  AiProposal _requireStaged(String proposalId) {
    final proposal = _proposals[proposalId];
    if (proposal == null) {
      throw ArgumentError.value(
        proposalId,
        'proposalId',
        'Unknown proposal id',
      );
    }
    if (proposal.status != AiProposalStatus.staged) {
      throw StateError(
        'Proposal "$proposalId" is ${proposal.status.wireName}, not staged',
      );
    }
    return proposal;
  }
}
