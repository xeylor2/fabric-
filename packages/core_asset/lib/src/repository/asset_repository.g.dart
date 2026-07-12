// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AssetEngineState _$AssetEngineStateFromJson(Map<String, dynamic> json) =>
    _AssetEngineState(
      projectId: json['projectId'] as String,
      catalogue: json['catalogue'] == null
          ? AssetCatalogue.empty
          : AssetCatalogue.fromJson(json['catalogue'] as Map<String, dynamic>),
      graph: json['graph'] == null
          ? AssetUsageGraph.empty
          : AssetUsageGraph.fromJson(json['graph'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AssetEngineStateToJson(_AssetEngineState instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
      'catalogue': instance.catalogue.toJson(),
      'graph': instance.graph.toJson(),
    };
