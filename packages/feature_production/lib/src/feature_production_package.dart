/// Package marker for `feature_production`.
///
/// Production surface: preflight UI, exports, factory preview.
///
/// Keeps the package importable and testable from day one; real
/// implementation arrives in its architecture milestone.
abstract final class FeatureProductionPackage {
  static const String id = 'feature_production';
  static const String description =
      'Production surface: preflight UI, exports, factory preview.';
}
