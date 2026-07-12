# M2 — Document Engine (2026-07-07)

`core_document` implemented as the command-driven runtime source of truth,
composing the frozen M1.6 contracts without modifying any of them
(ADR-0014; diagrams in docs/architecture/document-engine.md).

## Delivered

- **Model**: FebricDocument root owning artboards (size/unit/dpi/background/
  camera/layer root/design tree root), asset registry (8 kinds, hash,
  usage refs), mask/lock/tool-state/viewport/plugin registries, history,
  AI provenance, 5 profile families, metadata/version/manifest/settings/
  preferences/statistics, typed ids — all freezed + JSON.
- **Command bus**: 20-variant sealed `DocumentCommand` (+ `custom`
  extension commands for future tools/AI/plugins — schema frozen forever),
  `CommandSource` (user/tool/ai/plugin/system), typed rejections.
- **Engine**: frozen pipeline Lock → Validation → History → Document;
  command-based undo/redo via reducer-computed inverses; status machine
  (9 frozen states); deterministic Clock/IdGenerator seams (core_common).
- **AI provenance**: required for AI-sourced commands; prompt hash +
  template only (no raw conversation); stamped with revision + targets.
- **`.febric`**: frozen format name, manifest gate, stepwise migration
  registry, newer-schema refusal; repository pattern with in-memory impl.

## Verification

34/34 unit tests (pipeline, locks incl. hierarchy implication, inverse
exactness, redo truncation, provenance discipline, tool-state envelopes,
namespace isolation, codec gates + migration, repository contract, wire
freezes incl. every command variant JSON round-trip) · workspace analyze
clean · dependency lint PASS · all suites green · debug APK builds.

Next: **M3 — Design Tree Engine** (tree commands on this bus). Awaiting
approval.
