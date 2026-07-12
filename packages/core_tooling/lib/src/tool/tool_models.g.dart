// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tool_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ToolMetadata _$ToolMetadataFromJson(Map<String, dynamic> json) =>
    _ToolMetadata(
      tool: _toolFromJson(json['tool'] as String),
      version: json['version'] as String,
      aiBacked: json['aiBacked'] as bool? ?? false,
      metadata:
          json['metadata'] as Map<String, dynamic>? ??
          const <String, Object?>{},
    );

Map<String, dynamic> _$ToolMetadataToJson(_ToolMetadata instance) =>
    <String, dynamic>{
      'tool': _toolToJson(instance.tool),
      'version': instance.version,
      'aiBacked': instance.aiBacked,
      'metadata': instance.metadata,
    };

_ToolContext _$ToolContextFromJson(Map<String, dynamic> json) => _ToolContext(
  viewport: ViewportState.fromJson(json['viewport'] as Map<String, dynamic>),
  selection: json['selection'] == null
      ? SelectionState.empty
      : SelectionState.fromJson(json['selection'] as Map<String, dynamic>),
  locks: json['locks'] == null
      ? LockSet.none
      : LockSet.fromJson(json['locks'] as Map<String, dynamic>),
  regionSelection: json['regionSelection'] == null
      ? null
      : SelectionSnapshot.fromJson(
          json['regionSelection'] as Map<String, dynamic>,
        ),
  config: json['config'] as Map<String, dynamic>? ?? const <String, Object?>{},
);

Map<String, dynamic> _$ToolContextToJson(_ToolContext instance) =>
    <String, dynamic>{
      'viewport': instance.viewport.toJson(),
      'selection': instance.selection.toJson(),
      'locks': instance.locks.toJson(),
      'regionSelection': instance.regionSelection?.toJson(),
      'config': instance.config,
    };

_ToolRequest _$ToolRequestFromJson(Map<String, dynamic> json) => _ToolRequest(
  targetIds:
      (json['targetIds'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  region: json['region'] == null
      ? null
      : Rect2D.fromJson(json['region'] as Map<String, dynamic>),
  parameters:
      json['parameters'] as Map<String, dynamic>? ?? const <String, Object?>{},
  seed: (json['seed'] as num?)?.toInt(),
);

Map<String, dynamic> _$ToolRequestToJson(_ToolRequest instance) =>
    <String, dynamic>{
      'targetIds': instance.targetIds,
      'region': instance.region?.toJson(),
      'parameters': instance.parameters,
      'seed': instance.seed,
    };

_ToolPreview _$ToolPreviewFromJson(Map<String, dynamic> json) => _ToolPreview(
  previewId: json['previewId'] as String,
  description: json['description'] as String,
  payload:
      json['payload'] as Map<String, dynamic>? ?? const <String, Object?>{},
);

Map<String, dynamic> _$ToolPreviewToJson(_ToolPreview instance) =>
    <String, dynamic>{
      'previewId': instance.previewId,
      'description': instance.description,
      'payload': instance.payload,
    };

_ToolResult _$ToolResultFromJson(Map<String, dynamic> json) => _ToolResult(
  status: $enumDecode(_$ToolResultStatusEnumMap, json['status']),
  message: json['message'] as String?,
  previewId: json['previewId'] as String?,
  payload:
      json['payload'] as Map<String, dynamic>? ?? const <String, Object?>{},
);

Map<String, dynamic> _$ToolResultToJson(_ToolResult instance) =>
    <String, dynamic>{
      'status': _$ToolResultStatusEnumMap[instance.status]!,
      'message': instance.message,
      'previewId': instance.previewId,
      'payload': instance.payload,
    };

const _$ToolResultStatusEnumMap = {
  ToolResultStatus.success: 'success',
  ToolResultStatus.cancelled: 'cancelled',
  ToolResultStatus.rejected: 'rejected',
  ToolResultStatus.failed: 'failed',
};

_ToolHistoryEntry _$ToolHistoryEntryFromJson(Map<String, dynamic> json) =>
    _ToolHistoryEntry(
      id: json['id'] as String,
      description: json['description'] as String,
      metadata:
          json['metadata'] as Map<String, dynamic>? ??
          const <String, Object?>{},
    );

Map<String, dynamic> _$ToolHistoryEntryToJson(_ToolHistoryEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'metadata': instance.metadata,
    };

_ToolHistory _$ToolHistoryFromJson(Map<String, dynamic> json) => _ToolHistory(
  entries:
      (json['entries'] as List<dynamic>?)
          ?.map((e) => ToolHistoryEntry.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ToolHistoryEntry>[],
  cursor: (json['cursor'] as num?)?.toInt() ?? -1,
);

Map<String, dynamic> _$ToolHistoryToJson(_ToolHistory instance) =>
    <String, dynamic>{
      'entries': instance.entries.map((e) => e.toJson()).toList(),
      'cursor': instance.cursor,
    };
