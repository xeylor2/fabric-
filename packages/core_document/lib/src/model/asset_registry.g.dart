// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_registry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AssetRecord _$AssetRecordFromJson(Map<String, dynamic> json) => _AssetRecord(
  id: json['id'] as String,
  name: json['name'] as String,
  kind: $enumDecode(_$AssetKindEnumMap, json['kind']),
  source: $enumDecode(_$AssetSourceEnumMap, json['source']),
  hash: json['hash'] as String,
  mimeType: json['mimeType'] as String?,
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  usageRefs:
      (json['usageRefs'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  metadata:
      json['metadata'] as Map<String, dynamic>? ?? const <String, Object?>{},
);

Map<String, dynamic> _$AssetRecordToJson(_AssetRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'kind': _$AssetKindEnumMap[instance.kind]!,
      'source': _$AssetSourceEnumMap[instance.source]!,
      'hash': instance.hash,
      'mimeType': instance.mimeType,
      'tags': instance.tags,
      'usageRefs': instance.usageRefs,
      'metadata': instance.metadata,
    };

const _$AssetKindEnumMap = {
  AssetKind.image: 'image',
  AssetKind.motif: 'motif',
  AssetKind.pattern: 'pattern',
  AssetKind.texture: 'texture',
  AssetKind.referencePhoto: 'referencePhoto',
  AssetKind.generated: 'generated',
  AssetKind.imported: 'imported',
  AssetKind.vector: 'vector',
};

const _$AssetSourceEnumMap = {
  AssetSource.imported: 'imported',
  AssetSource.generated: 'generated',
  AssetSource.library: 'library',
  AssetSource.capture: 'capture',
};

_AssetRegistry _$AssetRegistryFromJson(Map<String, dynamic> json) =>
    _AssetRegistry(
      assets:
          (json['assets'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry(k, AssetRecord.fromJson(e as Map<String, dynamic>)),
          ) ??
          const <String, AssetRecord>{},
    );

Map<String, dynamic> _$AssetRegistryToJson(_AssetRegistry instance) =>
    <String, dynamic>{
      'assets': instance.assets.map((k, e) => MapEntry(k, e.toJson())),
    };
