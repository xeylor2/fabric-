import 'package:core_geometry/core_geometry.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'canvas_models.freezed.dart';
part 'canvas_models.g.dart';

/// The coordinate system of an editing surface: physical-unit-first
/// (Architecture V2) — canvas units bind to real fabric dimensions.
@freezed
abstract class CanvasCoordinateSystem with _$CanvasCoordinateSystem {
  const factory CanvasCoordinateSystem({
    /// The unit canvas coordinates are authored in.
    @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson)
    @Default(MeasurementUnit.millimetre)
    MeasurementUnit unit,

    /// Raster resolution binding physical units to pixels.
    @Default(300.0) double dotsPerInch,
  }) = _CanvasCoordinateSystem;

  factory CanvasCoordinateSystem.fromJson(Map<String, Object?> json) =>
      _$CanvasCoordinateSystemFromJson(json);

  const CanvasCoordinateSystem._();

  /// The OS-wide default (millimetres at 300 DPI — production print).
  static const CanvasCoordinateSystem standard = CanvasCoordinateSystem();

  /// Converts a value in this system's [unit] to another unit.
  double convertTo(double value, MeasurementUnit to) {
    return UnitConverter.convert(
      value,
      from: unit,
      to: to,
      dotsPerInch: dotsPerInch,
    );
  }
}

/// What canvas snapping magnetises to.
@freezed
abstract class SnappingConfig with _$SnappingConfig {
  const factory SnappingConfig({
    @Default(true) bool enabled,

    /// Magnet distance in logical pixels.
    @Default(6.0) double threshold,

    @Default(true) bool snapToGrid,
    @Default(true) bool snapToGuides,
    @Default(true) bool snapToObjects,
  }) = _SnappingConfig;

  factory SnappingConfig.fromJson(Map<String, Object?> json) =>
      _$SnappingConfigFromJson(json);

  const SnappingConfig._();

  /// The OS-wide default snapping behaviour.
  static const SnappingConfig standard = SnappingConfig();
}

/// Orientation of a guide line.
enum GuideOrientation {
  horizontal('horizontal', 'Horizontal'),
  vertical('vertical', 'Vertical');

  const GuideOrientation(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static GuideOrientation fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown GuideOrientation wire name',
      ),
    );
  }
}

/// One guide line on the canvas (canvas units).
@freezed
abstract class GuideModel with _$GuideModel {
  const factory GuideModel({
    required String id,
    required GuideOrientation orientation,

    /// Position along the perpendicular axis, in canvas units.
    required double position,

    @Default(false) bool locked,
  }) = _GuideModel;

  factory GuideModel.fromJson(Map<String, Object?> json) =>
      _$GuideModelFromJson(json);
}

/// The canvas grid (canvas units).
@freezed
abstract class GridSpec with _$GridSpec {
  const factory GridSpec({
    @Default(false) bool visible,

    /// Major grid spacing in canvas units.
    @Default(10.0) double spacing,

    /// Subdivisions per major cell.
    @Default(4) int subdivisions,
  }) = _GridSpec;

  factory GridSpec.fromJson(Map<String, Object?> json) =>
      _$GridSpecFromJson(json);

  const GridSpec._();

  /// The OS-wide default grid.
  static const GridSpec standard = GridSpec();
}

/// One canvas measurement between two points, resolved to physical units.
@freezed
abstract class Measurement with _$Measurement {
  const factory Measurement({
    required Point2D from,
    required Point2D to,
    @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson)
    @Default(MeasurementUnit.millimetre)
    MeasurementUnit unit,
  }) = _Measurement;

  factory Measurement.fromJson(Map<String, Object?> json) =>
      _$MeasurementFromJson(json);

  const Measurement._();

  /// Distance in canvas units.
  double get canvasDistance => from.distanceTo(to);
}

MeasurementUnit _unitFromJson(String wireName) =>
    MeasurementUnit.fromWireName(wireName);

String _unitToJson(MeasurementUnit unit) => unit.wireName;
