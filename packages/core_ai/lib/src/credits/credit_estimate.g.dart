// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_estimate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreditEstimate _$CreditEstimateFromJson(Map<String, dynamic> json) =>
    _CreditEstimate(
      jobId: json['jobId'] as String,
      credits: (json['credits'] as num).toInt(),
      breakdown:
          (json['breakdown'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, (e as num).toInt()),
          ) ??
          const <String, int>{},
      estimatorVersion: json['estimatorVersion'] as String,
      metadata:
          json['metadata'] as Map<String, dynamic>? ??
          const <String, Object?>{},
    );

Map<String, dynamic> _$CreditEstimateToJson(_CreditEstimate instance) =>
    <String, dynamic>{
      'jobId': instance.jobId,
      'credits': instance.credits,
      'breakdown': instance.breakdown,
      'estimatorVersion': instance.estimatorVersion,
      'metadata': instance.metadata,
    };
