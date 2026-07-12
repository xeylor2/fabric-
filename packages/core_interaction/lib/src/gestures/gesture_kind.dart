/// The frozen gesture vocabulary of the FEBRIC OS (ADR-0003).
///
/// Every editing surface supports exactly these gesture classes; concrete
/// events are modelled by `InteractionEvent`, whose `kind` getter maps each
/// event onto this vocabulary.
enum GestureKind {
  tap('tap', 'Tap'),
  doubleTap('double_tap', 'Double Tap'),
  longPress('long_press', 'Long Press'),

  /// Single-pointer content drag (moving an object — not the viewport).
  drag('drag', 'Drag'),

  /// Viewport pan (single-pointer pan tools, middle-mouse, space-drag).
  pan('pan', 'Pan'),

  /// Touch pinch zoom (with focal-point anchoring).
  pinchZoom('pinch_zoom', 'Pinch Zoom'),

  /// Two-finger viewport pan.
  twoFingerPan('two_finger_pan', 'Two Finger Pan'),

  /// Rotation gesture (two-finger twist).
  rotateGesture('rotate_gesture', 'Rotate Gesture'),

  /// Mouse wheel zoom (modifier-gated by `InteractionConfig`).
  mouseWheelZoom('mouse_wheel_zoom', 'Mouse Wheel Zoom'),

  /// Trackpad pinch (behaves identically to touch pinch).
  trackpadPinch('trackpad_pinch', 'Trackpad Pinch'),

  /// Keyboard shortcut invoking a view command.
  keyboardShortcut('keyboard_shortcut', 'Keyboard Shortcut');

  const GestureKind(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static GestureKind fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown GestureKind wire name',
      ),
    );
  }
}
