// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ruler_spec.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RulerSpec _$RulerSpecFromJson(Map<String, dynamic> json) => _RulerSpec(
  visible: json['visible'] as bool? ?? false,
  unit: json['unit'] == null
      ? MeasurementUnit.millimetre
      : _unitFromJson(json['unit'] as String),
  origin: json['origin'] == null
      ? Point2D.zero
      : Point2D.fromJson(json['origin'] as Map<String, dynamic>),
  majorInterval: (json['majorInterval'] as num?)?.toDouble() ?? 10.0,
  minorSubdivisions: (json['minorSubdivisions'] as num?)?.toInt() ?? 10,
);

Map<String, dynamic> _$RulerSpecToJson(_RulerSpec instance) =>
    <String, dynamic>{
      'visible': instance.visible,
      'unit': _unitToJson(instance.unit),
      'origin': instance.origin.toJson(),
      'majorInterval': instance.majorInterval,
      'minorSubdivisions': instance.minorSubdivisions,
    };
