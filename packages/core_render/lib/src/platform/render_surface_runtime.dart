import 'package:core_canvas/core_canvas.dart';
import 'package:core_render/src/context/render_context.dart';
import 'package:core_render/src/contracts/render_contracts.dart';
import 'package:core_render/src/platform/reference_backend_adapter.dart';
import 'package:core_render/src/platform/render_platform.dart';

/// **Render Surface Runtime** + **Frame Presentation Runtime** (M5B-4).
///
/// A pure-Dart description of the presentable surface and the deterministic
/// present step. It implements the frozen `PresentationPipeline` (§3.10): it
/// composites the executed frame with the frozen `OverlayStack` (deterministic
/// paint order, ADR-0018) and "presents" — which, in the pure-Dart engine,
/// means marking the frame presented on the reference backend. Real surface
/// blit/swap is the Flutter driver's job in the later presentation milestone.
///
/// It owns no document data (R1) and defines no new vocabulary — a surface is a
/// size + platform + on-screen flag; overlay ordering is the frozen stack's.
final class RenderSurfaceRuntime implements PresentationPipeline {
  RenderSurfaceRuntime({
    required this.platform,
    required ReferenceBackendAdapter backend,
    this.onScreen = true,
  }) : _backend = backend; // ignore: prefer_initializing_formals

  /// The platform this surface belongs to (adapter boundary).
  final RenderPlatform platform;

  /// Whether this surface presents on-screen (false → offscreen: thumbnail,
  /// export encoder), mirroring `RenderTarget.onScreen`.
  final bool onScreen;

  final ReferenceBackendAdapter _backend;

  /// The count of overlays composited in the last present (deterministic —
  /// derived from the frozen stack's ordered entries, not registration order).
  int lastOverlayCount = 0;

  @override
  void presentFrame(RenderContext context, OverlayStack overlays) {
    // Overlays compose on top of content in the frozen deterministic order.
    lastOverlayCount = overlays.entries.length;
    // Presentation in the pure-Dart engine is the deterministic mark; the real
    // driver performs the platform blit/swap later. Offscreen surfaces
    // (thumbnail, export encoder) are never marked presented.
    if (onScreen) {
      _backend.markPresented();
    }
  }
}
