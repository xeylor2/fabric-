import 'package:core_canvas/core_canvas.dart';
import 'package:core_canvas_runtime/core_canvas_runtime.dart';
import 'package:core_geometry/core_geometry.dart';
import 'package:core_performance/core_performance.dart';
import 'package:core_render/core_render.dart';

/// The **Render Session** of the Flutter canvas surface: the frozen
/// `RenderSession` contract (Rendering Constitution §3.2), which is itself the
/// frozen `HitTestContract` (M5A, ADR-0018).
///
/// Hit testing is composed entirely from already-established seams and adds no
/// mechanism of its own:
///
/// - the screen point crosses the frozen coordinate pipeline through
///   [CoordinateConversion] over the single shared `ViewportState` (R4);
/// - candidates come from the frozen `SpatialIndexContract` implementation
///   (`BoundsSpatialIndex`) built over the compiled graph's own
///   `RenderObject.bounds` — never a linear scan of the document;
/// - the winner is the **topmost** candidate under the graph's own frozen
///   `RenderGraph.drawOrder`, so the resolved identity is the deepest visible
///   node at that point (a printed motif wins over the cloth beneath it, which
///   wins over the zone, the part and the garment);
/// - the answer is the frozen `HitTestResult` carrying the existing
///   `DesignNode.id` — a reference, never a node object.
///
/// It is strictly **read-only**: it resolves identity and nothing else. No
/// transform is written, no movement is performed, no selection state is owned
/// and no `DocumentCommand` is emitted. `DocumentEngine.apply` remains the sole
/// mutation authority and this session never reaches it.
final class FlutterRenderSession implements RenderSession {
  FlutterRenderSession({
    required this.target,
    required this.context,
    required this.graph,
  }) {
    for (final object in graph.objects) {
      _index.insert(object, object.bounds);
    }
  }

  @override
  final RenderTarget target;

  @override
  final RenderContext context;

  /// The compiled graph this session resolves against — one graph per document
  /// revision (R3), supplied by the frozen compiler.
  final RenderGraph graph;

  /// The frozen spatial-index contract over the graph's bounds.
  final SpatialIndexContract<RenderObject> _index = BoundsSpatialIndex();

  @override
  HitTestResult hitTest(HitTestQuery query) {
    final conversion = CoordinateConversion(context.viewport);
    final point = conversion.screenToDocument(query.screenPoint);
    final slop = _documentSlop(query.tolerance);
    final candidates = _index.query(
      Rect2D(
        left: point.x - slop,
        top: point.y - slop,
        width: slop * 2,
        height: slop * 2,
      ),
    );
    final hits = [
      for (final object in candidates)
        // Beyond the index's own narrowing, an exact query (no slop) must
        // contain the point; a tolerant one is already satisfied.
        if (query.tolerance > 0 || object.bounds.containsPoint(point)) object,
    ]..sort(RenderGraph.drawOrder);
    if (hits.isEmpty) {
      return HitTestResult.miss(point);
    }
    return HitTestResult(
      kind: HitTargetKind.node,
      documentPoint: point,
      semanticNodeId: hits.last.source.refId,
    );
  }

  @override
  List<String> hitTestRegion(Rect2D region) {
    final hits = _index.query(region)..sort(RenderGraph.drawOrder);
    return [for (final object in hits) object.source.refId];
  }

  /// The query's screen-pixel [tolerance] in document units, through the shared
  /// viewport's own zoom. A zero tolerance still needs a non-degenerate probe
  /// region — the frozen `Rect2D.intersects` is a strict overlap test — so an
  /// exact query probes an epsilon box and is then narrowed by `containsPoint`.
  double _documentSlop(double tolerance) {
    final zoom = context.viewport.zoom;
    if (tolerance <= 0) {
      return _exactProbe;
    }
    return zoom == 0 ? tolerance : tolerance / zoom;
  }

  /// The epsilon half-extent of an exact (zero-tolerance) probe box.
  static const double _exactProbe = 1e-9;
}
