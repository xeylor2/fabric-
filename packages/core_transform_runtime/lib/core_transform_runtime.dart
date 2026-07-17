/// FEBRIC Transform Runtime (Scope A).
///
/// The stateful wiring that holds the active `Transform2D` for the runtime
/// chain. It accepts already-created `Transform2D` values (frozen
/// `core_geometry` similarity transform, ADR-0012), exposes the active
/// transform to downstream runtimes (toward
/// `UniversalCanvasContract.activeTransform`), and resets to the frozen
/// identity.
///
/// Introduces zero new transform mathematics or behavior — no
/// gesture-to-transform mapping and no transform composition. Pure holder of
/// the frozen `Transform2D`.
library;

export 'src/transform_runtime.dart';
