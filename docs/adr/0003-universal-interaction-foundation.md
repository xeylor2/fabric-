# ADR-0003 — Universal Workspace Interaction Foundation (`core_interaction`)

- **Status:** Accepted (product owner mandate M1.5, 2026-07-07)
- **Context:** Every FEBRIC editing surface (canvas, repeat, all AI tools,
  tree preview) needs zoom/pan/gesture behaviour. Independent
  implementations would drift immediately — different zoom feels, different
  shortcuts, platform-specific bugs.

## Decisions

1. **One foundation package, `core_interaction`** (pure Dart, foundation
   tier: depends on nothing internal; enforced by dependency lint). It owns
   viewport/camera state and math, gesture contracts, zoom/pan/selection
   behaviour, animation and inertia specs. **No tool may implement its own
   zoom, pan or gesture logic** — this inheritance is mandatory for the
   frozen tool set and all future tools.
2. **Own geometry primitives** (`Point2D`/`Size2D`/`Rect2D`): pure Dart
   cannot use `dart:ui`; these are serializable and isolate/backend-safe.
   Shells convert at the boundary.
3. **`visibleRect` is derived, not stored**: computed from
   zoom/offset/rotation/screenSize so it can never disagree with them.
4. **Platform parity is a tested contract**: touch pinch ≡ trackpad pinch ≡
   primary-modifier+wheel; Ctrl ≡ Cmd; two-finger pan ≡ pointer pan. Devices
   are carried as data (`InputDevice`, incl. stylus for iPad pencil), never
   as behaviour branches.
5. **Universal policy defaults** (`InteractionConfig.standard`): bare wheel
   pans, primary-modifier+wheel zooms at cursor (configurable, Figma-style);
   double-tap smart zoom (below 100% → actual size at point, else fit);
   selection modifiers: primary toggles, shift adds, bare replaces.
6. **Zoom is always clamped** through `ZoomConstraints`; anchored zoom keeps
   the canvas point under the anchor fixed (unit-tested invariant); zoom
   animation interpolates geometrically; pan inertia decays exponentially.
7. **Wire names frozen** (same regime as ADR-0002): 9 `ZoomCommand`s,
   11 `GestureKind`s, devices, phases, shortcuts, selection modes, curves —
   append-only, pinned by freeze tests.

## Consequences

- Tool milestones receive interaction "for free" and identical UX.
- The Flutter shell's only job is translating raw input into
  `InteractionEvent`s at the boundary (a thin adapter, later milestone).
- Rendering (also later) consumes `ViewportState` as its camera transform.
