// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_usage_graph.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AssetUsage _$AssetUsageFromJson(Map<String, dynamic> json) => _AssetUsage(
  assetId: json['assetId'] as String,
  nodeId: json['nodeId'] as String,
  artboardId: json['artboardId'] as String,
  documentId: json['documentId'] as String,
);

Map<String, dynamic> _$AssetUsageToJson(_AssetUsage instance) =>
    <String, dynamic>{
      'assetId': instance.assetId,
      'nodeId': instance.nodeId,
      'artboardId': instance.artboardId,
      'documentId': instance.documentId,
    };

_AssetUsageGraph _$AssetUsageGraphFromJson(Map<String, dynamic> json) =>
    _AssetUsageGraph(
      usages:
          (json['usages'] as List<dynamic>?)
              ?.map((e) => AssetUsage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <AssetUsage>[],
    );

Map<String, dynamic> _$AssetUsageGraphToJson(_AssetUsageGraph instance) =>
    <String, dynamic>{
      'usages': instance.usages.map((e) => e.toJson()).toList(),
    };
