/// FEBRIC AI Proposal Staging (M12A): the constitutional terminus of every
/// AI path.
///
/// Invariant I2 made structural: AI output becomes an [AiProposal]; only
/// explicit user acceptance emits frozen `DocumentCommand`s — through an
/// injected [DocumentCommandSink] with `CommandSource.ai` and a mandatory
/// `AiProvenanceRecord` (invariant I5). Architecture V2 §19: "AI Proposal
/// Staging (nothing skips it) → accept | reject | re-roll → Command Bus".
///
/// This package completes the back half of the frozen thirteen-stage
/// Universal AI Pipeline (ADR-0013) — history → document update → undo
/// stack → review → approval — by reusing the frozen `AiPipelineRun`
/// order enforcement. It lives above both `core_ai` and `core_document`
/// because `core_document` already depends on `core_ai` (provenance speaks
/// the provider vocabulary): staging cannot live inside `core_ai` without
/// a dependency cycle.
///
/// Blueprint: docs/architecture/architecture-v2.md (Architecture V2).
library;

export 'src/ai_proposal.dart';
export 'src/execution_orchestrator.dart';
export 'src/proposal_staging_area.dart';
export 'src/proposal_staging_contract.dart';
