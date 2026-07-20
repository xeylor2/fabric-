/// FEBRIC Production engine (M13A): the ProductionJob model with the
/// frozen §12 stage pipeline (preflight → render → color → encode →
/// package) as a value-level state machine, and the deterministic
/// Preflight rule engine — pure evaluation of frozen document models
/// with every threshold injected (mill policy is never frozen here).
///
/// Pure Dart (isolates + backend reuse, Architecture V2 §12/§16). Later
/// slices add render, colour management, encoding and packaging behind
/// their own architecture reviews.
///
/// Blueprint: docs/architecture/architecture-v2.md (Architecture V2).
library;

export 'src/color/production_colour_bridge.dart';
export 'src/core_production_package.dart';
export 'src/encode/production_encode.dart';
export 'src/jobs/production_job.dart';
export 'src/package/production_sheet.dart';
export 'src/preflight/preflight.dart';
export 'src/render/production_render_bridge.dart';
