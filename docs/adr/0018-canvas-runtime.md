# ADR-0018 — Canvas Runtime Constitution (`core_canvas`) (M5A)

- **Status:** Accepted (M5A, 2026-07-13)
- **Context:** M5A establishes the permanent Canvas Runtime Constitution. The
  brief's literal freeze list (viewport, camera, coordinate system, transform
  pipeline, grid, guides, snap, input pipeline, performance strategy) **already
  exists and is frozen** in shipped packages. Per the Architecture First
  Policy, implementation stopped and the conflict was reported before any code
  was written; the product owner selected the **narrowed scope** (compose, do
  not duplicate). This ADR records that resolution.

## The conflict, and its resolution

Re-declaring the following in `core_canvas` would have duplicated
responsibilities (prohibited by M5A) and conflicted with frozen ADRs
(prohibited by the Architecture First Policy). They are **reused, never
redefined**:

| Responsibility | Already frozen in | ADR |
|---|---|---|
| Viewport / camera / zoom / pan / rotation / visible region / fit / reset | `core_interaction` (`ViewportState`, `ViewportOps`, `ZoomCommand`, `NavigationState`, `ViewportInteractionMapper`) | 0003 |
| Universal input (mouse/touch/trackpad/stylus/keyboard/wheel/pinch/two-finger/double-tap/long-press) | `core_interaction` (`InteractionEvent`, `GestureKind`, `InputDevice`) | 0003 |
| Coordinate system, snapping, grid, guides, measurement | `core_tooling` (`CanvasCoordinateSystem`, `SnappingConfig`, `GridSpec`, `GuideModel`, `Measurement`) | 0012 |
| Transform primitive | `core_geometry` (`Transform2D`) | 0004 |
| Tiles / spatial index / cache / LOD / pools / large-doc policy | `core_performance` | 0011 |
| The one shared editing surface every tool consumes | `core_tooling` (`UniversalCanvasContract`) | 0012 |

**No frozen contract is modified by M5A.** `core_interaction`,
`core_tooling`, `core_performance`, `core_geometry`, `core_textile`,
`core_document`, `core_asset`, `core_lock`, `core_selection`, `core_layer`,
`core_mask`, `core_plugin`, `core_ai` are all untouched.

## Decisions

1. **New foundation-tier package `core_canvas`** (pure Dart — no Flutter, no
   rendering, no GPU, no painting, no business logic). It is a *composition/
   integration* package: it imports the frozen foundations and adds only the
   Canvas Runtime contracts that did not exist. Registered in the workspace and
   the pure-Dart lint set.

2. **The Canvas Constitution (frozen).** The canvas owns only visual runtime
   state. It **never owns** — encoded as the frozen `CanvasNeverOwns` enum —
   Document, Assets, Layers, History, Selection, Patterns, Motifs, AI, Plugins.
   Eight ordered constitutional principles are frozen in `CanvasConstitution`:
   the canvas is not the source of truth; Document owns data; Semantic Tree
   owns semantics; Asset Engine owns resources; the canvas visualises
   references only; tools interact through the Canvas Runtime; AI never edits
   the canvas directly; nothing bypasses the Canvas Runtime.

3. **Renders references only.** `CanvasReference{kind, refId}` with frozen
   `CanvasReferenceKind` (design_node, asset, layer). The canvas holds ids,
   never the referenced data — resolving a reference is the owning engine's job.

4. **The coordinate/transform pipeline (frozen *ordering*).** `CoordinateSpace`
   (document → world → viewport → screen) and `TransformStage`
   (local → parent → world → viewport → screen), with `CoordinatePipeline`
   fixing the order. The transforms themselves remain in `core_geometry` /
   `core_interaction`; this freezes only the named pipeline no object may bypass.

5. **Hit testing operates on semantic nodes.** `HitTestContract` resolves a
   screen-space `HitTestQuery` to a `HitTestResult` carrying a Design Tree node
   id (+ optional `DesignNodeType`) and the document-space point;
   `hitTestRegion` returns node ids for marquee. Implementations (M5B) use the
   frozen `SpatialIndexContract` for culling — the contract is frozen now.

6. **The overlay runtime (frozen).** `OverlayRuntimeContract` +
   `OverlayModel`/`OverlayStack`; frozen `OverlayKind` (selection, hover,
   brush_cursor, polygon_preview, magic_wand_preview, ai_preview, measurement,
   grid, snap_guide, alignment_guide, ruler, tool_overlay). The canvas owns
   overlays; **tools contribute descriptions and never render them**. **Paint
   order is deterministic (frozen rule):** ascending `OverlayModel.order`, ties
   broken by ascending `OverlayModel.id` — a pure function of the overlay set,
   independent of contribution sequence, so serialise → restore reproduces an
   identical stack.

7. **Ruler & print regions (new — previously absent).** `RulerSpec`
   (physical-unit); `PrintRegionSpec` (safe area / bleed / print margin as
   `CanvasInsets`) with frozen `PrintRegionKind`. Grid/guides already existed in
   `core_tooling`; rulers and print regions did not. **Physical-unit strategy
   (frozen):** insets are authored in a `MeasurementUnit` (pixel / mm / cm /
   inch; mm default) and convert to any unit via `PrintRegionSpec.insetsIn` /
   `CanvasInsets.convert`, which **delegate to the frozen
   `core_geometry.UnitConverter`** (no conversion logic redefined). DPI is
   required for pixel conversions and is sourced from
   `CanvasCoordinateSystem.dotsPerInch` — the single source of truth for DPI;
   the print spec never stores its own.

8. **Canvas performance strategy (composition).** `CanvasPerformanceStrategy`
   *holds* the frozen `TileSpec`, `QuadTreeConfig`, `LargeDocumentPolicy` and
   adds only canvas-runtime switches that did not exist (infinite canvas,
   dirty-region tracking, object culling, viewport caching, LOD). It never
   redefines a `core_performance` primitive.

9. **The Canvas Runtime contract (frozen).** `CanvasRuntimeContract` is the
   single surface all on-canvas input flows through — `User → Canvas Runtime →
   Viewport → Hit Testing → Selection → Tool`. It exposes the one shared
   viewport (`state.camera.viewport` — single source of truth), the coordinate
   system, selection routing, references, overlays and hit testing. State is an
   immutable `CanvasRuntimeState` composing the frozen viewport/camera/coord/
   grid/guide/snap plus the new ruler/overlay/reference/print/performance.

## Placement & dependency edges

`core_canvas` is pure Dart, foundation/integration tier:

```
core_canvas → core_geometry     (Point2D, Rect2D, MeasurementUnit)
core_canvas → core_interaction  (ViewportState, NavigationState, InteractionEvent,
                                 ZoomCommand, SelectionState)
core_canvas → core_tooling      (CanvasCoordinateSystem, GridSpec, GuideModel,
                                 SnappingConfig)
core_canvas → core_performance  (TileSpec, QuadTreeConfig, LargeDocumentPolicy)
core_canvas → core_textile      (DesignNodeType — hit-test target typing)
```

Acyclic (nothing frozen depends back on `core_canvas`); lint-enforced. No
dependency on `core_document`/`core_asset` — the canvas holds references (ids),
consistent with "renders references only."

## Consequences

- The renderer (M5B) implements `CanvasRuntimeContract`, `HitTestContract` and
  `OverlayRuntimeContract` against these frozen surfaces — Flutter widgets, GPU
  and painting all live there, never here.
- Every tool (the frozen six and all future/AI/plugin tools) consumes the one
  Canvas Runtime; none implements its own input, viewport or overlays.
- Wire-name freeze regime (ADR-0002) extends to every new vocabulary here;
  `canvas_freeze_test.dart` is the tripwire.

## Evidence

- `packages/core_canvas/lib/src/` — `constitution/`, `reference/`,
  `coordinate/`, `hittest/`, `overlay/`, `ruler/`, `print/`, `performance/`,
  `runtime/`.
- `packages/core_canvas/test/` — 19 tests: constitution + vocabulary freezes,
  pipeline ordering, model JSON round-trips, and a `CanvasRuntimeContract`
  implementability probe (interface freeze).
- `docs/architecture/canvas-runtime.md` — diagrams + dependency graph.
