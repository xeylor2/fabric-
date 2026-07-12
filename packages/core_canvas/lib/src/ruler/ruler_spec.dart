import 'package:core_geometry/core_geometry.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ruler_spec.freezed.dart';
part 'ruler_spec.g.dart';

/// The canvas ruler description (M5A — new; grid/guides already frozen in
/// `core_tooling`). Physical-unit-first: the ruler reads in a
/// [MeasurementUnit], bound to fabric dimensions.
///
/// Describes the ruler as data only; no rendering in M5A.
@freezed
abstract class RulerSpec with _$RulerSpec {
  const factory RulerSpec({
    @Default(false) bool visible,

    /// The unit the ruler is graduated in.
    @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson)
    @Default(MeasurementUnit.millimetre)
    MeasurementUnit unit,

    /// The document-space point the ruler's zero mark sits at.
    @Default(Point2D.zero) Point2D origin,

    /// Distance between labelled (major) ticks, in [unit].
    @Default(10.0) double majorInterval,

    /// Minor ticks per major interval.
    @Default(10) int minorSubdivisions,
  }) = _RulerSpec;

  factory RulerSpec.fromJson(Map<String, Object?> json) =>
      _$RulerSpecFromJson(json);

  const RulerSpec._();

  /// The OS-wide default ruler (hidden, millimetres).
  static const RulerSpec standard = RulerSpec();
}

MeasurementUnit _unitFromJson(String wireName) =>
    MeasurementUnit.fromWireName(wireName);

String _unitToJson(MeasurementUnit unit) => unit.wireName;
