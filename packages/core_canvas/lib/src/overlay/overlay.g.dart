// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overlay.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OverlayModel _$OverlayModelFromJson(Map<String, dynamic> json) =>
    _OverlayModel(
      id: json['id'] as String,
      kind: $enumDecode(_$OverlayKindEnumMap, json['kind']),
      order: (json['order'] as num?)?.toInt() ?? 0,
      visible: json['visible'] as bool? ?? true,
      references:
          (json['references'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      bounds: json['bounds'] == null
          ? null
          : Rect2D.fromJson(json['bounds'] as Map<String, dynamic>),
      metadata:
          json['metadata'] as Map<String, dynamic>? ??
          const <String, Object?>{},
    );

Map<String, dynamic> _$OverlayModelToJson(_OverlayModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kind': _$OverlayKindEnumMap[instance.kind]!,
      'order': instance.order,
      'visible': instance.visible,
      'references': instance.references,
      'bounds': instance.bounds?.toJson(),
      'metadata': instance.metadata,
    };

const _$OverlayKindEnumMap = {
  OverlayKind.selection: 'selection',
  OverlayKind.hover: 'hover',
  OverlayKind.brushCursor: 'brushCursor',
  OverlayKind.polygonPreview: 'polygonPreview',
  OverlayKind.magicWandPreview: 'magicWandPreview',
  OverlayKind.aiPreview: 'aiPreview',
  OverlayKind.measurement: 'measurement',
  OverlayKind.grid: 'grid',
  OverlayKind.snapGuide: 'snapGuide',
  OverlayKind.alignmentGuide: 'alignmentGuide',
  OverlayKind.ruler: 'ruler',
  OverlayKind.toolOverlay: 'toolOverlay',
};

_OverlayStack _$OverlayStackFromJson(Map<String, dynamic> json) =>
    _OverlayStack(
      entries:
          (json['entries'] as List<dynamic>?)
              ?.map((e) => OverlayModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <OverlayModel>[],
    );

Map<String, dynamic> _$OverlayStackToJson(_OverlayStack instance) =>
    <String, dynamic>{
      'entries': instance.entries.map((e) => e.toJson()).toList(),
    };
