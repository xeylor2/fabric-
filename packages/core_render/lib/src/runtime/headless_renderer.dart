import 'package:core_canvas/core_canvas.dart';
import 'package:core_document/core_document.dart';
import 'package:core_geometry/core_geometry.dart';
import 'package:core_render/src/context/render_context.dart';
import 'package:core_render/src/contracts/render_contracts.dart';
import 'package:core_render/src/graph/render_graph.dart';
import 'package:core_render/src/objects/render_object.dart';
import 'package:core_render/src/observability/render_metrics.dart';
import 'package:core_render/src/runtime/cull_runtime.dart';
import 'package:core_render/src/runtime/dirty_region.dart';
import 'package:core_render/src/runtime/headless_backend.dart';
import 'package:core_render/src/runtime/render_graph_compiler.dart';
import 'package:core_render/src/runtime/render_pass_runtime.dart';
import 'package:core_render/src/runtime/render_pipeline_runtime.dart';
import 'package:core_render/src/target/render_target.dart';

/// The immutable result of one headless frame (M5B-2).
final class HeadlessFrameResult {
  const HeadlessFrameResult({
    required this.graph,
    required this.visible,
    required this.metrics,
  });

  final RenderGraph graph;
  final List<RenderObject> visible;
  final RenderMetrics metrics;
}

/// The Headless Renderer Service (M5B-2): the first executable rendering
/// runtime. It drives the frozen pipeline order end to end — compile → cull →
/// record passes → composite → present — through the frame lifecycle, against
/// the [HeadlessRenderBackend]. It is **read-only** (R1): it never mutates the
/// document and emits no command; the input document is returned untouched.
/// Output is deterministic (§F, L1): structural metrics are exact.
final class HeadlessRenderer {
  factory HeadlessRenderer({
    RenderGraphCompiler? compiler,
    CullService? cull,
    HeadlessRenderBackend? backend,
    RenderMetricsSink? metricsSink,
  }) {
    // Resolve each collaborator once so the renderer and its pipeline share
    // the same backend instance (structural metrics are read back from it).
    final resolvedCompiler = compiler ?? RenderGraphCompiler();
    final resolvedCull = cull ?? const CullServiceImpl();
    final resolvedBackend = backend ?? HeadlessRenderBackend();
    return HeadlessRenderer._(
      compiler: resolvedCompiler,
      cull: resolvedCull,
      backend: resolvedBackend,
      metricsSink: metricsSink,
      pipeline: RenderPipelineImpl(
        cull: resolvedCull,
        passes: RenderPassExecutor(RenderPassRegistryImpl.standard()),
        backend: resolvedBackend,
        metricsSink: metricsSink,
      ),
    );
  }

  HeadlessRenderer._({
    required this.compiler,
    required this.cull,
    required this.backend,
    required this.metricsSink,
    required this._pipeline,
  });
  final RenderGraphCompiler compiler;
  final CullService cull;
  final HeadlessRenderBackend backend;

  /// Optional observer that receives each frame's metrics (§G).
  final RenderMetricsSink? metricsSink;

  final RenderPipelineImpl _pipeline;
  final DirtyRegionProcessor _dirty = const DirtyRegionProcessor();

  /// Renders a full frame from [document] for [target] under [context].
  HeadlessFrameResult renderFrame(
    FebricDocument document,
    RenderTarget target,
    RenderContext context,
  ) {
    final graph = compiler.compile(document, target);
    final outcome = _pipeline.run(graph, context, dirtyTileCount: 0);
    return HeadlessFrameResult(
      graph: graph,
      visible: outcome.visible,
      metrics: outcome.metrics,
    );
  }

  /// Renders an incremental frame: recompiles only the damaged nodes (the
  /// result is byte-identical to a full compile — `incremental == full`),
  /// then runs the pipeline. Carries the dirty-region count in the metrics.
  HeadlessFrameResult renderIncremental(
    RenderGraph previous,
    FebricDocument document,
    Set<String> damagedNodeIds,
    RenderContext context,
  ) {
    final graph = compiler.recompile(previous, document, damagedNodeIds);
    final dirty = _dirty.compute(graph, damagedNodeIds);
    final outcome = _pipeline.run(
      graph,
      context,
      dirtyTileCount: dirty.tileCount,
    );
    return HeadlessFrameResult(
      graph: graph,
      visible: outcome.visible,
      metrics: outcome.metrics,
    );
  }
}

/// A headless [RenderSession] over a compiled graph (M5B-2). Implements the
/// frozen `HitTestContract` (via `RenderSession`): hit testing converts a
/// screen point through the viewport and resolves to the **topmost semantic
/// node** whose render bounds contain it — a real, GPU-free hit test.
final class HeadlessRenderSession implements RenderSession {
  HeadlessRenderSession({
    required this.target,
    required this.context,
    required this.graph,
  });

  @override
  final RenderTarget target;

  @override
  final RenderContext context;

  /// The compiled graph this session hit-tests against.
  final RenderGraph graph;

  @override
  HitTestResult hitTest(HitTestQuery query) {
    final point = context.viewport.screenToCanvas(query.screenPoint);
    RenderObject? topmost;
    for (final object in graph.objects) {
      if (object.bounds.containsPoint(point)) {
        if (topmost == null || RenderGraph.drawOrder(object, topmost) > 0) {
          topmost = object;
        }
      }
    }
    if (topmost == null) {
      return HitTestResult.miss(point);
    }
    return HitTestResult(
      kind: HitTargetKind.node,
      documentPoint: point,
      semanticNodeId: topmost.source.refId,
    );
  }

  @override
  List<String> hitTestRegion(Rect2D region) {
    final hits = [
      for (final o in graph.objects)
        if (o.bounds.intersects(region)) o,
    ]..sort(RenderGraph.drawOrder);
    return [for (final o in hits) o.source.refId];
  }
}
