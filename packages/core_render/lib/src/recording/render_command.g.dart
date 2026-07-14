// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'render_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RenderCommand _$RenderCommandFromJson(Map<String, dynamic> json) =>
    _RenderCommand(
      kind: _kindFromJson(json['kind'] as String),
      objectId: json['objectId'] as String?,
      resourceKey: json['resourceKey'] as String?,
      blend: json['blend'] as String?,
      opacity: (json['opacity'] as num?)?.toDouble(),
      passKind: json['passKind'] as String?,
      targetKind: json['targetKind'] as String?,
      frameId: (json['frameId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RenderCommandToJson(_RenderCommand instance) =>
    <String, dynamic>{
      'kind': _kindToJson(instance.kind),
      'objectId': instance.objectId,
      'resourceKey': instance.resourceKey,
      'blend': instance.blend,
      'opacity': instance.opacity,
      'passKind': instance.passKind,
      'targetKind': instance.targetKind,
      'frameId': instance.frameId,
    };

_RenderStateSnapshot _$RenderStateSnapshotFromJson(Map<String, dynamic> json) =>
    _RenderStateSnapshot(
      blend: json['blend'] as String? ?? 'normal',
      opacity: (json['opacity'] as num?)?.toDouble() ?? 1.0,
    );

Map<String, dynamic> _$RenderStateSnapshotToJson(
  _RenderStateSnapshot instance,
) => <String, dynamic>{'blend': instance.blend, 'opacity': instance.opacity};
