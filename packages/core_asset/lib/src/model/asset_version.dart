import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset_version.freezed.dart';
part 'asset_version.g.dart';

/// One immutable entry of an asset's version lineage.
///
/// Assets never overwrite: every edit appends a record with a new content
/// [hash]; prior hashes stay resolvable (catalogue lookup + content store)
/// forever. AI-produced versions link their provenance record by id
/// (invariant I5).
@freezed
abstract class AssetVersionRecord with _$AssetVersionRecord {
  const factory AssetVersionRecord({
    /// Monotonic version number, starting at 1.
    required int version,

    /// Content hash of this version (`sha256:<hex>`).
    required String hash,

    required DateTime createdAt,

    @Default('local') String author,

    /// What produced this version (e.g. `import`, `colour_shift`,
    /// `ai_enhance`) — a label, not an enum: tools name their own edits.
    String? operation,

    /// Id of the `AiProvenanceRecord` when the edit was AI-produced
    /// (invariant I5 — referenced, never duplicated).
    String? provenanceId,

    String? comment,

    /// Tool/operation parameters that produced this version.
    @Default(<String, Object?>{}) Map<String, Object?> parameters,
  }) = _AssetVersionRecord;

  factory AssetVersionRecord.fromJson(Map<String, Object?> json) =>
      _$AssetVersionRecordFromJson(json);
}
