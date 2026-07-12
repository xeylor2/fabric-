/// The permanent top-level workspace categories of the FEBRIC OS.
///
/// Frozen vocabulary (ADR-0002). The workspace shell renders these; adding a
/// category is an ADR-level event. `tools` is permanent as of M1.
enum WorkspaceCategory {
  dashboard('dashboard', 'Dashboard'),
  projects('projects', 'Projects'),
  library('library', 'Library'),
  canvas('canvas', 'Canvas'),
  conversation('conversation', 'Conversation'),
  designTree('design_tree', 'Design Tree'),
  inspector('inspector', 'Inspector'),

  /// The Tools hub hosting the frozen FEBRIC tool set (see `FebricTool`).
  tools('tools', 'Tools'),

  production('production', 'Production'),
  settings('settings', 'Settings');

  const WorkspaceCategory(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static WorkspaceCategory fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown WorkspaceCategory wire name',
      ),
    );
  }
}
