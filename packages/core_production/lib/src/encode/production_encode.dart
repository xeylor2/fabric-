import 'package:core_color/core_color.dart';
import 'package:core_document/core_document.dart';
import 'package:core_geometry/core_geometry.dart';
import 'package:core_production/src/color/production_colour_bridge.dart';
import 'package:core_production/src/jobs/production_job.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'production_encode.freezed.dart';
part 'production_encode.g.dart';

/// One reference-based encode work order (§12 Encode: "TIFF incl. CMYK,
/// PNG, print-ready PDF; SVG reserved"). Carries the §12 mandate
/// verbatim — **exact physical size + unit + DPI always embedded** —
/// and references only: sources are the coloured artefact ids, never
/// buffers (the M13C shape).
///
/// The frozen [ExportFormat] vocabulary is unrestricted here: whether a
/// format is encodable is the injected encoder's **declared capability**
/// (the approved reserved-format determination) — no current-era encoder
/// declares `svg`, which is how §12's "SVG reserved" is honoured, as an
/// emergent fact rather than frozen policy.
@freezed
abstract class EncodeRequest with _$EncodeRequest {
  @Assert('dpi > 0', 'dpi must be positive')
  const factory EncodeRequest({
    /// Stable UUID of this request.
    required String id,

    /// What to encode — the coloured output references, ids only.
    @Default(<String>[]) List<String> sourceReferences,

    /// The frozen target format (wire-name serialized).
    @JsonKey(fromJson: _formatFromJson, toJson: _formatToJson)
    required ExportFormat format,

    /// The frozen `ExportProfile` this request realises — id only.
    required String exportProfileId,

    /// Exact physical output size (§12: always embedded).
    required Size2D physicalSize,

    /// Unit of [physicalSize] (frozen vocabulary).
    @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson)
    required MeasurementUnit unit,

    /// Output resolution (§12: always embedded).
    required double dpi,

    @Default(<String, Object?>{}) Map<String, Object?> metadata,
  }) = _EncodeRequest;

  factory EncodeRequest.fromJson(Map<String, Object?> json) =>
      _$EncodeRequestFromJson(json);
}

/// The outcome of one encode request (sealed union, explicit `kind` —
/// the `RoutingDecision`/`ExecutionOutcome` precedent). An encoder asked
/// for a format outside its declared set answers with the typed
/// [EncodeResult.unsupported] — nothing throws, nothing is silently
/// dropped: the plan surface shows every request's fate.
@Freezed(unionKey: 'kind')
sealed class EncodeResult with _$EncodeResult {
  /// The request was encoded: the artefacts exist under
  /// [outputReferences] (ids only).
  @FreezedUnionValue('encoded')
  const factory EncodeResult.encoded({
    required String requestId,
    @Default(<String>[]) List<String> outputReferences,

    /// Version of the encoder that produced the artefacts (the frozen
    /// provenance-versioning precedent).
    required String encoderVersion,
  }) = EncodeEncoded;

  /// The encoder does not declare this format — a typed outcome, never
  /// an exception (absence of a capability is an outcome, the frozen
  /// `noRoute` philosophy).
  @FreezedUnionValue('unsupported')
  const factory EncodeResult.unsupported({
    required String requestId,
    @JsonKey(fromJson: _formatFromJson, toJson: _formatToJson)
    required ExportFormat format,
    required String encoderVersion,
    String? detail,
  }) = EncodeUnsupported;

  factory EncodeResult.fromJson(Map<String, Object?> json) =>
      _$EncodeResultFromJson(json);
}

/// The codec seam: **synchronous and deterministic by contract** (the
/// approved M13C execution-shape doctrine, applied identically — the
/// frozen `RenderBackend` pixel seam is synchronous; §11 concurrency
/// lives in placement: isolates and the backend farm execute this
/// contract where the data is, and future orchestration slices own any
/// `Future` at that boundary).
///
/// Format capability is **declared as data** (the frozen
/// `ProviderAdapter.capabilities`/`BackendCapabilities` pattern — read,
/// never probed): the frozen seam ships no format list of its own.
/// Codec implementations (TIFF/PNG/PDF…) arrive with the
/// imaging/backend slices; tests supply fakes. **Zero codec code ships
/// in this package.**
abstract interface class ProductionEncoder {
  /// Version stamped into every produced [EncodeResult].
  String get version;

  /// The formats this encoder declares it can produce.
  Set<ExportFormat> get supportedFormats;

  /// Encodes [request]'s referenced sources. Pure: same request → same
  /// result. A format outside [supportedFormats] answers
  /// [EncodeResult.unsupported].
  EncodeResult encode(EncodeRequest request);
}

/// The §12 Encode-stage plan for one colour-completed [ProductionJob]:
/// one [EncodeRequest] per selected export profile, in the caller's
/// profile-id order (deterministic).
@freezed
abstract class ProductionEncodePlan with _$ProductionEncodePlan {
  const factory ProductionEncodePlan({
    /// The job this plan encodes.
    required String jobId,

    /// One request per selected `ExportProfile`, in selection order.
    @Default(<EncodeRequest>[]) List<EncodeRequest> requests,

    @Default(<String, Object?>{}) Map<String, Object?> metadata,
  }) = _ProductionEncodePlan;

  factory ProductionEncodePlan.fromJson(Map<String, Object?> json) =>
      _$ProductionEncodePlanFromJson(json);
}

/// The Encode-stage bridge contract: binds a colour-completed job to the
/// document's frozen export profiles and derives the encode work orders.
/// A **pure binder** (the approved determination): it does not filter
/// formats — serviceability is decided at the encoder seam, where
/// capability lives.
abstract interface class ProductionEncodeBridge {
  /// Plans the encode stage for [job] against [document].
  ///
  /// Gated (the M12E/M13B/M13C precedent): the job's `nextStage` must be
  /// [ProductionStage.encode] ([StateError] — the frozen §12 order
  /// cannot be skipped); [colourPlan] must belong to exactly this job
  /// and [transformResult] must answer exactly [colourPlan]'s request
  /// (colour-stage completion evidenced by artefact — [ArgumentError]
  /// otherwise); every id in [exportProfileIds] must resolve on the
  /// document ([ArgumentError] — an unresolvable profile is a caller
  /// error, never a fabricated export).
  ProductionEncodePlan plan(
    ProductionJob job,
    FebricDocument document, {
    required ProductionColourPlan colourPlan,
    required ColourTransformResult transformResult,
    required List<String> exportProfileIds,
  });
}

/// Reference [ProductionEncodeBridge] (M13D): pure profile binding —
/// zero policy, zero codecs.
///
/// - Sources are [ColourTransformResult.outputReferences] — the coloured
///   artefacts, not the raw render work-list (the approved Q3 ruling).
/// - Each request embeds the job's exact physical size + unit and the
///   profile's dpi scaled by the profile's frozen `scale` field —
///   arithmetic on frozen data, not policy.
/// - Formats pass through unrestricted (the approved reserved-format
///   determination).
final class BindingProductionEncodeBridge implements ProductionEncodeBridge {
  const BindingProductionEncodeBridge();

  @override
  ProductionEncodePlan plan(
    ProductionJob job,
    FebricDocument document, {
    required ProductionColourPlan colourPlan,
    required ColourTransformResult transformResult,
    required List<String> exportProfileIds,
  }) {
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
    if (job.nextStage != ProductionStage.encode) {
      throw StateError(
        'Job "${job.id}" is not at the encode stage '
        '(next: ${job.nextStage?.wireName ?? 'complete'}); the frozen '
        '§12 order cannot be skipped',
      );
    }
    final profilesById = {for (final p in document.exportProfiles) p.id: p};

    final requests = <EncodeRequest>[];
    for (final profileId in exportProfileIds) {
      final profile = profilesById[profileId];
      if (profile == null) {
        throw ArgumentError.value(
          profileId,
          'exportProfileIds',
          'Export profile not found on the document',
        );
      }
      requests.add(
        EncodeRequest(
          id: 'encode-${job.id}-${profile.id}',
          sourceReferences: transformResult.outputReferences,
          format: profile.format,
          exportProfileId: profile.id,
          physicalSize: job.physicalSize,
          unit: job.unit,
          dpi: profile.dpi * profile.scale,
        ),
      );
    }

    return ProductionEncodePlan(jobId: job.id, requests: requests);
  }
}

ExportFormat _formatFromJson(String wireName) =>
    ExportFormat.fromWireName(wireName);

String _formatToJson(ExportFormat format) => format.wireName;

MeasurementUnit _unitFromJson(String wireName) =>
    MeasurementUnit.fromWireName(wireName);

String _unitToJson(MeasurementUnit unit) => unit.wireName;
