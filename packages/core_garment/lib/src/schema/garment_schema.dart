import 'package:core_garment/src/parts/symmetry_link.dart';
import 'package:core_geometry/core_geometry.dart';
import 'package:core_textile/core_textile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'garment_schema.freezed.dart';
part 'garment_schema.g.dart';

/// Four-sided physical insets for a part panel (§3: "printable 2D region
/// with seam/bleed allowances") — the frozen `CanvasInsets` four-sided
/// shape (ADR-0018), declared locally per the approved representation
/// determination: the canvas type stays canvas-owned; this schema type
/// shares the *shape* convention only. Values are in the owning
/// [GarmentSchema.unit].
@freezed
abstract class PartInsets with _$PartInsets {
  @Assert(
    'left >= 0 && top >= 0 && right >= 0 && bottom >= 0',
    'insets must be non-negative',
  )
  const factory PartInsets({
    @Default(0.0) double left,
    @Default(0.0) double top,
    @Default(0.0) double right,
    @Default(0.0) double bottom,
  }) = _PartInsets;

  factory PartInsets.fromJson(Map<String, Object?> json) =>
      _$PartInsetsFromJson(json);

  const PartInsets._();

  static const PartInsets zero = PartInsets();
}

/// A declared content slot on a part (§3 "zone slots") — a minimal
/// declaration of a node-to-be (the approved determination): zone
/// *semantics* stay with the frozen `DesignNodeType.zone`; the
/// instantiator turns each slot into a `zone` tree node carrying the
/// slot id.
@freezed
abstract class ZoneSlot with _$ZoneSlot {
  const factory ZoneSlot({
    /// Stable slot id (unique within its part definition).
    required String id,

    required String name,

    /// Accepted content hints — wire strings (e.g. frozen
    /// `TextileObjectType` wire names); free-form, injected schema data.
    @Default(<String>[]) List<String> accepts,
  }) = _ZoneSlot;

  factory ZoneSlot.fromJson(Map<String, Object?> json) =>
      _$ZoneSlotFromJson(json);
}

/// One part definition (§3): "part type, cardinality, flat-panel
/// geometry (printable 2D region with seam/bleed allowances,
/// physical-unit-first in cm), zone slots, anchors, allowed style
/// variants, symmetry group."
///
/// Anchors are documented schema data (the approved determination — no
/// consuming slice has frozen their type): they ride
/// `metadata['anchors']` until one does (the frozen "until typed models
/// land" doctrine).
@freezed
abstract class PartDefinition with _$PartDefinition {
  @Assert('cardinality >= 1', 'cardinality must be at least 1')
  const factory PartDefinition({
    /// The frozen part vocabulary this definition types.
    @JsonKey(fromJson: _partFromJson, toJson: _partToJson)
    required GarmentPart part,

    /// How many instances a garment carries (2 for mirrored pairs).
    @Default(1) int cardinality,

    /// Flat-panel size (printable 2D region) in the schema's unit.
    required Size2D panelSize,

    /// Seam allowance insets, relative to the panel.
    @Default(PartInsets.zero) PartInsets seamAllowance,

    /// Bleed insets, relative to the panel.
    @Default(PartInsets.zero) PartInsets bleed,

    /// Declared content slots.
    @Default(<ZoneSlot>[]) List<ZoneSlot> zoneSlots,

    /// Allowed style variants — wire strings (§3 "structure variants as
    /// swaps"; the swap engine is a later slice). Injected schema data.
    @Default(<String>[]) List<String> allowedVariants,

    /// Symmetry group name; parts sharing a group share content by
    /// default (§3 "symmetry links"). Null = unlinked.
    String? symmetryGroup,

    /// Open schema data (anchors ride `metadata['anchors']` until a
    /// consuming slice freezes their type).
    @Default(<String, Object?>{}) Map<String, Object?> metadata,
  }) = _PartDefinition;

  factory PartDefinition.fromJson(Map<String, Object?> json) =>
      _$PartDefinitionFromJson(json);
}

/// The versioned garment schema (§3: "schema (content, versioned) vs
/// instance (in tree)"). Schema *content* is injected — authored by the
/// content team as declarative JSON (Schema Studio, Phase 4); this
/// package ships the typed container and **zero** launch-schema content.
@freezed
abstract class GarmentSchema with _$GarmentSchema {
  @Assert('schemaVersion >= 1', 'schemaVersion must be at least 1')
  const factory GarmentSchema({
    /// Stable schema id (e.g. a content-pack key).
    required String id,

    /// The frozen garment vocabulary this schema types.
    @JsonKey(fromJson: _garmentFromJson, toJson: _garmentToJson)
    required GarmentType garment,

    /// Content version (§3 "schema versioning + migration"; migration
    /// tooling is a later slice — the field is the seam).
    @Default(1) int schemaVersion,

    /// The unit every physical value in this schema uses (§3
    /// "physical-unit-first in cm").
    @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson)
    @Default(MeasurementUnit.centimetre)
    MeasurementUnit unit,

    /// The part definitions, in presentation order.
    @Default(<PartDefinition>[]) List<PartDefinition> parts,

    /// Declared symmetry links across part instances.
    @Default(<SymmetryLink>[]) List<SymmetryLink> symmetryLinks,

    @Default(<String, Object?>{}) Map<String, Object?> metadata,
  }) = _GarmentSchema;

  factory GarmentSchema.fromJson(Map<String, Object?> json) =>
      _$GarmentSchemaFromJson(json);
}

GarmentPart _partFromJson(String wireName) =>
    GarmentPart.fromWireName(wireName);

String _partToJson(GarmentPart part) => part.wireName;

GarmentType _garmentFromJson(String wireName) =>
    GarmentType.fromWireName(wireName);

String _garmentToJson(GarmentType garment) => garment.wireName;

MeasurementUnit _unitFromJson(String wireName) =>
    MeasurementUnit.fromWireName(wireName);

String _unitToJson(MeasurementUnit unit) => unit.wireName;
