import 'package:core_geometry/core_geometry.dart';
import 'package:core_interaction/src/gestures/gesture_kind.dart';
import 'package:core_interaction/src/gestures/gesture_phase.dart';
import 'package:core_interaction/src/gestures/input_device.dart';
import 'package:core_interaction/src/gestures/interaction_shortcut.dart';
import 'package:core_interaction/src/gestures/key_modifiers.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'interaction_event.freezed.dart';
part 'interaction_event.g.dart';

/// The universal, platform-neutral interaction event of the FEBRIC OS.
///
/// Shell layers translate raw Flutter/pointer input into these events at
/// the boundary; everything below (policy, tools, tests) speaks only this
/// sealed vocabulary. Positions are in logical screen pixels.
@freezed
sealed class InteractionEvent with _$InteractionEvent {
  /// Single tap / click.
  const factory InteractionEvent.tap({
    required Point2D position,
    @Default(InputDevice.touch) InputDevice device,
    @Default(KeyModifiers()) KeyModifiers modifiers,
  }) = TapInteraction;

  /// Double tap / double click (smart zoom).
  const factory InteractionEvent.doubleTap({
    required Point2D position,
    @Default(InputDevice.touch) InputDevice device,
  }) = DoubleTapInteraction;

  /// Long press (contextual actions).
  const factory InteractionEvent.longPress({
    required Point2D position,
    @Default(InputDevice.touch) InputDevice device,
  }) = LongPressInteraction;

  /// Single-pointer content drag (moves objects — never the viewport).
  const factory InteractionEvent.drag({
    required GesturePhase phase,
    required Point2D position,
    @Default(Point2D.zero) Point2D delta,
    @Default(InputDevice.touch) InputDevice device,
    @Default(KeyModifiers()) KeyModifiers modifiers,
  }) = DragInteraction;

  /// Viewport pan. [pointerCount] distinguishes two-finger pan (touch)
  /// from single-pointer pan modes (middle mouse, space-drag).
  const factory InteractionEvent.pan({
    required GesturePhase phase,
    @Default(Point2D.zero) Point2D delta,
    @Default(1) int pointerCount,
    @Default(InputDevice.touch) InputDevice device,
  }) = PanInteraction;

  /// Pinch: scale + optional twist + focal drift, anchored at
  /// [focalPoint]. Touch pinch and trackpad pinch produce identical
  /// events (parity is tested).
  const factory InteractionEvent.pinch({
    required GesturePhase phase,
    required Point2D focalPoint,
    @Default(1.0) double scaleFactor,
    @Default(0.0) double rotationDelta,
    @Default(Point2D.zero) Point2D panDelta,
    @Default(InputDevice.touch) InputDevice device,
  }) = PinchInteraction;

  /// Mouse wheel / trackpad scroll at [position].
  const factory InteractionEvent.wheel({
    required Point2D position,
    required Point2D scrollDelta,
    @Default(KeyModifiers()) KeyModifiers modifiers,
    @Default(InputDevice.mouse) InputDevice device,
  }) = WheelInteraction;

  /// A view-control keyboard shortcut.
  const factory InteractionEvent.shortcut({
    required InteractionShortcut shortcut,
    @Default(InputDevice.mouse) InputDevice device,
  }) = ShortcutInteraction;

  factory InteractionEvent.fromJson(Map<String, Object?> json) =>
      _$InteractionEventFromJson(json);

  const InteractionEvent._();

  /// Maps this event onto the frozen [GestureKind] vocabulary.
  GestureKind get kind {
    return switch (this) {
      TapInteraction() => GestureKind.tap,
      DoubleTapInteraction() => GestureKind.doubleTap,
      LongPressInteraction() => GestureKind.longPress,
      DragInteraction() => GestureKind.drag,
      PanInteraction(:final pointerCount) =>
        pointerCount >= 2 ? GestureKind.twoFingerPan : GestureKind.pan,
      PinchInteraction(:final scaleFactor, :final rotationDelta)
          when scaleFactor == 1.0 && rotationDelta != 0.0 =>
        GestureKind.rotateGesture,
      PinchInteraction(:final device) =>
        device == InputDevice.trackpad
            ? GestureKind.trackpadPinch
            : GestureKind.pinchZoom,
      WheelInteraction() => GestureKind.mouseWheelZoom,
      ShortcutInteraction() => GestureKind.keyboardShortcut,
    };
  }
}
