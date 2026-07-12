# FEBRIC

**Professional AI Textile Design Operating System**

FEBRIC is not an AI image generator. It is a professional textile design OS where
every garment element — motifs, borders, pallus, sleeves, necklines, grounds — is
independently editable, and AI acts only as a scoped, user-approved assistant.

The permanent blueprint is **Architecture V2**: [`docs/architecture/architecture-v2.md`](docs/architecture/architecture-v2.md).

## Repository layout

```
fabric-/
├─ app/                  # Flutter application (composition root, shells, DI, routing)
├─ packages/             # 36 packages: 22 core engines + 14 feature modules
│  ├─ core_*             # engines: document/design-tree, asset, garment, rendering,
│  │                     #   imaging, color, ai, workspace, design system, foundations
│  └─ feature_*          # vertical feature surfaces (never import each other)
├─ content/              # garment schemas & template content packs (data, not code)
├─ backend/              # AI orchestration service (placeholder — later milestone)
├─ docs/                 # architecture blueprint, ADRs, milestone reports
├─ tooling/              # dependency lint, test runner, scaffolding
└─ .github/workflows/    # CI (format, analyze, dependency lint, tests, Windows build)
```

## Architecture rules (enforced in CI)

- Clean Architecture per module: `presentation → domain ← data`, inward-only.
- `app → features → core → nothing`. **Feature-to-feature imports are forbidden.**
- `core_common`, `core_document`, `core_garment`, `core_color`, `core_ai`,
  `core_assets` are **pure Dart** (no Flutter) — they run in isolates and on the backend.
- Every mutation goes through the command bus; AI output is always staged, never auto-applied.
- Rules are checked by `dart tooling/dependency_lint.dart`.

## Getting started

```bash
# Resolve the whole workspace (pub workspace — single lockfile at the root)
cd app && flutter pub get

# Run (development environment, Windows desktop)
flutter run -t lib/main_development.dart -d windows

# Production entrypoint
flutter build windows -t lib/main_production.dart
```

## Quality gates

```bash
dart format app/lib app/test packages tooling   # formatting
dart analyze --fatal-infos .                    # strict analysis (root analysis_options.yaml)
dart tooling/dependency_lint.dart               # architecture dependency rules
bash tooling/test_all.sh                        # all package test suites
dart run build_runner build -d                  # codegen (run inside app/)
```

## Environments

| Entrypoint | Environment |
|---|---|
| `lib/main_development.dart` | Development (verbose provider logging) |
| `lib/main_production.dart` | Production |
| `lib/main.dart` | Delegates to development (bare `flutter run`) |

## Status

**M4 — Asset Engine complete** (tagged `FEBRIC_V2_FOUNDATION`). Engine
foundations are built and frozen through the Document, Design Tree, and Asset
engines; feature surfaces beyond M1 (theme, shell, settings) remain
skeletons. Implementation proceeds engine-first per the roadmap in the
architecture blueprint (section 20, amended by ADR-0017). Next: **M5A —
Canvas Engine** (`core_rendering`).

Point-in-time inventory: [`docs/architecture/snapshot-v2-foundation.md`](docs/architecture/snapshot-v2-foundation.md).
