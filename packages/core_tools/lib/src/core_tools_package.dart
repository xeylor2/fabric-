/// Package marker for `core_tools` (M15 D1: the approved host for
/// deterministic Element Engine tool implementations).
///
/// Keeps the package importable and testable from day one; the tool
/// implementations arrive in their approved slices (S2: Repeat Pattern,
/// S3: Colour Shift).
abstract final class CoreToolsPackage {
  static const String id = 'core_tools';

  static const String description =
      'Element Engine tool implementations: deterministic '
      'UniversalToolContract tools emitting only frozen DocumentCommands.';
}
