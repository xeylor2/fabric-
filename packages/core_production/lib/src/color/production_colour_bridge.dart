import 'package:core_color/core_color.dart';
import 'package:core_document/core_document.dart';
import 'package:core_production/src/jobs/production_job.dart';
import 'package:core_production/src/render/production_render_bridge.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'production_colour_bridge.freezed.dart';
part 'production_colour_bridge.g.dart';

/// The §12 Color-stage plan for one rendered [ProductionJob]: the
/// reference-based [ColourTransformRequest] the ICC slice will execute
/// ("ICC-managed CMYK, profile per mill" — the profile is document
/// data, referenced by id), and the slot its [GamutReport] lands in
/// once a transformer runs.
@freezed
abstract class ProductionColourPlan with _$ProductionColourPlan {
  const factory ProductionColourPlan({
    /// The job this plan colours.
    required String jobId,

    /// The frozen `ColourProfile` governing the conversion — id only.
    required String colourProfileId,

    /// The frozen `PrintProfile` (physical output intent) — id only,
    /// when the mill target is declared.
    String? printProfileId,

    /// The work order for the colour-science slices (synchronous seam;
    /// the approved execution-shape determination).
    required ColourTransformRequest request,

    /// The measured report — null until a transformer runs (later
    /// slices; "soft-proofing" and stage advancement follow it).
    GamutReport? gamutReport,

    @Default(<String, Object?>{}) Map<String, Object?> metadata,
  }) = _ProductionColourPlan;

  factory ProductionColourPlan.fromJson(Map<String, Object?> json) =>
      _$ProductionColourPlanFromJson(json);
}

/// The Color-stage bridge contract: binds a rendered job to the
/// document's frozen colour/print profiles and derives the transform
/// work order. Pure and synchronous — no science, no pixels.
abstract interface class ProductionColourBridge {
  /// Plans the colour stage for [job] against [document].
  ///
  /// Gated (the M12E/M13B precedent): [renderPlan] must belong to
  /// exactly this job ([ArgumentError] otherwise); the job's
  /// `nextStage` must be [ProductionStage.color] ([StateError]
  /// otherwise — the frozen §12 order cannot be skipped);
  /// [colourProfileId] (and [printProfileId], when given) must exist on
  /// the document ([ArgumentError] — an unresolvable profile is a
  /// caller error, never a fabricated conversion).
  ProductionColourPlan plan(
    ProductionJob job,
    FebricDocument document, {
    required ProductionRenderPlan renderPlan,
    required String colourProfileId,
    String? printProfileId,
  });
}

/// Reference [ProductionColourBridge] (M13C): pure profile binding —
/// zero policy, zero science.
///
/// - Resolves the frozen `ColourProfile`/`PrintProfile` on the document
///   by id (existence-checked; "profile per mill" stays document data).
/// - Derives the reference-based [ColourTransformRequest]: sources are
///   the render plan's graph-object ids (the M13B work-list), the
///   source space is the render target's recorded working space (read
///   from the frozen value — the colour vocabulary is never named, per
///   the approved M13B determination), and the target space is the
///   profile's frozen `space` identifier verbatim.
final class BindingProductionColourBridge implements ProductionColourBridge {
  const BindingProductionColourBridge();

  @override
  ProductionColourPlan plan(
    ProductionJob job,
    FebricDocument document, {
    required ProductionRenderPlan renderPlan,
    required String colourProfileId,
    String? printProfileId,
  }) {
    if (renderPlan.jobId != job.id) {
      throw ArgumentError.value(
        renderPlan.jobId,
        'renderPlan',
        'Render plan belongs to a different job than "${job.id}"',
      );
    }
    if (job.nextStage != ProductionStage.color) {
      throw StateError(
        'Job "${job.id}" is not at the color stage '
        '(next: ${job.nextStage?.wireName ?? 'complete'}); the frozen '
        '§12 order cannot be skipped',
      );
    }
    final colourProfile = document.colourProfiles
        .where((p) => p.id == colourProfileId)
        .firstOrNull;
    if (colourProfile == null) {
      throw ArgumentError.value(
        colourProfileId,
        'colourProfileId',
        'Colour profile not found on the document',
      );
    }
    if (printProfileId != null &&
        !document.printProfiles.any((p) => p.id == printProfileId)) {
      throw ArgumentError.value(
        printProfileId,
        'printProfileId',
        'Print profile not found on the document',
      );
    }

    final request = ColourTransformRequest(
      id: 'colour-${job.id}',
      sourceReferences: [
        for (final object in renderPlan.graph.objects) object.id,
      ],
      // The render target's recorded working space (frozen default;
      // the colour vocabulary is never named — inference only).
      sourceSpace: renderPlan.target.colourSpace.wireName,
      targetSpace: colourProfile.space,
      colourProfileId: colourProfile.id,
    );

    return ProductionColourPlan(
      jobId: job.id,
      colourProfileId: colourProfile.id,
      printProfileId: printProfileId,
      request: request,
    );
  }
}
