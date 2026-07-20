// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preflight.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PreflightFinding _$PreflightFindingFromJson(Map<String, dynamic> json) =>
    _PreflightFinding(
      rule: _ruleFromJson(json['rule'] as String),
      severity: _severityFromJson(json['severity'] as String),
      description: json['description'] as String,
      artboardId: json['artboardId'] as String?,
      targetIds:
          (json['targetIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      measurements:
          json['measurements'] as Map<String, dynamic>? ??
          const <String, Object?>{},
    );

Map<String, dynamic> _$PreflightFindingToJson(_PreflightFinding instance) =>
    <String, dynamic>{
      'rule': _ruleToJson(instance.rule),
      'severity': _severityToJson(instance.severity),
      'description': instance.description,
      'artboardId': instance.artboardId,
      'targetIds': instance.targetIds,
      'measurements': instance.measurements,
    };

_PreflightReport _$PreflightReportFromJson(Map<String, dynamic> json) =>
    _PreflightReport(
      jobId: json['jobId'] as String,
      findings:
          (json['findings'] as List<dynamic>?)
              ?.map((e) => PreflightFinding.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <PreflightFinding>[],
      engineVersion: json['engineVersion'] as String,
      metadata:
          json['metadata'] as Map<String, dynamic>? ??
          const <String, Object?>{},
    );

Map<String, dynamic> _$PreflightReportToJson(_PreflightReport instance) =>
    <String, dynamic>{
      'jobId': instance.jobId,
      'findings': instance.findings.map((e) => e.toJson()).toList(),
      'engineVersion': instance.engineVersion,
      'metadata': instance.metadata,
    };

_PreflightThresholds _$PreflightThresholdsFromJson(Map<String, dynamic> json) =>
    _PreflightThresholds(
      minEffectiveDpi: (json['minEffectiveDpi'] as num?)?.toDouble(),
      maxColours: (json['maxColours'] as num?)?.toInt(),
      minBleed: (json['minBleed'] as num?)?.toDouble(),
      bleedUnit: json['bleedUnit'] == null
          ? MeasurementUnit.millimetre
          : _unitFromJson(json['bleedUnit'] as String),
    );

Map<String, dynamic> _$PreflightThresholdsToJson(
  _PreflightThresholds instance,
) => <String, dynamic>{
  'minEffectiveDpi': instance.minEffectiveDpi,
  'maxColours': instance.maxColours,
  'minBleed': instance.minBleed,
  'bleedUnit': _unitToJson(instance.bleedUnit),
};
