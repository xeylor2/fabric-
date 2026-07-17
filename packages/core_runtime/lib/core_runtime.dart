/// FEBRIC Runtime Composition Layer (M10).
///
/// `CompositeCanvasRuntime` owns the four runtimes — interaction
/// (`core_canvas_runtime`, M6), selection (`core_selection_runtime`, M7),
/// transform (`core_transform_runtime`, M8) and layer (`core_layer_runtime`,
/// M9) — and connects them into the frozen canvas flow by **implementing the
/// frozen `CanvasRuntimeContract`** (`core_canvas`, ADR-0018).
///
/// It fills the M6 selection routing stub (feeding hit results into the
/// selection runtime and surfacing the live selection through the contract)
/// and exposes caller-initiated transform/layer pass-throughs. It introduces
/// no new model, vocabulary or business logic — pure composition of frozen
/// contracts. Layer mutation reaches the document engine only through the M9
/// runtime's injected sink; the composition never touches it directly.
library;

export 'src/composite_canvas_runtime.dart';
