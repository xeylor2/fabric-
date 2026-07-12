import 'package:core_canvas/src/hittest/hit_test.dart';
import 'package:core_canvas/src/overlay/overlay.dart';
import 'package:core_canvas/src/reference/canvas_reference.dart';
import 'package:core_canvas/src/runtime/canvas_runtime_state.dart';
import 'package:core_interaction/core_interaction.dart';
import 'package:core_tooling/core_tooling.dart';

/// THE Canvas Runtime of the FEBRIC OS (M5A, ADR-0018).
///
/// It is the single surface through which all on-canvas user input flows and
/// the single owner of visual runtime state. Nothing bypasses it:
///
/// ```
/// User → Canvas Runtime → Viewport → Hit Testing → Selection → Tool
/// ```
///
/// The contract *composes* the frozen foundations and exposes them read-only:
/// the viewport, camera and gesture mapping come from `core_interaction`; the
/// coordinate system, snapping, grid and guides from `core_tooling`. It adds
/// the canvas-only surfaces: hit testing to semantic nodes, the overlay
/// runtime and reference visualisation.
///
/// State is mutated only by feeding events/commands in — never by writing
/// state directly (mirrors invariant I1 at the interaction layer). No
/// rendering, no Flutter, no GPU: this is architecture only.
abstract interface class CanvasRuntimeContract
    implements OverlayRuntimeContract, HitTestContract {
  // ------------------------------------------------------------------- state
  /// The immutable visual runtime state.
  CanvasRuntimeState get state;

  /// The single shared viewport (Universal Viewport Contract). Every tool
  /// uses this one; none may create its own.
  ViewportState get viewport;

  /// Physical-unit coordinate system of the surface.
  CanvasCoordinateSystem get coordinateSystem;

  // --------------------------------------------------- universal input intake
  /// The single input pipeline. All pointer/keyboard/gesture input for the
  /// surface enters here; no tool implements its own input handling
  /// (Universal Input Contract). The runtime routes the event through the
  /// frozen `ViewportInteractionMapper` for camera gestures, and through hit
  /// testing → selection → the active tool for content gestures.
  void handleInput(InteractionEvent event);

  /// Applies a frozen zoom command to the shared viewport.
  void applyZoomCommand(ZoomCommand command);

  // --------------------------------------------------------------- selection
  /// The object-selection routed through the canvas (which objects). Region
  /// selection lives in `core_selection`; the canvas never *owns* selection
  /// truth — it routes it (`CanvasConstitution`).
  SelectionState get selection;

  // -------------------------------------------------------------- references
  /// The references the canvas is currently visualising (ids only).
  List<CanvasReference> get references;
}
