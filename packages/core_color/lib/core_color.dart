/// FEBRIC Color engine: palettes, colorways, ICC/CMYK transforms, gamut
/// and delta-E analysis.
///
/// M13C ships the colour-transform seam and gamut-report vocabulary —
/// reference-based, synchronous, deterministic (the approved
/// execution-shape determination). ICC science arrives behind the
/// contract with the colour-science/backend slices.
///
/// Blueprint: docs/architecture/architecture-v2.md (Architecture V2).
library;

export 'src/core_color_package.dart';
export 'src/transform/colour_transform.dart';
