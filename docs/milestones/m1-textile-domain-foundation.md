# M1 (part 3) — Textile Domain Foundation (2026-07-06)

Completes M1 by establishing the permanent textile vocabulary in a new
foundation package, **`core_textile`** (pure Dart — no Flutter, no UI, no AI,
no networking, no providers, no platform code). Governed by **ADR-0002**.

## Delivered vocabulary (all wire-name-frozen by tests)

| Group | Types |
|---|---|
| Garments | `GarmentType` — kurta, pant, dupatta, shawl, saree, abaya |
| Garment parts | `GarmentPart` (21) + `GarmentAnatomy` — kurta (12 parts, exactly as mandated), dupatta (7), pant (4), plus canonical-initial shawl/saree/abaya |
| Textile objects | `TextileObjectType` — motif, pattern, border, texture, colour palette, fabric, embroidery, lace, patch, print layer |
| Repeats | `RepeatType` — straight, half drop, half brick, mirror, diamond, toss, custom offset, seamless |
| Colour ops | `ColourOperation` — shift motif colour, shift base colour, global colour shift, palette swap |
| AI ops | `AiOperation` — print ready enhancement, enhance model cloth, motif refinement, redesign textile print, background cleanup, fabric restoration |
| Design Tree | `DesignNodeType` (project/artwork/garment/garment part/zone/element/group) + immutable **`DesignNode`** (freezed + json_serializable): id, name, type, children, metadata, visible, locked, selected — plus pure traversal helpers |
| Workspace | `WorkspaceCategory` (10, **Tools now permanent**) |
| Tools | `FebricTool` (frozen six: repeat pattern, print ready enhancement, enhance model cloth, motif refinement, redesign textile print, colour shift) + `febricToolRegistry` binding each tool to its domain operations |

## Contracts established

- **Wire-name stability**: every enum carries an explicit snake_case
  `wireName`; `fromWireName` fails loudly on unknown input; exact lists are
  pinned by `vocabulary_freeze_test.dart` (append-only; changes need an ADR).
- **100% immutable**: freezed models, const registries, no setters, no TODOs.
- **British spelling** (`Colour…`) is canonical domain vocabulary.
- **Invariant hooks**: `locked` (I4) and `redesign_textile_print` as the only
  whole-artwork operation (I6) are encoded in the vocabulary itself.

## Verification

| Gate | Result |
|---|---|
| `dart test` (core_textile) | 30/30 pass — freeze, anatomy, JSON round-trip, immutability, traversal, registry |
| `dart analyze --fatal-infos .` | No issues (workspace-wide) |
| `dart tooling/dependency_lint.dart` | PASS — core_textile added to pure-Dart + dependency-free enforcement |
| `bash tooling/test_all.sh` + debug APK | see M1 completion report |

## Integration

- Workspace member #27; app composition root depends on it.
- Blueprint §14/§16 amended (ADR-0002); package README carries the
  vocabulary map and consumer diagram.
- `explicit_to_json` enabled so nested `DesignNode` trees serialize to plain
  JSON — the shape `.febric` documents will reuse in M2.

Next: **M2 — Design Tree document engine** consumes this vocabulary
(pending approval). M3 does not start without it.
