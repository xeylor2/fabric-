# M0 — Project Initialization (2026-07-06)

Scope: workspace scaffolding only — no business logic, UI features, AI, or editors.

## Delivered

- Dart **pub workspace** monorepo (26 members): `app` + 11 `core_*` engines + 14 `feature_*` modules,
  exactly per Architecture V2 §14/§16 (see ADR-0000/0001).
- Flutter app shell (`app/`): Windows + Android + iOS platforms, development/production
  entrypoints, Riverpod DI (ProviderScope + environment override + codegen provider via
  build_runner), go_router, gen-l10n localization structure, assets folders, widget smoke test.
- Every package: workspace pubspec with blueprint path-dependencies, blueprint `lib/src/`
  subfolders, barrel + package marker, smoke test, README, shared strict analysis options.
- Tooling: `tooling/dependency_lint.dart` (architecture rules), `tooling/test_all.sh`,
  `tooling/scaffold_m0.sh` (provenance).
- CI: `.github/workflows/ci.yaml` — format, workspace resolve, dependency lint,
  `dart analyze --fatal-infos`, all test suites, Windows debug build job.
- Docs: Architecture V2 blueprint, ADRs, this report. Root README, .gitignore.

## Verification results

- `dart analyze --fatal-infos .` — **No issues found** (workspace-wide).
- `dart format --set-exit-if-changed` — clean.
- `dart tooling/dependency_lint.dart` — PASS.
- `bash tooling/test_all.sh` — **all 26 suites passed**.
- `flutter build apk --debug` — see summary (Windows desktop build requires Visual Studio,
  not installed on this machine; CI covers it on windows-latest).

## Environment

Flutter 3.44.4 stable / Dart 3.12.2. Key deps: flutter_riverpod 3.3.2,
riverpod_annotation 4.0.3, riverpod_generator 4.0.4, go_router 17.3.0, intl 0.20.2,
build_runner 2.15.0.

## Notes

- Pre-existing `.git` history (old FABRIC v1 implementation) was preserved untouched;
  nothing was committed in M0.
- Pre-existing research PDFs remain in `docs/`.

Next: **M1 — Design-Tree document core + workspace shell v0** (pending approval).
