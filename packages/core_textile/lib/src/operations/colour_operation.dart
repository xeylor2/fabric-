/// The colour operations FEBRIC exposes over textile compositions.
///
/// Frozen vocabulary (ADR-0002). These name *what* can be done; the colour
/// engine (a later milestone) defines *how*.
enum ColourOperation {
  /// Recolour a single motif (or motif class) without touching the ground.
  shiftMotifColour('shift_motif_colour', 'Shift Motif Colour'),

  /// Recolour the base/ground only, preserving motif colours.
  shiftBaseColour('shift_base_colour', 'Shift Base Colour'),

  /// Shift the entire composition's colours together (hue/tone move).
  globalColourShift('global_colour_shift', 'Global Colour Shift'),

  /// Replace the working palette with another, remapping every element.
  paletteSwap('palette_swap', 'Palette Swap');

  const ColourOperation(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static ColourOperation fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown ColourOperation wire name',
      ),
    );
  }
}
