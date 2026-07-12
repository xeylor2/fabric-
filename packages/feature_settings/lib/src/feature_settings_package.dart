/// Package marker for `feature_settings`.
///
/// Settings: Theme Engine controls, API Manager, preferences.
///
/// Keeps the package importable and testable from day one; real
/// implementation arrives in its architecture milestone.
abstract final class FeatureSettingsPackage {
  static const String id = 'feature_settings';
  static const String description =
      'Settings: Theme Engine controls, API Manager, preferences.';
}
