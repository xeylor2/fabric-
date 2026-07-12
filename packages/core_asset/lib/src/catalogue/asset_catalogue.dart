import 'package:core_asset/src/model/asset_type.dart';
import 'package:core_asset/src/model/febric_asset.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset_catalogue.freezed.dart';
part 'asset_catalogue.g.dart';

/// The single asset registry of a project (ADR-0016): every lookup the
/// workspace needs — by uuid, by content hash (any version), by type, by
/// tag — over one immutable map. Usage-based queries live on
/// `AssetUsageGraph`, which joins against this catalogue.
@freezed
abstract class AssetCatalogue with _$AssetCatalogue {
  const factory AssetCatalogue({
    @Default(<String, FebricAsset>{}) Map<String, FebricAsset> assets,
  }) = _AssetCatalogue;

  factory AssetCatalogue.fromJson(Map<String, Object?> json) =>
      _$AssetCatalogueFromJson(json);

  const AssetCatalogue._();

  static const AssetCatalogue empty = AssetCatalogue();

  int get count => assets.length;

  /// Lookup by uuid.
  FebricAsset? byId(String id) => assets[id];

  /// Lookup by content hash — matches the CURRENT or ANY HISTORICAL
  /// version (immutable lineage: old hashes stay resolvable forever).
  FebricAsset? byHash(String hash) {
    for (final asset in assets.values) {
      if (asset.ownsHash(hash)) {
        return asset;
      }
    }
    return null;
  }

  /// Every asset of [type], in registration order.
  List<FebricAsset> ofType(AssetType type) => [
    for (final asset in assets.values)
      if (asset.type == type) asset,
  ];

  /// Every asset carrying [tag], in registration order.
  List<FebricAsset> withTag(String tag) => [
    for (final asset in assets.values)
      if (asset.tags.contains(tag)) asset,
  ];

  /// Duplicate content detection: groups of DISTINCT assets whose current
  /// hash is identical (same bytes registered under different identities).
  /// Keyed by hash; only groups with two or more members are returned.
  Map<String, List<FebricAsset>> get duplicateGroups {
    final byCurrentHash = <String, List<FebricAsset>>{};
    for (final asset in assets.values) {
      byCurrentHash.putIfAbsent(asset.hash, () => []).add(asset);
    }
    byCurrentHash.removeWhere((_, group) => group.length < 2);
    return byCurrentHash;
  }

  /// Catalogue with [asset] added or replaced.
  AssetCatalogue withAsset(FebricAsset asset) =>
      AssetCatalogue(assets: {...assets, asset.id: asset});

  /// Catalogue with [id] removed.
  AssetCatalogue withoutAsset(String id) =>
      AssetCatalogue(assets: {...assets}..remove(id));
}
