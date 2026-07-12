import 'package:core_document/src/model/artboard.dart';
import 'package:core_document/src/model/asset_registry.dart';
import 'package:core_document/src/model/document_metadata.dart';
import 'package:core_document/src/model/tool_state.dart';
import 'package:core_document/src/model/workspace_viewport.dart';
import 'package:core_layer/core_layer.dart';
import 'package:core_lock/core_lock.dart';
import 'package:core_mask/core_mask.dart';
import 'package:core_textile/core_textile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'document_command.freezed.dart';
part 'document_command.g.dart';

/// Who issued a command (frozen, append-only). Recorded in history;
/// `ai` additionally requires provenance (invariant I5).
enum CommandSource {
  user('user', 'User'),
  tool('tool', 'Tool'),
  ai('ai', 'AI'),
  plugin('plugin', 'Plugin'),
  system('system', 'System');

  const CommandSource(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static CommandSource fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () =>
          throw ArgumentError.value(name, 'name', 'Unknown CommandSource'),
    );
  }
}

/// THE typed command vocabulary of the Document Engine (frozen rule 2:
/// nothing edits the document directly — every change is one of these).
///
/// Extensibility without schema change (frozen rule 6): future tools, AI
/// operations and plugins issue [CustomCommand]s that persist into their
/// isolated extension namespace — the core vocabulary and document schema
/// stay untouched when a new tool ships.
@freezed
sealed class DocumentCommand with _$DocumentCommand {
  // ---- Artboards -----------------------------------------------------------
  const factory DocumentCommand.createArtboard({required Artboard artboard}) =
      CreateArtboardCommand;

  const factory DocumentCommand.deleteArtboard({required String artboardId}) =
      DeleteArtboardCommand;

  // ---- Layers --------------------------------------------------------------
  /// Inserts [layer] under [parentLayerId] (null = artboard layer root)
  /// at [index] (null = append).
  const factory DocumentCommand.createLayer({
    required String artboardId,
    String? parentLayerId,
    required LayerModel layer,
    int? index,
  }) = CreateLayerCommand;

  const factory DocumentCommand.deleteLayer({
    required String artboardId,
    required String layerId,
  }) = DeleteLayerCommand;

  const factory DocumentCommand.moveLayer({
    required String artboardId,
    required String layerId,
    required String newParentId,
    required int index,
  }) = MoveLayerCommand;

  const factory DocumentCommand.renameLayer({
    required String artboardId,
    required String layerId,
    required String name,
  }) = RenameLayerCommand;

  /// Sets (or removes, when [value] is null) one metadata entry on a
  /// layer. Also the canonical inverse carrier for colour/repeat commands.
  const factory DocumentCommand.setLayerMetadata({
    required String artboardId,
    required String layerId,
    required String key,
    Object? value,
  }) = SetLayerMetadataCommand;

  // ---- Assets ----------------------------------------------------------------
  const factory DocumentCommand.importAsset({required AssetRecord asset}) =
      ImportAssetCommand;

  const factory DocumentCommand.removeAsset({required String assetId}) =
      RemoveAssetCommand;

  // ---- Masks -----------------------------------------------------------------
  /// Sets/replaces the mask stack of a target (layer or node id).
  const factory DocumentCommand.applyMask({
    required String targetId,
    required MaskStack stack,
  }) = ApplyMaskCommand;

  const factory DocumentCommand.removeMask({required String targetId}) =
      RemoveMaskCommand;

  // ---- Document-level --------------------------------------------------------
  const factory DocumentCommand.updateMetadata({
    required DocumentMetadata metadata,
  }) = UpdateMetadataCommand;

  const factory DocumentCommand.updateSettings({
    required DocumentSettings settings,
  }) = UpdateSettingsCommand;

  const factory DocumentCommand.updateToolState({
    required ToolStateExtension state,
  }) = UpdateToolStateCommand;

  const factory DocumentCommand.updateViewport({
    required WorkspaceViewportState viewport,
  }) = UpdateViewportCommand;

  // ---- Textile operations (records; heavy math lands with its engine) --------
  /// Applies a colour operation outcome to a layer (`colour` metadata).
  const factory DocumentCommand.changeColour({
    required String artboardId,
    required String layerId,
    @JsonKey(fromJson: _colourOpFromJson, toJson: _colourOpToJson)
    required ColourOperation operation,
    required String colourHex,
  }) = ChangeColourCommand;

  /// Attaches a repeat specification to a layer (`repeat` metadata).
  const factory DocumentCommand.repeatPattern({
    required String artboardId,
    required String layerId,
    @JsonKey(fromJson: _repeatFromJson, toJson: _repeatToJson)
    required RepeatType repeat,
    @Default(<String, Object?>{}) Map<String, Object?> parameters,
  }) = RepeatPatternCommand;

  // ---- Locks (auditable, undoable) --------------------------------------------
  const factory DocumentCommand.setLock({required LockState lock}) =
      SetLockCommand;

  const factory DocumentCommand.releaseLock({
    required LockScope scope,
    String? targetId,
  }) = ReleaseLockCommand;

  // ---- Extension storage --------------------------------------------------------
  /// Replaces a plugin's whole namespace (plugins never touch core schema).
  const factory DocumentCommand.updatePluginData({
    required String pluginId,
    required Map<String, Object?> data,
  }) = UpdatePluginDataCommand;

  /// The frozen escape hatch: tool/AI/plugin commands that persist one
  /// entry inside the [namespace] extension storage. New capabilities ship
  /// without any schema change (frozen rule 6).
  const factory DocumentCommand.custom({
    required String namespace,
    required String kind,
    @Default(<String, Object?>{}) Map<String, Object?> payload,
    @Default(<String>[]) List<String> affectedIds,
  }) = CustomCommand;

  // ---- Design Tree (M3, ADR-0015 — appended; schema stays additive) --------
  /// Inserts [node] under [parentNodeId] (null = artboard design tree
  /// root) at [index] (null = append).
  const factory DocumentCommand.createDesignNode({
    required String artboardId,
    String? parentNodeId,
    required DesignNode node,
    int? index,
  }) = CreateDesignNodeCommand;

  const factory DocumentCommand.deleteDesignNode({
    required String artboardId,
    required String nodeId,
  }) = DeleteDesignNodeCommand;

  const factory DocumentCommand.moveDesignNode({
    required String artboardId,
    required String nodeId,
    required String newParentId,
    required int index,
  }) = MoveDesignNodeCommand;

  const factory DocumentCommand.renameDesignNode({
    required String artboardId,
    required String nodeId,
    required String name,
  }) = RenameDesignNodeCommand;

  const factory DocumentCommand.setNodeVisibility({
    required String artboardId,
    required String nodeId,
    required bool visible,
  }) = SetNodeVisibilityCommand;

  /// Toggles the node-level lock flag (authoritative locking remains the
  /// Lock Engine; a node-locked subtree additionally rejects structural
  /// edits — invariant I4 at the tree level).
  const factory DocumentCommand.setNodeLocked({
    required String artboardId,
    required String nodeId,
    required bool locked,
  }) = SetNodeLockedCommand;

  /// Sets (or removes, when [value] is null) one metadata entry on a
  /// design node — also the carrier for role/instance/repeat annotations.
  const factory DocumentCommand.setNodeMetadata({
    required String artboardId,
    required String nodeId,
    required String key,
    Object? value,
  }) = SetNodeMetadataCommand;

  /// Inserts [duplicate] (a pre-cloned subtree with fresh ids — see
  /// `DesignTreeOps.cloneWithIds`) as the next sibling of [sourceNodeId].
  const factory DocumentCommand.duplicateDesignNode({
    required String artboardId,
    required String sourceNodeId,
    required DesignNode duplicate,
  }) = DuplicateDesignNodeCommand;

  factory DocumentCommand.fromJson(Map<String, Object?> json) =>
      _$DocumentCommandFromJson(json);

  const DocumentCommand._();

  /// The lock check for this command (frozen rule 5: Lock Engine runs
  /// before anything else). Global project/document locks are stored with
  /// a null target and therefore match every query.
  ({LockScope scope, String? targetId}) get lockRequirement {
    return switch (this) {
      CreateArtboardCommand() ||
      DeleteArtboardCommand() ||
      UpdateMetadataCommand() ||
      UpdateSettingsCommand() ||
      ImportAssetCommand() ||
      RemoveAssetCommand() ||
      UpdatePluginDataCommand() ||
      CustomCommand() => (scope: LockScope.document, targetId: null),
      CreateLayerCommand(:final artboardId) => (
        scope: LockScope.layer,
        targetId: artboardId,
      ),
      DeleteLayerCommand(:final layerId) ||
      MoveLayerCommand(:final layerId) ||
      RenameLayerCommand(:final layerId) ||
      SetLayerMetadataCommand(:final layerId) ||
      ChangeColourCommand(:final layerId) ||
      RepeatPatternCommand(
        :final layerId,
      ) => (scope: LockScope.layer, targetId: layerId),
      ApplyMaskCommand(:final targetId) || RemoveMaskCommand(:final targetId) =>
        (scope: LockScope.mask, targetId: targetId),
      UpdateToolStateCommand(:final state) => (
        scope: LockScope.tool,
        targetId: state.toolId,
      ),
      UpdateViewportCommand(:final viewport) => (
        scope: LockScope.viewport,
        targetId: viewport.workspaceId,
      ),
      // Design Tree commands guard at object scope; global document/
      // project locks still match via the null-target rule + implication.
      CreateDesignNodeCommand(:final artboardId) => (
        scope: LockScope.object,
        targetId: artboardId,
      ),
      DuplicateDesignNodeCommand(:final sourceNodeId) => (
        scope: LockScope.object,
        targetId: sourceNodeId,
      ),
      DeleteDesignNodeCommand(:final nodeId) ||
      MoveDesignNodeCommand(:final nodeId) ||
      RenameDesignNodeCommand(:final nodeId) ||
      SetNodeVisibilityCommand(:final nodeId) ||
      SetNodeLockedCommand(:final nodeId) ||
      SetNodeMetadataCommand(
        :final nodeId,
      ) => (scope: LockScope.object, targetId: nodeId),
      // Lock governance commands are themselves gated only by a project
      // lock (checked via the document scope's implication chain is NOT
      // sufficient here — project is checked explicitly by the engine).
      SetLockCommand() ||
      ReleaseLockCommand() => (scope: LockScope.project, targetId: null),
    };
  }
}

ColourOperation _colourOpFromJson(String wireName) =>
    ColourOperation.fromWireName(wireName);

String _colourOpToJson(ColourOperation operation) => operation.wireName;

RepeatType _repeatFromJson(String wireName) =>
    RepeatType.fromWireName(wireName);

String _repeatToJson(RepeatType repeat) => repeat.wireName;
