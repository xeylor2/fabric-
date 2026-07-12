# FEBRIC — Architecture Version 2

**The Permanent Blueprint of the FEBRIC Operating System**
Status: **Approved** — supersedes V1 as the master blueprint; V1 is fully contained within it.
Changes to this document require an ADR (see `docs/adr/`).

---

## 0. Inheritance from Version 1

Carried forward unchanged in principle, extended only where noted:

| V1 System | V2 Status |
|---|---|
| Clean Architecture (presentation / domain / data, inward-only) | Unchanged — applies to every module |
| Command-sourced Document Engine | Unchanged mechanism — vocabulary extended to tree, garment, production ops |
| AI Proposal Staging (AI never auto-applies) | Unchanged — also terminates the Conversation and Inspector pipelines |
| Feature-first modules, no feature→feature imports | Unchanged — enforced by `tooling/dependency_lint.dart` |
| Riverpod three-tier state strategy | Unchanged — new providers added (§19) |
| Tile-based GPU rendering engine | Unchanged core — driven by a render graph compiled from the Design Tree |
| AI workflow: thin client, orchestrating backend, provider abstraction | Extended with API Manager, BYOK-ready profiles, Conversation pipeline |
| Repeat engine, color system, physical-unit-first, versioned .febric format | Repeat becomes node-scoped; format becomes .febric v2 (§17) |
| Provenance ledger, zero-drift test, benchmark corpus, golden-file tests | Constitutional (§1.2) |

## 1. Architectural Thesis

### 1.1 The Design Tree is the spine

The document **is** a semantic **Design Tree** of typed, garment-aware nodes. Every
system is defined by its relationship to that tree:

- Garment Library instantiates templates into it; Garment Structure defines its schemas.
- Textile Inspector populates it from uploaded artwork (staged).
- Conversation AI resolves natural language to nodes on it.
- Element Engine mutates it via commands; Asset Intelligence recommends against it.
- Rendering compiles it; Production preflights and exports it; Dashboard indexes activity on it.

There is exactly **one mutation path** — the command bus — whether the user drags a
motif, clicks *AI Replace*, or types "replace only the sleeve border."

### 1.2 Constitutional Invariants (testable, permanent)

- **I1 — One command bus.** Every mutation (human, UI, AI) is a serializable `DocumentCommand`.
- **I2 — Staging before apply.** AI output becomes an `AiProposal`; only explicit user acceptance emits commands.
- **I3 — Scope masks are authority.** An AI job can never affect pixels/nodes outside its declared scope (automated zero-drift test).
- **I4 — Locks are absolute.** Locked nodes (incl. "lock all except…") cannot be modified by any actor; validated before compute is spent.
- **I5 — Provenance always.** Every node records origin (drawn / imported / AI: model, seed, prompt-hash) and lineage.
- **I6 — Whole-design regeneration is a distinct, explicitly labeled job type.** No operation escalates into it.

### 1.3 Engines vs. features

The twelve mandated systems are horizontal **engines** (core packages) exposed through
vertical **feature surfaces** (UI modules):

| # | System | Engine (core) | Feature surface |
|---|---|---|---|
| 1 | Garment Library | `core_garment` | `feature_garment_library` |
| 2 | Garment Structure | `core_garment` | tree + inspector panel |
| 3 | Design Tree | `core_document` | `feature_design_tree` |
| 4 | Textile Element | `core_document` + `core_imaging` | `feature_canvas_editor` |
| 5 | Conversation AI | `core_ai` | `feature_conversation` |
| 6 | Textile Inspector | `core_ai` | `feature_inspector` |
| 7 | Asset Intelligence | `core_assets` | `feature_library` rails |
| 8 | Theme | `core_design_system` | `feature_settings` |
| 9 | API Manager | `core_ai` | `feature_settings` |
| 10 | Project Dashboard | `core_common` (activity ledger) | `feature_dashboard` |
| 11 | Production | `core_production` | `feature_production` |
| 12 | Desktop Workspace | `core_workspace` | `app` shell |

## 2. Garment Library Engine

Catalog of garment starting points, independent of any project's tree; instantiation
deep-copies (never live-links).

- `GarmentTemplate { id, schemaRef + structure options, starterDesign?, taxonomy, authorship, contentVersion }`.
- Multi-axis taxonomy: region/tradition (Pakistani, Indian, …), tier (Luxury Pret,
  Luxury Formal, Designer, RTW, Casual), fabric/season line (Luxury Lawn, Summer,
  Winter, Luxury Eid), trend (dynamic server-fed tag).
- Server-published, versioned, locally cached **content packs** — new garments ship as data.
- `InstantiateTemplate(templateId)` emits tree-fragment commands (undoable).
- Save-back: any garment subtree exports as a user template.
- Offline: cached packs fully usable; trend tags degrade gracefully.

## 3. Garment Structure Engine

Typed anatomy of garments: **schema (content, versioned) vs instance (in tree)**.

- `PartDefinition`: part type, cardinality, flat-panel geometry (printable 2D region
  with seam/bleed allowances, physical-unit-first in cm), zone slots, anchors, allowed
  style variants, symmetry group.
- Launch schemas: **Kurta, Pant/Trouser, Dupatta** — with Sleeves, Necks, Cuffs, Hems,
  Plackets, Yokes, Panels, Pockets, Side Slits, Back Panels as part definitions.
- **Symmetry links**: left/right parts share content by default; breakable/re-linkable.
- **Structure variants as swaps**: `SwapPartVariant(neckNode, "boat")` re-fits content, staged when lossy.
- Schema versioning + migration; declarative JSON authored by the content team
  (internal Schema Studio tool in Phase 4).
- Two render views from one tree: **Flat Panel View** (production truth) and
  **Garment Preview** (technical silhouette). 3D draping remains a non-goal.

## 4. Textile Design Tree Engine

```
Project → Artwork → Garment → GarmentPart → Zone → Content nodes
  Content: FabricBase · ColorFill · MotifElement(hero|secondary|filler) ·
           BorderElement · OutlineElement · TextureElement · ShadowElement · ElementGroup
```

- Sibling order within a zone **is** z-order; the layer panel is a projection of the tree.
- Universal node contract: stable `NodeId`, semantic path, role tags, capability set,
  lock state, visibility, provenance, version pointers.
- Capabilities → mechanisms: Lock/Hide/Rename/Duplicate (commands, cascading);
  Import/Export (node-scoped); AI Generate/Modify/Replace/Recolor (node-scoped jobs →
  staging); Repeat (`RepeatSpec` at Zone/ElementGroup — node-scoped repeat engine);
  Version History (command log filtered by node lineage + named `NodeVersion` snapshots).
- **Semantic addressing** (shared language of the OS):
  `artwork.kurta.sleeve[left].border`, `artwork.dupatta.pallu[top]`,
  `artwork.kurta.field@hero-motif`, `artwork.kurta.*.border`.

## 5. Textile Element Engine

All operations are commands (I1), previewable and undoable: Import (auto-matting
offered), Generate (→ Asset Tray or staged proposal), Replace (preserves transform,
repeat spec, z-position), Modify (masked, element-only), Delete (optional ground-heal
proposal) / Duplicate, Repeat (straight / half-drop / brick / mirror / tossed /
linear-along-path), Recolor (palette-linked), Scale / Rotate / Mirror, Arrange
(align/distribute + zone layout policies: single, scatter, grid, mirrored pair, along-path).
Heavy raster ops run in isolates; FFI seam reserved in `core_imaging`.

## 6. Conversation AI Engine

Natural language is another input device for the same command bus. Pipeline
(each stage a testable component in `core_ai`):

1. **Context** (open artwork, selection, locks, recent ops, palette, tray)
2. **Intent** (generate | modify | replace | recolor | constraint | arrange | query | batch)
3. **Target** (NL → candidate semantic paths; tree serialization given to the model)
4. **Resolution** (symmetry expansion; low confidence → one clarifying question;
   resolved targets always highlighted before execution)
5. **Constraints** (locks I4; "only/except" → exclusive-scope constraints; palette locks)
6. **Execution Plan** (`{steps: [AiJob|Command], scope masks, credit estimate, affected nodes}`)
7. **Validation** (static, before compute: capability matrix, locks, scope ⊆ target, I6 gate)
8. **Preview** (AiProposals in staging)
9. **Approval** (accept/reject/re-roll per proposal; plan logged to provenance)

The LLM proposes a structured plan; **it never holds the pen** — the validator and
command bus are deterministic client code. Canonical acceptance utterances:
"Replace only the sleeve border." / "Make the dupatta pallu richer." /
"Keep everything locked except the neck." / "Generate five luxury Ajrak borders."

## 7. Textile Inspector Engine

Upload artwork → understanding → staged tree population (supersedes V1 decompose):
garment classification → structure detection → pattern/repeat analysis → motif
segmentation + role classification (hero/secondary/filler) → border extraction →
palette extraction → printable/editable region maps → per-finding confidence.

Output: `InspectionReport { garment, fabricGuess, structure[], pattern, motifs[],
borders[], palette[], regions, treeProposal }`. The `treeProposal` is **staged** (I2);
refinement tools close gaps; ground reconstruction runs on accept. Measured against
the benchmark corpus (≥80% auto-isolation bar at M7).

## 8. Asset Intelligence Engine

On import/generation: visual embedding + auto-tags + palette signature → private
per-account vector index. Recommendations: similarity kNN, generative variants
(inspired/luxury/trending — proposals only), pairing rules (border↔motif by
scale/density/palette), trend signals; surfaces as dismissible rails. The engine
never modifies a document. Degrades to local metadata search offline.

## 9. Theme Engine

Token-based (`core_design_system`): primitive → semantic → component tokens; themes
are token resolution sets. Built-ins: Light, Dark, System, **Luxury Ivory**,
**Luxury Maroon**, **Midnight**; Custom Accent derives a full ramp with WCAG contrast
enforcement. Density modes (Compact/Comfortable) orthogonal to color. Professional
Workspace Mode is a workspace preset. Hot-switchable; persisted.

## 10. API Manager

`ProviderProfile { id, mode: managed|byok, endpoint, keyRef(OS secure storage),
capabilities{image_gen, vision, text, inpainting, upscale, embed}, models[tier],
quota{used,limit,resetAt}, health{status, latencyP50/P95, lastCheck, circuit},
validity{keyValid, lastValidation} }`.

Continuous jittered health probes; per-provider circuit breaker (closed/open/half-open);
capability+health+quota+tier+cost routing with failover; every job records the serving
provider/model (I5). Managed and BYOK modes implement the same interface.

## 11. Project Dashboard

Home surface: recent/pinned projects, recent assets/motifs/borders/colorways, recent
AI jobs, system health strip (storage, sync, API status). Reads the append-only
**Activity Ledger** (`core_common`) + core read-models — never imports other features.

## 12. Production Module

`ProductionJob` pipeline: **Preflight** (rule engine: effective DPI, repeat seam
continuity, color count vs technique, sRGB→CMYK gamut ΔE report, min feature size,
bleed/seam allowances) → **Render** (full-res per panel/tile; isolate or backend farm)
→ **Color** (ICC-managed CMYK, profile per mill) → **Encode** (TIFF incl. CMYK, PNG,
print-ready PDF; SVG reserved) → **Package** (production sheet).
Deliverables: repeat tile, panel set, tiled yardage strike-off — exact physical size +
DPI always embedded. Factory Preview: yardage simulation, panel sheet, colorway card,
spec block; desktop soft-proofing. Print-match is supported, never promised.

## 13. Desktop-First Workspace

Windows is the production cockpit; mobile is companion (review, approvals, light edits).
`core_workspace`: serializable docking layout tree (splits/tabs/floats), presets
(Design/Color/Production/Review + Professional Workspace Mode); `ShortcutRegistry`
(platform-aware, remappable, conflict detection) + Command Palette; context-menu
contribution registry (per node type / canvas / panel); heterogeneous multi-selection;
canvas selection ≡ tree selection (one provider, bidirectionally synced);
context-sensitive Inspector Panel.

## 14. Module Structure

```
CORE                                   FEATURES (no feature→feature imports)
core_textile     (frozen textile vocabulary — added by ADR-0002)
core_common      core_color            feature_dashboard      feature_repeat
core_document    core_ai               feature_design_tree    feature_color
core_garment     core_assets           feature_garment_library feature_library
core_rendering   core_production       feature_canvas_editor  feature_projects
core_imaging     core_workspace        feature_inspector      feature_production
core_design_system                     feature_conversation   feature_review
                                       feature_ai_assist      feature_settings
APP: app (workspace shell composition, adaptive platform shells, DI, routing)
```

## 15. Folder Structure

As realized in this repository: `app/`, `packages/` (26 workspace members), `content/`
(schemas + packs), `backend/`, `docs/` (architecture, adr, milestones), `tooling/`,
`.github/workflows/`. Each package: `lib/src/<blueprint subfolders>`, `test/`,
`analysis_options.yaml` including the root config.

## 16. Dependency Graph (enforced in CI)

`app → features → core → nothing`; arrows never point up or sideways.

- Features never import features; shared needs get promoted into core.
- `core_common`, `core_textile`, `core_document`, `core_garment`,
  `core_color`, `core_ai`, `core_assets` are pure Dart (isolates + backend
  reuse). `core_textile` and `core_common` are foundation packages with zero
  internal dependencies (ADR-0002).
- `core_ai` is vendor-blind; provider adapters live in data layers.
- Feature→core edges: dashboard→{common, ai, assets}; design_tree→{document, workspace};
  garment_library→{garment, document}; canvas_editor→{document, rendering, imaging};
  inspector→{ai, imaging, document}; conversation→{ai, document}; ai_assist→{ai, document};
  repeat→{document, rendering}; color→{color, document}; library→{assets};
  projects→{document}; production→{production, color, rendering}; review→{document};
  settings→{ai}. All features additionally use core_design_system + core_common.
- Core→core edges: textile→nothing (foundation, ADR-0002);
  interaction→nothing (foundation, ADR-0003 — universal viewport/gesture
  contracts every editing surface inherits); document→common;
  garment→{document, common}; rendering→{document, common}; imaging→common;
  color→common; ai→common; assets→{ai, common}; production→{rendering, color,
  document, common}; workspace→{design_system, common}; design_system→common.
  Engines adopt textile-vocabulary edges (document/garment/ai/color →
  core_textile) as they land.

## 17. Data & File Format — `.febric` v2

`project.febric/`: `manifest.json` (format version, migrations), `tree.json`,
`commands.log` (journal: autosave/crash recovery/audit), `versions/` (snapshots =
tree deltas + content hashes), `assets/` (content-addressed, dedup), `garment/`
(pinned schema copies — projects never break on pack updates), `inspection/`,
`conversation/` (optional), `previews/`. Migration framework from file one.

## 18. Rendering & State Management

`DesignTree → RenderGraph` compiler; zones composite to cached tiles; node-scoped
damage tracking; Flat Panel and Garment Preview compilers; per-node tiled repeat
previews. The canvas never rebuilds through the widget tree; 60fps desktop target.

Riverpod tiers — T1: `designTreeEngine` (command applier + undo + staging) behind a
single provider; T2 session/tool: unified selection, conversation, inspection,
asset tray, workspace layout, panel controllers; T3 app: theme, API health stream,
activity ledger, sync, credits. Selection/hover never touch the document provider.

## 19. Unified AI Flow

Direct UI action / Conversation ExecutionPlan / Inspector treeProposal → API Manager
routing → backend orchestrator → **AI Proposal Staging** (nothing skips it) →
accept | reject | re-roll → Command Bus → Design Tree → provenance.

## 20. Roadmap & Milestones

> **Amended by ADR-0017 (Engine-first Roadmap, 2026-07-13).** The milestone
> *ordering and numbering* below is engine-first: milestones follow the
> engine dependency chain so each feature lands on frozen substrate. The
> constitutional invariants (§1.2), module set (§14), dependency graph (§16)
> and every frozen contract are **unchanged** — ADR-0017 supersedes only the
> schedule, not the architecture. Feature deliverables (Garment Library,
> Repeat, Color, Inspector, Conversation, Asset Intelligence, Dashboard,
> Colorways, mobile companion, production/CMYK) layer onto the spine once the
> engine beneath them is frozen; their §-referenced acceptance criteria are
> carried forward verbatim.

**The engine dependency chain (the roadmap spine):**

```
Document → Tree → Asset → Canvas → Interaction → AI → Production
```

Each arrow is a hard build-order dependency (rationale in ADR-0017): the
tree is commands on the document bus; assets are referenced by tree nodes;
the canvas renders by resolving asset ids; live interaction needs a rendered
canvas; AI stages into that interaction/canvas surface; production consumes
every engine above it.

| M# | Milestone | Engine / package | Key acceptance |
|---|---|---|---|
| M0 | Project initialization | workspace + CI | Workspace scaffold; CI green |
| M1 | Workspace + theme + textile vocabulary | `core_design_system`, `core_workspace`, `core_textile` | 6 themes + contrast gates; adaptive shell; frozen vocabulary |
| M1.5 | Interaction foundation | `core_interaction` | Universal viewport/gesture contracts; platform parity tests |
| M1.6 | Foundation freeze (10 engines) | lock/layer/mask/selection/plugin/performance/tooling/geometry + AI contracts | All frozen surfaces + freeze tests green |
| M2 | Document Engine ✅ | `core_document` (ADR-0014) | Command bus; Lock→Validation→History→Document; 100+ undo; lossless `.febric` |
| M3 | Design Tree Engine ✅ | `core_document` tree (ADR-0015) | 8 tree commands; capability matrix; semantic addressing |
| M4 | Asset Engine ✅ | `core_asset` (ADR-0016) | One identity; content-addressed store; usage graph + ref counting |
| **M5** | **Canvas Engine (next)** | `core_rendering` | `DesignTree → RenderGraph`; tile compositing; **60fps @ 200 nodes** |
| M6 | Interaction (live wiring) + Element Engine | `core_tooling` tools + canvas surface | Selection ≡ tree selection; all Element ops incl. mirror/arrange/along-path; node-scoped Repeat + Color v1 |
| M7 | AI backbone | `core_ai` adapters + API Manager + backend | Health/circuit/failover fault-injected; staging loop; scoped AI (zero-drift); Inspector v1; Conversation |
| M8 | Production Module | `core_production` | Preflight; CMYK TIFF vs reference profile; factory sheet |
| M9+ | Intelligence + companion | `core_assets`, feature surfaces | Asset Intelligence; Dashboard; colorways; accounts/sync; mobile review; themes polish; beta hardening (crash-free >99.5%; 300-DPI 64×64cm export <60s) |

## 21. Risk Register

R1 segmentation quality on dense textile art; R2 Flutter raster performance (tiles +
isolates + FFI seam, hard perf gates); R3 AI inference cost (tiering, caching, scoped
jobs); R4 scope creep (ADR discipline); R5 vendor churn (provider abstraction);
R6 cross-platform UX dilution (desktop-first); R7 color fidelity expectations;
R8 Pantone licensing; R9 AI-output IP (provenance); R10 conversation target
mis-resolution (highlight-before-execute, staging backstop); R11 garment content
authoring bottleneck (content workstream, Schema Studio); R12 BYOK key security;
R13 twelve-system scope (phase gates); R14 CMYK fidelity disputes; R15 cultural/domain
accuracy of garment taxonomy (expert review); R16 embedding cost/privacy.

## 22. Open Questions

1. API mode at launch: managed cloud, BYOK, or both — and which providers first?
2. Who authors the launch garment library content; which collections ship first?
3. Confirm Kurta + Pant + Dupatta as the deep v1 trio.
4. Conversation languages: English only, or + Urdu / Roman Urdu / Hindi?
5. Trend signal source: editorial or data-driven?
6. Target mills' ICC profiles / CMYK specs for M12 validation?
7. V1 carry-over: business model, mobile depth, offline, Pantone, team/timeline.
