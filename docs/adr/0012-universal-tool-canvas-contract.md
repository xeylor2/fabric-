# ADR-0012 — Universal Tool & Canvas Contracts (`core_tooling`)

- **Status:** Accepted (M1.6 freeze, 2026-07-07)
- **Decision — Tool:** `UniversalToolContract` freezes **exactly fourteen
  members** — initialize, dispose, activate, deactivate, preview, execute,
  cancel, undo, redo, selection, viewport, history, lock, metadata —
  *nothing else*. Every tool (Repeat Pattern, Colour Shift, Print Ready
  Enhancement, Enhance Model Cloth, Motif Refinement, Redesign Textile
  Print, and all future AI tools) implements it. Support models
  (`ToolContext`, `ToolRequest`, `ToolPreview`, `ToolResult`,
  `ToolHistory`, `ToolMetadata` bound to the frozen `FebricTool` identity)
  are freezed + JSON.
- **Decision — Canvas:** `UniversalCanvasContract` freezes the editing
  surface every tool runs inside: viewport + camera (`core_interaction`),
  `CanvasCoordinateSystem` (measurement unit, dpi, origin), object
  selection (`SelectionState`) and region selection (`core_selection`),
  `LockSet`, history hooks, gesture routing (`InteractionEvent` →
  `ViewportInteractionMapper`), zoom/pan/rotation (`ViewportOps`),
  `SnappingConfig`, `GuideLine`s, `GridSpec`, `Transform2D` and
  measurement via `UnitConverter`.
- **Contract semantics:** preview stages a proposal (I2); execute applies
  via the command bus (I1) after `LockPolicy` checks (I4); cancel is
  always safe; tools *consume* the shared engines and never re-implement
  zoom, selection, locks or history.
- **Placement:** dedicated integration package (depends on textile,
  interaction, lock, selection, geometry). It is deliberately the only
  M1.6 package composing multiple foundations; nothing depends back on it
  except tool features (acyclic by lint).
- **Enforcement:** a freeze test pins the exact member list; adding a
  fifteenth member fails CI until a superseding ADR lands.
