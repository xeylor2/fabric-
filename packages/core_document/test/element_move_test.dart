import 'package:core_document/core_document.dart';
import 'package:core_geometry/core_geometry.dart';
import 'package:core_textile/core_textile.dart';
import 'package:test/test.dart';

import 'support/fixtures.dart';

/// M18 Slices S2 and S3 verification — movement / positioning and
/// sibling-list structural reorder, observed at document state only.
/// S2 covers the positive, discrimination, determinism and inverse
/// obligations; the `S3 —` groups add the negative/bypass obligations that
/// remain observable through the existing surfaces.
///
/// The two frozen M18-D3 determinations reach document state through two
/// distinct already-existing write surfaces, and this suite proves them
/// apart rather than together:
///
/// - movement / positioning → the `transform` metadata entry written via
///   `setNodeMetadata` (a `Transform2D` per node);
/// - sibling-list structural ordering → `moveDesignNode`
///   (`newParentId` + `index`).
///
/// Every assertion reads document state before and after a command
/// submitted through `DocumentEngine.apply` — the single lawful write
/// surface (M18-D5-R1) — in keeping with observation-only verification
/// (M18-D4). The suite imports no render package and makes no claim
/// relating sibling-list order to render or paint order (M18-D3 rule,
/// M18-D4 evidence firewall).
///
/// Mechanics already proven elsewhere are not re-proven: transform binding,
/// exact transform inversion and codec persistence live in
/// `element_transform_test.dart`; relocation with an exact inverse and
/// subtree-lock rejection live in `design_tree_test.dart`. What this suite
/// adds is the M18-D4 obligation set those suites do not carry — semantic
/// discrimination between the two axes, determinism, and the scoped
/// negative obligation.
const Transform2D _t1 = Transform2D(
  translation: Point2D(x: 10, y: 20),
  rotation: 0.25,
  scale: 2,
);
const Transform2D _t2 = Transform2D(translation: Point2D(x: 30, y: 40));

/// Two sibling groups so that both a same-parent reorder and a
/// parent-changing move are observable in one tree.
///
/// ```
/// artwork
/// ├── z-a  → e-1 (transform _t1), e-2 (transform _t2), e-3 (no transform)
/// └── z-b  → e-4
/// ```
DesignNode _twoZoneTree() {
  return DesignNode(
    id: 'ab-1-tree',
    name: 'Artwork',
    type: DesignNodeType.artwork,
    children: [
      DesignNode(
        id: 'z-a',
        name: 'Zone A',
        type: DesignNodeType.zone,
        children: [
          DesignNode(
            id: 'e-1',
            name: 'Boteh',
            type: DesignNodeType.element,
            metadata: {'transform': _t1.toJson()},
          ),
          DesignNode(
            id: 'e-2',
            name: 'Border Band',
            type: DesignNodeType.element,
            metadata: {'transform': _t2.toJson()},
          ),
          const DesignNode(
            id: 'e-3',
            name: 'Filler',
            type: DesignNodeType.element,
          ),
        ],
      ),
      const DesignNode(
        id: 'z-b',
        name: 'Zone B',
        type: DesignNodeType.zone,
        children: [
          DesignNode(
            id: 'e-4',
            name: 'Hem Motif',
            type: DesignNodeType.element,
          ),
        ],
      ),
    ],
  );
}

DocumentEngine _moveEngine() {
  return engine(
    document: documentWithArtboard().copyWith(
      artboards: [artboard().copyWith(designTreeRoot: _twoZoneTree())],
    ),
  );
}

DesignNode _root(DocumentEngine e) =>
    e.document.artboards.single.designTreeRoot;

List<String> _childIds(DocumentEngine e, String parentId) =>
    _root(e).findById(parentId)!.children.map((n) => n.id).toList();

Transform2D? _transformOf(DocumentEngine e, String nodeId) {
  final raw = _root(e).findById(nodeId)!.metadata['transform'];
  return raw == null ? null : Transform2D.fromJson(raw as Map<String, Object?>);
}

void main() {
  group('movement / positioning — the transform representation', () {
    test('a positioning write changes the transform and leaves the sibling '
        'list and parent untouched', () {
      final e = _moveEngine();
      final before = _childIds(e, 'z-a');
      const moved = Transform2D(translation: Point2D(x: 99, y: 1), scale: 3);

      expect(
        e.apply(
          DocumentCommand.setNodeMetadata(
            artboardId: 'ab-1',
            nodeId: 'e-1',
            key: 'transform',
            value: moved.toJson(),
          ),
        ),
        isA<CommandApplied>(),
      );

      expect(_transformOf(e, 'e-1'), moved);
      expect(
        _childIds(e, 'z-a'),
        before,
        reason:
            'positioning is not a structural change (M18-D4 semantic '
            'discrimination)',
      );
      expect(_childIds(e, 'z-b'), ['e-4']);
    });

    test('a positioning write is deterministic — identical state and command '
        'yield identical document state', () {
      final a = _moveEngine();
      final b = _moveEngine();
      const t = Transform2D(translation: Point2D(x: 7, y: 8), rotation: 1.5);
      final cmd = DocumentCommand.setNodeMetadata(
        artboardId: 'ab-1',
        nodeId: 'e-2',
        key: 'transform',
        value: t.toJson(),
      );

      expect(a.apply(cmd), isA<CommandApplied>());
      expect(b.apply(cmd), isA<CommandApplied>());
      expect(_root(a), _root(b));
    });
  });

  group('sibling-list structural reorder', () {
    test('a same-parent reorder changes sibling order and leaves every '
        'transform untouched', () {
      final e = _moveEngine();
      expect(_childIds(e, 'z-a'), ['e-1', 'e-2', 'e-3']);

      expect(
        e.apply(
          const DocumentCommand.moveDesignNode(
            artboardId: 'ab-1',
            nodeId: 'e-3',
            newParentId: 'z-a',
            index: 0,
          ),
        ),
        isA<CommandApplied>(),
      );

      expect(_childIds(e, 'z-a'), ['e-3', 'e-1', 'e-2']);
      expect(_transformOf(e, 'e-1'), _t1);
      expect(_transformOf(e, 'e-2'), _t2);
      expect(
        _transformOf(e, 'e-3'),
        isNull,
        reason:
            'a structural reorder writes no transform — absence stays '
            'absence (M18-D4 semantic discrimination)',
      );
    });

    test('a same-parent reorder inverts exactly', () {
      final e = _moveEngine();
      final original = _root(e);

      e.apply(
        const DocumentCommand.moveDesignNode(
          artboardId: 'ab-1',
          nodeId: 'e-1',
          newParentId: 'z-a',
          index: 2,
        ),
      );
      expect(_childIds(e, 'z-a'), ['e-2', 'e-3', 'e-1']);

      expect(e.undo(), isA<CommandApplied>());
      expect(_root(e), original);
    });

    test('a reorder is deterministic — identical state and command yield '
        'identical document state', () {
      final a = _moveEngine();
      final b = _moveEngine();
      const cmd = DocumentCommand.moveDesignNode(
        artboardId: 'ab-1',
        nodeId: 'e-2',
        newParentId: 'z-a',
        index: 0,
      );

      expect(a.apply(cmd), isA<CommandApplied>());
      expect(b.apply(cmd), isA<CommandApplied>());
      expect(_root(a), _root(b));
    });
  });

  group('parent-changing movement — already-established coverage', () {
    test('a cross-parent move lands under the new parent at the requested '
        'index and vacates the old one', () {
      final e = _moveEngine();

      expect(
        e.apply(
          const DocumentCommand.moveDesignNode(
            artboardId: 'ab-1',
            nodeId: 'e-1',
            newParentId: 'z-b',
            index: 0,
          ),
        ),
        isA<CommandApplied>(),
      );

      expect(_childIds(e, 'z-b'), ['e-1', 'e-4']);
      expect(_childIds(e, 'z-a'), ['e-2', 'e-3']);
    });

    test('a cross-parent move carries the node transform unchanged', () {
      final e = _moveEngine();
      e.apply(
        const DocumentCommand.moveDesignNode(
          artboardId: 'ab-1',
          nodeId: 'e-1',
          newParentId: 'z-b',
          index: 1,
        ),
      );

      expect(_childIds(e, 'z-b'), ['e-4', 'e-1']);
      expect(
        _transformOf(e, 'e-1'),
        _t1,
        reason: 'a structural move writes no transform',
      );
    });

    test('a cross-parent move inverts exactly to the prior tree', () {
      final e = _moveEngine();
      final original = _root(e);

      e.apply(
        const DocumentCommand.moveDesignNode(
          artboardId: 'ab-1',
          nodeId: 'e-2',
          newParentId: 'z-b',
          index: 0,
        ),
      );
      expect(_childIds(e, 'z-b'), ['e-2', 'e-4']);
      expect(_childIds(e, 'z-a'), ['e-1', 'e-3']);

      expect(e.undo(), isA<CommandApplied>());
      expect(_root(e), original);
    });
  });

  group('M18-D4 negative obligations — scoped to what is observable', () {
    // These prove that no document-state change appears without a
    // bus-accepted command on the paths exercised here. They do NOT prove
    // that no other write surface exists anywhere: that exclusivity rests
    // on the approved record granting no second surface, which is an
    // absence of grant rather than an observed property, and it is not
    // asserted here (M18-D4 unobservable implies unproven).
    test('a rejected move is not a partial write — document state and history '
        'are untouched', () {
      final e = _moveEngine();
      final original = _root(e);
      final historyBefore = e.document.history.entries.length;

      final result = e.apply(
        const DocumentCommand.moveDesignNode(
          artboardId: 'ab-1',
          nodeId: 'e-1',
          newParentId: 'no-such-parent',
          index: 0,
        ),
      );

      expect(result, isA<CommandRejected>());
      expect(_root(e), original);
      expect(e.document.history.entries.length, historyBefore);
    });

    test('a locked subtree rejects a move and leaves document state '
        'unchanged', () {
      final e = _moveEngine();
      expect(
        e.apply(
          const DocumentCommand.setNodeLocked(
            artboardId: 'ab-1',
            nodeId: 'z-a',
            locked: true,
          ),
        ),
        isA<CommandApplied>(),
      );
      final locked = _root(e);

      final result = e.apply(
        const DocumentCommand.moveDesignNode(
          artboardId: 'ab-1',
          nodeId: 'e-1',
          newParentId: 'z-b',
          index: 0,
        ),
      );

      expect((result as CommandRejected).reason, CommandRejectionReason.locked);
      expect(
        _root(e),
        locked,
        reason:
            'lock enforcement is observed as an outcome only — no claim '
            'is made here about where the check is placed',
      );
    });

    test('a positioning write into a locked subtree is rejected and leaves '
        'the transform unchanged', () {
      final e = _moveEngine();
      e.apply(
        const DocumentCommand.setNodeLocked(
          artboardId: 'ab-1',
          nodeId: 'z-a',
          locked: true,
        ),
      );

      final result = e.apply(
        DocumentCommand.setNodeMetadata(
          artboardId: 'ab-1',
          nodeId: 'e-1',
          key: 'transform',
          value: const Transform2D(scale: 9).toJson(),
        ),
      );

      expect((result as CommandRejected).reason, CommandRejectionReason.locked);
      expect(_transformOf(e, 'e-1'), _t1);
    });
  });

  group('S3 — rejected submissions are inert', () {
    test('a move into its own subtree leaves both source and destination '
        'untouched', () {
      final e = _moveEngine();
      final original = _root(e);

      final result = e.apply(
        const DocumentCommand.moveDesignNode(
          artboardId: 'ab-1',
          nodeId: 'z-a',
          newParentId: 'e-1',
          index: 0,
        ),
      );

      expect(result, isA<CommandRejected>());
      expect(
        _root(e),
        original,
        reason:
            'neither the source nor the destination parent may be '
            'partially mutated by a rejected structural command',
      );
    });

    test('an out-of-range index is rejected and leaves the sibling list '
        'untouched', () {
      final e = _moveEngine();
      final original = _root(e);

      final result = e.apply(
        const DocumentCommand.moveDesignNode(
          artboardId: 'ab-1',
          nodeId: 'e-1',
          newParentId: 'z-a',
          index: 99,
        ),
      );

      expect(result, isA<CommandRejected>());
      expect(_root(e), original);
    });

    test('a rejected submission advances no revision, no history and no '
        'dirty flag', () {
      final e = _moveEngine();
      final revisionBefore = e.document.revision.value;
      expect(e.isDirty, isFalse);
      expect(e.canUndo, isFalse);

      final result = e.apply(
        const DocumentCommand.moveDesignNode(
          artboardId: 'ab-1',
          nodeId: 'e-1',
          newParentId: 'no-such-parent',
          index: 0,
        ),
      );

      expect(result, isA<CommandRejected>());
      expect(e.document.revision.value, revisionBefore);
      expect(e.document.history.entries, isEmpty);
      expect(e.isDirty, isFalse);
      expect(e.canUndo, isFalse);
    });

    test('a rejected submission does not consume a pending redo', () {
      final e = _moveEngine();
      e.apply(
        const DocumentCommand.moveDesignNode(
          artboardId: 'ab-1',
          nodeId: 'e-1',
          newParentId: 'z-b',
          index: 0,
        ),
      );
      final moved = _root(e);
      expect(e.undo(), isA<CommandApplied>());
      expect(e.canRedo, isTrue);

      final rejected = e.apply(
        const DocumentCommand.moveDesignNode(
          artboardId: 'ab-1',
          nodeId: 'e-1',
          newParentId: 'no-such-parent',
          index: 0,
        ),
      );
      expect(rejected, isA<CommandRejected>());

      expect(
        e.canRedo,
        isTrue,
        reason:
            'a rejected submission is not a new history entry and must '
            'not truncate the redo path',
      );
      expect(e.redo(), isA<CommandApplied>());
      expect(_root(e), moved);
    });

    test('a move into a locked destination is rejected and leaves document '
        'state unchanged', () {
      final e = _moveEngine();
      e.apply(
        const DocumentCommand.setNodeLocked(
          artboardId: 'ab-1',
          nodeId: 'z-b',
          locked: true,
        ),
      );
      final locked = _root(e);

      final result = e.apply(
        const DocumentCommand.moveDesignNode(
          artboardId: 'ab-1',
          nodeId: 'e-1',
          newParentId: 'z-b',
          index: 0,
        ),
      );

      expect((result as CommandRejected).reason, CommandRejectionReason.locked);
      expect(
        _root(e),
        locked,
        reason:
            'the destination subtree lock is enforced as an outcome; no '
            'claim is made here about where the check is placed',
      );
    });
  });

  group('S3 — the two axes invert independently', () {
    test('a positioning write and a structural move undo in exact reverse '
        'order and redo back', () {
      final e = _moveEngine();
      final original = _root(e);
      const repositioned = Transform2D(
        translation: Point2D(x: 4, y: 5),
        scale: 1.25,
      );

      expect(
        e.apply(
          DocumentCommand.setNodeMetadata(
            artboardId: 'ab-1',
            nodeId: 'e-1',
            key: 'transform',
            value: repositioned.toJson(),
          ),
        ),
        isA<CommandApplied>(),
      );
      final afterPositioning = _root(e);

      expect(
        e.apply(
          const DocumentCommand.moveDesignNode(
            artboardId: 'ab-1',
            nodeId: 'e-1',
            newParentId: 'z-b',
            index: 0,
          ),
        ),
        isA<CommandApplied>(),
      );
      final afterMove = _root(e);
      expect(_childIds(e, 'z-b'), ['e-1', 'e-4']);
      expect(_transformOf(e, 'e-1'), repositioned);

      expect(e.undo(), isA<CommandApplied>());
      expect(
        _root(e),
        afterPositioning,
        reason:
            'undoing the structural move restores membership without '
            'disturbing the positioning write',
      );

      expect(e.undo(), isA<CommandApplied>());
      expect(_root(e), original);

      expect(e.redo(), isA<CommandApplied>());
      expect(_root(e), afterPositioning);
      expect(e.redo(), isA<CommandApplied>());
      expect(_root(e), afterMove);
    });
  });
}
