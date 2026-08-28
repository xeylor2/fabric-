import 'package:core_design_system/core_design_system.dart';
import 'package:flutter/material.dart';

/// The Design Tree panel.
///
/// Presentation boundary (M19/M20/M21): this page is an **intent source only**.
/// It renders the flattened rows the composition root supplies — the semantic
/// design tree and, since M20, the compositing layer tree — and reports what
/// the user asked for through the callbacks. It never builds a
/// `DocumentCommand`, never touches document state, and performs no lock,
/// validation, capability or history logic: those stay inside the frozen
/// document pipeline. Undo/redo are the engine's own mechanism, invoked through
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
    this.onNodeAdd,
    this.onNodeDelete,
    this.onNodeRename,
    this.onNodeDuplicate,
    this.onNodeVisibility,
    this.onNodeLocked,
    this.onNodeMetadata,
    this.garmentChoices,
    this.onGarmentAdd,
    this.onFabricAdd,
    this.onMotifAdd,
    this.onMotifArtwork,
  });

  /// Flattened design-tree rows: node id, display label, depth, the parent that
  /// owns it, its sibling index, its visibility, its node-lock flag, a
  /// pre-rendered metadata line (null when empty), whether the row is a printed
  /// motif and whether it already references artwork. Primitives only — no
  /// document type crosses into presentation.
  final List<
    ({
      String id,
      String label,
      int depth,
      String? parentId,
      int index,
      bool visible,
      bool locked,
      String? metadata,
      bool motif,
      bool hasArtwork,
    })
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

  /// Reports a new child design node under the given parent, with the entered
  /// name (M21).
  final void Function(String parentNodeId, String name)? onNodeAdd;

  /// Reports a design-node deletion.
  final void Function(String nodeId)? onNodeDelete;

  /// Reports a design-node rename with the entered name.
  final void Function(String nodeId, String name)? onNodeRename;

  /// Reports a design-node duplication (inserted as the next sibling).
  final void Function(String nodeId)? onNodeDuplicate;

  /// Reports the requested visibility of a design node.
  final void Function(String nodeId, bool visible)? onNodeVisibility;

  /// Reports the requested node-lock flag of a design node.
  final void Function(String nodeId, bool locked)? onNodeLocked;

  /// Reports one design-node metadata entry set (or cleared, when value is
  /// null).
  final void Function(String nodeId, String key, Object? value)? onNodeMetadata;

  /// The garment compositions the user can add: a stable id and a display
  /// label. Primitives only — no garment domain type crosses into
  /// presentation.
  final List<({String id, String label})>? garmentChoices;

  /// Reports the garment the user asked to add, by its id.
  final void Function(String garmentId)? onGarmentAdd;

  /// Reports a request to add the substrate cloth under the given node.
  final void Function(String parentNodeId)? onFabricAdd;

  /// Reports a request to add an independently editable printed motif layer
  /// under the given node.
  final void Function(String parentNodeId)? onMotifAdd;

  /// Reports the artwork the user asked to apply to a printed motif: the motif
  /// node id and the artwork source exactly as entered. Whether that is an
  /// upload or a replacement is the same intent — the composition root owns the
  /// meaning, this page owns neither.
  final void Function(String nodeId, String artworkSource)? onMotifArtwork;

  @override
  State<DesignTreePage> createState() => _DesignTreePageState();
}

class _DesignTreePageState extends State<DesignTreePage> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _metaKey = TextEditingController();
  final TextEditingController _metaValue = TextEditingController();
  final TextEditingController _nodeName = TextEditingController();
  final TextEditingController _nodeMetaKey = TextEditingController();
  final TextEditingController _nodeMetaValue = TextEditingController();
  final TextEditingController _motifArtwork = TextEditingController();

  /// Keeps five controls inside a narrow panel without overflow. Cosmetic only:
  /// keys, callbacks and enablement of the M19 movement buttons are unchanged.
  static const BoxConstraints _dense = BoxConstraints.tightFor(
    width: 34,
    height: 34,
  );

  @override
  void dispose() {
    _name.dispose();
    _metaKey.dispose();
    _metaValue.dispose();
    _nodeName.dispose();
    _nodeMetaKey.dispose();
    _nodeMetaValue.dispose();
    _motifArtwork.dispose();
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
            children: [
              ..._nodeFields(context),
              ..._nodeRows(rows, onMove),
              ..._layerSection(context),
            ],
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
          ..._garmentSection(context),
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

  /// The garment composition action, hosted in the existing toolbar so it adds
  /// no vertical structure to the tree list (the M19/M20/M21 row layout is
  /// unchanged). It reports an id and nothing else — the composition root owns
  /// every garment meaning.
  List<Widget> _garmentSection(BuildContext context) {
    final choices = widget.garmentChoices;
    final onAdd = widget.onGarmentAdd;
    if (choices == null || choices.isEmpty || onAdd == null) {
      return const <Widget>[];
    }
    return [
      PopupMenuButton<void>(
        key: const Key('garment-menu'),
        tooltip: 'Add garment',
        icon: const Icon(Icons.checkroom_outlined),
        itemBuilder: (context) => [
          for (final choice in choices)
            PopupMenuItem<void>(
              key: Key('garment-add-${choice.id}'),
              onTap: () => onAdd(choice.id),
              child: Text('Add ${choice.label}'),
            ),
        ],
      ),
    ];
  }

  /// The M21 operand fields for design-node editing. Their contents are read
  /// when a row menu opens, so the operands are always what the user entered.
  List<Widget> _nodeFields(BuildContext context) {
    if (widget.onNodeAdd == null &&
        widget.onNodeRename == null &&
        widget.onNodeMetadata == null &&
        widget.onMotifArtwork == null) {
      return const <Widget>[];
    }
    return [
      Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
        child: Text(
          'Design tree',
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
      _field('node-name-field', _nodeName, 'Node name'),
      _field('node-meta-key-field', _nodeMetaKey, 'Node metadata key'),
      _field('node-meta-value-field', _nodeMetaValue, 'Node metadata value'),
      if (widget.onMotifArtwork != null)
        _field('motif-artwork-field', _motifArtwork, 'Motif artwork file'),
    ];
  }

  Widget _field(String key, TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: TextField(
        key: Key(key),
        controller: controller,
        decoration: InputDecoration(labelText: label, isDense: true),
      ),
    );
  }

  List<Widget> _nodeRows(
    List<
      ({
        String id,
        String label,
        int depth,
        String? parentId,
        int index,
        bool visible,
        bool locked,
        String? metadata,
        bool motif,
        bool hasArtwork,
      })
    >
    rows,
    void Function(String nodeId, String newParentId, int index) onMove,
  ) => [for (final row in rows) _nodeRow(rows, row, onMove)];

  Widget _nodeRow(
    List<
      ({
        String id,
        String label,
        int depth,
        String? parentId,
        int index,
        bool visible,
        bool locked,
        String? metadata,
        bool motif,
        bool hasArtwork,
      })
    >
    rows,
    ({
      String id,
      String label,
      int depth,
      String? parentId,
      int index,
      bool visible,
      bool locked,
      String? metadata,
      bool motif,
      bool hasArtwork,
    })
    row,
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
      subtitle: _nodeSubtitle(row.id, row.visible, row.locked, row.metadata),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            key: Key('move-up-${row.id}'),
            icon: const Icon(Icons.arrow_upward),
            tooltip: 'Move up',
            padding: EdgeInsets.zero,
            constraints: _dense,
            onPressed: parentId != null && row.index > 0
                ? () => onMove(row.id, parentId, row.index - 1)
                : null,
          ),
          IconButton(
            key: Key('move-down-${row.id}'),
            icon: const Icon(Icons.arrow_downward),
            tooltip: 'Move down',
            padding: EdgeInsets.zero,
            constraints: _dense,
            onPressed: parentId != null && row.index < siblings - 1
                ? () => onMove(row.id, parentId, row.index + 1)
                : null,
          ),
          IconButton(
            key: Key('indent-${row.id}'),
            icon: const Icon(Icons.subdirectory_arrow_right),
            tooltip: 'Move under previous sibling',
            padding: EdgeInsets.zero,
            constraints: _dense,
            onPressed: previousSiblingId != null
                ? () => onMove(row.id, previousSiblingId!, adoptIndex)
                : null,
          ),
          IconButton(
            key: Key('outdent-${row.id}'),
            icon: const Icon(Icons.arrow_back),
            tooltip: 'Move out to parent level',
            padding: EdgeInsets.zero,
            constraints: _dense,
            onPressed: grandParentId != null
                ? () => onMove(row.id, grandParentId!, parentIndex + 1)
                : null,
          ),
          ..._nodeMenu(row),
        ],
      ),
    );
  }

  /// Renders the node's own state: hidden / locked markers and the metadata
  /// line, exactly as supplied. Null when there is nothing to show.
  Widget? _nodeSubtitle(
    String id,
    bool visible,
    bool locked,
    String? metadata,
  ) {
    final parts = <String>[
      if (!visible) 'hidden',
      if (locked) 'locked',
      if (metadata != null) metadata,
    ];
    if (parts.isEmpty) {
      return null;
    }
    return Text(parts.join(' · '), key: Key('node-state-$id'));
  }

  /// The M21 design-node action menu for one row. Enablement uses only the
  /// supplied projection (a callback exists; the root has no parent). Node
  /// grammar, the capability matrix and node-lock rules are NOT evaluated here
  /// — the engine decides and its `CommandResult` is shown in the toolbar.
  List<Widget> _nodeMenu(
    ({
      String id,
      String label,
      int depth,
      String? parentId,
      int index,
      bool visible,
      bool locked,
      String? metadata,
      bool motif,
      bool hasArtwork,
    })
    row,
  ) {
    final wired =
        widget.onNodeAdd != null ||
        widget.onNodeRename != null ||
        widget.onNodeDuplicate != null ||
        widget.onNodeVisibility != null ||
        widget.onNodeLocked != null ||
        widget.onNodeMetadata != null ||
        widget.onNodeDelete != null ||
        widget.onFabricAdd != null ||
        widget.onMotifAdd != null ||
        widget.onMotifArtwork != null;
    if (!wired) {
      return const <Widget>[];
    }
    final hasParent = row.parentId != null;
    return [
      PopupMenuButton<void>(
        key: Key('node-menu-${row.id}'),
        tooltip: 'Node actions',
        padding: EdgeInsets.zero,
        iconSize: 20,
        itemBuilder: (context) {
          final name = _nodeName.text.trim().isEmpty
              ? 'Element'
              : _nodeName.text.trim();
          final metaKey = _nodeMetaKey.text.trim();
          final artwork = _motifArtwork.text.trim();
          return [
            PopupMenuItem<void>(
              key: Key('node-add-${row.id}'),
              enabled: widget.onNodeAdd != null,
              onTap: () => widget.onNodeAdd!(row.id, name),
              child: const Text('Add child node'),
            ),
            PopupMenuItem<void>(
              key: Key('node-add-fabric-${row.id}'),
              enabled: widget.onFabricAdd != null,
              onTap: () => widget.onFabricAdd!(row.id),
              child: const Text('Add fabric / base'),
            ),
            PopupMenuItem<void>(
              key: Key('node-add-motif-${row.id}'),
              enabled: widget.onMotifAdd != null,
              onTap: () => widget.onMotifAdd!(row.id),
              child: const Text('Add printed motif layer'),
            ),
            // Artwork belongs to a printed motif, so the action is offered on
            // motif rows only — read off the supplied projection, exactly like
            // every other enablement here. Upload and replacement are the one
            // intent; the label follows the row's current artwork state.
            if (row.motif)
              PopupMenuItem<void>(
                key: Key('node-artwork-${row.id}'),
                enabled: widget.onMotifArtwork != null && artwork.isNotEmpty,
                onTap: () => widget.onMotifArtwork!(row.id, artwork),
                child: Text(
                  row.hasArtwork
                      ? 'Replace motif artwork'
                      : 'Upload motif artwork',
                ),
              ),
            PopupMenuItem<void>(
              key: Key('node-rename-${row.id}'),
              enabled: widget.onNodeRename != null,
              onTap: () => widget.onNodeRename!(row.id, name),
              child: const Text('Rename'),
            ),
            PopupMenuItem<void>(
              key: Key('node-duplicate-${row.id}'),
              enabled: widget.onNodeDuplicate != null && hasParent,
              onTap: () => widget.onNodeDuplicate!(row.id),
              child: const Text('Duplicate'),
            ),
            PopupMenuItem<void>(
              key: Key('node-visibility-${row.id}'),
              enabled: widget.onNodeVisibility != null,
              onTap: () => widget.onNodeVisibility!(row.id, !row.visible),
              child: Text(row.visible ? 'Hide' : 'Show'),
            ),
            PopupMenuItem<void>(
              key: Key('node-lock-${row.id}'),
              enabled: widget.onNodeLocked != null,
              onTap: () => widget.onNodeLocked!(row.id, !row.locked),
              child: Text(row.locked ? 'Unlock node' : 'Lock node'),
            ),
            PopupMenuItem<void>(
              key: Key('node-meta-set-${row.id}'),
              enabled: widget.onNodeMetadata != null && metaKey.isNotEmpty,
              onTap: () =>
                  widget.onNodeMetadata!(row.id, metaKey, _nodeMetaValue.text),
              child: const Text('Set metadata'),
            ),
            PopupMenuItem<void>(
              key: Key('node-meta-clear-${row.id}'),
              enabled: widget.onNodeMetadata != null && metaKey.isNotEmpty,
              onTap: () => widget.onNodeMetadata!(row.id, metaKey, null),
              child: const Text('Clear metadata'),
            ),
            PopupMenuItem<void>(
              key: Key('node-delete-${row.id}'),
              enabled: widget.onNodeDelete != null && hasParent,
              onTap: () => widget.onNodeDelete!(row.id),
              child: const Text('Delete'),
            ),
          ];
        },
      ),
    ];
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
