// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rendered_frame.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RenderedFrame _$RenderedFrameFromJson(Map<String, dynamic> json) =>
    _RenderedFrame(
      frameId: (json['frameId'] as num).toInt(),
      platform: _platformFromJson(json['platform'] as String),
      target: _targetFromJson(json['target'] as String),
      commandsExecuted: (json['commandsExecuted'] as num?)?.toInt() ?? 0,
      drawCount: (json['drawCount'] as num?)?.toInt() ?? 0,
      bindCount: (json['bindCount'] as num?)?.toInt() ?? 0,
      stateChanges: (json['stateChanges'] as num?)?.toInt() ?? 0,
      composited: json['composited'] as bool? ?? false,
      presented: json['presented'] as bool? ?? false,
      commandOrder:
          (json['commandOrder'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
    );

Map<String, dynamic> _$RenderedFrameToJson(_RenderedFrame instance) =>
    <String, dynamic>{
      'frameId': instance.frameId,
      'platform': _platformToJson(instance.platform),
      'target': _targetToJson(instance.target),
      'commandsExecuted': instance.commandsExecuted,
      'drawCount': instance.drawCount,
      'bindCount': instance.bindCount,
      'stateChanges': instance.stateChanges,
      'composited': instance.composited,
      'presented': instance.presented,
      'commandOrder': instance.commandOrder,
    };
