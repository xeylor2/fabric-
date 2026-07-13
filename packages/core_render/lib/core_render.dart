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
export 'src/queue/render_work_item.dart';
export 'src/repository/render_cache_repository.dart';
export 'src/resource/resource.dart';
export 'src/target/render_target.dart';
export 'src/vocabulary/render_vocabulary.dart';
