/// Package marker for `core_asset`.
///
/// THE Asset Engine: the single source of truth for every external
/// resource of a project (identity, immutable versioning, content
/// addressing, usage graph, reference counting).
///
/// Distinct from `core_assets` (Asset Intelligence, Architecture V2 §8):
/// that engine RECOMMENDS against assets; this engine OWNS them.
abstract final class CoreAssetPackage {
  static const String id = 'core_asset';
  static const String description =
      'Asset Engine: single source of truth for every external resource '
      '(identity, immutable versioning, content addressing, usage graph, '
      'reference counting).';
}
