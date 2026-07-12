/// The input device classes FEBRIC recognises.
///
/// Platform rule (ADR-0003): Android touch, iPad touch/stylus, desktop
/// mouse and trackpad all map to the same interaction behaviour — the
/// device is carried for diagnostics and fine-tuning, never for divergent
/// logic. Behaviour parity is enforced by tests.
enum InputDevice {
  touch('touch', 'Touch'),
  mouse('mouse', 'Mouse'),
  trackpad('trackpad', 'Trackpad'),
  stylus('stylus', 'Stylus');

  const InputDevice(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static InputDevice fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown InputDevice wire name',
      ),
    );
  }
}
