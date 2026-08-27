import 'package:core_design_system/core_design_system.dart';
import 'package:flutter/material.dart';

/// The Design Tree panel.
///
/// Presentation boundary (M19/M20): this page is an **intent source only**. It
/// renders the flattened rows the composition root supplies — the semantic
/// design tree and, since M20, the compositing layer tree — and reports what
/// the user asked for through the callbacks. It never builds a
/// `DocumentCommand`, never touches document state, and performs no lock,
/// validation or history logic: those stay inside the frozen document
/// pipeline. Undo/redo are the engine's own mechanism, invoked through
/// [onUndo] / [onRedo].
///
/// Unwired (no [rows] or no [onMoveNode]) it stays the M1 module placeholder.
class DesignTreePage extends StatefulWidget {
  const DesignTreePage({
    super.key,
    this.rows,
    this.onMoveNode,
    this.canUndo = false,
    this.canRedo = false,
    this.onUndo,
    this.onRedo,
    this.statusMessage,
    this.layerRows,
    this.onLayerAdd,
    this.onLayerDelete,
    this.onLayerMove,
    this.onLayerRename,
    this.onLayerMetadata,
  });

  /// Flattened design-tree rows: node id, display label, depth, the parent that
  /// owns it and its sibling index. Primitives only — no document type crosses
  /// into presentation.
  final List<
    ({String id, String label, int depth, String? parentId, int index})
  >?
  rows;

  /// Reports the structural node move the user asked for.
  final void Function(String nodeId, String newParentId, int index)? onMoveNode;

  /// Whether the engine currently has something to undo / redo.
  final bool canUndo;
  final bool canRedo;

  /// Invokes the engine's own undo / redo.
  final VoidCallback? onUndo;
  final VoidCallback? onRedo;

  /// The last frozen `CommandResult`, rendered verbatim as supplied.
  final String? statusMessage;

  /// Flattened layer rows (M20): layer id, display label, depth, parent id,
  /// sibling index and a pre-rendered metadata line (null when empty).
  final List<
    ({
      String id,
      String label,
      int depth,
      String? parentId,
      int index,
      String? metadata,
    })
  >?
  layerRows;

  /// Reports a new child layer under the given parent, with the entered name.
  final void Function(String parentLayerId, String name)? onLayerAdd;

  /// Reports a layer deletion.
  final void Function(String layerId)? onLayerDelete;

  /// Reports a structural layer move: new parent and sibling index.
  final void Function(String layerId, String newParentId, int index)?
  onLayerMove;

  /// Reports a layer rename with the entered name.
  final void Function(String layerId, String name)? onLayerRename;

  /// Reports one metadata entry set (or cleared, when value is null).
  final void Function(String layerId, String key, Object? value)?
  onLayerMetadata;

  @override
  State<DesignTreePage> createState() => _DesignTreePageState();
}

class _DesignTreePageState extends State<DesignTreePage> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _metaKey = TextEditingController();
  final TextEditingController _metaValue = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _metaKey.dispose();
    _metaValue.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final rows = widget.rows;
    final onMove = widget.onMoveNode;
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
          child: ListView(
            children: [..._nodeRows(rows, onMove), ..._layerSection(context)],
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
          if (widget.statusMessage != null)
            Expanded(
              child: Text(
                widget.statusMessage!,
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
            onPressed: widget.canUndo ? widget.onUndo : null,
          ),
          IconButton(
            key: const Key('design-tree-redo'),
            icon: const Icon(Icons.redo),
            tooltip: 'Redo',
            onPressed: widget.canRedo ? widget.onRedo : null,
          ),
        ],
      ),
    );
  }

  List<Widget> _nodeRows(
    List<({String id, String label, int depth, String? parentId, int index})>
    rows,
    void Function(String nodeId, String newParentId, int index) onMove,
  ) => [for (final row in rows) _nodeRow(rows, row, onMove)];

  Widget _nodeRow(
    List<({String id, String label, int depth, String? parentId, int index})>
    rows,
    ({String id, String label, int depth, String? parentId, int index}) row,
    void Function(String nodeId, String newParentId, int index) onMove,
  ) {
    final parentId = row.parentId;
    final siblings = rows.where((r) => r.parentId == parentId).length;

    // The previous sibling can adopt this node (indent) and the grandparent can
    // receive it (outdent). Both are read off the supplied projection.
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
      contentPadding: EdgeInsets.only(left: 12 + row.depth * 16, right: 8),
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
  }

  List<Widget> _layerSection(BuildContext context) {
    final layers = widget.layerRows;
    if (layers == null) {
      return const <Widget>[];
    }
    return [
      const Divider(height: 1),
      Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
        child: Text('Layers', style: Theme.of(context).textTheme.titleSmall),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: TextField(
          key: const Key('layer-name-field'),
          controller: _name,
          decoration: const InputDecoration(
            labelText: 'Layer name',
            isDense: true,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: TextField(
          key: const Key('layer-meta-key-field'),
          controller: _metaKey,
          decoration: const InputDecoration(
            labelText: 'Metadata key',
            isDense: true,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: TextField(
          key: const Key('layer-meta-value-field'),
          controller: _metaValue,
          decoration: const InputDecoration(
            labelText: 'Metadata value',
            isDense: true,
          ),
        ),
      ),
      for (final row in layers) _layerRow(layers, row),
    ];
  }

  Widget _layerRow(
    List<
      ({
        String id,
        String label,
        int depth,
        String? parentId,
        int index,
        String? metadata,
      })
    >
    layers,
    ({
      String id,
      String label,
      int depth,
      String? parentId,
      int index,
      String? metadata,
    })
    row,
  ) {
    final parentId = row.parentId;
    final siblings = layers.where((r) => r.parentId == parentId).length;
    String? previousSiblingId;
    String? grandParentId;
    var parentIndex = 0;
    for (final r in layers) {
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
        : layers.where((r) => r.parentId == previousSiblingId).length;
    final metadata = row.metadata;

    return ListTile(
      contentPadding: EdgeInsets.only(left: 12 + row.depth * 16, right: 8),
      title: Text(row.label),
      subtitle: metadata == null
          ? null
          : Text(metadata, key: Key('layer-meta-${row.id}')),
      trailing: PopupMenuButton<void>(
        key: Key('layer-menu-${row.id}'),
        tooltip: 'Layer actions',
        // The field contents are read when the menu opens, so the operands are
        // always what the user has currently entered.
        itemBuilder: (context) {
          final name = _name.text.trim().isEmpty ? 'Layer' : _name.text.trim();
          final metaKey = _metaKey.text.trim();
          return [
            PopupMenuItem<void>(
              key: Key('layer-add-${row.id}'),
              enabled: widget.onLayerAdd != null,
              onTap: () => widget.onLayerAdd!(row.id, name),
              child: const Text('Add child layer'),
            ),
            PopupMenuItem<void>(
              key: Key('layer-rename-${row.id}'),
              enabled: widget.onLayerRename != null,
              onTap: () => widget.onLayerRename!(row.id, name),
              child: const Text('Rename'),
            ),
            PopupMenuItem<void>(
              key: Key('layer-meta-set-${row.id}'),
              enabled: widget.onLayerMetadata != null && metaKey.isNotEmpty,
              onTap: () =>
                  widget.onLayerMetadata!(row.id, metaKey, _metaValue.text),
              child: const Text('Set metadata'),
            ),
            PopupMenuItem<void>(
              key: Key('layer-meta-clear-${row.id}'),
              enabled: widget.onLayerMetadata != null && metaKey.isNotEmpty,
              onTap: () => widget.onLayerMetadata!(row.id, metaKey, null),
              child: const Text('Clear metadata'),
            ),
            PopupMenuItem<void>(
              key: Key('layer-up-${row.id}'),
              enabled:
                  widget.onLayerMove != null &&
                  parentId != null &&
                  row.index > 0,
              onTap: () =>
                  widget.onLayerMove!(row.id, parentId!, row.index - 1),
              child: const Text('Move up'),
            ),
            PopupMenuItem<void>(
              key: Key('layer-down-${row.id}'),
              enabled:
                  widget.onLayerMove != null &&
                  parentId != null &&
                  row.index < siblings - 1,
              onTap: () =>
                  widget.onLayerMove!(row.id, parentId!, row.index + 1),
              child: const Text('Move down'),
            ),
            PopupMenuItem<void>(
              key: Key('layer-indent-${row.id}'),
              enabled: widget.onLayerMove != null && previousSiblingId != null,
              onTap: () =>
                  widget.onLayerMove!(row.id, previousSiblingId!, adoptIndex),
              child: const Text('Move under previous sibling'),
            ),
            PopupMenuItem<void>(
              key: Key('layer-outdent-${row.id}'),
              enabled: widget.onLayerMove != null && grandParentId != null,
              onTap: () =>
                  widget.onLayerMove!(row.id, grandParentId!, parentIndex + 1),
              child: const Text('Move out to parent level'),
            ),
            PopupMenuItem<void>(
              key: Key('layer-delete-${row.id}'),
              enabled: widget.onLayerDelete != null && parentId != null,
              onTap: () => widget.onLayerDelete!(row.id),
              child: const Text('Delete'),
            ),
          ];
        },
      ),
    );
  }
}
