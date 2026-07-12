// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Artboard _$ArtboardFromJson(Map<String, dynamic> json) => _Artboard(
  id: json['id'] as String,
  name: json['name'] as String,
  size: Size2D.fromJson(json['size'] as Map<String, dynamic>),
  unit: json['unit'] == null
      ? MeasurementUnit.millimetre
      : _unitFromJson(json['unit'] as String),
  dpi: (json['dpi'] as num?)?.toDouble() ?? 300.0,
  backgroundColourHex: json['backgroundColourHex'] as String?,
  layerRoot: LayerModel.fromJson(json['layerRoot'] as Map<String, dynamic>),
  designTreeRoot: DesignNode.fromJson(
    json['designTreeRoot'] as Map<String, dynamic>,
  ),
  viewport: json['viewport'] == null
      ? null
      : ViewportState.fromJson(json['viewport'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ArtboardToJson(_Artboard instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'size': instance.size.toJson(),
  'unit': _unitToJson(instance.unit),
  'dpi': instance.dpi,
  'backgroundColourHex': instance.backgroundColourHex,
  'layerRoot': instance.layerRoot.toJson(),
  'designTreeRoot': instance.designTreeRoot.toJson(),
  'viewport': instance.viewport?.toJson(),
};
