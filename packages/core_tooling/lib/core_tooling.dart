/// FEBRIC Universal Tool and Canvas contracts (ADR-0012).
///
/// The frozen surface every editing tool inherits: the fourteen-member
/// `UniversalToolContract`, the `UniversalCanvasContract`, and their
/// support models (context, requests, previews, results, history,
/// coordinate system, snapping, guides, grid, measurement).
///
/// No tool defines its own lifecycle, zoom, selection, lock or history
/// surface — these contracts compose the frozen foundation engines.
///
/// Pure Dart. Depends on core_textile, core_interaction, core_lock,
/// core_selection, core_geometry.
library;

export 'src/canvas/canvas_models.dart';
export 'src/canvas/universal_canvas_contract.dart';
export 'src/tool/tool_models.dart';
export 'src/tool/universal_tool_contract.dart';
