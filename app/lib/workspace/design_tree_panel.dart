import 'package:feature_design_tree/feature_design_tree.dart';
import 'package:febric/di/design_tree_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Composition-root adapter (M19/M20/M21): binds the [DesignTreeSession] to the
/// presentation surface. It hands over the read-only projection and the intent
/// callbacks — it constructs no `DocumentCommand` and holds no document state.
class DesignTreePanel extends ConsumerWidget {
  const DesignTreePanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(designTreeSessionProvider);
    return ValueListenableBuilder<int>(
      valueListenable: session.revision,
      builder: (context, _, __) => DesignTreePage(
        rows: session.rows,
        onMoveNode: session.moveNode,
        canUndo: session.canUndo,
        canRedo: session.canRedo,
        onUndo: session.undo,
        onRedo: session.redo,
        statusMessage: session.lastResult,
        layerRows: session.layerRows,
        onLayerAdd: session.createLayer,
        onLayerDelete: session.deleteLayer,
        onLayerMove: session.moveLayer,
        onLayerRename: session.renameLayer,
        onLayerMetadata: session.setLayerMetadata,
        onNodeAdd: session.createNode,
        onNodeDelete: session.deleteNode,
        onNodeRename: session.renameNode,
        onNodeDuplicate: session.duplicateNode,
        onNodeVisibility: session.setNodeVisibility,
        onNodeLocked: session.setNodeLocked,
        onNodeMetadata: session.setNodeMetadata,
        garmentChoices: session.garmentChoices,
        onGarmentAdd: session.instantiateGarment,
        onFabricAdd: session.createFabric,
        onMotifAdd: session.createMotif,
      ),
    );
  }
}
