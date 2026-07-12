# FEBRIC — Architecture Snapshot: V2 Foundation

**Freeze point:** M4.1 — Repository Freeze (2026-07-13)
**Tag:** `FEBRIC_V2_FOUNDATION`
**Scope of this snapshot:** the state of the repository at the end of M4
(Asset Engine), immediately before M5A (Canvas Engine).

This document is a point-in-time inventory generated from the repository
itself (`pubspec.yaml` workspace, every package manifest,
`tooling/dependency_lint.dart`, `docs/adr/`, `docs/milestones/`). It records
**what exists**, not what is planned — the plan is Architecture V2 §20 as
amended by ADR-0017.

---

## 1. Workspace

- **Type:** Dart pub workspace (single root lockfile; `resolution: workspace`
  in every member). ADR-0001. Root: `pubspec.yaml` (`name: febric_workspace`).
- **SDK:** Dart `^3.12.0` (Flutter 3.44.x / Dart 3.12.2 at M0).
- **Members:** **37** = `app` + **36 packages** (22 `core_*` + 14 `feature_*`).
- **Top-level layout:**

| Path | Role |
|---|---|
| `app/` | Flutter composition root — shells, DI (Riverpod), routing (go_router), platform (Windows/Android/iOS), l10n |
| `packages/core_*` | 22 horizontal engines (contracts + logic) |
| `packages/feature_*` | 14 vertical feature surfaces (never import each other) |
| `content/` | garment schemas + content packs — data, not code (currently `.gitkeep` stubs) |
| `backend/` | AI orchestration service — placeholder only (Phase 2 / M7) |
| `docs/` | `architecture/`, `adr/`, `milestones/` + research PDFs |
| `tooling/` | `dependency_lint.dart`, `test_all.sh`, `scaffold_m0.sh` |
| `.github/workflows/ci.yaml` | CI: format → resolve → dependency lint → analyze → test → Windows build |

**Generated sources** (`*.g.dart`, `*.freezed.dart` from build_runner) are
committed to the repository: CI runs `analyze`/`test` without a build_runner
step, so the committed generated code is required for CI to pass. `build/`,
`.dart_tool/`, and generated l10n are gitignored.

---

## 2. Packages

Legend — **Impl**: real contracts/logic + tests. **Skeleton**: barrel +
package marker + smoke test only, awaiting its milestone. LOC excludes
generated `.g`/`.freezed`.

### Core engines (22)

| Package | State | ~LOC | Milestone / ADR | Frozen surface (summary) |
|---|---|---|---|---|
| `core_common` | seams | 62 | M0 | `Clock`, `IdGenerator` DI seams |
| `core_geometry` | Impl | 267 | M1.6 | `Point2D/Size2D/Rect2D/Transform2D`, `MeasurementUnit/UnitConverter` |
| `core_textile` | Impl | 728 | M1 / 0002 | Garments, parts, textile objects, repeats, ops, `DesignNode`, `FebricTool` (six) |
| `core_interaction` | Impl | 1071 | M1.5 / 0003 | Viewport/camera, 9 `ZoomCommand`, 11 `GestureKind`, selection policy |
| `core_lock` | Impl | 273 | M1.6 / 0005 | 16 `LockScope` + implication hierarchy, `LockSet`, `LockPolicy` |
| `core_layer` | Impl | 195 | M1.6 / 0006 | 12 `LayerKind`, 16 `FebricBlendMode`, `LayerModel` |
| `core_mask` | Impl | 191 | M1.6 / 0007 | 6 `MaskKind`, boolean ops, refinements, `MaskStack` |
| `core_selection` | Impl | 198 | M1.6 / 0008 | 10 `SelectionShapeKind`, refinements, bounded `SelectionHistory` |
| `core_plugin` | Impl | 309 | M1.6 / 0010 | `PluginManifest`, 7 permissions, 8 lifecycle states, 2 sandboxes |
| `core_performance` | Impl | 203 | M1.6 / 0011 | Tiles, QuadTree, cache tiers, pools, `WorkerPriority`, history compression |
| `core_tooling` | Impl | 459 | M1.6 / 0012 | 14-member `UniversalToolContract` + `UniversalCanvasContract` |
| `core_ai` | Impl (contracts) | 535 | M1.6 / 0009,0013 | 10-stage prompt compiler + 13-stage pipeline; providers Claude/Gemini/GPT/Nano Banana. Adapters deferred to M7 |
| `core_document` | Impl | 2870 | M2+M3 / 0014,0015 | `FebricDocument`, command bus, reducer/undo, `.febric`, tree commands, capability matrix, `SemanticPath` |
| `core_asset` | Impl | 1411 | M4 / 0016 | `FebricAsset`, content-addressed store, catalogue, usage graph, ref counting |
| `core_design_system` | Impl | 1397 | M1 | Theme Engine: 6 themes, tokens, contrast gates, typography |
| `core_workspace` | Impl | 1104 | M1 | Adaptive shell, breakpoints, navigation surfaces |
| `core_color` | Skeleton | 17 | M6 (planned) | — |
| `core_garment` | Skeleton | 17 | Tree-layer feature (planned) | — |
| `core_imaging` | Skeleton | 17 | M6/M7 (planned) | — |
| `core_rendering` | Skeleton | 17 | **M5A (next)** | — |
| `core_production` | Skeleton | 17 | M8 (planned) | — |
| `core_assets` | Skeleton | 17 | M9 (Asset Intelligence) | — |

> **Naming trap (ADR-0016):** `core_asset` (singular) = **Asset Engine**,
> the authoritative store — **shipped (M4)**. `core_assets` (plural) =
> **Asset Intelligence** (embeddings/recommendations, §8) — **skeleton, M9**.

### Feature modules (14)

| Package | State | Notes |
|---|---|---|
| `feature_settings` | Impl (~636 LOC) | Functional Appearance (theme + accent), placeholder rest |
| `feature_dashboard` | Placeholder page | M1 route branch |
| `feature_projects` | Placeholder page | M1 route branch |
| `feature_design_tree` | Placeholder page | M1 route branch |
| `feature_canvas_editor` | Placeholder page | M1 route branch |
| `feature_conversation` | Placeholder page | M1 route branch |
| `feature_inspector` | Placeholder page | M1 route branch |
| `feature_production` | Placeholder page | M1 route branch |
| `feature_garment_library` | Placeholder page | M1 route branch |
| `feature_ai_assist` | Skeleton | — |
| `feature_color` | Skeleton | — |
| `feature_library` | Skeleton | — |
| `feature_repeat` | Skeleton | — |
| `feature_review` | Skeleton | — |

---

## 3. Dependencies (as-built, verified from every manifest)

**Global rule (CI-enforced):** `app → features → core → nothing`; arrows
never point up or sideways; **features never import features**.

**Dependency-free foundation tier** (zero internal deps, forever — enforced):
`core_common`, `core_geometry`, `core_textile`, `core_lock`, `core_plugin`.

**Core → core edges:**

```
core_interaction   → geometry
core_mask          → geometry
core_selection     → geometry
core_performance   → geometry
core_ai            → common, lock, textile
core_asset         → common, lock, textile          (core_document: dev-only, integration tests)
core_tooling       → geometry, interaction, lock, selection, textile
core_document      → common, geometry, interaction, layer, lock, mask, selection, textile, ai
core_garment       → common, document
core_rendering     → common, document
core_production    → common, document, color, rendering
core_color         → common
core_imaging       → common
core_design_system → common
core_workspace     → common, design_system
core_assets        → common, ai
```

Notable acyclic edge: `core_document → core_ai` (for `AiProviderId` in
provenance); `core_ai` never references the document. `core_tooling` is the
only foundation composing multiple foundations; nothing composes it back.

**Feature → core edges:** every feature depends on `core_common` +
`core_design_system` plus its domain cores — e.g.
`feature_design_tree → {document, workspace}`,
`feature_canvas_editor → {document, rendering, imaging}`,
`feature_inspector → {ai, imaging, document}`,
`feature_production → {production, color, rendering}`,
`feature_dashboard → {ai, assets}`, `feature_settings → {ai}`.
No feature→feature edge exists.

**`app`** depends on all 22 cores + all 14 features (composition root).

**Purity:** every package in the pure-Dart set
(common, geometry, textile, interaction, lock, layer, mask, selection,
plugin, performance, tooling, document, garment, color, ai, asset, assets)
imports no Flutter — enforced by `dependency_lint.dart`.

---

## 4. ADRs

17 logical ADRs across 16 files (ADR-0000 and ADR-0001 share one file). All
Accepted; none superseded except the §20 *schedule* (by ADR-0017).

| ADR | Title | Governs |
|---|---|---|
| 0000 | Architecture V2 is the permanent blueprint | Master blueprint authority; invariants I1–I6 binding |
| 0001 | Pub workspace instead of Melos | Monorepo mechanism |
| 0002 | Textile Domain Foundation (`core_textile`) | Frozen vocabulary; wire-name regime; `FebricTool` six; `DesignNode` |
| 0003 | Universal Interaction Foundation (`core_interaction`) | Viewport/gesture contracts; platform parity |
| 0004 | M1.6 Foundation Freeze (overview) | Ten frozen engines; package placement |
| 0005 | Lock Engine (`core_lock`) | 16 scopes + implication hierarchy (I4) |
| 0006 | Layer Engine (`core_layer`) | 12 kinds, 16 blend modes, `LayerModel` |
| 0007 | Mask Engine (`core_mask`) | Mask kinds/ops/refinements, `MaskStack` |
| 0008 | Selection Engine (`core_selection`) | 10 shapes, refinements, history |
| 0009 | Prompt Compiler (`core_ai/src/prompt`) | 10 stages; `CompiledPrompt`-only adapters |
| 0010 | Plugin SDK (`core_plugin`) | Manifest, permissions, lifecycle, sandbox |
| 0011 | Performance Strategy (`core_performance`) | Tiles, quadtree, caches, pools, compression |
| 0012 | Universal Tool & Canvas Contracts (`core_tooling`) | Exactly 14 tool members; canvas surface |
| 0013 | Universal AI Pipeline (`core_ai/src/pipeline`) | 13 unskippable stages |
| 0014 | Document Engine (`core_document`) | Command bus; Lock→Validation→History→Document; `.febric` |
| 0015 | Design Tree Engine | 8 tree commands; capability matrix; semantic addressing |
| 0016 | Asset Engine (`core_asset`) | One identity; content addressing; usage graph |
| 0017 | Engine-first Roadmap | Milestone ordering (this freeze); supersedes §20 schedule only |

---

## 5. Milestones

| M# | Report | Date | Result |
|---|---|---|---|
| M0 | `m0-initialization.md` | 2026-07-06 | Workspace scaffold + CI; all suites pass |
| M1 | `m1-workspace-foundation.md` | 2026-07-06 | Theme Engine (6 themes) + adaptive shell + 9 route branches; 53 tests |
| M1 (pt3) | `m1-textile-domain-foundation.md` | 2026-07-06 | `core_textile` vocabulary; 30 tests |
| M1.5 | `m1.5-interaction-foundation.md` | 2026-07-07 | `core_interaction`; 56 tests |
| M1.6 | `m1.6-foundation-freeze.md` | 2026-07-07 | 10 engines frozen; freeze/semantic suites green |
| M2 | `m2-document-engine.md` | 2026-07-07 | Document Engine; 34 tests |
| M3 | `m3-design-tree-engine.md` | 2026-07-11 | Design Tree Engine; 55 total `core_document` tests |
| M4 | `m4-asset-engine.md` | 2026-07-12 | Asset Engine; 70 tests + adversarial review (0 hard-constraint violations) |

**Current milestone:** M4 complete. **Next:** M5A — Canvas Engine
(`core_rendering`), per ADR-0017.

Verification gates reported green at each milestone (per milestone reports):
`dart analyze --fatal-infos .` clean · `dart format` clean ·
`dependency_lint` PASS · all package suites pass · Windows/debug builds.

---

## 6. Constitutional invariants (permanent — never modified without a superseding ADR)

- **I1** One command bus — every mutation is a serializable `DocumentCommand`.
- **I2** Staging before apply — AI output is staged; only user acceptance emits commands.
- **I3** Scope masks are authority — an AI job never affects nodes outside its scope (zero-drift test, M7/M8).
- **I4** Locks are absolute — checked before compute.
- **I5** Provenance always — every node records origin + lineage.
- **I6** Whole-design regeneration is a distinct labelled job (`redesign_textile_print`); nothing escalates into it.

Frozen pipeline (never reordered): **Lock → Validation → History → Document**
(ADR-0014). Frozen AI pipeline: 13 unskippable stages (ADR-0013).
