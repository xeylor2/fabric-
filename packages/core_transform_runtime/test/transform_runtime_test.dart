import 'package:core_geometry/core_geometry.dart';
import 'package:core_transform_runtime/core_transform_runtime.dart';
import 'package:test/test.dart';

void main() {
  group('TransformRuntime — holds the frozen Transform2D (Scope A)', () {
    test('starts at the frozen identity and exposes it downstream', () {
      final r = TransformRuntime();
      expect(r.isIdentity, isTrue);
      expect(r.activeTransform, Transform2D.identity);
    });

    test('honours a seeded starting transform', () {
      const seed = Transform2D(
        translation: Point2D(x: 5, y: 7),
        rotation: 0.5,
        scale: 2,
      );
      final r = TransformRuntime(transform: seed);
      expect(r.activeTransform, seed);
      expect(r.isIdentity, isFalse);
    });
  });

  group('setTransform — accepts an already-created Transform2D verbatim', () {
    test('makes the given transform active and exposes it unchanged', () {
      final r = TransformRuntime();
      const t = Transform2D(
        translation: Point2D(x: 10, y: -4),
        rotation: 1.2,
        scale: 3,
      );
      final result = r.setTransform(t);
      // stored and returned exactly as given — no mapping, no math.
      expect(result, t);
      expect(r.activeTransform, t);
    });

    test('replaces (does not compose) a previously active transform', () {
      final r = TransformRuntime(
        transform: const Transform2D(translation: Point2D(x: 1, y: 1)),
      );
      const next = Transform2D(translation: Point2D(x: 9, y: 9), scale: 2);
      r.setTransform(next);
      // pure replacement — the runtime performs no composition.
      expect(r.activeTransform, next);
    });
  });

  group('reset — returns to the frozen identity', () {
    test('reset restores Transform2D.identity', () {
      final r = TransformRuntime(
        transform: const Transform2D(rotation: 0.8, scale: 4),
      );
      expect(r.isIdentity, isFalse);
      final result = r.reset();
      expect(result, Transform2D.identity);
      expect(r.isIdentity, isTrue);
    });
  });
}
