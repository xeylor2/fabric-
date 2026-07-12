import 'package:freezed_annotation/freezed_annotation.dart';

part 'zoom_constraints.freezed.dart';
part 'zoom_constraints.g.dart';

/// Zoom limits and steps shared by every editing surface.
///
/// Tools may tighten these (a thumbnail preview may cap zoom) but must not
/// bypass them — all zoom mutations clamp through the active constraints.
@freezed
abstract class ZoomConstraints with _$ZoomConstraints {
  const factory ZoomConstraints({
    /// Smallest permitted zoom.
    @Default(0.02) double minZoom,

    /// Largest permitted zoom.
    @Default(64.0) double maxZoom,

    /// Multiplicative step used by Zoom In / Zoom Out and double-tap.
    @Default(1.25) double stepFactor,

    /// Zoom applied by the Default Zoom command.
    @Default(1.0) double defaultZoom,

    /// Fraction of the screen left as breathing room by fit operations.
    @Default(0.08) double fitPadding,
  }) = _ZoomConstraints;

  factory ZoomConstraints.fromJson(Map<String, Object?> json) =>
      _$ZoomConstraintsFromJson(json);

  const ZoomConstraints._();

  /// The universal defaults.
  static const ZoomConstraints standard = ZoomConstraints();

  /// Clamps [zoom] into the permitted range.
  double clampZoom(double zoom) => zoom.clamp(minZoom, maxZoom);
}
