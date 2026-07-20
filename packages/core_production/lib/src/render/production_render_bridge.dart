import 'package:core_document/core_document.dart';
import 'package:core_production/src/jobs/production_job.dart';
import 'package:core_production/src/preflight/preflight.dart';
import 'package:core_render/core_render.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'production_render_bridge.freezed.dart';
part 'production_render_bridge.g.dart';

/// The deterministic §12 Render-stage plan for one preflight-passed
/// [ProductionJob]: the frozen production-export [RenderTarget], the
/// frozen [RenderGraph] the isolate/backend farm will rasterise, and the
/// frozen [ReproducibilityRecord] binding document revision × target ×
/// declared backend identity ("print-match is supported, never
/// promised").
///
/// Plan granularity is the frozen `GraphCompiler` contract's granularity
/// — one graph per (document, target); the M6-documented single-artboard
/// runtime. Per-panel decomposition (§12 "per panel/tile") beyond the
/// graph's frozen tile keys arrives with the garment-schema slices. The
/// job's [artboardIds] ride as declared references.
///
/// Colour-space fields inside [target] and [record] carry their frozen
/// defaults untouched (the approved colour-space determination: render
/// happens in working space; CMYK is the recorded destination; the Color
/// slice owns conversion and mill profiles).
@freezed
abstract class ProductionRenderPlan with _$ProductionRenderPlan {
  const factory ProductionRenderPlan({
    /// The job this plan renders.
    required String jobId,

    /// The job's declared artboard references — ids only.
    @Default(<String>[]) List<String> artboardIds,

    /// The frozen production-export target (kind `production_export`,
    /// full resolution, off-screen; all other fields frozen defaults).
    required RenderTarget target,

    /// The deterministic frozen render graph — the farm's work-list.
    required RenderGraph graph,

    /// The frozen export-provenance record.
    required ReproducibilityRecord record,

    @Default(<String, Object?>{}) Map<String, Object?> metadata,
  }) = _ProductionRenderPlan;

  factory ProductionRenderPlan.fromJson(Map<String, Object?> json) =>
      _$ProductionRenderPlanFromJson(json);
}

/// The Render-stage bridge contract: derives the deterministic client
/// half of §12 Render — target, graph, provenance — for a
/// preflight-passed job. Pure and synchronous: rasterisation belongs to
/// the isolate/backend farm behind the frozen `RenderBackend` seam.
abstract interface class ProductionRenderBridge {
  /// Plans the render stage for [job] against [document].
  ///
  /// Gated twice (the M12E validated-gate precedent): [preflight] must be
  /// the verdict for exactly this job ([ArgumentError] otherwise) and
  /// must have passed, and the job's `nextStage` must be
  /// [ProductionStage.render] ([StateError] otherwise) — the frozen §12
  /// order cannot be skipped.
  ProductionRenderPlan plan(
    ProductionJob job,
    FebricDocument document, {
    required PreflightReport preflight,
  });
}

/// Reference [ProductionRenderBridge] (M13B): pure composition of frozen
/// contracts — zero policy, zero pixels.
///
/// - Derives the frozen production-export target: `production_export`,
///   `fullResolution: true`, `onScreen: false`; every other field —
///   colour space, coordinate system, passes — keeps its frozen default
///   (the approved colour-space determination; pass selection is a
///   rasterisation concern for the farm slices).
/// - Compiles the frozen [RenderGraph] through the **injected** frozen
///   [GraphCompiler] (reference: the frozen `RenderGraphCompiler`) —
///   compilation is delegated, never reimplemented (the M11
///   injected-seam pattern).
/// - Assembles the frozen [ReproducibilityRecord] from the document's
///   revision, the derived target and the **declared** backend identity/
///   determinism (Q4: data supplied by the caller, defaulting to the
///   frozen headless backend's identity — no backend runs here).
final class CompilingProductionRenderBridge implements ProductionRenderBridge {
  CompilingProductionRenderBridge({
    GraphCompiler? compiler,
    this.backendId = 'headless',
    this.determinism = RenderDeterminismLevel.backendExact,
  }) : _compiler = compiler ?? RenderGraphCompiler();

  final GraphCompiler _compiler;

  /// Declared backend identity recorded into export provenance — the
  /// frozen `HeadlessRenderBackend` default identity unless the caller
  /// declares the real farm backend.
  final String backendId;

  /// Declared determinism level (frozen vocabulary) recorded into
  /// export provenance.
  final RenderDeterminismLevel determinism;

  @override
  ProductionRenderPlan plan(
    ProductionJob job,
    FebricDocument document, {
    required PreflightReport preflight,
  }) {
    if (preflight.jobId != job.id) {
      throw ArgumentError.value(
        preflight.jobId,
        'preflight',
        'Preflight verdict belongs to a different job than "${job.id}"',
      );
    }
    if (!preflight.passed) {
      throw StateError(
        'Job "${job.id}" failed preflight '
        '(${preflight.findings.length} finding(s)); a blocked job is '
        'never planned for render',
      );
    }
    if (job.nextStage != ProductionStage.render) {
      throw StateError(
        'Job "${job.id}" is not at the render stage '
        '(next: ${job.nextStage?.wireName ?? 'complete'}); the frozen '
        '§12 order cannot be skipped',
      );
    }

    const target = RenderTarget(
      kind: RenderTargetKind.productionExport,
      fullResolution: true,
      onScreen: false,
    );
    final graph = _compiler.compile(document, target);
    final record = ReproducibilityRecord(
      revision: document.revision,
      target: target,
      backendId: backendId,
      determinismLevel: determinism.wireName,
    );

    return ProductionRenderPlan(
      jobId: job.id,
      artboardIds: job.artboardIds,
      target: target,
      graph: graph,
      record: record,
    );
  }
}
