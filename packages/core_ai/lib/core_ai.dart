/// FEBRIC AI engine: job model, provider abstraction, API Manager, proposal
/// staging, conversation and inspection pipelines.
///
/// M1.6 freeze (ADR-0009, ADR-0013): the Prompt Compiler pipeline and the
/// Universal AI Pipeline contracts live here — every provider is reached
/// only through a `ProviderAdapter`, which by type can receive nothing but
/// a `CompiledPrompt`.
///
/// Blueprint: docs/architecture/architecture-v2.md (Architecture V2).
library;

export 'src/api_manager/job_router.dart';
export 'src/api_manager/provider_profile.dart';
export 'src/conversation/prompt_compilation.dart';
export 'src/conversation/prompt_template.dart';
export 'src/core_ai_package.dart';
export 'src/credits/credit_estimate.dart';
export 'src/inspection/inspection_report.dart';
export 'src/jobs/ai_job.dart';
export 'src/pipeline/ai_pipeline.dart';
export 'src/prompt/ai_provider_id.dart';
export 'src/prompt/prompt_pipeline.dart';
export 'src/providers/execution_outcome.dart';
export 'src/providers/provider_adapter_registry.dart';
