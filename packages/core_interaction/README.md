# core_interaction — Universal Workspace Interaction Foundation

The **one interaction system** of the FEBRIC OS. Every editing surface —
Canvas Editor, Repeat Pattern, Print Ready Enhancement, Enhance Model Cloth,
Motif Refinement, Redesign Textile Print, Colour Shift, Design Tree preview,
and every future AI tool — **inherits this foundation. No tool implements
its own zoom, pan or gesture logic** (ADR-0003, mandatory).

**Pure Dart.** No rendering, no widgets, no Flutter UI, no platform code.
Immutable (freezed), serializable, isolate-safe.

## Architecture

```
             raw platform input (Flutter shell, later milestone)
                              │  translated at the boundary
                              ▼
   ┌──────────────── InteractionEvent (sealed) ────────────────┐
   │ tap · doubleTap · longPress · drag · pan · pinch · wheel  │
   │ · shortcut          + InputDevice · GesturePhase ·        │
   │                       KeyModifiers                        │
   └────────────────────────────┬──────────────────────────────┘
                                ▼
              ViewportInteractionMapper (universal policy)
        parity: touch pinch ≡ trackpad pinch ≡ Ctrl/Cmd+wheel
                                ▼
   ViewportState ──ViewportOps──► ViewportState'
   zoom · offset · rotation ·        fit / actual / to-rect /
   canvasSize · screenSize ·         to-cursor / step / reset /
   visibleRect · dpr                 pan / rotate  (all clamped)
                                │
        ViewportAnimation (geometric zoom lerp) · InertiaSpec
        NavigationState (view history) · SelectionState/Mode
```

## Frozen contracts (tested)

- **9 zoom rules** (`ZoomCommand`): default, fit screen, actual size,
  to selection, to object, to cursor, in, out, reset.
- **11 gesture contracts** (`GestureKind`): tap, double tap, long press,
  drag, pan, pinch zoom, two-finger pan, rotate, mouse-wheel zoom,
  trackpad pinch, keyboard shortcut.
- **Platform parity**: Android / iPad / Windows / desktop; touch / mouse /
  trackpad / stylus — one policy, enforced by parity unit tests, never by
  per-platform branches.
- **UX guarantees**: anchored zoom keeps the point under cursor/finger
  fixed (invariant test); smooth zoom animates geometrically; pan inertia
  decays exponentially; fit/center/double-tap-smart-zoom are deterministic.

## Consumers

`core_rendering` (viewport → render transform), `core_workspace` (shortcut
surface), every tool feature. Depends on **nothing** internal — foundation
tier beside `core_common`/`core_textile` (enforced by dependency lint).
