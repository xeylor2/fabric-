import 'package:core_canvas/core_canvas.dart';
import 'package:core_document/core_document.dart';
import 'package:core_interaction/core_interaction.dart';
import 'package:core_render/src/context/render_context.dart';
import 'package:core_render/src/contracts/render_contracts.dart';
import 'package:core_render/src/graph/render_graph.dart';
import 'package:core_render/src/objects/render_object.dart';
import 'package:core_render/src/pass/render_pass.dart';
import 'package:core_render/src/recording/command_buffer.dart';
import 'package:core_render/src/recording/recording_render_backend.dart';
import 'package:core_render/src/runtime/cull_runtime.dart';
import 'package:core_render/src/runtime/render_graph_compiler.dart';
import 'package:core_render/src/runtime/render_pass_runtime.dart';
import 'package:core_render/src/target/render_target.dart';

/// **Render Context Runtime** (M5B-3): deterministically composes the frozen
/// [RenderContext] for a frame from a [RenderTarget] and the shared viewport.
/// The renderer never creates its own viewport (R4) — it is passed in.
final class RenderContextRuntime {
  const RenderContextRuntime();

  RenderContext contextFor(
    RenderTarget target,
    ViewportState viewport, {
    int frameId = 0,
    int lodLevel = 0,
  }) {
    return RenderContext(
      viewport: viewport,
      coordinateSystem: target.coordinateSystem,
      colourSpace: target.colourSpace,
      lodLevel: target.fullResolution ? 0 : lodLevel,
      frameId: frameId,
    );
  }
}

/// **Render Target Runtime** (M5B-3): resolves which passes a target records
/// (its configured [RenderTarget.passes], or the constitution's full order),
/// and builds the pass registry the executor runs — composing the frozen
/// [RenderPassRegistryImpl]. Owns no new pass vocabulary.
final class RenderTargetRuntime {
  const RenderTargetRuntime();

  /// The passes for [target] in frozen order (target selection or the
  /// canonical standard set when unspecified).
  List<RenderPass> passesFor(RenderTarget target) {
    if (target.passes.isEmpty) {
      return RenderPassRegistryImpl.standard().orderedPasses;
    }
    final standard = {
      for (final p in RenderPassRegistryImpl.standard().orderedPasses)
        p.kind: p,
    };
    final registry = RenderPassRegistryImpl();
    for (final kind in target.passes) {
      registry.register(standard[kind] ?? RenderPass(kind: kind));
    }
    return registry.orderedPasses;
  }
}

/// The immutable result of one command-recording run (M5B-3).
final class RecordingResult {
  const RecordingResult({
    required this.commands,
    required this.graph,
    required this.visible,
  });

  /// The recorded, immutable command stream.
  final CommandBuffer commands;

  /// The compiled render graph this run recorded from.
  final RenderGraph graph;

  /// The culled, visible render objects (draw order).
  final List<RenderObject> visible;
}

/// **Command Recording Runtime** (M5B-3): the top-level backend-independent
/// recorder. Composes M5B-2 (compiler + cull + pass executor) and drives a
/// [RecordingRenderBackend] through the frozen [RenderBackend] seam to produce
/// an immutable [CommandBuffer]. Nothing is rasterized or presented.
///
/// Deterministic by construction: compilation, culling and pass order are all
/// deterministic (§F), and the encoder emits commands in draw order with
/// content-addressed resource keys — identical inputs ⇒ identical commands.
final class CommandRecordingRuntime {
  CommandRecordingRuntime({RenderGraphCompiler? compiler, CullService? cull})
    : _compiler = compiler ?? RenderGraphCompiler(),
      _cull = cull ?? const CullServiceImpl();

  final RenderGraphCompiler _compiler;
  final CullService _cull;
  final RenderContextRuntime _context = const RenderContextRuntime();
  final RenderTargetRuntime _targets = const RenderTargetRuntime();

  /// Records the command stream for [document] rendered to [target] under the
  /// shared [viewport]. Optionally reuses a [backend] (its declared
  /// capabilities drive blend-mode fallbacks, §B).
  RecordingResult record(
    FebricDocument document,
    RenderTarget target,
    ViewportState viewport, {
    RecordingRenderBackend? backend,
    int frameId = 0,
  }) {
    final graph = _compiler.compile(document, target);
    final context = _context.contextFor(target, viewport, frameId: frameId);
    final visible = _cull.cull(graph, context.viewport.visibleRect);

    final b = backend ?? RecordingRenderBackend();
    final registry = RenderPassRegistryImpl();
    for (final p in _targets.passesFor(target)) {
      registry.register(p);
    }

    b.beginFrame(context);
    b.beginTarget(target.kind);
    RenderPassExecutor(registry).execute(visible, b, context);
    b.composite(context);
    b.endTarget();
    b.endFrame();

    return RecordingResult(commands: b.build(), graph: graph, visible: visible);
  }
}

/// A **Render Session** integration over a recorded command buffer (M5B-3).
/// Implements the frozen `HitTestContract` (via [RenderSession]) by delegating
/// to the headless session — no hit-test logic is re-implemented here.
final class RecordingRenderSession implements RenderSession {
  RecordingRenderSession({
    required this.target,
    required this.context,
    required this.commands,
    required HitTestContract hitTester,
  }) : _hitTester = hitTester; // ignore: prefer_initializing_formals

  @override
  final RenderTarget target;

  @override
  final RenderContext context;

  /// The immutable recorded command stream for this session's frame.
  final CommandBuffer commands;

  final HitTestContract _hitTester;

  @override
  HitTestResult hitTest(HitTestQuery query) => _hitTester.hitTest(query);

  @override
  List<String> hitTestRegion(Rect2D region) => _hitTester.hitTestRegion(region);
}
