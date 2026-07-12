# ADR-0004 — M1.6 Foundation Freeze (overview)

- **Status:** Accepted (product owner mandate M1.6, 2026-07-07)
- **Context:** Before `core_document` exists, every contract it and all
  future tools will inherit must be frozen: locks, layers, masks,
  selections, prompt compilation, plugins, performance, and the universal
  tool/canvas/AI surfaces. Freezing after implementation would mean
  retrofitting — the classic path to architectural drift.

## Decisions

1. Ten engines frozen as **pure architecture** (immutable freezed models +
   `abstract interface class` contracts). Zero implementation, zero UI,
   zero rendering, zero business logic.
2. **Package placement** (reasoning per ADR-0005…0013):
   - New foundation packages: `core_geometry` (extracted from
     `core_interaction` so mask/selection/tooling can share primitives
     without depending on interaction), `core_lock`, `core_layer`,
     `core_mask`, `core_selection`, `core_plugin`, `core_performance`,
     `core_tooling`.
   - **Merged into `core_ai`**: Prompt Compiler + Universal AI Pipeline —
     they *are* the AI engine's contract; a separate `core_prompt` would
     force every AI consumer to depend on two packages that can never
     change independently.
   - Nothing merged into `core_document` (it must not exist yet) or
     `core_workspace` (Flutter-tainted; foundations must stay pure).
3. Wire-name freeze regime (ADR-0002) extends to every new vocabulary.
4. Dependency-free tier is now {common, geometry, textile, lock, plugin};
   all M1.6 packages are pure Dart — both facts enforced by
   `tooling/dependency_lint.dart`.

Master document: `docs/architecture/foundation-freeze.md` (diagrams,
dependency rules, API surface, migration notes, acceptance criteria,
testing strategy).
