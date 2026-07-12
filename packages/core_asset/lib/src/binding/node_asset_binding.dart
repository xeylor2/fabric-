import 'package:core_asset/src/graph/asset_usage_graph.dart';
import 'package:core_textile/core_textile.dart';

/// Tree integration of the Asset Engine (ADR-0016).
///
/// Design Tree nodes NEVER own bitmap data — they reference assets by
/// uuid through the frozen metadata keys below, written exclusively via
/// the existing command bus (`DocumentCommand.setNodeMetadata`). One
/// asset, many nodes; the `DesignNode` schema is untouched (its open
/// metadata contract, ADR-0002, is exactly for this).
abstract final class NodeAssetBinding {
  /// Frozen metadata key: the node's primary asset reference (uuid).
  static const String assetIdKey = 'asset_id';

  /// Frozen metadata key: additional asset references (list of uuids) —
  /// brushes, palettes, secondary fills.
  static const String assetRefsKey = 'asset_refs';

  /// The primary asset uuid of [node], if bound.
  static String? assetIdOf(DesignNode node) {
    final value = node.metadata[assetIdKey];
    return value is String && value.isNotEmpty ? value : null;
  }

  /// Every asset uuid [node] references (primary first, then refs),
  /// distinct, in declaration order. Non-string entries are ignored —
  /// corrupt metadata never crashes a walk.
  static List<String> assetIdsOf(DesignNode node) {
    final seen = <String>{};
    final ids = <String>[];
    final primary = assetIdOf(node);
    if (primary != null && seen.add(primary)) {
      ids.add(primary);
    }
    final refs = node.metadata[assetRefsKey];
    if (refs is List) {
      for (final ref in refs) {
        if (ref is String && ref.isNotEmpty && seen.add(ref)) {
          ids.add(ref);
        }
      }
    }
    return ids;
  }

  /// Walks the whole design tree under [root] and returns the usage edges
  /// it declares — the Asset → Node → Artboard → Document chain used to
  /// (re)sync the dependency graph after tree edits.
  static List<AssetUsage> collectUsages(
    DesignNode root, {
    required String artboardId,
    required String documentId,
  }) {
    return [
      for (final node in root.descendantsAndSelf)
        for (final assetId in assetIdsOf(node))
          AssetUsage(
            assetId: assetId,
            nodeId: node.id,
            artboardId: artboardId,
            documentId: documentId,
          ),
    ];
  }
}
