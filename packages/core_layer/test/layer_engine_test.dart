import 'package:core_layer/core_layer.dart';
import 'package:test/test.dart';

void main() {
  test('LayerKind wire names are frozen — the twelve kinds', () {
    expect(LayerKind.values.map((v) => v.wireName), [
      'layer',
      'group',
      'folder',
      'artboard',
      'reference',
      'image',
      'vector',
      'text',
      'pattern',
      'ai',
      'adjustment',
      'mask',
    ]);
    for (final v in LayerKind.values) {
      expect(LayerKind.fromWireName(v.wireName), v);
    }
    expect(() => LayerKind.fromWireName('smart'), throwsArgumentError);
  });

  test('FebricBlendMode wire names are frozen — the standard sixteen', () {
    expect(FebricBlendMode.values.map((v) => v.wireName), [
      'normal',
      'multiply',
      'screen',
      'overlay',
      'darken',
      'lighten',
      'colour_dodge',
      'colour_burn',
      'hard_light',
      'soft_light',
      'difference',
      'exclusion',
      'hue',
      'saturation',
      'colour',
      'luminosity',
    ]);
  });

  test('container kinds are exactly group, folder, artboard', () {
    expect(LayerKind.values.where((k) => k.isContainer), [
      LayerKind.group,
      LayerKind.folder,
      LayerKind.artboard,
    ]);
  });

  group('LayerModel', () {
    const tree = LayerModel(
      id: 'root',
      name: 'Artboard 1',
      kind: LayerKind.artboard,
      children: [
        LayerModel(
          id: 'g1',
          name: 'Motifs',
          kind: LayerKind.group,
          blendMode: FebricBlendMode.multiply,
          opacity: 0.8,
          pinned: true,
          children: [
            LayerModel(
              id: 'p1',
              name: 'Paisley Field',
              kind: LayerKind.pattern,
              tags: ['hero'],
              maskIds: ['m1'],
              favourite: true,
            ),
            LayerModel(
              id: 'a1',
              name: 'AI Border',
              kind: LayerKind.ai,
              locked: true,
              metadata: {'seed': 7, 'model': 'frozen-by-adr'},
            ),
          ],
        ),
        LayerModel(
          id: 'r1',
          name: 'Client Reference',
          kind: LayerKind.reference,
          hidden: true,
        ),
      ],
    );

    test('defaults are production-sane', () {
      const layer = LayerModel(id: 'x', name: 'X', kind: LayerKind.layer);
      expect(layer.blendMode, FebricBlendMode.normal);
      expect(layer.opacity, 1.0);
      expect(layer.hidden, isFalse);
      expect(layer.locked, isFalse);
      expect(layer.pinned, isFalse);
      expect(layer.favourite, isFalse);
      expect(layer.children, isEmpty);
      expect(layer.maskIds, isEmpty);
      expect(layer.tags, isEmpty);
      expect(layer.metadata, isEmpty);
    });

    test('traversal and lookup', () {
      expect(tree.descendantsAndSelf.map((l) => l.id), [
        'root',
        'g1',
        'p1',
        'a1',
        'r1',
      ]);
      expect(tree.findById('a1')!.locked, isTrue);
      expect(tree.findById('nope'), isNull);
    });

    test('copyWith shares unchanged subtrees', () {
      final renamed = tree.copyWith(name: 'Artboard 2');
      expect(identical(renamed.children.first, tree.children.first), isTrue);
      expect(tree.name, 'Artboard 1');
    });

    test('json round-trips the full hierarchy losslessly', () {
      expect(LayerModel.fromJson(tree.toJson()), tree);
      expect(tree.toJson()['kind'], 'artboard');
    });
  });
}
