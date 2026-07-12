/// The node types a FEBRIC Design Tree may contain.
///
/// Frozen vocabulary (ADR-0002). Mirrors the tree grammar of Architecture V2
/// §4: Project → Artwork → Garment → GarmentPart → Zone → content nodes.
/// The document engine (M2) builds on these; nothing here implements tree
/// behaviour.
enum DesignNodeType {
  /// Root container of a work session.
  project('project', 'Project'),

  /// One design context inside a project.
  artwork('artwork', 'Artwork'),

  /// A garment instance (typed by `GarmentType`).
  garment('garment', 'Garment'),

  /// A structural garment part (typed by `GarmentPart`).
  garmentPart('garment_part', 'Garment Part'),

  /// A design surface inside a part that accepts content.
  zone('zone', 'Zone'),

  /// A discrete decorative element (typed by `TextileObjectType`).
  element('element', 'Element'),

  /// An ordered grouping of elements.
  group('group', 'Group');

  const DesignNodeType(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static DesignNodeType fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown DesignNodeType wire name',
      ),
    );
  }
}
