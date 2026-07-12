# M1 — Workspace Foundation (2026-07-06)

Scope: the visual and structural foundation of the FEBRIC OS. **No business
logic** — no AI, no document engine, no Design Tree logic, no canvas editing,
no export, no auth.

## Delivered

### Theme Engine (`core_design_system`) — Architecture V2, System 8
- 6 theme settings: **System, Light, Dark, Luxury Ivory, Luxury Maroon,
  Midnight** + **custom accent color** (presets + HSL picker).
- Token-based: `FebricColors` ThemeExtension (20 semantic tokens), typography
  (bundled **Inter**, OFL), spacing/radius/elevation/icon/motion/breakpoint
  scales, subtle glass, dot-grid canvas texture.
- **Contrast-guarded accents**: every accent (including hostile custom picks)
  is auto-adjusted to ≥3.0 vs surfaces and ≥4.5 for its foreground — enforced
  by unit tests (`contrast_test.dart`), treated as constitutional.
- Riverpod `FebricThemeController` + persistence seam
  (`FebricThemePreferenceStore`); app provides a shared_preferences store;
  choice survives restarts.
- **Zero hardcoded colors outside the design system** — enforced by
  `tooling/dependency_lint.dart` (rule 6) in CI.

### Adaptive Workspace Shell (`core_workspace`) — System 12
- **Desktop (≥1024):** top toolbar (command-palette affordance), collapsible
  sidebar (232↔60), center workspace, **resizable right Inspector
  (260–420)**, status bar with live window/breakpoint telemetry.
- **Tablet (600–1023):** navigation rail + Inspector as end-drawer.
- **Phone portrait:** app bar, 4 primary destinations + **More bottom sheet**.
- **Short windows (<500dp tall, incl. landscape phones):** slim icon rail.
- SafeArea everywhere; edge-to-edge with transparent system bars; keyboard
  insets handled; breakpoints derive from *window* size (split-screen and
  foldable ready).

### Navigation & modules
- go_router `StatefulShellRoute` with **9 preserved-state branches**:
  /dashboard /projects /library /design-tree /canvas /conversation
  /inspector /production /settings (deep-linkable, `/` redirects).
- 8 premium placeholder pages (module identity, package id, "Architecture
  ready", arrival milestone) in their own feature packages.
- **Settings foundation**: functional Appearance (theme + accent), placeholder
  Language / API / Workspace / Performance / Experimental, live About.

## Verification

| Gate | Result |
|---|---|
| `dart analyze --fatal-infos .` | No issues |
| `dart format` | Clean |
| `dart tooling/dependency_lint.dart` (now incl. color-token rule) | PASS |
| `bash tooling/test_all.sh` | **All 26 suites pass** (53 tests: contrast gates, theme engine, shell adaptivity per breakpoint, safe-area/keyboard fakes, router, theme switching/persistence) |
| Responsive sweep | 9 routes × 14 geometries (320×568 → 2560×1440, incl. 400×400 split-screen, foldable half, short-wide) — overflow-free |
| Screenshots | 9 PNGs in `m1-screenshots/` (real fonts/shadows) |
| `flutter build apk --debug` | Built |

Defects caught and fixed during M1 verification: mid-tone custom accents
failing the 4.5 foreground gate; status-bar overflow at narrow widths;
landscape phones landing in the tablet layout; debug banner in release UI;
hardcoded gradient in the accent picker.

## Known limitations (deferred by design)
- Command palette, keyboard shortcuts, context menus, dockable/persisted
  panel layout → workspace engine milestones (M6+). Panel sizes reset per run.
- Density modes (Compact/Comfortable/Professional) → M13.
- RTL audit and localization of UI strings → Language milestone (l10n
  structure is in place; UI copy is English-only in M1).
- Inspector on phones is hidden (desktop/tablet surface only in M1).
- Windows desktop build still requires Visual Studio locally; CI covers it.

Next: **M2 — Design Tree document core** (pending approval).
