# ADR-0014 — The Document Engine (`core_document`)

- **Status:** Accepted (M2, 2026-07-07)
- **Context:** M1.6 froze every foundation contract. M2 builds the runtime
  source of truth that composes them — without modifying any frozen ADR.

## Decisions

1. **Single source of truth (frozen rule 1).** `FebricDocument` owns
   everything: artboards (each with layer tree + design tree + camera),
   asset/mask/lock/tool-state/viewport registries, history, AI provenance,
   plugin data and all profile families. Runtime status
   (`DocumentStatus`, 9 frozen states) lives in the engine, not the file.
2. **Command bus (frozen rule 2).** The sealed `DocumentCommand` union is
   the only mutation vocabulary; `DocumentEngine.apply` the only mutation
   entry point. The frozen pipeline runs in order, no bypass:
   **Lock Engine → Validation → History → Document** (rule 5). Lock checks
   consult `LockPolicy` (ADR-0005) *before* any compute; the implication
   hierarchy means a document lock blocks layer commands, etc.
3. **Command-based undo/redo (not snapshots).** The pure `DocumentReducer`
   returns `(nextDocument, inverseCommand, affectedIds)`; history entries
   store `{command, inverse, timestamp, author, source, affectedIds,
   revision}`. Undo applies the stored inverse; redo re-applies the
   command; the journal cursor derives both stacks. Undo traversal is
   gated by `LockScope.undo`; new entries by `LockScope.history`.
4. **Tool-agnostic schema (frozen rules 3 + 6 — permanent).** Tools
   persist exclusively through `ToolStateExtension{toolId, version, data}`
   envelopes and `CustomCommand`s writing into namespace-isolated
   extension storage. Adding a tool or plugin NEVER changes the document
   schema; a test registers a nonexistent future tool to prove it.
5. **AI discipline (frozen rule 4, invariants I4/I5).** AI produces
   commands (`CommandSource.ai`); the engine *refuses* AI commands without
   an `AiProvenanceRecord` (prompt hash + template reference — never raw
   conversation; provider/model/parameters/constraint+tool versions), and
   stamps records with the landed revision + affected ids.
6. **Registries: stored vs computed.** Non-hierarchical state (assets,
   masks, locks, tool states, viewports, plugin data) is stored;
   hierarchical content (layers, design nodes) lives once in artboard
   trees and is *indexed* by computed registries (`layerRegistry`,
   `statistics`) so nothing can drift.
7. **`.febric` frozen.** Format name `febric`, versioned JSON manifest,
   stepwise `FebricMigration` registry, and a hard forward-compatibility
   gate: newer-schema files are refused loudly. Binary packaging later
   swaps the container, not the model.
8. **Dependency inversion.** `Clock`/`IdGenerator` seams live in
   `core_common`; persistence behind `DocumentRepository` (in-memory
   implementation ships — a real contract implementation, not a mock).
9. **Dependency note:** `core_document → core_ai` (for `AiProviderId` in
   provenance) is a new, acyclic core edge — `core_ai` never references
   the document.

## Consequences

- M3 (Design Tree Engine) adds tree commands to the same bus and inherits
  locks/history/provenance for free.
- Tools implement `UniversalToolContract.execute` by emitting commands —
  they can not touch the document any other way.
- The AI pipeline's `documentUpdate`/`undoStack` stages (ADR-0013) bind to
  `DocumentEngine.apply` with `CommandSource.ai`.
