// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selection_region.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SelectionRefinement _$SelectionRefinementFromJson(Map<String, dynamic> json) =>
    _SelectionRefinement(
      kind: $enumDecode(_$SelectionRefinementKindEnumMap, json['kind']),
      amount: (json['amount'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$SelectionRefinementToJson(
  _SelectionRefinement instance,
) => <String, dynamic>{
  'kind': _$SelectionRefinementKindEnumMap[instance.kind]!,
  'amount': instance.amount,
};

const _$SelectionRefinementKindEnumMap = {
  SelectionRefinementKind.grow: 'grow',
  SelectionRefinementKind.shrink: 'shrink',
  SelectionRefinementKind.feather: 'feather',
  SelectionRefinementKind.inverse: 'inverse',
};

_SelectionRegion _$SelectionRegionFromJson(Map<String, dynamic> json) =>
    _SelectionRegion(
      id: json['id'] as String,
      kind: $enumDecode(_$SelectionShapeKindEnumMap, json['kind']),
      bounds: Rect2D.fromJson(json['bounds'] as Map<String, dynamic>),
      points:
          (json['points'] as List<dynamic>?)
              ?.map((e) => Point2D.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Point2D>[],
      tolerance: (json['tolerance'] as num?)?.toDouble(),
      colourHex: json['colourHex'] as String?,
      metadata:
          json['metadata'] as Map<String, dynamic>? ??
          const <String, Object?>{},
    );

Map<String, dynamic> _$SelectionRegionToJson(_SelectionRegion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kind': _$SelectionShapeKindEnumMap[instance.kind]!,
      'bounds': instance.bounds.toJson(),
      'points': instance.points.map((e) => e.toJson()).toList(),
      'tolerance': instance.tolerance,
      'colourHex': instance.colourHex,
      'metadata': instance.metadata,
    };

const _$SelectionShapeKindEnumMap = {
  SelectionShapeKind.rectangle: 'rectangle',
  SelectionShapeKind.ellipse: 'ellipse',
  SelectionShapeKind.polygon: 'polygon',
  SelectionShapeKind.lasso: 'lasso',
  SelectionShapeKind.brush: 'brush',
  SelectionShapeKind.magicWand: 'magicWand',
  SelectionShapeKind.quickSelect: 'quickSelect',
  SelectionShapeKind.aiSelect: 'aiSelect',
  SelectionShapeKind.selectSimilar: 'selectSimilar',
  SelectionShapeKind.selectColour: 'selectColour',
};

_SelectionSnapshot _$SelectionSnapshotFromJson(
  Map<String, dynamic> json,
) => _SelectionSnapshot(
  id: json['id'] as String,
  revision: (json['revision'] as num).toInt(),
  regions:
      (json['regions'] as List<dynamic>?)
          ?.map((e) => SelectionRegion.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <SelectionRegion>[],
  refinements:
      (json['refinements'] as List<dynamic>?)
          ?.map((e) => SelectionRefinement.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <SelectionRefinement>[],
  metadata:
      json['metadata'] as Map<String, dynamic>? ?? const <String, Object?>{},
);

Map<String, dynamic> _$SelectionSnapshotToJson(_SelectionSnapshot instance) =>
    <String, dynamic>{
      'id': instance.id,
      'revision': instance.revision,
      'regions': instance.regions.map((e) => e.toJson()).toList(),
      'refinements': instance.refinements.map((e) => e.toJson()).toList(),
      'metadata': instance.metadata,
    };

_SelectionHistory _$SelectionHistoryFromJson(Map<String, dynamic> json) =>
    _SelectionHistory(
      snapshots:
          (json['snapshots'] as List<dynamic>?)
              ?.map(
                (e) => SelectionSnapshot.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <SelectionSnapshot>[],
      cursor: (json['cursor'] as num?)?.toInt() ?? -1,
      maxSnapshots: (json['maxSnapshots'] as num?)?.toInt() ?? 64,
    );

Map<String, dynamic> _$SelectionHistoryToJson(_SelectionHistory instance) =>
    <String, dynamic>{
      'snapshots': instance.snapshots.map((e) => e.toJson()).toList(),
      'cursor': instance.cursor,
      'maxSnapshots': instance.maxSnapshots,
    };
