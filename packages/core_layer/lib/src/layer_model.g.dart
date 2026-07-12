// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'layer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LayerModel _$LayerModelFromJson(Map<String, dynamic> json) => _LayerModel(
  id: json['id'] as String,
  name: json['name'] as String,
  kind: $enumDecode(_$LayerKindEnumMap, json['kind']),
  children:
      (json['children'] as List<dynamic>?)
          ?.map((e) => LayerModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <LayerModel>[],
  blendMode:
      $enumDecodeNullable(_$FebricBlendModeEnumMap, json['blendMode']) ??
      FebricBlendMode.normal,
  opacity: (json['opacity'] as num?)?.toDouble() ?? 1.0,
  hidden: json['hidden'] as bool? ?? false,
  locked: json['locked'] as bool? ?? false,
  pinned: json['pinned'] as bool? ?? false,
  favourite: json['favourite'] as bool? ?? false,
  maskIds:
      (json['maskIds'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  metadata:
      json['metadata'] as Map<String, dynamic>? ?? const <String, Object?>{},
);

Map<String, dynamic> _$LayerModelToJson(_LayerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'kind': _$LayerKindEnumMap[instance.kind]!,
      'children': instance.children.map((e) => e.toJson()).toList(),
      'blendMode': _$FebricBlendModeEnumMap[instance.blendMode]!,
      'opacity': instance.opacity,
      'hidden': instance.hidden,
      'locked': instance.locked,
      'pinned': instance.pinned,
      'favourite': instance.favourite,
      'maskIds': instance.maskIds,
      'tags': instance.tags,
      'metadata': instance.metadata,
    };

const _$LayerKindEnumMap = {
  LayerKind.layer: 'layer',
  LayerKind.group: 'group',
  LayerKind.folder: 'folder',
  LayerKind.artboard: 'artboard',
  LayerKind.reference: 'reference',
  LayerKind.image: 'image',
  LayerKind.vector: 'vector',
  LayerKind.text: 'text',
  LayerKind.pattern: 'pattern',
  LayerKind.ai: 'ai',
  LayerKind.adjustment: 'adjustment',
  LayerKind.mask: 'mask',
};

const _$FebricBlendModeEnumMap = {
  FebricBlendMode.normal: 'normal',
  FebricBlendMode.multiply: 'multiply',
  FebricBlendMode.screen: 'screen',
  FebricBlendMode.overlay: 'overlay',
  FebricBlendMode.darken: 'darken',
  FebricBlendMode.lighten: 'lighten',
  FebricBlendMode.colourDodge: 'colourDodge',
  FebricBlendMode.colourBurn: 'colourBurn',
  FebricBlendMode.hardLight: 'hardLight',
  FebricBlendMode.softLight: 'softLight',
  FebricBlendMode.difference: 'difference',
  FebricBlendMode.exclusion: 'exclusion',
  FebricBlendMode.hue: 'hue',
  FebricBlendMode.saturation: 'saturation',
  FebricBlendMode.colour: 'colour',
  FebricBlendMode.luminosity: 'luminosity',
};
