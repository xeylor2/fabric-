import 'package:core_ai/core_ai.dart';
import 'package:core_ai_staging/src/ai_proposal.dart';
import 'package:core_ai_staging/src/proposal_staging_contract.dart';
import 'package:core_document/core_document.dart';
import 'package:core_textile/core_textile.dart';

/// The tree-proposal staging bridge contract: turns an
/// [InspectionReport]'s proposed frozen `DesignNode` subtree into **one
/// staged** [AiProposal] (Architecture V2 §7: "The `treeProposal` is
/// **staged** (I2) … ground reconstruction runs on accept").
abstract interface class TreeProposalStager {
  /// Stages [report]'s tree proposal onto [artboardId], attaching the
  /// subtree under [parentNodeId] (null = the artboard's design-tree
  /// root). Returns the staged proposal's id.
  ///
  /// Throws [StateError] when the report carries no tree proposal — a
  /// report without proposed structure has nothing to stage, and staging
  /// nothing would counterfeit an acceptance surface (the M12A
  /// empty-proposal philosophy).
  String stage(
    InspectionReport report, {
    required String artboardId,
    String? parentNodeId,
  });
}

/// The **Inspection Tree-Proposal Stager** (M12G): pure mechanical
/// derivation, zero heuristics — the deterministic client half of §7.
///
/// - Walks the report's proposed [DesignNode] subtree in **parent-before-
///   child order** (depth-first, children in their frozen z-order) and
///   emits one frozen `DocumentCommand.createDesignNode` per node — the
///   LLM proposed structure; deterministic code derives the commands.
/// - Wraps every command in **one atomic** [AiProposal] ("ground
///   reconstruction runs on accept" — the whole proposed tree stands or
///   falls together), carrying the report's provenance precursors
///   (invariant I5) and the report/artboard linkage in metadata.
/// - Hands the proposal to the frozen [ProposalStagingContract] — its
///   terminal act. This class holds no sink: the command bus stays behind
///   staging's `accept` (invariant I2), where the frozen document
///   pipeline (Lock → Validation → History → Document) judges every
///   node.
/// - Declared scope (invariant I3) is the proposed subtree's node ids
///   plus every mask/node id its region and motif findings reference.
final class InspectionTreeProposalStager implements TreeProposalStager {
  InspectionTreeProposalStager({
    required ProposalStagingContract staging,
    // ignore: prefer_initializing_formals
  }) : _staging = staging;

  final ProposalStagingContract _staging;

  @override
  String stage(
    InspectionReport report, {
    required String artboardId,
    String? parentNodeId,
  }) {
    final root = report.treeProposal;
    if (root == null) {
      throw StateError(
        'Inspection report "${report.id}" carries no tree proposal — '
        'nothing to stage',
      );
    }

    // Parent-before-child: each node's command inserts under its parent,
    // so the frozen reducer can apply them in emission order on accept.
    final commands = <DocumentCommand>[];
    void walk(DesignNode node, String? parent) {
      commands.add(
        DocumentCommand.createDesignNode(
          artboardId: artboardId,
          parentNodeId: parent,
          // Children travel via their own commands, not embedded copies —
          // one node per command keeps the walk's order authoritative.
          node: node.copyWith(children: const []),
        ),
      );
      for (final child in node.children) {
        walk(child, node.id);
      }
    }

    walk(root, parentNodeId);

    // I3: the declared scope is everything the proposal may touch —
    // the proposed nodes plus every referenced finding target.
    final scopeIds = <String>{
      for (final command in commands)
        (command as CreateDesignNodeCommand).node.id,
      for (final region in report.regions) ...region.targetNodeIds,
      for (final motif in report.motifs)
        if (motif.nodeId != null) motif.nodeId!,
    };

    return _staging.stage(
      AiProposal(
        id: 'tree-proposal-${report.id}',
        // I6: the report's operation is carried verbatim, never derived.
        operation: report.operation,
        commands: commands,
        targetNodeIds: scopeIds.toList(),
        promptHash: report.promptHash,
        templateId: report.templateId,
        provider: report.provider,
        model: report.model,
        constraintVersion: report.constraintVersion,
        toolVersion: report.toolVersion,
        description:
            'Inspector tree proposal: ${commands.length} node(s) for '
            'artboard $artboardId',
        metadata: {
          'inspectionReportId': report.id,
          'artboardId': artboardId,
          if (parentNodeId != null) 'parentNodeId': parentNodeId,
        },
      ),
    );
  }
}
