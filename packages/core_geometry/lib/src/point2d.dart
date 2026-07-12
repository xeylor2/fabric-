import 'dart:math' as math;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'point2d.freezed.dart';
part 'point2d.g.dart';

/// Immutable 2D point / vector in logical units.
///
/// FEBRIC's interaction foundation is pure Dart, so it carries its own
/// geometry primitives (serializable, isolate- and backend-safe) instead of
/// `dart:ui` types. Shell layers convert at the boundary.
@freezed
abstract class Point2D with _$Point2D {
  const factory Point2D({required double x, required double y}) = _Point2D;

  factory Point2D.fromJson(Map<String, Object?> json) =>
      _$Point2DFromJson(json);

  const Point2D._();

  /// The origin.
  static const Point2D zero = Point2D(x: 0, y: 0);

  Point2D operator +(Point2D other) => Point2D(x: x + other.x, y: y + other.y);

  Point2D operator -(Point2D other) => Point2D(x: x - other.x, y: y - other.y);

  /// Uniform scale.
  Point2D operator *(double factor) => Point2D(x: x * factor, y: y * factor);

  /// Uniform inverse scale.
  Point2D operator /(double divisor) => Point2D(x: x / divisor, y: y / divisor);

  /// Euclidean length of this vector.
  double get magnitude => math.sqrt(x * x + y * y);

  /// Distance to [other].
  double distanceTo(Point2D other) => (this - other).magnitude;

  /// Rotates this vector counter-clockwise by [radians] around the origin.
  Point2D rotated(double radians) {
    final cos = math.cos(radians);
    final sin = math.sin(radians);
    return Point2D(x: x * cos - y * sin, y: x * sin + y * cos);
  }
}
