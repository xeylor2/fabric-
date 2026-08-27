import 'package:core_common/core_common.dart';
import 'package:core_document/core_document.dart';
import 'package:core_geometry/core_geometry.dart';
import 'package:core_layer/core_layer.dart';
import 'package:core_layer_runtime/core_layer_runtime.dart';
import 'package:core_textile/core_textile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// M19 composition-root wiring — the caller seam M9/M10/M11 reserved.
///
/// It constructs the frozen [DocumentEngine], binds its `apply` as the
/// `DocumentCommandSink` of the authorized emission owner ([LayerRuntime]) and
/// exposes to presentation exactly three things: a read-only flattened
/// projection of the design tree, the movement intent entry point, and the
/// engine's own undo/redo.
///
/// It builds no `DocumentCommand` — the owner builds it. It performs no lock,
/// validation, history, inverse, revision or dirty-state work — the frozen
/// engine pipeline does all of it. This class holds references and orders
/// calls (M19-D1 / NDH-1 Form A).
class DesignTreeSession {
  DesignTreeSession({required this.engine})
    : _owner = LayerRuntime(sink: engine.apply);

  /// In-memory M19 session document: one artboard with a small design tree.
  /// No persistence and no document repository is wired in this milestone.
  factory DesignTreeSession.inMemory() =>
      DesignTreeSession(engine: DocumentEngine(document: seedDocument()));

  final DocumentEngine engine;

  /// The single authorized design-node movement emission owner, and (M9) the
  /// owner of layer-command emission.
  final LayerRuntime _owner;

  /// Frozen id seam for new layers (M20). Deterministic within a session; the
  /// frozen reducer rejects a duplicate id.
  final IdGenerator _layerIds = SequentialIdGenerator(prefix: 'layer');

  /// Bumped after every engine interaction so presentation re-reads state.
  final ValueNotifier<int> revision = ValueNotifier<int>(0);

  /// The last frozen [CommandResult], rendered for display only.
  String? lastResult;

  bool get canUndo => engine.canUndo;
  bool get canRedo => engine.canRedo;
  bool get isDirty => engine.isDirty;

  String get artboardId => engine.document.artboards.first.id;

  /// Flattened rows for the panel: id, label, depth, parent id and sibling
  /// index. A read-only projection of the frozen document.
  List<({String id, String label, int depth, String? parentId, int index})>
  get rows {
    final out =
        <({String id, String label, int depth, String? parentId, int index})>[];
    void walk(DesignNode node, int depth, String? parentId, int index) {
      out.add((
        id: node.id,
        label: node.name,
        depth: depth,
        parentId: parentId,
        index: index,
      ));
      for (var i = 0; i < node.children.length; i++) {
        walk(node.children[i], depth + 1, node.id, i);
      }
    }

    walk(engine.document.artboards.first.designTreeRoot, 0, null, 0);
    return out;
  }

  /// Presentation intent → the authorized owner. Nothing is constructed here.
  CommandResult moveNode(String nodeId, String newParentId, int index) {
    final result = _owner.moveDesignNode(
      artboardId: artboardId,
      nodeId: nodeId,
      newParentId: newParentId,
      index: index,
    );
    _record(result);
    return result;
  }

  // ------------------------------------------- layer structural editing (M20)
  // Same discipline as the design-node path: the composition root forwards
  // operands, the owner builds the frozen command, the engine does everything
  // else. Nothing is constructed here.

  /// Flattened layer rows for the panel: id, label, depth, parent id, sibling
  /// index and a rendered metadata line (null when the layer has none).
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
  get layerRows {
    final out =
        <
          ({
            String id,
            String label,
            int depth,
            String? parentId,
            int index,
            String? metadata,
          })
        >[];
    void walk(LayerModel layer, int depth, String? parentId, int index) {
      out.add((
        id: layer.id,
        label: layer.name,
        depth: depth,
        parentId: parentId,
        index: index,
        metadata: layer.metadata.isEmpty
            ? null
            : layer.metadata.entries
                  .map((e) => '${e.key}=${e.value}')
                  .join('; '),
      ));
      for (var i = 0; i < layer.children.length; i++) {
        walk(layer.children[i], depth + 1, layer.id, i);
      }
    }

    walk(engine.document.artboards.first.layerRoot, 0, null, 0);
    return out;
  }

  /// Adds a child layer under [parentLayerId] (appended). The kind is the
  /// frozen [LayerKind.layer]; no kind vocabulary is exposed or extended.
  CommandResult createLayer(String parentLayerId, String name) => _record(
    _owner.createLayer(
      artboardId: artboardId,
      layer: LayerModel(
        id: _layerIds.next(),
        name: name,
        kind: LayerKind.layer,
      ),
      parentLayerId: parentLayerId,
    ),
  );

  CommandResult deleteLayer(String layerId) =>
      _record(_owner.deleteLayer(artboardId: artboardId, layerId: layerId));

  /// Structural layer movement: same parent + new index reorders, new parent
  /// + index reparents. Ids and an integer index only.
  CommandResult moveLayer(String layerId, String newParentId, int index) =>
      _record(
        _owner.moveLayer(
          artboardId: artboardId,
          layerId: layerId,
          newParentId: newParentId,
          index: index,
        ),
      );

  CommandResult renameLayer(String layerId, String name) => _record(
    _owner.renameLayer(artboardId: artboardId, layerId: layerId, name: name),
  );

  /// Sets or clears one open metadata entry — a null [value] clears it
  /// (frozen reducer semantics). No metadata key vocabulary is defined.
  CommandResult setLayerMetadata(String layerId, String key, Object? value) =>
      _record(
        _owner.setLayerMetadata(
          artboardId: artboardId,
          layerId: layerId,
          key: key,
          value: value,
        ),
      );

  /// The engine's own undo/redo — no separate mechanism exists.
  CommandResult undo() => _record(engine.undo());
  CommandResult redo() => _record(engine.redo());

  CommandResult _record(CommandResult result) {
    lastResult = switch (result) {
      CommandApplied(revision: final r) => 'Applied — revision $r',
      CommandRejected(reason: final reason, detail: final detail) =>
        'Rejected — ${reason.label}${detail == null ? '' : ': $detail'}',
    };
    revision.value++;
    return result;
  }

  void dispose() => revision.dispose();
}

/// The M19 in-memory session document. Frozen models only.
FebricDocument seedDocument() {
  const motifA = DesignNode(
    id: 'node-motif-a',
    name: 'Motif A',
    type: DesignNodeType.element,
  );
  const motifB = DesignNode(
    id: 'node-motif-b',
    name: 'Motif B',
    type: DesignNodeType.element,
  );
  const motifC = DesignNode(
    id: 'node-motif-c',
    name: 'Motif C',
    type: DesignNodeType.element,
  );
  const chest = DesignNode(
    id: 'node-chest',
    name: 'Chest',
    type: DesignNodeType.zone,
    children: [motifA, motifB, motifC],
  );
  const front = DesignNode(
    id: 'node-front',
    name: 'Front Panel',
    type: DesignNodeType.garmentPart,
    children: [chest],
  );
  const back = DesignNode(
    id: 'node-back',
    name: 'Back Panel',
    type: DesignNodeType.garmentPart,
  );
  const garment = DesignNode(
    id: 'node-garment',
    name: 'Tee',
    type: DesignNodeType.garment,
    children: [front, back],
  );
  const root = DesignNode(
    id: 'node-root',
    name: 'Session',
    type: DesignNodeType.project,
    children: [garment],
  );

  return FebricDocument(
    id: const DocumentId('doc-m19-session'),
    projectId: const ProjectId('project-m19-session'),
    manifest: const DocumentManifest(
      version: DocumentVersion(
        schema: DocumentVersion.currentSchema,
        generator: 'febric-app',
      ),
    ),
    metadata: DocumentMetadata(
      title: 'M19 Session',
      author: 'local',
      createdAt: DateTime.utc(2026, 1, 1),
      modifiedAt: DateTime.utc(2026, 1, 1),
    ),
    artboards: const [
      Artboard(
        id: 'artboard-m19',
        name: 'Artboard',
        size: Size2D(width: 210, height: 297),
        layerRoot: LayerModel(
          id: 'layer-root',
          name: 'Layers',
          kind: LayerKind.artboard,
        ),
        designTreeRoot: root,
      ),
    ],
  );
}

/// The session the workspace panel reads. One per app lifetime.
final designTreeSessionProvider = Provider<DesignTreeSession>((ref) {
  final session = DesignTreeSession.inMemory();
  ref.onDispose(session.dispose);
  return session;
});
