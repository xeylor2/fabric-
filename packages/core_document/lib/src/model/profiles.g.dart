// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profiles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExportProfile _$ExportProfileFromJson(Map<String, dynamic> json) =>
    _ExportProfile(
      id: json['id'] as String,
      name: json['name'] as String,
      format: $enumDecode(_$ExportFormatEnumMap, json['format']),
      dpi: (json['dpi'] as num?)?.toDouble() ?? 300.0,
      scale: (json['scale'] as num?)?.toDouble() ?? 1.0,
      options:
          json['options'] as Map<String, dynamic>? ?? const <String, Object?>{},
    );

Map<String, dynamic> _$ExportProfileToJson(_ExportProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'format': _$ExportFormatEnumMap[instance.format]!,
      'dpi': instance.dpi,
      'scale': instance.scale,
      'options': instance.options,
    };

const _$ExportFormatEnumMap = {
  ExportFormat.png: 'png',
  ExportFormat.jpg: 'jpg',
  ExportFormat.pdf: 'pdf',
  ExportFormat.tiff: 'tiff',
  ExportFormat.svg: 'svg',
  ExportFormat.psdBridge: 'psdBridge',
  ExportFormat.printPackage: 'printPackage',
};

_ProductionProfile _$ProductionProfileFromJson(Map<String, dynamic> json) =>
    _ProductionProfile(
      id: json['id'] as String,
      name: json['name'] as String,
      printTechnique: json['printTechnique'] as String?,
      maxColours: (json['maxColours'] as num?)?.toInt(),
      options:
          json['options'] as Map<String, dynamic>? ?? const <String, Object?>{},
    );

Map<String, dynamic> _$ProductionProfileToJson(_ProductionProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'printTechnique': instance.printTechnique,
      'maxColours': instance.maxColours,
      'options': instance.options,
    };

_MeasurementProfile _$MeasurementProfileFromJson(Map<String, dynamic> json) =>
    _MeasurementProfile(
      id: json['id'] as String,
      name: json['name'] as String,
      unit: _unitFromJson(json['unit'] as String),
      dpi: (json['dpi'] as num?)?.toDouble() ?? 300.0,
    );

Map<String, dynamic> _$MeasurementProfileToJson(_MeasurementProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'unit': _unitToJson(instance.unit),
      'dpi': instance.dpi,
    };

_ColourProfile _$ColourProfileFromJson(Map<String, dynamic> json) =>
    _ColourProfile(
      id: json['id'] as String,
      name: json['name'] as String,
      space: json['space'] as String,
      iccAssetId: json['iccAssetId'] as String?,
    );

Map<String, dynamic> _$ColourProfileToJson(_ColourProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'space': instance.space,
      'iccAssetId': instance.iccAssetId,
    };

_PrintProfile _$PrintProfileFromJson(Map<String, dynamic> json) =>
    _PrintProfile(
      id: json['id'] as String,
      name: json['name'] as String,
      widthMm: (json['widthMm'] as num?)?.toDouble(),
      heightMm: (json['heightMm'] as num?)?.toDouble(),
      colourProfileId: json['colourProfileId'] as String?,
      options:
          json['options'] as Map<String, dynamic>? ?? const <String, Object?>{},
    );

Map<String, dynamic> _$PrintProfileToJson(_PrintProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'widthMm': instance.widthMm,
      'heightMm': instance.heightMm,
      'colourProfileId': instance.colourProfileId,
      'options': instance.options,
    };
