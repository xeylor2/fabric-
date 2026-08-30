/// **Placement**: the one step that makes a compiled object's own frozen
/// `RenderObject.transform` reach the frozen consumers that read
/// `RenderObject.bounds`.
///
/// The frozen model already declares both halves of the answer — `bounds` is
/// "axis-aligned bounds in document space (culling + spatial index)" and
/// `transform` is the "resolved local→world transform" — and the frozen textile
/// producer already reads a node's own persisted `transform` key into it
/// (ADR-0019 / M16-D3(b)). Nothing composes them, so every downstream consumer
/// (the frozen `CullService`, the frozen `SpatialIndexContract` behind hit
/// testing, the Flutter render driver, the frozen `OverlayStack` bounds) reads
/// an unplaced rectangle. This file is that composition, and only that:
///
/// - the maths is the frozen `Transform2D.apply` and the frozen
///   `Rect2D.boundingPoints` — no geometry, bounds or measurement system is
///   introduced, and no transform algebra is defined here;
/// - the result lands in the frozen `bounds` field the consumers already read,
///   so no consumer changes and no new render stage exists;
/// - `transform` becomes the frozen `Transform2D.identity` once consumed, so it
///   can never be applied twice;
/// - the frozen `tileKeysFor` re-derives the tile coverage of the placed
///   rectangle, exactly as the frozen compiler does for an unplaced one.
///
/// An identity transform is returned **verbatim**: a placed graph of
/// transform-free objects is byte-identical to the compiled graph, so
/// everything that behaved a certain way before a motif was ever moved still
/// does.
///
/// It is pure and read-only: it holds no document, emits no `DocumentCommand`
/// and mutates nothing. `DocumentEngine.apply` remains the sole mutation
/// authority and this file never reaches it.
library;

import 'package:core_geometry/core_geometry.dart';
import 'package:core_performance/core_performance.dart';
import 'package:core_render/core_render.dart';

/// The document-space rectangle [object] actually occupies: its own frozen
/// transform applied to its own frozen bounds. Identity → the bounds verbatim.
Rect2D placedBoundsOf(RenderObject object) {
  final transform = object.transform;
  if (transform.isIdentity) {
    return object.bounds;
  }
  final bounds = object.bounds;
  return Rect2D.boundingPoints([
    transform.apply(Point2D(x: bounds.left, y: bounds.top)),
    transform.apply(Point2D(x: bounds.right, y: bounds.top)),
    transform.apply(Point2D(x: bounds.left, y: bounds.bottom)),
    transform.apply(Point2D(x: bounds.right, y: bounds.bottom)),
  ]);
}

/// [object] with its placement folded into the frozen `bounds` field and its
/// (now consumed) transform reset to the frozen identity. Transform-free
/// objects are returned unchanged.
RenderObject placedObject(RenderObject object) {
  if (object.transform.isIdentity) {
    return object;
  }
  final bounds = placedBoundsOf(object);
  return object.copyWith(
    bounds: bounds,
    transform: Transform2D.identity,
    tileKeys: tileKeysFor(bounds, TileSpec.standard),
  );
}

/// [graph] as a surface presents it: every object placed. Draw order, identity,
/// revision and target are untouched — placement moves a rectangle, never an
/// object's position in the frozen order.
RenderGraph placedGraph(RenderGraph graph) => graph.copyWith(
  objects: [for (final object in graph.objects) placedObject(object)],
);

/// [graph] with the object sourced from [nodeId] carrying [transform] instead of
/// its own persisted one — the EPHEMERAL in-flight transform of a live move
/// (B-2), which the frozen `TransformRuntime` anchored on that node's persisted
/// transform and therefore already includes it.
///
/// Substitution, never composition: composing here would apply the anchor
/// twice. An unknown [nodeId] leaves the graph untouched. Nothing is persisted —
/// this graph exists for one frame of one gesture.
RenderGraph withInFlightTransform(
  RenderGraph graph, {
  required String nodeId,
  required Transform2D transform,
}) => graph.copyWith(
  objects: [
    for (final object in graph.objects)
      if (object.source.refId == nodeId)
        object.copyWith(transform: transform)
      else
        object,
  ],
);
