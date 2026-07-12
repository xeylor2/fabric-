/// Lifecycle phase of a continuous gesture (drag, pan, pinch).
enum GesturePhase {
  start('start', 'Start'),
  update('update', 'Update'),
  end('end', 'End'),
  cancel('cancel', 'Cancel');

  const GesturePhase(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static GesturePhase fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown GesturePhase wire name',
      ),
    );
  }
}
