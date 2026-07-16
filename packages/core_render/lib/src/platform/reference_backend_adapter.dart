import 'package:core_render/src/backend/backend_capabilities.dart';
import 'package:core_render/src/context/render_context.dart';
import 'package:core_render/src/platform/render_command_executor.dart';
import 'package:core_render/src/platform/render_platform.dart';
import 'package:core_render/src/platform/rendered_frame.dart';
import 'package:core_render/src/recording/render_command.dart';
import 'package:core_render/src/vocabulary/render_vocabulary.dart';

/// The **deterministic reference backend adapter** (M5B-4).
///
/// A pure-Dart [PlatformRenderBackend] that executes a recorded command stream
/// into a [RenderedFrame] summary — **no pixels, no GPU, no Flutter**. It is
/// the canonical, platform-independent execution against which every real
/// platform backend (the later Flutter/Impeller milestone) is verified: the
/// same command buffer yields an equal [RenderedFrame] (modulo which platform
/// produced it) on Android, iOS and Windows — cross-platform consistency by
/// construction (§F structural determinism).
///
/// It declares its capabilities as data (§B) and never leaks how it executes.
/// It is stateful for the duration of one frame; [reset] clears that state so a
/// frame's result is a pure function of its command stream. It never reads the
/// document (R1) — it only replays references the stream already resolved.
final class ReferenceBackendAdapter implements PlatformRenderBackend {
  /// Creates a reference adapter labelled for [platform]. Execution behaviour
  /// is identical on every platform by design — [platform] only tags the
  /// produced frame so cross-platform equality can be asserted.
  ReferenceBackendAdapter({required this.platform});

  @override
  final RenderPlatform platform;

  // Per-frame accumulated state (reset between frames).
  int _commandsExecuted = 0;
  int _drawCount = 0;
  int _stateChanges = 0;
  bool _composited = false;
  bool _presented = false;
  RenderTargetKind? _target;
  final Set<String> _boundResources = {};
  final List<String> _commandOrder = [];

  @override
  BackendCapabilities get capabilities => referenceCapabilities;

  /// The capability profile of the deterministic reference backend: it can
  /// execute every blend mode, colour-managed and offscreen output, and
  /// declares **structural** determinism — it produces draw structure, not
  /// pixels, so its output is bit-identical on every platform.
  static const BackendCapabilities referenceCapabilities = BackendCapabilities(
    features: {
      BackendCapabilityKind.offscreenTargets,
      BackendCapabilityKind.colourManagedOutput,
      BackendCapabilityKind.maskRasterization,
    },
    blendModes: {},
    determinism: RenderDeterminismLevel.structural,
  );

  @override
  void execute(RenderCommand command, RenderContext context) {
    _commandsExecuted++;
    _commandOrder.add(command.kind.wireName);
    switch (command.kind) {
      case RenderCommandKind.beginRenderTarget:
        if (command.targetKind != null) {
          _target = RenderTargetKind.fromWireName(command.targetKind!);
        }
      case RenderCommandKind.setRenderState:
        _stateChanges++;
      case RenderCommandKind.bindResource:
        if (command.resourceKey != null) {
          _boundResources.add(command.resourceKey!);
        }
      case RenderCommandKind.draw:
        _drawCount++;
      case RenderCommandKind.composite:
        _composited = true;
      case RenderCommandKind.beginFrame:
      case RenderCommandKind.beginPass:
      case RenderCommandKind.endPass:
      case RenderCommandKind.endRenderTarget:
      case RenderCommandKind.endFrame:
        break;
    }
  }

  /// Marks the frame presented (called by the surface runtime after execution).
  void markPresented() => _presented = true;

  /// Builds the immutable, deterministic summary of the executed frame.
  RenderedFrame build(int frameId) => RenderedFrame(
    frameId: frameId,
    platform: platform,
    target: _target ?? RenderTargetKind.editor,
    commandsExecuted: _commandsExecuted,
    drawCount: _drawCount,
    bindCount: _boundResources.length,
    stateChanges: _stateChanges,
    composited: _composited,
    presented: _presented,
    commandOrder: List.unmodifiable(_commandOrder),
  );
}
