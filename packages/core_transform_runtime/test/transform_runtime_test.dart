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

  group('in-flight move — the ephemeral host (B-2, motif movement only)', () {
    const base = Transform2D(
      translation: Point2D(x: 20, y: 30),
      rotation: 0.4,
      scale: 1.5,
    );

    test('no move is in flight until one begins', () {
      final r = TransformRuntime();
      expect(r.isMoving, isFalse);
      // A delta with no move in flight composes nothing.
      expect(r.moveBy(const Point2D(x: 5, y: 5)), Transform2D.identity);
      expect(r.isIdentity, isTrue);
    });

    test(
      'beginMove anchors on the target transform and starts equal to it',
      () {
        final r = TransformRuntime();
        expect(r.beginMove(base), base);
        expect(r.isMoving, isTrue);
        expect(r.activeTransform, base);
      },
    );

    test('moveBy translates only — rotation and scale pass through', () {
      final r = TransformRuntime()..beginMove(base);
      final moved = r.moveBy(const Point2D(x: 12, y: -7));
      expect(moved.translation, const Point2D(x: 32, y: 23));
      expect(moved.rotation, base.rotation, reason: 'rotation untouched');
      expect(moved.scale, base.scale, reason: 'scale untouched');
      expect(r.activeTransform, moved);
    });

    test('composition is from the anchor, so it never accumulates', () {
      final r = TransformRuntime()..beginMove(base);
      r.moveBy(const Point2D(x: 10, y: 0));
      r.moveBy(const Point2D(x: 10, y: 0));
      final settled = r.moveBy(const Point2D(x: 10, y: 0));
      // Three updates carrying the same TOTAL delta land in one place.
      expect(settled.translation, const Point2D(x: 30, y: 30));
    });

    test('identical gestures yield identical transforms', () {
      final a = TransformRuntime()..beginMove(base);
      final b = TransformRuntime()..beginMove(base);
      const delta = Point2D(x: 3.5, y: -1.25);
      expect(a.moveBy(delta), b.moveBy(delta));
    });

    test(
      'endMove returns the settled transform and clears the in-flight one',
      () {
        final r = TransformRuntime()..beginMove(base);
        r.moveBy(const Point2D(x: 4, y: 4));
        final settled = r.endMove();
        expect(settled.translation, const Point2D(x: 24, y: 34));
        expect(r.isMoving, isFalse);
        expect(r.activeTransform, Transform2D.identity);
      },
    );

    test('cancelMove discards the in-flight transform', () {
      final r = TransformRuntime()..beginMove(base);
      r.moveBy(const Point2D(x: 99, y: 99));
      expect(r.cancelMove(), Transform2D.identity);
      expect(r.isMoving, isFalse);
      expect(r.activeTransform, Transform2D.identity);
    });

    test('a move that receives no delta settles as the untouched base', () {
      final r = TransformRuntime()..beginMove(base);
      expect(r.endMove(), base);
    });
  });
}
