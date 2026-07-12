import 'package:core_interaction/core_interaction.dart';
import 'package:core_textile/core_textile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'workspace_viewport.freezed.dart';
part 'workspace_viewport.g.dart';

/// Persisted per-workspace view state (ADR-0014): each editing surface
/// remembers its camera (zoom/pan/rotation), selection, layer visibility
/// and active tool between sessions.
@freezed
abstract class WorkspaceViewportState with _$WorkspaceViewportState {
  const factory WorkspaceViewportState({
    /// Workspace surface key (`WorkspaceCategory.wireName` or tool surface).
    required String workspaceId,

    /// Artboard this view targets.
    required String artboardId,

    /// The camera: zoom, pan offset, rotation, sizes (frozen ADR-0003).
    required ViewportState viewport,

    /// Selected object ids at last use.
    @Default(SelectionState.empty) SelectionState selection,

    /// Layer ids explicitly hidden in this workspace view.
    @Default(<String>[]) List<String> hiddenLayerIds,

    /// Active tool at last use, if any.
    @JsonKey(fromJson: _toolFromJson, toJson: _toolToJson)
    FebricTool? activeTool,
  }) = _WorkspaceViewportState;

  factory WorkspaceViewportState.fromJson(Map<String, Object?> json) =>
      _$WorkspaceViewportStateFromJson(json);
}

FebricTool? _toolFromJson(String? wireName) =>
    wireName == null ? null : FebricTool.fromWireName(wireName);

String? _toolToJson(FebricTool? tool) => tool?.wireName;
