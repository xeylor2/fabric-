/// The repeat structures FEBRIC's repeat engine will speak.
///
/// Frozen vocabulary (ADR-0002). The engine (a later milestone) consumes
/// these; nothing here computes geometry.
enum RepeatType {
  /// Tiles aligned in a plain grid.
  straight('straight', 'Straight Repeat'),

  /// Alternate columns dropped by half the tile height.
  halfDrop('half_drop', 'Half Drop'),

  /// Alternate rows shifted by half the tile width (brick bond).
  halfBrick('half_brick', 'Half Brick'),

  /// Tiles reflected across an axis for symmetric layouts.
  mirror('mirror', 'Mirror'),

  /// Motifs arranged on a diamond / ogee lattice.
  diamond('diamond', 'Diamond'),

  /// Motifs scattered with controlled randomness (seeded toss).
  toss('toss', 'Toss'),

  /// Grid with a user-defined fractional column/row offset.
  customOffset('custom_offset', 'Custom Offset'),

  /// Edge-wrapped so the tile is mathematically seamless in both axes.
  seamless('seamless', 'Seamless');

  const RepeatType(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static RepeatType fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown RepeatType wire name',
      ),
    );
  }
}
