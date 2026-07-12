import 'dart:math' as math;

import 'package:core_geometry/core_geometry.dart';
import 'package:core_interaction/src/gestures/interaction_event.dart';
import 'package:core_interaction/src/policy/interaction_config.dart';
import 'package:core_interaction/src/viewport/viewport_ops.dart';
import 'package:core_interaction/src/viewport/viewport_state.dart';

/// The universal interaction policy: one pure mapping from
/// [InteractionEvent]s to viewport transitions, shared by **every** editing
/// surface (ADR-0003 — no tool implements its own zoom or pan).
///
/// Behaviour parity is a contract: touch pinch, trackpad pinch and
/// modifier+wheel produce identical transitions for equivalent inputs, on
/// every platform. Enforced by unit tests.
final class ViewportInteractionMapper {
  const ViewportInteractionMapper({this.config = InteractionConfig.standard});

  final InteractionConfig config;

  /// Applies [event] to [state], returning the next viewport.
  ///
  /// Content-level events (tap, long press, drag) never move the viewport
  /// and return [state] unchanged — they belong to selection/editing
  /// layers. [selectionBounds]/[objectBounds] feed the corresponding zoom
  /// shortcuts; absent inputs make those commands defined no-ops.
  ViewportState apply(
    ViewportState state,
    InteractionEvent event, {
    Rect2D? selectionBounds,
    Rect2D? objectBounds,
  }) {
    final constraints = config.constraints;
    return switch (event) {
      TapInteraction() || LongPressInteraction() || DragInteraction() => state,
      DoubleTapInteraction(:final position) => _smartZoom(state, position),
      PanInteraction(:final delta) => state.panned(delta),
      PinchInteraction(
        :final focalPoint,
        :final scaleFactor,
        :final rotationDelta,
        :final panDelta,
      ) =>
        state
            .panned(panDelta)
            .zoomedBy(
              scaleFactor,
              screenAnchor: focalPoint,
              constraints: constraints,
            )
            .rotatedBy(rotationDelta, screenAnchor: focalPoint),
      WheelInteraction(:final position, :final scrollDelta, :final modifiers) =>
        (modifiers.primary || !config.wheelZoomRequiresModifier)
            ? state.zoomedBy(
                math.exp(-scrollDelta.y * config.wheelZoomSensitivity),
                screenAnchor: position,
                constraints: constraints,
              )
            : state.panned(
                modifiers.shift
                    ? Point2D(x: -scrollDelta.y, y: -scrollDelta.x)
                    : scrollDelta * -1,
              ),
      ShortcutInteraction(:final shortcut) => state.applyZoomCommand(
        shortcut.command,
        constraints: constraints,
        selectionBounds: selectionBounds,
        objectBounds: objectBounds,
      ),
    };
  }

  /// Double-tap smart zoom: below 100% jump to Actual Size anchored at the
  /// tap point; at or above 100% return to Fit Screen. Identical on every
  /// device.
  ViewportState _smartZoom(ViewportState state, Point2D position) {
    if (state.zoom < 1.0) {
      return state.actualSized(
        screenAnchor: position,
        constraints: config.constraints,
      );
    }
    return state.fittedToScreen(constraints: config.constraints);
  }
}
