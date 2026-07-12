# FEBRIC Performance Strategy (frozen, ADR-0011)

Performance is architecture. These strategies are binding on the renderer,
document engine and tools; their contracts live in `core_performance`.

## 1. Viewport virtualization & tile rendering
The canvas never materializes more than the visible region (+1 tile ring).
Artwork rasterizes into `TileSpec`-sized tiles (default 256², overlap for
filtering) addressed by `TileCoordinate(level, x, y)`; `level` is a mip
level chosen from `ViewportState.zoom` so a zoomed-out yardage view samples
low-resolution tiles, never full-res pixels. Damage from a command
invalidates only intersecting tiles (node-scoped damage, Architecture V2
§18).

## 2. Spatial index (QuadTree)
Hit testing, marquee selection and cull queries run against a
`SpatialIndexContract` (reference configuration: `QuadTreeConfig`, max
depth 8, 16 items/node) — never a linear scan of the document. The index
is rebuilt incrementally from command deltas.

## 3. Cache strategy (memory · GPU texture · disk)
`CacheTier` + `CacheBudget` make budgets explicit: decoded raster cache
(memory), uploaded texture cache (GPU), tile/preview cache (disk). LRU
within tier; budgets sized from device class at startup; eviction is
observable (telemetry) so regressions are measurable.

## 4. Background workers & lazy loading
All raster work (decode, composite, mask evaluation, tile render, export)
runs in worker isolates with the frozen `WorkerPriority` ladder:
interactive > preview > background > idle. Assets and layers load lazily —
opening a document materializes structure (tree/layers) immediately and
pixels on demand.

## 5. Object & texture pools
Hot-path buffers (tiles, scratch bitmaps, upload staging) are pooled via
`ObjectPoolContract` — steady-state editing allocates near-zero per frame.

## 6. Undo / history compression
`HistoryCompressionPolicy`: the command journal is the source of truth;
full snapshots every N commands (default 50) + delta encoding between
snapshots; bounded retained snapshots with journal replay for the tail.
Undo depth stays effectively unlimited without unbounded memory.

## 7. Large document strategy
`LargeDocumentPolicy` thresholds switch behaviours on: virtualization
above a node count, tiling above a pixel dimension, reduced-resolution
interactive previews with full-res confirmation on idle (production
export always renders full-res through the export pipeline).

## 8. GPU strategy
Impeller-first rendering; compositing expressed as layer/blend operations
that map to GPU primitives; `FebricBlendMode` chosen to match GPU-standard
blend equations; glass/blur effects budgeted (M1 already limits them to
overlays).

## 9. Binding acceptance gates
60fps canvas at 200 nodes (M1 gate, carried forward) · 300-DPI 64×64 cm
export < 60 s (M14 gate) · steady-state editing allocation-flat (measured
once the renderer lands).
