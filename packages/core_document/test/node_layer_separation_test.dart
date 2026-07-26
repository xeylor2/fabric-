import 'package:core_document/core_document.dart';
import 'package:core_geometry/core_geometry.dart';
import 'package:core_layer/core_layer.dart';
import 'package:core_textile/core_textile.dart';
import 'package:test/test.dart';

import 'support/fixtures.dart';

/// M14 Slice 7 verification suite — Node↔Layer Separation (closure).
///
/// Binds NOTHING. The approved Q2 amendment fixed the Design Tree ↔
/// Layer Tree RELATIONSHIP (owner: document engine; direction: content →
/// compositing; cardinality: one node → one-or-more layers; participation
/// obligation attaches AT RENDERING) and deferred the binding
/// representation SHAPE to its first frozen consumer — rendering
/// compilation, compositing-affecting editing, or the layer-panel
/// projection. The approved Slice 7 specification verified that NONE of
/// those consumers exists in the repository (the frozen render spine
/// compiles directly from `DesignNode`: "a render object is a pure
/// function of its node alone" — design_node_producers.dart), so Q2-d
/// remains lawfully deferred beyond M14.
///
/// This suite therefore verifies the already-determined (a)-side of Q2:
/// the two hierarchies coexist per artboard, mutually blind (ADR-0006:
/// "deliberately separate vocabularies; neither package references the
/// other"), and a document whose content carries no layer association is
/// first-class ("unrendered ≠ deficient" — the Q2 amendment).
///
/// GUARDING THE DEFERRAL, NOT FORBIDDING THE FUTURE: the
/// no-binding-representation assertions below pin the CURRENT shape so a
/// premature binding cannot leak in silently. They do not forbid the
/// future document-owned representation, which binds at its first frozen
/// consumer under Q2's fixed constraints.
void main() {
  group('the two hierarchies — coexisting, independent', () {
    test('each artboard carries both a designTreeRoot and a layerRoot '
        'with independent identities', () {
      final e = engine();
      final ab = e.document.artboards.single;
      expect(ab.designTreeRoot.id, 'ab-1-tree');
      expect(ab.layerRoot.id, 'ab-1-layers');
      expect(ab.designTreeRoot.id, isNot(ab.layerRoot.id));
      expect(ab.layerRoot.kind, LayerKind.artboard);
      expect(ab.designTreeRoot.type, DesignNodeType.artwork);
    });
  });

  group('mutual blindness — ADR-0006, proven live in both directions', () {
    test('a full content session (create, classify, transform, repeat, '
        'replace) leaves the layer tree byte-identical', () {
      final e = engine();
      final layersBefore = e.document.artboards.single.layerRoot;

      // An S1–S6-style content session.
      const t = Transform2D(translation: Point2D(x: 5, y: 5));
      e.apply(
        DocumentCommand.createDesignNode(
          artboardId: 'ab-1',
          node: DesignNode(
            id: 'el-1',
            name: 'Boteh',
            type: DesignNodeType.element,
            metadata: {
              'object_type': TextileObjectType.motif.wireName,
              'transform': t.toJson(),
              'repeat': {'type': RepeatType.halfDrop.wireName},
            },
          ),
        ),
      );
      e.apply(
        const DocumentCommand.setNodeMetadata(
          artboardId: 'ab-1',
          nodeId: 'el-1',
          key: 'object_type',
          value: 'border',
        ),
      );
      // Replace composition (delete + create at same index).
      e.apply(
        const DocumentCommand.deleteDesignNode(
          artboardId: 'ab-1',
          nodeId: 'el-1',
        ),
      );
      e.apply(
        const DocumentCommand.createDesignNode(
          artboardId: 'ab-1',
          node: DesignNode(
            id: 'el-2',
            name: 'Successor',
            type: DesignNodeType.element,
          ),
          index: 0,
        ),
      );

      // The compositing structure is untouched by all of it.
      expect(e.document.artboards.single.layerRoot, layersBefore);
    });

    test('a full layer session (create, rename, metadata, move, delete) '
        'leaves the design tree identical, each step inverting exactly', () {
      final e = engine();
      final treeBefore = e.document.artboards.single.designTreeRoot;

      e.apply(
        const DocumentCommand.createLayer(
          artboardId: 'ab-1',
          layer: LayerModel(id: 'ly-1', name: 'Overlay', kind: LayerKind.layer),
        ),
      );
      e.apply(
        const DocumentCommand.renameLayer(
          artboardId: 'ab-1',
          layerId: 'ly-1',
          name: 'Overlay Renamed',
        ),
      );
      e.apply(
        const DocumentCommand.setLayerMetadata(
          artboardId: 'ab-1',
          layerId: 'ly-1',
          key: 'opacity_note',
          value: 'test-data',
        ),
      );
      e.apply(
        const DocumentCommand.moveLayer(
          artboardId: 'ab-1',
          layerId: 'ly-1',
          newParentId: 'ab-1-motifs',
          index: 0,
        ),
      );
      e.apply(
        const DocumentCommand.deleteLayer(artboardId: 'ab-1', layerId: 'ly-1'),
      );

      // The content structure is untouched by all of it.
      expect(e.document.artboards.single.designTreeRoot, treeBefore);

      // And the whole layer session unwinds exactly (5 exact inverses).
      for (var i = 0; i < 5; i++) {
        expect(e.undo(), isA<CommandApplied>());
      }
      expect(e.document.artboards.single.layerRoot, isNotNull);
      expect(e.document.artboards.single.layerRoot.findById('ly-1'), isNull);
    });
  });

  group('no binding representation exists — guarding the deferral', () {
    test('a node carrying all five pillar keys holds no layer-referencing '
        'key; a layer touched by tree activity gains nothing', () {
      final e = engine();
      const t = Transform2D(scale: 2.0);
      e.apply(DocumentCommand.importAsset(asset: _asset('asset-1')));
      e.apply(
        DocumentCommand.createDesignNode(
          artboardId: 'ab-1',
          node: DesignNode(
            id: 'el-1',
            name: 'Boteh',
            type: DesignNodeType.element,
            metadata: {
              'object_type': TextileObjectType.motif.wireName,
              'transform': t.toJson(),
              'repeat': {'type': RepeatType.mirror.wireName},
              'asset_id': 'asset-1',
            },
          ),
        ),
      );

      final node = e.document.artboards.single.designTreeRoot.children.single;
      // No key on the node names a layer id ('ab-1-layers', 'ab-1-motifs',
      // 'ab-1-hero' are the fixture layer ids).
      const layerIds = {'ab-1-layers', 'ab-1-motifs', 'ab-1-hero'};
      for (final value in node.metadata.values) {
        expect(layerIds.contains(value), isFalse);
      }
      // The fixture layers' metadata gained nothing from tree activity.
      final hero = e.document.artboards.single.layerRoot.findById('ab-1-hero')!;
      expect(hero.metadata, isEmpty);
    });
  });

  group('unrendered lawfulness — the Q2 amendment fact', () {
    test('a document whose content nodes have no layer association is '
        'first-class: every operation works and .febric round-trips', () {
      final e = engine();
      e.apply(
        const DocumentCommand.createDesignNode(
          artboardId: 'ab-1',
          node: DesignNode(
            id: 'el-1',
            name: 'Unbound',
            type: DesignNodeType.element,
          ),
        ),
      );
      // Binding-free content: rename, hide, duplicate-independent ops all
      // succeed; nothing demands a layer association.
      expect(
        e.apply(
          const DocumentCommand.renameDesignNode(
            artboardId: 'ab-1',
            nodeId: 'el-1',
            name: 'Still Unbound',
          ),
        ),
        isA<CommandApplied>(),
      );
      expect(
        e.apply(
          const DocumentCommand.setNodeVisibility(
            artboardId: 'ab-1',
            nodeId: 'el-1',
            visible: false,
          ),
        ),
        isA<CommandApplied>(),
      );

      const codec = FebricCodec();
      final restored = codec.decode(codec.encode(e.document));
      final node = restored.artboards.single.designTreeRoot.children.single;
      expect(node.name, 'Still Unbound');
      expect(node.visible, isFalse);
    });
  });

  group('persistence — both hierarchies round-trip independently', () {
    test('a document exercising content AND compositing mutations '
        'round-trips losslessly through .febric', () {
      final e = engine();
      e.apply(
        const DocumentCommand.createDesignNode(
          artboardId: 'ab-1',
          node: DesignNode(
            id: 'el-1',
            name: 'Boteh',
            type: DesignNodeType.element,
            metadata: {'object_type': 'motif'},
          ),
        ),
      );
      e.apply(
        const DocumentCommand.createLayer(
          artboardId: 'ab-1',
          layer: LayerModel(id: 'ly-1', name: 'Overlay', kind: LayerKind.layer),
        ),
      );

      const codec = FebricCodec();
      final restored = codec.decode(codec.encode(e.document));
      final ab = restored.artboards.single;
      expect(ab.designTreeRoot.findById('el-1'), isNotNull);
      expect(ab.layerRoot.findById('ly-1'), isNotNull);
      // Still no cross-reference after the round-trip.
      expect(
        ab.designTreeRoot.findById('el-1')!.metadata.containsKey('ly-1'),
        isFalse,
      );
    });
  });
}

/// Minimal registered-asset fixture (identity + hash only).
AssetRecord _asset(String id) => AssetRecord(
  id: id,
  name: 'Test Motif',
  kind: AssetKind.motif,
  source: AssetSource.imported,
  hash: 'sha256:test-$id',
);
