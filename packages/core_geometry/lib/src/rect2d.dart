import 'package:core_geometry/src/point2d.dart';
import 'package:core_geometry/src/size2d.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rect2d.freezed.dart';
part 'rect2d.g.dart';

/// Immutable axis-aligned rectangle in logical units.
@freezed
abstract class Rect2D with _$Rect2D {
  const factory Rect2D({
    required double left,
    required double top,
    required double width,
    required double height,
  }) = _Rect2D;

  factory Rect2D.fromJson(Map<String, Object?> json) => _$Rect2DFromJson(json);

  const Rect2D._();

  /// Rectangle spanning [size] from the origin.
  factory Rect2D.fromSize(Size2D size) =>
      Rect2D(left: 0, top: 0, width: size.width, height: size.height);

  /// Smallest axis-aligned rectangle containing every point in [points].
  /// [points] must not be empty.
  factory Rect2D.boundingPoints(Iterable<Point2D> points) {
    assert(points.isNotEmpty, 'boundingPoints requires at least one point');
    var minX = points.first.x;
    var maxX = points.first.x;
    var minY = points.first.y;
    var maxY = points.first.y;
    for (final p in points) {
      if (p.x < minX) {
        minX = p.x;
      }
      if (p.x > maxX) {
        maxX = p.x;
      }
      if (p.y < minY) {
        minY = p.y;
      }
      if (p.y > maxY) {
        maxY = p.y;
      }
    }
    return Rect2D(
      left: minX,
      top: minY,
      width: maxX - minX,
      height: maxY - minY,
    );
  }

  double get right => left + width;
  double get bottom => top + height;

  Point2D get center => Point2D(x: left + width / 2, y: top + height / 2);

  Size2D get size => Size2D(width: width, height: height);

  /// Whether [point] lies inside (inclusive of edges).
  bool containsPoint(Point2D point) {
    return point.x >= left &&
        point.x <= right &&
        point.y >= top &&
        point.y <= bottom;
  }

  /// Whether this rectangle overlaps [other].
  bool intersects(Rect2D other) {
    return left < other.right &&
        other.left < right &&
        top < other.bottom &&
        other.top < bottom;
  }
}
