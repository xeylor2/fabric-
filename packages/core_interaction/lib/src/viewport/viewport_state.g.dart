// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viewport_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ViewportState _$ViewportStateFromJson(Map<String, dynamic> json) =>
    _ViewportState(
      canvasSize: Size2D.fromJson(json['canvasSize'] as Map<String, dynamic>),
      screenSize: Size2D.fromJson(json['screenSize'] as Map<String, dynamic>),
      zoom: (json['zoom'] as num?)?.toDouble() ?? 1.0,
      offset: json['offset'] == null
          ? Point2D.zero
          : Point2D.fromJson(json['offset'] as Map<String, dynamic>),
      rotation: (json['rotation'] as num?)?.toDouble() ?? 0.0,
      devicePixelRatio: (json['devicePixelRatio'] as num?)?.toDouble() ?? 1.0,
    );

Map<String, dynamic> _$ViewportStateToJson(_ViewportState instance) =>
    <String, dynamic>{
      'canvasSize': instance.canvasSize.toJson(),
      'screenSize': instance.screenSize.toJson(),
      'zoom': instance.zoom,
      'offset': instance.offset.toJson(),
      'rotation': instance.rotation,
      'devicePixelRatio': instance.devicePixelRatio,
    };
