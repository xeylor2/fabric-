// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_router.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RoutedCandidate _$RoutedCandidateFromJson(Map<String, dynamic> json) =>
    _RoutedCandidate(
      profileId: json['profileId'] as String,
      provider: _providerFromJson(json['provider'] as String),
      model: json['model'] as String?,
      rank: (json['rank'] as num).toInt(),
    );

Map<String, dynamic> _$RoutedCandidateToJson(_RoutedCandidate instance) =>
    <String, dynamic>{
      'profileId': instance.profileId,
      'provider': _providerToJson(instance.provider),
      'model': instance.model,
      'rank': instance.rank,
    };

RoutingRouted _$RoutingRoutedFromJson(Map<String, dynamic> json) =>
    RoutingRouted(
      job: AiJob.fromJson(json['job'] as Map<String, dynamic>),
      candidates: (json['candidates'] as List<dynamic>)
          .map((e) => RoutedCandidate.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['kind'] as String?,
    );

Map<String, dynamic> _$RoutingRoutedToJson(RoutingRouted instance) =>
    <String, dynamic>{
      'job': instance.job.toJson(),
      'candidates': instance.candidates.map((e) => e.toJson()).toList(),
      'kind': instance.$type,
    };

RoutingNoRoute _$RoutingNoRouteFromJson(Map<String, dynamic> json) =>
    RoutingNoRoute(
      reason: _reasonFromJson(json['reason'] as String),
      detail: json['detail'] as String?,
      $type: json['kind'] as String?,
    );

Map<String, dynamic> _$RoutingNoRouteToJson(RoutingNoRoute instance) =>
    <String, dynamic>{
      'reason': _reasonToJson(instance.reason),
      'detail': instance.detail,
      'kind': instance.$type,
    };
