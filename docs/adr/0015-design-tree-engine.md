# ADR-0015 — The Design Tree Engine (M3)

- **Status:** Accepted (M3, 2026-07-11)
- **Context:** M2 shipped the command-driven Document Engine (ADR-0014).
  M3 makes the Design Tree — the *semantic* hierarchy of textile design
  (project → artwork → garment → part → zone → element/group, frozen in
  ADR-0002) — fully operable. Constraint honoured verbatim: **no
  architecture change, no Document Engine change.** The frozen pipeline
  (Lock → Validation → History → Document), the reducer contract, the
  history model and the `.febric` schema are untouched.

## Decisions

1. **Additive commands on the ONE bus (invariant I1).** Eight new
   `DocumentCommand` variants — `createDesignNode`, `deleteDesignNode`,
   `moveDesignNode`, `renameDesignNode`, `setNodeVisibility`,
   `setNodeLocked`, `setNodeMetadata`, `duplicateDesignNode` — appended to
   the sealed union (append-only wire freeze, like every vocabulary).
   They therefore inherit locks, validation, history/undo, provenance and
   revision stamping *for free*; no second mutation path exists.
2. **Pure structural ops (`DesignTreeOps`).** `rewrite` (structure-sharing
   subtree rewrite/removal), `locate` (parent + index) and `cloneWithIds`
   (fresh identities via the `IdGenerator` seam, selection cleared)
   compose inside the reducer. Mirrors the layer-tree helpers — same
   idioms, zero engine edits.
3. **Exact inverses, no snapshots.** create ↔ delete (delete's inverse
   re-creates the *whole subtree* at its original parent + index), move ↔
   move-back, rename/visibility/metadata/lock ↔ previous value, duplicate
   ↔ delete-of-clone. Verified by tree-equality round-trip tests.
4. **Duplication is two explicit phases.** The caller clones with
   `DesignTreeOps.cloneWithIds` (identity decisions happen at the seam,
   deterministically testable), then issues `duplicateDesignNode` carrying
   the pre-cloned subtree; the reducer validates id freshness and inserts
   the clone as the source's next sibling. Undo/redo replays are therefore
   byte-identical — no id generation inside the reducer, which stays pure.
5. **Node locks = invariant I4 at tree level.** A node-locked subtree
   (flag on `DesignNode.locked`) rejects every structural edit — for the
   node *and all descendants* — with `CommandRejectionReason.locked`,
   checked in the reducer *before* any compute. The single exception:
   unlocking the locked node itself (the release path). Authoritative
   locking remains the Lock Engine: all eight commands also declare
   `lockRequirement` at `LockScope.object`, so review/policy locks and
   the global implication hierarchy gate them in pipeline stage 1.
6. **Capability matrix (frozen, 12 capabilities).** `NodeCapability`
   (wire-frozen: lock, hide, rename, duplicate, import, export,
   ai_generate, ai_modify, ai_replace, ai_recolour, repeat,
   version_history) and `NodeCapabilityMatrix` fix what each
   `DesignNodeType` supports: project (no hide/repeat, no per-node AI —
   whole-design regen stays the distinct I6 operation), artwork
   (+ai_recolour), garment/garment_part (all except repeat),
   zone/element/group (all). The reducer enforces the structurally
   unambiguous rows (rename/hide/duplicate); tool and AI layers consult
   the matrix before issuing the rest.
7. **Semantic addressing (`SemanticPath`).** The blueprint's canonical
   grammar — `artwork.kurta.sleeve[left].border`, wildcards
   (`artwork.kurta.*.border`), role selectors (`field@hero-motif`) —
   parses with a strict segment regex (corrupt addresses throw
   `FormatException`, never mis-resolve) and resolves level-by-level in
   document order. Tokens match slugged node names, `part` /
   `garment_type` metadata, or the frozen type wire name; `[qualifier]`
   matches `instance` metadata; `@role` matches `role` metadata. This is
   the shared target language of the Conversation AI and every future
   tool.
8. **Schema untouched.** `DesignNode` (ADR-0002) already carried
   `children/metadata/visible/locked/selected`; M3 adds *behaviour*, not
   fields. `.febric` schema stays at version 1; the new command variants
   ride the existing polymorphic command serialization.

## Consequences

- The Conversation AI (M-later) resolves user language to nodes via
  `SemanticPath` and emits the eight commands with provenance — nothing
  new to invent at that milestone.
- The Design Tree panel (UI milestone) is a pure projection of
  `artboard.designTreeRoot` + `NodeCapabilityMatrix` (which actions to
  offer) — no business logic in the widget layer.
- Zone-level AI operations (M4+) target nodes by semantic path and are
  gated by the same node locks and capability rows.

## Evidence

- `packages/core_document/lib/src/tree/` (`design_tree_ops.dart`,
  `node_capabilities.dart`), `lib/src/addressing/semantic_path.dart`,
  command + reducer extensions.
- `packages/core_document/test/design_tree_test.dart` (commands, undo,
  node locks, capabilities, addressing) and vocabulary freeze tests
  (capability wire names, matrix rows, command JSON round-trips).
