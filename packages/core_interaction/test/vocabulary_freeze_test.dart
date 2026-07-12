import 'package:core_interaction/core_interaction.dart';
import 'package:test/test.dart';

/// Wire-format freeze tests (ADR-0003). Append-only; changes need an ADR.
void main() {
  test('ZoomCommand wire names are frozen — the nine zoom rules', () {
    expect(ZoomCommand.values.map((v) => v.wireName), [
      'default_zoom',
      'fit_screen',
      'actual_size',
      'zoom_to_selection',
      'zoom_to_object',
      'zoom_to_cursor',
      'zoom_in',
      'zoom_out',
      'reset_view',
    ]);
  });

  test('GestureKind wire names are frozen — the eleven gesture contracts', () {
    expect(GestureKind.values.map((v) => v.wireName), [
      'tap',
      'double_tap',
      'long_press',
      'drag',
      'pan',
      'pinch_zoom',
      'two_finger_pan',
      'rotate_gesture',
      'mouse_wheel_zoom',
      'trackpad_pinch',
      'keyboard_shortcut',
    ]);
  });

  test('InputDevice wire names are frozen', () {
    expect(InputDevice.values.map((v) => v.wireName), [
      'touch',
      'mouse',
      'trackpad',
      'stylus',
    ]);
  });

  test('GesturePhase wire names are frozen', () {
    expect(GesturePhase.values.map((v) => v.wireName), [
      'start',
      'update',
      'end',
      'cancel',
    ]);
  });

  test('InteractionShortcut wire names are frozen', () {
    expect(InteractionShortcut.values.map((v) => v.wireName), [
      'zoom_in',
      'zoom_out',
      'fit_screen',
      'actual_size',
      'zoom_to_selection',
      'reset_view',
    ]);
  });

  test('SelectionMode and ViewportCurve wire names are frozen', () {
    expect(SelectionMode.values.map((v) => v.wireName), [
      'replace',
      'add',
      'toggle',
    ]);
    expect(ViewportCurve.values.map((v) => v.wireName), [
      'linear',
      'ease_out',
      'ease_in_out',
    ]);
  });

  test('fromWireName round-trips and rejects unknowns', () {
    for (final v in ZoomCommand.values) {
      expect(ZoomCommand.fromWireName(v.wireName), v);
    }
    for (final v in GestureKind.values) {
      expect(GestureKind.fromWireName(v.wireName), v);
    }
    for (final v in InputDevice.values) {
      expect(InputDevice.fromWireName(v.wireName), v);
    }
    for (final v in GesturePhase.values) {
      expect(GesturePhase.fromWireName(v.wireName), v);
    }
    for (final v in InteractionShortcut.values) {
      expect(InteractionShortcut.fromWireName(v.wireName), v);
    }
    for (final v in SelectionMode.values) {
      expect(SelectionMode.fromWireName(v.wireName), v);
    }
    for (final v in ViewportCurve.values) {
      expect(ViewportCurve.fromWireName(v.wireName), v);
    }
    expect(() => ZoomCommand.fromWireName('mega_zoom'), throwsArgumentError);
    expect(() => GestureKind.fromWireName(''), throwsArgumentError);
  });
}
