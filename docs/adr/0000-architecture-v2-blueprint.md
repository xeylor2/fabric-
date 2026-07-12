# ADR-0000 — Architecture V2 is the permanent blueprint

- **Status:** Accepted (approved by product owner, 2026-07-06)
- **Context:** FEBRIC requires a structural guarantee that the user controls the
  design and AI only assists. Architecture V1 established Clean Architecture, the
  command-sourced document engine, and AI proposal staging; V2 extended it with the
  Design Tree, Garment engines, Conversation AI, Inspector, Asset Intelligence,
  Theme Engine, API Manager, Dashboard, Production module, and desktop-first workspace.
- **Decision:** `docs/architecture/architecture-v2.md` is the permanent blueprint.
  All implementation must conform. Changes require a new ADR.
- **Consequences:** CI enforces the dependency rules (`tooling/dependency_lint.dart`);
  the module set, dependency graph, and constitutional invariants I1–I6 are binding.

## ADR-0001 (recorded here for M0) — Pub workspace instead of Melos

- **Status:** Accepted
- **Context:** The blueprint's folder sketch listed `melos.yaml`. Since then, Dart pub
  workspaces became the first-party monorepo mechanism (and Melos 7 itself builds on
  them). The repo uses a root `pubspec.yaml` with `workspace:` + `resolution: workspace`
  in every member: one lockfile, one resolution, one analysis context.
- **Decision:** Native pub workspace; `tooling/` scripts replace Melos scripts.
  Melos can be layered on later without restructuring. Architecture is unaffected —
  module structure, package names, and dependency rules are exactly as specified.
