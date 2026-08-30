/// FEBRIC Canvas feature module.
///
/// Blueprint: docs/architecture/architecture-v2.md (Architecture V2).
///
/// This module hosts the **Flutter render driver**: the implementation of the
/// frozen `RenderBackend` seam (Rendering Constitution §3.7), the frozen
/// `PresentationPipeline` (§3.10) and the frozen `RenderSession` /
/// `HitTestContract` (§3.2, ADR-0018) — driven by the frozen pipeline stages
/// (`CullService`, `RenderPassExecutor`, `FrameLifecycle`) over graphs the
/// frozen `GraphCompiler` produced. It is a driver, not a second renderer, and
/// it is read-only with respect to the document.
library;

export 'src/feature_canvas_editor_package.dart';
export 'src/presentation/canvas_editor_page.dart';
export 'src/render/canvas_artwork.dart';
export 'src/render/canvas_placement.dart';
export 'src/render/canvas_surface_painter.dart';
export 'src/render/flutter_presentation_pipeline.dart';
export 'src/render/flutter_render_backend.dart';
export 'src/render/flutter_render_session.dart';
export 'src/render/render_palette.dart';
