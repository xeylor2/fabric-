# Changelog

All notable changes to FEBRIC are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [2.0.0] — 2026-07-13 — "FEBRIC V2 Foundation"

First official release of the FEBRIC Architecture V2 baseline. This release
establishes the permanent architectural foundation of the FEBRIC textile
design operating system and supersedes the unreleased V1 prototype in its
entirety. It is a **foundation release**: the engine substrate is built and
frozen; end-user feature surfaces beyond the workspace shell and settings are
intentionally not yet implemented.

### Added

**Architecture**

- Dart **pub workspace** monorepo — 37 members (`app` + 22 `core_*` engines +
  14 `feature_*` modules), single root lockfile, one resolution context
  (ADR-0001).
- **Constitutional invariants I1–I6** in force and CI-enforced:
  one command bus (I1), staging before apply (I2), scope masks as authority
  (I3), absolute locks (I4), mandatory provenance (I5), whole-design
  regeneration as a distinct job (I6).
- **Document Engine** (`core_document`, M2 / ADR-0014): `FebricDocument` as the
  single runtime source of truth; sealed `DocumentCommand` bus; the frozen
  pipeline **Lock → Validation → History → Document**; command-based undo/redo
  via reducer-computed inverses; `.febric` versioned format with stepwise
  migration and a forward-compatibility gate.
- **Design Tree Engine** (`core_document`, M3 / ADR-0015): 8 additive tree
  commands on the one bus; 12-value `NodeCapabilityMatrix`; `SemanticPath`
  addressing (`artwork.kurta.sleeve[left].border`, wildcards, role selectors).
- **Asset Engine** (`core_asset`, M4 / ADR-0016): one asset identity shared
  with the document manifest; content-addressed, deduplicating, immutable
  content store (`sha256:`); append-only version lineage; usage graph
  (Asset → Node → Artboard → Document) with reference counting.
- **Ten frozen foundation engines** (M1.6 / ADR-0004…0013): Lock, Layer, Mask,
  Selection, Plugin SDK, Performance, Universal Tool Contract (exactly 14
  members), Universal Canvas Contract, Prompt Compiler (10 stages), Universal
  AI Pipeline (13 unskippable stages) — plus `core_geometry`.
- **Textile domain vocabulary** (`core_textile`, M1 / ADR-0002): frozen
  garments, parts, textile objects, repeats, colour/AI operations,
  `DesignNode`, and the frozen six `FebricTool`s. Append-only wire names.
- **Universal interaction foundation** (`core_interaction`, M1.5 / ADR-0003):
  viewport/camera math, 9 zoom commands, 11 gesture kinds, platform-parity
  contracts.
- **Theme Engine** (`core_design_system`, M1): 6 themes (System, Light, Dark,
  Luxury Ivory, Luxury Maroon, Midnight) + custom accent with WCAG contrast
  enforcement; token-based; hot-switchable, persisted.
- **Adaptive Workspace Shell** (`core_workspace`, M1): desktop/tablet/phone
  layouts, 9 preserved-state navigation branches, safe-area handling.
- **CI + architecture enforcement**: `tooling/dependency_lint.dart` enforces
  `app → features → core → nothing`, no feature-to-feature imports, pure-Dart
  core set, and colour-token discipline; GitHub Actions runs format, resolve,
  dependency lint, `analyze --fatal-infos`, all suites, and a Windows build.

**Documentation**

- Permanent blueprint `docs/architecture/architecture-v2.md` (Architecture V2).
- 17 Architecture Decision Records (ADR-0000…0017).
- Architecture snapshot `docs/architecture/snapshot-v2-foundation.md`.
- Milestone reports M0–M4; engine architecture docs (document, asset,
  foundation-freeze, performance-strategy).
- `docs/adr/0017-engine-first-roadmap.md` establishing the engine-first
  milestone order.

### Breaking Changes

- **Complete replacement of the V1 prototype.** The V1 Flutter monolith
  (single-app `lib/` with ad-hoc services) is removed. There is **no migration
  path** from V1 artifacts; V1 was an unreleased prototype and no `.febric`
  documents or public APIs from it are supported.
- The repository baseline is re-established at V2; the V1 commit history is not
  part of the supported project lineage.

### Known Limitations

- **Foundation release — no end-user editing yet.** There is no rendered
  canvas, no live editing, no AI execution, and no export in this release.
- Feature modules beyond the workspace shell, theme, and settings are
  placeholders/skeletons.
- `core_ai` ships **contracts only** — no provider adapters; `backend/` is a
  placeholder.
- Skeleton engines awaiting their milestones: `core_rendering`, `core_color`,
  `core_imaging`, `core_garment`, `core_production`, `core_assets` (Asset
  Intelligence).
- Windows desktop build requires Visual Studio locally; CI covers it.

### Next Milestone

- **M5A — Canvas Engine** (`core_rendering`): `DesignTree → RenderGraph`
  compiler and tile compositing against the frozen `core_performance`
  contracts, targeting the binding gate of 60fps at 200 nodes. Roadmap order
  per ADR-0017: Document → Tree → Asset → **Canvas** → Interaction → AI →
  Production.

[2.0.0]: https://github.com/xeylor2/fabric-/releases/tag/v2.0.0
