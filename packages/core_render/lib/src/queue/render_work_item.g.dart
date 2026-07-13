// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'render_work_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RenderWorkItem _$RenderWorkItemFromJson(Map<String, dynamic> json) =>
    _RenderWorkItem(
      key: json['key'] as String,
      kind: _kindFromJson(json['kind'] as String),
      priority: json['priority'] == null
          ? WorkerPriority.normal
          : _priorityFromJson(json['priority'] as String),
      tile: json['tile'] == null
          ? null
          : TileCoordinate.fromJson(json['tile'] as Map<String, dynamic>),
      passKind: json['passKind'] as String?,
    );

Map<String, dynamic> _$RenderWorkItemToJson(_RenderWorkItem instance) =>
    <String, dynamic>{
      'key': instance.key,
      'kind': _kindToJson(instance.kind),
      'priority': _priorityToJson(instance.priority),
      'tile': instance.tile?.toJson(),
      'passKind': instance.passKind,
    };
