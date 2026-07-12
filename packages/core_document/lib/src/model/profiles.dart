import 'package:core_geometry/core_geometry.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profiles.freezed.dart';
part 'profiles.g.dart';

/// Export target formats (frozen, append-only). Export *implementation*
/// arrives with the Production milestone — only profiles exist in M2.
enum ExportFormat {
  png('png', 'PNG'),
  jpg('jpg', 'JPG'),
  pdf('pdf', 'PDF'),
  tiff('tiff', 'TIFF'),
  svg('svg', 'SVG'),
  psdBridge('psd_bridge', 'PSD Bridge'),
  printPackage('print_package', 'Print Package');

  const ExportFormat(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static ExportFormat fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () =>
          throw ArgumentError.value(name, 'name', 'Unknown ExportFormat'),
    );
  }
}

/// A named export configuration.
@freezed
abstract class ExportProfile with _$ExportProfile {
  const factory ExportProfile({
    required String id,
    required String name,
    required ExportFormat format,
    @Default(300.0) double dpi,
    @Default(1.0) double scale,
    @Default(<String, Object?>{}) Map<String, Object?> options,
  }) = _ExportProfile;

  factory ExportProfile.fromJson(Map<String, Object?> json) =>
      _$ExportProfileFromJson(json);
}

/// A named production configuration (technique constraints, packaging).
@freezed
abstract class ProductionProfile with _$ProductionProfile {
  const factory ProductionProfile({
    required String id,
    required String name,
    String? printTechnique,
    int? maxColours,
    @Default(<String, Object?>{}) Map<String, Object?> options,
  }) = _ProductionProfile;

  factory ProductionProfile.fromJson(Map<String, Object?> json) =>
      _$ProductionProfileFromJson(json);
}

/// A named measurement configuration.
@freezed
abstract class MeasurementProfile with _$MeasurementProfile {
  const factory MeasurementProfile({
    required String id,
    required String name,
    @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson)
    required MeasurementUnit unit,
    @Default(300.0) double dpi,
  }) = _MeasurementProfile;

  factory MeasurementProfile.fromJson(Map<String, Object?> json) =>
      _$MeasurementProfileFromJson(json);
}

/// A named colour management configuration (ICC integration lands with
/// the Production milestone; the reference model is frozen now).
@freezed
abstract class ColourProfile with _$ColourProfile {
  const factory ColourProfile({
    required String id,
    required String name,

    /// Colour space identifier (e.g. `srgb`, `cmyk_fogra39`).
    required String space,

    /// Reference to an ICC profile in the asset store, when present.
    String? iccAssetId,
  }) = _ColourProfile;

  factory ColourProfile.fromJson(Map<String, Object?> json) =>
      _$ColourProfileFromJson(json);
}

/// A named print target (physical output intent).
@freezed
abstract class PrintProfile with _$PrintProfile {
  const factory PrintProfile({
    required String id,
    required String name,
    double? widthMm,
    double? heightMm,
    String? colourProfileId,
    @Default(<String, Object?>{}) Map<String, Object?> options,
  }) = _PrintProfile;

  factory PrintProfile.fromJson(Map<String, Object?> json) =>
      _$PrintProfileFromJson(json);
}

MeasurementUnit _unitFromJson(String wireName) =>
    MeasurementUnit.fromWireName(wireName);

String _unitToJson(MeasurementUnit unit) => unit.wireName;
