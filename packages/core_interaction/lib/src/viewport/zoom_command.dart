/// The frozen zoom rules of the FEBRIC OS (ADR-0003).
///
/// Every editing surface exposes exactly these view commands; no tool
/// defines its own zoom vocabulary.
enum ZoomCommand {
  /// Jump to the constraints' default zoom, centered.
  defaultZoom('default_zoom', 'Default Zoom'),

  /// Fit the whole artwork on screen (with fit padding), centered.
  fitScreen('fit_screen', 'Fit Screen'),

  /// 100% — one canvas unit per logical pixel.
  actualSize('actual_size', 'Actual Size'),

  /// Fit the current selection's bounds.
  zoomToSelection('zoom_to_selection', 'Zoom to Selection'),

  /// Fit a specific object's bounds.
  zoomToObject('zoom_to_object', 'Zoom to Object'),

  /// Step zoom anchored at the cursor position.
  zoomToCursor('zoom_to_cursor', 'Zoom to Cursor'),

  /// Step zoom in, anchored at screen center.
  zoomIn('zoom_in', 'Zoom In'),

  /// Step zoom out, anchored at screen center.
  zoomOut('zoom_out', 'Zoom Out'),

  /// Return to the canonical view (fit + centered, rotation cleared).
  resetView('reset_view', 'Reset View');

  const ZoomCommand(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static ZoomCommand fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown ZoomCommand wire name',
      ),
    );
  }
}
