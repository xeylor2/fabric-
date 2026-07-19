import 'package:core_ai/core_ai.dart';
import 'package:core_ai_staging/src/ai_proposal.dart';
import 'package:core_document/core_document.dart';

/// A sink that forwards a frozen [DocumentCommand] into the document runtime
/// and returns its [CommandResult].
///
/// This is exactly the shape of the frozen `DocumentEngine.apply` — binding
/// `sink: engine.apply` wires the staging area to the real document engine
/// without this package depending on a concrete engine instance or ever
/// touching the frozen command pipeline (Lock → Validation → History →
/// Document).
typedef DocumentCommandSink =
    CommandResult Function(
      DocumentCommand command, {
      CommandSource source,
      String author,
      AiProvenanceRecord? provenance,
    });

/// The **AI Proposal Staging** contract — the single surface every AI path
/// converges on (Architecture V2 §19: "Direct UI action / Conversation
/// ExecutionPlan / Inspector treeProposal → … → AI Proposal Staging
/// (nothing skips it) → accept | reject | re-roll → Command Bus").
///
/// Invariant I2 is structural here: [accept] is the only member whose
/// implementations may reach the command bus. Staging, rejection, re-roll
/// and every query are bus-silent by contract.
abstract interface class ProposalStagingContract {
  /// Admits [proposal] into the staging area and returns its id.
  ///
  /// The proposal must arrive with [AiProposalStatus.staged]; any other
  /// status or a duplicate id throws [ArgumentError]. Staging assigns the
  /// proposal a fresh frozen `AiPipelineRun` advanced (via the frozen
  /// `advanceTo`) through every stage upstream of staging — conversation →
  /// prompt compiler → constraint engine → provider adapter → execution →
  /// response parser → validation — and parked there: the next stage,
  /// `history`, is unreachable except through [accept].
  String stage(AiProposal proposal);

  /// The proposal with [proposalId], in any lifecycle state (terminal ones
  /// included — the review/audit surface), or null if never staged.
  AiProposal? proposal(String proposalId);

  /// The review queue: proposals with status [AiProposalStatus.staged], in
  /// insertion order (deterministic).
  List<AiProposal> get staged;

  /// Accepts the staged proposal — the only path to the bus (invariant I2).
  ///
  /// Emits each of the proposal's frozen commands in order through the
  /// injected sink with `CommandSource.ai`, [author] and one
  /// `AiProvenanceRecord` built from the proposal's provenance precursors
  /// (invariant I5 — the frozen bus independently rejects AI commands
  /// without provenance). On the first non-applied `CommandResult`,
  /// emission stops immediately, the proposal stays staged and that
  /// rejection is returned verbatim. When all commands apply, the pipeline
  /// run advances history → document update → undo stack → review →
  /// approval (frozen order), the proposal becomes
  /// [AiProposalStatus.accepted] and the last command's result is returned.
  ///
  /// Throws [ArgumentError] for an unknown id, [StateError] when the
  /// proposal is not staged or has no commands to apply.
  CommandResult accept(String proposalId, {required String author});

  /// Rejects the staged proposal; nothing touches the bus and the pipeline
  /// run stops at `validation` forever. Returns the updated proposal.
  ///
  /// Throws [ArgumentError] for an unknown id, [StateError] when the
  /// proposal is not staged.
  AiProposal reject(String proposalId);

  /// Supersedes the staged proposal with [replacement]: the predecessor
  /// becomes [AiProposalStatus.rerolled] and [replacement] is staged (fresh
  /// pipeline run, per [stage]) with its `predecessorId` forced to
  /// [proposalId]. Returns the replacement's id. Nothing touches the bus.
  ///
  /// Throws [ArgumentError] for an unknown id or an invalid replacement,
  /// [StateError] when the predecessor is not staged.
  String reroll(String proposalId, AiProposal replacement);

  /// The frozen pipeline-run record for [proposalId] (read-only), or null
  /// if never staged.
  AiPipelineRun? pipelineRun(String proposalId);
}
