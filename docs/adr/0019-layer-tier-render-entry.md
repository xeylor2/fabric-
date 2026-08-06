# ADR-0019 — Layer-Tier Render Entry (`core_render`) (M17)

- **Status:** Accepted (M17, 2026-07-31)
- **Context:** M16 (Textile Render Binding) proved the node tier of the
  Design Tree renders through the frozen M5B `RenderGraphCompiler` and the
  open `RenderObjectProducerRegistry` seam. The approved M16-D3 per-key
  consumption discipline routed node-tier `object_type`, `transform`, and
  `repeat` into the compiled graph. The same determinations recorded two
  layer-tier questions that M16 could not lawfully answer: **D3-d#1** — the
  layer tier (`LayerModel.metadata['colour']`, `LayerModel.metadata['repeat']`)
  had *no graph-entry channel* through the producer seam, because producers
  receive only `DesignNode`s, the walk emits nothing for layers, and
  `RenderPass` carries no data fields; and **Q3-d** — the node-repeat ×
  layer-repeat co-existence question, which the approved M16-D4 reassigned to
  *“the first frozen consumer in which both repeat tiers are simultaneously
  consumable.”* M17 is that first lawful consumer and this milestone’s
  assigned venue.

## Decision

**Extension by composition over frozen surfaces — never by modifying the
frozen compiler, models, constitution, or vocabularies.**

1. **Additive successor compiler.** `core_render` gains
   `CompositeGraphCompiler`, an implementation of the **frozen, implementable
   `GraphCompiler` contract** (`render_contracts.dart:27`). It contains a
   frozen `RenderGraphCompiler`, delegates the *entire* node tier verbatim to
   it (`compile` and `recompile` both, preserving every M5B/M16 guarantee by
   delegation), and appends layer-sourced `RenderObject`s derived from
   `Artboard.layerRoot`. Layer objects are representable **within the frozen
   model today** via `CanvasReferenceKind.layer` — the frozen M5A/M5B
   vocabulary already names compositing layers by id, so this entry introduces
   no new reference or kind vocabulary.

2. **Single behaviour-preserving frozen-file touch.** `headless_renderer.dart`
   is widened from the concrete `RenderGraphCompiler` to the frozen
   `GraphCompiler` contract at exactly two annotations — the factory parameter
   `RenderGraphCompiler? compiler` and the stored field
   `final RenderGraphCompiler compiler` — **so the same file accepts the
   successor without behavioural change**. The default constructor still
   resolves to `RenderGraphCompiler()`; the file uses only the frozen contract
   members (`compile`, `recompile`); every existing caller and test compiles
   and behaves identically. This is the *only* frozen file M17 touches.

## Eliminated alternatives (recorded for the record)

- **Modify the frozen walk to emit layers.** Changes L1 output for every
  existing consumer without opt-in and falsifies committed baselines — the
  maximal freeze-break where a zero-modification mechanism exists. Barred.
- **A from-scratch second compiler.** Duplicates node-tier compilation and is
  a true competing pipeline, contradicting M16-D1’s one-owner discipline.
  Barred.
- **A data channel through `RenderPass`.** The frozen pass model carries no
  data fields; extending a frozen model is a larger break than composition.
  Barred.
- **A persisted layer-participation representation.** Barred by the approved
  M16-D2 computed-participation discipline (M17-D2 extends it, never revisits).

## Consequences

- **D3-d#1 closes.** The layer tier has a lawful graph entry: layered
  `colour` and `repeat` route through the compiled graph under the approved
  D3 per-key discipline.
- **Q3-d closes.** The node-tier and layer-tier repeats now share one draw
  sequence with no override and no merge — the approved M17-D4 adjudication —
  discharging the co-travelled precedence obligation at its assigned venue.
- **M16 guarantees hold.** The node tier is untouched by delegation; the
  layer tier is total, pure, and order-independent; nothing mutates the
  document (R1) and no object owns layer data (R2). Widening verification is
  machine-checked by the unmodified M5B suite (the E7 gate).
- **Rasterization constraint carried downstream.** M17 sets routing and
  composition only. Reference-resolution of the layer’s colour/repeat payload
  (the backend milestone) inherits the approved D4 §3(c) constraint: resolve
  each reference independently at its own datum and composite per the graph’s
  frozen attributes, with no cross-tier merge.
- **M25 objective preserved.** The extension adds no new tastes or surfaces
  beyond the two authorized artifacts and remains within the frozen M17 path
  of the Fabric V1 spine; no additional core milestone is required.

## Evidence

- `packages/core_render/lib/src/runtime/composite_graph_compiler.dart` — the
  successor.
- `packages/core_render/lib/src/runtime/headless_renderer.dart` — the one
  authorized widening (constructor parameter + stored field, contract-typed).
- `packages/core_render/lib/core_render.dart` — one additive barrel export.
- `packages/core_render/test/composite_graph_compiler_test.dart` — the
  obligation suite (E1–E8), all green; plus the unchanged M16 and M5B
  suites.
- `packages/core_canvas/lib/src/reference/canvas_reference.dart:20-21` — the
  frozen `CanvasReferenceKind.layer` anticipation.
