# M4 — Asset Engine (2026-07-12)

`core_asset`: the single source of truth for every external resource of a
project — identity, immutable versioning, content addressing, dependency
graph and reference counting (ADR-0016; diagrams in
docs/architecture/asset-engine.md). Built entirely on the frozen M2/M3
architecture — **Document Engine, Design Tree, Lock Engine, Selection,
History, Command Bus, Semantic Path and Node Capability Matrix are
untouched.** No duplicate storage, no duplicate identity.

## Delivered

- **Identity model**: `FebricAsset` — uuid/name/type/origin/mime/hash/
  dimensions/dpi/colour space/created/modified/version/tags/metadata, with
  an append-only `AssetVersionRecord` lineage. Thirteen frozen
  `AssetType`s (image, reference image, fabric, motif, pattern, texture,
  mask, brush, palette, font, template, plugin asset, AI generated),
  `AssetOrigin` (superset wire-compatible with the document manifest's
  `AssetSource`), `AssetColourSpace` (incl. CMYK for print).
- **One identity**: `FebricAsset.id` IS the document manifest's
  `AssetRecord.id`; `DocumentAssetBinding` reconciles id + hash and carries
  precise type/origin losslessly in the record's existing metadata —
  proven against the real `DocumentEngine` in the integration suite.
- **No duplicate storage**: bytes live once in the content-addressed
  `AssetContentStore` (`sha256:` via a `ContentHasher` seam), deduplicating
  and immutable by construction; catalogue/graph/nodes/documents hold only
  hashes and ids.
- **Immutable versioning**: `addVersion` appends (new hash, next number);
  prior hashes stay resolvable forever (`AssetCatalogue.byHash` across all
  versions); nothing overwritten; AI versions reference provenance by id
  (I5).
- **Single registry**: `AssetCatalogue` — lookup by uuid, hash (any
  version), type, tag; duplicate-content grouping.
- **Tree integration**: nodes reference assets via frozen
  `DesignNode.metadata` keys (`asset_id`, `asset_refs`), written only
  through the existing `setNodeMetadata` command — no new commands, no
  schema change; one asset → many nodes; binding inherits undo/redo.
- **Dependency graph & reference counting**: `AssetUsageGraph` records
  Asset → Node → Artboard → Document edges; unused/shared/duplicate/broken
  detection as pure queries; reference-counted removal (in-use refuses;
  forced leaves *detectable* broken refs).
- **Lock Engine first (I4)**: assets are `LockScope.object` targets; every
  mutation checks the frozen `LockPolicy` before compute; project/document
  locks imply object via the frozen hierarchy — Lock Engine untouched.
- **Repository + seams (SOLID/DI)**: `AssetRepository` persists
  `AssetEngineState{projectId, catalogue, graph}` (bytes stay in the
  content store); `ContentHasher`/`AssetContentStore`/`AssetRepository`/
  `LockPolicy` are abstractions with real in-memory implementations.

## Verification

70/70 core_asset tests (vocabulary + document-mapping freezes, model +
catalogue + state + graph JSON round-trips, engine registration/immutable
versioning incl. dimension-guarded versions/amend/lock-gating incl.
project+document implication and lock-precedes-validation/reference-counted
removal/usage sync/statistics, usage-graph projections + detection +
document-scoped node deletion + per-(document,node) sharing, content-store
dedup + immutability + engine end-to-end, repository contract, and document
integration on the REAL DocumentEngine — setNodeMetadata binding + manifest
identity reconciliation) · workspace analyze clean · dependency lint PASS
(core_asset registered pure-Dart) · all 37 suites green · debug APK builds.

## Adversarial review (ultracode)

A multi-agent review (4 dimensions — invariants, identity/storage,
correctness, design/tests — each finding adversarially verified) produced
12 findings; verification confirmed **0 violations of the stated hard
constraints** (node-deletion in practice flows through the document-scoped
`syncDocumentUsages` path). Three conservative hardenings were nonetheless
applied, all inside `core_asset`, none touching a frozen contract, each
with regression coverage:

1. `AssetUsageGraph.withoutNode` / `sharedAssetIds` made document-aware —
   node ids are unique only within a document, so cross-document
   distinctness keys on `(documentId, nodeId)`.
2. `AssetEngine.addVersion` now applies the same raster/dimension
   validation as `register` (a shared `_validateDimensions`), so a version
   can never move an asset into a state registration would refuse.
3. `addVersion` reads the clock once (a version's `createdAt` equals the
   asset's `modifiedAt`).

## Status

**M4 READY FOR ARCHITECTURE REVIEW.**

Next: awaiting approval for **M5 — Canvas Engine**.
