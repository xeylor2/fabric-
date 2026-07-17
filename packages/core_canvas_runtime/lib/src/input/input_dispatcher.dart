import 'package:core_canvas/core_canvas.dart';
import 'package:core_canvas_runtime/src/controllers/viewport_controller.dart';
import 'package:core_interaction/core_interaction.dart';

/// Where a pointer event is routed (M6 pointer routing). A canvas event is
/// either a **camera** gesture (moves the shared viewport) or a **content**
/// gesture (targets whatever is under the pointer). This classification is a
/// direct reading of the frozen `ViewportInteractionMapper` policy — content
/// events (tap/drag/long press) never move the viewport (ADR-0003).
enum InputRoute {
  /// Pan / pinch / wheel / double-tap / view shortcut → the viewport.
  camera('camera', 'Camera'),

  /// Tap / drag / long press → the content under the pointer (hit testing →
  /// selection → tool, in later milestones).
  content('content', 'Content');

  const InputRoute(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;
}

/// The **Input Dispatcher** + **Pointer Routing** + **Hit Test Entry** (M6).
///
/// The single intake point for on-canvas input (Universal Input Contract): it
/// classifies each frozen [InteractionEvent], routes camera gestures to the
/// [ViewportController] (frozen viewport maths) and content gestures to the
/// injected [HitTestContract] (Hit Test Entry). It contains **no** selection,
/// tool, brush, polygon or AI logic — those consume its output in later
/// milestones. Routing is pure and deterministic.
final class InputDispatcher {
  const InputDispatcher();

  /// Classifies [event] into its route. Camera gestures move the viewport;
  /// content gestures target content. Mirrors the frozen mapper exactly:
  /// tap, drag and long press are the only content routes.
  InputRoute routeOf(InteractionEvent event) {
    return switch (event) {
      TapInteraction() ||
      DragInteraction() ||
      LongPressInteraction() => InputRoute.content,
      DoubleTapInteraction() ||
      PanInteraction() ||
      PinchInteraction() ||
      WheelInteraction() ||
      ShortcutInteraction() => InputRoute.camera,
    };
  }

  /// Dispatches [event]: camera gestures are applied to [viewport] through the
  /// frozen mapper; content gestures at a position are resolved through
  /// [hitTest] (Hit Test Entry) and the [HitTestResult] returned for a caller
  /// (selection/tool layers, later) to consume. Returns null for camera
  /// routes and for content events without a position.
  HitTestResult? dispatch(
    InteractionEvent event, {
    required ViewportController viewport,
    required HitTestContract hitTest,
    Rect2D? selectionBounds,
    Rect2D? objectBounds,
  }) {
    if (routeOf(event) == InputRoute.camera) {
      viewport.handleViewportEvent(
        event,
        selectionBounds: selectionBounds,
        objectBounds: objectBounds,
      );
      return null;
    }
    final position = _positionOf(event);
    if (position == null) return null;
    return hitTest.hitTest(HitTestQuery(screenPoint: position));
  }

  /// The screen-space position carried by a content event, if any.
  Point2D? _positionOf(InteractionEvent event) {
    return switch (event) {
      TapInteraction(:final position) => position,
      LongPressInteraction(:final position) => position,
      DragInteraction(:final position) => position,
      _ => null,
    };
  }
}
