# FEBRIC Content

Garment schemas and template content packs — **data, not code** (Architecture V2,
sections 2–3). Shipped and versioned independently of app releases.

```
content/
├─ schemas/   # GarmentSchema definitions (kurta.json, pant.json, dupatta.json, parts/…)
└─ packs/     # template content packs (e.g. pakistani_luxury_lawn/, eid_collection/)
```

Authoring begins in Phase 1 alongside the Garment Structure Engine (`core_garment`).
Schemas are validated in CI against the schema meta-spec once it lands.
