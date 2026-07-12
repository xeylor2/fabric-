// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_provenance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AiProvenanceRecord _$AiProvenanceRecordFromJson(Map<String, dynamic> json) =>
    _AiProvenanceRecord(
      id: json['id'] as String,
      promptHash: json['promptHash'] as String,
      templateId: json['templateId'] as String?,
      provider: _providerFromJson(json['provider'] as String),
      model: json['model'] as String,
      parameters:
          json['parameters'] as Map<String, dynamic>? ??
          const <String, Object?>{},
      constraintVersion: json['constraintVersion'] as String,
      toolVersion: json['toolVersion'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      revision: (json['revision'] as num).toInt(),
      affectedIds:
          (json['affectedIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
    );

Map<String, dynamic> _$AiProvenanceRecordToJson(_AiProvenanceRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'promptHash': instance.promptHash,
      'templateId': instance.templateId,
      'provider': _providerToJson(instance.provider),
      'model': instance.model,
      'parameters': instance.parameters,
      'constraintVersion': instance.constraintVersion,
      'toolVersion': instance.toolVersion,
      'timestamp': instance.timestamp.toIso8601String(),
      'revision': instance.revision,
      'affectedIds': instance.affectedIds,
    };
