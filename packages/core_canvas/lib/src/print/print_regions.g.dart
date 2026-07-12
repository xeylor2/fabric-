// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'print_regions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CanvasInsets _$CanvasInsetsFromJson(Map<String, dynamic> json) =>
    _CanvasInsets(
      left: (json['left'] as num?)?.toDouble() ?? 0.0,
      top: (json['top'] as num?)?.toDouble() ?? 0.0,
      right: (json['right'] as num?)?.toDouble() ?? 0.0,
      bottom: (json['bottom'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$CanvasInsetsToJson(_CanvasInsets instance) =>
    <String, dynamic>{
      'left': instance.left,
      'top': instance.top,
      'right': instance.right,
      'bottom': instance.bottom,
    };

_PrintRegionSpec _$PrintRegionSpecFromJson(Map<String, dynamic> json) =>
    _PrintRegionSpec(
      safeArea: json['safeArea'] == null
          ? CanvasInsets.zero
          : CanvasInsets.fromJson(json['safeArea'] as Map<String, dynamic>),
      bleed: json['bleed'] == null
          ? CanvasInsets.zero
          : CanvasInsets.fromJson(json['bleed'] as Map<String, dynamic>),
      printMargin: json['printMargin'] == null
          ? CanvasInsets.zero
          : CanvasInsets.fromJson(json['printMargin'] as Map<String, dynamic>),
      unit: json['unit'] == null
          ? MeasurementUnit.millimetre
          : _unitFromJson(json['unit'] as String),
    );

Map<String, dynamic> _$PrintRegionSpecToJson(_PrintRegionSpec instance) =>
    <String, dynamic>{
      'safeArea': instance.safeArea.toJson(),
      'bleed': instance.bleed.toJson(),
      'printMargin': instance.printMargin.toJson(),
      'unit': _unitToJson(instance.unit),
    };
