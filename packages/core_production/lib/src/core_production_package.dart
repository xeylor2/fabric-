/// Package marker for `core_production`.
///
/// Production engine: preflight rules, production rendering, encoders, packaging.
///
/// Keeps the package importable and testable from day one; real
/// implementation arrives in its architecture milestone.
abstract final class CoreProductionPackage {
  static const String id = 'core_production';
  static const String description =
      'Production engine: preflight rules, production rendering, encoders, packaging.';
}
