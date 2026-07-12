/// FEBRIC Performance contracts (ADR-0011).
///
/// Frozen strategy vocabulary: tiling, spatial indexing, cache tiers and
/// budgets, object pools, worker priorities, history compression and
/// large-document policies. Implementations live with the renderer and
/// document engine; the contracts — and the strategy document at
/// docs/architecture/performance-strategy.md — are frozen here.
///
/// Pure Dart. Depends only on `core_geometry`.
library;

export 'src/performance_contracts.dart';
