// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'render_context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RenderContext _$RenderContextFromJson(Map<String, dynamic> json) =>
    _RenderContext(
      viewport: ViewportState.fromJson(
        json['viewport'] as Map<String, dynamic>,
      ),
      coordinateSystem: json['coordinateSystem'] == null
          ? CanvasCoordinateSystem.standard
          : CanvasCoordinateSystem.fromJson(
              json['coordinateSystem'] as Map<String, dynamic>,
            ),
      tiles: json['tiles'] == null
          ? TileSpec.standard
          : TileSpec.fromJson(json['tiles'] as Map<String, dynamic>),
      cacheBudget: json['cacheBudget'] == null
          ? null
          : CacheBudget.fromJson(json['cacheBudget'] as Map<String, dynamic>),
      lodLevel: (json['lodLevel'] as num?)?.toInt() ?? 0,
      colourSpace: json['colourSpace'] == null
          ? AssetColourSpace.srgb
          : _colourFromJson(json['colourSpace'] as String),
      frameId: (json['frameId'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$RenderContextToJson(_RenderContext instance) =>
    <String, dynamic>{
      'viewport': instance.viewport.toJson(),
      'coordinateSystem': instance.coordinateSystem.toJson(),
      'tiles': instance.tiles.toJson(),
      'cacheBudget': instance.cacheBudget?.toJson(),
      'lodLevel': instance.lodLevel,
      'colourSpace': _colourToJson(instance.colourSpace),
      'frameId': instance.frameId,
    };
