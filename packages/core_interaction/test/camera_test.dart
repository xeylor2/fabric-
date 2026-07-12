import 'package:core_interaction/core_interaction.dart';
import 'package:test/test.dart';

void main() {
  const canvas = Size2D(width: 1000, height: 1000);
  const screen = Size2D(width: 800, height: 600);

  group('ViewportAnimation', () {
    const from = ViewportState(canvasSize: canvas, screenSize: screen, zoom: 1);
    final to = from.copyWith(zoom: 4, offset: const Point2D(x: 100, y: 50));

    test('starts at from and ends at to', () {
      final animation = ViewportAnimation(from: from, to: to);
      expect(animation.stateAt(Duration.zero).zoom, closeTo(1, 1e-12));
      expect(
        animation.stateAt(const Duration(milliseconds: 240)).zoom,
        closeTo(4, 1e-12),
      );
      expect(animation.isCompleteAt(const Duration(milliseconds: 240)), isTrue);
    });

    test('zoom interpolates geometrically (constant perceived rate)', () {
      final animation = ViewportAnimation(
        from: from,
        to: to,
        curve: ViewportCurve.linear,
      );
      final mid = animation.stateAt(const Duration(milliseconds: 120));
      expect(mid.zoom, closeTo(2, 1e-9), reason: 'sqrt(1·4) = 2, not 2.5');
      expect(mid.offset.x, closeTo(50, 1e-9), reason: 'offset lerps linearly');
    });

    test('curves respect endpoints and monotonicity', () {
      for (final curve in ViewportCurve.values) {
        expect(curve.transform(0), 0);
        expect(curve.transform(1), closeTo(1, 1e-12));
        var previous = -1.0;
        for (var t = 0.0; t <= 1.0; t += 0.05) {
          final eased = curve.transform(t);
          expect(eased, greaterThanOrEqualTo(previous));
          previous = eased;
        }
      }
    });

    test('zero-duration animation jumps to the target', () {
      final animation = ViewportAnimation(
        from: from,
        to: to,
        duration: Duration.zero,
      );
      expect(animation.stateAt(Duration.zero), to);
    });
  });

  group('InertiaSpec', () {
    const fling = InertiaSpec(
      initialVelocity: Point2D(x: 900, y: -300),
      friction: 4.5,
    );

    test('velocity decays exponentially toward rest', () {
      final v0 = fling.velocityAt(Duration.zero).magnitude;
      final v1 = fling.velocityAt(const Duration(seconds: 1)).magnitude;
      expect(v0, closeTo(fling.initialVelocity.magnitude, 1e-9));
      expect(v1, lessThan(v0 * 0.02));
      expect(fling.isDoneAt(const Duration(seconds: 2)), isTrue);
      expect(fling.isDoneAt(Duration.zero), isFalse);
    });

    test('displacement converges to the terminal delta', () {
      final late = fling.offsetDeltaAt(const Duration(seconds: 10));
      expect(late.x, closeTo(fling.terminalDelta.x, 1e-6));
      expect(late.y, closeTo(fling.terminalDelta.y, 1e-6));
      expect(fling.terminalDelta.x, closeTo(900 / 4.5, 1e-9));
    });

    test('displacement is monotonic in time', () {
      var previous = -1.0;
      for (var ms = 0; ms <= 2000; ms += 100) {
        final d = fling.offsetDeltaAt(Duration(milliseconds: ms)).magnitude;
        expect(d, greaterThanOrEqualTo(previous));
        previous = d;
      }
    });
  });
}
