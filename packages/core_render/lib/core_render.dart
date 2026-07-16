/// FEBRIC Rendering Constitution (M5B-1) — the pure-Dart frozen contracts.
///
/// This package realizes the approved Rendering Constitution (Blueprint
/// Rev. 3) as immutable models, frozen vocabularies, abstract contracts and
/// the cache-repository seam. **It contains no rendering, no render-graph
/// compilation, no queue/scheduler execution, no GPU, no Flutter, no
/// Impeller, no presentation, no draw recording, no rasterization** — those
/// are M5B-2 (headless services) and M5B-3 (the `core_render_impeller`
/// driver).
///
/// It composes the frozen foundations (`core_canvas`, `core_interaction`,
/// `core_tooling`, `core_performance`, `core_layer`, `core_geometry`,
/// `core_textile`, `core_document`, `core_asset`) and never redefines them.
/// Rendering is a read-only projection of the document (R1): nothing here
/// emits a `DocumentCommand`.
library;

export 'src/backend/backend_capabilities.dart';
export 'src/constitution/render_constitution.dart';
export 'src/context/render_context.dart';
export 'src/contracts/render_contracts.dart';
export 'src/determinism/reproducibility_record.dart';
export 'src/frame/frame_budget.dart';
export 'src/graph/render_graph.dart';
export 'src/objects/render_object.dart';
export 'src/observability/render_metrics.dart';
export 'src/pass/render_pass.dart';
// M5B-4 platform rendering runtime — executes the recorded stream (pure Dart;
// platform behaviour lives only in backend adapters; the real Flutter/GPU
// driver arrives in the presentation-layer milestone).
export 'src/platform/platform_capability_detector.dart';
export 'src/platform/platform_rendering_runtime.dart';
export 'src/platform/reference_backend_adapter.dart';
export 'src/platform/render_command_executor.dart';
export 'src/platform/render_platform.dart';
export 'src/platform/render_surface_runtime.dart';
export 'src/platform/rendered_frame.dart';
export 'src/queue/render_work_item.dart';
// M5B-3 backend-independent command recording runtime (pure Dart).
export 'src/recording/backend_capability_runtime.dart';
export 'src/recording/command_buffer.dart';
export 'src/recording/command_recording_runtime.dart';
export 'src/recording/recording_render_backend.dart';
export 'src/recording/render_command.dart';
export 'src/recording/render_command_encoder.dart';
export 'src/repository/render_cache_repository.dart';
export 'src/resource/resource.dart';
// M5B-2 headless runtime services (pure Dart; implement the M5B-1 contracts).
export 'src/runtime/cull_runtime.dart';
export 'src/runtime/design_node_producers.dart';
export 'src/runtime/dirty_region.dart';
export 'src/runtime/frame_lifecycle_runtime.dart';
export 'src/runtime/headless_backend.dart';
export 'src/runtime/headless_renderer.dart';
export 'src/runtime/render_graph_compiler.dart';
export 'src/runtime/render_pass_runtime.dart';
export 'src/runtime/render_pipeline_runtime.dart';
export 'src/runtime/render_queue_runtime.dart';
export 'src/runtime/resource_registry_runtime.dart';
export 'src/target/render_target.dart';
export 'src/vocabulary/render_vocabulary.dart';
