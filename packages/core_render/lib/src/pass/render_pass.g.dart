// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'render_pass.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RenderPass _$RenderPassFromJson(Map<String, dynamic> json) => _RenderPass(
  kind: _kindFromJson(json['kind'] as String),
  slot: (json['slot'] as num?)?.toInt() ?? 0,
  objectFilter: json['objectFilter'] == null
      ? const <RenderObjectKind>[]
      : _filterFromJson(json['objectFilter'] as List),
  enabled: json['enabled'] as bool? ?? true,
);

Map<String, dynamic> _$RenderPassToJson(_RenderPass instance) =>
    <String, dynamic>{
      'kind': _kindToJson(instance.kind),
      'slot': instance.slot,
      'objectFilter': _filterToJson(instance.objectFilter),
      'enabled': instance.enabled,
    };
