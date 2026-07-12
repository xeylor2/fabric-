/// The frozen layer kinds of the FEBRIC Layer Engine (ADR-0006).
enum LayerKind {
  /// Plain raster content layer.
  layer('layer', 'Layer'),

  /// Grouping container (transform/opacity applies to children).
  group('group', 'Group'),

  /// Organisational container (no compositing semantics of its own).
  folder('folder', 'Folder'),

  /// A fixed-size board hosting a design surface.
  artboard('artboard', 'Artboard'),

  /// View-only reference material (implies `LockScope.reference`).
  reference('reference', 'Reference Layer'),

  /// Imported bitmap image.
  image('image', 'Image Layer'),

  /// Vector shape content.
  vector('vector', 'Vector Layer'),

  /// Text content.
  text('text', 'Text Layer'),

  /// Repeating textile pattern content (binds to the repeat engine).
  pattern('pattern', 'Pattern Layer'),

  /// AI-generated content (carries provenance; invariant I5).
  ai('ai', 'AI Layer'),

  /// Non-destructive adjustment applied to layers below.
  adjustment('adjustment', 'Adjustment Layer'),

  /// A mask carried as a layer in the stack (binds to the Mask Engine).
  mask('mask', 'Mask Layer');

  const LayerKind(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Whether this kind may contain children.
  bool get isContainer => this == group || this == folder || this == artboard;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static LayerKind fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown LayerKind wire name',
      ),
    );
  }
}

/// The frozen blend modes of the FEBRIC compositor (standard 16;
/// rendering implements them in a later milestone).
enum FebricBlendMode {
  normal('normal', 'Normal'),
  multiply('multiply', 'Multiply'),
  screen('screen', 'Screen'),
  overlay('overlay', 'Overlay'),
  darken('darken', 'Darken'),
  lighten('lighten', 'Lighten'),
  colourDodge('colour_dodge', 'Colour Dodge'),
  colourBurn('colour_burn', 'Colour Burn'),
  hardLight('hard_light', 'Hard Light'),
  softLight('soft_light', 'Soft Light'),
  difference('difference', 'Difference'),
  exclusion('exclusion', 'Exclusion'),
  hue('hue', 'Hue'),
  saturation('saturation', 'Saturation'),
  colour('colour', 'Colour'),
  luminosity('luminosity', 'Luminosity');

  const FebricBlendMode(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static FebricBlendMode fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown FebricBlendMode wire name',
      ),
    );
  }
}
