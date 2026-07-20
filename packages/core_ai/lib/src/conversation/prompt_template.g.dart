// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prompt_template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PromptTemplate _$PromptTemplateFromJson(Map<String, dynamic> json) =>
    _PromptTemplate(
      id: json['id'] as String,
      segments:
          (json['segments'] as List<dynamic>?)
              ?.map((e) => PromptSegment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <PromptSegment>[],
      metadata:
          json['metadata'] as Map<String, dynamic>? ??
          const <String, Object?>{},
    );

Map<String, dynamic> _$PromptTemplateToJson(_PromptTemplate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'segments': instance.segments.map((e) => e.toJson()).toList(),
      'metadata': instance.metadata,
    };
