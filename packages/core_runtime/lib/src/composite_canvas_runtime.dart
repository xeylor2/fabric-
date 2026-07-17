import 'package:core_canvas/core_canvas.dart';
import 'package:core_canvas_runtime/core_canvas_runtime.dart';
import 'package:core_document/core_document.dart';
// Transform2D / Point2D come through core_interaction's re-export of
// core_geometry (kept as a direct pubspec dependency — public API types).
import 'package:core_interaction/core_interaction.dart';
import 'package:core_layer/core_layer.dart';
import 'package:core_layer_runtime/core_layer_runtime.dart';
import 'package:core_selection_runtime/core_selection_runtime.dart';
import 'package:core_tooling/core_tooling.dart';
import 'package:core_transform_runtime/core_transform_runtime.dart';

/// The **Runtime Composition Layer** (M10): the single object that owns the
/// four runtimes and connects them into the frozen canvas flow
/// (ADR-0018):
///
/// ```
/// User → Canvas Runtime → Viewport → Hit Testing → Selection → Tool
/// ```
///
/// It **implements the frozen [CanvasRuntimeContract]** — it is not a parallel
/// orchestration surface. Every contract member delegates to the wrapped
/// [InteractionSession] (M6), except the two the composition exists to wire:
///
/// - [handleInput] completes the frozen `Hit Testing → Selection` edge by
///   feeding the session's `lastHit` into the [SelectionRuntime] (M7), using
///   the modifiers the frozen [InteractionEvent] already carries;
/// - [selection] returns the live routed selection from the [SelectionRuntime]
///   — the piece M6's `InteractionSession` deliberately stubbed to
///   [SelectionState.empty] (the canvas *routes* selection, never owns it).
///
/// Alongside the contract it exposes **caller-initiated** pass-throughs for the
/// transform (M8) and layer (M9) runtimes. Raw input never drives those — the
/// composition honours M8 (no gesture→transform mapping) and M9 (no implicit
/// mutation): transform/layer operations happen only through these explicit
/// entry points.
///
/// The composition introduces **no new model, vocabulary or business logic**.
/// Selection combine policy stays in the frozen `SelectionState`; transform
/// maths stays in the frozen `Transform2D`; all layer mutation stays in the
/// frozen `core_document` reducer, reached only through the [LayerRuntime]'s
/// injected sink. This class holds references and orders calls — nothing more.
final class CompositeCanvasRuntime implements CanvasRuntimeContract {
  /// Composes four already-built runtimes. The composition builds none of
  /// them: the [InteractionSession]'s hit-tester and the [LayerRuntime]'s
  /// document sink remain the caller's wiring responsibility.
  CompositeCanvasRuntime({
    required InteractionSession interaction,
    required SelectionRuntime selection,
    required TransformRuntime transform,
    required LayerRuntime layer,
  }) : _interaction = interaction, // ignore: prefer_initializing_formals
       _selection = selection, // ignore: prefer_initializing_formals
       _transform = transform, // ignore: prefer_initializing_formals
       _layer = layer; // ignore: prefer_initializing_formals

  final InteractionSession _interaction;
  final SelectionRuntime _selection;
  final TransformRuntime _transform;
  final LayerRuntime _layer;

  // ===================================================== CanvasRuntimeContract
  // Pure delegation to the frozen M6 InteractionSession.

  @override
  CanvasRuntimeState get state => _interaction.state;

  @override
  ViewportState get viewport => _interaction.viewport;

  @override
  CanvasCoordinateSystem get coordinateSystem => _interaction.coordinateSystem;

  @override
  List<CanvasReference> get references => _interaction.references;

  @override
  void applyZoomCommand(ZoomCommand command) =>
      _interaction.applyZoomCommand(command);

  // ------------------------------------------------------ overlay runtime
  @override
  OverlayStack get overlays => _interaction.overlays;

  @override
  void contribute(OverlayModel overlay) => _interaction.contribute(overlay);

  @override
  void withdraw(String overlayId) => _interaction.withdraw(overlayId);

  // ------------------------------------------------------------ hit testing
  @override
  HitTestResult hitTest(HitTestQuery query) => _interaction.hitTest(query);

  @override
  List<String> hitTestRegion(Rect2D region) =>
      _interaction.hitTestRegion(region);

  // ============================================ the wired composition edges

  /// The single input pipeline (frozen Universal Input Contract). Drives the
  /// event through the M6 interaction runtime, then routes the resulting hit
  /// into the M7 selection runtime — completing the frozen
  /// `Hit Testing → Selection` step. Camera-only gestures leave `lastHit`
  /// unchanged and so touch the selection not at all.
  @override
  void handleInput(InteractionEvent event) {
    _interaction.handleInput(event);
    final hit = _interaction.lastHit;
    if (hit != null) {
      _selection.applyHit(hit, modifiers: _modifiersOf(event));
    }
  }

  /// The [KeyModifiers] the frozen event carries. Only the variants that model
  /// a modifiable gesture (tap/drag/wheel) hold them in the frozen
  /// `InteractionEvent`; the rest default to [KeyModifiers.none]. This reads
  /// the frozen field — it defines no new modifier policy.
  KeyModifiers _modifiersOf(InteractionEvent event) => switch (event) {
    TapInteraction(:final modifiers) => modifiers,
    DragInteraction(:final modifiers) => modifiers,
    WheelInteraction(:final modifiers) => modifiers,
    _ => KeyModifiers.none,
  };

  /// The live selection routed through the canvas (which objects). Sourced
  /// from the M7 [SelectionRuntime] — this is the routing M6 stubbed to empty.
  @override
  SelectionState get selection => _selection.selection;

  // ===================================== caller-initiated transform (M8)
  // Explicit only: never driven by raw input (M8 Scope A).

  /// The active transform (frozen `Transform2D`), from the M8 runtime.
  Transform2D get activeTransform => _transform.activeTransform;

  /// Sets the active transform, delegating to the M8 runtime; returns the
  /// frozen value verbatim.
  Transform2D setTransform(Transform2D transform) =>
      _transform.setTransform(transform);

  /// Resets the active transform to `Transform2D.identity` (M8 runtime).
  Transform2D resetTransform() => _transform.reset();

  // ========================================= caller-initiated layer (M9)
  // Explicit only: emits frozen DocumentCommands through the M9 runtime, which
  // forwards them to the frozen document pipeline. No mutation happens here.

  /// The active layer id, from the M9 runtime.
  String? get activeLayerId => _layer.activeLayerId;

  /// Sets the active layer reference (pure reference update, M9 runtime).
  void setActiveLayer(String? layerId) => _layer.setActiveLayer(layerId);

  /// Finds a layer by id within [root] via the frozen `LayerModel.findById`
  /// (M9 traversal delegation).
  LayerModel? findLayerById(LayerModel root, String id) =>
      _layer.findById(root, id);

  /// The active layer resolved within [root] (M9 traversal delegation).
  LayerModel? activeLayer(LayerModel root) => _layer.activeLayer(root);

  /// Emits a frozen `CreateLayerCommand` through the M9 runtime; returns the
  /// frozen [CommandResult] verbatim.
  CommandResult createLayer({
    required String artboardId,
    required LayerModel layer,
    String? parentLayerId,
    int? index,
    CommandSource source = CommandSource.user,
    String author = 'local',
  }) => _layer.createLayer(
    artboardId: artboardId,
    layer: layer,
    parentLayerId: parentLayerId,
    index: index,
    source: source,
    author: author,
  );

  /// Emits a frozen `DeleteLayerCommand` through the M9 runtime.
  CommandResult deleteLayer({
    required String artboardId,
    required String layerId,
    CommandSource source = CommandSource.user,
    String author = 'local',
  }) => _layer.deleteLayer(
    artboardId: artboardId,
    layerId: layerId,
    source: source,
    author: author,
  );

  /// Emits a frozen `MoveLayerCommand` through the M9 runtime.
  CommandResult moveLayer({
    required String artboardId,
    required String layerId,
    required String newParentId,
    required int index,
    CommandSource source = CommandSource.user,
    String author = 'local',
  }) => _layer.moveLayer(
    artboardId: artboardId,
    layerId: layerId,
    newParentId: newParentId,
    index: index,
    source: source,
    author: author,
  );

  /// Emits a frozen `RenameLayerCommand` through the M9 runtime.
  CommandResult renameLayer({
    required String artboardId,
    required String layerId,
    required String name,
    CommandSource source = CommandSource.user,
    String author = 'local',
  }) => _layer.renameLayer(
    artboardId: artboardId,
    layerId: layerId,
    name: name,
    source: source,
    author: author,
  );

  /// Emits a frozen `SetLayerMetadataCommand` through the M9 runtime. A null
  /// [value] removes the entry (frozen reducer semantics).
  CommandResult setLayerMetadata({
    required String artboardId,
    required String layerId,
    required String key,
    Object? value,
    CommandSource source = CommandSource.user,
    String author = 'local',
  }) => _layer.setLayerMetadata(
    artboardId: artboardId,
    layerId: layerId,
    key: key,
    value: value,
    source: source,
    author: author,
  );
}
