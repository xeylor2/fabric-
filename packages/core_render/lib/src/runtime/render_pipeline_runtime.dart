import 'package:core_render/src/context/render_context.dart';
import 'package:core_render/src/contracts/render_contracts.dart';
import 'package:core_render/src/graph/render_graph.dart';
import 'package:core_render/src/objects/render_object.dart';
import 'package:core_render/src/observability/render_metrics.dart';
import 'package:core_render/src/runtime/frame_lifecycle_runtime.dart';
import 'package:core_render/src/runtime/headless_backend.dart';
import 'package:core_render/src/runtime/render_pass_runtime.dart';
import 'package:core_render/src/vocabulary/render_vocabulary.dart';

/// The immutable output of one pipeline run (M5B-2): the visible objects and
/// the frame metrics. Deterministic — a pure function of the graph + context.
final class PipelineOutcome {
  const PipelineOutcome({required this.visible, required this.metrics});

  final List<RenderObject> visible;
  final RenderMetrics metrics;
}

/// The headless Render Pipeline (M5B-2), implementing the frozen
/// `RenderPipeline` contract. It runs the constitution's frozen stage order
/// through the frame lifecycle — **update → cull → record → composite →
/// present** — against a [HeadlessRenderBackend]. Unskippable by construction
/// (the lifecycle rejects out-of-order transitions, R6). Read-only (R1):
/// consumes the graph, mutates no document, emits no command.
final class RenderPipelineImpl implements RenderPipeline {
  const RenderPipelineImpl({
    required this.cull,
    required this.passes,
    required this.backend,
    this.metricsSink,
  });

  final CullService cull;
  final RenderPassExecutor passes;
  final HeadlessRenderBackend backend;
  final RenderMetricsSink? metricsSink;

  /// The frozen contract entry point: runs a full frame and discards the
  /// structured outcome (callers wanting metrics/visibles use [run]).
  @override
  void renderFrame(RenderGraph graph, RenderContext context) {
    run(graph, context, dirtyTileCount: 0);
  }

  /// Runs the frozen stage order and returns the structured outcome.
  /// [dirtyTileCount] is carried into the metrics for incremental frames.
  PipelineOutcome run(
    RenderGraph graph,
    RenderContext context, {
    required int dirtyTileCount,
  }) {
    final lifecycle = FrameLifecycleImpl();
    backend.beginFrame();

    lifecycle.advanceTo(FrameLifecycleState.scheduled);
    lifecycle.advanceTo(FrameLifecycleState.begin);
    lifecycle.advanceTo(FrameLifecycleState.update);

    lifecycle.advanceTo(FrameLifecycleState.cull);
    final visible = cull.cull(graph, context.viewport.visibleRect);

    lifecycle.advanceTo(FrameLifecycleState.record);
    passes.execute(visible, backend, context);

    lifecycle.advanceTo(FrameLifecycleState.submit);
    lifecycle.advanceTo(FrameLifecycleState.present);
    backend.present(context);

    lifecycle.advanceTo(FrameLifecycleState.end);

    final tiles = <String>{for (final o in visible) ...o.tileKeys};
    final metrics = RenderMetrics(frameId: context.frameId)
        .withMetric(RenderMetricKind.totalObjects, graph.objects.length)
        .withMetric(RenderMetricKind.visibleObjects, visible.length)
        .withMetric(
          RenderMetricKind.culledObjects,
          graph.objects.length - visible.length,
        )
        .withMetric(RenderMetricKind.drawCalls, backend.drawCalls)
        .withMetric(RenderMetricKind.tilesMaterialized, tiles.length)
        .withMetric(RenderMetricKind.dirtyRegionCount, dirtyTileCount);

    metricsSink?.onFrameMetrics(metrics);
    lifecycle.advanceTo(FrameLifecycleState.idle);

    return PipelineOutcome(visible: visible, metrics: metrics);
  }
}
