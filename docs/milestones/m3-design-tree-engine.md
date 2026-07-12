# M3 — Design Tree Engine (2026-07-11)

The semantic design hierarchy made fully operable: eight tree commands
appended to the M2 command bus, node capability matrix, and the semantic
addressing engine (ADR-0015). **Zero changes to the architecture or the
Document Engine pipeline** — every M3 feature is additive and inherits
locks, history/undo, provenance and revisions from M2.

## Delivered

- **Tree commands (8)**: `createDesignNode`, `deleteDesignNode`,
  `moveDesignNode`, `renameDesignNode`, `setNodeVisibility`,
  `setNodeLocked`, `setNodeMetadata`, `duplicateDesignNode` — sealed-union
  append with exact reducer inverses (subtree-restoring delete, move-back,
  previous-value setters, delete-of-clone) and object-scope
  `lockRequirement`s.
- **Pure ops** (`DesignTreeOps`): structure-sharing `rewrite`, `locate`,
  and `cloneWithIds` on the `IdGenerator` seam (duplication clones at the
  caller; the reducer stays pure and replay-deterministic).
- **Node locks** (invariant I4 at tree level): a locked node or locked
  ancestor rejects every structural edit before compute; the only edit a
  locked node accepts is its own unlock. Lock Engine object locks gate
  the same commands in pipeline stage 1 — both layers verified.
- **Capability matrix**: 12 wire-frozen `NodeCapability` values;
  per-`DesignNodeType` rows frozen by test (project: no hide/repeat/
  per-node AI; artwork +ai_recolour; garment/part: all minus repeat;
  zone/element/group: all). Reducer enforces rename/hide/duplicate.
- **Semantic addressing** (`SemanticPath`): the blueprint grammar —
  `artwork.kurta.sleeve[left].border`, `artwork.kurta.*.border`,
  `field@hero-motif` — strict parse (FormatException on corrupt input),
  document-order resolution over names/part/garment_type/type wire names,
  instance qualifiers and role selectors.

## Verification

55/55 core_document tests (34 M2 + 21 M3: command inverses + undo/redo,
root protection, cycle refusal, duplicate-id refusal, node-lock subtree
coverage + unlock path + undoability, Lock Engine gating, capability
enforcement + frozen matrix rows, canonical blueprint paths, wire
freezes incl. all 28 command variants JSON round-trip) · workspace
analyze clean · dependency lint PASS · all suites green · debug APK
builds.

Next: awaiting approval for **M4**.
