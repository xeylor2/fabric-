/// The classes of textile design objects that can exist in a composition.
///
/// Frozen vocabulary (ADR-0002).
enum TextileObjectType {
  /// A discrete decorative unit (paisley, boteh, floral spray…).
  motif('motif', 'Motif'),

  /// A repeating arrangement of motifs over a ground.
  pattern('pattern', 'Pattern'),

  /// A linear running ornament band.
  border('border', 'Border'),

  /// Surface texture (weave, slub, wash, grain).
  texture('texture', 'Texture'),

  /// A named, ordered set of colours governing the composition.
  colourPalette('colour_palette', 'Colour Palette'),

  /// The substrate cloth itself (lawn, silk, chiffon…).
  fabric('fabric', 'Fabric'),

  /// Stitched ornamentation layer (thread-work, zari, resham).
  embroidery('embroidery', 'Embroidery'),

  /// Lace trim or lace field.
  lace('lace', 'Lace'),

  /// An applied patch element.
  patch('patch', 'Patch'),

  /// A print layer in the production stack (one screen / one pass).
  printLayer('print_layer', 'Print Layer');

  const TextileObjectType(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static TextileObjectType fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown TextileObjectType wire name',
      ),
    );
  }
}
