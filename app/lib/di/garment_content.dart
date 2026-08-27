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
/// Declared content slots. `accepts` carries frozen [TextileObjectType] wire
/// names — the field's documented use ("Accepted content hints — wire
/// strings"). A slot is a *declaration*: the frozen instantiator turns it into
/// a `DesignNodeType.zone` node carrying `zone_slot`.
List<ZoneSlot> _zoneSlots(GarmentPart part) => switch (part) {
  // Ground-bearing panels: a printable field plus an edge band.
  GarmentPart.base ||
  GarmentPart.ground ||
  GarmentPart.middleField ||
  GarmentPart.leg => [_slot(_fieldSlot, 'Field'), _slot(_edgeSlot, 'Edge')],
  // Sleeve: a field of its own plus its band.
  GarmentPart.sleeve => [
    _slot(_fieldSlot, 'Field'),
    _slot(_bandSlot, 'Band'),
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
  GarmentPart.buttons => [_slot(_bandSlot, 'Band')],
  // Motif placements.
  GarmentPart.heroMotif ||
  GarmentPart.secondaryMotif ||
  GarmentPart.fillerMotif ||
  GarmentPart.cornerMotif => [_slot(_placementSlot, 'Placement')],
  GarmentPart.texture => [_slot(_surfaceSlot, 'Surface')],
};

const String _fieldSlot = 'field';
const String _edgeSlot = 'edge';
const String _bandSlot = 'band';
const String _placementSlot = 'placement';
const String _surfaceSlot = 'surface';

ZoneSlot _slot(String id, String name) =>
    ZoneSlot(id: id, name: name, accepts: acceptsForSlot(id));

/// What a declared slot accepts, as frozen [TextileObjectType] wire names.
/// This is the single source of truth for both the schema declaration and the
/// textile content seeded into an instantiated garment.
List<String> acceptsForSlot(String slotId) =>
    _slotAccepts[slotId] ?? const <String>[];

final Map<String, List<String>> _slotAccepts = {
  // A printable field carries the substrate cloth and what is printed on it.
  _fieldSlot: [
    TextileObjectType.fabric.wireName,
    TextileObjectType.pattern.wireName,
    TextileObjectType.motif.wireName,
    TextileObjectType.texture.wireName,
  ],
  _edgeSlot: _bandAccepts,
  _bandSlot: _bandAccepts,
  _placementSlot: [TextileObjectType.motif.wireName],
  _surfaceSlot: [TextileObjectType.texture.wireName],
};

final List<String> _bandAccepts = [
  TextileObjectType.border.wireName,
  TextileObjectType.pattern.wireName,
];

// ------------------------------------------- fabric / base + printed motif
// The frozen classification carrier is node metadata `object_type`, holding a
// frozen [TextileObjectType] wire name. Its read side is already frozen:
// ADR-0019 routes node-tier `object_type`, and
// `core_render/lib/src/runtime/textile_render_producers.dart` reads
// `node.metadata['object_type']` into `RenderObject.kind`. Nothing new is
// introduced here, and no node↔layer binding is created: the frozen
// "unrendered lawfulness" guarantee makes binding-free content nodes
// first-class (`core_document/test/node_layer_separation_test.dart`).

/// The textile-content name shown in the tree for a classification.
String textileContentName(TextileObjectType type) => switch (type) {
  TextileObjectType.fabric => 'Fabric / Base',
  TextileObjectType.motif => 'Printed Motif',
  _ => type.label,
};

/// One frozen content node of [type], addressed beneath [parentId].
DesignNode textileContentNode({
  required String id,
  required TextileObjectType type,
}) => DesignNode(
  id: id,
  name: textileContentName(type),
  // `element` is the frozen content node type — "a discrete decorative
  // element (typed by TextileObjectType)".
  type: DesignNodeType.element,
  metadata: {'object_type': type.wireName},
);

/// Seeds the substrate and its printed motif into every zone whose declared
/// slot accepts them, leaving every other node untouched.
///
/// Child order IS z-order within a zone (the frozen [DesignNode] contract), so
/// the fabric lands first and the printed motif above it. The motif is a
/// separate node — never flattened into the fabric or the garment.
DesignNode withTextileContent(DesignNode node) {
  if (node.type == DesignNodeType.zone) {
    final accepts = acceptsForSlot('${node.metadata['zone_slot']}');
    return node.copyWith(
      children: [
        ...node.children,
        for (final type in const [
          TextileObjectType.fabric,
          TextileObjectType.motif,
        ])
          if (accepts.contains(type.wireName))
            textileContentNode(
              id: '${node.id}-${type.wireName}',
              type: type,
            ),
      ],
    );
  }
  return node.copyWith(
    children: [for (final child in node.children) withTextileContent(child)],
  );
}
