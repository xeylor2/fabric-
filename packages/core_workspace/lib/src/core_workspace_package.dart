/// Package marker for `core_workspace`.
///
/// Desktop workspace engine: dockable layouts, shortcut registry, context menus, command palette.
///
/// Keeps the package importable and testable from day one; real
/// implementation arrives in its architecture milestone.
abstract final class CoreWorkspacePackage {
  static const String id = 'core_workspace';
  static const String description =
      'Desktop workspace engine: dockable layouts, shortcut registry, context menus, command palette.';
}
