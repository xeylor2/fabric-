import 'package:core_color/core_color.dart';
import 'package:core_document/core_document.dart';
import 'package:core_geometry/core_geometry.dart';
import 'package:core_production/src/color/production_colour_bridge.dart';
import 'package:core_production/src/encode/production_encode.dart';
import 'package:core_production/src/jobs/production_job.dart';
import 'package:core_production/src/preflight/preflight.dart';
import 'package:core_production/src/render/production_render_bridge.dart';
import 'package:core_render/core_render.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'production_sheet.freezed.dart';
part 'production_sheet.g.dart';

/// The §12 production sheet — the "spec block": the terminal aggregation
/// of everything the production pipeline produced for one job, assembled
/// per the approved aggregation-boundary determination:
///
/// **Embedded** (immutable values this pipeline produced — the repo's
/// rule 1): the [PreflightReport], the [ReproducibilityRecord] (which
/// itself carries the `RenderTarget`; §12's "print-match is supported,
/// never promised" travels on the sheet), the [GamutReport], and the
/// [EncodeRequest]/[EncodeResult] lists (bounded by profile selection —
/// every request's fate is visible, incl. typed `unsupported`: the
/// no-silent-caps rule extended to the mill).
///
/// **Referenced** (document-owned or recorded elsewhere — rules 2/3):
/// the document by [documentId] + [revision] (the provenance ledger is
/// reachable through them, never copied); artboards and colour/print/
/// export profiles by id; and the deterministic `RenderGraph` through
/// the embedded record's frozen `(revision, target)` identity — the
/// graph is a pure function of that pair by the frozen `GraphCompiler`
/// contract and is NOT embedded (document-scale, reconstructible).
@freezed
abstract class ProductionSheet with _$ProductionSheet {
  const factory ProductionSheet({
    /// The job this sheet documents.
    required String jobId,

    required ProductionDeliverable deliverable,

    /// Exact physical output size + unit + DPI (§12: always embedded).
    required Size2D physicalSize,
    @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson)
    required MeasurementUnit unit,
    required double dpi,

    /// The produced document — id + revision (the provenance ledger is
    /// document-owned and reachable through this pair).
    required String documentId,
    required RevisionId revision,

    /// The produced artboards — ids only.
    @Default(<String>[]) List<String> artboardIds,

    /// The preflight verdict (embedded own-stage value).
    required PreflightReport preflight,

    /// Render provenance (embeds the target; pins the graph identity).
    required ReproducibilityRecord reproducibility,

    /// Colour outcome: profile references + the measured report.
    required String colourProfileId,
    String? printProfileId,
    required GamutReport gamutReport,

    /// The encode work orders and their typed fates, in selection order.
    @Default(<EncodeRequest>[]) List<EncodeRequest> encodeRequests,
    @Default(<EncodeResult>[]) List<EncodeResult> encodeResults,

    /// Version of the assembler that produced this sheet (the frozen
    /// provenance-versioning precedent).
    required String sheetVersion,

    @Default(<String, Object?>{}) Map<String, Object?> metadata,
  }) = _ProductionSheet;

  factory ProductionSheet.fromJson(Map<String, Object?> json) =>
      _$ProductionSheetFromJson(json);

  const ProductionSheet._();

  /// How many encode requests produced artefacts.
  int get encodedCount => encodeResults.whereType<EncodeEncoded>().length;

  /// How many encode requests answered `unsupported` (facts, not
  /// judgements — the caller decides whether to advance the stage; the
  /// approved completeness ruling: no blocking rule ships).
  int get unsupportedCount =>
      encodeResults.whereType<EncodeUnsupported>().length;
}

/// The Package-stage bridge contract: assembles the [ProductionSheet]
/// for an encode-completed job. A pure binder — zero layout, zero PDF,
/// zero policy (sheet *rendering* belongs to the Factory Preview /
/// feature slices; the `print_package` file is a future codec's encode
/// request).
abstract interface class ProductionPackageBridge {
  /// Version stamped into every produced [ProductionSheet.sheetVersion].
  String get version;

  /// Assembles the sheet for [job].
  ///
  /// Gated (the M12E/M13B/M13C/M13D precedent, extended one link — the
  /// approved chain-verification ruling): the job's `nextStage` must be
  /// [ProductionStage.package] ([StateError]); every prior artefact must
  /// belong to this job and chain by id — the colour plan to the job,
  /// the transform result to the colour plan's request, the encode plan
  /// to the job, and every encode result to one of the encode plan's
  /// requests ([ArgumentError] — completion is evidenced by artefact,
  /// never asserted).
  ProductionSheet assemble(
    ProductionJob job, {
    required PreflightReport preflight,
    required ProductionRenderPlan renderPlan,
    required ProductionColourPlan colourPlan,
    required ColourTransformResult transformResult,
    required ProductionEncodePlan encodePlan,
    required List<EncodeResult> encodeResults,
  });
}

/// Reference [ProductionPackageBridge] (M13E): pure aggregation per the
/// approved boundary — embeds own-stage values, references everything
/// document-owned, pins the graph through the record's frozen identity.
final class AssemblingProductionPackageBridge
    implements ProductionPackageBridge {
  const AssemblingProductionPackageBridge();

  @override
  String get version => 'production-sheet-1';

  @override
  ProductionSheet assemble(
    ProductionJob job, {
    required PreflightReport preflight,
    required ProductionRenderPlan renderPlan,
    required ProductionColourPlan colourPlan,
    required ColourTransformResult transformResult,
    required ProductionEncodePlan encodePlan,
    required List<EncodeResult> encodeResults,
  }) {
    if (preflight.jobId != job.id) {
      throw ArgumentError.value(
        preflight.jobId,
        'preflight',
        'Preflight verdict belongs to a different job than "${job.id}"',
      );
    }
    if (renderPlan.jobId != job.id) {
      throw ArgumentError.value(
        renderPlan.jobId,
        'renderPlan',
        'Render plan belongs to a different job than "${job.id}"',
      );
    }
    if (colourPlan.jobId != job.id) {
      throw ArgumentError.value(
        colourPlan.jobId,
        'colourPlan',
        'Colour plan belongs to a different job than "${job.id}"',
      );
    }
    if (transformResult.requestId != colourPlan.request.id) {
      throw ArgumentError.value(
        transformResult.requestId,
        'transformResult',
        'Transform result does not answer colour plan request '
            '"${colourPlan.request.id}"',
      );
    }
    if (encodePlan.jobId != job.id) {
      throw ArgumentError.value(
        encodePlan.jobId,
        'encodePlan',
        'Encode plan belongs to a different job than "${job.id}"',
      );
    }
    final requestIds = {for (final r in encodePlan.requests) r.id};
    for (final result in encodeResults) {
      final resultRequestId = switch (result) {
        EncodeEncoded(:final requestId) => requestId,
        EncodeUnsupported(:final requestId) => requestId,
      };
      if (!requestIds.contains(resultRequestId)) {
        throw ArgumentError.value(
          resultRequestId,
          'encodeResults',
          'Encode result answers a request outside the encode plan',
        );
      }
    }
    if (job.nextStage != ProductionStage.package) {
      throw StateError(
        'Job "${job.id}" is not at the package stage '
        '(next: ${job.nextStage?.wireName ?? 'complete'}); the frozen '
        '§12 order cannot be skipped',
      );
    }

    return ProductionSheet(
      jobId: job.id,
      deliverable: job.deliverable,
      physicalSize: job.physicalSize,
      unit: job.unit,
      dpi: job.dpi,
      documentId: job.documentId,
      revision: renderPlan.record.revision,
      artboardIds: job.artboardIds,
      preflight: preflight,
      reproducibility: renderPlan.record,
      colourProfileId: colourPlan.colourProfileId,
      printProfileId: colourPlan.printProfileId,
      gamutReport: transformResult.gamutReport,
      encodeRequests: encodePlan.requests,
      encodeResults: encodeResults,
      sheetVersion: version,
    );
  }
}

MeasurementUnit _unitFromJson(String wireName) =>
    MeasurementUnit.fromWireName(wireName);

String _unitToJson(MeasurementUnit unit) => unit.wireName;
