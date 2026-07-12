import 'package:core_textile/core_textile.dart';
import 'package:test/test.dart';

DesignNode _sampleTree() {
  return const DesignNode(
    id: 'project-1',
    name: 'Eid Collection 01',
    type: DesignNodeType.project,
    children: [
      DesignNode(
        id: 'artwork-1',
        name: 'Luxury Lawn Suit',
        type: DesignNodeType.artwork,
        children: [
          DesignNode(
            id: 'garment-1',
            name: 'Kurta',
            type: DesignNodeType.garment,
            metadata: {'garment_type': 'kurta'},
            children: [
              DesignNode(
                id: 'part-1',
                name: 'Neck',
                type: DesignNodeType.garmentPart,
                metadata: {'part': 'neck'},
                locked: true,
              ),
              DesignNode(
                id: 'element-1',
                name: 'Paisley Hero',
                type: DesignNodeType.element,
                metadata: {'object_type': 'motif', 'seed': 42},
                selected: true,
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

void main() {
  group('defaults', () {
    test('new nodes are visible, unlocked, unselected, empty', () {
      const node = DesignNode(
        id: 'n1',
        name: 'Motif',
        type: DesignNodeType.element,
      );
      expect(node.visible, isTrue);
      expect(node.locked, isFalse);
      expect(node.selected, isFalse);
      expect(node.children, isEmpty);
      expect(node.metadata, isEmpty);
    });
  });

  group('immutability', () {
    test('copyWith produces a new node and leaves the original untouched', () {
      final tree = _sampleTree();
      final renamed = tree.copyWith(name: 'Renamed');

      expect(renamed.name, 'Renamed');
      expect(tree.name, 'Eid Collection 01');
      expect(identical(tree, renamed), isFalse);
      expect(
        identical(renamed.children.first, tree.children.first),
        isTrue,
        reason: 'unchanged subtrees are shared, not copied',
      );
    });

    test('value equality holds structurally', () {
      expect(_sampleTree(), _sampleTree());
      expect(_sampleTree().hashCode, _sampleTree().hashCode);
      expect(_sampleTree(), isNot(_sampleTree().copyWith(id: 'other')));
    });
  });

  group('json', () {
    test('round-trips a full tree losslessly', () {
      final tree = _sampleTree();
      final restored = DesignNode.fromJson(tree.toJson());
      expect(restored, tree);
    });

    test('serializes type as its stable wire name', () {
      final json = _sampleTree().toJson();
      expect(json['type'], 'project');
    });

    test('rejects unknown node types loudly', () {
      final json = _sampleTree().toJson()..['type'] = 'layer';
      expect(() => DesignNode.fromJson(json), throwsArgumentError);
    });
  });

  group('traversal', () {
    test('descendantsAndSelf walks depth-first', () {
      final ids = _sampleTree().descendantsAndSelf.map((n) => n.id).toList();
      expect(ids, [
        'project-1',
        'artwork-1',
        'garment-1',
        'part-1',
        'element-1',
      ]);
    });

    test('subtreeSize counts every node', () {
      expect(_sampleTree().subtreeSize, 5);
    });

    test('findById locates deep nodes and misses politely', () {
      final tree = _sampleTree();
      expect(tree.findById('element-1')!.name, 'Paisley Hero');
      expect(tree.findById('element-1')!.selected, isTrue);
      expect(tree.findById('part-1')!.locked, isTrue);
      expect(tree.findById('nope'), isNull);
    });
  });
}
