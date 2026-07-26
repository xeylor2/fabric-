import 'package:core_garment/src/schema/garment_schema.dart';
import 'package:core_garment/src/templates/garment_template.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'template_pack.freezed.dart';
part 'template_pack.g.dart';

/// The local representation of one published content pack (§2:
/// "server-published, versioned, locally cached **content packs** — new
/// garments ship as data").
///
/// Pure data: server publishing, fetching and cache persistence live
/// outside this package permanently (the approved Q5 ruling — outer
/// data/backend layers fetch, then inject via the registry).
@freezed
abstract class TemplatePack with _$TemplatePack {
  @Assert('packVersion >= 1', 'packVersion must be at least 1')
  const factory TemplatePack({
    /// Stable pack id.
    required String id,

    /// Display name (injected content).
    required String name,

    /// Pack version — data only (the approved Q7 discipline: no
    /// comparison or update policy lives here).
    @Default(1) int packVersion,

    /// The templates this pack ships (own-stage immutable values — the
    /// M13E embed rule).
    @Default(<GarmentTemplate>[]) List<GarmentTemplate> templates,

    /// The schemas this pack ships. §2: packs are how "new garments ship
    /// as data" — a pack delivering a new garment carries its schema, or
    /// the delivered templates' `schemaRef` would dangle offline ("cached
    /// packs fully usable", §2). Defaults to empty: packs that only add
    /// templates for already-registered schemas (the separate
    /// `content/schemas/` channel, injected via `registerSchema`) carry
    /// none.
    @Default(<GarmentSchema>[]) List<GarmentSchema> schemas,

    @Default(<String, Object?>{}) Map<String, Object?> metadata,
  }) = _TemplatePack;

  factory TemplatePack.fromJson(Map<String, Object?> json) =>
      _$TemplatePackFromJson(json);
}
