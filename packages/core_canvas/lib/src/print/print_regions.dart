import 'package:core_geometry/core_geometry.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'print_regions.freezed.dart';
part 'print_regions.g.dart';

/// The print-domain region kinds a canvas visualises for production framing
/// (M5A — new; production-critical and previously absent). Wire names frozen.
enum PrintRegionKind {
  /// The area guaranteed to survive trimming — keep critical content inside.
  safeArea('safe_area', 'Safe Area'),

  /// Ink extending beyond the trim so trimming leaves no white edge.
  bleed('bleed', 'Bleed'),

  /// Reserved non-print margin (seam/registration allowance).
  printMargin('print_margin', 'Print Margin');

  const PrintRegionKind(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static PrintRegionKind fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown PrintRegionKind wire name',
      ),
    );
  }
}

/// Symmetric-capable edge insets in canvas units (all four edges).
@freezed
abstract class CanvasInsets with _$CanvasInsets {
  const factory CanvasInsets({
    @Default(0.0) double left,
    @Default(0.0) double top,
    @Default(0.0) double right,
    @Default(0.0) double bottom,
  }) = _CanvasInsets;

  factory CanvasInsets.fromJson(Map<String, Object?> json) =>
      _$CanvasInsetsFromJson(json);

  const CanvasInsets._();

  /// Zero insets.
  static const CanvasInsets zero = CanvasInsets();

  /// Uniform insets of [value] on every edge.
  factory CanvasInsets.uniform(double value) =>
      CanvasInsets(left: value, top: value, right: value, bottom: value);

  /// Whether every edge is zero.
  bool get isZero => left == 0 && top == 0 && right == 0 && bottom == 0;

  /// These insets converted from unit [from] to unit [to], delegating to the
  /// frozen `core_geometry.UnitConverter` (no conversion logic is redefined
  /// here). [dotsPerInch] is required whenever pixels are involved and is
  /// sourced from the surface's `CanvasCoordinateSystem.dotsPerInch`.
  CanvasInsets convert({
    required MeasurementUnit from,
    required MeasurementUnit to,
    double dotsPerInch = 300,
  }) {
    double c(double v) =>
        UnitConverter.convert(v, from: from, to: to, dotsPerInch: dotsPerInch);
    return CanvasInsets(
      left: c(left),
      top: c(top),
      right: c(right),
      bottom: c(bottom),
    );
  }
}

/// The frozen print-region description: safe area, bleed and print margin as
/// insets in a single [unit]. Data only — no rendering.
///
/// **Physical-unit strategy (frozen):** insets are authored in [unit] (one of
/// pixel / millimetre / centimetre / inch; millimetres by default,
/// physical-unit-first per Architecture V2). Convert to any unit with
/// [insetsIn] / [CanvasInsets.convert], which delegate to the frozen
/// `core_geometry.UnitConverter`. Pixel conversions require the surface DPI,
/// which lives in `CanvasCoordinateSystem.dotsPerInch` (the single source of
/// truth for DPI — this spec deliberately does not store its own).
///
/// **Precision strategy (frozen):** the authored value in the authored [unit]
/// is the immutable source of truth and is never overwritten by a converted
/// value — conversions are computed on demand and returned, so no stored or
/// accumulated precision loss ever occurs (*lossless at rest*). Each
/// conversion routes through millimetres exactly once (single pivot — no
/// compounding), identity conversions (`from == to`) are returned exactly, and
/// commensurable magnitudes (25.4 mm = 1 in = 300 px @ 300 DPI) are exact.
/// Values not exactly representable in the target unit carry only the inherent
/// IEEE-754 `double` representation error, which is never amplified.
@freezed
abstract class PrintRegionSpec with _$PrintRegionSpec {
  const factory PrintRegionSpec({
    @Default(CanvasInsets.zero) CanvasInsets safeArea,
    @Default(CanvasInsets.zero) CanvasInsets bleed,
    @Default(CanvasInsets.zero) CanvasInsets printMargin,
    @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson)
    @Default(MeasurementUnit.millimetre)
    MeasurementUnit unit,
  }) = _PrintRegionSpec;

  factory PrintRegionSpec.fromJson(Map<String, Object?> json) =>
      _$PrintRegionSpecFromJson(json);

  const PrintRegionSpec._();

  /// The OS-wide default (all zero, millimetres).
  static const PrintRegionSpec standard = PrintRegionSpec();

  /// Returns the insets for a given [kind], in the authored [unit].
  CanvasInsets insetsOf(PrintRegionKind kind) => switch (kind) {
    PrintRegionKind.safeArea => safeArea,
    PrintRegionKind.bleed => bleed,
    PrintRegionKind.printMargin => printMargin,
  };

  /// The insets for [kind] expressed in [target] units. Converts from the
  /// authored [unit] via the frozen `UnitConverter`; [dotsPerInch] (from the
  /// surface's `CanvasCoordinateSystem`) is required when pixels are involved.
  CanvasInsets insetsIn(
    PrintRegionKind kind,
    MeasurementUnit target, {
    double dotsPerInch = 300,
  }) =>
      insetsOf(kind).convert(from: unit, to: target, dotsPerInch: dotsPerInch);
}

MeasurementUnit _unitFromJson(String wireName) =>
    MeasurementUnit.fromWireName(wireName);

String _unitToJson(MeasurementUnit unit) => unit.wireName;
