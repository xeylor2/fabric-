import 'package:core_geometry/src/point2d.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transform2d.freezed.dart';
part 'transform2d.g.dart';

/// Immutable 2D similarity transform (translate · rotate · uniform scale) —
/// the transform vocabulary of the Universal Canvas Contract (ADR-0012).
///
/// Application order: scale, then rotation, then translation:
/// `p' = translation + R(rotation) · (p · scale)`.
@freezed
abstract class Transform2D with _$Transform2D {
  const factory Transform2D({
    @Default(Point2D.zero) Point2D translation,
    @Default(0.0) double rotation,
    @Default(1.0) double scale,
  }) = _Transform2D;

  factory Transform2D.fromJson(Map<String, Object?> json) =>
      _$Transform2DFromJson(json);

  const Transform2D._();

  /// The identity transform.
  static const Transform2D identity = Transform2D();

  /// Whether this transform maps every point to itself.
  bool get isIdentity =>
      translation == Point2D.zero && rotation == 0 && scale == 1;

  /// Applies this transform to [point].
  Point2D apply(Point2D point) =>
      translation + (point * scale).rotated(rotation);

  /// Applies the inverse of this transform ([scale] must be non-zero).
  Point2D unapply(Point2D point) =>
      ((point - translation).rotated(-rotation)) * (1 / scale);
}
