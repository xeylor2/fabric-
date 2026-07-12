# ADR-0016 — The Asset Engine (`core_asset`) (M4)

- **Status:** Accepted (M4, 2026-07-12)
- **Context:** M2 shipped the Document Engine (ADR-0014), M3 the Design
  Tree Engine (ADR-0015). Every external resource a project uses — images,
  fabrics, motifs, patterns, textures, masks, brushes, palettes, fonts,
  templates, plugin assets, AI output — needs ONE source of truth for
  identity, content, versioning and usage. M4 builds it as a new
  foundation-tier package, **without modifying any frozen engine**
  (Document, Design Tree, Lock, Selection, History, Command Bus, Semantic
  Path, Node Capability Matrix are all untouched).

## Naming — two different systems

The blueprint reserves `core_assets` (plural) for **Asset Intelligence**
(Architecture V2 §8, milestone M10): embeddings, auto-tags, similarity
recommendations — an advisory engine that *never modifies a document*.
That is NOT M4. M4 is the **Asset Engine** `core_asset` (singular): the
authoritative store of asset identity and content. One *recommends against*
assets; the other *owns* them. `core_assets` will depend on `core_asset`
when it lands.

## Decisions

1. **One identity (no duplicate identity).** `FebricAsset.id` is THE uuid
   of an asset everywhere — it IS the value stored in the frozen document
   manifest's `AssetRecord.id` (core_document, M2), in tree node
   references, in tool targets and AI inputs. The engine never mints a
   second identifier for the same resource. `DocumentAssetBinding` proves
   the round-trip: `AssetRecord.id == FebricAsset.id` and
   `AssetRecord.hash == FebricAsset.hash`, with precise type/origin carried
   losslessly in the record's open `metadata` under frozen keys.
2. **Nothing owns bitmap data (no duplicate storage).** Pixel/vector bytes
   live exactly once in the content-addressed `AssetContentStore`, keyed by
   `sha256:<hex>` (the `.febric` content-address algorithm, §17).
   Catalogue, usage graph, tree nodes and documents hold only hashes and
   ids. Content addressing makes the store deduplicating and immutable by
   construction: identical bytes yield one entry; entries are never
   overwritten.
3. **Assets are immutable; edits append versions.** `AssetEngine.addVersion`
   is the only way content advances — it appends an `AssetVersionRecord`
   (new hash, next version number) to an append-only lineage. Prior hashes
   stay resolvable forever (`AssetCatalogue.byHash` matches any historical
   version). Nothing is ever overwritten. AI-produced versions reference
   their `AiProvenanceRecord` by id (invariant I5) — never duplicate it.
4. **The single registry.** `AssetCatalogue` answers every lookup the
   workspace needs over one immutable map: by uuid, by content hash (any
   version), by type, by tag, plus duplicate-content grouping.
5. **Tree integration is reference-only, on the existing bus.** Design
   Tree nodes reference assets through two frozen `DesignNode.metadata`
   keys (`asset_id`, `asset_refs`), written EXCLUSIVELY via the existing
   `DocumentCommand.setNodeMetadata` — **no new commands, no schema
   change** (the node's open metadata map, ADR-0002, is exactly for this).
   One asset, many nodes. `NodeAssetBinding.collectUsages` walks a tree
   into dependency edges; because binding rides the command bus it inherits
   undo/redo for free.
6. **Lock Engine first (invariant I4).** Assets are `LockScope.object`
   targets. Every mutation (`register`/`addVersion`/`amend`/`remove`)
   consults the frozen `LockPolicy` (`LockSet.blockingLock`) BEFORE any
   compute; the frozen implication hierarchy means a project or document
   lock covers assets with no new scope. The Lock Engine itself is
   untouched; `ImplicationLockPolicy` is a thin delegation kept engine-side
   because foundation tiers cannot import core_document.
7. **The dependency graph & reference counting.** `AssetUsageGraph`
   records the full chain **Asset → Node → Artboard → Document** as a set
   of edges, making every projection a pure filter: reference count,
   nodes/documents using an asset, assets in a document/artboard/node.
   Detection is then trivial and exact — **unused** (zero references),
   **shared** (≥2 distinct nodes), **duplicate** (identical current hash),
   **broken** (edge to an id the catalogue lacks). Removal is
   reference-counted: an in-use asset refuses deletion unless forced, and a
   forced delete leaves *detectable* broken references, never silent ones.
8. **Repository + seams (dependency inversion, SOLID).** `AssetRepository`
   persists `AssetEngineState{projectId, catalogue, graph}` (bytes stay in
   the content store — no duplication); `ContentHasher`,
   `AssetContentStore` and `LockPolicy` are abstractions with real
   in-memory implementations (full contract semantics, not mocks).

## Future tool support (why the shape is right)

The frozen surface already carries every tool the blueprint names, with no
further schema change:

- **Repeat Pattern / Motif Refinement / Colour Shift / Enhance / AI
  Enhance / Print-Ready**: each is an `addVersion` with an `operation`
  label + `parameters` (and a `provenanceId` when AI) — full immutable
  history, exact reproducibility.
- **Fabric Lock Engine**: fabric assets are ordinary `LockScope.object`
  targets; locking one is already enforced before compute.
- **Print-Ready / production**: versions carry `dpi` and `colourSpace`
  (incl. `cmyk`) for preflight; the content store yields full-res bytes by
  hash.

## Consequences

- The canvas (M5) renders by resolving a node's `asset_id` → catalogue →
  content store; it never holds bitmap data.
- Asset Intelligence (`core_assets`, M10) consumes this engine's catalogue
  and content store to build its index — it reads, never owns.
- `.febric` `assets/` area persists `AssetEngineState` + content store with
  zero duplication of the document's own `AssetRecord` identities.

## Evidence

- `packages/core_asset/lib/` — model (`asset_type`, `asset_origin`,
  `asset_colour_space`, `asset_version`, `febric_asset`), `catalogue`,
  `graph`, `binding` (`node_asset_binding`, `document_asset_binding`),
  `content` (`content_hasher`, `asset_content_store`), `engine`
  (`asset_engine`, `asset_result`), `repository`.
- `packages/core_asset/test/` — 63 tests: vocabulary/mapping freezes,
  model + catalogue + state JSON round-trips, engine (registration,
  immutable versioning, amend, lock gating incl. project/document
  implication, reference-counted removal, usage sync, statistics), usage
  graph, content store (dedup + immutability), repository, and document
  integration (setNodeMetadata binding on the real bus + manifest identity
  reconciliation on the real `DocumentEngine`).
- `docs/architecture/asset-engine.md` — diagrams + dependency graph.
