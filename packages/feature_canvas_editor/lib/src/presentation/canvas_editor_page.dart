import 'package:core_canvas/core_canvas.dart';
import 'package:core_canvas_runtime/core_canvas_runtime.dart';
import 'package:core_design_system/core_design_system.dart';
import 'package:core_interaction/core_interaction.dart';
import 'package:core_render/core_render.dart';
import 'package:feature_canvas_editor/src/render/canvas_artwork.dart';
import 'package:feature_canvas_editor/src/render/canvas_placement.dart';
import 'package:feature_canvas_editor/src/render/canvas_surface_painter.dart';
import 'package:feature_canvas_editor/src/render/flutter_render_session.dart';
import 'package:feature_canvas_editor/src/render/render_palette.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;
import 'package:flutter/material.dart' hide RenderObject;
import 'package:flutter/services.dart';

/// Builds the canvas's runtime for the surface's current [viewport] and its
/// current [hitTester] — the frozen `CanvasRuntimeContract` (ADR-0018).
///
/// Supplied by the composition root, which owns the one runtime composition
/// (`CompositeCanvasRuntime`) and therefore the one selection authority. The
/// surface never constructs a selection owner of its own; unsupplied, it falls
/// back to the frozen M6 `InteractionSession`, whose `selection` is the
/// deliberate empty stub.
typedef CanvasRuntimeBuilder =
    CanvasRuntimeContract Function({
      required ViewportState viewport,
      required HitTestContract hitTester,
    });

/// One report of an in-flight content-move gesture on an already-selected node
/// (NDH-2, authorized for canvas motif movement only).
///
/// It is a presentation report, not a command: it carries the frozen
/// [GesturePhase], the existing `DesignNode.id` the gesture grabbed and the
/// gesture's **total** displacement in document space — already converted by the
/// frozen `CoordinateConversion` over the single shared viewport, so no
/// coordinate maths crosses this boundary. It carries no transform, no document
/// state and no intent to persist: what the composition root does with it is the
/// composition root's decision.
final class CanvasMoveGesture {
  const CanvasMoveGesture({
    required this.phase,
    required this.nodeId,
    required this.documentDelta,
  });

  /// The frozen lifecycle phase of the gesture.
  final GesturePhase phase;

  /// The existing node identity the gesture grabbed — a reference, never a node.
  final String nodeId;

  /// Total displacement since the gesture began, in document space.
  /// [Point2D.zero] at [GesturePhase.start].
  final Point2D documentDelta;
}

/// The node currently carrying an EPHEMERAL in-flight transform, and that
/// transform. Null when no move is in flight.
typedef CanvasMovePreview = ({String nodeId, Transform2D transform});

/// Reads the live in-flight preview from whoever owns it. A reader rather than a
/// value because the transform it exposes changes within a single gesture, and
/// the owner is the frozen `TransformRuntime` at the composition root — never
/// this surface.
typedef CanvasMovePreviewReader = CanvasMovePreview? Function();

/// The Canvas module's visual surface.
///
/// Presentation boundary: this page is a **projection and an intent source**,
/// never an authority. It receives the [RenderGraph] the frozen `GraphCompiler`
/// produced from the real document at the composition root, drives the frozen
/// render pipeline onto a Flutter surface through the [FlutterRenderBackend],
/// and feeds pointer input into the frozen `CanvasRuntimeContract`, which
/// resolves it to an existing node identity through the frozen `RenderSession`
/// / `HitTestContract` and routes it into the frozen selection owner.
///
/// A drag that begins on content the user had **already selected** is reported
/// to the composition root as a [CanvasMoveGesture] (NDH-2, authorized for
/// canvas motif movement only). The page decides nothing about that node:
/// whether it is a movable individual printed motif, what its transform is and
/// whether a settled move is persisted all belong to the composition root and
/// the frozen runtimes behind it. While a move is in flight the page presents
/// the EPHEMERAL transform the frozen `TransformRuntime` holds
/// ([movePreview]) — one frame's projection of a gesture, never document state.
///
/// It builds no `DocumentCommand`, holds no document state, owns no selection
/// and writes no transform: `DocumentEngine.apply` remains the sole mutation
/// authority and this page never reaches it.
///
/// Unwired (no [graph]) it stays the module placeholder.
class CanvasEditorPage extends StatefulWidget {
  const CanvasEditorPage({
    super.key,
    this.graph,
    this.target = const RenderTarget(kind: RenderTargetKind.editor),
    this.artwork = const <CanvasArtworkSource>[],
    this.runtimeBuilder,
    this.onNodeHit,
    this.onMoveGesture,
    this.movePreview,
    this.metricsSink,
  });

  /// The compiled graph of the current document revision, from the frozen
  /// compiler at the composition root. Null leaves the module unwired.
  final RenderGraph? graph;

  /// The frozen target policy this surface renders for (the editor target).
  final RenderTarget target;

  /// Artwork the document's nodes reference, already resolved out of the frozen
  /// content-addressed store by the composition root.
  final List<CanvasArtworkSource> artwork;

  /// The composition root's runtime builder. When supplied, input flows into
  /// that runtime and the live selection it routes is what this surface
  /// presents.
  final CanvasRuntimeBuilder? runtimeBuilder;

  /// Reports the node identity a pointer resolved to, or null for empty canvas.
  /// A read-only notification — the surface asks for nothing to change.
  final void Function(String? nodeId)? onNodeHit;

  /// Reports each phase of a drag that began on already-selected content.
  /// Unwired, a drag still flows through the frozen input pipeline and moves
  /// nothing.
  final void Function(CanvasMoveGesture gesture)? onMoveGesture;

  /// Reads the live EPHEMERAL in-flight transform to present. Unwired, the
  /// surface presents the compiled graph verbatim.
  final CanvasMovePreviewReader? movePreview;

  /// Optional frozen per-frame metrics observer (§G).
  final RenderMetricsSink? metricsSink;

  @override
  State<CanvasEditorPage> createState() => _CanvasEditorPageState();
}

class _CanvasEditorPageState extends State<CanvasEditorPage> {
  /// Decoded artwork by referencing node id. Owned here because the images are;
  /// released with the surface.
  Map<String, ResolvedCanvasArtwork> _artwork =
      const <String, ResolvedCanvasArtwork>{};

  /// The node identity the last pointer resolved to. Read-only echo of a hit
  /// test — not selection state, and never written to the document.
  String? _hitNodeId;

  /// The frozen selection-overlay ids this surface currently has contributed,
  /// so stale ones are withdrawn when the live selection changes. Bookkeeping
  /// only — the selection itself lives in the runtime's selection owner.
  Set<String> _selectionOverlayIds = const <String>{};

  /// Deterministic, injected frame identity (never wall-clock).
  int _frameId = 0;

  /// Where the in-flight drag went down, in this surface's local coordinates.
  /// The gesture's total displacement is measured from here, so it is a pure
  /// function of (origin, current) — no accumulation and no drift.
  Offset? _dragOrigin;

  /// The most recent local position of the in-flight drag. The end and cancel
  /// callbacks of a Flutter drag carry no usable position, so the frozen
  /// `InteractionEvent.drag` they feed is positioned from here.
  Offset? _dragLocal;

  /// The already-selected node this drag grabbed, or null when the drag grabbed
  /// nothing selected — then no move is reported and nothing moves. Bookkeeping
  /// for the gesture only: the move itself lives in the composition root's
  /// frozen `TransformRuntime`.
  String? _dragNodeId;

  /// The frozen resource registry of this surface: artwork textures are
  /// acquired by their content-addressed [ResourceKey] here, so ref counts
  /// survive across frames instead of being rebuilt every paint.
  final ResourceRegistry _resources = ResourceRegistryImpl();

  @override
  void initState() {
    super.initState();
    _resolveArtwork();
  }

  @override
  void didUpdateWidget(CanvasEditorPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!_sameArtwork(oldWidget.artwork, widget.artwork)) {
      _resolveArtwork();
    }
  }

  @override
  void dispose() {
    _releaseArtwork();
    super.dispose();
  }

  Future<void> _resolveArtwork() async {
    final resolved = await resolveCanvasArtwork(widget.artwork);
    if (!mounted) {
      for (final artwork in resolved.values) {
        artwork.image.dispose();
      }
      return;
    }
    setState(() {
      _releaseArtwork();
      _artwork = resolved;
      _frameId++;
    });
  }

  void _releaseArtwork() {
    for (final artwork in _artwork.values) {
      artwork.image.dispose();
    }
    _artwork = const <String, ResolvedCanvasArtwork>{};
  }

  static bool _sameArtwork(
    List<CanvasArtworkSource> a,
    List<CanvasArtworkSource> b,
  ) {
    if (a.length != b.length) {
      return false;
    }
    for (var i = 0; i < a.length; i++) {
      if (a[i].nodeId != b[i].nodeId || a[i].contentHash != b[i].contentHash) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final graph = widget.graph;
    if (graph == null) {
      return const ModulePlaceholderView(
        icon: Icons.design_services_outlined,
        moduleName: 'Canvas',
        description:
            'The element-level editing surface: selection, transforms, zones and node-scoped repeats.',
        packageId: 'feature_canvas_editor',
        milestone: 'M4',
      );
    }
    final colors = context.febricColors;
    final palette = _paletteOf(colors);
    return ColoredBox(
      key: const Key('canvas-surface-ground'),
      color: colors.canvas,
      child: LayoutBuilder(
        builder: (context, constraints) => _surface(
          graph: graph,
          palette: palette,
          constraints: constraints,
          devicePixelRatio: MediaQuery.devicePixelRatioOf(context),
        ),
      ),
    );
  }

  Widget _surface({
    required RenderGraph graph,
    required CanvasRenderPalette palette,
    required BoxConstraints constraints,
    required double devicePixelRatio,
  }) {
    // What the document itself projects: every object's own persisted transform
    // folded into the frozen document-space bounds the frozen consumers read.
    final placed = placedGraph(graph);

    // The single shared viewport (R4), fitted through the frozen `ViewportOps`
    // — no viewport maths is written here. Derived from the DOCUMENT's own
    // extent, never the in-flight one: an ephemeral move must not re-fit the
    // camera under the gesture that is producing it.
    final viewport = ViewportState(
      canvasSize: _documentExtent(placed),
      screenSize: Size2D(
        width: constraints.maxWidth,
        height: constraints.maxHeight,
      ),
      devicePixelRatio: devicePixelRatio,
    ).fittedToScreen();

    // What this frame presents: the document projection, or — while a move is in
    // flight — the same projection with the moving node carrying the EPHEMERAL
    // transform instead of its persisted one. One graph feeds painting, hit
    // testing and the overlays, so all three agree on where the motif is.
    final preview = widget.movePreview?.call();
    final presented = preview == null
        ? placed
        : placedGraph(
            withInFlightTransform(
              graph,
              nodeId: preview.nodeId,
              transform: preview.transform,
            ),
          );

    final renderContext = RenderContext(
      viewport: viewport,
      coordinateSystem: widget.target.coordinateSystem,
      colourSpace: widget.target.colourSpace,
      frameId: _frameId,
    );

    // The frozen RenderSession (= the frozen HitTestContract), injected into
    // the frozen canvas runtime exactly as M6 reserved. Which runtime that is
    // belongs to the composition root: supplied, it is the one runtime
    // composition that owns the selection authority; unsupplied, the frozen M6
    // session, whose `selection` is the deliberate empty stub.
    final hitTester = FlutterRenderSession(
      target: widget.target,
      context: renderContext,
      graph: presented,
    );
    final runtime =
        widget.runtimeBuilder?.call(viewport: viewport, hitTester: hitTester) ??
        InteractionSession(
          state: CanvasRuntimeState(
            camera: NavigationState(viewport: viewport),
            coordinateSystem: widget.target.coordinateSystem,
          ),
          hitTester: hitTester,
        );

    _publishOverlays(runtime, presented);

    return Semantics(
      label: 'Garment design canvas',
      child: GestureDetector(
        key: const Key('canvas-surface-gestures'),
        behavior: HitTestBehavior.opaque,
        // A grab starts where the finger went down, not where the recognizer
        // won the arena: the gesture's own slop must not shift the point the
        // hit test resolves, or a small motif could be grabbed from outside
        // itself and would jump by the slop on the first update.
        dragStartBehavior: DragStartBehavior.down,
        onTapUp: (details) => _onTap(runtime, details.localPosition),
        onPanStart: (details) => _onDragStart(runtime, details.localPosition),
        onPanUpdate: (details) =>
            _onDragUpdate(runtime, viewport, details.localPosition),
        onPanEnd: (_) => _onDragEnd(runtime, viewport),
        onPanCancel: () => _onDragCancel(runtime),
        child: RepaintBoundary(
          child: CustomPaint(
            key: const Key('canvas-surface'),
            size: Size(constraints.maxWidth, constraints.maxHeight),
            painter: CanvasSurfacePainter(
              graph: presented,
              renderContext: renderContext,
              palette: palette,
              resources: _resources,
              artwork: _artwork,
              overlays: runtime.overlays,
              metricsSink: widget.metricsSink,
            ),
          ),
        ),
      ),
    );
  }

  /// Publishes what the surface presents as canvas chrome, through the frozen
  /// overlay runtime and nothing else:
  ///
  /// - one `OverlayKind.selection` overlay per **selected** node, derived from
  ///   the runtime's own live `SelectionState` — the authority, never a copy
  ///   held here;
  /// - the established read-only `OverlayKind.hover` echo of the last hit.
  ///
  /// Derived every build so a recomposed runtime (a resize, a new revision)
  /// re-acquires the overlays the live selection still implies. `contribute`
  /// replaces by id, so this is idempotent and paints in the stack's own
  /// frozen deterministic order.
  void _publishOverlays(CanvasRuntimeContract runtime, RenderGraph graph) {
    final selected = runtime.selection.selectedIds;
    final wanted = <String>{};
    for (final nodeId in selected) {
      final bounds = _boundsOf(graph, nodeId);
      if (bounds == null) {
        continue;
      }
      final overlayId = '$_selectionOverlayPrefix$nodeId';
      wanted.add(overlayId);
      runtime.contribute(
        OverlayModel(
          id: overlayId,
          kind: OverlayKind.selection,
          references: [nodeId],
          bounds: bounds,
        ),
      );
    }
    for (final stale in _selectionOverlayIds.difference(wanted)) {
      runtime.withdraw(stale);
    }
    _selectionOverlayIds = wanted;

    final hitNodeId = _hitNodeId;
    final hitBounds = hitNodeId == null ? null : _boundsOf(graph, hitNodeId);
    if (hitNodeId != null && hitBounds != null) {
      runtime.contribute(
        OverlayModel(
          id: _hitOverlayId,
          kind: OverlayKind.hover,
          references: [hitNodeId],
          bounds: hitBounds,
        ),
      );
    } else {
      runtime.withdraw(_hitOverlayId);
    }
  }

  /// Routes a tap through the frozen Universal Input Contract.
  ///
  /// `handleInput` is the single input pipeline: the runtime classifies the tap
  /// as a content gesture, resolves it through the injected hit tester, and —
  /// when the composition root supplied the one runtime composition — routes
  /// the resulting hit into the frozen selection owner using the modifiers the
  /// frozen event carries. The separate `hitTest` call reads the same identity
  /// for the read-only hover echo; hit testing is pure, so evaluating it twice
  /// changes nothing and writes nothing.
  ///
  /// Nothing here mutates the document: no `DocumentCommand` is built, no
  /// transform is written, and `DesignNode.selected` is never touched.
  void _onTap(CanvasRuntimeContract runtime, Offset localPosition) {
    final point = Point2D(x: localPosition.dx, y: localPosition.dy);
    runtime.handleInput(
      InteractionEvent.tap(
        position: point,
        device: InputDevice.mouse,
        modifiers: _modifiers(),
      ),
    );
    final hit = runtime.hitTest(HitTestQuery(screenPoint: point));
    final nodeId = hit.isNodeHit ? hit.semanticNodeId : null;
    setState(() {
      _hitNodeId = nodeId;
      _frameId++;
    });
    widget.onNodeHit?.call(nodeId);
  }

  /// Begins a content drag through the frozen Universal Input Contract.
  ///
  /// The frozen `InputDispatcher` routes a [DragInteraction] to **content** (it
  /// is one of the three content gestures, ADR-0003), so the drag enters the
  /// same single pipeline a tap does and the frozen selection policy keeps
  /// deciding how its own hit combines.
  ///
  /// NDH-2 admits the *movement* only on content the user had **already
  /// selected**, so the selection is snapshotted before the event is fed in: a
  /// drag that grabs something unselected selects it and moves nothing, exactly
  /// as a tap would. Nothing here decides whether the grabbed node may move —
  /// the composition root does, and it may ignore this report entirely.
  void _onDragStart(CanvasRuntimeContract runtime, Offset localPosition) {
    final point = _pointOf(localPosition);
    final selectedBefore = runtime.selection.selectedIds.toSet();
    final hit = runtime.hitTest(HitTestQuery(screenPoint: point));
    final nodeId = hit.isNodeHit ? hit.semanticNodeId : null;
    runtime.handleInput(
      InteractionEvent.drag(
        phase: GesturePhase.start,
        position: point,
        device: InputDevice.mouse,
        modifiers: _modifiers(),
      ),
    );
    final grabbed = nodeId != null && selectedBefore.contains(nodeId)
        ? nodeId
        : null;
    _dragOrigin = localPosition;
    _dragLocal = localPosition;
    _dragNodeId = grabbed;
    if (grabbed != null) {
      widget.onMoveGesture?.call(
        CanvasMoveGesture(
          phase: GesturePhase.start,
          nodeId: grabbed,
          documentDelta: Point2D.zero,
        ),
      );
    }
    setState(() {
      _hitNodeId = nodeId;
      _frameId++;
    });
    widget.onNodeHit?.call(nodeId);
  }

  /// Continues the drag: the frozen event first (screen-space delta, the units
  /// the frozen `InteractionEvent` documents), then the move report carrying the
  /// gesture's total displacement in document space. Reporting before the
  /// rebuild is what makes the movement live — the owner has already advanced
  /// its ephemeral transform by the time this frame reads it back.
  void _onDragUpdate(
    CanvasRuntimeContract runtime,
    ViewportState viewport,
    Offset localPosition,
  ) {
    final previous = _dragLocal ?? localPosition;
    runtime.handleInput(
      InteractionEvent.drag(
        phase: GesturePhase.update,
        position: _pointOf(localPosition),
        delta: _pointOf(localPosition - previous),
        device: InputDevice.mouse,
        modifiers: _modifiers(),
      ),
    );
    _dragLocal = localPosition;
    final nodeId = _dragNodeId;
    if (nodeId != null) {
      widget.onMoveGesture?.call(
        CanvasMoveGesture(
          phase: GesturePhase.update,
          nodeId: nodeId,
          documentDelta: _documentDelta(viewport, localPosition),
        ),
      );
    }
    setState(() => _frameId++);
  }

  /// Settles the drag. The frozen end event is fed in *before* the report, so
  /// the move is still in flight while the runtime routes it — the drag stays a
  /// content move to the very last event and never becomes a selection change.
  void _onDragEnd(CanvasRuntimeContract runtime, ViewportState viewport) {
    final local = _dragLocal;
    if (local != null) {
      runtime.handleInput(
        InteractionEvent.drag(
          phase: GesturePhase.end,
          position: _pointOf(local),
          device: InputDevice.mouse,
          modifiers: _modifiers(),
        ),
      );
    }
    final nodeId = _dragNodeId;
    if (nodeId != null && local != null) {
      widget.onMoveGesture?.call(
        CanvasMoveGesture(
          phase: GesturePhase.end,
          nodeId: nodeId,
          documentDelta: _documentDelta(viewport, local),
        ),
      );
    }
    _endDrag();
  }

  /// Abandons the drag (the pointer was taken away). The frozen cancel event is
  /// positioned from the last known point, and the report tells the owner to
  /// drop its ephemeral transform — nothing was ever written, so nothing is
  /// rolled back.
  void _onDragCancel(CanvasRuntimeContract runtime) {
    final local = _dragLocal;
    if (local != null) {
      runtime.handleInput(
        InteractionEvent.drag(
          phase: GesturePhase.cancel,
          position: _pointOf(local),
          device: InputDevice.mouse,
          modifiers: _modifiers(),
        ),
      );
    }
    final nodeId = _dragNodeId;
    if (nodeId != null) {
      widget.onMoveGesture?.call(
        CanvasMoveGesture(
          phase: GesturePhase.cancel,
          nodeId: nodeId,
          documentDelta: Point2D.zero,
        ),
      );
    }
    _endDrag();
  }

  void _endDrag() {
    _dragOrigin = null;
    _dragLocal = null;
    _dragNodeId = null;
    setState(() => _frameId++);
  }

  /// The gesture's total displacement in **document** space, through the frozen
  /// named pipeline stage over the single shared viewport. Two conversions and
  /// the frozen `Point2D -`: no coordinate maths is written here, and because it
  /// is measured from the origin the result is a pure function of the two
  /// endpoints.
  Point2D _documentDelta(ViewportState viewport, Offset localPosition) {
    final origin = _dragOrigin;
    if (origin == null) {
      return Point2D.zero;
    }
    final conversion = CoordinateConversion(viewport);
    return conversion.screenToDocument(_pointOf(localPosition)) -
        conversion.screenToDocument(_pointOf(origin));
  }

  /// A local Flutter offset as the frozen geometry primitive — the boundary
  /// conversion the frozen `Point2D` documents ("shell layers convert at the
  /// boundary").
  static Point2D _pointOf(Offset offset) => Point2D(x: offset.dx, y: offset.dy);

  /// The live keyboard modifiers as the frozen [KeyModifiers] snapshot — the
  /// boundary translation the frozen `InteractionEvent` documents ("shell
  /// layers translate raw Flutter/pointer input into these events at the
  /// boundary"). The combine policy itself stays frozen in
  /// `SelectionMode.forModifiers`; nothing is decided here.
  static KeyModifiers _modifiers() {
    final keyboard = HardwareKeyboard.instance;
    return KeyModifiers(
      control: keyboard.isControlPressed,
      shift: keyboard.isShiftPressed,
      alt: keyboard.isAltPressed,
      meta: keyboard.isMetaPressed,
    );
  }

  /// The document-space extent the graph occupies, from the compiled objects'
  /// own frozen bounds through the frozen bounding-box primitive. No layout,
  /// measurement or bounds engine is introduced: this reads what the producers
  /// already computed.
  static Size2D _documentExtent(RenderGraph graph) {
    if (graph.objects.isEmpty) {
      return const Size2D(width: 1, height: 1);
    }
    final extent = Rect2D.boundingPoints([
      Point2D.zero,
      for (final object in graph.objects)
        Point2D(x: object.bounds.right, y: object.bounds.bottom),
    ]);
    return Size2D(
      width: extent.right <= 0 ? 1 : extent.right,
      height: extent.bottom <= 0 ? 1 : extent.bottom,
    );
  }

  static Rect2D? _boundsOf(RenderGraph graph, String nodeId) {
    for (final object in graph.objects) {
      if (object.source.refId == nodeId) {
        return object.bounds;
      }
    }
    return null;
  }

  CanvasRenderPalette _paletteOf(FebricColors colors) => CanvasRenderPalette(
    structure: colors.hairlineStrong,
    fabric: colors.surface,
    fill: colors.accentSoft,
    motif: colors.accent,
    border: colors.inkSecondary,
    texture: colors.info,
    shadow: colors.scrim,
    image: colors.success,
    preview: colors.warning,
    highlight: colors.focusRing,
  );

  static const String _hitOverlayId = 'canvas-hit';

  /// Id prefix of the frozen selection overlays this surface contributes; the
  /// node id follows, so one overlay exists per selected node.
  static const String _selectionOverlayPrefix = 'canvas-selection:';
}
