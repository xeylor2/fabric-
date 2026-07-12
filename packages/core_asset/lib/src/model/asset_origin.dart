/// Where an asset entered the project (frozen, append-only).
///
/// The first four wire names are IDENTICAL to the document manifest's
/// `AssetSource` vocabulary (core_document, ADR-0014) so identity
/// reconciles without translation; `created` and `plugin` are engine-side
/// refinements that coarsen deterministically when embedded into a
/// document manifest (see `DocumentAssetBinding`).
enum AssetOrigin {
  imported('imported', 'Imported'),
  generated('generated', 'Generated'),
  library('library', 'Library'),
  capture('capture', 'Capture'),
  created('created', 'Created'),
  plugin('plugin', 'Plugin');

  const AssetOrigin(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static AssetOrigin fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () =>
          throw ArgumentError.value(name, 'name', 'Unknown AssetOrigin'),
    );
  }
}
