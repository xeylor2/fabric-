// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'command_buffer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CommandBuffer _$CommandBufferFromJson(Map<String, dynamic> json) =>
    _CommandBuffer(
      frameId: (json['frameId'] as num).toInt(),
      commands:
          (json['commands'] as List<dynamic>?)
              ?.map((e) => RenderCommand.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <RenderCommand>[],
    );

Map<String, dynamic> _$CommandBufferToJson(_CommandBuffer instance) =>
    <String, dynamic>{
      'frameId': instance.frameId,
      'commands': instance.commands.map((e) => e.toJson()).toList(),
    };
