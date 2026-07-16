/// The platform targets the rendering engine supports (M5B-4). The engine
/// itself is platform-independent (R5/R8); platform-specific behaviour lives
/// only inside backend adapters. Wire names are frozen (append-only) and
/// pinned by the freeze test — the same regime as every FEBRIC vocabulary.
enum RenderPlatform {
  android('android', 'Android'),
  ios('ios', 'iOS'),
  windows('windows', 'Windows');

  const RenderPlatform(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static RenderPlatform fromWireName(String name) => values.firstWhere(
    (v) => v.wireName == name,
    orElse: () => throw ArgumentError.value(
      name,
      'name',
      'Unknown RenderPlatform wire name',
    ),
  );
}
