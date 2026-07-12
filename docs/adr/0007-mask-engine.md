# ADR-0007 — Mask Engine (`core_mask`)

- **Status:** Accepted (M1.6 freeze, 2026-07-07)
- **Decision:** Six frozen `MaskKind`s (layer, vector, brush, ai, clip,
  alpha), four `MaskBooleanOp`s (union, intersect, subtract, invert) and
  four `MaskRefinementKind`s (feather, expand, shrink, grow). Immutable
  `MaskModel` (UUID, name, kind, enabled, inverted, density, ordered
  refinements, optional bounds, metadata) and ordered `MaskStack`
  (per-target entries, each combined by a boolean op, composed
  immutably). Mask *evaluation/rasterisation* is a rendering concern of a
  later milestone; the description model is frozen now.
- **Placement:** dedicated package on `core_geometry`; masks are consumed
  by layers (by id), selections, AI scope masks and rendering alike, so
  they cannot live inside any single consumer.
