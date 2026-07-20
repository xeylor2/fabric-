// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'execution_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlanJobStep _$PlanJobStepFromJson(Map<String, dynamic> json) => PlanJobStep(
  job: AiJob.fromJson(json['job'] as Map<String, dynamic>),
  prompt: CompiledPrompt.fromJson(json['prompt'] as Map<String, dynamic>),
  nodeCapability: _capabilityFromJson(json['nodeCapability'] as String?),
  $type: json['kind'] as String?,
);

Map<String, dynamic> _$PlanJobStepToJson(PlanJobStep instance) =>
    <String, dynamic>{
      'job': instance.job.toJson(),
      'prompt': instance.prompt.toJson(),
      'nodeCapability': _capabilityToJson(instance.nodeCapability),
      'kind': instance.$type,
    };

PlanCommandStep _$PlanCommandStepFromJson(Map<String, dynamic> json) =>
    PlanCommandStep(
      command: DocumentCommand.fromJson(
        json['command'] as Map<String, dynamic>,
      ),
      description: json['description'] as String,
      $type: json['kind'] as String?,
    );

Map<String, dynamic> _$PlanCommandStepToJson(PlanCommandStep instance) =>
    <String, dynamic>{
      'command': instance.command.toJson(),
      'description': instance.description,
      'kind': instance.$type,
    };

_ExecutionPlan _$ExecutionPlanFromJson(
  Map<String, dynamic> json,
) => _ExecutionPlan(
  id: json['id'] as String,
  operation: _operationFromJson(json['operation'] as String),
  steps:
      (json['steps'] as List<dynamic>?)
          ?.map((e) => PlanStep.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <PlanStep>[],
  scopeMaskIds:
      (json['scopeMaskIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  affectedNodeIds:
      (json['affectedNodeIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  estimates:
      (json['estimates'] as List<dynamic>?)
          ?.map((e) => CreditEstimate.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <CreditEstimate>[],
  wholeDesignRegeneration: json['wholeDesignRegeneration'] as bool? ?? false,
  promptHash: json['promptHash'] as String,
  provider: _providerFromJson(json['provider'] as String),
  model: json['model'] as String,
  constraintVersion: json['constraintVersion'] as String,
  toolVersion: json['toolVersion'] as String,
  metadata:
      json['metadata'] as Map<String, dynamic>? ?? const <String, Object?>{},
);

Map<String, dynamic> _$ExecutionPlanToJson(_ExecutionPlan instance) =>
    <String, dynamic>{
      'id': instance.id,
      'operation': _operationToJson(instance.operation),
      'steps': instance.steps.map((e) => e.toJson()).toList(),
      'scopeMaskIds': instance.scopeMaskIds,
      'affectedNodeIds': instance.affectedNodeIds,
      'estimates': instance.estimates.map((e) => e.toJson()).toList(),
      'wholeDesignRegeneration': instance.wholeDesignRegeneration,
      'promptHash': instance.promptHash,
      'provider': _providerToJson(instance.provider),
      'model': instance.model,
      'constraintVersion': instance.constraintVersion,
      'toolVersion': instance.toolVersion,
      'metadata': instance.metadata,
    };

_PlanViolation _$PlanViolationFromJson(Map<String, dynamic> json) =>
    _PlanViolation(
      kind: _violationKindFromJson(json['kind'] as String),
      stepIndex: (json['stepIndex'] as num?)?.toInt(),
      targetId: json['targetId'] as String?,
      detail: json['detail'] as String?,
    );

Map<String, dynamic> _$PlanViolationToJson(_PlanViolation instance) =>
    <String, dynamic>{
      'kind': _violationKindToJson(instance.kind),
      'stepIndex': instance.stepIndex,
      'targetId': instance.targetId,
      'detail': instance.detail,
    };

_PlanValidation _$PlanValidationFromJson(Map<String, dynamic> json) =>
    _PlanValidation(
      valid: json['valid'] as bool,
      violations:
          (json['violations'] as List<dynamic>?)
              ?.map((e) => PlanViolation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <PlanViolation>[],
    );

Map<String, dynamic> _$PlanValidationToJson(_PlanValidation instance) =>
    <String, dynamic>{
      'valid': instance.valid,
      'violations': instance.violations.map((e) => e.toJson()).toList(),
    };
