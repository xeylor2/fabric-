// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mask_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MaskRefinement _$MaskRefinementFromJson(Map<String, dynamic> json) =>
    _MaskRefinement(
      kind: $enumDecode(_$MaskRefinementKindEnumMap, json['kind']),
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$MaskRefinementToJson(_MaskRefinement instance) =>
    <String, dynamic>{
      'kind': _$MaskRefinementKindEnumMap[instance.kind]!,
      'amount': instance.amount,
    };

const _$MaskRefinementKindEnumMap = {
  MaskRefinementKind.feather: 'feather',
  MaskRefinementKind.expand: 'expand',
  MaskRefinementKind.shrink: 'shrink',
  MaskRefinementKind.grow: 'grow',
};

_MaskModel _$MaskModelFromJson(Map<String, dynamic> json) => _MaskModel(
  id: json['id'] as String,
  name: json['name'] as String,
  kind: $enumDecode(_$MaskKindEnumMap, json['kind']),
  enabled: json['enabled'] as bool? ?? true,
  inverted: json['inverted'] as bool? ?? false,
  density: (json['density'] as num?)?.toDouble() ?? 1.0,
  refinements:
      (json['refinements'] as List<dynamic>?)
          ?.map((e) => MaskRefinement.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <MaskRefinement>[],
  bounds: json['bounds'] == null
      ? null
      : Rect2D.fromJson(json['bounds'] as Map<String, dynamic>),
  metadata:
      json['metadata'] as Map<String, dynamic>? ?? const <String, Object?>{},
);

Map<String, dynamic> _$MaskModelToJson(_MaskModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'kind': _$MaskKindEnumMap[instance.kind]!,
      'enabled': instance.enabled,
      'inverted': instance.inverted,
      'density': instance.density,
      'refinements': instance.refinements.map((e) => e.toJson()).toList(),
      'bounds': instance.bounds?.toJson(),
      'metadata': instance.metadata,
    };

const _$MaskKindEnumMap = {
  MaskKind.layerMask: 'layerMask',
  MaskKind.vectorMask: 'vectorMask',
  MaskKind.brushMask: 'brushMask',
  MaskKind.aiMask: 'aiMask',
  MaskKind.clipMask: 'clipMask',
  MaskKind.alphaMask: 'alphaMask',
};

_MaskStackEntry _$MaskStackEntryFromJson(Map<String, dynamic> json) =>
    _MaskStackEntry(
      mask: MaskModel.fromJson(json['mask'] as Map<String, dynamic>),
      op:
          $enumDecodeNullable(_$MaskBooleanOpEnumMap, json['op']) ??
          MaskBooleanOp.union,
    );

Map<String, dynamic> _$MaskStackEntryToJson(_MaskStackEntry instance) =>
    <String, dynamic>{
      'mask': instance.mask.toJson(),
      'op': _$MaskBooleanOpEnumMap[instance.op]!,
    };

const _$MaskBooleanOpEnumMap = {
  MaskBooleanOp.union: 'union',
  MaskBooleanOp.intersect: 'intersect',
  MaskBooleanOp.subtract: 'subtract',
  MaskBooleanOp.invert: 'invert',
};

_MaskStack _$MaskStackFromJson(Map<String, dynamic> json) => _MaskStack(
  targetId: json['targetId'] as String,
  entries:
      (json['entries'] as List<dynamic>?)
          ?.map((e) => MaskStackEntry.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <MaskStackEntry>[],
);

Map<String, dynamic> _$MaskStackToJson(_MaskStack instance) =>
    <String, dynamic>{
      'targetId': instance.targetId,
      'entries': instance.entries.map((e) => e.toJson()).toList(),
    };
