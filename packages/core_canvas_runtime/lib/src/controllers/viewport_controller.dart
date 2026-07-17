import 'package:core_interaction/core_interaction.dart';

/// The stateful **Viewport / Camera / Zoom / Pan Controller** (M6).
///
/// It holds the single live [NavigationState] camera (the one shared viewport,
/// R4) and mutates it **only** through the frozen pure functions of
/// `core_interaction` (`ViewportOps`, `ViewportInteractionMapper`,
/// `ViewportState.applyZoomCommand`). It defines no new viewport maths and no
/// new zoom/pan behaviour — those are frozen (ADR-0003); this is purely the
/// stateful shell that the M5A constitution and the interaction session drive.
///
/// Zoom, pan and camera concerns are one cohesive controller because they all
/// operate on the single viewport; splitting them would fabricate independent
/// state the architecture forbids (no tool owns its own viewport).
final class ViewportController {
  ViewportController({
    required NavigationState camera,
    this.config = InteractionConfig.standard,
  }) : _camera = camera; // ignore: prefer_initializing_formals

  /// The live camera (viewport + bounded view history).
  NavigationState _camera;

  /// The frozen interaction policy (zoom constraints, wheel/pan mapping).
  final InteractionConfig config;

  /// The current camera state.
  NavigationState get camera => _camera;

  /// The single shared viewport (delegates to the camera — one source of
  /// truth; no tool creates its own).
  ViewportState get viewport => _camera.viewport;

  /// Replaces the live viewport (e.g. on surface resize), preserving history.
  void setViewport(ViewportState next) {
    _camera = _camera.copyWith(viewport: next);
  }

  // ------------------------------------------------------------------- zoom
  /// Applies a frozen [ZoomCommand] to the shared viewport, remembering the
  /// previous view so "previous view" navigation works (a view-changing
  /// command pushes history; a no-op command leaves it untouched).
  ///
  /// [cursor]/[selectionBounds]/[objectBounds] feed the anchored commands;
  /// an absent input makes that command a defined no-op (frozen semantics).
  void applyZoomCommand(
    ZoomCommand command, {
    Point2D? cursor,
    Rect2D? selectionBounds,
    Rect2D? objectBounds,
  }) {
    final next = viewport.applyZoomCommand(
      command,
      constraints: config.constraints,
      cursor: cursor,
      selectionBounds: selectionBounds,
      objectBounds: objectBounds,
    );
    _commit(next);
  }

  /// Multiplies zoom by [factor], anchored at [screenAnchor] (screen centre
  /// by default). Frozen `ViewportOps.zoomedBy`.
  void zoomBy(double factor, {Point2D? screenAnchor}) {
    _commit(
      viewport.zoomedBy(
        factor,
        screenAnchor: screenAnchor,
        constraints: config.constraints,
      ),
    );
  }

  /// Fits the whole artwork on screen. Frozen `ViewportOps.fittedToScreen`.
  void fitToScreen() =>
      _commit(viewport.fittedToScreen(constraints: config.constraints));

  // -------------------------------------------------------------------- pan
  /// Translates the view by [delta] logical pixels. Frozen `ViewportOps
  /// .panned`. Panning does not push view history (it is continuous).
  void panBy(Point2D delta) {
    _camera = _camera.copyWith(viewport: viewport.panned(delta));
  }

  // ----------------------------------------------------------------- camera
  /// Returns to the most recent previous view (no-op when history is empty).
  /// Frozen `NavigationState.back`.
  void back() => _camera = _camera.back();

  /// Whether a previous view exists.
  bool get canGoBack => _camera.canGoBack;

  /// Routes an [InteractionEvent] through the frozen
  /// [ViewportInteractionMapper]: camera gestures (pan/pinch/wheel/double-tap
  /// /shortcut) transition the viewport; content gestures (tap/drag/long
  /// press) return it unchanged. Continuous gestures do not push history.
  void handleViewportEvent(
    InteractionEvent event, {
    Rect2D? selectionBounds,
    Rect2D? objectBounds,
  }) {
    final mapper = ViewportInteractionMapper(config: config);
    final next = mapper.apply(
      viewport,
      event,
      selectionBounds: selectionBounds,
      objectBounds: objectBounds,
    );
    // Gesture-driven viewport motion is continuous — mutate in place without
    // flooding the bounded view history (which is for discrete "jumps").
    _camera = _camera.copyWith(viewport: next);
  }

  /// Commits a discrete view change, pushing the previous view onto history
  /// only when the viewport actually moved.
  void _commit(ViewportState next) {
    if (next == viewport) return;
    _camera = _camera.pushViewport(next);
  }
}
