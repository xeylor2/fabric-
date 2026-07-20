import 'package:freezed_annotation/freezed_annotation.dart';

part 'colour_transform.freezed.dart';
part 'colour_transform.g.dart';

/// One gamut finding — **facts, not judgements** (the approved
/// gamut-report determination): a measured ΔE and an in/out-of-gamut
/// flag for one referenced colour/region. Severity judgement against
/// thresholds is policy and stays with preflight/policy layers (the
/// frozen `PreflightRuleKind.gamutDeltaE` is the consumer).
@freezed
abstract class GamutFinding with _$GamutFinding {
  @Assert('deltaE >= 0', 'deltaE must be non-negative')
  const factory GamutFinding({
    /// The colour or region this finding measures — an id or #RRGGBB
    /// reference (the established wire convention), never a resolved
    /// object.
    required String reference,

    /// Measured colour difference (reported data — computed by the ICC
    /// implementations behind the transform seam, never here).
    required double deltaE,

    /// Whether the referenced colour maps inside the target gamut.
    required bool inGamut,

    @Default(<String, Object?>{}) Map<String, Object?> metadata,
  }) = _GamutFinding;

  factory GamutFinding.fromJson(Map<String, Object?> json) =>
      _$GamutFindingFromJson(json);
}

/// The §12 "sRGB→CMYK gamut ΔE report": measured facts for one
/// transform, id-referenced (renders-references-only).
@freezed
abstract class GamutReport with _$GamutReport {
  const factory GamutReport({
    /// The transform request this report measures.
    required String requestId,

    /// The colour profile the measurement ran against — id only (the
    /// frozen `ColourProfile` reference convention).
    required String colourProfileId,

    @Default(<GamutFinding>[]) List<GamutFinding> findings,

    @Default(<String, Object?>{}) Map<String, Object?> metadata,
  }) = _GamutReport;

  factory GamutReport.fromJson(Map<String, Object?> json) =>
      _$GamutReportFromJson(json);

  const GamutReport._();

  /// How many referenced colours fall outside the target gamut.
  int get outOfGamutCount => findings.where((f) => !f.inGamut).length;
}

/// A reference-based colour transform work order (the §12 Color stage:
/// "ICC-managed CMYK, profile per mill"). Carries **references and
/// planning artefacts only** — no pixel data crosses this contract (the
/// approved execution-shape determination).
@freezed
abstract class ColourTransformRequest with _$ColourTransformRequest {
  const factory ColourTransformRequest({
    /// Stable UUID of this request.
    required String id,

    /// What to transform — render-object/tile/asset ids, never buffers.
    @Default(<String>[]) List<String> sourceReferences,

    /// Working colour space of the sources (wire identifier, e.g.
    /// `srgb` — the frozen `ColourProfile.space` convention).
    required String sourceSpace,

    /// Destination space (e.g. `cmyk_fogra39`).
    required String targetSpace,

    /// The frozen `ColourProfile` governing the conversion — id only
    /// ("profile per mill" is document/injected data).
    required String colourProfileId,

    @Default(<String, Object?>{}) Map<String, Object?> metadata,
  }) = _ColourTransformRequest;

  factory ColourTransformRequest.fromJson(Map<String, Object?> json) =>
      _$ColourTransformRequestFromJson(json);
}

/// The outcome of one colour transform: output references plus the
/// measured [GamutReport], stamped with the transformer's version (the
/// frozen provenance-versioning precedent).
@freezed
abstract class ColourTransformResult with _$ColourTransformResult {
  const factory ColourTransformResult({
    /// The request this result answers.
    required String requestId,

    /// The transformed artefacts — ids only.
    @Default(<String>[]) List<String> outputReferences,

    required GamutReport gamutReport,

    /// Version of the transformer that produced this result.
    required String transformerVersion,

    @Default(<String, Object?>{}) Map<String, Object?> metadata,
  }) = _ColourTransformResult;

  factory ColourTransformResult.fromJson(Map<String, Object?> json) =>
      _$ColourTransformResultFromJson(json);
}

/// The colour-transform seam: **synchronous and deterministic by
/// contract** (the approved execution-shape determination — the frozen
/// `RenderBackend` pixel seam is synchronous; §11 concurrency lives in
/// *placement*: isolates and the backend farm execute this contract
/// where the data is, and future orchestration slices own any `Future`
/// at that boundary — never this seam).
///
/// ICC implementations arrive with the colour-science/backend slices
/// (`ColourProfile.iccAssetId` references the profile data); tests
/// supply fakes (the M12D `_FakeAdapter` precedent). **Zero colour
/// science ships in this package.**
abstract interface class ColourTransformContract {
  /// Version stamped into every produced
  /// [ColourTransformResult.transformerVersion].
  String get version;

  /// Transforms [request]'s referenced sources into the target space,
  /// measuring the gamut report. Pure: same request → same result.
  ColourTransformResult transform(ColourTransformRequest request);
}
