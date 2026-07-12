# ADR-0011 — Performance Strategy (`core_performance`)

- **Status:** Accepted (M1.6 freeze, 2026-07-07)
- **Decision:** Performance is architecture, not a later optimization
  pass. Frozen contracts:
  - `TileSpec` + `TileCoordinate` — tile rendering & viewport
    virtualization (only visible tiles materialize; mip levels by zoom).
  - `SpatialIndexContract` + `QuadTreeConfig` — hit testing and culling
    never scan the whole document.
  - `CacheBudget` + `CacheTier` (memory / texture / disk) — explicit
    byte budgets, LRU within tier.
  - `ObjectPoolContract` — hot-path allocations (tiles, buffers) pooled.
  - `WorkerPriority` — background isolates for raster work with a frozen
    priority ladder (interactive > preview > background > idle).
  - `HistoryCompressionPolicy` — snapshot interval + delta encoding for
    undo/history growth.
  - `LargeDocumentPolicy` — thresholds that switch on virtualization,
    lazy loading and reduced-resolution previews.
- The complete narrative strategy lives in
  `docs/architecture/performance-strategy.md`; the renderer (M-render)
  and document engine (M2) implement against these contracts, and M1's
  perf gates (60fps @ 200 nodes) remain binding acceptance criteria.
- **Placement:** dedicated package on `core_geometry` so the Flutter
  renderer, pure-Dart isolates and any future backend renderer share one
  vocabulary.
