// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_sheet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductionSheet _$ProductionSheetFromJson(
  Map<String, dynamic> json,
) => _ProductionSheet(
  jobId: json['jobId'] as String,
  deliverable: $enumDecode(_$ProductionDeliverableEnumMap, json['deliverable']),
  physicalSize: Size2D.fromJson(json['physicalSize'] as Map<String, dynamic>),
  unit: _unitFromJson(json['unit'] as String),
  dpi: (json['dpi'] as num).toDouble(),
  documentId: json['documentId'] as String,
  revision: RevisionId.fromJson((json['revision'] as num).toInt()),
  artboardIds:
      (json['artboardIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  preflight: PreflightReport.fromJson(
    json['preflight'] as Map<String, dynamic>,
  ),
  reproducibility: ReproducibilityRecord.fromJson(
    json['reproducibility'] as Map<String, dynamic>,
  ),
  colourProfileId: json['colourProfileId'] as String,
  printProfileId: json['printProfileId'] as String?,
  gamutReport: GamutReport.fromJson(
    json['gamutReport'] as Map<String, dynamic>,
  ),
  encodeRequests:
      (json['encodeRequests'] as List<dynamic>?)
          ?.map((e) => EncodeRequest.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <EncodeRequest>[],
  encodeResults:
      (json['encodeResults'] as List<dynamic>?)
          ?.map((e) => EncodeResult.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <EncodeResult>[],
  sheetVersion: json['sheetVersion'] as String,
  metadata:
      json['metadata'] as Map<String, dynamic>? ?? const <String, Object?>{},
);

Map<String, dynamic> _$ProductionSheetToJson(_ProductionSheet instance) =>
    <String, dynamic>{
      'jobId': instance.jobId,
      'deliverable': _$ProductionDeliverableEnumMap[instance.deliverable]!,
      'physicalSize': instance.physicalSize.toJson(),
      'unit': _unitToJson(instance.unit),
      'dpi': instance.dpi,
      'documentId': instance.documentId,
      'revision': instance.revision.toJson(),
      'artboardIds': instance.artboardIds,
      'preflight': instance.preflight.toJson(),
      'reproducibility': instance.reproducibility.toJson(),
      'colourProfileId': instance.colourProfileId,
      'printProfileId': instance.printProfileId,
      'gamutReport': instance.gamutReport.toJson(),
      'encodeRequests': instance.encodeRequests.map((e) => e.toJson()).toList(),
      'encodeResults': instance.encodeResults.map((e) => e.toJson()).toList(),
      'sheetVersion': instance.sheetVersion,
      'metadata': instance.metadata,
    };

const _$ProductionDeliverableEnumMap = {
  ProductionDeliverable.repeatTile: 'repeatTile',
  ProductionDeliverable.panelSet: 'panelSet',
  ProductionDeliverable.yardageStrikeOff: 'yardageStrikeOff',
};
