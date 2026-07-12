import 'package:core_geometry/core_geometry.dart';
import 'package:core_mask/core_mask.dart';
import 'package:test/test.dart';

void main() {
  test('MaskKind wire names are frozen — the six kinds', () {
    expect(MaskKind.values.map((v) => v.wireName), [
      'layer_mask',
      'vector_mask',
      'brush_mask',
      'ai_mask',
      'clip_mask',
      'alpha_mask',
    ]);
    for (final v in MaskKind.values) {
      expect(MaskKind.fromWireName(v.wireName), v);
    }
  });

  test('boolean ops and refinement kinds are frozen', () {
    expect(MaskBooleanOp.values.map((v) => v.wireName), [
      'union',
      'intersect',
      'subtract',
      'invert',
    ]);
    expect(MaskRefinementKind.values.map((v) => v.wireName), [
      'feather',
      'expand',
      'shrink',
      'grow',
    ]);
    expect(() => MaskBooleanOp.fromWireName('xor'), throwsArgumentError);
  });

  group('MaskModel and MaskStack', () {
    const mask = MaskModel(
      id: 'm1',
      name: 'Neck cutout',
      kind: MaskKind.vectorMask,
      inverted: true,
      density: 0.9,
      refinements: [
        MaskRefinement(kind: MaskRefinementKind.feather, amount: 2.5),
        MaskRefinement(kind: MaskRefinementKind.expand, amount: 1),
      ],
      bounds: Rect2D(left: 10, top: 10, width: 200, height: 120),
      metadata: {'source': 'segmentation'},
    );

    test('defaults: enabled, not inverted, full density', () {
      const plain = MaskModel(id: 'm', name: 'M', kind: MaskKind.brushMask);
      expect(plain.enabled, isTrue);
      expect(plain.inverted, isFalse);
      expect(plain.density, 1.0);
      expect(plain.refinements, isEmpty);
      expect(plain.bounds, isNull);
    });

    test('stack composes immutably in order', () {
      const stack = MaskStack(targetId: 'layer-1');
      final built = stack
          .withEntry(const MaskStackEntry(mask: mask))
          .withEntry(
            const MaskStackEntry(
              mask: MaskModel(id: 'm2', name: 'Trim', kind: MaskKind.aiMask),
              op: MaskBooleanOp.subtract,
            ),
          );
      expect(stack.isEmpty, isTrue, reason: 'original untouched');
      expect(built.entries.length, 2);
      expect(built.entries.first.op, MaskBooleanOp.union);
      expect(built.entries.last.op, MaskBooleanOp.subtract);
    });

    test('json round trip incl. geometry and refinements', () {
      final stack = const MaskStack(
        targetId: 'layer-1',
      ).withEntry(const MaskStackEntry(mask: mask));
      expect(MaskStack.fromJson(stack.toJson()), stack);
      expect(MaskModel.fromJson(mask.toJson()), mask);
    });
  });
}
