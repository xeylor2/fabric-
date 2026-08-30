import 'package:core_canvas/core_canvas.dart';
import 'package:core_document/core_document.dart';
import 'package:core_geometry/core_geometry.dart';
import 'package:core_performance/core_performance.dart';
import 'package:core_render/core_render.dart';
import 'package:feature_canvas_editor/feature_canvas_editor.dart';
import 'package:flutter_test/flutter_test.dart';

/// Placement: the compiled object's own frozen transform folded into the frozen
/// document-space bounds every frozen consumer reads.
///
/// Everything asserted here is a composition of frozen primitives — the frozen
/// `Transform2D.apply`, the frozen `Rect2D.boundingPoints` and the frozen
/// `tileKeysFor`. No geometry is defined, no document is touched and no
/// `DocumentCommand` exists in this file.
RenderObject _object({
  String id = 'ro:motif',
  String refId = 'motif',
  Rect2D bounds = const Rect2D(left: 10, top: 10, width: 20, height: 20),
  Transform2D transform = Transform2D.identity,
  int order = 0,
}) => RenderObject(
  id: id,
  kind: RenderObjectKind.motif,
  source: CanvasReference(kind: CanvasReferenceKind.designNode, refId: refId),
  bounds: bounds,
  transform: transform,
  order: order,
  tileKeys: tileKeysFor(bounds, TileSpec.standard),
);

RenderGraph _graph(List<RenderObject> objects) => RenderGraph(
  revision: const RevisionId(3),
  target: const RenderTarget(kind: RenderTargetKind.editor),
  objects: objects,
);

void main() {
  group('a transform-free object is untouched', () {
    test('placedBoundsOf returns the compiled bounds verbatim', () {
      final object = _object();
      expect(placedBoundsOf(object), same(object.bounds));
    });

    test('placedObject returns the identical instance', () {
      final object = _object();
      expect(placedObject(object), same(object));
    });

    test('a transform-free graph places to itself, byte for byte', () {
      final graph = _graph([
        _object(id: 'ro:fabric', refId: 'fabric'),
        _object(order: 1),
      ]);
      expect(placedGraph(graph), graph);
      expect(placedGraph(graph).toJson(), graph.toJson());
    });
  });

  group('a transform reaches the frozen bounds field', () {
    test('a translation moves the rectangle by exactly that translation', () {
      final placed = placedObject(
        _object(
          transform: const Transform2D(translation: Point2D(x: 5, y: -4)),
        ),
      );
      expect(
        placed.bounds,
        const Rect2D(left: 15, top: 6, width: 20, height: 20),
      );
    });

    test('scale is carried by the frozen Transform2D.apply', () {
      final placed = placedObject(
        _object(transform: const Transform2D(scale: 2)),
      );
      expect(
        placed.bounds,
        const Rect2D(left: 20, top: 20, width: 40, height: 40),
      );
    });

    test('the consumed transform is reset, so it can never apply twice', () {
      final placed = placedObject(
        _object(transform: const Transform2D(translation: Point2D(x: 7, y: 7))),
      );
      expect(placed.transform, Transform2D.identity);
      expect(placedObject(placed), same(placed));
      expect(placedObject(placed).bounds, placed.bounds);
    });

    test('tile coverage is re-derived by the frozen tileKeysFor', () {
      final placed = placedObject(
        _object(
          transform: const Transform2D(translation: Point2D(x: 4000, y: 4000)),
        ),
      );
      expect(placed.tileKeys, tileKeysFor(placed.bounds, TileSpec.standard));
      expect(placed.tileKeys, isNot(_object().tileKeys));
    });

    test('identity, order and draw position survive placement', () {
      final graph = _graph([
        _object(id: 'ro:fabric', refId: 'fabric'),
        _object(
          order: 1,
          transform: const Transform2D(translation: Point2D(x: 9, y: 9)),
        ),
      ]);
      final placed = placedGraph(graph);
      expect(placed.revision, graph.revision);
      expect(placed.target, graph.target);
      expect(placed.objects.map((o) => o.id), graph.objects.map((o) => o.id));
      expect(
        placed.objects.map((o) => o.order),
        graph.objects.map((o) => o.order),
      );
      expect(placed.objects.first, same(graph.objects.first));
    });
  });

  group('the in-flight transform substitutes, never composes', () {
    final graph = _graph([
      _object(id: 'ro:fabric', refId: 'fabric'),
      _object(
        order: 1,
        transform: const Transform2D(translation: Point2D(x: 100, y: 100)),
      ),
    ]);

    test('only the named object carries the ephemeral transform', () {
      const inFlight = Transform2D(translation: Point2D(x: 1, y: 2));
      final result = withInFlightTransform(
        graph,
        nodeId: 'motif',
        transform: inFlight,
      );
      expect(result.objects.last.transform, inFlight);
      expect(result.objects.first, same(graph.objects.first));
    });

    test('the anchor is not applied twice', () {
      // The frozen TransformRuntime anchored the move on the persisted
      // transform, so the ephemeral value already includes it.
      const inFlight = Transform2D(translation: Point2D(x: 130, y: 100));
      final placed = placedGraph(
        withInFlightTransform(graph, nodeId: 'motif', transform: inFlight),
      );
      expect(
        placed.objects.last.bounds,
        const Rect2D(left: 140, top: 110, width: 20, height: 20),
      );
    });

    test('an unknown node id leaves the graph alone', () {
      expect(
        withInFlightTransform(
          graph,
          nodeId: 'not-a-node',
          transform: const Transform2D(translation: Point2D(x: 5, y: 5)),
        ),
        graph,
      );
    });
  });
}
