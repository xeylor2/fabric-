import 'package:core_asset/src/catalogue/asset_catalogue.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset_usage_graph.freezed.dart';
part 'asset_usage_graph.g.dart';

/// One edge of the dependency graph (ADR-0016):
///
/// ```
/// Asset → Node → Artboard → Document
/// ```
///
/// The full chain is recorded so every projection (which assets does this
/// document need? which nodes render this asset?) is a filter, never a
/// join across engines.
@freezed
abstract class AssetUsage with _$AssetUsage {
  const factory AssetUsage({
    required String assetId,
    required String nodeId,
    required String artboardId,
    required String documentId,
  }) = _AssetUsage;

  factory AssetUsage.fromJson(Map<String, Object?> json) =>
      _$AssetUsageFromJson(json);
}

/// The immutable asset dependency graph of a project: reference counting,
/// shared/unused/broken detection and per-scope projections over the
/// recorded [AssetUsage] edges. Edges are a set (recording the same usage
/// twice is a no-op).
@freezed
abstract class AssetUsageGraph with _$AssetUsageGraph {
  const factory AssetUsageGraph({
    @Default(<AssetUsage>[]) List<AssetUsage> usages,
  }) = _AssetUsageGraph;

  factory AssetUsageGraph.fromJson(Map<String, Object?> json) =>
      _$AssetUsageGraphFromJson(json);

  const AssetUsageGraph._();

  static const AssetUsageGraph empty = AssetUsageGraph();

  int get count => usages.length;

  // ---- projections ----------------------------------------------------------

  /// Every edge referencing [assetId].
  List<AssetUsage> usagesOf(String assetId) => [
    for (final usage in usages)
      if (usage.assetId == assetId) usage,
  ];

  /// How many nodes reference [assetId] (the reference count).
  int referenceCount(String assetId) => usagesOf(assetId).length;

  /// Distinct nodes referencing [assetId] as `documentId + nodeId` keys,
  /// in recording order. Node ids are unique only WITHIN a document (each
  /// document runs its own id generator), so cross-document distinctness
  /// must key on the pair — never on `nodeId` alone. The join uses a space,
  /// which cannot appear inside a FEBRIC id.
  List<String> nodeKeysUsing(String assetId) => _distinct([
    for (final usage in usages)
      if (usage.assetId == assetId) '${usage.documentId} ${usage.nodeId}',
  ]);

  /// Distinct node ids referencing [assetId], in recording order. Scoped
  /// to [documentId] when given (the safe cross-document query); without
  /// it, node ids from different documents may alias.
  List<String> nodesUsing(String assetId, {String? documentId}) => _distinct([
    for (final usage in usages)
      if (usage.assetId == assetId &&
          (documentId == null || usage.documentId == documentId))
        usage.nodeId,
  ]);

  /// Distinct document ids referencing [assetId], in recording order.
  List<String> documentsUsing(String assetId) => _distinct([
    for (final usage in usages)
      if (usage.assetId == assetId) usage.documentId,
  ]);

  /// Distinct asset ids referenced anywhere in [documentId].
  List<String> assetsInDocument(String documentId) => _distinct([
    for (final usage in usages)
      if (usage.documentId == documentId) usage.assetId,
  ]);

  /// Distinct asset ids referenced anywhere on [artboardId].
  List<String> assetsInArtboard(String artboardId) => _distinct([
    for (final usage in usages)
      if (usage.artboardId == artboardId) usage.assetId,
  ]);

  /// Distinct asset ids referenced by [nodeId].
  List<String> assetsInNode(String nodeId) => _distinct([
    for (final usage in usages)
      if (usage.nodeId == nodeId) usage.assetId,
  ]);

  // ---- detection (reference counting) ----------------------------------------

  /// Catalogue assets with zero references — safe-to-remove candidates.
  List<String> unusedAssetIds(AssetCatalogue catalogue) => [
    for (final id in catalogue.assets.keys)
      if (referenceCount(id) == 0) id,
  ];

  /// Catalogue assets referenced by two or more distinct nodes — one
  /// asset, many nodes (the graph's whole point: no duplicate storage).
  /// Distinctness is keyed on `(documentId, nodeId)` so a shared asset is
  /// not miscounted when two documents use colliding node ids.
  List<String> sharedAssetIds(AssetCatalogue catalogue) => [
    for (final id in catalogue.assets.keys)
      if (nodeKeysUsing(id).length >= 2) id,
  ];

  /// Edges whose asset id is unknown to the catalogue — a document
  /// references an asset this project does not hold (moved `.febric`
  /// files, force-removed assets).
  List<AssetUsage> brokenReferences(AssetCatalogue catalogue) => [
    for (final usage in usages)
      if (catalogue.byId(usage.assetId) == null) usage,
  ];

  // ---- edits -----------------------------------------------------------------

  /// Graph with [usage] recorded (set semantics: no duplicate edges).
  AssetUsageGraph withUsage(AssetUsage usage) => usages.contains(usage)
      ? this
      : AssetUsageGraph(usages: [...usages, usage]);

  /// Graph with [usage] removed.
  AssetUsageGraph withoutUsage(AssetUsage usage) => AssetUsageGraph(
    usages: [
      for (final existing in usages)
        if (existing != usage) existing,
    ],
  );

  /// Graph with every edge of node [nodeId] in [documentId] removed (node
  /// deleted). Document-scoped because node ids collide across documents —
  /// deleting `n-1` from one document must not drop another document's
  /// `n-1` edges.
  AssetUsageGraph withoutNode(String nodeId, {required String documentId}) =>
      AssetUsageGraph(
        usages: [
          for (final usage in usages)
            if (!(usage.nodeId == nodeId && usage.documentId == documentId))
              usage,
        ],
      );

  /// Graph with [documentId]'s edges replaced wholesale by [next] — the
  /// resync path after a document's trees change (the document is the
  /// authority over its own references).
  AssetUsageGraph replacingDocument(String documentId, List<AssetUsage> next) {
    final kept = [
      for (final usage in usages)
        if (usage.documentId != documentId) usage,
    ];
    final result = <AssetUsage>[...kept];
    for (final usage in next) {
      if (usage.documentId == documentId && !result.contains(usage)) {
        result.add(usage);
      }
    }
    return AssetUsageGraph(usages: result);
  }

  static List<String> _distinct(List<String> values) {
    final seen = <String>{};
    return [
      for (final value in values)
        if (seen.add(value)) value,
    ];
  }
}
