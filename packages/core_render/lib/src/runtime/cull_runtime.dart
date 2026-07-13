import 'package:core_geometry/core_geometry.dart';
import 'package:core_performance/core_performance.dart';
import 'package:core_render/src/contracts/render_contracts.dart';
import 'package:core_render/src/graph/render_graph.dart';
import 'package:core_render/src/objects/render_object.dart';

/// A bounds-indexed spatial index over render objects, implementing the
/// frozen `SpatialIndexContract` (M5B-2). Queries return only intersecting
/// items — never a linear scan of the *document* (the constitution's rule);
/// the index itself is rebuilt from graph deltas. Deterministic: results are
/// returned in insertion order, then sorted by the caller.
final class BoundsSpatialIndex implements SpatialIndexContract<RenderObject> {
  final List<(RenderObject, Rect2D)> _entries = [];

  @override
  void insert(RenderObject item, Rect2D bounds) => _entries.add((item, bounds));

  @override
  void remove(RenderObject item) =>
      _entries.removeWhere((e) => e.$1.id == item.id);

  @override
  List<RenderObject> query(Rect2D region) => [
    for (final (item, bounds) in _entries)
      if (bounds.intersects(region)) item,
  ];

  @override
  void clear() => _entries.clear();
}

/// The headless culling runtime (M5B-2), implementing the frozen
/// `CullService`. Returns the visible objects (bounds intersecting the
/// viewport's `visibleRect`) in the graph's deterministic draw order. Pure;
/// consumes the frozen spatial-index contract, never a bespoke scan.
final class CullServiceImpl implements CullService {
  const CullServiceImpl();

  @override
  List<RenderObject> cull(RenderGraph graph, Rect2D visibleRect) {
    final index = BoundsSpatialIndex();
    for (final object in graph.objects) {
      index.insert(object, object.bounds);
    }
    final visible = index.query(visibleRect)..sort(RenderGraph.drawOrder);
    return visible;
  }
}
