/// FEBRIC geometry foundation.
///
/// Pure, serializable 2D primitives shared by every engine (interaction,
/// masks, selections, performance tiles, canvas transforms). Extracted from
/// `core_interaction` in the M1.6 Foundation Freeze (ADR-0004 series);
/// `core_interaction` re-exports these types, so existing imports keep
/// working.
///
/// Pure Dart — `dart:ui` is deliberately not used (isolate/backend-safe).
library;

export 'src/measurement_unit.dart';
export 'src/point2d.dart';
export 'src/rect2d.dart';
export 'src/size2d.dart';
export 'src/transform2d.dart';
