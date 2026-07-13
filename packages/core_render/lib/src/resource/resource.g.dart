// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResourceKey _$ResourceKeyFromJson(Map<String, dynamic> json) => _ResourceKey(
  kind: _kindFromJson(json['kind'] as String),
  key: json['key'] as String,
);

Map<String, dynamic> _$ResourceKeyToJson(_ResourceKey instance) =>
    <String, dynamic>{'kind': _kindToJson(instance.kind), 'key': instance.key};

_ResourceHandle _$ResourceHandleFromJson(Map<String, dynamic> json) =>
    _ResourceHandle(
      resourceKey: ResourceKey.fromJson(
        json['resourceKey'] as Map<String, dynamic>,
      ),
      handleId: json['handleId'] as String,
      refCount: (json['refCount'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$ResourceHandleToJson(_ResourceHandle instance) =>
    <String, dynamic>{
      'resourceKey': instance.resourceKey.toJson(),
      'handleId': instance.handleId,
      'refCount': instance.refCount,
    };
