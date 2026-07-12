// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'canvas_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CanvasCoordinateSystem _$CanvasCoordinateSystemFromJson(
  Map<String, dynamic> json,
) => _CanvasCoordinateSystem(
  unit: json['unit'] == null
      ? MeasurementUnit.millimetre
      : _unitFromJson(json['unit'] as String),
  dotsPerInch: (json['dotsPerInch'] as num?)?.toDouble() ?? 300.0,
);

Map<String, dynamic> _$CanvasCoordinateSystemToJson(
  _CanvasCoordinateSystem instance,
) => <String, dynamic>{
  'unit': _unitToJson(instance.unit),
  'dotsPerInch': instance.dotsPerInch,
};

_SnappingConfig _$SnappingConfigFromJson(Map<String, dynamic> json) =>
    _SnappingConfig(
      enabled: json['enabled'] as bool? ?? true,
      threshold: (json['threshold'] as num?)?.toDouble() ?? 6.0,
      snapToGrid: json['snapToGrid'] as bool? ?? true,
      snapToGuides: json['snapToGuides'] as bool? ?? true,
      snapToObjects: json['snapToObjects'] as bool? ?? true,
    );

Map<String, dynamic> _$SnappingConfigToJson(_SnappingConfig instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'threshold': instance.threshold,
      'snapToGrid': instance.snapToGrid,
      'snapToGuides': instance.snapToGuides,
      'snapToObjects': instance.snapToObjects,
    };

_GuideModel _$GuideModelFromJson(Map<String, dynamic> json) => _GuideModel(
  id: json['id'] as String,
  orientation: $enumDecode(_$GuideOrientationEnumMap, json['orientation']),
  position: (json['position'] as num).toDouble(),
  locked: json['locked'] as bool? ?? false,
);

Map<String, dynamic> _$GuideModelToJson(_GuideModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orientation': _$GuideOrientationEnumMap[instance.orientation]!,
      'position': instance.position,
      'locked': instance.locked,
    };

const _$GuideOrientationEnumMap = {
  GuideOrientation.horizontal: 'horizontal',
  GuideOrientation.vertical: 'vertical',
};

_GridSpec _$GridSpecFromJson(Map<String, dynamic> json) => _GridSpec(
  visible: json['visible'] as bool? ?? false,
  spacing: (json['spacing'] as num?)?.toDouble() ?? 10.0,
  subdivisions: (json['subdivisions'] as num?)?.toInt() ?? 4,
);

Map<String, dynamic> _$GridSpecToJson(_GridSpec instance) => <String, dynamic>{
  'visible': instance.visible,
  'spacing': instance.spacing,
  'subdivisions': instance.subdivisions,
};

_Measurement _$MeasurementFromJson(Map<String, dynamic> json) => _Measurement(
  from: Point2D.fromJson(json['from'] as Map<String, dynamic>),
  to: Point2D.fromJson(json['to'] as Map<String, dynamic>),
  unit: json['unit'] == null
      ? MeasurementUnit.millimetre
      : _unitFromJson(json['unit'] as String),
);

Map<String, dynamic> _$MeasurementToJson(_Measurement instance) =>
    <String, dynamic>{
      'from': instance.from.toJson(),
      'to': instance.to.toJson(),
      'unit': _unitToJson(instance.unit),
    };
