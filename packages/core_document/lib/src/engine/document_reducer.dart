import 'package:core_document/src/commands/command_result.dart';
import 'package:core_document/src/commands/document_command.dart';
import 'package:core_document/src/model/artboard.dart';
import 'package:core_document/src/model/asset_registry.dart';
import 'package:core_document/src/model/febric_document.dart';
import 'package:core_document/src/model/tool_state.dart';
import 'package:core_document/src/model/workspace_viewport.dart';
import 'package:core_document/src/tree/design_tree_ops.dart';
import 'package:core_document/src/tree/node_capabilities.dart';
import 'package:core_layer/core_layer.dart';
import 'package:core_textile/core_textile.dart';

/// Successful reduction: the next document, the exact inverse command, and
/// the ids the command touched.
final class ReduceSuccess {
  const ReduceSuccess({
    required this.document,
    required this.inverse,
    required this.affectedIds,
  });

  final FebricDocument document;
  final DocumentCommand inverse;
  final List<String> affectedIds;
}

/// Failed reduction: the document is untouched.
final class ReduceFailure {
  const ReduceFailure(this.reason, [this.detail]);

  final CommandRejectionReason reason;
  final String? detail;
}

/// The pure command reducer of the Document Engine (frozen rule 2).
///
/// `apply` is a total function `(document, command) → success | failure`;
/// it performs structural validation, computes the next immutable document
/// and the exact inverse command. It never touches locks, history, clocks
/// or ids — those belong to the engine pipeline around it.
abstract final class DocumentReducer {
  static Object apply(FebricDocument doc, DocumentCommand command) {
    return switch (command) {
      CreateArtboardCommand(:final artboard) => _createArtboard(doc, artboard),
      DeleteArtboardCommand(:final artboardId) => _deleteArtboard(
        doc,
        artboardId,
      ),
      CreateLayerCommand() => _createLayer(doc, command),
      DeleteLayerCommand() => _deleteLayer(doc, command),
      MoveLayerCommand() => _moveLayer(doc, command),
      RenameLayerCommand() => _renameLayer(doc, command),
      SetLayerMetadataCommand() => _setLayerMetadata(doc, command),
      ImportAssetCommand(:final asset) => _importAsset(doc, asset),
      RemoveAssetCommand(:final assetId) => _removeAsset(doc, assetId),
      ApplyMaskCommand() => _applyMask(doc, command),
      RemoveMaskCommand(:final targetId) => _removeMask(doc, targetId),
      UpdateMetadataCommand(:final metadata) => ReduceSuccess(
        document: doc.copyWith(metadata: metadata),
        inverse: DocumentCommand.updateMetadata(metadata: doc.metadata),
        affectedIds: [doc.id.value],
      ),
      UpdateSettingsCommand(:final settings) => ReduceSuccess(
        document: doc.copyWith(settings: settings),
        inverse: DocumentCommand.updateSettings(settings: doc.settings),
        affectedIds: [doc.id.value],
      ),
      UpdateToolStateCommand(:final state) => _updateToolState(doc, state),
      UpdateViewportCommand(:final viewport) => _updateViewport(doc, viewport),
      ChangeColourCommand() => _changeColour(doc, command),
      RepeatPatternCommand() => _repeatPattern(doc, command),
      SetLockCommand(:final lock) => ReduceSuccess(
        document: doc.copyWith(locks: doc.locks.withLock(lock)),
        inverse: DocumentCommand.releaseLock(
          scope: lock.scope,
          targetId: lock.targetId,
        ),
        affectedIds: [if (lock.targetId != null) lock.targetId!],
      ),
      ReleaseLockCommand() => _releaseLock(doc, command),
      UpdatePluginDataCommand() => _updatePluginData(doc, command),
      CustomCommand() => _custom(doc, command),
      CreateDesignNodeCommand() => _createDesignNode(doc, command),
      DeleteDesignNodeCommand() => _deleteDesignNode(doc, command),
      MoveDesignNodeCommand() => _moveDesignNode(doc, command),
      RenameDesignNodeCommand() => _renameDesignNode(doc, command),
      SetNodeVisibilityCommand() => _setNodeVisibility(doc, command),
      SetNodeLockedCommand() => _setNodeLocked(doc, command),
      SetNodeMetadataCommand() => _setNodeMetadata(doc, command),
      DuplicateDesignNodeCommand() => _duplicateDesignNode(doc, command),
    };
  }

  // ---- artboards -------------------------------------------------------------

  static Object _createArtboard(FebricDocument doc, Artboard artboard) {
    if (doc.artboardById(artboard.id) != null) {
      return ReduceFailure(
        CommandRejectionReason.invalid,
        'Artboard ${artboard.id} already exists',
      );
    }
    return ReduceSuccess(
      document: doc.copyWith(artboards: [...doc.artboards, artboard]),
      inverse: DocumentCommand.deleteArtboard(artboardId: artboard.id),
      affectedIds: [artboard.id],
    );
  }

  static Object _deleteArtboard(FebricDocument doc, String artboardId) {
    final artboard = doc.artboardById(artboardId);
    if (artboard == null) {
      return const ReduceFailure(CommandRejectionReason.notFound);
    }
    return ReduceSuccess(
      document: doc.copyWith(
        artboards: [
          for (final a in doc.artboards)
            if (a.id != artboardId) a,
        ],
      ),
      inverse: DocumentCommand.createArtboard(artboard: artboard),
      affectedIds: [artboardId],
    );
  }

  // ---- layer tree helpers ------------------------------------------------------

  static LayerModel? _findLayer(LayerModel root, String id) =>
      root.findById(id);

  /// Replaces the subtree rooted at [id] using [transform]; null [transform]
  /// result removes the subtree. Returns null when [id] is absent.
  static LayerModel? _rewrite(
    LayerModel node,
    String id,
    LayerModel? Function(LayerModel) transform,
  ) {
    if (node.id == id) {
      return transform(node);
    }
    var changed = false;
    final children = <LayerModel>[];
    for (final child in node.children) {
      final result = _rewrite(child, id, transform);
      if (!identical(result, child)) {
        changed = true;
      }
      if (result != null) {
        children.add(result);
      }
    }
    if (!changed) {
      // Absent id leaves the tree identical; signal via sentinel identity.
      final present = node.findById(id) != null;
      return present ? node.copyWith(children: children) : node;
    }
    return node.copyWith(children: children);
  }

  static FebricDocument _withLayerRoot(
    FebricDocument doc,
    String artboardId,
    LayerModel newRoot,
  ) {
    return doc.copyWith(
      artboards: [
        for (final a in doc.artboards)
          if (a.id == artboardId) a.copyWith(layerRoot: newRoot) else a,
      ],
    );
  }

  static Object _createLayer(FebricDocument doc, CreateLayerCommand command) {
    final artboard = doc.artboardById(command.artboardId);
    if (artboard == null) {
      return const ReduceFailure(
        CommandRejectionReason.notFound,
        'Artboard not found',
      );
    }
    if (artboard.layerRoot.findById(command.layer.id) != null) {
      return ReduceFailure(
        CommandRejectionReason.invalid,
        'Layer ${command.layer.id} already exists',
      );
    }
    final parentId = command.parentLayerId ?? artboard.layerRoot.id;
    final parent = artboard.layerRoot.findById(parentId);
    if (parent == null) {
      return const ReduceFailure(
        CommandRejectionReason.notFound,
        'Parent layer not found',
      );
    }
    final index = command.index ?? parent.children.length;
    if (index < 0 || index > parent.children.length) {
      return const ReduceFailure(CommandRejectionReason.invalid, 'Bad index');
    }
    final newRoot = _rewrite(artboard.layerRoot, parentId, (p) {
      final children = [...p.children]..insert(index, command.layer);
      return p.copyWith(children: children);
    })!;
    return ReduceSuccess(
      document: _withLayerRoot(doc, command.artboardId, newRoot),
      inverse: DocumentCommand.deleteLayer(
        artboardId: command.artboardId,
        layerId: command.layer.id,
      ),
      affectedIds: [command.layer.id, parentId],
    );
  }

  static ({String parentId, int index})? _locate(
    LayerModel root,
    String layerId,
  ) {
    for (final node in root.descendantsAndSelf) {
      for (var i = 0; i < node.children.length; i++) {
        if (node.children[i].id == layerId) {
          return (parentId: node.id, index: i);
        }
      }
    }
    return null;
  }

  static Object _deleteLayer(FebricDocument doc, DeleteLayerCommand command) {
    final artboard = doc.artboardById(command.artboardId);
    if (artboard == null) {
      return const ReduceFailure(CommandRejectionReason.notFound);
    }
    if (command.layerId == artboard.layerRoot.id) {
      return const ReduceFailure(
        CommandRejectionReason.invalid,
        'The layer root cannot be deleted',
      );
    }
    final subtree = _findLayer(artboard.layerRoot, command.layerId);
    final location = _locate(artboard.layerRoot, command.layerId);
    if (subtree == null || location == null) {
      return const ReduceFailure(CommandRejectionReason.notFound);
    }
    final newRoot = _rewrite(artboard.layerRoot, command.layerId, (_) => null)!;
    return ReduceSuccess(
      document: _withLayerRoot(doc, command.artboardId, newRoot),
      inverse: DocumentCommand.createLayer(
        artboardId: command.artboardId,
        parentLayerId: location.parentId,
        layer: subtree,
        index: location.index,
      ),
      affectedIds: [command.layerId, location.parentId],
    );
  }

  static Object _moveLayer(FebricDocument doc, MoveLayerCommand command) {
    final artboard = doc.artboardById(command.artboardId);
    if (artboard == null) {
      return const ReduceFailure(CommandRejectionReason.notFound);
    }
    final subtree = _findLayer(artboard.layerRoot, command.layerId);
    final location = _locate(artboard.layerRoot, command.layerId);
    if (subtree == null || location == null) {
      return const ReduceFailure(CommandRejectionReason.notFound);
    }
    if (subtree.findById(command.newParentId) != null) {
      return const ReduceFailure(
        CommandRejectionReason.invalid,
        'Cannot move a layer into its own subtree',
      );
    }
    final detached = _rewrite(
      artboard.layerRoot,
      command.layerId,
      (_) => null,
    )!;
    final newParent = detached.findById(command.newParentId);
    if (newParent == null) {
      return const ReduceFailure(
        CommandRejectionReason.notFound,
        'New parent not found',
      );
    }
    if (command.index < 0 || command.index > newParent.children.length) {
      return const ReduceFailure(CommandRejectionReason.invalid, 'Bad index');
    }
    final newRoot = _rewrite(detached, command.newParentId, (p) {
      final children = [...p.children]..insert(command.index, subtree);
      return p.copyWith(children: children);
    })!;
    return ReduceSuccess(
      document: _withLayerRoot(doc, command.artboardId, newRoot),
      inverse: DocumentCommand.moveLayer(
        artboardId: command.artboardId,
        layerId: command.layerId,
        newParentId: location.parentId,
        index: location.index,
      ),
      affectedIds: [command.layerId, location.parentId, command.newParentId],
    );
  }

  static Object _renameLayer(FebricDocument doc, RenameLayerCommand command) {
    final artboard = doc.artboardById(command.artboardId);
    final layer = artboard?.layerRoot.findById(command.layerId);
    if (artboard == null || layer == null) {
      return const ReduceFailure(CommandRejectionReason.notFound);
    }
    if (command.name.trim().isEmpty) {
      return const ReduceFailure(
        CommandRejectionReason.invalid,
        'Layer name cannot be empty',
      );
    }
    final newRoot = _rewrite(
      artboard.layerRoot,
      command.layerId,
      (l) => l.copyWith(name: command.name),
    )!;
    return ReduceSuccess(
      document: _withLayerRoot(doc, command.artboardId, newRoot),
      inverse: DocumentCommand.renameLayer(
        artboardId: command.artboardId,
        layerId: command.layerId,
        name: layer.name,
      ),
      affectedIds: [command.layerId],
    );
  }

  static Object _setLayerMetadata(
    FebricDocument doc,
    SetLayerMetadataCommand command,
  ) {
    final artboard = doc.artboardById(command.artboardId);
    final layer = artboard?.layerRoot.findById(command.layerId);
    if (artboard == null || layer == null) {
      return const ReduceFailure(CommandRejectionReason.notFound);
    }
    final previous = layer.metadata[command.key];
    final metadata = {...layer.metadata};
    if (command.value == null) {
      metadata.remove(command.key);
    } else {
      metadata[command.key] = command.value;
    }
    final newRoot = _rewrite(
      artboard.layerRoot,
      command.layerId,
      (l) => l.copyWith(metadata: metadata),
    )!;
    return ReduceSuccess(
      document: _withLayerRoot(doc, command.artboardId, newRoot),
      inverse: DocumentCommand.setLayerMetadata(
        artboardId: command.artboardId,
        layerId: command.layerId,
        key: command.key,
        value: previous,
      ),
      affectedIds: [command.layerId],
    );
  }

  // ---- assets / masks ----------------------------------------------------------

  static Object _importAsset(FebricDocument doc, AssetRecord asset) {
    if (doc.assets.byId(asset.id) != null) {
      return const ReduceFailure(
        CommandRejectionReason.invalid,
        'Asset already exists',
      );
    }
    return ReduceSuccess(
      document: doc.copyWith(assets: doc.assets.withAsset(asset)),
      inverse: DocumentCommand.removeAsset(assetId: asset.id),
      affectedIds: [asset.id],
    );
  }

  static Object _removeAsset(FebricDocument doc, String assetId) {
    final existing = doc.assets.byId(assetId);
    if (existing == null) {
      return const ReduceFailure(CommandRejectionReason.notFound);
    }
    return ReduceSuccess(
      document: doc.copyWith(assets: doc.assets.withoutAsset(assetId)),
      inverse: DocumentCommand.importAsset(asset: existing),
      affectedIds: [assetId],
    );
  }

  static Object _applyMask(FebricDocument doc, ApplyMaskCommand command) {
    final previous = doc.masks[command.targetId];
    return ReduceSuccess(
      document: doc.copyWith(
        masks: {...doc.masks, command.targetId: command.stack},
      ),
      inverse: previous == null
          ? DocumentCommand.removeMask(targetId: command.targetId)
          : DocumentCommand.applyMask(
              targetId: command.targetId,
              stack: previous,
            ),
      affectedIds: [command.targetId],
    );
  }

  static Object _removeMask(FebricDocument doc, String targetId) {
    final existing = doc.masks[targetId];
    if (existing == null) {
      return const ReduceFailure(CommandRejectionReason.notFound);
    }
    return ReduceSuccess(
      document: doc.copyWith(masks: {...doc.masks}..remove(targetId)),
      inverse: DocumentCommand.applyMask(targetId: targetId, stack: existing),
      affectedIds: [targetId],
    );
  }

  // ---- registries ---------------------------------------------------------------

  static Object _updateToolState(FebricDocument doc, ToolStateExtension state) {
    final previous = doc.toolStates[state.toolId];
    return ReduceSuccess(
      document: doc.copyWith(
        toolStates: {...doc.toolStates, state.toolId: state},
      ),
      inverse: DocumentCommand.updateToolState(
        state: previous ?? state.copyWith(data: const {}),
      ),
      affectedIds: [state.toolId],
    );
  }

  static Object _updateViewport(
    FebricDocument doc,
    WorkspaceViewportState viewport,
  ) {
    final previous = doc.viewports[viewport.workspaceId];
    return ReduceSuccess(
      document: doc.copyWith(
        viewports: {...doc.viewports, viewport.workspaceId: viewport},
      ),
      inverse: DocumentCommand.updateViewport(viewport: previous ?? viewport),
      affectedIds: [viewport.workspaceId],
    );
  }

  static Object _changeColour(FebricDocument doc, ChangeColourCommand command) {
    return _delegateLayerMetadata(
      doc,
      command.artboardId,
      command.layerId,
      key: 'colour',
      value: command.colourHex,
    );
  }

  static Object _repeatPattern(
    FebricDocument doc,
    RepeatPatternCommand command,
  ) {
    return _delegateLayerMetadata(
      doc,
      command.artboardId,
      command.layerId,
      key: 'repeat',
      value: {'type': command.repeat.wireName, ...command.parameters},
    );
  }

  static Object _delegateLayerMetadata(
    FebricDocument doc,
    String artboardId,
    String layerId, {
    required String key,
    required Object? value,
  }) {
    return _setLayerMetadata(
      doc,
      SetLayerMetadataCommand(
        artboardId: artboardId,
        layerId: layerId,
        key: key,
        value: value,
      ),
    );
  }

  static Object _releaseLock(FebricDocument doc, ReleaseLockCommand command) {
    final existing = doc.locks.locks
        .where(
          (l) => l.scope == command.scope && l.targetId == command.targetId,
        )
        .toList();
    if (existing.isEmpty) {
      return const ReduceFailure(CommandRejectionReason.notFound);
    }
    return ReduceSuccess(
      document: doc.copyWith(
        locks: doc.locks.withoutLock(command.scope, targetId: command.targetId),
      ),
      inverse: DocumentCommand.setLock(lock: existing.first),
      affectedIds: [if (command.targetId != null) command.targetId!],
    );
  }

  static Object _updatePluginData(
    FebricDocument doc,
    UpdatePluginDataCommand command,
  ) {
    final previous = doc.pluginData[command.pluginId] ?? const {};
    return ReduceSuccess(
      document: doc.copyWith(
        pluginData: {...doc.pluginData, command.pluginId: command.data},
      ),
      inverse: DocumentCommand.updatePluginData(
        pluginId: command.pluginId,
        data: previous,
      ),
      affectedIds: [command.pluginId],
    );
  }

  static Object _custom(FebricDocument doc, CustomCommand command) {
    final namespace = doc.pluginData[command.namespace] ?? const {};
    final previous = namespace[command.kind];
    final updated = {...namespace, command.kind: command.payload};
    return ReduceSuccess(
      document: doc.copyWith(
        pluginData: {...doc.pluginData, command.namespace: updated},
      ),
      inverse: DocumentCommand.custom(
        namespace: command.namespace,
        kind: command.kind,
        payload: previous is Map<String, Object?> ? previous : const {},
        affectedIds: command.affectedIds,
      ),
      affectedIds: command.affectedIds,
    );
  }

  // ---- design tree (M3, ADR-0015) --------------------------------------------
  // Same discipline as layers: structural validation, exact inverses, and
  // node-lock enforcement — a locked node or locked ancestor rejects
  // structural edits (invariant I4 at tree level); the only edit a locked
  // node accepts is unlocking itself.

  static FebricDocument _withDesignRoot(
    FebricDocument doc,
    String artboardId,
    DesignNode newRoot,
  ) {
    return doc.copyWith(
      artboards: [
        for (final a in doc.artboards)
          if (a.id == artboardId) a.copyWith(designTreeRoot: newRoot) else a,
      ],
    );
  }

  /// Whether [nodeId] or any of its ancestors carries the node lock flag.
  static bool _nodeLockedInPath(DesignNode root, String nodeId) {
    bool walk(DesignNode node, bool ancestorLocked) {
      final locked = ancestorLocked || node.locked;
      if (node.id == nodeId) {
        return locked;
      }
      for (final child in node.children) {
        if (child.findById(nodeId) != null) {
          return walk(child, locked);
        }
      }
      return false;
    }

    return walk(root, false);
  }

  static Object _createDesignNode(
    FebricDocument doc,
    CreateDesignNodeCommand command,
  ) {
    final artboard = doc.artboardById(command.artboardId);
    if (artboard == null) {
      return const ReduceFailure(
        CommandRejectionReason.notFound,
        'Artboard not found',
      );
    }
    final root = artboard.designTreeRoot;
    if (root.findById(command.node.id) != null) {
      return ReduceFailure(
        CommandRejectionReason.invalid,
        'Design node ${command.node.id} already exists',
      );
    }
    for (final descendant in command.node.descendantsAndSelf) {
      if (root.findById(descendant.id) != null) {
        return ReduceFailure(
          CommandRejectionReason.invalid,
          'Subtree id ${descendant.id} already exists in the tree',
        );
      }
    }
    final parentId = command.parentNodeId ?? root.id;
    final parent = root.findById(parentId);
    if (parent == null) {
      return const ReduceFailure(
        CommandRejectionReason.notFound,
        'Parent design node not found',
      );
    }
    if (_nodeLockedInPath(root, parentId)) {
      return const ReduceFailure(
        CommandRejectionReason.locked,
        'Parent design node is locked',
      );
    }
    final index = command.index ?? parent.children.length;
    if (index < 0 || index > parent.children.length) {
      return const ReduceFailure(CommandRejectionReason.invalid, 'Bad index');
    }
    final newRoot = DesignTreeOps.rewrite(root, parentId, (p) {
      final children = [...p.children]..insert(index, command.node);
      return p.copyWith(children: children);
    })!;
    return ReduceSuccess(
      document: _withDesignRoot(doc, command.artboardId, newRoot),
      inverse: DocumentCommand.deleteDesignNode(
        artboardId: command.artboardId,
        nodeId: command.node.id,
      ),
      affectedIds: [command.node.id, parentId],
    );
  }

  static Object _deleteDesignNode(
    FebricDocument doc,
    DeleteDesignNodeCommand command,
  ) {
    final artboard = doc.artboardById(command.artboardId);
    if (artboard == null) {
      return const ReduceFailure(CommandRejectionReason.notFound);
    }
    final root = artboard.designTreeRoot;
    if (command.nodeId == root.id) {
      return const ReduceFailure(
        CommandRejectionReason.invalid,
        'The design tree root cannot be deleted',
      );
    }
    final subtree = root.findById(command.nodeId);
    final location = DesignTreeOps.locate(root, command.nodeId);
    if (subtree == null || location == null) {
      return const ReduceFailure(CommandRejectionReason.notFound);
    }
    if (_nodeLockedInPath(root, command.nodeId)) {
      return const ReduceFailure(
        CommandRejectionReason.locked,
        'Design node is locked',
      );
    }
    final newRoot = DesignTreeOps.rewrite(root, command.nodeId, (_) => null)!;
    return ReduceSuccess(
      document: _withDesignRoot(doc, command.artboardId, newRoot),
      inverse: DocumentCommand.createDesignNode(
        artboardId: command.artboardId,
        parentNodeId: location.parentId,
        node: subtree,
        index: location.index,
      ),
      affectedIds: [command.nodeId, location.parentId],
    );
  }

  static Object _moveDesignNode(
    FebricDocument doc,
    MoveDesignNodeCommand command,
  ) {
    final artboard = doc.artboardById(command.artboardId);
    if (artboard == null) {
      return const ReduceFailure(CommandRejectionReason.notFound);
    }
    final root = artboard.designTreeRoot;
    final subtree = root.findById(command.nodeId);
    final location = DesignTreeOps.locate(root, command.nodeId);
    if (subtree == null || location == null) {
      return const ReduceFailure(CommandRejectionReason.notFound);
    }
    if (subtree.findById(command.newParentId) != null) {
      return const ReduceFailure(
        CommandRejectionReason.invalid,
        'Cannot move a design node into its own subtree',
      );
    }
    if (_nodeLockedInPath(root, command.nodeId) ||
        _nodeLockedInPath(root, command.newParentId)) {
      return const ReduceFailure(
        CommandRejectionReason.locked,
        'Design node or destination is locked',
      );
    }
    final detached = DesignTreeOps.rewrite(root, command.nodeId, (_) => null)!;
    final newParent = detached.findById(command.newParentId);
    if (newParent == null) {
      return const ReduceFailure(
        CommandRejectionReason.notFound,
        'New parent not found',
      );
    }
    if (command.index < 0 || command.index > newParent.children.length) {
      return const ReduceFailure(CommandRejectionReason.invalid, 'Bad index');
    }
    final newRoot = DesignTreeOps.rewrite(detached, command.newParentId, (p) {
      final children = [...p.children]..insert(command.index, subtree);
      return p.copyWith(children: children);
    })!;
    return ReduceSuccess(
      document: _withDesignRoot(doc, command.artboardId, newRoot),
      inverse: DocumentCommand.moveDesignNode(
        artboardId: command.artboardId,
        nodeId: command.nodeId,
        newParentId: location.parentId,
        index: location.index,
      ),
      affectedIds: [command.nodeId, location.parentId, command.newParentId],
    );
  }

  static Object _renameDesignNode(
    FebricDocument doc,
    RenameDesignNodeCommand command,
  ) {
    return _mutateNode(
      doc,
      command.artboardId,
      command.nodeId,
      validate: (node) {
        if (command.name.trim().isEmpty) {
          return const ReduceFailure(
            CommandRejectionReason.invalid,
            'Design node name cannot be empty',
          );
        }
        return _requireCapability(node, NodeCapability.rename);
      },
      transform: (node) => node.copyWith(name: command.name),
      inverse: (node) => DocumentCommand.renameDesignNode(
        artboardId: command.artboardId,
        nodeId: command.nodeId,
        name: node.name,
      ),
    );
  }

  static Object _setNodeVisibility(
    FebricDocument doc,
    SetNodeVisibilityCommand command,
  ) {
    return _mutateNode(
      doc,
      command.artboardId,
      command.nodeId,
      validate: (node) => _requireCapability(node, NodeCapability.hide),
      transform: (node) => node.copyWith(visible: command.visible),
      inverse: (node) => DocumentCommand.setNodeVisibility(
        artboardId: command.artboardId,
        nodeId: command.nodeId,
        visible: node.visible,
      ),
    );
  }

  static Object _setNodeLocked(
    FebricDocument doc,
    SetNodeLockedCommand command,
  ) {
    final artboard = doc.artboardById(command.artboardId);
    if (artboard == null) {
      return const ReduceFailure(CommandRejectionReason.notFound);
    }
    final root = artboard.designTreeRoot;
    final node = root.findById(command.nodeId);
    if (node == null) {
      return const ReduceFailure(CommandRejectionReason.notFound);
    }
    // Unlocking a locked node is always permitted (it is the release
    // path); locking under a locked ancestor is not.
    if (command.locked && _nodeLockedInPath(root, command.nodeId)) {
      return const ReduceFailure(
        CommandRejectionReason.locked,
        'Design node is already locked',
      );
    }
    final newRoot = DesignTreeOps.rewrite(
      root,
      command.nodeId,
      (n) => n.copyWith(locked: command.locked),
    )!;
    return ReduceSuccess(
      document: _withDesignRoot(doc, command.artboardId, newRoot),
      inverse: DocumentCommand.setNodeLocked(
        artboardId: command.artboardId,
        nodeId: command.nodeId,
        locked: node.locked,
      ),
      affectedIds: [command.nodeId],
    );
  }

  static Object _setNodeMetadata(
    FebricDocument doc,
    SetNodeMetadataCommand command,
  ) {
    return _mutateNode(
      doc,
      command.artboardId,
      command.nodeId,
      transform: (node) {
        final metadata = {...node.metadata};
        if (command.value == null) {
          metadata.remove(command.key);
        } else {
          metadata[command.key] = command.value;
        }
        return node.copyWith(metadata: metadata);
      },
      inverse: (node) => DocumentCommand.setNodeMetadata(
        artboardId: command.artboardId,
        nodeId: command.nodeId,
        key: command.key,
        value: node.metadata[command.key],
      ),
    );
  }

  static Object _duplicateDesignNode(
    FebricDocument doc,
    DuplicateDesignNodeCommand command,
  ) {
    final artboard = doc.artboardById(command.artboardId);
    if (artboard == null) {
      return const ReduceFailure(CommandRejectionReason.notFound);
    }
    final root = artboard.designTreeRoot;
    final source = root.findById(command.sourceNodeId);
    final location = DesignTreeOps.locate(root, command.sourceNodeId);
    if (source == null || location == null) {
      return const ReduceFailure(CommandRejectionReason.notFound);
    }
    final capability = _requireCapability(source, NodeCapability.duplicate);
    if (capability != null) {
      return capability;
    }
    for (final descendant in command.duplicate.descendantsAndSelf) {
      if (root.findById(descendant.id) != null) {
        return ReduceFailure(
          CommandRejectionReason.invalid,
          'Duplicate carries an existing id: ${descendant.id}',
        );
      }
    }
    if (_nodeLockedInPath(root, location.parentId)) {
      return const ReduceFailure(
        CommandRejectionReason.locked,
        'Parent design node is locked',
      );
    }
    final newRoot = DesignTreeOps.rewrite(root, location.parentId, (p) {
      final children = [...p.children]
        ..insert(location.index + 1, command.duplicate);
      return p.copyWith(children: children);
    })!;
    return ReduceSuccess(
      document: _withDesignRoot(doc, command.artboardId, newRoot),
      inverse: DocumentCommand.deleteDesignNode(
        artboardId: command.artboardId,
        nodeId: command.duplicate.id,
      ),
      affectedIds: [command.duplicate.id, command.sourceNodeId],
    );
  }

  /// Capability-matrix guard (Architecture V2 §4.2): the reducer enforces
  /// the structurally unambiguous rows — rename, hide, duplicate.
  static ReduceFailure? _requireCapability(
    DesignNode node,
    NodeCapability capability,
  ) {
    if (NodeCapabilityMatrix.supports(node.type, capability)) {
      return null;
    }
    return ReduceFailure(
      CommandRejectionReason.invalid,
      '${node.type.wireName} nodes do not support ${capability.wireName}',
    );
  }

  /// Shared guard + rewrite for single-node mutations: target must exist,
  /// and neither it nor an ancestor may be node-locked.
  static Object _mutateNode(
    FebricDocument doc,
    String artboardId,
    String nodeId, {
    ReduceFailure? Function(DesignNode node)? validate,
    required DesignNode Function(DesignNode node) transform,
    required DocumentCommand Function(DesignNode node) inverse,
  }) {
    final artboard = doc.artboardById(artboardId);
    if (artboard == null) {
      return const ReduceFailure(CommandRejectionReason.notFound);
    }
    final root = artboard.designTreeRoot;
    final node = root.findById(nodeId);
    if (node == null) {
      return const ReduceFailure(CommandRejectionReason.notFound);
    }
    final failure = validate?.call(node);
    if (failure != null) {
      return failure;
    }
    if (_nodeLockedInPath(root, nodeId)) {
      return const ReduceFailure(
        CommandRejectionReason.locked,
        'Design node is locked',
      );
    }
    final newRoot = DesignTreeOps.rewrite(root, nodeId, transform)!;
    return ReduceSuccess(
      document: _withDesignRoot(doc, artboardId, newRoot),
      inverse: inverse(node),
      affectedIds: [nodeId],
    );
  }
}
