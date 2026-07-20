// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspection_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InspectionRegion _$InspectionRegionFromJson(
  Map<String, dynamic> json,
) => _InspectionRegion(
  id: json['id'] as String,
  kind: $enumDecode(_$InspectionRegionKindEnumMap, json['kind']),
  targetNodeIds:
      (json['targetNodeIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  maskIds:
      (json['maskIds'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  confidence: (json['confidence'] as num?)?.toDouble() ?? 1.0,
  metadata:
      json['metadata'] as Map<String, dynamic>? ?? const <String, Object?>{},
);

Map<String, dynamic> _$InspectionRegionToJson(_InspectionRegion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kind': _$InspectionRegionKindEnumMap[instance.kind]!,
      'targetNodeIds': instance.targetNodeIds,
      'maskIds': instance.maskIds,
      'confidence': instance.confidence,
      'metadata': instance.metadata,
    };

const _$InspectionRegionKindEnumMap = {
  InspectionRegionKind.printable: 'printable',
  InspectionRegionKind.editable: 'editable',
};

_StructureFinding _$StructureFindingFromJson(Map<String, dynamic> json) =>
    _StructureFinding(
      part: _partFromJson(json['part'] as String),
      nodeId: json['nodeId'] as String?,
      confidence: (json['confidence'] as num?)?.toDouble() ?? 1.0,
      metadata:
          json['metadata'] as Map<String, dynamic>? ??
          const <String, Object?>{},
    );

Map<String, dynamic> _$StructureFindingToJson(_StructureFinding instance) =>
    <String, dynamic>{
      'part': _partToJson(instance.part),
      'nodeId': instance.nodeId,
      'confidence': instance.confidence,
      'metadata': instance.metadata,
    };

_MotifFinding _$MotifFindingFromJson(
  Map<String, dynamic> json,
) => _MotifFinding(
  id: json['id'] as String,
  role: $enumDecode(_$MotifRoleEnumMap, json['role']),
  nodeId: json['nodeId'] as String?,
  maskIds:
      (json['maskIds'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  confidence: (json['confidence'] as num?)?.toDouble() ?? 1.0,
  metadata:
      json['metadata'] as Map<String, dynamic>? ?? const <String, Object?>{},
);

Map<String, dynamic> _$MotifFindingToJson(_MotifFinding instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role': _$MotifRoleEnumMap[instance.role]!,
      'nodeId': instance.nodeId,
      'maskIds': instance.maskIds,
      'confidence': instance.confidence,
      'metadata': instance.metadata,
    };

const _$MotifRoleEnumMap = {
  MotifRole.hero: 'hero',
  MotifRole.secondary: 'secondary',
  MotifRole.filler: 'filler',
};

_BorderFinding _$BorderFindingFromJson(
  Map<String, dynamic> json,
) => _BorderFinding(
  id: json['id'] as String,
  nodeId: json['nodeId'] as String?,
  maskIds:
      (json['maskIds'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  confidence: (json['confidence'] as num?)?.toDouble() ?? 1.0,
  metadata:
      json['metadata'] as Map<String, dynamic>? ?? const <String, Object?>{},
);

Map<String, dynamic> _$BorderFindingToJson(_BorderFinding instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nodeId': instance.nodeId,
      'maskIds': instance.maskIds,
      'confidence': instance.confidence,
      'metadata': instance.metadata,
    };

_InspectionReport _$InspectionReportFromJson(
  Map<String, dynamic> json,
) => _InspectionReport(
  id: json['id'] as String,
  operation: _operationFromJson(json['operation'] as String),
  garment: _garmentFromJson(json['garment'] as String?),
  garmentConfidence: (json['garmentConfidence'] as num?)?.toDouble() ?? 1.0,
  fabricGuess: json['fabricGuess'] as String?,
  structure:
      (json['structure'] as List<dynamic>?)
          ?.map((e) => StructureFinding.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <StructureFinding>[],
  pattern: _repeatFromJson(json['pattern'] as String?),
  motifs:
      (json['motifs'] as List<dynamic>?)
          ?.map((e) => MotifFinding.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <MotifFinding>[],
  borders:
      (json['borders'] as List<dynamic>?)
          ?.map((e) => BorderFinding.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <BorderFinding>[],
  palette:
      (json['palette'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  regions:
      (json['regions'] as List<dynamic>?)
          ?.map((e) => InspectionRegion.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <InspectionRegion>[],
  treeProposal: json['treeProposal'] == null
      ? null
      : DesignNode.fromJson(json['treeProposal'] as Map<String, dynamic>),
  promptHash: json['promptHash'] as String,
  templateId: json['templateId'] as String?,
  provider: _providerFromJson(json['provider'] as String),
  model: json['model'] as String,
  constraintVersion: json['constraintVersion'] as String,
  toolVersion: json['toolVersion'] as String,
  metadata:
      json['metadata'] as Map<String, dynamic>? ?? const <String, Object?>{},
);

Map<String, dynamic> _$InspectionReportToJson(_InspectionReport instance) =>
    <String, dynamic>{
      'id': instance.id,
      'operation': _operationToJson(instance.operation),
      'garment': _garmentToJson(instance.garment),
      'garmentConfidence': instance.garmentConfidence,
      'fabricGuess': instance.fabricGuess,
      'structure': instance.structure.map((e) => e.toJson()).toList(),
      'pattern': _repeatToJson(instance.pattern),
      'motifs': instance.motifs.map((e) => e.toJson()).toList(),
      'borders': instance.borders.map((e) => e.toJson()).toList(),
      'palette': instance.palette,
      'regions': instance.regions.map((e) => e.toJson()).toList(),
      'treeProposal': instance.treeProposal?.toJson(),
      'promptHash': instance.promptHash,
      'templateId': instance.templateId,
      'provider': _providerToJson(instance.provider),
      'model': instance.model,
      'constraintVersion': instance.constraintVersion,
      'toolVersion': instance.toolVersion,
      'metadata': instance.metadata,
    };
