# core_canvas

**FEBRIC Canvas Runtime** — the frozen visual-runtime constitution of the
FEBRIC OS (M5A, ADR-0018). Pure Dart. **No rendering, no Flutter, no GPU, no
painting, no business logic.**

The Canvas is **not** the source of truth:

- the **Document** owns data (`core_document`),
- the **Semantic Tree** owns meaning (`core_document`/`core_textile`),
- the **Asset Engine** owns resources (`core_asset`).

The Canvas visualises *references* to them and is the single surface all
on-canvas input flows through.

## Composition, not duplication

This package **reuses** the frozen foundations and never redefines them:

| Reused (frozen) | For |
|---|---|
| `core_interaction` | viewport, camera, gestures, zoom commands, selection state |
| `core_tooling` | coordinate system, snapping, grid, guides |
| `core_performance` | tiles, spatial index, cache, LOD, large-doc policy |
| `core_geometry` | points, rects, transforms, measurement units |
| `core_textile` | `DesignNodeType` (hit-test target typing) |

It **adds** only what did not exist: the Canvas Constitution, reference model,
coordinate/transform pipeline naming, hit testing to semantic nodes, the
overlay runtime, rulers, print regions, the canvas performance strategy, and
the Canvas Runtime contract.

## Public surface (barrel)

- `CanvasConstitution` / `CanvasNeverOwns` — the frozen rules.
- `CanvasReference` / `CanvasReferenceKind` — renders references only.
- `CoordinatePipeline` / `CoordinateSpace` / `TransformStage`.
- `HitTestContract` / `HitTestQuery` / `HitTestResult` / `HitTargetKind`.
- `OverlayRuntimeContract` / `OverlayModel` / `OverlayStack` / `OverlayKind`.
- `RulerSpec`; `PrintRegionSpec` / `CanvasInsets` / `PrintRegionKind`.
- `CanvasPerformanceStrategy` (composes `core_performance`).
- `CanvasRuntimeContract` / `CanvasRuntimeState`.

## Constitution (frozen)

Canvas owns only visual runtime state · renders references only · one input
pipeline · one shared viewport · AI never edits the canvas directly · nothing
bypasses the Canvas Runtime.

```
User → Canvas Runtime → Viewport → Hit Testing → Selection → Tool
```

## Rules

Wire names are frozen and append-only (pinned by `canvas_freeze_test.dart`).
`core_canvas` is pure Dart, foundation/integration tier — acyclic, no
dependency on `core_document`/`core_asset` (references/ids only). Enforced by
`tooling/dependency_lint.dart`.

The renderer (M5B) implements the contracts here; Flutter, GPU and painting
live there — never in this package.
