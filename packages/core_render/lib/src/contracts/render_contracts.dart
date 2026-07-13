import 'package:core_canvas/core_canvas.dart';
import 'package:core_document/core_document.dart';
import 'package:core_geometry/core_geometry.dart';
import 'package:core_render/src/backend/backend_capabilities.dart';
import 'package:core_render/src/context/render_context.dart';
import 'package:core_render/src/frame/frame_budget.dart';
import 'package:core_render/src/graph/render_graph.dart';
import 'package:core_render/src/objects/render_object.dart';
import 'package:core_render/src/observability/render_metrics.dart';
import 'package:core_render/src/pass/render_pass.dart';
import 'package:core_render/src/queue/render_work_item.dart';
import 'package:core_render/src/resource/resource.dart';
import 'package:core_render/src/target/render_target.dart';
import 'package:core_render/src/vocabulary/render_vocabulary.dart';
import 'package:core_textile/core_textile.dart';

/// The abstract contracts of the Rendering Constitution (M5B-1).
///
/// These are pure interfaces — **no implementation lives in M5B-1**. M5B-2
/// implements the GPU-free services against them; the concrete backend lands
/// in `core_render_impeller` (M5B-3). Every contract is backend-neutral (R5)
/// and read-only w.r.t. the document (R1): none emits a `DocumentCommand`.

/// Compiles a document revision into an immutable [RenderGraph] for a target,
/// and incrementally recompiles from a damage set (§3.1). `incremental` MUST
/// equal `full` for the same revision (§F, damage-invariance).
abstract interface class GraphCompiler {
  RenderGraph compile(FebricDocument document, RenderTarget target);

  RenderGraph recompile(
    RenderGraph previous,
    FebricDocument document,
    Set<String> damagedNodeIds,
  );
}

/// Maps one semantic/compositing node kind to render objects (§3.1/§3.9).
/// The extension point: new node/layer kinds register a producer without
/// changing the graph or any contract.
abstract interface class RenderObjectProducer {
  /// The design-node type this producer handles.
  DesignNodeType get nodeType;

  /// Produces render objects for [node] (references only, R2).
  List<RenderObject> produce(DesignNode node);
}

/// Registry of producers, keyed by node type (§3.1). Pure lookup contract.
abstract interface class RenderObjectProducerRegistry {
  void register(RenderObjectProducer producer);
  RenderObjectProducer? producerFor(DesignNodeType type);
}

/// Culls the graph to the visible set using the frozen `visibleRect` and a
/// `SpatialIndexContract` (§3.3). Never a linear scan.
abstract interface class CullService {
  List<RenderObject> cull(RenderGraph graph, Rect2D visibleRect);
}

/// Priority-ordered, coalescing render-work buffer (§3.4). Items with equal
/// key coalesce; drained by the scheduler.
abstract interface class RenderQueue {
  void enqueue(RenderWorkItem item);
  List<RenderWorkItem> drain();
  bool get isEmpty;
}

/// Decides when/where work runs — isolate assignment + budget pacing (§3.5).
/// Consumes the frozen `WorkerPriority` ladder; ordering is by priority, and
/// results merge by tile/pass, never by completion order (§F).
abstract interface class RenderScheduler {
  void submit(RenderWorkItem item);
  FrameBudget get budget;
}

/// Ordered passes + insertion slots (§3.6). Passes plug in within the frozen
/// order (R6).
abstract interface class RenderPassRegistry {
  void register(RenderPass pass);
  List<RenderPass> get orderedPasses;
}

/// The abstract backend seam (§3.7/§B). The concrete driver
/// (`core_render_impeller`) implements this; the pipeline talks only to it.
/// Pure-typed — no `dart:ui`, no device objects exposed.
abstract interface class RenderBackend {
  /// Capabilities declared as data (§B) — read, never probed.
  BackendCapabilities get capabilities;

  /// Records draw work for [pass] under [context] (implementation: M5B-3).
  void record(
    RenderPass pass,
    RenderContext context,
    List<RenderObject> objects,
  );

  /// Composites recorded passes into the frame (implementation: M5B-3).
  void composite(RenderContext context);

  /// Presents the frame to the target surface (implementation: M5B-3).
  void present(RenderContext context);
}

/// Allocates/frees resources by logical key, ref-counts, and evicts under
/// budget (§C). The backend owns device objects; this registry owns the
/// logical keys + handle lifetimes only.
abstract interface class ResourceRegistry {
  ResourceHandle acquire(ResourceKey key);
  void release(ResourceKey key);
  int refCountOf(ResourceKey key);
}

/// Composes content tiles + the frozen `OverlayStack` (deterministic order,
/// ADR-0018) and presents to the target (§3.10). Read-only w.r.t. overlays.
abstract interface class PresentationPipeline {
  void presentFrame(RenderContext context, OverlayStack overlays);
}

/// The frame-lifecycle state machine (§3.11). `advanceTo` rejects any
/// non-successor transition (mirrors the AI pipeline's unskippable order,
/// ADR-0013). Pure contract.
abstract interface class FrameLifecycle {
  FrameLifecycleState get state;

  /// Advances to [next]; throws on an out-of-order transition.
  void advanceTo(FrameLifecycleState next);
}

/// Allocates, measures and adapts the four separated budgets; selects the
/// overrun policy when a phase exceeds its allowance (§D).
abstract interface class FrameBudgetController {
  FrameBudget get budget;

  /// The overrun policy for [phase] (from the active [budget]).
  OverrunPolicy overrunPolicyFor(BudgetPhase phase);
}

/// The single ordered render pipeline (§3.3 spine). Runs the frozen stage
/// order for a target + context; unskippable (R6).
abstract interface class RenderPipeline {
  void renderFrame(RenderGraph graph, RenderContext context);
}

/// The stateful renderer bound to one Canvas Runtime (§3.2). It implements
/// the frozen `HitTestContract` — hit testing resolves to semantic nodes; it
/// is not redefined here.
abstract interface class RenderSession implements HitTestContract {
  RenderTarget get target;
  RenderContext get context;
}

/// A side-effect-free observer of per-frame metrics (§G). The renderer
/// pushes snapshots; sinks (Dashboard, tests, telemetry) read. Reading never
/// alters a frame.
abstract interface class RenderMetricsSink {
  void onFrameMetrics(RenderMetrics metrics);
}
