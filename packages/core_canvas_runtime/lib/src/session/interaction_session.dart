import 'package:core_canvas/core_canvas.dart';
import 'package:core_canvas_runtime/src/controllers/viewport_controller.dart';
import 'package:core_canvas_runtime/src/cursor/cursor_runtime.dart';
import 'package:core_canvas_runtime/src/input/input_dispatcher.dart';
import 'package:core_interaction/core_interaction.dart';
import 'package:core_tooling/core_tooling.dart';

/// The **Interaction Session** (M6): the concrete, stateful Canvas Interaction
/// Runtime. It is the first implementation of the frozen `CanvasRuntimeContract`
/// (M5A, ADR-0018) — the single surface all on-canvas input flows through and
/// the single owner of visual runtime state.
///
/// It **composes** the frozen foundations and never redefines them:
/// - the shared viewport / camera / zoom live in the [ViewportController],
///   which drives the frozen `ViewportOps` / `ViewportInteractionMapper` /
///   `ZoomCommand` (ADR-0003);
/// - input intake + routing is the frozen [InputDispatcher];
/// - hit testing is delegated to an injected [HitTestContract] (the renderer
///   implements it, M5B) — the session never re-implements it;
/// - overlays are the frozen `OverlayStack`; the coordinate system, grid,
///   guides and snapping come from the `CanvasRuntimeState` (`core_tooling`).
///
/// State mutates only by feeding events/commands in (`handleInput`,
/// `applyZoomCommand`, overlay contribute/withdraw) — never by writing state
/// directly (invariant I1 at the interaction layer). No selection/tool/brush/
/// AI logic lives here (out of M6 scope); content hits are surfaced via
/// [lastHit] for those later layers to consume. No rendering, no Flutter.
final class InteractionSession implements CanvasRuntimeContract {
  /// Creates a session over an initial [state], delegating hit testing to
  /// [hitTester] (the rendering runtime, M5B). [config] tunes the frozen
  /// interaction policy (zoom constraints, wheel behaviour).
  InteractionSession({
    required CanvasRuntimeState state,
    required HitTestContract hitTester,
    InteractionConfig config = InteractionConfig.standard,
  }) : _hitTester = hitTester, // ignore: prefer_initializing_formals
       _viewport = ViewportController(camera: state.camera, config: config),
       _state = state;

  final HitTestContract _hitTester;
  final ViewportController _viewport;
  final InputDispatcher _dispatcher = const InputDispatcher();
  final CursorRuntime _cursorRuntime = const CursorRuntime();

  CanvasRuntimeState _state;
  CursorState _cursor = CursorState.initial;

  /// The result of the most recent content hit (Hit Test Entry output), for
  /// the selection/tool layers to consume in later milestones. Null until a
  /// content gesture resolves; camera gestures leave it unchanged.
  HitTestResult? lastHit;

  // ------------------------------------------------------------------- state
  @override
  CanvasRuntimeState get state =>
      _state.copyWith(camera: _viewport.camera, overlays: _state.overlays);

  @override
  ViewportState get viewport => _viewport.viewport;

  @override
  CanvasCoordinateSystem get coordinateSystem => _state.coordinateSystem;

  /// The active cursor state for the surface (M6 cursor runtime): the
  /// requested shape plus the last known pointer position.
  CursorState get cursor => _cursor;

  // --------------------------------------------------- universal input intake
  @override
  void handleInput(InteractionEvent event) {
    final hit = _dispatcher.dispatch(
      event,
      viewport: _viewport,
      hitTest: _hitTester,
    );
    if (hit != null) {
      lastHit = hit;
    }
    _updateCursor(event, hit);
  }

  /// Resolves the cursor after an event: over a resolved node → pointer;
  /// during a pan → grabbing; otherwise arrow. Only events that carry a
  /// screen position move the cursor.
  void _updateCursor(InteractionEvent event, HitTestResult? hit) {
    final position = _cursorPosition(event);
    if (position == null) return;
    _cursor = _cursorRuntime.resolve(
      screenPosition: position,
      overNode: hit?.isNodeHit ?? false,
      panning: event is PanInteraction && event.phase != GesturePhase.end,
    );
  }

  Point2D? _cursorPosition(InteractionEvent event) {
    return switch (event) {
      TapInteraction(:final position) => position,
      DoubleTapInteraction(:final position) => position,
      LongPressInteraction(:final position) => position,
      DragInteraction(:final position) => position,
      PinchInteraction(:final focalPoint) => focalPoint,
      WheelInteraction(:final position) => position,
      PanInteraction() || ShortcutInteraction() => _cursor.screenPosition,
    };
  }

  @override
  void applyZoomCommand(ZoomCommand command) =>
      _viewport.applyZoomCommand(command);

  // --------------------------------------------------------------- selection
  @override
  SelectionState get selection => SelectionState.empty;

  // -------------------------------------------------------------- references
  @override
  List<CanvasReference> get references => _state.references;

  // ------------------------------------------------------- hit testing (M5B)
  @override
  HitTestResult hitTest(HitTestQuery query) => _hitTester.hitTest(query);

  @override
  List<String> hitTestRegion(Rect2D region) => _hitTester.hitTestRegion(region);

  // ---------------------------------------------------------- overlay runtime
  @override
  OverlayStack get overlays => _state.overlays;

  @override
  void contribute(OverlayModel overlay) {
    _state = _state.copyWith(overlays: _state.overlays.contribute(overlay));
  }

  @override
  void withdraw(String overlayId) {
    _state = _state.copyWith(overlays: _state.overlays.withdraw(overlayId));
  }
}
