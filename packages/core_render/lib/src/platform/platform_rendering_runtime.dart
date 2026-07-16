import 'package:core_canvas/core_canvas.dart';
import 'package:core_document/core_document.dart';
import 'package:core_interaction/core_interaction.dart';
import 'package:core_render/src/backend/backend_capabilities.dart';
import 'package:core_render/src/context/render_context.dart';
import 'package:core_render/src/platform/platform_capability_detector.dart';
import 'package:core_render/src/platform/reference_backend_adapter.dart';
import 'package:core_render/src/platform/render_command_executor.dart';
import 'package:core_render/src/platform/render_platform.dart';
import 'package:core_render/src/platform/render_surface_runtime.dart';
import 'package:core_render/src/platform/rendered_frame.dart';
import 'package:core_render/src/recording/command_recording_runtime.dart';
import 'package:core_render/src/runtime/frame_lifecycle_runtime.dart';
import 'package:core_render/src/target/render_target.dart';
import 'package:core_render/src/vocabulary/render_vocabulary.dart';

/// The immutable result of one platform render (M5B-4): the recorded stream
/// plus the deterministic executed-frame summary.
final class PlatformRenderResult {
  const PlatformRenderResult({required this.frame});

  /// The deterministic, platform-independent summary of the executed frame.
  final RenderedFrame frame;
}

/// **Frame Synchronization** (M5B-4): drives the frozen `FrameLifecycle`
/// (M5B-2 `FrameLifecycleImpl`) through its unskippable order for one frame,
/// wrapping execution + presentation. It defines no new states and no new
/// lifecycle — it composes the frozen one (R6, unskippable by construction).
final class FrameSynchronizer {
  FrameSynchronizer() : _lifecycle = FrameLifecycleImpl();

  final FrameLifecycleImpl _lifecycle;

  /// The current lifecycle state (frozen vocabulary).
  FrameLifecycleState get state => _lifecycle.state;

  /// Advances scheduled → begin → update → cull → record, ready to execute.
  void beginFrame() {
    _lifecycle.advanceTo(FrameLifecycleState.scheduled);
    _lifecycle.advanceTo(FrameLifecycleState.begin);
    _lifecycle.advanceTo(FrameLifecycleState.update);
    _lifecycle.advanceTo(FrameLifecycleState.cull);
    _lifecycle.advanceTo(FrameLifecycleState.record);
  }

  /// Advances submit → present, ready to composite + present.
  void toPresent() {
    _lifecycle.advanceTo(FrameLifecycleState.submit);
    _lifecycle.advanceTo(FrameLifecycleState.present);
  }

  /// Advances end → idle (next frame). The order is unskippable; any illegal
  /// transition throws in the frozen lifecycle.
  void endFrame() {
    _lifecycle.advanceTo(FrameLifecycleState.end);
    _lifecycle.advanceTo(FrameLifecycleState.idle);
  }
}

/// **Platform Rendering Runtime** (M5B-4): the top-level, platform-independent
/// runtime that completes the rendering engine. It integrates the frozen
/// M5B-3 recording runtime with M5B-4 execution + presentation:
///
///   document → [CommandRecordingRuntime] records a CommandBuffer (M5B-3)
///            → [RenderCommandExecutor] replays it onto a platform backend
///            → [RenderSurfaceRuntime] composites overlays + presents
///            → [RenderedFrame] deterministic summary (cross-platform equal)
///
/// Deterministic and read-only (R1): identical inputs yield an equal
/// [RenderedFrame] on every platform, modulo which platform produced it. It
/// drives the frozen `FrameLifecycle` order (M5B-2) — no new lifecycle, no new
/// vocabulary. Platform-specific behaviour lives only in the backend adapter.
final class PlatformRenderingRuntime {
  PlatformRenderingRuntime({
    CommandRecordingRuntime? recorder,
    RenderCommandExecutor executor = const RenderCommandExecutor(),
  }) : _recorder = recorder ?? CommandRecordingRuntime(),
       _executor = executor; // ignore: prefer_initializing_formals

  final CommandRecordingRuntime _recorder;
  final RenderCommandExecutor _executor;

  /// Records, executes and presents one frame for [document] to [target] under
  /// the shared [viewport], on [platform]. Returns the deterministic
  /// [RenderedFrame] summary.
  PlatformRenderResult render(
    FebricDocument document,
    RenderTarget target,
    ViewportState viewport,
    RenderPlatform platform, {
    OverlayStack overlays = OverlayStack.empty,
    int frameId = 0,
  }) {
    // 1. Record the backend-independent command stream (M5B-3).
    final recording = _recorder.record(
      document,
      target,
      viewport,
      frameId: frameId,
    );

    // 2. Build the platform backend + surface (the platform-specific boundary).
    final backend = ReferenceBackendAdapter(platform: platform);
    final surface = RenderSurfaceRuntime(
      platform: platform,
      backend: backend,
      onScreen: target.onScreen,
    );

    // 3. Build the frame context (composes frozen viewport/coord/colour).
    final context = RenderContext(
      viewport: viewport,
      coordinateSystem: target.coordinateSystem,
      colourSpace: target.colourSpace,
      frameId: frameId,
    );

    // 4. Execute + present within the unskippable frame lifecycle (M5B-2).
    //    The backend is the single source of truth for the executed frame:
    //    it counts commands as it executes them and records presentation via
    //    the surface's markPresented — no value is recomputed here.
    final sync = FrameSynchronizer()..beginFrame();
    _executor.execute(recording.commands, backend, context);
    sync.toPresent();
    surface.presentFrame(context, overlays);
    sync.endFrame();

    return PlatformRenderResult(frame: backend.build(frameId));
  }

  /// Renders the same [document] on every supported platform and returns the
  /// per-platform executed frames. The runtime guarantees their
  /// [RenderedFrame.consistencyFingerprint]s are equal — cross-platform
  /// rendering consistency (the same document → identical results).
  Map<RenderPlatform, RenderedFrame> renderOnAll(
    FebricDocument document,
    RenderTarget target,
    ViewportState viewport, {
    OverlayStack overlays = OverlayStack.empty,
    int frameId = 0,
  }) {
    final frames = <RenderPlatform, RenderedFrame>{};
    for (final platform in RenderPlatform.values) {
      frames[platform] = render(
        document,
        target,
        viewport,
        platform,
        overlays: overlays,
        frameId: frameId,
      ).frame;
    }
    return frames;
  }

  /// The declared capabilities for [platform] (data, no leakage — §B).
  BackendCapabilities capabilitiesFor(RenderPlatform platform) =>
      PlatformCapabilityDetector.detect(platform);
}
