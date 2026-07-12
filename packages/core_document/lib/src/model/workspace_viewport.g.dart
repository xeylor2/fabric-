// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspace_viewport.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WorkspaceViewportState _$WorkspaceViewportStateFromJson(
  Map<String, dynamic> json,
) => _WorkspaceViewportState(
  workspaceId: json['workspaceId'] as String,
  artboardId: json['artboardId'] as String,
  viewport: ViewportState.fromJson(json['viewport'] as Map<String, dynamic>),
  selection: json['selection'] == null
      ? SelectionState.empty
      : SelectionState.fromJson(json['selection'] as Map<String, dynamic>),
  hiddenLayerIds:
      (json['hiddenLayerIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  activeTool: _toolFromJson(json['activeTool'] as String?),
);

Map<String, dynamic> _$WorkspaceViewportStateToJson(
  _WorkspaceViewportState instance,
) => <String, dynamic>{
  'workspaceId': instance.workspaceId,
  'artboardId': instance.artboardId,
  'viewport': instance.viewport.toJson(),
  'selection': instance.selection.toJson(),
  'hiddenLayerIds': instance.hiddenLayerIds,
  'activeTool': _toolToJson(instance.activeTool),
};
