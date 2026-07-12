# FEBRIC Backend (placeholder)

AI orchestration service — scheduled for Phase 2 (Architecture V2, section 20).

Planned components (blueprint sections 10, 12 of Architecture V2):

- API gateway, job queue, orchestrator
- Provider adapters (segmentation, generation/inpainting, upscaling, embeddings)
- Textile Inspector pipeline, Conversation planner
- Embedding index, trend feed, render farm

No code lives here in M0. The Flutter client's `core_ai` package defines the
contracts this service will implement.
