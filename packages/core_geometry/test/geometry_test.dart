import 'dart:math' as math;

import 'package:core_geometry/core_geometry.dart';
import 'package:test/test.dart';

void main() {
  group('Point2D', () {
    test('vector arithmetic', () {
      const a = Point2D(x: 3, y: 4);
      const b = Point2D(x: 1, y: -2);
      expect(a + b, const Point2D(x: 4, y: 2));
      expect(a - b, const Point2D(x: 2, y: 6));
      expect(a * 2, const Point2D(x: 6, y: 8));
      expect(a / 2, const Point2D(x: 1.5, y: 2));
      expect(a.magnitude, 5);
    });

    test('rotation is counterclockwise and invertible', () {
      const p = Point2D(x: 1, y: 0);
      final quarter = p.rotated(math.pi / 2);
      expect(quarter.x, closeTo(0, 1e-12));
      expect(quarter.y, closeTo(1, 1e-12));

      final roundTrip = p.rotated(0.7).rotated(-0.7);
      expect(roundTrip.x, closeTo(p.x, 1e-12));
      expect(roundTrip.y, closeTo(p.y, 1e-12));
    });

    test('json round trip', () {
      const p = Point2D(x: 12.5, y: -3.25);
      expect(Point2D.fromJson(p.toJson()), p);
    });
  });

  group('Size2D', () {
    test('emptiness and center', () {
      expect(Size2D.zero.isEmpty, isTrue);
      expect(const Size2D(width: -1, height: 5).isEmpty, isTrue);
      const s = Size2D(width: 100, height: 60);
      expect(s.isEmpty, isFalse);
      expect(s.center, const Point2D(x: 50, y: 30));
    });
  });

  group('Rect2D', () {
    const rect = Rect2D(left: 10, top: 20, width: 30, height: 40);

    test('derived edges and center', () {
      expect(rect.right, 40);
      expect(rect.bottom, 60);
      expect(rect.center, const Point2D(x: 25, y: 40));
      expect(rect.size, const Size2D(width: 30, height: 40));
    });

    test('containsPoint includes edges', () {
      expect(rect.containsPoint(const Point2D(x: 10, y: 20)), isTrue);
      expect(rect.containsPoint(const Point2D(x: 40, y: 60)), isTrue);
      expect(rect.containsPoint(const Point2D(x: 9.99, y: 30)), isFalse);
    });

    test('intersects detects overlap and rejects separation', () {
      const overlapping = Rect2D(left: 35, top: 55, width: 20, height: 20);
      const separate = Rect2D(left: 41, top: 20, width: 5, height: 5);
      expect(rect.intersects(overlapping), isTrue);
      expect(rect.intersects(separate), isFalse);
    });

    test('boundingPoints builds the AABB', () {
      final box = Rect2D.boundingPoints(const [
        Point2D(x: 5, y: 9),
        Point2D(x: -2, y: 3),
        Point2D(x: 7, y: -1),
      ]);
      expect(box, const Rect2D(left: -2, top: -1, width: 9, height: 10));
    });

    test('json round trip', () {
      expect(Rect2D.fromJson(rect.toJson()), rect);
    });
  });
}
