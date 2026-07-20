// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'colour_transform.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GamutFinding _$GamutFindingFromJson(Map<String, dynamic> json) =>
    _GamutFinding(
      reference: json['reference'] as String,
      deltaE: (json['deltaE'] as num).toDouble(),
      inGamut: json['inGamut'] as bool,
      metadata:
          json['metadata'] as Map<String, dynamic>? ??
          const <String, Object?>{},
    );

Map<String, dynamic> _$GamutFindingToJson(_GamutFinding instance) =>
    <String, dynamic>{
      'reference': instance.reference,
      'deltaE': instance.deltaE,
      'inGamut': instance.inGamut,
      'metadata': instance.metadata,
    };

_GamutReport _$GamutReportFromJson(Map<String, dynamic> json) => _GamutReport(
  requestId: json['requestId'] as String,
  colourProfileId: json['colourProfileId'] as String,
  findings:
      (json['findings'] as List<dynamic>?)
          ?.map((e) => GamutFinding.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <GamutFinding>[],
  metadata:
      json['metadata'] as Map<String, dynamic>? ?? const <String, Object?>{},
);

Map<String, dynamic> _$GamutReportToJson(_GamutReport instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'colourProfileId': instance.colourProfileId,
      'findings': instance.findings.map((e) => e.toJson()).toList(),
      'metadata': instance.metadata,
    };

_ColourTransformRequest _$ColourTransformRequestFromJson(
  Map<String, dynamic> json,
) => _ColourTransformRequest(
  id: json['id'] as String,
  sourceReferences:
      (json['sourceReferences'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  sourceSpace: json['sourceSpace'] as String,
  targetSpace: json['targetSpace'] as String,
  colourProfileId: json['colourProfileId'] as String,
  metadata:
      json['metadata'] as Map<String, dynamic>? ?? const <String, Object?>{},
);

Map<String, dynamic> _$ColourTransformRequestToJson(
  _ColourTransformRequest instance,
) => <String, dynamic>{
  'id': instance.id,
  'sourceReferences': instance.sourceReferences,
  'sourceSpace': instance.sourceSpace,
  'targetSpace': instance.targetSpace,
  'colourProfileId': instance.colourProfileId,
  'metadata': instance.metadata,
};

_ColourTransformResult _$ColourTransformResultFromJson(
  Map<String, dynamic> json,
) => _ColourTransformResult(
  requestId: json['requestId'] as String,
  outputReferences:
      (json['outputReferences'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  gamutReport: GamutReport.fromJson(
    json['gamutReport'] as Map<String, dynamic>,
  ),
  transformerVersion: json['transformerVersion'] as String,
  metadata:
      json['metadata'] as Map<String, dynamic>? ?? const <String, Object?>{},
);

Map<String, dynamic> _$ColourTransformResultToJson(
  _ColourTransformResult instance,
) => <String, dynamic>{
  'requestId': instance.requestId,
  'outputReferences': instance.outputReferences,
  'gamutReport': instance.gamutReport.toJson(),
  'transformerVersion': instance.transformerVersion,
  'metadata': instance.metadata,
};
