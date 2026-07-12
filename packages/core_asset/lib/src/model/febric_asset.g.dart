// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'febric_asset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FebricAsset _$FebricAssetFromJson(Map<String, dynamic> json) => _FebricAsset(
  id: json['id'] as String,
  name: json['name'] as String,
  type: _typeFromJson(json['type'] as String),
  origin: _originFromJson(json['origin'] as String),
  mimeType: json['mimeType'] as String,
  hash: json['hash'] as String,
  width: (json['width'] as num?)?.toInt(),
  height: (json['height'] as num?)?.toInt(),
  dpi: (json['dpi'] as num?)?.toDouble(),
  colourSpace: _colourSpaceFromJson(json['colourSpace'] as String?),
  createdAt: DateTime.parse(json['createdAt'] as String),
  modifiedAt: DateTime.parse(json['modifiedAt'] as String),
  version: (json['version'] as num?)?.toInt() ?? 1,
  versions:
      (json['versions'] as List<dynamic>?)
          ?.map((e) => AssetVersionRecord.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <AssetVersionRecord>[],
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  metadata:
      json['metadata'] as Map<String, dynamic>? ?? const <String, Object?>{},
);

Map<String, dynamic> _$FebricAssetToJson(_FebricAsset instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _typeToJson(instance.type),
      'origin': _originToJson(instance.origin),
      'mimeType': instance.mimeType,
      'hash': instance.hash,
      'width': instance.width,
      'height': instance.height,
      'dpi': instance.dpi,
      'colourSpace': _colourSpaceToJson(instance.colourSpace),
      'createdAt': instance.createdAt.toIso8601String(),
      'modifiedAt': instance.modifiedAt.toIso8601String(),
      'version': instance.version,
      'versions': instance.versions.map((e) => e.toJson()).toList(),
      'tags': instance.tags,
      'metadata': instance.metadata,
    };
