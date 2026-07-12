/// Colour spaces the Asset Engine records for visual assets (frozen,
/// append-only). Non-visual assets (fonts, palettes, templates) carry no
/// colour space.
enum AssetColourSpace {
  srgb('srgb', 'sRGB'),
  displayP3('display_p3', 'Display P3'),
  adobeRgb('adobe_rgb', 'Adobe RGB'),
  cmyk('cmyk', 'CMYK'),
  lab('lab', 'CIELAB'),
  greyscale('greyscale', 'Greyscale');

  const AssetColourSpace(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static AssetColourSpace fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () =>
          throw ArgumentError.value(name, 'name', 'Unknown AssetColourSpace'),
    );
  }
}
