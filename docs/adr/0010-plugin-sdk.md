# ADR-0010 — Plugin SDK (`core_plugin`)

- **Status:** Accepted (M1.6 freeze, 2026-07-07)
- **Decision:** Marketplace-ready extension architecture, frozen as:
  - `PluginManifest` (freezed): reverse-domain id, `SemVer` version,
    `apiVersion`, `minHostVersion`, permissions, sandbox, events,
    description/author/homepage/category.
  - Seven `PluginPermission`s with an `elevated` flag; elevated
    permissions (mutate document, use AI credits, network) require
    marketplace review + explicit user grant (`requiresReview`).
  - Eight `PluginLifecycleState`s (discovered → validated → installed →
    enabled → active; suspended/disabled/uninstalled).
  - Two `PluginSandbox` levels — **plugin code never runs in the host
    isolate** (isolate sandbox default, process sandbox for heavy/native).
  - Six `PluginEventKind`s (append-only) and `PluginCommand`
    contributions (command palette / context menus).
  - Interfaces: `PluginRegistry`, `PluginHost` (JSON-only dispatch —
    plugins never hold engine object references), `PluginSecurityPolicy`.
  - `PluginCompatibility` freezes the rule: same `apiVersion` ∧ host ≥
    `minHostVersion`.
- **Placement:** dedicated dependency-free package — the SDK must not drag
  engines into plugin space; plugins reach engines only through the
  host's JSON command surface, which also satisfies the dependency rules
  (a plugin cannot bypass locks, staging, or the command bus).
