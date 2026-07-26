import 'package:core_textile/core_textile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'garment_template.freezed.dart';
part 'garment_template.g.dart';

/// A catalog entry of the §2 Garment Library — "a catalog of garment
/// starting points, independent of any project's tree".
///
/// Template *content* is injected (content-team packs under `content/`;
/// the approved injected-content doctrine): this package ships the typed
/// container and **zero** launch-template content.
///
/// The blueprint shape (§2): `GarmentTemplate { id, schemaRef +
/// structure options, starterDesign?, taxonomy, authorship,
/// contentVersion }`.
@freezed
abstract class GarmentTemplate with _$GarmentTemplate {
  @Assert('contentVersion >= 1', 'contentVersion must be at least 1')
  const factory GarmentTemplate({
    /// Stable template id — the registry key.
    required String id,

    /// The referenced [GarmentSchema] id (the approved Q1 ruling:
    /// reference-only, a plain string id — never an embedded schema,
    /// never an asset-engine identity).
    required String schemaRef,

    /// §2 "structure options" — open data (the frozen ADR-0002
    /// escape-hatch doctrine); consumed by later slices (the swap
    /// engine).
    @Default(<String, Object?>{}) Map<String, Object?> structureOptions,

    /// The authored starting point (the approved Q4 ruling): an embedded
    /// immutable [DesignNode] subtree owned by the template, carrying
    /// authoring-time ids — the binder re-identifies every
    /// instantiation through the frozen `cloneWithIds` seam (deep copy
    /// by construction; §2 "instantiation deep-copies, never
    /// live-links"). Null = the instance derives from the schema alone.
    ///
    /// Any asset references inside starter content are metadata string
    /// entries authored into the fragment (the frozen ADR-0016
    /// reference-only doctrine) — data, not links.
    DesignNode? starterDesign,

    /// §2 multi-axis taxonomy (the approved Q3 ruling): axis name →
    /// tags, both injected content. The blueprint's axes —
    /// region/tradition, tier, fabric/season line, trend (server-fed) —
    /// are documented data; no axis name appears in code.
    @Default(<String, List<String>>{}) Map<String, List<String>> taxonomy,

    /// Authorship as data (the approved Q6 ruling — the save-back seam):
    /// no origin vocabulary is frozen, no behaviour branches on it.
    @Default(<String, Object?>{}) Map<String, Object?> authorship,

    /// §2 content version (the approved Q7 ruling: carried as data; the
    /// registry is version-blind; comparison/update policy is a later
    /// slice).
    @Default(1) int contentVersion,

    @Default(<String, Object?>{}) Map<String, Object?> metadata,
  }) = _GarmentTemplate;

  factory GarmentTemplate.fromJson(Map<String, Object?> json) =>
      _$GarmentTemplateFromJson(json);
}
