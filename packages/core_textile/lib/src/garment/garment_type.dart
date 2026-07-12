/// The garment classes FEBRIC understands.
///
/// This enum is part of the frozen textile vocabulary (ADR-0002): entries may
/// be *added* in future milestones, but existing names and [wireName]s are
/// permanent — they appear in `.febric` documents, AI job payloads and
/// content packs.
enum GarmentType {
  /// Tunic-style upper garment; the anchor garment of South-Asian wear.
  kurta('kurta', 'Kurta'),

  /// Lower garment: trouser, shalwar, cigarette pant and related structures.
  pant('pant', 'Pant'),

  /// Rectangular draped scarf with pallu and border zones.
  dupatta('dupatta', 'Dupatta'),

  /// Heavier draped wrap; winter and luxury lines.
  shawl('shawl', 'Shawl'),

  /// Continuous draped garment with pallu, body and border regions.
  saree('saree', 'Saree'),

  /// Full-length outer robe.
  abaya('abaya', 'Abaya');

  const GarmentType(this.wireName, this.label);

  /// Stable serialization name (documents, APIs, packs). Never changes.
  final String wireName;

  /// Default English display label. UI layers may localize; domain code
  /// must use [wireName].
  final String label;

  /// Resolves a [wireName] back to its type; throws [ArgumentError] for
  /// unknown names so corrupt documents fail loudly, not silently.
  static GarmentType fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown GarmentType wire name',
      ),
    );
  }
}
