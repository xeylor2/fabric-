import 'package:core_asset/src/model/asset_colour_space.dart';
import 'package:core_asset/src/model/asset_origin.dart';
import 'package:core_asset/src/model/asset_type.dart';
import 'package:core_asset/src/model/asset_version.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'febric_asset.freezed.dart';
part 'febric_asset.g.dart';

/// THE asset of the FEBRIC Operating System — the single source of truth
/// for one external resource (ADR-0016).
///
/// Identity discipline (no duplicate identity):
/// - [id] is the ONE uuid of this asset everywhere: the document
///   manifest's `AssetRecord.id` (core_document, frozen M2 schema), tree
///   node references, tool targets and AI inputs all carry this id.
/// - [hash] is the current content address; bitmap bytes live ONLY in the
///   content-addressed store — never in nodes, layers or documents.
///
/// Immutability discipline: the value object is deeply immutable and the
/// content it addresses never changes — edits append an
/// [AssetVersionRecord] (new hash, new version number) via the engine;
/// nothing is ever overwritten.
@freezed
abstract class FebricAsset with _$FebricAsset {
  const factory FebricAsset({
    /// Stable UUID — the single identity shared with every registry that
    /// references this asset.
    required String id,

    required String name,

    @JsonKey(fromJson: _typeFromJson, toJson: _typeToJson)
    required AssetType type,

    @JsonKey(fromJson: _originFromJson, toJson: _originToJson)
    required AssetOrigin origin,

    /// IANA media type (`image/png`, `font/ttf`, …).
    required String mimeType,

    /// Current content hash (`sha256:<hex>`) — the address of the latest
    /// version's bytes in the content store.
    required String hash,

    /// Pixel dimensions — required for raster types, absent otherwise.
    int? width,
    int? height,

    /// Native resolution (dots per inch) for print-fidelity checks.
    double? dpi,

    @JsonKey(fromJson: _colourSpaceFromJson, toJson: _colourSpaceToJson)
    AssetColourSpace? colourSpace,

    required DateTime createdAt,
    required DateTime modifiedAt,

    /// Current version number (== `versions.last.version`).
    @Default(1) int version,

    /// Full immutable lineage, oldest first, INCLUDING the current
    /// version. Never truncated, never rewritten.
    @Default(<AssetVersionRecord>[]) List<AssetVersionRecord> versions,

    @Default(<String>[]) List<String> tags,

    /// Open metadata for milestone-specific payloads (palette signatures,
    /// embeddings pointers, plugin annotations).
    @Default(<String, Object?>{}) Map<String, Object?> metadata,
  }) = _FebricAsset;

  factory FebricAsset.fromJson(Map<String, Object?> json) =>
      _$FebricAssetFromJson(json);

  const FebricAsset._();

  /// The lineage record of the current version (null only for values
  /// constructed outside the engine without lineage).
  AssetVersionRecord? get currentVersion =>
      versions.isEmpty ? null : versions.last;

  /// Every content hash this asset has ever addressed (oldest first).
  List<String> get allHashes => [
    for (final record in versions) record.hash,
    if (versions.isEmpty) hash,
  ];

  /// Whether [candidate] equals the current or any historical hash.
  bool ownsHash(String candidate) =>
      hash == candidate || versions.any((v) => v.hash == candidate);

  /// Lineage consistency: current [version]/[hash] must equal the last
  /// record and version numbers must ascend 1..n (engine invariant).
  bool get isLineageConsistent {
    if (versions.isEmpty) {
      return version == 1;
    }
    for (var i = 0; i < versions.length; i++) {
      if (versions[i].version != i + 1) {
        return false;
      }
    }
    return version == versions.last.version && hash == versions.last.hash;
  }
}

AssetType _typeFromJson(String wireName) => AssetType.fromWireName(wireName);

String _typeToJson(AssetType type) => type.wireName;

AssetOrigin _originFromJson(String wireName) =>
    AssetOrigin.fromWireName(wireName);

String _originToJson(AssetOrigin origin) => origin.wireName;

AssetColourSpace? _colourSpaceFromJson(String? wireName) =>
    wireName == null ? null : AssetColourSpace.fromWireName(wireName);

String? _colourSpaceToJson(AssetColourSpace? space) => space?.wireName;
