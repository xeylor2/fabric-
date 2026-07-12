/// FEBRIC Canvas Runtime (M5A, ADR-0018).
///
/// The frozen visual-runtime constitution of the FEBRIC OS. The canvas is not
/// a source of truth: the Document owns data, the Semantic Tree owns meaning,
/// the Asset Engine owns resources; the canvas visualises *references* to
/// them and is the single surface all on-canvas input flows through.
///
/// This package **composes** the frozen foundations (viewport/camera/gestures
/// from `core_interaction`; coordinate system/snap/grid/guides from
/// `core_tooling`; tiles/spatial-index/cache/LOD from `core_performance`;
/// transforms from `core_geometry`) and adds only what did not exist: the
/// Canvas Constitution, the coordinate/transform pipeline naming, hit testing
/// to semantic nodes, the overlay runtime, rulers, print regions, the canvas
/// performance strategy and the Canvas Runtime contract. It never redefines a
/// frozen contract.
///
/// Architecture only — no rendering, no Flutter, no GPU, no painting, no
/// business logic.
library;

export 'src/constitution/canvas_constitution.dart';
export 'src/coordinate/coordinate_pipeline.dart';
export 'src/hittest/hit_test.dart';
export 'src/overlay/overlay.dart';
export 'src/performance/canvas_performance_strategy.dart';
export 'src/print/print_regions.dart';
export 'src/reference/canvas_reference.dart';
export 'src/ruler/ruler_spec.dart';
export 'src/runtime/canvas_runtime_contract.dart';
export 'src/runtime/canvas_runtime_state.dart';
