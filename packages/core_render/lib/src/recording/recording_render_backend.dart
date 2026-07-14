import 'package:core_canvas/core_canvas.dart';
import 'package:core_layer/core_layer.dart';
import 'package:core_render/src/backend/backend_capabilities.dart';
import 'package:core_render/src/context/render_context.dart';
import 'package:core_render/src/contracts/render_contracts.dart';
import 'package:core_render/src/objects/render_object.dart';
import 'package:core_render/src/pass/render_pass.dart';
import 'package:core_render/src/recording/backend_capability_runtime.dart';
import 'package:core_render/src/recording/command_buffer.dart';
import 'package:core_render/src/recording/render_command_encoder.dart';
import 'package:core_render/src/resource/resource.dart';
import 'package:core_render/src/runtime/resource_registry_runtime.dart';
import 'package:core_render/src/vocabulary/render_vocabulary.dart';

/// The backend-independent **command-recording** backend (M5B-3).
///
/// It implements the frozen `RenderBackend` seam (M5B-1) but produces **no
/// pixels** — every call appends to an immutable command stream through a
/// [RenderCommandEncoder]. This is what makes the whole pipeline runnable and
/// deterministic without any GPU/Impeller driver: identical inputs yield an
/// identical [CommandBuffer].
///
/// It composes, and never re-implements: the encoder (state tracking +
/// draw/bind/state recording), the [BackendCapabilityRuntime] (blend fallback
/// as data, §B) and the frozen [ResourceRegistry] (content-addressed binding).
///
/// The frame/target lifecycle markers (beginFrame/beginTarget/…) are driven by
/// the top-level recording runtime; the `RenderPassExecutor` (M5B-2) drives
/// [record] + [composite] through the frozen interface, blind to the concrete
/// type (R5 backend-neutrality).
final class RecordingRenderBackend implements RenderBackend {
  RecordingRenderBackend({
    BackendCapabilities? capabilities,
    ResourceRegistry? resources,
  }) : _caps = BackendCapabilityRuntime(
         capabilities ?? RecordingRenderBackend.defaultCapabilities,
       ),
       _resources = resources ?? ResourceRegistryImpl();

  /// The capability profile a recording backend declares by default: it can
  /// record every blend mode, colour space and offscreen target, but claims no
  /// GPU-specific features (it draws nothing).
  static const BackendCapabilities defaultCapabilities = BackendCapabilities(
    features: {
      BackendCapabilityKind.offscreenTargets,
      BackendCapabilityKind.colourManagedOutput,
      BackendCapabilityKind.maskRasterization,
    },
    blendModes: <FebricBlendMode>{},
    determinism: RenderDeterminismLevel.structural,
  );

  final BackendCapabilityRuntime _caps;
  final ResourceRegistry _resources;
  final RenderCommandEncoder _encoder = RenderCommandEncoder();

  @override
  BackendCapabilities get capabilities => _caps.capabilities;

  // ---- lifecycle markers (driven by CommandRecordingRuntime) -------------

  void beginFrame(RenderContext context) => _encoder.beginFrame(context);
  void beginTarget(RenderTargetKind kind) => _encoder.beginTarget(kind);
  void endTarget() => _encoder.endTarget();
  void endFrame() => _encoder.endFrame();

  /// The immutable recorded command stream.
  CommandBuffer build() => _encoder.build();

  // ---- frozen RenderBackend seam (driven by RenderPassExecutor) ----------

  @override
  void record(
    RenderPass pass,
    RenderContext context,
    List<RenderObject> objects,
  ) {
    _encoder.beginPass(pass.kind);
    for (final object in objects) {
      // Blend resolved through declared capabilities (data, no leakage §B).
      final blend = _caps.resolveBlend(object.blend);
      _encoder.setRenderState(blend: blend, opacity: object.opacity);
      _bindResources(object);
      _encoder.draw(object);
    }
    _encoder.endPass(pass.kind);
  }

  @override
  void composite(RenderContext context) => _encoder.composite(context);

  /// Presentation is explicitly out of M5B-3 scope: this records nothing and
  /// produces no surface. The Impeller driver (M5B-3 is *not* it) presents
  /// later; here it is a documented no-op.
  @override
  void present(RenderContext context) {
    // No-op by contract: command recording never presents.
  }

  void _bindResources(RenderObject object) {
    final source = object.source;
    if (source.kind == CanvasReferenceKind.asset) {
      final key = ResourceKey(kind: ResourceKind.texture, key: source.refId);
      _resources.acquire(key);
      _encoder.bindResource(key);
    }
    if (object.maskId != null) {
      // Masks rasterize to textures in the backend (ADR-0007 deferral); here
      // we only record the bind, keyed by mask id.
      final key = ResourceKey(
        kind: ResourceKind.texture,
        key: 'mask:${object.maskId}',
      );
      _resources.acquire(key);
      _encoder.bindResource(key);
    }
  }
}
