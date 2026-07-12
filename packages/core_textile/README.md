# core_textile — Textile Domain Foundation

The **permanent textile vocabulary** of the FEBRIC Operating System. Every
engine — document, garment, rendering, AI, production — speaks these types.
No string literals, no magic values, everything strongly typed and
serialization-stable.

**Pure Dart.** No Flutter, no UI, no AI, no networking, no providers, no
platform code. Governed by ADR-0002; wire names are frozen by tests.

## Vocabulary map

```
                        ┌────────────────────────────┐
                        │        core_textile        │
                        └────────────────────────────┘
   GARMENTS                    OBJECTS                    OPERATIONS
   GarmentType (6)             TextileObjectType (10)     ColourOperation (4)
   GarmentPart (21)            motif · pattern · border   AiOperation (6)
   GarmentAnatomy              texture · colour palette   RepeatType (8)
     kurta → 12 parts          fabric · embroidery
     dupatta → 7 parts         lace · patch · print layer
     pant → 4 parts
     shawl / saree / abaya

   DESIGN TREE                 WORKSPACE
   DesignNodeType (7)          WorkspaceCategory (10, incl. Tools — permanent)
   DesignNode (freezed,        FebricTool (6, frozen) + febricToolRegistry
     json, immutable):           repeat_pattern · print_ready_enhancement
     id · name · type ·          enhance_model_cloth · motif_refinement
     children · metadata ·       redesign_textile_print · colour_shift
     visible · locked ·
     selected
```

## Consumers (dependency direction: everything → core_textile)

```
core_document ─┐
core_garment ──┤
core_ai ───────┼──►  core_textile  ──► (nothing)
core_color ────┤
features ──────┘
```

## Contracts

- **Wire names are frozen.** Every enum carries a `wireName` used in
  `.febric` documents, AI payloads and content packs. `fromWireName` throws
  on unknown names — corrupt data fails loudly. `test/vocabulary_freeze_test.dart`
  pins the exact lists; changing one requires an ADR.
- **British spelling** (`Colour…`) is the product owner's domain vocabulary
  and is used consistently across the domain layer.
- **DesignNode is immutable** (freezed). Mutation happens only by building
  new trees via `copyWith` under the command bus (invariant I1); `locked`
  nodes reject all mutation (invariant I4); `redesign_textile_print` is the
  only whole-artwork AI operation and is always its own labelled tool
  (invariant I6).
