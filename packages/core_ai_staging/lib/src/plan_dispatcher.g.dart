// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_dispatcher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlanJobOutcome _$PlanJobOutcomeFromJson(
  Map<String, dynamic> json,
) => PlanJobOutcome(
  stepIndex: (json['stepIndex'] as num).toInt(),
  routing: RoutingDecision.fromJson(json['routing'] as Map<String, dynamic>),
  execution: json['execution'] == null
      ? null
      : ExecutionOutcome.fromJson(json['execution'] as Map<String, dynamic>),
  $type: json['kind'] as String?,
);

Map<String, dynamic> _$PlanJobOutcomeToJson(PlanJobOutcome instance) =>
    <String, dynamic>{
      'stepIndex': instance.stepIndex,
      'routing': instance.routing.toJson(),
      'execution': instance.execution?.toJson(),
      'kind': instance.$type,
    };

PlanCommandOutcome _$PlanCommandOutcomeFromJson(Map<String, dynamic> json) =>
    PlanCommandOutcome(
      stepIndex: (json['stepIndex'] as num).toInt(),
      proposalId: json['proposalId'] as String,
      $type: json['kind'] as String?,
    );

Map<String, dynamic> _$PlanCommandOutcomeToJson(PlanCommandOutcome instance) =>
    <String, dynamic>{
      'stepIndex': instance.stepIndex,
      'proposalId': instance.proposalId,
      'kind': instance.$type,
    };

_PlanDispatchResult _$PlanDispatchResultFromJson(Map<String, dynamic> json) =>
    _PlanDispatchResult(
      planId: json['planId'] as String,
      outcomes:
          (json['outcomes'] as List<dynamic>?)
              ?.map((e) => PlanStepOutcome.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <PlanStepOutcome>[],
    );

Map<String, dynamic> _$PlanDispatchResultToJson(_PlanDispatchResult instance) =>
    <String, dynamic>{
      'planId': instance.planId,
      'outcomes': instance.outcomes.map((e) => e.toJson()).toList(),
    };
