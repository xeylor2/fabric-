// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'render_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RenderObject _$RenderObjectFromJson(Map<String, dynamic> json) =>
    _RenderObject(
      id: json['id'] as String,
      kind: _kindFromJson(json['kind'] as String),
      source: CanvasReference.fromJson(json['source'] as Map<String, dynamic>),
      transform: json['transform'] == null
          ? Transform2D.identity
          : Transform2D.fromJson(json['transform'] as Map<String, dynamic>),
      bounds: Rect2D.fromJson(json['bounds'] as Map<String, dynamic>),
      blend: json['blend'] == null
          ? FebricBlendMode.normal
          : _blendFromJson(json['blend'] as String),
      opacity: (json['opacity'] as num?)?.toDouble() ?? 1.0,
      order: (json['order'] as num?)?.toInt() ?? 0,
      maskId: json['maskId'] as String?,
      tileKeys:
          (json['tileKeys'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
    );

Map<String, dynamic> _$RenderObjectToJson(_RenderObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kind': _kindToJson(instance.kind),
      'source': instance.source.toJson(),
      'transform': instance.transform.toJson(),
      'bounds': instance.bounds.toJson(),
      'blend': _blendToJson(instance.blend),
      'opacity': instance.opacity,
      'order': instance.order,
      'maskId': instance.maskId,
      'tileKeys': instance.tileKeys,
    };
