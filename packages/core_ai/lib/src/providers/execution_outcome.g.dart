// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'execution_outcome.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExecutionAttempt _$ExecutionAttemptFromJson(Map<String, dynamic> json) =>
    _ExecutionAttempt(
      profileId: json['profileId'] as String,
      provider: _providerFromJson(json['provider'] as String),
      model: json['model'] as String?,
      succeeded: json['succeeded'] as bool,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$ExecutionAttemptToJson(_ExecutionAttempt instance) =>
    <String, dynamic>{
      'profileId': instance.profileId,
      'provider': _providerToJson(instance.provider),
      'model': instance.model,
      'succeeded': instance.succeeded,
      'error': instance.error,
    };

ExecutionExecuted _$ExecutionExecutedFromJson(Map<String, dynamic> json) =>
    ExecutionExecuted(
      job: AiJob.fromJson(json['job'] as Map<String, dynamic>),
      proposalId: json['proposalId'] as String,
      attempts:
          (json['attempts'] as List<dynamic>?)
              ?.map((e) => ExecutionAttempt.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ExecutionAttempt>[],
      $type: json['kind'] as String?,
    );

Map<String, dynamic> _$ExecutionExecutedToJson(ExecutionExecuted instance) =>
    <String, dynamic>{
      'job': instance.job.toJson(),
      'proposalId': instance.proposalId,
      'attempts': instance.attempts.map((e) => e.toJson()).toList(),
      'kind': instance.$type,
    };

ExecutionFailed _$ExecutionFailedFromJson(Map<String, dynamic> json) =>
    ExecutionFailed(
      job: AiJob.fromJson(json['job'] as Map<String, dynamic>),
      attempts:
          (json['attempts'] as List<dynamic>?)
              ?.map((e) => ExecutionAttempt.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ExecutionAttempt>[],
      $type: json['kind'] as String?,
    );

Map<String, dynamic> _$ExecutionFailedToJson(ExecutionFailed instance) =>
    <String, dynamic>{
      'job': instance.job.toJson(),
      'attempts': instance.attempts.map((e) => e.toJson()).toList(),
      'kind': instance.$type,
    };

ExecutionNotExecuted _$ExecutionNotExecutedFromJson(
  Map<String, dynamic> json,
) => ExecutionNotExecuted(
  job: AiJob.fromJson(json['job'] as Map<String, dynamic>),
  attempts:
      (json['attempts'] as List<dynamic>?)
          ?.map((e) => ExecutionAttempt.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ExecutionAttempt>[],
  detail: json['detail'] as String?,
  $type: json['kind'] as String?,
);

Map<String, dynamic> _$ExecutionNotExecutedToJson(
  ExecutionNotExecuted instance,
) => <String, dynamic>{
  'job': instance.job.toJson(),
  'attempts': instance.attempts.map((e) => e.toJson()).toList(),
  'detail': instance.detail,
  'kind': instance.$type,
};
