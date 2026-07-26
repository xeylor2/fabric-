import 'package:core_document/core_document.dart';
import 'package:core_geometry/core_geometry.dart';
import 'package:core_mask/core_mask.dart';
import 'package:core_textile/core_textile.dart';
import 'package:test/test.dart';

import 'support/fixtures.dart';

/// M14 Slice 5 verification suite — Import Composition.
///
/// Binds NO new deferred representation: the node→asset reference keys
/// (`asset_id`/`asset_refs`) are an already-frozen ADR-0016 contract —
/// written EXCLUSIVELY via the frozen `setNodeMetadata` (decision 5) —
/// and the element classification stamp was bound in Slice 1. This slice
/// delivers engine-level verification of the approved M14 Q7
/// determination: import is the ordered three-command composition
/// `importAsset` → `createDesignNode` → `setNodeMetadata`(reference),
/// with registration-before-reference as a **caller-honoured data
/// dependency** (Q7) — NOT reducer enforcement, which does not exist.
///
/// KEY-LITERAL DISCIPLINE: core_document has NO core_asset edge (runtime
/// or dev), so this suite uses the frozen literals directly. That is the
/// ADR-0016-prescribed usage of core_document's own writer — not an
/// elevation of a convention, and not a violation of the Q1 constraint
/// (which scoped the literal-ban to core_garment source).
///
/// DQ-S5-1 (recorded at specification, deferred, NOT resolved here):
/// `AssetRecord.usageRefs` is declared but maintained by no writer; the
/// tests document that frozen behaviour and assert no maintenance rule.
void main() {
  group('the Q7 composition — register, create, reference, in order', () {
    test('importAsset → createDesignNode → setNodeMetadata lands a '
        'classified element referencing a registered asset', () {
      final e = engine();

      // 1. Registration (the data-dependency prerequisite).
      final registered = e.apply(
        DocumentCommand.importAsset(asset: _asset('asset-1')),
      );
      expect(registered, isA<CommandApplied>());
      expect(e.document.assets.byId('asset-1'), _asset('asset-1'));

      // 2. Node creation (a Slice-1-classified element).
      e.apply(
        DocumentCommand.createDesignNode(
          artboardId: 'ab-1',
          node: DesignNode(
            id: 'el-1',
            name: 'Imported Boteh',
            type: DesignNodeType.element,
            metadata: {'object_type': TextileObjectType.motif.wireName},
          ),
        ),
      );

      // 3. Reference by id (the frozen ADR-0016 key, frozen writer).
      final referenced = e.apply(
        const DocumentCommand.setNodeMetadata(
          artboardId: 'ab-1',
          nodeId: 'el-1',
          key: 'asset_id',
          value: 'asset-1',
        ),
      );
      expect(referenced, isA<CommandApplied>());
      expect(_node(e).metadata['asset_id'], 'asset-1');
    });

    test('asset_refs carries a multi-asset reference list — the second '
        'frozen ADR-0016 key', () {
      final e = engine();
      e.apply(DocumentCommand.importAsset(asset: _asset('asset-1')));
      e.apply(DocumentCommand.importAsset(asset: _asset('asset-2')));
      e.apply(
        const DocumentCommand.createDesignNode(
          artboardId: 'ab-1',
          node: DesignNode(
            id: 'el-1',
            name: 'Composite',
            type: DesignNodeType.element,
          ),
        ),
      );
      e.apply(
        const DocumentCommand.setNodeMetadata(
          artboardId: 'ab-1',
          nodeId: 'el-1',
          key: 'asset_refs',
          value: ['asset-1', 'asset-2'],
        ),
      );
      expect(_node(e).metadata['asset_refs'], ['asset-1', 'asset-2']);
    });

    test('stepwise exact inverses: undo x3 unwinds reference → node → '
        'registration; redo x3 replays — no grouping mechanism exists', () {
      final e = engine();
      e.apply(DocumentCommand.importAsset(asset: _asset('asset-1')));
      e.apply(
        const DocumentCommand.createDesignNode(
          artboardId: 'ab-1',
          node: DesignNode(
            id: 'el-1',
            name: 'Imported Boteh',
            type: DesignNodeType.element,
          ),
        ),
      );
      e.apply(
        const DocumentCommand.setNodeMetadata(
          artboardId: 'ab-1',
          nodeId: 'el-1',
          key: 'asset_id',
          value: 'asset-1',
        ),
      );

      // Unwind in exact reverse order.
      expect(e.undo(), isA<CommandApplied>()); // reference gone
      expect(_node(e).metadata['asset_id'], isNull);
      expect(e.undo(), isA<CommandApplied>()); // node gone
      expect(_tree(e).children, isEmpty);
      expect(e.undo(), isA<CommandApplied>()); // registration gone
      expect(e.document.assets.byId('asset-1'), isNull);

      // Replay forward.
      expect(e.redo(), isA<CommandApplied>());
      expect(e.redo(), isA<CommandApplied>());
      expect(e.redo(), isA<CommandApplied>());
      expect(e.document.assets.byId('asset-1'), isNotNull);
      expect(_node(e).metadata['asset_id'], 'asset-1');
    });
  });

  group('frozen import/remove semantics', () {
    test('re-importing an existing id is rejected invalid — the frozen '
        'dedup, asserted as such', () {
      final e = engine();
      e.apply(DocumentCommand.importAsset(asset: _asset('asset-1')));
      final duplicate = e.apply(
        DocumentCommand.importAsset(asset: _asset('asset-1')),
      );
      expect(duplicate, isA<CommandRejected>());
      expect(
        (duplicate as CommandRejected).reason,
        CommandRejectionReason.invalid,
      );
    });

    test('removeAsset inverts to importAsset with the removed record '
        'verbatim; an absent id is rejected notFound', () {
      final e = engine();
      e.apply(DocumentCommand.importAsset(asset: _asset('asset-1')));
      final removed = e.apply(
        const DocumentCommand.removeAsset(assetId: 'asset-1'),
      );
      expect(removed, isA<CommandApplied>());
      expect(e.document.assets.byId('asset-1'), isNull);

      expect(e.undo(), isA<CommandApplied>());
      expect(e.document.assets.byId('asset-1'), _asset('asset-1'));

      final absent = e.apply(
        const DocumentCommand.removeAsset(assetId: 'never-registered'),
      );
      expect(absent, isA<CommandRejected>());
      expect(
        (absent as CommandRejected).reason,
        CommandRejectionReason.notFound,
      );
    });
  });

  group('Q7 — data dependency, documented as caller-honoured, not '
      'enforced', () {
    test('a dangling asset_id is silently accepted: the reducer performs '
        'NO referential validation (integrity detection is the core_asset '
        'usage graph\'s assigned job, ADR-0016 decision 7)', () {
      final e = engine();
      e.apply(
        const DocumentCommand.createDesignNode(
          artboardId: 'ab-1',
          node: DesignNode(
            id: 'el-1',
            name: 'Dangling',
            type: DesignNodeType.element,
          ),
        ),
      );
      final dangling = e.apply(
        const DocumentCommand.setNodeMetadata(
          artboardId: 'ab-1',
          nodeId: 'el-1',
          key: 'asset_id',
          value: 'unregistered-id',
        ),
      );
      // Accepted — registration-before-reference is Q7's data dependency
      // honoured by callers, not a reducer rule. No validation asserted.
      expect(dangling, isA<CommandApplied>());
      expect(_node(e).metadata['asset_id'], 'unregistered-id');
    });

    test('removeAsset succeeds while a node still references the asset — '
        'a dangling reference is permitted in the document', () {
      final e = engine();
      e.apply(DocumentCommand.importAsset(asset: _asset('asset-1')));
      e.apply(
        const DocumentCommand.createDesignNode(
          artboardId: 'ab-1',
          node: DesignNode(
            id: 'el-1',
            name: 'Referencing',
            type: DesignNodeType.element,
            metadata: {'asset_id': 'asset-1'},
          ),
        ),
      );
      final removed = e.apply(
        const DocumentCommand.removeAsset(assetId: 'asset-1'),
      );
      expect(removed, isA<CommandApplied>());
      // The node's reference remains, now dangling — permitted.
      expect(_node(e).metadata['asset_id'], 'asset-1');
      expect(e.document.assets.byId('asset-1'), isNull);
    });
  });

  group('DQ-S5-1 — usageRefs, documented as frozen behaviour', () {
    test('AssetRecord.usageRefs stays exactly as supplied: no writer '
        'maintains it when a node references the asset (open question '
        'DQ-S5-1 — no maintenance rule asserted)', () {
      final e = engine();
      e.apply(DocumentCommand.importAsset(asset: _asset('asset-1')));
      e.apply(
        const DocumentCommand.createDesignNode(
          artboardId: 'ab-1',
          node: DesignNode(
            id: 'el-1',
            name: 'Referencing',
            type: DesignNodeType.element,
            metadata: {'asset_id': 'asset-1'},
          ),
        ),
      );
      // The manifest record's usageRefs is untouched by the reference.
      expect(e.document.assets.byId('asset-1')!.usageRefs, isEmpty);
    });
  });

  group('persistence — the composition survives the frozen codec', () {
    test('registry and classified referencing node round-trip losslessly '
        'through .febric', () {
      final e = engine();
      e.apply(DocumentCommand.importAsset(asset: _asset('asset-1')));
      e.apply(
        DocumentCommand.createDesignNode(
          artboardId: 'ab-1',
          node: DesignNode(
            id: 'el-1',
            name: 'Imported Boteh',
            type: DesignNodeType.element,
            metadata: {
              'object_type': TextileObjectType.motif.wireName,
              'asset_id': 'asset-1',
            },
          ),
        ),
      );

      const codec = FebricCodec();
      final restored = codec.decode(codec.encode(e.document));
      expect(restored.assets.byId('asset-1'), _asset('asset-1'));
      final node = restored.artboards.single.designTreeRoot.children.single;
      expect(node.metadata['object_type'], 'motif');
      expect(node.metadata['asset_id'], 'asset-1');
    });
  });

  group('boundaries — all five M14 pillars coexist', () {
    test('one element carries object_type + transform + repeat + asset_id '
        'with a mask targeting it — no interference anywhere', () {
      final e = engine();
      const t = Transform2D(translation: Point2D(x: 6, y: 12), scale: 1.25);
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
              'repeat': {'type': RepeatType.halfDrop.wireName},
              'asset_id': 'asset-1',
            },
          ),
        ),
      );
      e.apply(
        const DocumentCommand.applyMask(
          targetId: 'el-1',
          stack: MaskStack(
            targetId: 'el-1',
            entries: [
              MaskStackEntry(
                mask: MaskModel(
                  id: 'mask-1',
                  name: 'Reveal',
                  kind: MaskKind.layerMask,
                ),
              ),
            ],
          ),
        ),
      );

      final node = _node(e);
      expect(node.metadata['object_type'], 'motif');
      expect(
        Transform2D.fromJson(
          node.metadata['transform']! as Map<String, Object?>,
        ),
        t,
      );
      expect((node.metadata['repeat']! as Map)['type'], 'half_drop');
      expect(node.metadata['asset_id'], 'asset-1');
      expect(e.document.masks['el-1'], isNotNull);
      expect(e.document.assets.byId('asset-1'), isNotNull);
    });
  });
}

DesignNode _tree(DocumentEngine e) =>
    e.document.artboards.single.designTreeRoot;

DesignNode _node(DocumentEngine e) => _tree(e).children.single;

/// Minimal registered-asset fixture (test-supplied content; identity +
/// hash only — bytes live outside the document, ADR-0016 decision 2).
AssetRecord _asset(String id) => AssetRecord(
  id: id,
  name: 'Test Motif',
  kind: AssetKind.motif,
  source: AssetSource.imported,
  hash: 'sha256:test-$id',
);
