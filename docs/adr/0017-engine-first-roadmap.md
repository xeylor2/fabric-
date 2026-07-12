# ADR-0017 — Engine-first Roadmap

- **Status:** Accepted (product owner mandate M4.1, 2026-07-13)
- **Supersedes:** the *phase/milestone schedule* of Architecture V2 §20
  (the P0–P4 phases and the feature-numbered M1–M14 table). It supersedes
  **only the ordering and numbering of milestones** — it does **not** touch
  the constitutional invariants (I1–I6), the module set, the dependency
  graph, any frozen contract, or any prior ADR (0000–0016), all of which
  remain fully in force.

## Context

Architecture V2 §20 assigned milestone numbers to *feature deliverables*
(M2 = Garment Structure, M3 = Garment Library, M4 = Element Engine, …).
Execution has instead proceeded **bottom-up along the engine dependency
chain**, because every feature the blueprint names is defined by its
relationship to lower engines (Architecture V2 §1.1): a garment library
instantiates into the tree, the inspector populates the tree, conversation
resolves to tree nodes, production preflights the tree. Building the spine
first means each feature milestone lands on finished, frozen substrate
instead of scaffolding that must later be retrofitted — the classic source
of architectural drift ADR-0004 was written to prevent.

The milestones actually shipped bear this out:

| Shipped | Engine | ADR |
|---|---|---|
| M2 | Document Engine (`core_document`) | 0014 |
| M3 | Design Tree Engine | 0015 |
| M4 | Asset Engine (`core_asset`) | 0016 |

None of these matches the §20 numbering. This ADR ratifies the path already
taken and fixes the forward order, closing the governance gap flagged in the
M4 architecture reconstruction (the blueprint must never silently diverge
from the code — ADR-0000).

## Decision — the engine dependency chain is the roadmap spine

Milestones follow the order in which one engine can only be built once the
engine beneath it is frozen:

```
Document → Tree → Asset → Canvas → Interaction → AI → Production
 (M2)     (M3)   (M4)    (M5)      (M6)          (M7)  (M8)
 done     done   done    next      —             —     —
```

Rationale for each edge:

1. **Document → Tree.** The tree is a semantic projection that only has
   meaning as commands on the one document bus (ADR-0014 → ADR-0015). The
   bus, locks, history and provenance must exist first.
2. **Tree → Asset.** Assets are referenced *by* tree nodes
   (`DesignNode.metadata` `asset_id`/`asset_refs`, ADR-0016). Identity and
   the usage graph (Asset → Node → Artboard → Document) require the tree to
   exist to point into.
3. **Asset → Canvas.** The canvas renders a node by resolving its
   `asset_id` → catalogue → content store; it never holds bitmap data
   (ADR-0016 consequences). Rendering therefore cannot precede the asset
   store it reads from.
4. **Canvas → Interaction.** A live editing surface (selection, gesture
   routing, tool execution) is only meaningful once there is a rendered
   canvas to interact with. The interaction *foundation* is already frozen
   (`core_interaction` M1.5/ADR-0003, `core_tooling` M1.6/ADR-0012); this
   milestone *wires* those frozen contracts into the running canvas and
   lands the Element Engine operations as `UniversalToolContract`
   implementations that emit commands.
5. **Interaction → AI.** Every AI operation terminates in the command bus
   through proposal staging (ADR-0013 stages `documentUpdate`/`undoStack`).
   AI needs a working editing + staging surface to *stage into* and a canvas
   to preview on before provider adapters and the API Manager are built.
6. **AI → Production.** Production preflights and exports the finished tree
   (Architecture V2 §12); it consumes the outputs of every engine above it
   and is therefore last.

### Naming note — "Interaction" milestone vs. the frozen foundation

`core_interaction` and `core_tooling` are **frozen foundations** (M1.5,
M1.6) and are not rebuilt. The M6 "Interaction" milestone is the
*integration* milestone that binds them — live viewport, selection ≡ tree
selection, gesture routing, and tool execution — to the M5 canvas. The name
denotes the milestone's product surface, not new foundation work.

### Feature deliverables layer onto the spine

The blueprint's feature systems (Garment Library, Repeat, Color, Textile
Inspector, Conversation, Asset Intelligence, Colorways, Dashboard, Mobile
companion, Theme polish) are **not** dropped. They are re-scheduled to land
on top of the relevant engine once it is frozen — e.g. Garment
Structure/Library on the Tree engine, Repeat/Color on the Canvas engine,
Inspector/Conversation on the AI engine, Production/CMYK on the Production
engine. Their acceptance criteria from §20 are carried forward unchanged;
only their sequencing is governed by this ADR. Sub-lettered milestones
(M5A, M5B, …) may split an engine milestone into deliverable slices without
a further ADR, provided they do not reorder the engine chain above.

## Consequences

- Architecture V2 §20 is amended to the engine-first table (this ADR is the
  authority for that amendment; the invariants and graph sections of the
  blueprint are untouched).
- The immediate next milestone is **M5A — Canvas Engine** (`core_rendering`:
  `DesignTree → RenderGraph` compiler, tile compositing against the frozen
  `core_performance` contracts, canvas surface). Confirmed as "next" by the
  M4 milestone report.
- No frozen contract, invariant, or dependency edge changes. All freeze
  tests remain green; CI rules are unchanged.
- The binding performance gates (60fps @ 200 nodes; 300-DPI 64×64 cm export
  < 60 s) and the Risk Register (§21) carry forward verbatim.

## Evidence

- Shipped engines: `packages/core_document`, `packages/core_asset`; ADRs
  0014–0016; milestone reports `docs/milestones/m2..m4`.
- Frozen interaction substrate this roadmap relies on:
  `packages/core_interaction`, `packages/core_tooling` (ADR-0003, 0012).
- Architecture snapshot at the freeze point:
  `docs/architecture/snapshot-v2-foundation.md`.
