# M5A — Canvas Runtime Contract (Architecture Freeze) (2026-07-13)

The permanent **Canvas Runtime Constitution** as pure architecture — a new
foundation-tier package `core_canvas` (ADR-0018; diagrams in
docs/architecture/canvas-runtime.md). **No rendering, no Flutter, no GPU, no
painting, no editing logic, no business logic.** Built entirely by composing
the frozen M1.5/M1.6/M2–M4 contracts — **none of them modified.**

## Architecture First — conflict caught and resolved before code

The brief's literal freeze list (viewport, camera, coordinate system, transform
pipeline, grid, guides, snap, input pipeline, performance strategy) **already
existed and was frozen** in `core_interaction` (ADR-0003), `core_tooling`
(ADR-0012), `core_performance` (ADR-0011) and `core_geometry`. Per the
Architecture First Policy, implementation **stopped and the conflict was
reported** before any code was written. The product owner selected the
**narrowed scope**: compose the frozen contracts, add only what was absent,
duplicate nothing. This milestone implements that decision.

## Delivered (architecture only)

- **Canvas Constitution** — `CanvasNeverOwns` (9 frozen: document, assets,
  layers, history, selection, patterns, motifs, ai, plugins) + 8 frozen ordered
  principles in `CanvasConstitution`. Canvas owns only visual runtime state,
  renders references only, one input pipeline, one shared viewport, AI never
  edits directly, nothing bypasses the runtime.
- **Renders references only** — `CanvasReference{kind, refId}` +
  `CanvasReferenceKind` (design_node, asset, layer). Ids, never data.
- **Coordinate/transform pipeline** — `CoordinateSpace` (document→world→
  viewport→screen), `TransformStage` (local→parent→world→viewport→screen),
  `CoordinatePipeline` (frozen ordering; transforms stay in geometry/interaction).
- **Hit testing → semantic node** — `HitTestContract`, `HitTestQuery`,
  `HitTestResult` (Design Tree node id + optional `DesignNodeType`),
  `HitTargetKind` (node, guide, handle, empty). Region hit test for marquee.
- **Overlay runtime** — `OverlayRuntimeContract`, `OverlayModel`,
  `OverlayStack` (pure contribute/withdraw/ofKind), `OverlayKind` (12). Canvas
  owns overlays; tools contribute, never render.
- **Ruler & print regions** (previously absent) — `RulerSpec` (physical-unit),
  `PrintRegionSpec` (safe area / bleed / print margin as `CanvasInsets`),
  `PrintRegionKind` (3).
- **Canvas performance strategy** — `CanvasPerformanceStrategy` composing the
  frozen `TileSpec`/`QuadTreeConfig`/`LargeDocumentPolicy` + canvas switches
  (infinite canvas, dirty-region, culling, viewport cache, LOD). No perf
  primitive redefined.
- **Canvas Runtime contract** — `CanvasRuntimeContract` (the single input
  surface: User → Canvas → Viewport → Hit Test → Selection → Tool) +
  immutable `CanvasRuntimeState` composing the one shared viewport (single
  source of truth), coordinate system, grid, guides, ruler, snapping, overlays,
  references, print regions, performance.

## What was NOT touched (verified)

Document Engine, Semantic Design Tree, Asset Engine, Lock Engine, Selection
Engine, Layer Engine, Mask Engine, History Engine, Command Bus, Plugin SDK,
Prompt Compiler, Universal Tool Contract, Universal AI Pipeline — all frozen,
all unmodified. No new viewport, gesture, transform, grid, guide, snap, tile or
spatial-index type was created (duplication prohibited).

## Verification

- **22/22 `core_canvas` tests** — constitution + vocabulary freezes (7
  vocabularies), coordinate/transform pipeline ordering, model JSON round-trips
  (reference, hit-test, overlay stack, ruler, print regions + insets,
  performance strategy, runtime state), a `CanvasRuntimeContract`
  implementability probe (interface freeze — adding a member breaks
  compilation), and the three pre-freeze verifications below.
- `dart analyze --fatal-infos packages` — **No issues** (whole workspace).
- `dart format` — clean.
- `dart tooling/dependency_lint.dart` — **PASS** (core_canvas registered
  pure-Dart; no feature/flutter/duplication violations).
- Composition proven: `CanvasPerformanceStrategy.standard.tiles == TileSpec.standard`;
  `state.viewport` identical to `state.camera.viewport`.

## Pre-freeze verification (product-owner requested)

1. **Viewport serializable for session restore — CONFIRMED.**
   `ViewportState`/`NavigationState` are freezed + JSON; `CanvasRuntimeState`
   composes them and round-trips losslessly. Test builds a non-default camera
   (zoom 2.5, offset (120,−40), rotation 0.3, DPR 2, custom sizes + view
   history) and asserts every field survives serialise → restore.
2. **Overlay paint order deterministic + documented — ADDED.** `OverlayStack`
   now orders by ascending `order`, ties broken by ascending `id` (Dart
   `List.sort` is not stable, so the tiebreak is required). Order is a pure
   function of the overlay set, contribution-sequence-independent and
   restore-stable. Documented in the model, ADR-0018 and the architecture doc;
   a test proves two different contribution sequences yield identical order.
3. **Print-region physical-unit strategy — ADDED.** Insets are authored in a
   `MeasurementUnit` (pixel/mm/cm/inch; mm default) and convert via
   `PrintRegionSpec.insetsIn` / `CanvasInsets.convert`, delegating to the frozen
   `core_geometry.UnitConverter`; pixel conversions take DPI from
   `CanvasCoordinateSystem.dotsPerInch` (single DPI source of truth). A test
   converts mm → inch and mm → pixel at 300 and 72 DPI.

   None of the three changed any existing architecture, duplicated a
   responsibility, or expanded scope beyond M5A.

## Quality contract

Pure Dart · immutable (freezed) · JSON-serializable · SOLID · DDD ·
repository/DI-ready · no circular dependencies (lint-proven) · no TODO · no
placeholder · no mock · no UI · no Flutter · no rendering · no GPU · no
painting · no business logic.

## Status

**M5A READY FOR ARCHITECTURE REVIEW.** Pending: review → approval → freeze →
git commit → git push. **M5B (renderer) does not start until M5A is officially
approved.**
