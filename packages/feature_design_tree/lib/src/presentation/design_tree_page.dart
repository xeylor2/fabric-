import 'package:core_design_system/core_design_system.dart';
import 'package:flutter/material.dart';

/// The Design Tree panel.
///
/// M19 presentation boundary: this page is an **intent source only**. It
/// renders the flattened rows the composition root supplies and reports the
/// structural move the user asked for through [onMoveNode]. It never builds a
/// `DocumentCommand`, never touches document state, and performs no lock,
/// validation or history logic — those stay inside the frozen document
/// pipeline. Undo/redo are the engine's own mechanism, invoked through
/// [onUndo] / [onRedo].
///
/// Unwired (no [rows] or no [onMoveNode]) it stays the M1 module placeholder.
class DesignTreePage extends StatelessWidget {
  const DesignTreePage({
    super.key,
    this.rows,
    this.onMoveNode,
    this.canUndo = false,
    this.canRedo = false,
    this.onUndo,
    this.onRedo,
    this.statusMessage,
  });

  /// Flattened design-tree rows supplied by the composition root: node id,
  /// display label, depth, the parent that owns it and its sibling index in
  /// that parent. Primitives only — no document type crosses into
  /// presentation.
  final List<({String id, String label, int depth, String? parentId, int index})>?
  rows;

  /// Reports the structural move the user asked for: which node, the parent it
  /// should end up under, and the sibling index it should take there.
  final void Function(String nodeId, String newParentId, int index)? onMoveNode;

  /// Whether the engine currently has something to undo / redo.
  final bool canUndo;
  final bool canRedo;

  /// Invokes the engine's own undo / redo.
  final VoidCallback? onUndo;
  final VoidCallback? onRedo;

  /// The last frozen `CommandResult`, rendered verbatim as supplied.
  final String? statusMessage;

  @override
  Widget build(BuildContext context) {
    final rows = this.rows;
    final onMove = onMoveNode;
    if (rows == null || onMove == null) {
      return const ModulePlaceholderView(
        icon: Icons.account_tree_outlined,
        moduleName: 'Design Tree',
        description:
            'Every garment part and textile element as an editable, lockable, versionable node.',
        packageId: 'feature_design_tree',
        milestone: 'M2',
      );
    }
    return Column(
      children: [
        _toolbar(context),
        const Divider(height: 1),
        Expanded(
          child: ListView.builder(
            itemCount: rows.length,
            itemBuilder: (context, i) {
              final row = rows[i];
              final parentId = row.parentId;
              final siblings = rows.where((r) => r.parentId == parentId).length;

              // The previous sibling can adopt this node (indent), and the
              // grandparent can receive it (outdent). Both are read off the
              // supplied projection — no document access here.
              String? previousSiblingId;
              String? grandParentId;
              var parentIndex = 0;
              for (final r in rows) {
                if (r.parentId == parentId && r.index == row.index - 1) {
                  previousSiblingId = r.id;
                }
                if (r.id == parentId) {
                  grandParentId = r.parentId;
                  parentIndex = r.index;
                }
              }
              final adoptIndex = previousSiblingId == null
                  ? 0
                  : rows.where((r) => r.parentId == previousSiblingId).length;

              return ListTile(
                contentPadding: EdgeInsets.only(
                  left: 12 + row.depth * 16,
                  right: 8,
                ),
                title: Text(row.label),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      key: Key('move-up-${row.id}'),
                      icon: const Icon(Icons.arrow_upward),
                      tooltip: 'Move up',
                      onPressed: parentId != null && row.index > 0
                          ? () => onMove(row.id, parentId, row.index - 1)
                          : null,
                    ),
                    IconButton(
                      key: Key('move-down-${row.id}'),
                      icon: const Icon(Icons.arrow_downward),
                      tooltip: 'Move down',
                      onPressed: parentId != null && row.index < siblings - 1
                          ? () => onMove(row.id, parentId, row.index + 1)
                          : null,
                    ),
                    IconButton(
                      key: Key('indent-${row.id}'),
                      icon: const Icon(Icons.subdirectory_arrow_right),
                      tooltip: 'Move under previous sibling',
                      onPressed: previousSiblingId != null
                          ? () => onMove(row.id, previousSiblingId!, adoptIndex)
                          : null,
                    ),
                    IconButton(
                      key: Key('outdent-${row.id}'),
                      icon: const Icon(Icons.arrow_back),
                      tooltip: 'Move out to parent level',
                      onPressed: grandParentId != null
                          ? () => onMove(row.id, grandParentId!, parentIndex + 1)
                          : null,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _toolbar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          if (statusMessage != null)
            Expanded(
              child: Text(
                statusMessage!,
                key: const Key('design-tree-status'),
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            )
          else
            const Spacer(),
          IconButton(
            key: const Key('design-tree-undo'),
            icon: const Icon(Icons.undo),
            tooltip: 'Undo',
            onPressed: canUndo ? onUndo : null,
          ),
          IconButton(
            key: const Key('design-tree-redo'),
            icon: const Icon(Icons.redo),
            tooltip: 'Redo',
            onPressed: canRedo ? onRedo : null,
          ),
        ],
      ),
    );
  }
}
