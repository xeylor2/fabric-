// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_proposal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AiProposal _$AiProposalFromJson(Map<String, dynamic> json) => _AiProposal(
  id: json['id'] as String,
  operation: _operationFromJson(json['operation'] as String),
  commands:
      (json['commands'] as List<dynamic>?)
          ?.map((e) => DocumentCommand.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <DocumentCommand>[],
  targetNodeIds:
      (json['targetNodeIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  promptHash: json['promptHash'] as String,
  templateId: json['templateId'] as String?,
  provider: _providerFromJson(json['provider'] as String),
  model: json['model'] as String,
  constraintVersion: json['constraintVersion'] as String,
  toolVersion: json['toolVersion'] as String,
  parameters:
      json['parameters'] as Map<String, dynamic>? ?? const <String, Object?>{},
  status: json['status'] == null
      ? AiProposalStatus.staged
      : _statusFromJson(json['status'] as String),
  predecessorId: json['predecessorId'] as String?,
  description: json['description'] as String,
  metadata:
      json['metadata'] as Map<String, dynamic>? ?? const <String, Object?>{},
);

Map<String, dynamic> _$AiProposalToJson(_AiProposal instance) =>
    <String, dynamic>{
      'id': instance.id,
      'operation': _operationToJson(instance.operation),
      'commands': instance.commands.map((e) => e.toJson()).toList(),
      'targetNodeIds': instance.targetNodeIds,
      'promptHash': instance.promptHash,
      'templateId': instance.templateId,
      'provider': _providerToJson(instance.provider),
      'model': instance.model,
      'constraintVersion': instance.constraintVersion,
      'toolVersion': instance.toolVersion,
      'parameters': instance.parameters,
      'status': _statusToJson(instance.status),
      'predecessorId': instance.predecessorId,
      'description': instance.description,
      'metadata': instance.metadata,
    };
