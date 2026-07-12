// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tool_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ToolStateExtension _$ToolStateExtensionFromJson(Map<String, dynamic> json) =>
    _ToolStateExtension(
      toolId: json['toolId'] as String,
      version: (json['version'] as num?)?.toInt() ?? 1,
      data: json['data'] as Map<String, dynamic>? ?? const <String, Object?>{},
    );

Map<String, dynamic> _$ToolStateExtensionToJson(_ToolStateExtension instance) =>
    <String, dynamic>{
      'toolId': instance.toolId,
      'version': instance.version,
      'data': instance.data,
    };
