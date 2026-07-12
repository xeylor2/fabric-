import 'package:core_ai/core_ai.dart';
import 'package:core_common/core_common.dart';
import 'package:core_document/core_document.dart';
import 'package:core_geometry/core_geometry.dart';
import 'package:core_layer/core_layer.dart';
import 'package:core_textile/core_textile.dart';

/// Deterministic fixtures shared by the M2 test suite (real models — no
/// mocks).
final DateTime t0 = DateTime.utc(2026, 7, 7, 12);

FebricDocument emptyDocument() {
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
      title: 'Eid Lawn 01',
      author: 'designer-1',
      createdAt: t0,
      modifiedAt: t0,
      tags: const ['lawn', 'eid'],
    ),
  );
}

Artboard artboard({String id = 'ab-1'}) {
  return Artboard(
    id: id,
    name: 'Front Panel',
    size: const Size2D(width: 1200, height: 1800),
    dpi: 300,
    backgroundColourHex: '#F0EADD',
    layerRoot: LayerModel(
      id: '$id-layers',
      name: 'Layers',
      kind: LayerKind.artboard,
      children: [
        LayerModel(
          id: '$id-motifs',
          name: 'Motifs',
          kind: LayerKind.group,
          children: [
            LayerModel(
              id: '$id-hero',
              name: 'Hero Paisley',
              kind: LayerKind.pattern,
              tags: const ['hero'],
            ),
          ],
        ),
      ],
    ),
    designTreeRoot: DesignNode(
      id: '$id-tree',
      name: 'Artwork',
      type: DesignNodeType.artwork,
    ),
  );
}

/// A document with one artboard applied through the engine-independent
/// constructor path (fixtures build state; tests mutate via commands only).
FebricDocument documentWithArtboard() {
  return emptyDocument().copyWith(artboards: [artboard()]);
}

DocumentEngine engine({FebricDocument? document}) {
  return DocumentEngine(
    document: document ?? documentWithArtboard(),
    clock: FixedClock(t0),
    historyIds: SequentialIdGenerator(prefix: 'h'),
  );
}

AiProvenanceRecord provenance({String id = 'prov-1'}) {
  return AiProvenanceRecord(
    id: id,
    promptHash: 'sha256:abc123',
    templateId: 'motif-refine-v1',
    provider: AiProviderId.claude,
    model: 'claude-fable-5',
    parameters: const {'seed': 42},
    constraintVersion: '1.0.0',
    toolVersion: '0.1.0',
    timestamp: t0,
    revision: 0,
    affectedIds: const [],
  );
}
