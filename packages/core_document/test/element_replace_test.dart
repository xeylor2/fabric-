import 'package:core_document/core_document.dart';
import 'package:core_geometry/core_geometry.dart';
import 'package:core_mask/core_mask.dart';
import 'package:core_textile/core_textile.dart';
import 'package:test/test.dart';

import 'support/fixtures.dart';

/// M14 Slice 6 verification suite — Replace Composition.
///
/// Binds NO new deferred representation. Per the approved Replace
/// amendment, Replace is an architectural COMPOSITION of existing frozen
/// seams — `DesignTreeOps.locate` (parent + index) + `deleteDesignNode` +
/// `createDesignNode` at the same parent/index — CONSUMING the S2
/// transform and S3 repeat representations to satisfy §5's "Replace
/// (preserves transform, repeat spec, z-position)". The composition is
/// caller logic (this suite is the caller); no `replaceDesignNode`
/// command, grouping mechanism, or orchestration layer exists.
///
/// CORRECTED CHECKPOINT (approved at specification): undo is TWO-step —
/// two frozen commands produce two history entries, each with its exact
/// inverse; the second undo restores the original subtree whole AND at
/// its original index (the frozen delete-inverse carries
/// `index: location.index`). Single-step undo would require a grouping
/// mechanism that does not exist (Q7 discovered #1, open) and is not
/// asserted.
///
/// The AI variant (`ai_replace`) rides the frozen I2 staging path, proven
/// in core_ai_staging's own tests — out of this slice's scope (a
/// `core_document → core_ai_staging` edge is barred and backwards).
void main() {
  group('the replace composition — same parent, same index', () {
    test('replacing a z-middle element preserves transform, repeat and '
        'z-position while the classification and identity are new', () {
      final e = engine();
      const t = Transform2D(translation: Point2D(x: 9, y: 3), scale: 0.5);
      _createSiblings(
        e,
        middleMetadata: {
          'object_type': TextileObjectType.motif.wireName,
          'transform': t.toJson(),
          'repeat': {'type': RepeatType.halfDrop.wireName, 'seed': 7},
        },
      );

      final result = _replace(
        e,
        'el-target',
        const DesignNode(
          id: 'el-new',
          name: 'Rose Spray',
          type: DesignNodeType.element,
          metadata: {'object_type': 'pattern'},
        ),
      );
      expect(result, isA<CommandApplied>());

      // z-position preserved: same index, siblings untouched.
      expect(_tree(e).children.map((n) => n.id), ['el-a', 'el-new', 'el-b']);

      final successor = _tree(e).children[1];
      // §5 preserved properties, carried via the S2/S3 payloads verbatim.
      expect(
        Transform2D.fromJson(
          successor.metadata['transform']! as Map<String, Object?>,
        ),
        t,
      );
      expect((successor.metadata['repeat']! as Map)['type'], 'half_drop');
      expect((successor.metadata['repeat']! as Map)['seed'], 7);
      // NOT preserved (by §5's own list): classification is the NEW
      // content's; identity and name are new.
      expect(successor.metadata['object_type'], 'pattern');
      expect(successor.name, 'Rose Spray');
    });

    test('z-position preserved at the boundaries: index 0 and last', () {
      final e = engine();
      _createSiblings(e, middleMetadata: {});

      _replace(
        e,
        'el-a',
        const DesignNode(
          id: 'el-a2',
          name: 'First',
          type: DesignNodeType.element,
        ),
      );
      expect(_tree(e).children.map((n) => n.id), [
        'el-a2',
        'el-target',
        'el-b',
      ]);

      _replace(
        e,
        'el-b',
        const DesignNode(
          id: 'el-b2',
          name: 'Last',
          type: DesignNodeType.element,
        ),
      );
      expect(_tree(e).children.map((n) => n.id), [
        'el-a2',
        'el-target',
        'el-b2',
      ]);
    });

    test('absent payloads carry forward as absence — no keys invented on '
        'the replacement', () {
      final e = engine();
      _createSiblings(e, middleMetadata: {});

      _replace(
        e,
        'el-target',
        const DesignNode(
          id: 'el-new',
          name: 'Bare',
          type: DesignNodeType.element,
        ),
      );
      final successor = _tree(e).children[1];
      expect(successor.metadata.containsKey('transform'), isFalse);
      expect(successor.metadata.containsKey('repeat'), isFalse);
    });
  });

  group('stepwise exact inverses — the corrected checkpoint', () {
    test('undo x2 restores the original element whole, at its original '
        'index, with all metadata; redo x2 replays the replacement', () {
      final e = engine();
      const t = Transform2D(rotation: 1.2);
      _createSiblings(
        e,
        middleMetadata: {
          'object_type': TextileObjectType.border.wireName,
          'transform': t.toJson(),
        },
      );

      _replace(
        e,
        'el-target',
        const DesignNode(
          id: 'el-new',
          name: 'Successor',
          type: DesignNodeType.element,
        ),
      );
      expect(_tree(e).children[1].id, 'el-new');

      // Step 1: undo the create — the replacement disappears.
      expect(e.undo(), isA<CommandApplied>());
      expect(_tree(e).children.map((n) => n.id), ['el-a', 'el-b']);
      // Step 2: undo the delete — the ORIGINAL returns, whole, at index 1
      // (the frozen delete-inverse carries index: location.index).
      expect(e.undo(), isA<CommandApplied>());
      expect(_tree(e).children.map((n) => n.id), ['el-a', 'el-target', 'el-b']);
      final restored = _tree(e).children[1];
      expect(restored.metadata['object_type'], 'border');
      expect(
        Transform2D.fromJson(
          restored.metadata['transform']! as Map<String, Object?>,
        ),
        t,
      );

      // Redo x2 replays the replacement.
      expect(e.redo(), isA<CommandApplied>());
      expect(e.redo(), isA<CommandApplied>());
      expect(_tree(e).children.map((n) => n.id), ['el-a', 'el-new', 'el-b']);
    });
  });

  group('boundaries — deep copy, locks, mask non-cascade', () {
    test('no live-link: the old id is gone from the tree and the '
        'replacement holds no reference to it', () {
      final e = engine();
      _createSiblings(e, middleMetadata: {});
      _replace(
        e,
        'el-target',
        const DesignNode(
          id: 'el-new',
          name: 'Successor',
          type: DesignNodeType.element,
        ),
      );
      expect(_tree(e).findById('el-target'), isNull);
      final successor = _tree(e).children[1];
      expect(successor.metadata.values.contains('el-target'), isFalse);
    });

    test('replacing inside a locked subtree is rejected locked at the '
        'delete step — frozen I4 behaviour, asserted as such', () {
      final e = engine();
      e.apply(
        const DocumentCommand.createDesignNode(
          artboardId: 'ab-1',
          node: DesignNode(
            id: 'grp-locked',
            name: 'Locked Cluster',
            type: DesignNodeType.group,
            locked: true,
            children: [
              DesignNode(
                id: 'el-inside',
                name: 'Protected',
                type: DesignNodeType.element,
              ),
            ],
          ),
        ),
      );
      final result = _replace(
        e,
        'el-inside',
        const DesignNode(
          id: 'el-new',
          name: 'Intruder',
          type: DesignNodeType.element,
        ),
      );
      expect(result, isA<CommandRejected>());
      expect((result as CommandRejected).reason, CommandRejectionReason.locked);
      // The protected element is untouched.
      expect(_tree(e).findById('el-inside'), isNotNull);
    });

    test('a mask stack keyed to the replaced id remains in the flat store '
        'keyed to the now-dead id — frozen non-cascade, documented (open '
        'questions Q6-d#1 / DQ-S4-1; no cascade rule asserted)', () {
      final e = engine();
      _createSiblings(e, middleMetadata: {});
      e.apply(
        const DocumentCommand.applyMask(
          targetId: 'el-target',
          stack: MaskStack(
            targetId: 'el-target',
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
      _replace(
        e,
        'el-target',
        const DesignNode(
          id: 'el-new',
          name: 'Successor',
          type: DesignNodeType.element,
        ),
      );
      // The stack survives, keyed to the dead id; nothing cascades.
      expect(e.document.masks.containsKey('el-target'), isTrue);
      expect(e.document.masks.containsKey('el-new'), isFalse);
      expect(_tree(e).findById('el-target'), isNull);
    });

    test('ai_replace sits on the content-bearing capability rows — matrix '
        'assertion only (the reducer gates only duplicate)', () {
      for (final type in [
        DesignNodeType.zone,
        DesignNodeType.element,
        DesignNodeType.group,
      ]) {
        expect(
          NodeCapabilityMatrix.supports(type, NodeCapability.aiReplace),
          isTrue,
          reason: '${type.wireName} must support ai_replace',
        );
      }
    });
  });

  group('persistence and coexistence after replace', () {
    test('the post-replace document round-trips losslessly through '
        '.febric', () {
      final e = engine();
      const t = Transform2D(scale: 2.0);
      _createSiblings(
        e,
        middleMetadata: {
          'transform': t.toJson(),
          'repeat': {'type': RepeatType.mirror.wireName},
        },
      );
      _replace(
        e,
        'el-target',
        const DesignNode(
          id: 'el-new',
          name: 'Successor',
          type: DesignNodeType.element,
          metadata: {'object_type': 'motif'},
        ),
      );

      const codec = FebricCodec();
      final restored = codec.decode(codec.encode(e.document));
      final successor = restored.artboards.single.designTreeRoot.children[1];
      expect(successor.id, 'el-new');
      expect(
        Transform2D.fromJson(
          successor.metadata['transform']! as Map<String, Object?>,
        ),
        t,
      );
      expect((successor.metadata['repeat']! as Map)['type'], 'mirror');
    });

    test('all five pillars function on the successor node', () {
      final e = engine();
      const t = Transform2D(translation: Point2D(x: 2, y: 4));
      e.apply(DocumentCommand.importAsset(asset: _asset('asset-1')));
      _createSiblings(
        e,
        middleMetadata: {
          'transform': t.toJson(),
          'repeat': {'type': RepeatType.toss.wireName},
        },
      );
      _replace(
        e,
        'el-target',
        const DesignNode(
          id: 'el-new',
          name: 'Successor',
          type: DesignNodeType.element,
          metadata: {'object_type': 'motif'},
        ),
      );
      // Re-reference and re-mask the SUCCESSOR (new id).
      e.apply(
        const DocumentCommand.setNodeMetadata(
          artboardId: 'ab-1',
          nodeId: 'el-new',
          key: 'asset_id',
          value: 'asset-1',
        ),
      );
      e.apply(
        const DocumentCommand.applyMask(
          targetId: 'el-new',
          stack: MaskStack(
            targetId: 'el-new',
            entries: [
              MaskStackEntry(
                mask: MaskModel(
                  id: 'mask-2',
                  name: 'Fresh',
                  kind: MaskKind.vectorMask,
                ),
              ),
            ],
          ),
        ),
      );

      final successor = _tree(e).children[1];
      expect(successor.metadata['object_type'], 'motif');
      expect(
        Transform2D.fromJson(
          successor.metadata['transform']! as Map<String, Object?>,
        ),
        t,
      );
      expect((successor.metadata['repeat']! as Map)['type'], 'toss');
      expect(successor.metadata['asset_id'], 'asset-1');
      expect(e.document.masks['el-new'], isNotNull);
    });
  });
}

DesignNode _tree(DocumentEngine e) =>
    e.document.artboards.single.designTreeRoot;

/// Creates three sibling elements [el-a, el-target, el-b]; the middle one
/// carries [middleMetadata] (the replace target at z-index 1).
void _createSiblings(
  DocumentEngine e, {
  required Map<String, Object?> middleMetadata,
}) {
  e.apply(
    const DocumentCommand.createDesignNode(
      artboardId: 'ab-1',
      node: DesignNode(id: 'el-a', name: 'Alpha', type: DesignNodeType.element),
    ),
  );
  e.apply(
    DocumentCommand.createDesignNode(
      artboardId: 'ab-1',
      node: DesignNode(
        id: 'el-target',
        name: 'Target',
        type: DesignNodeType.element,
        metadata: middleMetadata,
      ),
    ),
  );
  e.apply(
    const DocumentCommand.createDesignNode(
      artboardId: 'ab-1',
      node: DesignNode(id: 'el-b', name: 'Beta', type: DesignNodeType.element),
    ),
  );
}

/// The Slice 6 replace composition — CALLER logic over two frozen
/// commands (the approved amendment's seam row): locate → extract the
/// preserved S2/S3 payloads → delete → create at the same parent/index.
CommandResult _replace(DocumentEngine e, String oldId, DesignNode replacement) {
  final root = _tree(e);
  final old = root.findById(oldId)!;
  final location = DesignTreeOps.locate(root, oldId)!;
  final preserved = <String, Object?>{
    if (old.metadata.containsKey('transform'))
      'transform': old.metadata['transform'],
    if (old.metadata.containsKey('repeat')) 'repeat': old.metadata['repeat'],
  };

  final deleted = e.apply(
    DocumentCommand.deleteDesignNode(artboardId: 'ab-1', nodeId: oldId),
  );
  if (deleted is! CommandApplied) {
    return deleted;
  }
  return e.apply(
    DocumentCommand.createDesignNode(
      artboardId: 'ab-1',
      parentNodeId: location.parentId,
      node: replacement.copyWith(
        metadata: {...replacement.metadata, ...preserved},
      ),
      index: location.index,
    ),
  );
}

/// Minimal registered-asset fixture (identity + hash only).
AssetRecord _asset(String id) => AssetRecord(
  id: id,
  name: 'Test Motif',
  kind: AssetKind.motif,
  source: AssetSource.imported,
  hash: 'sha256:test-$id',
);
