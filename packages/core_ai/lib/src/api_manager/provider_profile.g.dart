// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProviderHealth _$ProviderHealthFromJson(Map<String, dynamic> json) =>
    _ProviderHealth(
      status: json['status'] == null
          ? HealthStatus.unknown
          : _healthStatusFromJson(json['status'] as String),
      circuit: json['circuit'] == null
          ? CircuitState.closed
          : _circuitFromJson(json['circuit'] as String),
      latencyP50Ms: (json['latencyP50Ms'] as num?)?.toInt(),
      latencyP95Ms: (json['latencyP95Ms'] as num?)?.toInt(),
      lastCheck: json['lastCheck'] == null
          ? null
          : DateTime.parse(json['lastCheck'] as String),
    );

Map<String, dynamic> _$ProviderHealthToJson(_ProviderHealth instance) =>
    <String, dynamic>{
      'status': _healthStatusToJson(instance.status),
      'circuit': _circuitToJson(instance.circuit),
      'latencyP50Ms': instance.latencyP50Ms,
      'latencyP95Ms': instance.latencyP95Ms,
      'lastCheck': instance.lastCheck?.toIso8601String(),
    };

_ProviderQuota _$ProviderQuotaFromJson(Map<String, dynamic> json) =>
    _ProviderQuota(
      used: (json['used'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      resetAt: json['resetAt'] == null
          ? null
          : DateTime.parse(json['resetAt'] as String),
    );

Map<String, dynamic> _$ProviderQuotaToJson(_ProviderQuota instance) =>
    <String, dynamic>{
      'used': instance.used,
      'limit': instance.limit,
      'resetAt': instance.resetAt?.toIso8601String(),
    };

_ProviderValidity _$ProviderValidityFromJson(Map<String, dynamic> json) =>
    _ProviderValidity(
      keyValid: json['keyValid'] as bool,
      lastValidation: json['lastValidation'] == null
          ? null
          : DateTime.parse(json['lastValidation'] as String),
    );

Map<String, dynamic> _$ProviderValidityToJson(_ProviderValidity instance) =>
    <String, dynamic>{
      'keyValid': instance.keyValid,
      'lastValidation': instance.lastValidation?.toIso8601String(),
    };

_ProviderProfile _$ProviderProfileFromJson(
  Map<String, dynamic> json,
) => _ProviderProfile(
  id: json['id'] as String,
  provider: _providerFromJson(json['provider'] as String),
  mode: _modeFromJson(json['mode'] as String),
  endpoint: json['endpoint'] as String?,
  keyRef: json['keyRef'] as String?,
  capabilities: json['capabilities'] == null
      ? const <AiCapability>{}
      : _capabilitiesFromJson(json['capabilities'] as List),
  models:
      (json['models'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  quota: json['quota'] == null
      ? null
      : ProviderQuota.fromJson(json['quota'] as Map<String, dynamic>),
  health: json['health'] == null
      ? const ProviderHealth(status: HealthStatus.healthy)
      : ProviderHealth.fromJson(json['health'] as Map<String, dynamic>),
  validity: json['validity'] == null
      ? null
      : ProviderValidity.fromJson(json['validity'] as Map<String, dynamic>),
  metadata:
      json['metadata'] as Map<String, dynamic>? ?? const <String, Object?>{},
);

Map<String, dynamic> _$ProviderProfileToJson(_ProviderProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'provider': _providerToJson(instance.provider),
      'mode': _modeToJson(instance.mode),
      'endpoint': instance.endpoint,
      'keyRef': instance.keyRef,
      'capabilities': _capabilitiesToJson(instance.capabilities),
      'models': instance.models,
      'quota': instance.quota?.toJson(),
      'health': instance.health.toJson(),
      'validity': instance.validity?.toJson(),
      'metadata': instance.metadata,
    };
