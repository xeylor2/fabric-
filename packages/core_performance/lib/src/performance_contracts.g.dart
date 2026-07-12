// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'performance_contracts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TileCoordinate _$TileCoordinateFromJson(Map<String, dynamic> json) =>
    _TileCoordinate(
      level: (json['level'] as num).toInt(),
      x: (json['x'] as num).toInt(),
      y: (json['y'] as num).toInt(),
    );

Map<String, dynamic> _$TileCoordinateToJson(_TileCoordinate instance) =>
    <String, dynamic>{
      'level': instance.level,
      'x': instance.x,
      'y': instance.y,
    };

_TileSpec _$TileSpecFromJson(Map<String, dynamic> json) => _TileSpec(
  tileSize: (json['tileSize'] as num?)?.toInt() ?? 256,
  overlap: (json['overlap'] as num?)?.toInt() ?? 2,
  levels: (json['levels'] as num?)?.toInt() ?? 6,
);

Map<String, dynamic> _$TileSpecToJson(_TileSpec instance) => <String, dynamic>{
  'tileSize': instance.tileSize,
  'overlap': instance.overlap,
  'levels': instance.levels,
};

_QuadTreeConfig _$QuadTreeConfigFromJson(Map<String, dynamic> json) =>
    _QuadTreeConfig(
      bounds: Rect2D.fromJson(json['bounds'] as Map<String, dynamic>),
      maxDepth: (json['maxDepth'] as num?)?.toInt() ?? 8,
      maxItemsPerNode: (json['maxItemsPerNode'] as num?)?.toInt() ?? 16,
    );

Map<String, dynamic> _$QuadTreeConfigToJson(_QuadTreeConfig instance) =>
    <String, dynamic>{
      'bounds': instance.bounds.toJson(),
      'maxDepth': instance.maxDepth,
      'maxItemsPerNode': instance.maxItemsPerNode,
    };

_CacheBudget _$CacheBudgetFromJson(Map<String, dynamic> json) => _CacheBudget(
  tier: $enumDecode(_$CacheTierEnumMap, json['tier']),
  maxBytes: (json['maxBytes'] as num).toInt(),
  maxEntries: (json['maxEntries'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$CacheBudgetToJson(_CacheBudget instance) =>
    <String, dynamic>{
      'tier': _$CacheTierEnumMap[instance.tier]!,
      'maxBytes': instance.maxBytes,
      'maxEntries': instance.maxEntries,
    };

const _$CacheTierEnumMap = {
  CacheTier.memory: 'memory',
  CacheTier.texture: 'texture',
  CacheTier.disk: 'disk',
};

_HistoryCompressionPolicy _$HistoryCompressionPolicyFromJson(
  Map<String, dynamic> json,
) => _HistoryCompressionPolicy(
  snapshotInterval: (json['snapshotInterval'] as num?)?.toInt() ?? 32,
  deltaEncoding: json['deltaEncoding'] as bool? ?? true,
  maxRetainedSnapshots: (json['maxRetainedSnapshots'] as num?)?.toInt() ?? 16,
);

Map<String, dynamic> _$HistoryCompressionPolicyToJson(
  _HistoryCompressionPolicy instance,
) => <String, dynamic>{
  'snapshotInterval': instance.snapshotInterval,
  'deltaEncoding': instance.deltaEncoding,
  'maxRetainedSnapshots': instance.maxRetainedSnapshots,
};

_LargeDocumentPolicy _$LargeDocumentPolicyFromJson(
  Map<String, dynamic> json,
) => _LargeDocumentPolicy(
  virtualizeAboveNodes: (json['virtualizeAboveNodes'] as num?)?.toInt() ?? 500,
  tileAboveDimension: (json['tileAboveDimension'] as num?)?.toInt() ?? 4096,
  streamAboveBytes: (json['streamAboveBytes'] as num?)?.toInt() ?? 268435456,
);

Map<String, dynamic> _$LargeDocumentPolicyToJson(
  _LargeDocumentPolicy instance,
) => <String, dynamic>{
  'virtualizeAboveNodes': instance.virtualizeAboveNodes,
  'tileAboveDimension': instance.tileAboveDimension,
  'streamAboveBytes': instance.streamAboveBytes,
};
