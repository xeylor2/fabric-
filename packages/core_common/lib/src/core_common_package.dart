/// Package marker for `core_common`.
///
/// Shared kernel: result types, error model, logging, activity ledger, pure utilities.
///
/// Keeps the package importable and testable from day one; real
/// implementation arrives in its architecture milestone.
abstract final class CoreCommonPackage {
  static const String id = 'core_common';
  static const String description =
      'Shared kernel: result types, error model, logging, activity ledger, pure utilities.';
}
