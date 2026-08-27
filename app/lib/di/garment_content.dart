import 'package:core_garment/core_garment.dart';
import 'package:core_geometry/core_geometry.dart';
import 'package:core_textile/core_textile.dart';

/// Launch garment schema **content** for the Garment Composition stage.
///
/// `core_garment` deliberately ships none: `GarmentSchema` documents that
/// "this package ships the typed container and **zero** launch-schema
/// content", and `GarmentTemplateRegistry` is a synchronous
/// "register/lookup over already-injected in-memory content … Content
/// arrives from outside". This file is that outside — the composition root,
/// the same tier that already holds `seedDocument()`.
///
/// Part lists are never authored here: [GarmentAnatomy] is the frozen
/// authority ("Engines iterate this — never hardcode part lists"). Only
/// per-part content data — panel size, cardinality, zone slots — is authored,
/// and every value is expressed in the already-frozen vocabularies.
const List<GarmentType> launchGarmentTypes = [
  GarmentType.kurta,
  GarmentType.pant,
  GarmentType.dupatta,
];

/// The stable content id of a launch schema.
String launchSchemaId(GarmentType type) => 'febric-launch-${type.wireName}-v1';

/// The launch schema for [type]: its frozen anatomy, one part definition per
/// anatomy part, in the frozen canonical order.
GarmentSchema garmentSchemaFor(GarmentType type) => GarmentSchema(
  id: launchSchemaId(type),
  garment: type,
  parts: [for (final part in GarmentAnatomy.of(type)) _definition(part)],
);

/// The frozen in-memory registry, loaded with the three launch schemas.
GarmentTemplateRegistry launchGarmentRegistry() {
  final registry = GarmentTemplateRegistryImpl();
  for (final type in launchGarmentTypes) {
    registry.registerSchema(garmentSchemaFor(type));
  }
  return registry;
}

PartDefinition _definition(GarmentPart part) {
  final cardinality = _cardinality(part);
  return PartDefinition(
    part: part,
    cardinality: cardinality,
    panelSize: _panelSize(part),
    seamAllowance: const PartInsets(left: 1, top: 1, right: 1, bottom: 1),
    bleed: const PartInsets(left: 0.3, top: 0.3, right: 0.3, bottom: 0.3),
    zoneSlots: _zoneSlots(part),
    symmetryGroup: cardinality > 1 ? part.wireName : null,
  );
}

/// Mirrored and repeated parts (§3 mirrored pairs: cardinality 2 → the frozen
/// instantiator qualifies instances `left`/`right`; higher multiplicities get
/// 1-based ordinals).
int _cardinality(GarmentPart part) => switch (part) {
  GarmentPart.sleeve || GarmentPart.cuff || GarmentPart.leg => 2,
  GarmentPart.cornerMotif => 4,
  _ => 1,
};

/// Flat-panel printable size in centimetres (the schema unit default).
Size2D _panelSize(GarmentPart part) => switch (part) {
  GarmentPart.base || GarmentPart.ground => const Size2D(
    width: 110,
    height: 105,
  ),
  GarmentPart.sleeve => const Size2D(width: 46, height: 58),
  GarmentPart.leg => const Size2D(width: 38, height: 96),
  GarmentPart.middleField => const Size2D(width: 110, height: 150),
  GarmentPart.topPallu || GarmentPart.bottomPallu => const Size2D(
    width: 110,
    height: 45,
  ),
  GarmentPart.leftBorder || GarmentPart.rightBorder => const Size2D(
    width: 8,
    height: 240,
  ),
  GarmentPart.neck => const Size2D(width: 30, height: 24),
  GarmentPart.cuff => const Size2D(width: 24, height: 9),
  GarmentPart.waist => const Size2D(width: 96, height: 12),
  GarmentPart.hem || GarmentPart.border => const Size2D(
    width: 110,
    height: 12,
  ),
  GarmentPart.fringe => const Size2D(width: 110, height: 6),
  GarmentPart.buttons => const Size2D(width: 6, height: 34),
  GarmentPart.texture => const Size2D(width: 110, height: 105),
  GarmentPart.heroMotif => const Size2D(width: 34, height: 34),
  GarmentPart.secondaryMotif => const Size2D(width: 18, height: 18),
  GarmentPart.fillerMotif || GarmentPart.cornerMotif => const Size2D(
    width: 9,
    height: 9,
  ),
};

/// Declared content slots. `accepts` carries frozen [TextileObjectType] wire
/// names — the field's documented use ("Accepted content hints — wire
/// strings"). A slot is a *declaration*: the frozen instantiator turns it into
/// a `DesignNodeType.zone` node carrying `zone_slot`. No motif, print or
/// fabric content is created here.
List<ZoneSlot> _zoneSlots(GarmentPart part) => switch (part) {
  // Ground-bearing panels: a printable field plus an edge band.
  GarmentPart.base ||
  GarmentPart.ground ||
  GarmentPart.middleField ||
  GarmentPart.leg => [
    ZoneSlot(id: 'field', name: 'Field', accepts: _fieldAccepts),
    ZoneSlot(id: 'edge', name: 'Edge', accepts: _bandAccepts),
  ],
  // Sleeve: a field of its own plus its band.
  GarmentPart.sleeve => [
    ZoneSlot(id: 'field', name: 'Field', accepts: _fieldAccepts),
    ZoneSlot(id: 'band', name: 'Band', accepts: _bandAccepts),
  ],
  // Running bands and end panels.
  GarmentPart.neck ||
  GarmentPart.cuff ||
  GarmentPart.hem ||
  GarmentPart.border ||
  GarmentPart.leftBorder ||
  GarmentPart.rightBorder ||
  GarmentPart.topPallu ||
  GarmentPart.bottomPallu ||
  GarmentPart.waist ||
  GarmentPart.fringe ||
  GarmentPart.buttons => [
    ZoneSlot(id: 'band', name: 'Band', accepts: _bandAccepts),
  ],
  // Motif placements.
  GarmentPart.heroMotif ||
  GarmentPart.secondaryMotif ||
  GarmentPart.fillerMotif ||
  GarmentPart.cornerMotif => [
    ZoneSlot(id: 'placement', name: 'Placement', accepts: _motifAccepts),
  ],
  GarmentPart.texture => [
    ZoneSlot(id: 'surface', name: 'Surface', accepts: _textureAccepts),
  ],
};

// Content hints, taken from the frozen TextileObjectType vocabulary rather
// than spelled as literals.
final List<String> _fieldAccepts = [
  TextileObjectType.pattern.wireName,
  TextileObjectType.motif.wireName,
  TextileObjectType.texture.wireName,
];

final List<String> _bandAccepts = [
  TextileObjectType.border.wireName,
  TextileObjectType.pattern.wireName,
];

final List<String> _motifAccepts = [TextileObjectType.motif.wireName];

final List<String> _textureAccepts = [TextileObjectType.texture.wireName];
