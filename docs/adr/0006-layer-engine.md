# ADR-0006 — Layer Engine (`core_layer`)

- **Status:** Accepted (M1.6 freeze, 2026-07-07)
- **Decision:** Frozen compositing vocabulary: twelve `LayerKind`s (layer,
  group, folder, artboard, reference, image, vector, text, pattern, ai,
  adjustment, mask) and sixteen standard `FebricBlendMode`s (en-GB wire
  names: `colour_dodge`, `colour_burn`, `colour`, …). Immutable
  `LayerModel` (freezed, JSON): UUID, name, kind, recursive children
  (order = z-order), blend mode, opacity, hidden, locked, pinned,
  favourite, tags, metadata, maskIds; pure traversal helpers only.
- **Relationship to `DesignNode` (core_textile):** `DesignNode` is the
  *semantic* textile tree (garments, parts, zones); `LayerModel` is the
  *compositing* structure. The document engine (M2) binds them — a design
  node renders through one or more layers. They are deliberately separate
  vocabularies; neither package references the other.
- **Placement:** dedicated dependency-free package (masks referenced by
  id; lock authority stays in `core_lock`) so renderer, document engine
  and plugins share it without coupling.
