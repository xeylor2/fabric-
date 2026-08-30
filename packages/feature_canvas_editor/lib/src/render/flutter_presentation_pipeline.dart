import 'package:core_canvas/core_canvas.dart';
import 'package:core_render/core_render.dart';
import 'package:feature_canvas_editor/src/render/flutter_render_backend.dart';

/// The **Presentation Pipeline** of the Flutter canvas surface: the frozen
/// `PresentationPipeline` contract (Rendering Constitution §3.10).
///
/// It composes the frame the backend already composited with the frozen
/// [OverlayStack] and presents the result to the target surface. Overlay paint
/// order is the stack's own deterministic order (ADR-0018) — this pipeline
/// re-sorts nothing and owns no overlay. It is read-only with respect to
/// overlays and to the document.
final class FlutterPresentationPipeline implements PresentationPipeline {
  const FlutterPresentationPipeline(this.backend);

  /// The driver whose composited frame is presented.
  final FlutterRenderBackend backend;

  @override
  void presentFrame(RenderContext context, OverlayStack overlays) {
    backend.present(context);
    backend.drawOverlays(overlays, context);
  }
}
