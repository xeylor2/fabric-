// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'canvas_performance_strategy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CanvasPerformanceStrategy _$CanvasPerformanceStrategyFromJson(
  Map<String, dynamic> json,
) => _CanvasPerformanceStrategy(
  tiles: json['tiles'] == null
      ? TileSpec.standard
      : TileSpec.fromJson(json['tiles'] as Map<String, dynamic>),
  largeDocument: json['largeDocument'] == null
      ? LargeDocumentPolicy.standard
      : LargeDocumentPolicy.fromJson(
          json['largeDocument'] as Map<String, dynamic>,
        ),
  spatialIndex: json['spatialIndex'] == null
      ? null
      : QuadTreeConfig.fromJson(json['spatialIndex'] as Map<String, dynamic>),
  infiniteCanvas: json['infiniteCanvas'] as bool? ?? true,
  dirtyRegionTracking: json['dirtyRegionTracking'] as bool? ?? true,
  objectCulling: json['objectCulling'] as bool? ?? true,
  viewportCaching: json['viewportCaching'] as bool? ?? true,
  levelOfDetail: json['levelOfDetail'] as bool? ?? true,
);

Map<String, dynamic> _$CanvasPerformanceStrategyToJson(
  _CanvasPerformanceStrategy instance,
) => <String, dynamic>{
  'tiles': instance.tiles.toJson(),
  'largeDocument': instance.largeDocument.toJson(),
  'spatialIndex': instance.spatialIndex?.toJson(),
  'infiniteCanvas': instance.infiniteCanvas,
  'dirtyRegionTracking': instance.dirtyRegionTracking,
  'objectCulling': instance.objectCulling,
  'viewportCaching': instance.viewportCaching,
  'levelOfDetail': instance.levelOfDetail,
};
