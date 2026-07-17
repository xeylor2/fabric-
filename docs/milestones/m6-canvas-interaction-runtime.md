# M6 — Canvas Interaction Runtime (Implementation Specification)

> **Status:** SPECIFICATION — awaiting Architecture Review. No code is frozen or
> committed on the strength of this document. This is the implementation intent
> for M6, derived solely from the current repository: the frozen ADRs
> (0003, 0011, 0012, 0018), the engine-first roadmap (0017) and the completed
> milestones M1.5, M1.6, M2–M4, M5A and M5B (M5B-1…4).

## 1. Objective

Deliver the **platform-independent Canvas Interaction Runtime**: the first
concrete, stateful implementation of the frozen `CanvasRuntimeContract`
(M5A, ADR-0018). It is the shared interaction layer between raw user input and
the future editing tools — the single surface all on-canvas input flows through
and the single owner of live visual runtime state.

Per ADR-0017, M6 is the **Interaction** node of the engine chain
(`… → Canvas (M5) → Interaction (M6) → AI (M7) → Production (M8)`). ADR-0017 is
explicit that this milestone **wires** the already-frozen interaction
foundations into a running runtime; it is an *integration* milestone, not new
foundation work:

> "`core_interaction` and `core_tooling` are **frozen foundations** (M1.5,
> M1.6) and are not rebuilt. The M6 'Interaction' milestone is the *integration*
> milestone that binds them … The name denotes the milestone's product surface,
> not new foundation work." — ADR-0017

## 2. Architecture First — scope reconciliation

ADR-0017 sketches the *eventual* Interaction milestone as also landing
"selection ≡ tree selection" and "tool execution … as `UniversalToolContract`
implementations that emit commands." The **approved M6 scope narrows this** to
the interaction *runtime* only, deferring selection logic, tools (brush,
polygon), AI tools and all editing to later slices. This mirrors the precedent
set at M5A, where the product owner selected the narrowed "compose, do not
duplicate" scope and the milestone was split into deliverable slices (M5A
constitution, then M5B-1…4 renderer) without a further ADR — a latitude
ADR-0017 grants:

> "Sub-lettered milestones (M5A, M5B, …) may split an engine milestone into
> deliverable slices without a further ADR, provided they do not reorder the
> engine chain above."

M6 as specified here is the interaction-runtime slice of the Interaction
engine. Selection wiring and tool execution remain scheduled on this engine but
are **out of scope for this milestone** (§7).

The freeze list this milestone appears to touch — viewport, camera, zoom, pan,
coordinate conversion, input pipeline, hit testing — **already exists and is
frozen**. Following the Architecture First Policy (as applied at M5A), M6
**composes** those frozen contracts and adds only the stateful runtime and the
one vocabulary that is genuinely absent (the cursor). Nothing frozen is
redefined.

| Responsibility M6 needs | Already frozen in | ADR | M6 obligation |
|---|---|---|---|
| Viewport / camera / zoom / pan / rotation / fit / reset | `core_interaction` — `ViewportState`, `ViewportOps`, `ZoomCommand`, `NavigationState` | 0003 | **drive**, never reimplement |
| Gesture → viewport policy (wheel/pinch/double-tap/shortcut) | `core_interaction` — `ViewportInteractionMapper`, `InteractionConfig` | 0003 | **drive**, never reimplement |
| Universal input vocabulary | `core_interaction` — `InteractionEvent`, `GestureKind`, `GesturePhase`, `InputDevice`, `KeyModifiers` | 0003 | **consume** the sealed events |
| Coordinate spaces / transforms | `core_canvas` `CoordinateSpace`/`CoordinatePipeline`; transforms in `core_interaction`/`core_geometry` | 0018 / 0004 | **name the stages**, reuse the maths |
| Hit testing to semantic nodes | `core_canvas` — `HitTestContract`, `HitTestQuery`, `HitTestResult`, `HitTargetKind` | 0018 | **delegate** to an injected implementer (the M5B renderer) |
| Overlay runtime | `core_canvas` — `OverlayRuntimeContract`, `OverlayStack` | 0018 | **route** through the frozen stack |
| The runtime contract itself + its state | `core_canvas` — `CanvasRuntimeContract`, `CanvasRuntimeState` | 0018 | **implement** the contract |
| Selection state container | `core_interaction` — `SelectionState` | 0003 | **expose** (empty); no selection logic in M6 |

## 3. Placement decision — new package `core_canvas_runtime`

`core_canvas` (M5A) is a **frozen constitution**: "no rendering, no Flutter, no
GPU, no painting, no editing logic, no business logic" (M5A doc; ADR-0018
Decision 1). Stateful controllers that hold and mutate live viewport/cursor
state are therefore constitutionally barred from living inside it.

M6 is specified as a **new pure-Dart, foundation-tier package
`core_canvas_runtime`**. The `_runtime` suffix is a role descriptor consistent
with the package-naming convention already in the tree (`core_render` runtime
packages), not an ambiguous inflection of an existing name.

- **Dependencies (all pre-existing edges; no new architectural coupling):**
  `core_canvas`, `core_interaction`, `core_tooling`, `core_geometry`, plus the
  standard `freezed`/`json` toolchain — the same set `core_canvas` itself
  already draws on.
- **No dependency cycle:** `core_canvas` does not depend on
  `core_canvas_runtime`; the edge is one-way (runtime → constitution).
- **Registration:** added to the workspace members in the root `pubspec.yaml`
  and to `pureDartCorePackages` in `tooling/dependency_lint.dart`, so the
  dependency lint enforces its purity and acyclicity.

## 4. Components to deliver

All components are **stateful shells or thin services over frozen pure
functions**. None introduces new viewport maths, new gesture semantics, new
zoom behaviour, new hit-test logic or new coordinate transforms.

### 4.1 Viewport / Zoom / Pan / Camera Controller

A single cohesive `ViewportController`. The four brief-named concerns
(viewport, zoom, pan, camera) all operate on the **one shared viewport**
(ADR-0018 principle: one shared viewport; no tool creates its own). Splitting
them into independent objects would fabricate parallel state the constitution
forbids, so they are one controller with distinct methods.

- Holds the live `NavigationState` (viewport + bounded view history).
- Zoom via `ViewportOps.zoomedBy` / `ViewportState.applyZoomCommand`; pan via
  `ViewportOps.panned`; fit via `ViewportOps.fittedToScreen`; previous-view via
  `NavigationState.back`.
- Applies frozen `ZoomCommand`s with the frozen `InteractionConfig.constraints`.
- Discrete view changes (zoom command, fit) push the previous view onto the
  bounded history so "previous view" navigation works; continuous motion
  (drag-pan, pinch) mutates in place and does **not** flood history.
- Routes camera gestures through the frozen `ViewportInteractionMapper`.

### 4.2 Coordinate Conversion

A `CoordinateConversion` service naming the frozen pipeline stages
`document → world → viewport → screen` (`CoordinateSpace`, ADR-0018) as concrete
entry points, so tools depend on a stable API rather than on `ViewportState`
directly.

- `screenToDocument` / `documentToScreen` delegate **verbatim** to the frozen
  `ViewportState.screenToCanvas` / `canvasToScreen` — no maths is
  reimplemented.
- In the current single-artboard runtime, document and world coincide (no
  multi-artboard placement transform yet), so the world hop is the identity and
  is documented as such; the API is present so the pipeline is complete and
  future multi-artboard composition slots in without a signature change.

### 4.3 Pointer Routing + Input Dispatcher + Hit Test Entry

An `InputDispatcher` that is the single intake point for on-canvas input
(Universal Input Contract, ADR-0018), plus an `InputRoute` classification
(`camera` vs `content`).

- **Routing mirrors the frozen policy exactly:** tap / drag / long-press are
  content gestures (never move the viewport); pan / pinch / wheel / double-tap /
  shortcut are camera gestures. This is a direct reading of
  `ViewportInteractionMapper`, not a new policy.
- **Camera route:** applies the event to the `ViewportController`.
- **Content route (Hit Test Entry):** converts the pointer position and
  resolves it through the injected `HitTestContract`, returning the
  `HitTestResult` for later layers (selection/tools) to consume. M6 itself does
  nothing with the hit beyond surfacing it.

### 4.4 Cursor Runtime

The one genuinely new vocabulary — no cursor type exists anywhere in the tree
(verified). A `CursorRuntime` pure resolver plus a `CursorState` model and a
frozen, append-only `CursorKind` enum (`arrow`, `pointer`, `grab`, `grabbing`,
`zoom`, `busy`).

- Platform-neutral **intent** only — the shell maps it to a real OS cursor
  later. It is not an overlay (overlays are canvas-owned, `OverlayKind`); it is
  the pointer shape itself.
- Pure and deterministic: the same interaction situation (over-node? panning?)
  yields the same cursor.

### 4.5 Interaction Session

`InteractionSession implements CanvasRuntimeContract` — the concrete runtime.

- Composes the controller, dispatcher, cursor runtime and an **injected**
  `HitTestContract` (the M5B renderer implements it; the session never
  reimplements hit testing).
- Implements every `CanvasRuntimeContract` member: `state`, `viewport`,
  `coordinateSystem`, `handleInput`, `applyZoomCommand`, `selection`,
  `references`, `hitTest`, `hitTestRegion`, and the `OverlayRuntimeContract`
  members (`overlays`, `contribute`, `withdraw`).
- **State mutates only by feeding events/commands in** — `handleInput`,
  `applyZoomCommand`, overlay contribute/withdraw — never by writing state
  directly (invariant I1 at the interaction layer, ADR-0018).
- `selection` returns the frozen `SelectionState` **empty**: M6 exposes the
  container but owns no selection logic (§7).
- Content hits are surfaced (e.g. via a `lastHit`) for the future
  selection/tool layers; nothing consumes them in M6.

## 5. Public surface (barrel)

`core_canvas_runtime.dart` exports exactly: `ViewportController`,
`CoordinateConversion`, `CursorRuntime`/`CursorState`/`CursorKind`,
`InputDispatcher`/`InputRoute`, `InteractionSession`. No internal helper leaks.

## 6. Invariants and constitutional compliance

- **I1 (state via commands only):** the session never exposes a state setter;
  all change flows through `handleInput` / `applyZoomCommand` / overlay methods.
- **One shared viewport (ADR-0018):** exactly one `NavigationState` lives in the
  controller; `session.viewport` is identical to `session.state.viewport`.
- **Renders references only (ADR-0018):** the runtime holds `CanvasReference`
  ids and semantic-node ids, never document/asset data.
- **Nothing bypasses the runtime (ADR-0018):** the `InputDispatcher` is the sole
  input intake; hit testing is only reachable through the injected contract.
- **Mandatory viewport inheritance (ADR-0003):** no zoom/pan/gesture maths is
  written in M6; all of it is the frozen `ViewportOps`/mapper.
- **No frozen contract, model, vocabulary or interface is redefined or renamed.**

## 7. Out of scope (explicit)

Deferred to later slices of the Interaction/AI engines, per the approved M6
scope:

- Selection **logic** (region/marquee resolution, selection mutation) —
  `core_selection` owns selection truth (ADR-0008); the canvas only routes it.
- Brush tools, polygon tools, AI tools, any `UniversalToolContract`
  implementation.
- Any editing / command-emitting logic (the document command bus is not touched).
- Flutter widgets, rendering, GPU, painting — M6 is pure Dart, headless.

## 8. Verification plan

To satisfy the milestone's acceptance gates before review:

- **`dart analyze --fatal-infos`** clean for the package and the whole
  workspace.
- **`dart tooling/dependency_lint.dart`** PASS — `core_canvas_runtime`
  registered pure-Dart; no Flutter, no feature-tier or duplication violation, no
  cycle.
- **`dart format`** clean.
- **Unit tests** (mirroring the M5A freeze-test discipline):
  - **Frozen-vocabulary freezes:** `CursorKind` and `InputRoute` wire-name
    orderings pinned; `fromWireName` rejects unknown input.
  - **Coordinate-conversion verification:** screen↔document round-trips at
    identity, and equals `ViewportState.screenToCanvas` **exactly** under
    zoom/pan (proves no maths was reimplemented).
  - **Interaction-routing verification:** tap/drag/long-press classified
    `content` and reach the hit-tester; pan/pinch/wheel/double-tap/shortcut
    classified `camera`, move the viewport and do **not** hit-test.
  - **Controller behaviour:** `zoomBy`/`panBy` drive the frozen ops; a
    view-changing `ZoomCommand` pushes history and `back()` restores; a no-op
    command (absent bounds) pushes nothing.
  - **Contract compliance:** `InteractionSession` is a `CanvasRuntimeContract`,
    shares one viewport, routes overlays through the frozen stack, delegates hit
    testing to the injected contract, and reports empty selection.
- **Architecture-compliance verification:** grep-proof that
  `core_canvas_runtime/lib` contains no `package:flutter` / `dart:ui` import and
  no selection/tool/editing logic.

## 9. Quality contract

Pure Dart · immutable models (freezed) · JSON-serializable where modelled ·
SOLID · DI-ready (hit-tester injected) · no circular dependencies (lint-proven)
· no TODO · no placeholder · no mock in `lib` · no UI · no Flutter · no
rendering · no GPU · no painting · no editing/business logic.

## 10. Status

**M6 SPECIFICATION — READY FOR ARCHITECTURE REVIEW.** Pending: review →
approval → (implementation, if not already staged) → freeze → git commit → git
push. No later milestone (M7 — AI) begins until M6 is officially approved.
