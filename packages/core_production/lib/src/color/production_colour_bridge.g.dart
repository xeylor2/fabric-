// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_colour_bridge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductionColourPlan _$ProductionColourPlanFromJson(
  Map<String, dynamic> json,
) => _ProductionColourPlan(
  jobId: json['jobId'] as String,
  colourProfileId: json['colourProfileId'] as String,
  printProfileId: json['printProfileId'] as String?,
  request: ColourTransformRequest.fromJson(
    json['request'] as Map<String, dynamic>,
  ),
  gamutReport: json['gamutReport'] == null
      ? null
      : GamutReport.fromJson(json['gamutReport'] as Map<String, dynamic>),
  metadata:
      json['metadata'] as Map<String, dynamic>? ?? const <String, Object?>{},
);

Map<String, dynamic> _$ProductionColourPlanToJson(
  _ProductionColourPlan instance,
) => <String, dynamic>{
  'jobId': instance.jobId,
  'colourProfileId': instance.colourProfileId,
  'printProfileId': instance.printProfileId,
  'request': instance.request.toJson(),
  'gamutReport': instance.gamutReport?.toJson(),
  'metadata': instance.metadata,
};
