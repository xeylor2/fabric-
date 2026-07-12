import 'package:core_textile/src/garment/garment_type.dart';

/// Every addressable garment part across all garment types.
///
/// A single flat enum (rather than per-garment enums) so that node types,
/// AI scopes and semantic paths share one vocabulary; which parts a given
/// garment actually has is defined by [GarmentAnatomy].
///
/// Frozen vocabulary (ADR-0002): names and wire names are permanent.
enum GarmentPart {
  // ---- Kurta ---------------------------------------------------------------
  /// The main body panel of a kurta (the printable ground of the garment).
  base('base', 'Base'),

  /// Neckline region and its ornamentation zone.
  neck('neck', 'Neck'),

  /// Sleeve panel (left/right instances are resolved at the node layer).
  sleeve('sleeve', 'Sleeve'),

  /// Sleeve-end band.
  cuff('cuff', 'Cuff'),

  /// Bottom edge band of a garment panel.
  hem('hem', 'Hem'),

  /// Decorative running band; garments may carry several.
  border('border', 'Border'),

  /// The dominant, largest-scale motif of the composition.
  heroMotif('hero_motif', 'Hero Motif'),

  /// Supporting mid-scale motif.
  secondaryMotif('secondary_motif', 'Secondary Motif'),

  /// Small-scale scattered motif filling ground between larger elements.
  fillerMotif('filler_motif', 'Filler Motif'),

  /// The background field behind all motifs.
  ground('ground', 'Ground'),

  /// Surface texture layer (weave, wash, grain).
  texture('texture', 'Texture'),

  /// Button placket / fastening ornamentation.
  buttons('buttons', 'Buttons'),

  // ---- Dupatta -------------------------------------------------------------
  /// Ornamented end-panel at the top of a dupatta.
  topPallu('top_pallu', 'Top Pallu'),

  /// The central field between the two pallus.
  middleField('middle_field', 'Middle Field'),

  /// Ornamented end-panel at the bottom of a dupatta.
  bottomPallu('bottom_pallu', 'Bottom Pallu'),

  /// Running border along the left long edge.
  leftBorder('left_border', 'Left Border'),

  /// Running border along the right long edge.
  rightBorder('right_border', 'Right Border'),

  /// Corner ornament where pallu and side borders meet.
  cornerMotif('corner_motif', 'Corner Motif'),

  /// Fringe / tassel finishing along pallu edges.
  fringe('fringe', 'Fringe'),

  // ---- Pant ----------------------------------------------------------------
  /// Waistband region of a pant.
  waist('waist', 'Waist'),

  /// Leg panel of a pant.
  leg('leg', 'Leg');

  const GarmentPart(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static GarmentPart fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown GarmentPart wire name',
      ),
    );
  }
}

/// The frozen anatomy of each garment type: which parts it exposes, in
/// canonical z-/reading-order. Engines iterate this — never hardcode part
/// lists.
abstract final class GarmentAnatomy {
  /// Kurta anatomy as mandated by the M1 domain foundation.
  static const List<GarmentPart> kurta = [
    GarmentPart.base,
    GarmentPart.neck,
    GarmentPart.sleeve,
    GarmentPart.cuff,
    GarmentPart.hem,
    GarmentPart.border,
    GarmentPart.heroMotif,
    GarmentPart.secondaryMotif,
    GarmentPart.fillerMotif,
    GarmentPart.ground,
    GarmentPart.texture,
    GarmentPart.buttons,
  ];

  /// Dupatta anatomy: pallus, field, side borders, corners, fringe.
  static const List<GarmentPart> dupatta = [
    GarmentPart.topPallu,
    GarmentPart.middleField,
    GarmentPart.bottomPallu,
    GarmentPart.leftBorder,
    GarmentPart.rightBorder,
    GarmentPart.cornerMotif,
    GarmentPart.fringe,
  ];

  /// Pant anatomy.
  static const List<GarmentPart> pant = [
    GarmentPart.waist,
    GarmentPart.leg,
    GarmentPart.hem,
    GarmentPart.border,
  ];

  /// Shawl anatomy (field + borders + fringe; refined when the shawl
  /// schema ships as content).
  static const List<GarmentPart> shawl = [
    GarmentPart.middleField,
    GarmentPart.leftBorder,
    GarmentPart.rightBorder,
    GarmentPart.border,
    GarmentPart.fringe,
  ];

  /// Saree anatomy (pallu, body field, running border).
  static const List<GarmentPart> saree = [
    GarmentPart.topPallu,
    GarmentPart.middleField,
    GarmentPart.border,
  ];

  /// Abaya anatomy.
  static const List<GarmentPart> abaya = [
    GarmentPart.base,
    GarmentPart.neck,
    GarmentPart.sleeve,
    GarmentPart.cuff,
    GarmentPart.hem,
    GarmentPart.border,
  ];

  /// Parts for [type], in canonical order.
  static List<GarmentPart> of(GarmentType type) {
    return switch (type) {
      GarmentType.kurta => kurta,
      GarmentType.pant => pant,
      GarmentType.dupatta => dupatta,
      GarmentType.shawl => shawl,
      GarmentType.saree => saree,
      GarmentType.abaya => abaya,
    };
  }
}
