# ADR-0008 — Selection Engine (`core_selection`)

- **Status:** Accepted (M1.6 freeze, 2026-07-07)
- **Decision:** Ten frozen `SelectionShapeKind`s (rectangle, ellipse,
  polygon, lasso, brush, magic wand, quick select, ai select, select
  similar, select colour) and four `SelectionRefinementKind`s (grow,
  shrink, feather, inverse). Immutable `SelectionRegion` (UUID, kind,
  bounds, points, tolerance, colourHex, metadata), `SelectionSnapshot`
  (UUID, revision, regions + ordered refinements) and bounded,
  cursor-based `SelectionHistory` (push truncates the redo branch;
  undo/redo are pure moves).
- **Relationship to `core_interaction.SelectionState`:** interaction-level
  selection answers *which objects* (id set + modifier policy); this
  engine answers *which region* (geometry + technique). Tools use both;
  the Universal Canvas Contract exposes both.
- **Placement:** dedicated package on `core_geometry`.
