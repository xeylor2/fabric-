import 'package:core_canvas/core_canvas.dart';
import 'package:core_render/core_render.dart';
import 'package:feature_canvas_editor/src/render/canvas_artwork.dart';
import 'package:feature_canvas_editor/src/render/flutter_presentation_pipeline.dart';
import 'package:feature_canvas_editor/src/render/flutter_render_backend.dart';
import 'package:feature_canvas_editor/src/render/render_palette.dart';
import 'package:flutter/rendering.dart' hide RenderObject;

/// Drives the frozen render pipeline onto a Flutter surface.
///
/// This painter is the **only** new thing between the frozen pipeline and the
/// screen, and it adds no stage: it runs the constitution's frozen stage order
/// through the frozen [FrameLifecycleImpl] (which rejects any out-of-order
/// transition, so the order is unskippable, R6) —
///
///   begin → update → **cull** (frozen `CullService`) → **record** (frozen
///   `RenderPassExecutor` over the frozen pass order, into the frozen
///   `RenderBackend` seam) → composite → **present** (frozen
///   `PresentationPipeline` with the frozen `OverlayStack`) → end
///
/// — against a [FlutterRenderBackend] bound to the frame's surface. It compiles
/// nothing (the frozen `GraphCompiler` already did, at the composition root),
/// produces no render object, computes no bounds, and mutates no document.
class CanvasSurfacePainter extends CustomPainter {
  CanvasSurfacePainter({
    required this.graph,
    required this.renderContext,
    required this.palette,
    required this.resources,
    this.artwork = const <String, ResolvedCanvasArtwork>{},
    this.overlays = OverlayStack.empty,
    this.metricsSink,
    this.cull = const CullServiceImpl(),
    RenderPassExecutor? passes,
  }) : _passes =
           passes ?? RenderPassExecutor(RenderPassRegistryImpl.standard());

  /// The compiled graph of the current document revision.
  final RenderGraph graph;

  /// The immutable per-frame parameter bundle (viewport, tiles, colour space).
  final RenderContext renderContext;

  /// The Theme Engine colours the driver paints with.
  final CanvasRenderPalette palette;

  /// The frozen resource registry — ref-counts artwork textures across frames,
  /// so it is owned by the surface and outlives any one frame.
  final ResourceRegistry resources;

  /// Decoded artwork by referencing node id.
  final Map<String, ResolvedCanvasArtwork> artwork;

  /// Canvas-owned overlays, in the frozen stack's deterministic paint order.
  final OverlayStack overlays;

  /// Optional frozen metrics observer (§G). Reading never alters a frame.
  final RenderMetricsSink? metricsSink;

  /// The frozen culling service — the visible set comes from it, never from a
  /// scan written here.
  final CullService cull;

  final RenderPassExecutor _passes;

  @override
  void paint(Canvas canvas, Size size) {
    final backend = FlutterRenderBackend(
      palette: palette,
      artwork: artwork,
      resources: resources,
    );
    try {
      backend.beginFrame(canvas);
      final lifecycle = FrameLifecycleImpl();
      lifecycle.advanceTo(FrameLifecycleState.scheduled);
      lifecycle.advanceTo(FrameLifecycleState.begin);
      lifecycle.advanceTo(FrameLifecycleState.update);

      lifecycle.advanceTo(FrameLifecycleState.cull);
      final visible = cull.cull(graph, renderContext.viewport.visibleRect);

      // Records every pass in the frozen order, then composites (the frozen
      // executor's own behaviour) — this painter drives, it does not reorder.
      lifecycle.advanceTo(FrameLifecycleState.record);
      _passes.execute(visible, backend, renderContext);

      lifecycle.advanceTo(FrameLifecycleState.submit);
      lifecycle.advanceTo(FrameLifecycleState.present);
      FlutterPresentationPipeline(
        backend,
      ).presentFrame(renderContext, overlays);

      lifecycle.advanceTo(FrameLifecycleState.end);
      _report(visible, backend.drawCalls);
      lifecycle.advanceTo(FrameLifecycleState.idle);
    } finally {
      backend.dispose();
    }
  }

  void _report(List<RenderObject> visible, int drawCalls) {
    final sink = metricsSink;
    if (sink == null) {
      return;
    }
    final tiles = <String>{for (final object in visible) ...object.tileKeys};
    sink.onFrameMetrics(
      RenderMetrics(frameId: renderContext.frameId)
          .withMetric(RenderMetricKind.totalObjects, graph.objects.length)
          .withMetric(RenderMetricKind.visibleObjects, visible.length)
          .withMetric(
            RenderMetricKind.culledObjects,
            graph.objects.length - visible.length,
          )
          .withMetric(RenderMetricKind.drawCalls, drawCalls)
          .withMetric(RenderMetricKind.tilesMaterialized, tiles.length),
    );
  }

  @override
  bool shouldRepaint(CanvasSurfacePainter oldDelegate) =>
      oldDelegate.graph != graph ||
      oldDelegate.renderContext != renderContext ||
      oldDelegate.overlays != overlays ||
      oldDelegate.palette != palette ||
      !identical(oldDelegate.artwork, artwork);
}
