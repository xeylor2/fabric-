// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hit_test.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HitTestQuery _$HitTestQueryFromJson(Map<String, dynamic> json) =>
    _HitTestQuery(
      screenPoint: Point2D.fromJson(
        json['screenPoint'] as Map<String, dynamic>,
      ),
      tolerance: (json['tolerance'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$HitTestQueryToJson(_HitTestQuery instance) =>
    <String, dynamic>{
      'screenPoint': instance.screenPoint.toJson(),
      'tolerance': instance.tolerance,
    };

_HitTestResult _$HitTestResultFromJson(Map<String, dynamic> json) =>
    _HitTestResult(
      kind: $enumDecode(_$HitTargetKindEnumMap, json['kind']),
      documentPoint: Point2D.fromJson(
        json['documentPoint'] as Map<String, dynamic>,
      ),
      semanticNodeId: json['semanticNodeId'] as String?,
      nodeType: _typeFromJson(json['nodeType'] as String?),
    );

Map<String, dynamic> _$HitTestResultToJson(_HitTestResult instance) =>
    <String, dynamic>{
      'kind': _$HitTargetKindEnumMap[instance.kind]!,
      'documentPoint': instance.documentPoint.toJson(),
      'semanticNodeId': instance.semanticNodeId,
      'nodeType': _typeToJson(instance.nodeType),
    };

const _$HitTargetKindEnumMap = {
  HitTargetKind.node: 'node',
  HitTargetKind.guide: 'guide',
  HitTargetKind.handle: 'handle',
  HitTargetKind.empty: 'empty',
};
