import 'package:core_ai/core_ai.dart';
import 'package:core_ai_staging/core_ai_staging.dart';
import 'package:core_common/core_common.dart';
import 'package:core_document/core_document.dart';
import 'package:core_geometry/core_geometry.dart';
import 'package:core_layer/core_layer.dart';
import 'package:core_textile/core_textile.dart';
import 'package:test/test.dart';

/// M12G-2 verification suite — InspectionTreeProposalStager.
///
/// Real M12A staging area throughout (spy sink); the final group drives an
/// accepted tree proposal into a real DocumentEngine (§7: "ground
/// reconstruction runs on accept").
void main() {
  group('guard', () {
    test('a report without a tree proposal throws StateError; nothing '
        'staged', () {
      final h = _Harness();
      expect(
        () => h.stager.stage(_report(treeProposal: null), artboardId: 'ab-1'),
        throwsStateError,
      );
      expect(h.staging.staged, isEmpty);
    });
  });

  group('mechanical derivation — structure in, commands out', () {
    test('walks the subtree parent-before-child and emits one '
        'createDesignNode per node in walk order', () {
      final h = _Harness();
      final id = h.stager.stage(_report(), artboardId: 'ab-1');
      final proposal = h.staging.proposal(id)!;
      final commands = proposal.commands.cast<CreateDesignNodeCommand>();
      expect(commands.map((c) => c.node.id), [
        'node-artwork',
        'node-hero',
        'node-border',
      ]);
      // Parent linkage follows the walk: root under the supplied parent
      // (null = design-tree root), children under their proposer.
      expect(commands[0].parentNodeId, isNull);
      expect(commands[1].parentNodeId, 'node-artwork');
      expect(commands[2].parentNodeId, 'node-artwork');
      // One node per command — children travel via their own commands.
      expect(commands.every((c) => c.node.children.isEmpty), isTrue);
      expect(commands.every((c) => c.artboardId == 'ab-1'), isTrue);
    });

    test('explicit parentNodeId roots the subtree under it', () {
      final h = _Harness();
      final id = h.stager.stage(
        _report(),
        artboardId: 'ab-1',
        parentNodeId: 'node-existing',
      );
      final first =
          h.staging.proposal(id)!.commands.first as CreateDesignNodeCommand;
      expect(first.parentNodeId, 'node-existing');
    });
  });

  group('the staged proposal — atomic, I5-lineaged, I3-scoped, I2-held', () {
    test('one atomic AiProposal carries the report provenance precursors, '
        'the verbatim operation (I6) and the report linkage', () {
      final h = _Harness();
      final id = h.stager.stage(_report(), artboardId: 'ab-1');
      final proposal = h.staging.proposal(id)!;
      expect(h.staging.staged, hasLength(1)); // atomic: ONE proposal
      expect(proposal.status, AiProposalStatus.staged);
      expect(proposal.operation, AiOperation.fabricRestoration);
      expect(proposal.promptHash, 'sha256:m12g');
      expect(proposal.templateId, 'inspect-v1');
      expect(proposal.provider, AiProviderId.claude);
      expect(proposal.model, 'claude-fable-5');
      expect(proposal.constraintVersion, '1.0.0');
      expect(proposal.toolVersion, '0.1.0');
      expect(proposal.metadata['inspectionReportId'], 'rep-1');
      expect(proposal.metadata['artboardId'], 'ab-1');
    });

    test('I3 — declared scope is the proposed node ids plus referenced '
        'finding targets', () {
      final h = _Harness();
      final id = h.stager.stage(_report(), artboardId: 'ab-1');
      final scope = h.staging.proposal(id)!.targetNodeIds.toSet();
      expect(scope, {
        'node-artwork', 'node-hero', 'node-border', // proposed nodes
        'node-field', // region target
      });
    });

    test('I2 — staging only; the bus is untouched until accept', () {
      final h = _Harness();
      h.stager.stage(_report(), artboardId: 'ab-1');
      expect(h.sink.calls, isEmpty);
    });
  });

  group('end-to-end — §7 on real frozen contracts', () {
    test('stage → accept → ground reconstruction on a real DocumentEngine '
        'with provenance', () {
      final engine = DocumentEngine(
        document: _docWithArtboard(),
        clock: FixedClock(_t0),
        historyIds: SequentialIdGenerator(prefix: 'h'),
      );
      final staging = ProposalStagingArea(
        sink: engine.apply,
        clock: FixedClock(_t0),
        provenanceIds: SequentialIdGenerator(prefix: 'prov'),
      );
      final stager = InspectionTreeProposalStager(staging: staging);

      final id = stager.stage(_report(), artboardId: 'ab-1');
      expect(engine.document.aiProvenance, isEmpty); // I2: not yet

      final result = staging.accept(id, author: 'designer-1');
      expect(result, isA<CommandApplied>());

      // Ground reconstruction: the proposed subtree now lives in the tree.
      final tree = engine.document.artboards.single.designTreeRoot;
      final artwork = tree.children.single;
      expect(artwork.id, 'node-artwork');
      expect(artwork.children.map((n) => n.id), ['node-hero', 'node-border']);
      // I5: the frozen engine appends one ledger record per applied
      // command (3 nodes → 3 records), all carrying the inspection
      // lineage of the single acceptance.
      final ledger = engine.document.aiProvenance;
      expect(ledger, hasLength(3));
      expect(ledger.map((p) => p.promptHash).toSet(), {'sha256:m12g'});
      expect(ledger.map((p) => p.templateId).toSet(), {'inspect-v1'});
      expect(ledger.map((p) => p.provider).toSet(), {AiProviderId.claude});
    });
  });
}

// ---------------------------------------------------------------------------
// Fixtures (real frozen contracts; spy sink is test-only).
// ---------------------------------------------------------------------------

final DateTime _t0 = DateTime.utc(2026, 7, 20, 16);

class _SpySink {
  final List<DocumentCommand> calls = [];

  CommandResult call(
    DocumentCommand command, {
    CommandSource source = CommandSource.user,
    String author = 'local',
    AiProvenanceRecord? provenance,
  }) {
    calls.add(command);
    return CommandResult.applied(revision: calls.length);
  }
}

final class _Harness {
  _Harness() {
    staging = ProposalStagingArea(
      sink: sink.call,
      clock: FixedClock(_t0),
      provenanceIds: SequentialIdGenerator(prefix: 'prov'),
    );
    stager = InspectionTreeProposalStager(staging: staging);
  }

  final sink = _SpySink();
  late final ProposalStagingArea staging;
  late final InspectionTreeProposalStager stager;
}

InspectionReport _report({
  DesignNode? treeProposal = const DesignNode(
    id: 'node-artwork',
    name: 'Artwork',
    type: DesignNodeType.artwork,
    children: [
      DesignNode(
        id: 'node-hero',
        name: 'Hero Motif',
        type: DesignNodeType.element,
      ),
      DesignNode(
        id: 'node-border',
        name: 'Border',
        type: DesignNodeType.element,
      ),
    ],
  ),
}) {
  return InspectionReport(
    id: 'rep-1',
    operation: AiOperation.fabricRestoration,
    garment: GarmentType.kurta,
    motifs: const [
      MotifFinding(id: 'motif-1', role: MotifRole.hero, nodeId: 'node-hero'),
    ],
    regions: const [
      InspectionRegion(
        id: 'region-1',
        kind: InspectionRegionKind.printable,
        targetNodeIds: ['node-field'],
      ),
    ],
    treeProposal: treeProposal,
    promptHash: 'sha256:m12g',
    templateId: 'inspect-v1',
    provider: AiProviderId.claude,
    model: 'claude-fable-5',
    constraintVersion: '1.0.0',
    toolVersion: '0.1.0',
  );
}

FebricDocument _docWithArtboard() => FebricDocument(
  id: const DocumentId('doc-1'),
  projectId: const ProjectId('project-1'),
  manifest: const DocumentManifest(
    version: DocumentVersion(
      schema: DocumentVersion.currentSchema,
      generator: 'febric-test',
    ),
  ),
  metadata: DocumentMetadata(
    title: 'M12G Inspection',
    author: 'designer-1',
    createdAt: _t0,
    modifiedAt: _t0,
  ),
  artboards: [
    const Artboard(
      id: 'ab-1',
      name: 'Front Panel',
      size: Size2D(width: 1200, height: 1800),
      dpi: 300,
      backgroundColourHex: '#F0EADD',
      layerRoot: LayerModel(
        id: 'ab-1-layers',
        name: 'Layers',
        kind: LayerKind.artboard,
      ),
      designTreeRoot: DesignNode(
        id: 'ab-1-tree',
        name: 'Artwork Root',
        type: DesignNodeType.artwork,
      ),
    ),
  ],
);
