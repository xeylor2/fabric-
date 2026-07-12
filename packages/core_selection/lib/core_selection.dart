/// FEBRIC Selection Engine (ADR-0008).
///
/// Frozen region-selection architecture: shape/technique kinds,
/// refinements, snapshots and history. Immutable models only —
/// rasterisation and hit-testing are rendering concerns of later
/// milestones.
///
/// Relationship to `core_interaction.SelectionState`: that type answers
/// *which objects* are selected (id-based, interaction level); this engine
/// describes *what region* is selected (geometry level). The document
/// engine (M2) coordinates both.
///
/// Pure Dart. Depends only on `core_geometry`.
library;

export 'src/selection_region.dart';
