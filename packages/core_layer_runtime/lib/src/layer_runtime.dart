import 'package:core_document/core_document.dart';
import 'package:core_layer/core_layer.dart';
import 'package:core_textile/core_textile.dart';

/// A sink that forwards a frozen [DocumentCommand] into the document runtime
/// and returns its [CommandResult].
///
/// This is exactly the shape of the frozen `DocumentEngine.apply` — binding
/// `sink: engine.apply` wires the Layer Runtime to the real document engine
/// without this package depending on a concrete engine instance or ever
/// touching the frozen command pipeline (Lock → Validation → History →
/// Document).
typedef DocumentCommandSink =
    CommandResult Function(
      DocumentCommand command, {
      CommandSource source,
      String author,
      AiProvenanceRecord? provenance,
    });

/// The **Layer Runtime** (Scope B): the runtime orchestration layer between
/// panel/tool intent and the frozen document runtime for layer operations.
///
/// It introduces **no new layer semantics** and **never mutates
/// [LayerModel]**. It is a thin orchestration shell that:
/// - holds the **active layer reference** (an id into the current layer tree);
/// - exposes the **frozen** [LayerModel] traversal (`findById`,
///   `descendantsAndSelf`) to downstream runtimes;
/// - **emits existing frozen [DocumentCommand]s** (create/delete/move/rename/
///   setLayerMetadata) — building the command value only, never reducing it;
/// - **forwards** those commands to the document runtime via the injected
///   [DocumentCommandSink] (`DocumentEngine.apply`), returning its
///   [CommandResult] verbatim.
///
/// It never executes layer mutations itself, never replaces the document
/// reducer, and never reinterprets a [CommandResult]. All layer behaviour
/// (reordering, deletion, inverse, locking, history) stays in the frozen
/// `core_document` reducer (ADR-0014); all layer vocabulary stays in the
/// frozen `core_layer` (ADR-0006). Both are reused exactly, never redefined.
///
/// **M19 / NDH-1 Form A — design-node structural-movement emission.**
/// Product-owner governance authorized this runtime as the *single* owner of
/// design-node structural-movement emission ([moveDesignNode]): it may build
/// the frozen `DocumentCommand.moveDesignNode` value from presentation intent
/// and forward it through the same [DocumentCommandSink]. That is an additive
/// ownership extension and nothing more — no new command, model, sink or
/// mutation entry, and no change to any responsibility above. Node semantics,
/// locks, validation, history, inverses, revision and dirty state all stay
/// inside the frozen `core_document` pipeline, and that package's node/layer
/// separation is untouched: this runtime emits both command families, it
/// merges neither.
///
/// **M21 Form A — design-node structural/attribute editing emission.**
/// Product-owner governance extended that *same* ownership surface to the
/// remaining already-frozen design-tree commands: [createDesignNode],
/// [deleteDesignNode], [renameDesignNode], [setNodeVisibility],
/// [setNodeLocked], [setNodeMetadata] and [duplicateDesignNode]. It is an
/// ownership extension only, on the identical emit-and-forward discipline: the
/// commands, their reducer behaviour and their inverses were already frozen
/// (ADR-0015); this runtime adds no semantics to any of them. Node grammar and
/// the capability matrix (Architecture V2 §4.2) stay engine-enforced — this
/// runtime never pre-empts a reducer decision, and [duplicateDesignNode]
/// carries the caller's pre-cloned subtree exactly as the frozen command
/// requires (`DesignTreeOps.cloneWithIds`).
///
/// **Motif artwork stage — asset registration emission.** The same ownership
/// surface covers the already-frozen [importAsset] command. ADR-0016 decision 4
/// froze exactly this shape — tree nodes "ONLY reference assets (frozen
/// metadata keys, written via the existing command bus — no new commands, no
/// schema change)" — so artwork import needs no new command, model, sink or
/// mutation entry: it is the identical emit-and-forward discipline over a
/// command whose reducer behaviour and exact inverse were frozen in M2. The
/// document's `AssetRegistry` therefore keeps exactly ONE authority
/// (`DocumentEngine.apply`) and no parallel asset mutation path exists. This
/// runtime builds no asset identity, hashes no content and owns no catalogue.
final class LayerRuntime {
  /// Creates a runtime that forwards commands through [sink] (bind to
  /// `DocumentEngine.apply`), optionally seeded with an [activeLayerId].
  LayerRuntime({required DocumentCommandSink sink, String? activeLayerId})
    : _sink = sink, // ignore: prefer_initializing_formals
      _activeLayerId = activeLayerId; // ignore: prefer_initializing_formals

  final DocumentCommandSink _sink;
  String? _activeLayerId;

  /// The active layer id, for downstream runtimes (panels/tools) to read.
  String? get activeLayerId => _activeLayerId;

  /// Sets the active layer reference. This is a pure reference update — it
  /// changes no document state and emits no command.
  void setActiveLayer(String? layerId) => _activeLayerId = layerId;

  // ------------------------------------------------------------- traversal
  // Read-only access via the frozen LayerModel helpers. The caller supplies
  // the current (immutable) layer root — the runtime holds no layer state and
  // performs no traversal maths of its own.

  /// Finds a layer by [id] within [root], via the frozen
  /// [LayerModel.findById]. Returns null when absent.
  LayerModel? findById(LayerModel root, String id) => root.findById(id);

  /// The active layer resolved within [root], or null when there is no active
  /// reference or it is not present. Uses the frozen [LayerModel.findById].
  LayerModel? activeLayer(LayerModel root) =>
      _activeLayerId == null ? null : root.findById(_activeLayerId!);

  /// Depth-first traversal of [root] and its descendants, via the frozen
  /// [LayerModel.descendantsAndSelf].
  Iterable<LayerModel> descendantsAndSelf(LayerModel root) =>
      root.descendantsAndSelf;

  // ------------------------------------------------- emit + forward commands
  // Each helper builds an existing frozen DocumentCommand and forwards it to
  // the document runtime. The runtime performs no mutation and no reduction —
  // the frozen reducer owns all layer behaviour and returns the CommandResult.

  /// Emits a frozen [CreateLayerCommand] and forwards it to the document
  /// runtime. [parentLayerId] null targets the artboard layer root; [index]
  /// null appends.
  CommandResult createLayer({
    required String artboardId,
    required LayerModel layer,
    String? parentLayerId,
    int? index,
    CommandSource source = CommandSource.user,
    String author = 'local',
  }) => _sink(
    DocumentCommand.createLayer(
      artboardId: artboardId,
      parentLayerId: parentLayerId,
      layer: layer,
      index: index,
    ),
    source: source,
    author: author,
  );

  /// Emits a frozen [DeleteLayerCommand] and forwards it.
  CommandResult deleteLayer({
    required String artboardId,
    required String layerId,
    CommandSource source = CommandSource.user,
    String author = 'local',
  }) => _sink(
    DocumentCommand.deleteLayer(artboardId: artboardId, layerId: layerId),
    source: source,
    author: author,
  );

  /// Emits a frozen [MoveLayerCommand] and forwards it.
  CommandResult moveLayer({
    required String artboardId,
    required String layerId,
    required String newParentId,
    required int index,
    CommandSource source = CommandSource.user,
    String author = 'local',
  }) => _sink(
    DocumentCommand.moveLayer(
      artboardId: artboardId,
      layerId: layerId,
      newParentId: newParentId,
      index: index,
    ),
    source: source,
    author: author,
  );

  /// Emits a frozen [RenameLayerCommand] and forwards it.
  CommandResult renameLayer({
    required String artboardId,
    required String layerId,
    required String name,
    CommandSource source = CommandSource.user,
    String author = 'local',
  }) => _sink(
    DocumentCommand.renameLayer(
      artboardId: artboardId,
      layerId: layerId,
      name: name,
    ),
    source: source,
    author: author,
  );

  /// Emits a frozen [SetLayerMetadataCommand] and forwards it. A null [value]
  /// removes the entry (frozen reducer semantics).
  CommandResult setLayerMetadata({
    required String artboardId,
    required String layerId,
    required String key,
    Object? value,
    CommandSource source = CommandSource.user,
    String author = 'local',
  }) => _sink(
    DocumentCommand.setLayerMetadata(
      artboardId: artboardId,
      layerId: layerId,
      key: key,
      value: value,
    ),
    source: source,
    author: author,
  );

  // ----------------------------------- design-node structural movement (M19)
  // The authorized design-node emission surface (NDH-1, Form A). Same
  // emit-and-forward discipline as the layer helpers above: build the frozen
  // command value, forward it through the injected sink, return the frozen
  // result verbatim.

  /// Emits the frozen [MoveDesignNodeCommand] and forwards it to the document
  /// runtime.
  ///
  /// Structural movement only: [newParentId] and [index] address the design
  /// tree position, covering sibling-list reorder (same parent, new index) and
  /// parent-changing movement (new parent, given index). There is no
  /// coordinate operand — the frozen command carries none.
  ///
  /// The runtime builds the value and forwards it: no traversal, no
  /// validation, no lock check, no history and no mutation happen here, and
  /// the [CommandResult] is returned verbatim.
  CommandResult moveDesignNode({
    required String artboardId,
    required String nodeId,
    required String newParentId,
    required int index,
    CommandSource source = CommandSource.user,
    String author = 'local',
  }) => _sink(
    DocumentCommand.moveDesignNode(
      artboardId: artboardId,
      nodeId: nodeId,
      newParentId: newParentId,
      index: index,
    ),
    source: source,
    author: author,
  );

  // ------------------------------ design-node structural/attribute editing
  // M21 Form A. Identical discipline to every helper above: build one frozen
  // command value from primitive operands, forward it through the injected
  // sink, return the frozen result verbatim. No traversal, no validation, no
  // capability check, no lock check, no history and no mutation happen here.

  /// Emits the frozen [CreateDesignNodeCommand] and forwards it.
  /// [parentNodeId] null targets the artboard design-tree root; [index] null
  /// appends. The caller supplies the frozen [DesignNode] — this runtime
  /// neither builds nor mutates node content.
  CommandResult createDesignNode({
    required String artboardId,
    required DesignNode node,
    String? parentNodeId,
    int? index,
    CommandSource source = CommandSource.user,
    String author = 'local',
  }) => _sink(
    DocumentCommand.createDesignNode(
      artboardId: artboardId,
      parentNodeId: parentNodeId,
      node: node,
      index: index,
    ),
    source: source,
    author: author,
  );

  /// Emits the frozen [DeleteDesignNodeCommand] and forwards it.
  CommandResult deleteDesignNode({
    required String artboardId,
    required String nodeId,
    CommandSource source = CommandSource.user,
    String author = 'local',
  }) => _sink(
    DocumentCommand.deleteDesignNode(artboardId: artboardId, nodeId: nodeId),
    source: source,
    author: author,
  );

  /// Emits the frozen [RenameDesignNodeCommand] and forwards it. The empty-name
  /// and capability rules are the frozen reducer's, not this runtime's.
  CommandResult renameDesignNode({
    required String artboardId,
    required String nodeId,
    required String name,
    CommandSource source = CommandSource.user,
    String author = 'local',
  }) => _sink(
    DocumentCommand.renameDesignNode(
      artboardId: artboardId,
      nodeId: nodeId,
      name: name,
    ),
    source: source,
    author: author,
  );

  /// Emits the frozen [SetNodeVisibilityCommand] and forwards it.
  CommandResult setNodeVisibility({
    required String artboardId,
    required String nodeId,
    required bool visible,
    CommandSource source = CommandSource.user,
    String author = 'local',
  }) => _sink(
    DocumentCommand.setNodeVisibility(
      artboardId: artboardId,
      nodeId: nodeId,
      visible: visible,
    ),
    source: source,
    author: author,
  );

  /// Emits the frozen [SetNodeLockedCommand] and forwards it. This is the
  /// node-level lock flag of the frozen command vocabulary — the authoritative
  /// Lock Engine is untouched and still runs first inside the engine.
  CommandResult setNodeLocked({
    required String artboardId,
    required String nodeId,
    required bool locked,
    CommandSource source = CommandSource.user,
    String author = 'local',
  }) => _sink(
    DocumentCommand.setNodeLocked(
      artboardId: artboardId,
      nodeId: nodeId,
      locked: locked,
    ),
    source: source,
    author: author,
  );

  /// Emits the frozen [SetNodeMetadataCommand] and forwards it. A null [value]
  /// removes the entry (frozen reducer semantics).
  CommandResult setNodeMetadata({
    required String artboardId,
    required String nodeId,
    required String key,
    Object? value,
    CommandSource source = CommandSource.user,
    String author = 'local',
  }) => _sink(
    DocumentCommand.setNodeMetadata(
      artboardId: artboardId,
      nodeId: nodeId,
      key: key,
      value: value,
    ),
    source: source,
    author: author,
  );

  /// Emits the frozen [DuplicateDesignNodeCommand] and forwards it.
  ///
  /// The frozen command carries a pre-cloned subtree with fresh ids (built by
  /// the caller through `DesignTreeOps.cloneWithIds`); the reducer inserts it as
  /// the next sibling of [sourceNodeId]. This runtime clones nothing and
  /// generates no id.
  CommandResult duplicateDesignNode({
    required String artboardId,
    required String sourceNodeId,
    required DesignNode duplicate,
    CommandSource source = CommandSource.user,
    String author = 'local',
  }) => _sink(
    DocumentCommand.duplicateDesignNode(
      artboardId: artboardId,
      sourceNodeId: sourceNodeId,
      duplicate: duplicate,
    ),
    source: source,
    author: author,
  );

  // ----------------------------------------------- asset registration (M2)
  // The frozen asset command, on the identical emit-and-forward discipline.
  // Registration is the data-dependency prerequisite of a node reference (the
  // approved import ordering `importAsset` → … → `setNodeMetadata`), and the
  // reference itself rides [setNodeMetadata] above — the frozen ADR-0016
  // writer. Nothing here validates, dedups, hashes or reference-counts: the
  // frozen reducer owns the registry's dedup and its exact inverse, and the
  // caller owns asset identity and content.

  /// Emits the frozen [ImportAssetCommand] and forwards it. The caller
  /// supplies the frozen [AssetRecord] — this runtime neither builds asset
  /// identity nor owns any bitmap data.
  CommandResult importAsset({
    required AssetRecord asset,
    CommandSource source = CommandSource.user,
    String author = 'local',
  }) => _sink(
    DocumentCommand.importAsset(asset: asset),
    source: source,
    author: author,
  );
}
