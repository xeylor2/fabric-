import 'package:core_render/src/graph/render_graph.dart';
import 'package:core_render/src/objects/render_object.dart';

/// The result of dirty-region processing (M5B-2): the render objects and
/// tiles a damage set invalidates. Deterministic — a pure function of the
/// graph and the damaged node ids.
final class DirtyRegion {
  const DirtyRegion({required this.objects, required this.tileKeys});

  /// The render objects whose source node was damaged.
  final List<RenderObject> objects;

  /// The union of tile keys those objects cover (sorted, deterministic).
  final List<String> tileKeys;

  /// The number of distinct damaged tiles (metric `dirty_region_count`).
  int get tileCount => tileKeys.length;
}

/// Computes which render objects and tiles a command's damage invalidates
/// (Rendering Constitution §9). Node-scoped damage → intersecting tiles only
/// — never a full redraw (R3). Pure; no rendering, no mutation.
final class DirtyRegionProcessor {
  const DirtyRegionProcessor();

  /// Given a compiled [graph] and the ids of nodes whose content changed,
  /// returns the invalidated objects and their tiles.
  DirtyRegion compute(RenderGraph graph, Set<String> damagedNodeIds) {
    final objects = [
      for (final o in graph.objects)
        if (damagedNodeIds.contains(o.source.refId)) o,
    ];
    final tiles = <String>{for (final o in objects) ...o.tileKeys};
    final sorted = tiles.toList()..sort();
    return DirtyRegion(objects: objects, tileKeys: sorted);
  }
}
