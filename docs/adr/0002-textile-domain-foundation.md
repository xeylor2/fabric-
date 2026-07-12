# ADR-0002 — Textile Domain Foundation (`core_textile`)

- **Status:** Accepted (product owner mandate, 2026-07-06, extending M1)
- **Context:** Before any engine ships, every system needs one shared,
  strongly typed textile vocabulary — garments, parts, textile objects,
  repeats, operations, node types, workspace categories, tools. Without it,
  engines would drift into string literals and incompatible ad-hoc models.

## Decisions

1. **New foundation package `core_textile`** (pure Dart), added to the
   Architecture V2 module set (§14). It sits beside `core_common` at the
   bottom of the graph and depends on nothing internal; `core_document`,
   `core_garment`, `core_ai`, `core_color` and features consume it.
   Enforced by `tooling/dependency_lint.dart` (pure-Dart + dependency-free
   sets).
2. **Wire-name stability.** Every enum value carries an explicit `wireName`
   (snake_case) used in serialization. Names are append-only; renames are
   forbidden. Frozen by `vocabulary_freeze_test.dart` — changing an
   expectation there requires a new ADR.
3. **The frozen tool set.** `FebricTool` = { repeat_pattern,
   print_ready_enhancement, enhance_model_cloth, motif_refinement,
   redesign_textile_print, colour_shift } is mandatory and permanent, with
   `febricToolRegistry` binding each tool to its domain operations.
   `redesign_textile_print` embodies constitutional invariant I6.
4. **`tools` is a permanent `WorkspaceCategory`.** Its UI surface ships with
   the tools milestone; the domain category exists now (M1 mandates no UI).
5. **Immutable `DesignNode`** (freezed + json_serializable) is the shared
   tree shape: id, name, type, children, metadata, visible, locked,
   selected. The document engine (M2) layers commands/undo/addressing on
   top; `metadata` is an open escape hatch for milestone-specific payloads
   until they gain typed models.
6. **British spelling** (`Colour…`) is canonical in the domain layer,
   matching the product owner's vocabulary. UI copy may differ per locale.
7. **Garment anatomies**: kurta, dupatta and pant are encoded exactly as
   mandated. Shawl, saree and abaya carry canonical-initial anatomies (built
   from existing parts); refining them is a content decision recorded by a
   future ADR — they are deliberately not placeholders but conservative
   domain defaults.

## Consequences

- Engines never define their own garment/repeat/tool strings — imports only.
- `.febric` serialization of domain concepts is stable from day one.
- Adding vocabulary (new garment, tool, operation) is an explicit,
  reviewed, append-only event with a failing freeze test as the tripwire.
