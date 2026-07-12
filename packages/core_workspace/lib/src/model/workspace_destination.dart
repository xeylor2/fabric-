import 'package:flutter/widgets.dart';

/// A top-level module destination of the FEBRIC workspace.
/// Declared by the app's composition root; the shell never knows features.
@immutable
class WorkspaceDestination {
  const WorkspaceDestination({
    required this.id,
    required this.label,
    required this.icon,
    IconData? selectedIcon,
    this.compactPrimary = false,
  }) : selectedIcon = selectedIcon ?? icon;

  /// Stable identifier (also used for routing).
  final String id;

  final String label;
  final IconData icon;
  final IconData selectedIcon;

  /// Whether this destination earns a slot in the mobile bottom bar
  /// (at most four are shown; the rest live in the "More" sheet).
  final bool compactPrimary;
}

/// One entry of the workspace status bar.
@immutable
class WorkspaceStatusItem {
  const WorkspaceStatusItem({
    required this.label,
    this.icon,
    this.accent = false,
  });

  final String label;
  final IconData? icon;

  /// Renders in accent color (environment badges, live states).
  final bool accent;
}
