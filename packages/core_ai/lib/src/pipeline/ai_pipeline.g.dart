// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_pipeline.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AiPipelineRun _$AiPipelineRunFromJson(Map<String, dynamic> json) =>
    _AiPipelineRun(
      id: json['id'] as String,
      completed:
          (json['completed'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$AiPipelineStageEnumMap, e))
              .toList() ??
          const <AiPipelineStage>[],
      metadata:
          json['metadata'] as Map<String, dynamic>? ??
          const <String, Object?>{},
    );

Map<String, dynamic> _$AiPipelineRunToJson(_AiPipelineRun instance) =>
    <String, dynamic>{
      'id': instance.id,
      'completed': instance.completed
          .map((e) => _$AiPipelineStageEnumMap[e]!)
          .toList(),
      'metadata': instance.metadata,
    };

const _$AiPipelineStageEnumMap = {
  AiPipelineStage.conversation: 'conversation',
  AiPipelineStage.promptCompiler: 'promptCompiler',
  AiPipelineStage.constraintEngine: 'constraintEngine',
  AiPipelineStage.providerAdapter: 'providerAdapter',
  AiPipelineStage.execution: 'execution',
  AiPipelineStage.responseParser: 'responseParser',
  AiPipelineStage.validation: 'validation',
  AiPipelineStage.history: 'history',
  AiPipelineStage.documentUpdate: 'documentUpdate',
  AiPipelineStage.undoStack: 'undoStack',
  AiPipelineStage.review: 'review',
  AiPipelineStage.approval: 'approval',
  AiPipelineStage.productionReady: 'productionReady',
};
