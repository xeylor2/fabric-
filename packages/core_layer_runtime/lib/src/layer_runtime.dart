import 'package:core_document/core_document.dart';
import 'package:core_layer/core_layer.dart';

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
}
