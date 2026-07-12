// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'canvas_runtime_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CanvasRuntimeState _$CanvasRuntimeStateFromJson(Map<String, dynamic> json) =>
    _CanvasRuntimeState(
      camera: NavigationState.fromJson(json['camera'] as Map<String, dynamic>),
      coordinateSystem: json['coordinateSystem'] == null
          ? CanvasCoordinateSystem.standard
          : CanvasCoordinateSystem.fromJson(
              json['coordinateSystem'] as Map<String, dynamic>,
            ),
      grid: json['grid'] == null
          ? GridSpec.standard
          : GridSpec.fromJson(json['grid'] as Map<String, dynamic>),
      guides:
          (json['guides'] as List<dynamic>?)
              ?.map((e) => GuideModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <GuideModel>[],
      ruler: json['ruler'] == null
          ? RulerSpec.standard
          : RulerSpec.fromJson(json['ruler'] as Map<String, dynamic>),
      snapping: json['snapping'] == null
          ? SnappingConfig.standard
          : SnappingConfig.fromJson(json['snapping'] as Map<String, dynamic>),
      overlays: json['overlays'] == null
          ? OverlayStack.empty
          : OverlayStack.fromJson(json['overlays'] as Map<String, dynamic>),
      references:
          (json['references'] as List<dynamic>?)
              ?.map((e) => CanvasReference.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <CanvasReference>[],
      printRegions: json['printRegions'] == null
          ? PrintRegionSpec.standard
          : PrintRegionSpec.fromJson(
              json['printRegions'] as Map<String, dynamic>,
            ),
      performance: json['performance'] == null
          ? CanvasPerformanceStrategy.standard
          : CanvasPerformanceStrategy.fromJson(
              json['performance'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$CanvasRuntimeStateToJson(_CanvasRuntimeState instance) =>
    <String, dynamic>{
      'camera': instance.camera.toJson(),
      'coordinateSystem': instance.coordinateSystem.toJson(),
      'grid': instance.grid.toJson(),
      'guides': instance.guides.map((e) => e.toJson()).toList(),
      'ruler': instance.ruler.toJson(),
      'snapping': instance.snapping.toJson(),
      'overlays': instance.overlays.toJson(),
      'references': instance.references.map((e) => e.toJson()).toList(),
      'printRegions': instance.printRegions.toJson(),
      'performance': instance.performance.toJson(),
    };
