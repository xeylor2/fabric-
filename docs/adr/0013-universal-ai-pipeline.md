# ADR-0013 — Universal AI Pipeline (`core_ai/src/pipeline`)

- **Status:** Accepted (M1.6 freeze, 2026-07-07)
- **Decision:** Every AI provider and every AI operation flows through the
  frozen thirteen-stage pipeline: conversation → prompt compiler →
  constraint engine → provider adapter → execution → response parser →
  validation → history → document update → undo stack → review →
  approval → production ready. `AiPipelineRun` (freezed, JSON) records
  progress and makes order **unskippable by construction**: `advanceTo`
  throws on any non-successor stage — document update is unreachable
  before validation, approval unreachable before review.
- **Invariants encoded structurally:** I1 (document update lands via the
  command bus onto the undo stack), I2 (review/approval gate acceptance),
  I3/I4 (constraint engine precedes execution; lock-derived constraints),
  I5 (the history stage records provenance), I6 (whole-print redesign is
  its own labelled `AiOperation`, already frozen in ADR-0002).
- **Provider neutrality:** the pipeline is identical for Claude, Gemini,
  GPT, Nano Banana and any future provider; adapters differ only inside
  the provider-adapter stage (ADR-0009).
- **Placement:** `core_ai`, beside the prompt compiler it extends — one
  package owns the complete AI contract surface.
