import 'package:core_common/core_common.dart';
import 'package:core_document/core_document.dart';
import 'package:core_lock/core_lock.dart';
import 'package:core_textile/core_textile.dart';
import 'package:test/test.dart';
import 'support/fixtures.dart';

/// A canonical kurta design tree (Architecture V2 §4):
///
/// ```
/// artwork
/// └── kurta (garment)
///     ├── sleeve[left]  → border → boteh element (@hero-motif)
///     ├── sleeve[right] → border
///     └── body          → field (@hero-motif)
/// ```
DesignNode kurtaTree() {
  return const DesignNode(
    id: 'ab-1-tree',
    name: 'Artwork',
    type: DesignNodeType.artwork,
    children: [
      DesignNode(
        id: 'g-kurta',
        name: 'Kurta',
        type: DesignNodeType.garment,
        metadata: {'garment_type': 'kurta'},
        children: [
          DesignNode(
            id: 'p-sleeve-l',
            name: 'Sleeve',
            type: DesignNodeType.garmentPart,
            metadata: {'part': 'sleeve', 'instance': 'left'},
            children: [
              DesignNode(
                id: 'z-border-l',
                name: 'Border',
                type: DesignNodeType.zone,
                metadata: {'part': 'border'},
                children: [
                  DesignNode(
                    id: 'e-boteh',
                    name: 'Boteh',
                    type: DesignNodeType.element,
                    metadata: {'role': 'hero-motif'},
                  ),
                ],
              ),
            ],
          ),
          DesignNode(
            id: 'p-sleeve-r',
            name: 'Sleeve',
            type: DesignNodeType.garmentPart,
            metadata: {'part': 'sleeve', 'instance': 'right'},
            children: [
              DesignNode(
                id: 'z-border-r',
                name: 'Border',
                type: DesignNodeType.zone,
                metadata: {'part': 'border'},
              ),
            ],
          ),
          DesignNode(
            id: 'p-body',
            name: 'Body',
            type: DesignNodeType.garmentPart,
            metadata: {'part': 'body'},
            children: [
              DesignNode(
                id: 'z-field',
                name: 'Field',
                type: DesignNodeType.zone,
                metadata: {'part': 'field', 'role': 'hero-motif'},
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

DocumentEngine treeEngine() {
  return engine(
    document: documentWithArtboard().copyWith(
      artboards: [artboard().copyWith(designTreeRoot: kurtaTree())],
    ),
  );
}

DesignNode rootOf(DocumentEngine e) =>
    e.document.artboards.single.designTreeRoot;

void main() {
  group('design tree commands ride the M2 bus unchanged', () {
    test('createDesignNode inserts, records history, and undoes exactly', () {
      final e = treeEngine();
      final original = rootOf(e);
      final result = e.apply(
        const DocumentCommand.createDesignNode(
          artboardId: 'ab-1',
          parentNodeId: 'p-body',
          node: DesignNode(
            id: 'z-hem',
            name: 'Hem',
            type: DesignNodeType.zone,
            metadata: {'part': 'hem'},
          ),
          index: 0,
        ),
        author: 'designer-1',
      );

      expect(result, isA<CommandApplied>());
      expect(rootOf(e).findById('z-hem'), isNotNull);
      expect(rootOf(e).findById('p-body')!.children.first.id, 'z-hem');
      final entry = e.document.history.entries.single;
      expect(entry.inverse, isA<DeleteDesignNodeCommand>());
      expect(entry.affectedIds, containsAll(['z-hem', 'p-body']));

      e.undo();
      expect(rootOf(e), original, reason: 'inverse restores the exact tree');
    });

    test('duplicate node ids are rejected at creation', () {
      final e = treeEngine();
      final result = e.apply(
        const DocumentCommand.createDesignNode(
          artboardId: 'ab-1',
          parentNodeId: 'p-body',
          node: DesignNode(
            id: 'z-border-l',
            name: 'Clash',
            type: DesignNodeType.zone,
          ),
        ),
      );
      expect((result as CommandRejected).reason, CommandRejectionReason.invalid);
    });

    test('deleteDesignNode removes the subtree; undo restores children', () {
      final e = treeEngine();
      final original = rootOf(e);
      e.apply(
        const DocumentCommand.deleteDesignNode(
          artboardId: 'ab-1',
          nodeId: 'p-sleeve-l',
        ),
      );
      expect(rootOf(e).findById('p-sleeve-l'), isNull);
      expect(rootOf(e).findById('e-boteh'), isNull, reason: 'subtree gone');

      e.undo();
      expect(rootOf(e), original);
      expect(
        rootOf(e).findById('g-kurta')!.children.first.id,
        'p-sleeve-l',
        reason: 'restored at its original index',
      );
    });

    test('the design tree root is not deletable', () {
      final e = treeEngine();
      final result = e.apply(
        const DocumentCommand.deleteDesignNode(
          artboardId: 'ab-1',
          nodeId: 'ab-1-tree',
        ),
      );
      expect((result as CommandRejected).reason, CommandRejectionReason.invalid);
    });

    test('moveDesignNode relocates with an exact inverse', () {
      final e = treeEngine();
      final original = rootOf(e);
      e.apply(
        const DocumentCommand.moveDesignNode(
          artboardId: 'ab-1',
          nodeId: 'z-border-l',
          newParentId: 'p-body',
          index: 0,
        ),
      );
      expect(rootOf(e).findById('p-body')!.children.first.id, 'z-border-l');
      expect(rootOf(e).findById('p-sleeve-l')!.children, isEmpty);

      e.undo();
      expect(rootOf(e), original);
    });

    test('a node cannot move into its own subtree', () {
      final e = treeEngine();
      final result = e.apply(
        const DocumentCommand.moveDesignNode(
          artboardId: 'ab-1',
          nodeId: 'g-kurta',
          newParentId: 'z-field',
          index: 0,
        ),
      );
      expect((result as CommandRejected).reason, CommandRejectionReason.invalid);
    });

    test('rename and metadata commands invert to previous values', () {
      final e = treeEngine();
      e.apply(
        const DocumentCommand.renameDesignNode(
          artboardId: 'ab-1',
          nodeId: 'g-kurta',
          name: 'Kurta Panel A',
        ),
      );
      e.apply(
        const DocumentCommand.setNodeMetadata(
          artboardId: 'ab-1',
          nodeId: 'z-field',
          key: 'repeat',
          value: {'type': 'half_drop'},
        ),
      );
      expect(rootOf(e).findById('g-kurta')!.name, 'Kurta Panel A');
      expect(rootOf(e).findById('z-field')!.metadata['repeat'], {
        'type': 'half_drop',
      });

      e.undo();
      e.undo();
      expect(rootOf(e).findById('g-kurta')!.name, 'Kurta');
      expect(
        rootOf(e).findById('z-field')!.metadata.containsKey('repeat'),
        isFalse,
      );
    });

    test('empty names are refused', () {
      final e = treeEngine();
      final result = e.apply(
        const DocumentCommand.renameDesignNode(
          artboardId: 'ab-1',
          nodeId: 'g-kurta',
          name: '   ',
        ),
      );
      expect((result as CommandRejected).reason, CommandRejectionReason.invalid);
    });

    test('duplicateDesignNode inserts the clone after its source', () {
      final e = treeEngine();
      final ids = SequentialIdGenerator(prefix: 'dup-');
      final clone = DesignTreeOps.cloneWithIds(
        rootOf(e).findById('p-sleeve-r')!,
        ids,
      );

      e.apply(
        DocumentCommand.duplicateDesignNode(
          artboardId: 'ab-1',
          sourceNodeId: 'p-sleeve-r',
          duplicate: clone,
        ),
      );
      final kurta = rootOf(e).findById('g-kurta')!;
      expect(kurta.children.length, 4);
      expect(kurta.children[2].id, clone.id, reason: 'next sibling of source');
      expect(clone.name, 'Sleeve');
      expect(
        clone.descendantsAndSelf.map((n) => n.id),
        everyElement(startsWith('dup-')),
        reason: 'every clone id is fresh',
      );

      e.undo();
      expect(rootOf(e).findById('g-kurta')!.children.length, 3);
    });

    test('a duplicate carrying existing ids is refused', () {
      final e = treeEngine();
      final result = e.apply(
        DocumentCommand.duplicateDesignNode(
          artboardId: 'ab-1',
          sourceNodeId: 'p-sleeve-r',
          duplicate: rootOf(e).findById('p-sleeve-r')!,
        ),
      );
      expect((result as CommandRejected).reason, CommandRejectionReason.invalid);
    });
  });

  group('node locks (invariant I4 at tree level)', () {
    test('a locked node rejects mutation; unlock is the only way out', () {
      final e = treeEngine();
      e.apply(
        const DocumentCommand.setNodeLocked(
          artboardId: 'ab-1',
          nodeId: 'p-sleeve-l',
          locked: true,
        ),
      );

      final rename = e.apply(
        const DocumentCommand.renameDesignNode(
          artboardId: 'ab-1',
          nodeId: 'p-sleeve-l',
          name: 'X',
        ),
      );
      expect((rename as CommandRejected).reason, CommandRejectionReason.locked);

      final childEdit = e.apply(
        const DocumentCommand.setNodeMetadata(
          artboardId: 'ab-1',
          nodeId: 'z-border-l',
          key: 'colour',
          value: '#8C2B4A',
        ),
      );
      expect(
        (childEdit as CommandRejected).reason,
        CommandRejectionReason.locked,
        reason: 'locks cover the whole subtree',
      );

      expect(
        e.apply(
          const DocumentCommand.setNodeLocked(
            artboardId: 'ab-1',
            nodeId: 'p-sleeve-l',
            locked: false,
          ),
        ),
        isA<CommandApplied>(),
        reason: 'unlocking a locked node is always permitted',
      );
      expect(
        e.apply(
          const DocumentCommand.renameDesignNode(
            artboardId: 'ab-1',
            nodeId: 'p-sleeve-l',
            name: 'Sleeve L',
          ),
        ),
        isA<CommandApplied>(),
      );
    });

    test('setNodeLocked is undoable like any other command', () {
      final e = treeEngine();
      e.apply(
        const DocumentCommand.setNodeLocked(
          artboardId: 'ab-1',
          nodeId: 'z-field',
          locked: true,
        ),
      );
      expect(rootOf(e).findById('z-field')!.locked, isTrue);
      e.undo();
      expect(rootOf(e).findById('z-field')!.locked, isFalse);
    });

    test('Lock Engine object locks gate tree commands (frozen rule 5)', () {
      final e = treeEngine();
      e.apply(
        const DocumentCommand.setLock(
          lock: LockState(
            scope: LockScope.object,
            targetId: 'g-kurta',
            origin: LockOrigin.review,
          ),
        ),
      );
      final result = e.apply(
        const DocumentCommand.renameDesignNode(
          artboardId: 'ab-1',
          nodeId: 'g-kurta',
          name: 'X',
        ),
      );
      expect((result as CommandRejected).reason, CommandRejectionReason.locked);
    });
  });

  group('capability matrix enforcement (Architecture V2 §4.2)', () {
    test('project and artwork nodes cannot be hidden', () {
      final e = treeEngine();
      final result = e.apply(
        const DocumentCommand.setNodeVisibility(
          artboardId: 'ab-1',
          nodeId: 'ab-1-tree',
          visible: false,
        ),
      );
      expect((result as CommandRejected).reason, CommandRejectionReason.invalid);
    });

    test('zones hide and reappear with exact inverses', () {
      final e = treeEngine();
      e.apply(
        const DocumentCommand.setNodeVisibility(
          artboardId: 'ab-1',
          nodeId: 'z-border-l',
          visible: false,
        ),
      );
      expect(rootOf(e).findById('z-border-l')!.visible, isFalse);
      e.undo();
      expect(rootOf(e).findById('z-border-l')!.visible, isTrue);
    });
  });

  group('semantic addressing (Architecture V2 §4.3)', () {
    test('canonical paths from the blueprint resolve on the kurta tree', () {
      final root = kurtaTree();
      expect(
        SemanticPath.parse(
          'artwork.kurta.sleeve[left].border',
        ).resolve(root).map((n) => n.id),
        ['z-border-l'],
      );
      expect(
        SemanticPath.parse(
          'artwork.kurta.sleeve.border',
        ).resolve(root).map((n) => n.id),
        ['z-border-l', 'z-border-r'],
        reason: 'unqualified sleeve matches both instances in document order',
      );
      expect(
        SemanticPath.parse(
          'artwork.kurta.*.border',
        ).resolve(root).map((n) => n.id),
        ['z-border-l', 'z-border-r'],
      );
      expect(
        SemanticPath.parse(
          'artwork.kurta.body.field@hero-motif',
        ).resolve(root).map((n) => n.id),
        ['z-field'],
      );
      expect(
        SemanticPath.parse('artwork.kurta.sleeve[right].border')
            .resolve(root)
            .single
            .id,
        'z-border-r',
      );
      expect(
        SemanticPath.parse('artwork.dupatta').resolve(root),
        isEmpty,
        reason: 'absent garments resolve to nothing, never mis-match',
      );
    });

    test('matching covers name slugs and node type wire names', () {
      final root = kurtaTree();
      expect(
        SemanticPath.parse('artwork.kurta.body.zone').resolve(root).single.id,
        'z-field',
        reason: 'type wire name matches',
      );
      expect(
        SemanticPath.parse(
          'artwork.kurta.sleeve[left].border.boteh',
        ).resolve(root).single.id,
        'e-boteh',
        reason: 'name slug matches',
      );
    });

    test('invalid syntax fails loudly with FormatException', () {
      expect(() => SemanticPath.parse(''), throwsFormatException);
      expect(() => SemanticPath.parse('artwork..kurta'), throwsFormatException);
      expect(
        () => SemanticPath.parse('artwork.kurta.sleeve['),
        throwsFormatException,
      );
      expect(() => SemanticPath.parse('artwork.kurta@'), throwsFormatException);
    });

    test('paths round-trip through toString and compare by value', () {
      const text = 'artwork.kurta.sleeve[left].border';
      final path = SemanticPath.parse(text);
      expect(path.toString(), text);
      expect(SemanticPath.parse(text), path);
    });
  });
}
