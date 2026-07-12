import 'package:core_interaction/src/viewport/zoom_command.dart';

/// The keyboard shortcut vocabulary for view control.
///
/// [defaultChord] is informational (documentation, tooltips, cheat sheet);
/// actual key binding — and rebinding — lives in the workspace shortcut
/// registry (a later milestone). Behaviour is defined solely by [command].
enum InteractionShortcut {
  zoomIn('zoom_in', 'Zoom In', 'Ctrl +', ZoomCommand.zoomIn),
  zoomOut('zoom_out', 'Zoom Out', 'Ctrl -', ZoomCommand.zoomOut),
  fitScreen('fit_screen', 'Fit Screen', 'Ctrl 0', ZoomCommand.fitScreen),
  actualSize('actual_size', 'Actual Size', 'Ctrl 1', ZoomCommand.actualSize),
  zoomToSelection(
    'zoom_to_selection',
    'Zoom to Selection',
    'Ctrl 2',
    ZoomCommand.zoomToSelection,
  ),
  resetView('reset_view', 'Reset View', 'Ctrl Shift 0', ZoomCommand.resetView);

  const InteractionShortcut(
    this.wireName,
    this.label,
    this.defaultChord,
    this.command,
  );

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Suggested default key chord (informational only).
  final String defaultChord;

  /// The frozen zoom command this shortcut invokes.
  final ZoomCommand command;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static InteractionShortcut fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown InteractionShortcut wire name',
      ),
    );
  }
}
