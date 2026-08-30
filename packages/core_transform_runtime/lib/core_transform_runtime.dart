/// FEBRIC Transform Runtime (Scope A).
///
/// The stateful wiring that holds the active `Transform2D` for the runtime
/// chain. It accepts already-created `Transform2D` values (frozen
/// `core_geometry` similarity transform, ADR-0012), exposes the active
/// transform to downstream runtimes (toward
/// `UniversalCanvasContract.activeTransform`), and resets to the frozen
/// identity.
///
/// Under the B-2 authorization for canvas motif movement it additionally hosts
/// the EPHEMERAL in-flight transform of one move, composing an anchor with an
/// already-converted document-space gesture delta (translation only, via the
/// frozen `Transform2D.copyWith` and `Point2D +`). It still maps no gesture,
/// defines no transform algebra, and holds no document sink — the in-flight
/// transform is never document state.
library;

export 'src/transform_runtime.dart';
