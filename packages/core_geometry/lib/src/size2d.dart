import 'package:core_geometry/src/point2d.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'size2d.freezed.dart';
part 'size2d.g.dart';

/// Immutable 2D extent in logical units.
@freezed
abstract class Size2D with _$Size2D {
  const factory Size2D({required double width, required double height}) =
      _Size2D;

  factory Size2D.fromJson(Map<String, Object?> json) => _$Size2DFromJson(json);

  const Size2D._();

  /// A size with no extent.
  static const Size2D zero = Size2D(width: 0, height: 0);

  /// Whether either dimension is non-positive.
  bool get isEmpty => width <= 0 || height <= 0;

  /// Geometric center measured from the size's own origin.
  Point2D get center => Point2D(x: width / 2, y: height / 2);

  /// Width divided by height.
  double get aspectRatio => height == 0 ? 0 : width / height;
}
