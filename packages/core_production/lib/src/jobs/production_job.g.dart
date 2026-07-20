// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductionJob _$ProductionJobFromJson(
  Map<String, dynamic> json,
) => _ProductionJob(
  id: json['id'] as String,
  documentId: json['documentId'] as String,
  artboardIds:
      (json['artboardIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  deliverable: _deliverableFromJson(json['deliverable'] as String),
  physicalSize: Size2D.fromJson(json['physicalSize'] as Map<String, dynamic>),
  unit: json['unit'] == null
      ? MeasurementUnit.centimetre
      : _unitFromJson(json['unit'] as String),
  dpi: (json['dpi'] as num?)?.toDouble() ?? 300.0,
  completed: json['completed'] == null
      ? const <ProductionStage>[]
      : _stagesFromJson(json['completed'] as List),
  metadata:
      json['metadata'] as Map<String, dynamic>? ?? const <String, Object?>{},
);

Map<String, dynamic> _$ProductionJobToJson(_ProductionJob instance) =>
    <String, dynamic>{
      'id': instance.id,
      'documentId': instance.documentId,
      'artboardIds': instance.artboardIds,
      'deliverable': _deliverableToJson(instance.deliverable),
      'physicalSize': instance.physicalSize.toJson(),
      'unit': _unitToJson(instance.unit),
      'dpi': instance.dpi,
      'completed': _stagesToJson(instance.completed),
      'metadata': instance.metadata,
    };
