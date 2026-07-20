import 'package:core_document/core_document.dart';
import 'package:core_geometry/core_geometry.dart';
import 'package:core_production/src/jobs/production_job.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'preflight.freezed.dart';
part 'preflight.g.dart';

/// The §12 preflight rule classes: "effective DPI, repeat seam
/// continuity, color count vs technique, sRGB→CMYK gamut ΔE report, min
/// feature size, bleed/seam allowances" — plus the structural
/// completeness checks a rule engine needs before any of them can run.
///
/// Frozen initial set; append-only. Seam continuity, gamut ΔE and
/// min-feature-size require rendered pixel/ICC data and are evaluated by
/// the render/colour slices; their kinds are frozen now so reports speak
/// one vocabulary across slices (the M5A contracts-before-implementation
/// precedent).
enum PreflightRuleKind {
  /// Physical size × DPI yields insufficient effective resolution.
  effectiveDpi('effective_dpi', 'Effective DPI'),

  /// Repeat tile edges do not continue seamlessly (render slice).
  seamContinuity('seam_continuity', 'Seam Continuity'),

  /// Colour count exceeds the technique's limit.
  colourCount('colour_count', 'Colour Count'),

  /// sRGB→CMYK out-of-gamut report (colour slice).
  gamutDeltaE('gamut_delta_e', 'Gamut ΔE'),

  /// Features below the technique's minimum printable size (render
  /// slice).
  minFeatureSize('min_feature_size', 'Min Feature Size'),

  /// Bleed/seam allowances missing or insufficient.
  bleedAllowance('bleed_allowance', 'Bleed Allowance'),

  /// The job/document is structurally incomplete for production
  /// (missing artboard, empty tree, invalid physical size).
  structure('structure', 'Structure');

  const PreflightRuleKind(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static PreflightRuleKind fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown PreflightRuleKind wire name',
      ),
    );
  }
}

/// Finding severities. Frozen initial set; append-only.
enum PreflightSeverity {
  /// Production-blocking: the job must not proceed past preflight.
  blocker('blocker', 'Blocker'),

  /// Should be reviewed; production may proceed.
  warning('warning', 'Warning'),

  /// Informational (e.g. a report the mill wants attached).
  info('info', 'Info');

  const PreflightSeverity(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static PreflightSeverity fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown PreflightSeverity wire name',
      ),
    );
  }
}

/// One preflight finding — identifier-referenced targets only (the M12G
/// finding precedent; preflight judges, it never resolves or mutates).
@freezed
abstract class PreflightFinding with _$PreflightFinding {
  const factory PreflightFinding({
    @JsonKey(fromJson: _ruleFromJson, toJson: _ruleToJson)
    required PreflightRuleKind rule,
    @JsonKey(fromJson: _severityFromJson, toJson: _severityToJson)
    required PreflightSeverity severity,

    /// Human-readable description of the finding.
    required String description,

    /// The artboard this finding concerns — id only, when specific.
    String? artboardId,

    /// Referenced nodes/layers — ids only.
    @Default(<String>[]) List<String> targetIds,

    /// Measured/expected values for UI and mill sheets (e.g.
    /// effectiveDpi, requiredDpi, colourCount, maxColours).
    @Default(<String, Object?>{}) Map<String, Object?> measurements,
  }) = _PreflightFinding;

  factory PreflightFinding.fromJson(Map<String, Object?> json) =>
      _$PreflightFindingFromJson(json);
}

/// The preflight verdict for one [ProductionJob] against one document.
@freezed
abstract class PreflightReport with _$PreflightReport {
  const factory PreflightReport({
    /// The job preflighted.
    required String jobId,

    @Default(<PreflightFinding>[]) List<PreflightFinding> findings,

    /// Version of the engine that produced this report (the frozen
    /// provenance versioning precedent — reports are reproducible facts).
    required String engineVersion,

    @Default(<String, Object?>{}) Map<String, Object?> metadata,
  }) = _PreflightReport;

  factory PreflightReport.fromJson(Map<String, Object?> json) =>
      _$PreflightReportFromJson(json);

  const PreflightReport._();

  /// Whether production may proceed: no blocker findings.
  bool get passed =>
      findings.every((f) => f.severity != PreflightSeverity.blocker);
}

/// Injected preflight thresholds — **mill/technique policy, never frozen
/// here** (the M12B `TableCreditEstimator` doctrine: mechanics frozen,
/// policy injected). Null disables the corresponding check.
@freezed
abstract class PreflightThresholds with _$PreflightThresholds {
  const factory PreflightThresholds({
    /// Minimum acceptable effective DPI at the job's physical size.
    double? minEffectiveDpi,

    /// Maximum colours the technique supports (the frozen
    /// `ProductionProfile.maxColours` seam is a caller-side source).
    int? maxColours,

    /// Required bleed allowance in [bleedUnit] (checked structurally
    /// against job metadata by later slices; presence-checked here).
    double? minBleed,

    /// Unit of [minBleed].
    @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson)
    @Default(MeasurementUnit.millimetre)
    MeasurementUnit bleedUnit,
  }) = _PreflightThresholds;

  factory PreflightThresholds.fromJson(Map<String, Object?> json) =>
      _$PreflightThresholdsFromJson(json);
}

/// The preflight contract: the §12 rule engine — deterministic, pure,
/// synchronous. Same (job, document, thresholds) → same report.
abstract interface class PreflightEngine {
  /// Version stamped into every produced [PreflightReport.engineVersion].
  String get version;

  /// Evaluates [job] against [document] under the injected [thresholds].
  PreflightReport run(
    ProductionJob job,
    FebricDocument document, {
    PreflightThresholds thresholds = const PreflightThresholds(),
  });
}

/// Reference [PreflightEngine] (M13A): only the checks mechanically
/// computable from frozen models — the approved check-set split. Seam
/// continuity, gamut ΔE and min-feature-size need rendered pixel/ICC
/// data and arrive with the render/colour slices under their frozen
/// rule kinds.
///
/// Checks:
/// 1. **structure** — every referenced artboard exists; referenced
///    artboards have a non-empty design tree; the job's physical size is
///    positive. Blockers.
/// 2. **effective_dpi** — the artboard's pixel size at the job's
///    physical size yields at least `minEffectiveDpi`, converting
///    through the frozen `UnitConverter` (conversion is delegated, never
///    re-derived — the ADR-0018 rule). Blocker below threshold.
/// 3. **colour_count** — distinct layer colours (the frozen
///    `LayerModel.colourHex` walk) vs `maxColours`. Blocker above limit.
/// 4. **bleed_allowance** — a `minBleed` threshold with no bleed
///    declared on the job (`metadata['bleedMm']` absent) is a warning:
///    presence-checked here, measured by later slices.
///
/// Findings accumulate (the M12E accumulate-don't-short-circuit
/// precedent). Violations report ids and measurements only.
final class StaticPreflightEngine implements PreflightEngine {
  const StaticPreflightEngine();

  @override
  String get version => 'static-preflight-1';

  @override
  PreflightReport run(
    ProductionJob job,
    FebricDocument document, {
    PreflightThresholds thresholds = const PreflightThresholds(),
  }) {
    final findings = <PreflightFinding>[];
    final artboardsById = {for (final a in document.artboards) a.id: a};

    // 1 — structure: physical size must be positive.
    if (job.physicalSize.width <= 0 || job.physicalSize.height <= 0) {
      findings.add(
        PreflightFinding(
          rule: PreflightRuleKind.structure,
          severity: PreflightSeverity.blocker,
          description: 'Physical size must be positive',
          measurements: {
            'width': job.physicalSize.width,
            'height': job.physicalSize.height,
            'unit': job.unit.wireName,
          },
        ),
      );
    }

    for (final artboardId in job.artboardIds) {
      final artboard = artboardsById[artboardId];

      // 1 — structure: referenced artboard must exist.
      if (artboard == null) {
        findings.add(
          PreflightFinding(
            rule: PreflightRuleKind.structure,
            severity: PreflightSeverity.blocker,
            description: 'Artboard not found in document',
            artboardId: artboardId,
          ),
        );
        continue;
      }

      // 1 — structure: an empty design tree has nothing to produce.
      if (artboard.designTreeRoot.children.isEmpty) {
        findings.add(
          PreflightFinding(
            rule: PreflightRuleKind.structure,
            severity: PreflightSeverity.blocker,
            description: 'Artboard design tree is empty',
            artboardId: artboardId,
            targetIds: [artboard.designTreeRoot.id],
          ),
        );
      }

      // 2 — effective DPI: artboard pixels across the job's physical
      // size. Conversion delegates to the frozen UnitConverter.
      final minDpi = thresholds.minEffectiveDpi;
      if (minDpi != null &&
          job.physicalSize.width > 0 &&
          job.physicalSize.height > 0) {
        final artboardWidthPx = UnitConverter.convert(
          artboard.size.width,
          from: artboard.unit,
          to: MeasurementUnit.pixel,
          dotsPerInch: artboard.dpi,
        );
        final physicalWidthInches = UnitConverter.convert(
          job.physicalSize.width,
          from: job.unit,
          to: MeasurementUnit.inch,
          dotsPerInch: job.dpi,
        );
        final effectiveDpi = artboardWidthPx / physicalWidthInches;
        if (effectiveDpi < minDpi) {
          findings.add(
            PreflightFinding(
              rule: PreflightRuleKind.effectiveDpi,
              severity: PreflightSeverity.blocker,
              description: 'Effective resolution is below the required minimum',
              artboardId: artboardId,
              measurements: {
                'effectiveDpi': effectiveDpi,
                'requiredDpi': minDpi,
              },
            ),
          );
        }
      }

      // 3 — colour count: distinct colours reachable from frozen
      // surfaces — the artboard background plus every layer's frozen
      // `metadata['colour']` value, the key the frozen bus writes:
      // `DocumentCommand.changeColour` lands `colourHex` at exactly this
      // key via the frozen reducer (`_delegateLayerMetadata(key:
      // 'colour')`). Preflight is the read side of that frozen contract;
      // typed palettes arrive with the colour slice's models.
      final maxColours = thresholds.maxColours;
      if (maxColours != null) {
        final colours = <String>{
          if (artboard.backgroundColourHex != null)
            artboard.backgroundColourHex!,
          for (final layer in artboard.layerRoot.descendantsAndSelf)
            if (layer.metadata['colour'] is String)
              layer.metadata['colour']! as String,
        };
        if (colours.length > maxColours) {
          findings.add(
            PreflightFinding(
              rule: PreflightRuleKind.colourCount,
              severity: PreflightSeverity.blocker,
              description: 'Colour count exceeds the technique limit',
              artboardId: artboardId,
              measurements: {
                'colourCount': colours.length,
                'maxColours': maxColours,
              },
            ),
          );
        }
      }
    }

    // 4 — bleed allowance: presence check only (measurement belongs to
    // later slices with real geometry).
    if (thresholds.minBleed != null && !job.metadata.containsKey('bleedMm')) {
      findings.add(
        PreflightFinding(
          rule: PreflightRuleKind.bleedAllowance,
          severity: PreflightSeverity.warning,
          description: 'No bleed allowance declared on the job',
          measurements: {
            'requiredBleed': thresholds.minBleed,
            'unit': thresholds.bleedUnit.wireName,
          },
        ),
      );
    }

    return PreflightReport(
      jobId: job.id,
      findings: findings,
      engineVersion: version,
    );
  }
}

MeasurementUnit _unitFromJson(String wireName) =>
    MeasurementUnit.fromWireName(wireName);

String _unitToJson(MeasurementUnit unit) => unit.wireName;

PreflightRuleKind _ruleFromJson(String wireName) =>
    PreflightRuleKind.fromWireName(wireName);

String _ruleToJson(PreflightRuleKind rule) => rule.wireName;

PreflightSeverity _severityFromJson(String wireName) =>
    PreflightSeverity.fromWireName(wireName);

String _severityToJson(PreflightSeverity severity) => severity.wireName;
