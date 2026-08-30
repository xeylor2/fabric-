import 'package:core_garment/core_garment.dart';
import 'package:core_geometry/core_geometry.dart';
import 'package:core_textile/core_textile.dart';
import 'package:core_tooling/core_tooling.dart';

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
  GarmentPart.base ||
  GarmentPart.ground => const Size2D(width: 110, height: 105),
  GarmentPart.sleeve => const Size2D(width: 46, height: 58),
  GarmentPart.leg => const Size2D(width: 38, height: 96),
  GarmentPart.middleField => const Size2D(width: 110, height: 150),
  GarmentPart.topPallu ||
  GarmentPart.bottomPallu => const Size2D(width: 110, height: 45),
  GarmentPart.leftBorder ||
  GarmentPart.rightBorder => const Size2D(width: 8, height: 240),
  GarmentPart.neck => const Size2D(width: 30, height: 24),
  GarmentPart.cuff => const Size2D(width: 24, height: 9),
  GarmentPart.waist => const Size2D(width: 96, height: 12),
  GarmentPart.hem || GarmentPart.border => const Size2D(width: 110, height: 12),
  GarmentPart.fringe => const Size2D(width: 110, height: 6),
  GarmentPart.buttons => const Size2D(width: 6, height: 34),
  GarmentPart.texture => const Size2D(width: 110, height: 105),
  GarmentPart.heroMotif => const Size2D(width: 34, height: 34),
  GarmentPart.secondaryMotif => const Size2D(width: 18, height: 18),
  GarmentPart.fillerMotif ||
  GarmentPart.cornerMotif => const Size2D(width: 9, height: 9),
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
  GarmentPart.sleeve => [_slot(_fieldSlot, 'Field'), _slot(_bandSlot, 'Band')],
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

// ------------------------------------------------- deterministic geometry
// The visual surface needs real garment geometry, and the carrier for it is
// already frozen: the node metadata key `render_bounds: [l, t, w, h]`, read by
// the frozen consumer `boundsForNode` (core_render's design-node producer) and
// therefore by the frozen textile producer that feeds every RenderObject.
// Without it that consumer falls back to a deterministic 8x8 placeholder
// derived from the node id — real panels are what make the canvas a garment
// surface rather than a scatter of squares.
//
// Everything here is authored from data this file ALREADY declares — the
// part's `panelSize`, its `seamAllowance` and its `bleed` — converted out of
// the schema's authoring unit by the frozen [UnitConverter]. No geometry
// engine, no bounds engine and no measurement system is introduced: the unit
// arithmetic is the frozen converter's and the document space is the frozen
// [CanvasCoordinateSystem]'s.
//
// The layout is deterministic and schema-derived ONLY. It gives a flat-lay
// sheet: panels stacked in the frozen [GarmentAnatomy] order, mirrored
// instances side by side, each zone dividing its panel's content box, and each
// textile content node covering its zone exactly. It deliberately authors NO
// per-motif offset — user-authored motif placement is a separate, unresolved
// concern (B-2 / NDH-2) and nothing here anticipates it.

/// The frozen document space: millimetres at the frozen canvas DPI.
const CanvasCoordinateSystem _documentSpace = CanvasCoordinateSystem.standard;

/// The unit the launch schemas author panel data in.
const MeasurementUnit _authoringUnit = MeasurementUnit.centimetre;

/// Frozen metadata key carrying a node's document-space bounds.
const String renderBoundsKey = 'render_bounds';

/// Converts [value] from the schema's authoring unit into document space
/// through the frozen [UnitConverter]. No conversion arithmetic is written
/// here — the frozen converter owns it, at the frozen single DPI source.
double _toDocument(double value) => UnitConverter.convert(
  value,
  from: _authoringUnit,
  to: _documentSpace.unit,
  dotsPerInch: _documentSpace.dotsPerInch,
);

/// A node's `render_bounds` value for [rect] — the frozen four-number form.
List<double> renderBoundsOf(Rect2D rect) => [
  rect.left,
  rect.top,
  rect.width,
  rect.height,
];

/// The document-space panel rectangles of [type], in the exact nested order
/// the frozen instantiator emits its part nodes (`GarmentAnatomy` order, then
/// instance index).
///
/// Panels stack downwards; the instances of a mirrored part sit side by side.
/// The only spacing is the part's own authored [PartDefinition.bleed], so no
/// constant is invented.
List<Rect2D> garmentPanelRects(GarmentType type) {
  final rects = <Rect2D>[];
  var top = 0.0;
  for (final part in GarmentAnatomy.of(type)) {
    final definition = _definition(part);
    final width = _toDocument(definition.panelSize.width);
    final height = _toDocument(definition.panelSize.height);
    final gap = _toDocument(definition.bleed.right);
    for (var i = 0; i < definition.cardinality; i++) {
      rects.add(
        Rect2D(left: i * (width + gap), top: top, width: width, height: height),
      );
    }
    top += height + _toDocument(definition.bleed.bottom);
  }
  return rects;
}

/// The zone rectangles of a panel: the panel deflated by its authored
/// [PartDefinition.seamAllowance], then divided equally among the part's
/// declared slots in declaration order.
List<Rect2D> _zoneRects(GarmentPart part, Rect2D panel) {
  final definition = _definition(part);
  final insets = definition.seamAllowance;
  final left = panel.left + _toDocument(insets.left);
  final top = panel.top + _toDocument(insets.top);
  final width = panel.width - _toDocument(insets.left + insets.right);
  final height = panel.height - _toDocument(insets.top + insets.bottom);
  final slots = definition.zoneSlots;
  if (slots.isEmpty || width <= 0 || height <= 0) {
    return const [];
  }
  final share = height / slots.length;
  return [
    for (var i = 0; i < slots.length; i++)
      Rect2D(left: left, top: top + i * share, width: width, height: share),
  ];
}

/// The bounding box of [rects], or null when there are none.
Rect2D? _bounds(List<Rect2D> rects) {
  if (rects.isEmpty) {
    return null;
  }
  var right = 0.0;
  var bottom = 0.0;
  for (final rect in rects) {
    right = rect.left + rect.width > right ? rect.left + rect.width : right;
    bottom = rect.top + rect.height > bottom ? rect.top + rect.height : bottom;
  }
  return Rect2D(left: 0, top: 0, width: right, height: bottom);
}

DesignNode _withBounds(DesignNode node, Rect2D rect) => node.copyWith(
  metadata: {...node.metadata, renderBoundsKey: renderBoundsOf(rect)},
);

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
/// slot accepts them, leaving every other node untouched, and authors the
/// deterministic document-space geometry of a garment subtree.
///
/// Child order IS z-order within a zone (the frozen [DesignNode] contract), so
/// the fabric lands first and the printed motif above it. The motif is a
/// separate node — never flattened into the fabric or the garment.
///
/// When [node] is an instantiated garment (it carries the frozen
/// `garment_type`), every panel, zone and textile content node also receives
/// its frozen `render_bounds`, so the garment reaches the visual surface as
/// real panels. Any other subtree is seeded exactly as before and carries no
/// geometry — `createFabric`/`createMotif` on an arbitrary node are unchanged.
DesignNode withTextileContent(DesignNode node) {
  final garmentWire = node.metadata['garment_type'];
  if (node.type == DesignNodeType.garment && garmentWire is String) {
    try {
      return _withGarmentLayout(node, GarmentType.fromWireName(garmentWire));
    } on ArgumentError {
      // A classification outside the frozen vocabulary carries no layout.
      return _withContentOnly(node);
    }
  }
  return _withContentOnly(node);
}

/// The geometry-free seeding path (unchanged behaviour).
DesignNode _withContentOnly(DesignNode node) {
  if (node.type == DesignNodeType.zone) {
    return node.copyWith(children: [...node.children, ..._contentFor(node)]);
  }
  return node.copyWith(
    children: [for (final child in node.children) _withContentOnly(child)],
  );
}

/// The garment path: panels, zones and content all placed, then seeded.
DesignNode _withGarmentLayout(DesignNode garment, GarmentType type) {
  final panels = garmentPanelRects(type);
  final parts = <DesignNode>[];
  for (var i = 0; i < garment.children.length; i++) {
    final part = garment.children[i];
    final wire = part.metadata['part'];
    if (i >= panels.length || wire is! String) {
      parts.add(_withContentOnly(part));
      continue;
    }
    final panel = panels[i];
    final zoneRects = _zoneRects(GarmentPart.fromWireName(wire), panel);
    final zones = <DesignNode>[];
    for (var z = 0; z < part.children.length; z++) {
      final zone = part.children[z];
      if (z >= zoneRects.length || zone.type != DesignNodeType.zone) {
        zones.add(_withContentOnly(zone));
        continue;
      }
      final rect = zoneRects[z];
      // Content covers its zone exactly: the substrate is the cloth of that
      // zone and the print sits on it. No per-motif offset is authored.
      zones.add(
        _withBounds(zone, rect).copyWith(
          children: [
            ...zone.children,
            for (final content in _contentFor(zone)) _withBounds(content, rect),
          ],
        ),
      );
    }
    parts.add(_withBounds(part, panel).copyWith(children: zones));
  }
  final sheet = _bounds(panels);
  final placed = garment.copyWith(children: parts);
  return sheet == null ? placed : _withBounds(placed, sheet);
}

/// The textile content a zone's declared slot accepts, in z-order.
List<DesignNode> _contentFor(DesignNode zone) {
  final accepts = acceptsForSlot('${zone.metadata['zone_slot']}');
  return [
    for (final type in const [
      TextileObjectType.fabric,
      TextileObjectType.motif,
    ])
      if (accepts.contains(type.wireName))
        textileContentNode(id: '${zone.id}-${type.wireName}', type: type),
  ];
}
