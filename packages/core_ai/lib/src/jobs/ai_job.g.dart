// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AiJob _$AiJobFromJson(Map<String, dynamic> json) => _AiJob(
  id: json['id'] as String,
  operation: _operationFromJson(json['operation'] as String),
  scopeNodeIds:
      (json['scopeNodeIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  scopeMaskIds:
      (json['scopeMaskIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  promptHash: json['promptHash'] as String,
  templateId: json['templateId'] as String?,
  requiredCapabilities: json['requiredCapabilities'] == null
      ? const <AiCapability>{}
      : _capabilitiesFromJson(json['requiredCapabilities'] as List),
  status: json['status'] == null
      ? AiJobStatus.planned
      : _statusFromJson(json['status'] as String),
  provider: _providerFromJson(json['provider'] as String?),
  model: json['model'] as String?,
  seed: (json['seed'] as num?)?.toInt(),
  parameters:
      json['parameters'] as Map<String, dynamic>? ?? const <String, Object?>{},
  failureReason: json['failureReason'] as String?,
  metadata:
      json['metadata'] as Map<String, dynamic>? ?? const <String, Object?>{},
);

Map<String, dynamic> _$AiJobToJson(_AiJob instance) => <String, dynamic>{
  'id': instance.id,
  'operation': _operationToJson(instance.operation),
  'scopeNodeIds': instance.scopeNodeIds,
  'scopeMaskIds': instance.scopeMaskIds,
  'promptHash': instance.promptHash,
  'templateId': instance.templateId,
  'requiredCapabilities': _capabilitiesToJson(instance.requiredCapabilities),
  'status': _statusToJson(instance.status),
  'provider': _providerToJson(instance.provider),
  'model': instance.model,
  'seed': instance.seed,
  'parameters': instance.parameters,
  'failureReason': instance.failureReason,
  'metadata': instance.metadata,
};
