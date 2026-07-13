import 'package:core_render/src/backend/backend_capabilities.dart';
import 'package:core_render/src/context/render_context.dart';
import 'package:core_render/src/contracts/render_contracts.dart';
import 'package:core_render/src/objects/render_object.dart';
import 'package:core_render/src/pass/render_pass.dart';
import 'package:core_render/src/vocabulary/render_vocabulary.dart';

/// The headless, record-only `RenderBackend` (M5B-2). It executes the frozen
/// backend contract **structurally**: it counts draw calls per pass and marks
/// composite/present — with **no rasterization, no pixels, no GPU, no
/// presentation surface**. This is the reference backend that makes the
/// pipeline runnable and deterministic without a driver (the Impeller driver
/// is M5B-3). Its declared determinism is structural + backend-exact (§F).
final class HeadlessRenderBackend implements RenderBackend {
  HeadlessRenderBackend({this.backendId = 'headless'});

  /// A stable identity for reproducibility records.
  final String backendId;

  int _drawCalls = 0;
  final List<RenderPassKind> _recordedPasses = [];
  bool _composited = false;
  bool _presented = false;

  /// Total draw calls recorded this frame (deterministic structural metric).
  int get drawCalls => _drawCalls;

  /// The passes recorded this frame, in execution order.
  List<RenderPassKind> get recordedPasses => List.unmodifiable(_recordedPasses);

  bool get composited => _composited;
  bool get presented => _presented;

  @override
  BackendCapabilities get capabilities => const BackendCapabilities(
    features: {
      BackendCapabilityKind.offscreenTargets,
      BackendCapabilityKind.tileCaching,
    },
    determinism: RenderDeterminismLevel.backendExact,
  );

  @override
  void record(
    RenderPass pass,
    RenderContext context,
    List<RenderObject> objects,
  ) {
    _drawCalls += objects.length;
    _recordedPasses.add(pass.kind);
  }

  @override
  void composite(RenderContext context) => _composited = true;

  @override
  void present(RenderContext context) => _presented = true;

  /// Resets per-frame counters before a new frame.
  void beginFrame() {
    _drawCalls = 0;
    _recordedPasses.clear();
    _composited = false;
    _presented = false;
  }
}
