// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_render_bridge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductionRenderPlan _$ProductionRenderPlanFromJson(
  Map<String, dynamic> json,
) => _ProductionRenderPlan(
  jobId: json['jobId'] as String,
  artboardIds:
      (json['artboardIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  target: RenderTarget.fromJson(json['target'] as Map<String, dynamic>),
  graph: RenderGraph.fromJson(json['graph'] as Map<String, dynamic>),
  record: ReproducibilityRecord.fromJson(
    json['record'] as Map<String, dynamic>,
  ),
  metadata:
      json['metadata'] as Map<String, dynamic>? ?? const <String, Object?>{},
);

Map<String, dynamic> _$ProductionRenderPlanToJson(
  _ProductionRenderPlan instance,
) => <String, dynamic>{
  'jobId': instance.jobId,
  'artboardIds': instance.artboardIds,
  'target': instance.target.toJson(),
  'graph': instance.graph.toJson(),
  'record': instance.record.toJson(),
  'metadata': instance.metadata,
};
