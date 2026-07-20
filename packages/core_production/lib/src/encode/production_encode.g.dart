// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_encode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EncodeRequest _$EncodeRequestFromJson(
  Map<String, dynamic> json,
) => _EncodeRequest(
  id: json['id'] as String,
  sourceReferences:
      (json['sourceReferences'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  format: _formatFromJson(json['format'] as String),
  exportProfileId: json['exportProfileId'] as String,
  physicalSize: Size2D.fromJson(json['physicalSize'] as Map<String, dynamic>),
  unit: _unitFromJson(json['unit'] as String),
  dpi: (json['dpi'] as num).toDouble(),
  metadata:
      json['metadata'] as Map<String, dynamic>? ?? const <String, Object?>{},
);

Map<String, dynamic> _$EncodeRequestToJson(_EncodeRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sourceReferences': instance.sourceReferences,
      'format': _formatToJson(instance.format),
      'exportProfileId': instance.exportProfileId,
      'physicalSize': instance.physicalSize.toJson(),
      'unit': _unitToJson(instance.unit),
      'dpi': instance.dpi,
      'metadata': instance.metadata,
    };

EncodeEncoded _$EncodeEncodedFromJson(Map<String, dynamic> json) =>
    EncodeEncoded(
      requestId: json['requestId'] as String,
      outputReferences:
          (json['outputReferences'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      encoderVersion: json['encoderVersion'] as String,
      $type: json['kind'] as String?,
    );

Map<String, dynamic> _$EncodeEncodedToJson(EncodeEncoded instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'outputReferences': instance.outputReferences,
      'encoderVersion': instance.encoderVersion,
      'kind': instance.$type,
    };

EncodeUnsupported _$EncodeUnsupportedFromJson(Map<String, dynamic> json) =>
    EncodeUnsupported(
      requestId: json['requestId'] as String,
      format: _formatFromJson(json['format'] as String),
      encoderVersion: json['encoderVersion'] as String,
      detail: json['detail'] as String?,
      $type: json['kind'] as String?,
    );

Map<String, dynamic> _$EncodeUnsupportedToJson(EncodeUnsupported instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'format': _formatToJson(instance.format),
      'encoderVersion': instance.encoderVersion,
      'detail': instance.detail,
      'kind': instance.$type,
    };

_ProductionEncodePlan _$ProductionEncodePlanFromJson(
  Map<String, dynamic> json,
) => _ProductionEncodePlan(
  jobId: json['jobId'] as String,
  requests:
      (json['requests'] as List<dynamic>?)
          ?.map((e) => EncodeRequest.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <EncodeRequest>[],
  metadata:
      json['metadata'] as Map<String, dynamic>? ?? const <String, Object?>{},
);

Map<String, dynamic> _$ProductionEncodePlanToJson(
  _ProductionEncodePlan instance,
) => <String, dynamic>{
  'jobId': instance.jobId,
  'requests': instance.requests.map((e) => e.toJson()).toList(),
  'metadata': instance.metadata,
};
