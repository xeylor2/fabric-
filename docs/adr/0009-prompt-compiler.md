# ADR-0009 — Prompt Compiler Architecture (`core_ai/src/prompt`)

- **Status:** Accepted (M1.6 freeze, 2026-07-07)
- **Decision:** Frozen ten-stage prompt pipeline — conversation → intent
  parser → context builder → constraint engine → prompt compiler →
  template engine → provider adapter → prompt validator → execution →
  result — with typed stage interfaces (`IntentParser`, `ContextBuilder`,
  `ConstraintEngine`, `PromptCompiler`, `PromptValidator`,
  `ProviderAdapter`) and freezed artefacts (`ConversationInput`,
  `PromptIntent`, `PromptContext` incl. `LockSet`, `PromptConstraint`,
  `PromptSegment`, `CompiledPrompt`, `PromptValidation`,
  `ProviderResponse`). Frozen provider vocabulary: **Claude, Gemini, GPT,
  Nano Banana** (append-only) plus `AiCapability` classes for routing.
- **The structural guarantee:** `ProviderAdapter.submit` accepts **only**
  `CompiledPrompt`. No provider can receive raw conversation — the type
  system, not convention, enforces the mandate. Constraints (including
  lock-derived ones) are attached to the compiled prompt and re-validated
  after execution.
- **Placement:** merged into `core_ai` rather than a separate
  `core_prompt`: the compiler *is* the AI engine's front half; the two
  could never version independently, and a split would force every AI
  consumer to depend on both. (`core_ai` gains foundation deps
  `core_lock` + `core_textile`; it remains pure Dart and vendor-blind —
  concrete adapters live in data layers per Architecture V2 §16.)
