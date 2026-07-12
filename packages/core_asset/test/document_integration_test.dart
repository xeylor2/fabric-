import 'package:core_asset/core_asset.dart';
import 'package:core_common/core_common.dart';
import 'package:core_document/core_document.dart';
import 'package:core_geometry/core_geometry.dart';
import 'package:core_layer/core_layer.dart';
import 'package:core_textile/core_textile.dart';
import 'package:test/test.dart';
import 'support/fixtures.dart';

/// The M4 integration contract (ADR-0016): the Asset Engine composes with
/// the FROZEN M2/M3 architecture — same command bus, same document schema,
/// same identity — with zero modifications to either engine.
DocumentEngine documentEngine() {
  return DocumentEngine(
    document: FebricDocument(
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
            name: 'Artwork',
            type: DesignNodeType.artwork,
            children: [
              DesignNode(
                id: 'z-field',
                name: 'Field',
                type: DesignNodeType.zone,
              ),
              DesignNode(
                id: 'z-border',
                name: 'Border',
                type: DesignNodeType.zone,
              ),
            ],
          ),
        ),
      ],
    ),
    clock: FixedClock(t0),
    historyIds: SequentialIdGenerator(prefix: 'h'),
  );
}

DesignNode treeOf(DocumentEngine e) =>
    e.document.artboards.single.designTreeRoot;

List<AssetUsage> collect(DocumentEngine e) => NodeAssetBinding.collectUsages(
  treeOf(e),
  artboardId: 'ab-1',
  documentId: e.document.id.value,
);

void main() {
  group('tree integration: nodes REFERENCE assets via the existing bus', () {
    test('setNodeMetadata binds an asset; the walk sees the edge; the '
        'graph resyncs — no new commands, no schema change', () {
      final doc = documentEngine();
      final assets = engine();
      registerMotif(assets, id: 'a-1');

      final bound = doc.apply(
        const DocumentCommand.setNodeMetadata(
          artboardId: 'ab-1',
          nodeId: 'z-field',
          key: NodeAssetBinding.assetIdKey,
          value: 'a-1',
        ),
      );
      expect(bound, isA<CommandApplied>());

      final usages = collect(doc);
      expect(usages.single.assetId, 'a-1');
      expect(usages.single.nodeId, 'z-field');
      expect(usages.single.artboardId, 'ab-1');
      expect(usages.single.documentId, 'doc-1');

      assets.syncDocumentUsages('doc-1', usages);
      expect(assets.graph.referenceCount('a-1'), 1);
      expect(assets.unusedAssetIds, isEmpty);
      expect(
        (assets.remove('a-1') as AssetRejected).reason,
        AssetRejectionReason.inUse,
        reason: 'a bound asset is protected by reference counting',
      );
    });

    test('one asset, many nodes: sharing is first-class', () {
      final doc = documentEngine();
      final assets = engine();
      registerMotif(assets, id: 'a-1');
      for (final nodeId in ['z-field', 'z-border']) {
        doc.apply(
          DocumentCommand.setNodeMetadata(
            artboardId: 'ab-1',
            nodeId: nodeId,
            key: NodeAssetBinding.assetIdKey,
            value: 'a-1',
          ),
        );
      }

      assets.syncDocumentUsages('doc-1', collect(doc));
      expect(assets.graph.nodesUsing('a-1'), ['z-field', 'z-border']);
      expect(assets.sharedAssetIds, ['a-1']);
    });

    test('secondary references ride the asset_refs list key', () {
      final doc = documentEngine();
      doc.apply(
        const DocumentCommand.setNodeMetadata(
          artboardId: 'ab-1',
          nodeId: 'z-field',
          key: NodeAssetBinding.assetIdKey,
          value: 'a-fill',
        ),
      );
      doc.apply(
        const DocumentCommand.setNodeMetadata(
          artboardId: 'ab-1',
          nodeId: 'z-field',
          key: NodeAssetBinding.assetRefsKey,
          value: ['a-brush', 'a-palette', 'a-fill'],
        ),
      );

      final ids = NodeAssetBinding.assetIdsOf(
        treeOf(doc).findById('z-field')!,
      );
      expect(
        ids,
        ['a-fill', 'a-brush', 'a-palette'],
        reason: 'primary first, refs after, duplicates collapsed',
      );
    });

    test('undoing the binding command unbinds — the whole loop is '
        'command-based and reversible', () {
      final doc = documentEngine();
      final assets = engine();
      registerMotif(assets, id: 'a-1');

      doc.apply(
        const DocumentCommand.setNodeMetadata(
          artboardId: 'ab-1',
          nodeId: 'z-field',
          key: NodeAssetBinding.assetIdKey,
          value: 'a-1',
        ),
      );
      assets.syncDocumentUsages('doc-1', collect(doc));
      expect(assets.graph.referenceCount('a-1'), 1);

      doc.undo();
      assets.syncDocumentUsages('doc-1', collect(doc));
      expect(assets.graph.referenceCount('a-1'), 0);
      expect(assets.unusedAssetIds, ['a-1']);
      expect(assets.remove('a-1'), isA<AssetApplied>());
    });

    test('a document referencing an asset this project does not hold '
        'surfaces as a broken reference', () {
      final doc = documentEngine();
      final assets = engine();
      doc.apply(
        const DocumentCommand.setNodeMetadata(
          artboardId: 'ab-1',
          nodeId: 'z-border',
          key: NodeAssetBinding.assetIdKey,
          value: 'moved-away',
        ),
      );
      assets.syncDocumentUsages('doc-1', collect(doc));
      expect(assets.brokenReferences.single.assetId, 'moved-away');
      expect(assets.brokenReferences.single.nodeId, 'z-border');
    });

    test('corrupt metadata never crashes a walk', () {
      const node = DesignNode(
        id: 'n-1',
        name: 'Corrupt',
        type: DesignNodeType.zone,
        metadata: {
          NodeAssetBinding.assetIdKey: 42,
          NodeAssetBinding.assetRefsKey: [true, '', 'a-ok', 7],
        },
      );
      expect(NodeAssetBinding.assetIdsOf(node), ['a-ok']);
    });
  });

  group('document manifest integration: ONE identity, no duplication', () {
    test('an engine asset embeds as an AssetRecord with the SAME uuid and '
        'hash through the existing importAsset command', () {
      final doc = documentEngine();
      final assets = engine();
      final asset = registerMotif(assets, id: 'a-1');

      final record = AssetRecord(
        id: asset.id,
        name: asset.name,
        kind: AssetKind.fromWireName(
          DocumentAssetBinding.documentKindWireName(asset.type),
        ),
        source: AssetSource.fromWireName(
          DocumentAssetBinding.documentSourceWireName(asset.origin),
        ),
        hash: asset.hash,
        mimeType: asset.mimeType,
        tags: asset.tags,
        metadata: {
          DocumentAssetBinding.assetTypeMetadataKey: asset.type.wireName,
          DocumentAssetBinding.assetOriginMetadataKey: asset.origin.wireName,
        },
      );
      expect(
        doc.apply(DocumentCommand.importAsset(asset: record)),
        isA<CommandApplied>(),
      );

      final embedded = doc.document.assets.byId('a-1')!;
      expect(embedded.id, asset.id, reason: 'one uuid everywhere');
      expect(embedded.hash, asset.hash, reason: 'one content address');
      expect(
        DocumentAssetBinding.typeFromRecord(
          kindWireName: embedded.kind.wireName,
          metadata: embedded.metadata,
        ),
        asset.type,
        reason: 'precise type recovers losslessly',
      );
      expect(
        DocumentAssetBinding.originFromRecord(
          sourceWireName: embedded.source.wireName,
          metadata: embedded.metadata,
        ),
        asset.origin,
      );
    });

    test('a record without precise metadata still recovers a sane type '
        'from its coarse kind', () {
      expect(
        DocumentAssetBinding.typeFromRecord(kindWireName: 'reference_photo'),
        AssetType.referenceImage,
      );
      expect(
        DocumentAssetBinding.originFromRecord(sourceWireName: 'capture'),
        AssetOrigin.capture,
      );
    });
  });
}
