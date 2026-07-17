/// FEBRIC Canvas Interaction Runtime (M6).
///
/// The platform-independent, stateful interaction layer between user input and
/// future editing tools. It is the first concrete implementation of the frozen
/// `CanvasRuntimeContract` (M5A, ADR-0018): the single surface all on-canvas
/// input flows through, and the single owner of visual runtime state.
///
/// It **composes** the frozen foundations and never redefines them: the shared
/// viewport / camera / zoom / pan / gesture policy come from `core_interaction`
/// (`ViewportOps`, `ViewportInteractionMapper`, `ZoomCommand`, ADR-0003); hit
/// testing is delegated to an injected `HitTestContract` (the renderer
/// implements it, M5B); overlays, coordinate system, grid, guides and snapping
/// come from `core_canvas` / `core_tooling`. It adds only what did not exist:
/// the stateful controllers, the input dispatcher/router, coordinate-conversion
/// entry points, the cursor runtime and the interaction session.
///
/// No selection/brush/polygon/AI/editing logic and no Flutter widgets live here
/// (out of M6 scope). Architecture + runtime only — no rendering, no GPU.
library;

export 'src/controllers/viewport_controller.dart';
export 'src/coordinate/coordinate_conversion.dart';
export 'src/cursor/cursor_runtime.dart';
export 'src/input/input_dispatcher.dart';
export 'src/session/interaction_session.dart';
