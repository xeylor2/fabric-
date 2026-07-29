import 'package:core_common/core_common.dart';
import 'package:core_document/core_document.dart';
import 'package:core_geometry/core_geometry.dart';
import 'package:core_layer/core_layer.dart';
import 'package:core_textile/core_textile.dart';

/// Deterministic fixtures for the core_tools suites (real frozen models —
/// no mocks). Mirrors the established engine/artboard fixture pattern;
/// cross-package test files are not importable, hence the local copy
/// (the S2-justified dev edges: core_layer, core_geometry).
final DateTime t0 = DateTime.utc(2026, 7, 26, 10);

/// Optionally pre-seeds element [nodes] and compositing [layers]
/// structurally (data, not commands), so the engine baseline starts with
/// an EMPTY history — pre-seeding is setup, never part of the timeline
/// under test.
FebricDocument documentWithArtboard({
  List<DesignNode> nodes = const [],
  List<LayerModel> layers = const [],
}) {
  return FebricDocument(
    id: const DocumentId('doc-1'),
    projectId: const ProjectId('project-1'),
    manifest: const DocumentManifest(
      version: DocumentVersion(
        schema: DocumentVersion.currentSchema,
        generator: 'febric-test',
      ),
    ),
    metadata: DocumentMetadata(
      title: 'M15 Tools',
      author: 'designer-1',
      createdAt: t0,
      modifiedAt: t0,
    ),
    artboards: [
      Artboard(
        id: 'ab-1',
        name: 'Front Panel',
        size: const Size2D(width: 1200, height: 1800),
        dpi: 300,
        backgroundColourHex: '#F0EADD',
        layerRoot: LayerModel(
          id: 'ab-1-layers',
          name: 'Layers',
          kind: LayerKind.artboard,
          children: layers,
        ),
        designTreeRoot: DesignNode(
          id: 'ab-1-tree',
          name: 'Artwork',
          type: DesignNodeType.artwork,
          children: nodes,
        ),
      ),
    ],
  );
}

DocumentEngine engine({FebricDocument? document}) {
  return DocumentEngine(
    document: document ?? documentWithArtboard(),
    clock: FixedClock(t0),
    historyIds: SequentialIdGenerator(prefix: 'h'),
  );
}
