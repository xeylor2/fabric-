import 'package:core_canvas/core_canvas.dart';
import 'package:core_interaction/core_interaction.dart';

/// **Coordinate Conversion** (M6): the concrete entry points that move a point
/// between the frozen [CoordinateSpace]s (`document → world → viewport →
/// screen`, ADR-0018).
///
/// It reuses the frozen transforms — `ViewportState.screenToCanvas` /
/// `canvasToScreen` (`core_interaction`) — and never reimplements the maths.
/// In the current single-artboard runtime, document and world space coincide
/// (no multi-artboard placement transform yet), so the world hop is the
/// identity; this class names the pipeline stages so tools depend on the
/// stable API rather than on `ViewportState` directly. Pure and deterministic.
final class CoordinateConversion {
  const CoordinateConversion(this.viewport);

  /// The shared viewport this conversion reads (never mutates).
  final ViewportState viewport;

  /// Screen (device pixels) → document space (physical-unit canvas point).
  Point2D screenToDocument(Point2D screenPoint) =>
      viewport.screenToCanvas(screenPoint);

  /// Document space → screen space.
  Point2D documentToScreen(Point2D documentPoint) =>
      viewport.canvasToScreen(documentPoint);

  /// Document space → world space. Identity in the single-artboard runtime
  /// (world placement transforms arrive with multi-artboard composition).
  Point2D documentToWorld(Point2D documentPoint) => documentPoint;

  /// World space → document space. Identity in the single-artboard runtime.
  Point2D worldToDocument(Point2D worldPoint) => worldPoint;

  /// World space → screen space (via document).
  Point2D worldToScreen(Point2D worldPoint) =>
      documentToScreen(worldToDocument(worldPoint));

  /// Screen space → world space (via document).
  Point2D screenToWorld(Point2D screenPoint) =>
      documentToWorld(screenToDocument(screenPoint));
}
