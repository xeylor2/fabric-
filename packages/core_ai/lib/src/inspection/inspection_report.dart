import 'package:core_ai/src/prompt/ai_provider_id.dart';
import 'package:core_textile/core_textile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'inspection_report.freezed.dart';
part 'inspection_report.g.dart';

/// Motif roles recognised by the Textile Inspector's role classification
/// (Architecture V2 §7: "motif segmentation + role classification
/// (hero/secondary/filler)").
///
/// Frozen initial set; append-only. Classification output — distinct from
/// the frozen `GarmentPart.heroMotif`, which names a *placement*, not a
/// role.
enum MotifRole {
  /// The dominant motif of the artwork.
  hero('hero', 'Hero'),

  /// Supporting motifs.
  secondary('secondary', 'Secondary'),

  /// Background/filler motifs.
  filler('filler', 'Filler');

  const MotifRole(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static MotifRole fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown MotifRole wire name',
      ),
    );
  }
}

/// Region classifications of the §7 "printable/editable region maps".
///
/// Frozen initial set; append-only.
enum InspectionRegionKind {
  /// Safe to print (production-relevant area).
  printable('printable', 'Printable'),

  /// Open to AI/tool edits.
  editable('editable', 'Editable');

  const InspectionRegionKind(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static InspectionRegionKind fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown InspectionRegionKind wire name',
      ),
    );
  }
}

/// One classified region finding — **identifier-based references only**
/// (the approved region determination): region *shapes* remain owned by
/// the geometry-owning engines (`core_mask` — `MaskKind.aiMask` is the
/// frozen destination for segmentation output — `core_garment`,
/// `core_canvas`) and are reached exclusively by id.
@freezed
abstract class InspectionRegion with _$InspectionRegion {
  @Assert(
    'confidence >= 0.0 && confidence <= 1.0',
    'confidence must be within 0..1',
  )
  const factory InspectionRegion({
    /// Stable UUID of this finding.
    required String id,

    required InspectionRegionKind kind,

    /// Referenced tree nodes (existing or proposed) — ids only.
    @Default(<String>[]) List<String> targetNodeIds,

    /// Referenced masks (existing or proposed; `ai_mask` destination) —
    /// ids only.
    @Default(<String>[]) List<String> maskIds,

    /// Per-finding confidence 0..1 (§7).
    @Default(1.0) double confidence,

    @Default(<String, Object?>{}) Map<String, Object?> metadata,
  }) = _InspectionRegion;

  factory InspectionRegion.fromJson(Map<String, Object?> json) =>
      _$InspectionRegionFromJson(json);
}

/// One structure finding: a detected garment part (frozen vocabulary)
/// with per-finding confidence (§7 "structure detection").
@freezed
abstract class StructureFinding with _$StructureFinding {
  @Assert(
    'confidence >= 0.0 && confidence <= 1.0',
    'confidence must be within 0..1',
  )
  const factory StructureFinding({
    @JsonKey(fromJson: _partFromJson, toJson: _partToJson)
    required GarmentPart part,

    /// The proposed tree node representing this part, when present in the
    /// tree proposal — id only.
    String? nodeId,

    @Default(1.0) double confidence,

    @Default(<String, Object?>{}) Map<String, Object?> metadata,
  }) = _StructureFinding;

  factory StructureFinding.fromJson(Map<String, Object?> json) =>
      _$StructureFindingFromJson(json);
}

/// One motif finding: segmentation + role classification with per-finding
/// confidence (§7).
@freezed
abstract class MotifFinding with _$MotifFinding {
  @Assert(
    'confidence >= 0.0 && confidence <= 1.0',
    'confidence must be within 0..1',
  )
  const factory MotifFinding({
    /// Stable UUID of this finding.
    required String id,

    required MotifRole role,

    /// The proposed tree node carrying this motif — id only.
    String? nodeId,

    /// Referenced segmentation masks (`ai_mask` destination) — ids only.
    @Default(<String>[]) List<String> maskIds,

    @Default(1.0) double confidence,

    @Default(<String, Object?>{}) Map<String, Object?> metadata,
  }) = _MotifFinding;

  factory MotifFinding.fromJson(Map<String, Object?> json) =>
      _$MotifFindingFromJson(json);
}

/// One border finding with per-finding confidence (§7 "border
/// extraction").
@freezed
abstract class BorderFinding with _$BorderFinding {
  @Assert(
    'confidence >= 0.0 && confidence <= 1.0',
    'confidence must be within 0..1',
  )
  const factory BorderFinding({
    /// Stable UUID of this finding.
    required String id,

    /// The proposed tree node carrying this border — id only.
    String? nodeId,

    /// Referenced masks — ids only.
    @Default(<String>[]) List<String> maskIds,

    @Default(1.0) double confidence,

    @Default(<String, Object?>{}) Map<String, Object?> metadata,
  }) = _BorderFinding;

  factory BorderFinding.fromJson(Map<String, Object?> json) =>
      _$BorderFindingFromJson(json);
}

/// The Textile Inspector's frozen output shape (Architecture V2 §7):
/// `InspectionReport { garment, fabricGuess, structure[], pattern,
/// motifs[], borders[], palette[], regions, treeProposal }`.
///
/// An **AI-side reference model** over frozen `core_textile` vocabulary —
/// analysis (classification, segmentation, extraction) is heuristic
/// provider work behind the frozen ADR-0009 seams; this model types what
/// it produces. The [treeProposal] is a proposed frozen [DesignNode]
/// subtree — structure, not commands: the deterministic staging bridge
/// (`core_ai_staging`) derives the frozen `DocumentCommand`s, and the
/// proposal is **staged** (invariant I2: "ground reconstruction runs on
/// accept").
///
/// Carries the provenance precursors of the producing analysis (the
/// M12A/M12E precedent) so the staged tree proposal lands with full
/// invariant-I5 lineage.
@freezed
abstract class InspectionReport with _$InspectionReport {
  @Assert(
    'garmentConfidence >= 0.0 && garmentConfidence <= 1.0',
    'garmentConfidence must be within 0..1',
  )
  const factory InspectionReport({
    /// Stable UUID of this report.
    required String id,

    /// The frozen textile operation the producing analysis ran under
    /// (the M12A `AiProposal`/M12E `ExecutionPlan` precedent: the
    /// operation travels with the provenance precursors; invariant I6 —
    /// carried verbatim, never derived).
    @JsonKey(fromJson: _operationFromJson, toJson: _operationToJson)
    required AiOperation operation,

    /// Classified garment (frozen vocabulary), null when undetermined.
    @JsonKey(fromJson: _garmentFromJson, toJson: _garmentToJson)
    GarmentType? garment,

    /// Confidence of the garment classification (§7).
    @Default(1.0) double garmentConfidence,

    /// Free-text fabric guess (no fabric vocabulary is frozen; a frozen
    /// enum would invent vocabulary this slice must not).
    String? fabricGuess,

    /// Structure detection findings.
    @Default(<StructureFinding>[]) List<StructureFinding> structure,

    /// Pattern/repeat analysis result (frozen vocabulary), null when
    /// undetermined.
    @JsonKey(fromJson: _repeatFromJson, toJson: _repeatToJson)
    RepeatType? pattern,

    /// Motif segmentation + role classification findings.
    @Default(<MotifFinding>[]) List<MotifFinding> motifs,

    /// Border extraction findings.
    @Default(<BorderFinding>[]) List<BorderFinding> borders,

    /// Extracted working palette (#RRGGBB — the frozen
    /// `PromptContext.paletteHex` convention).
    @Default(<String>[]) List<String> palette,

    /// Printable/editable region findings — identifier references only.
    @Default(<InspectionRegion>[]) List<InspectionRegion> regions,

    /// The proposed frozen [DesignNode] subtree ("staged tree
    /// population"), null when the analysis proposes no structure.
    DesignNode? treeProposal,

    /// Provenance precursors of the producing analysis (invariant I5).
    required String promptHash,
    String? templateId,
    @JsonKey(fromJson: _providerFromJson, toJson: _providerToJson)
    required AiProviderId provider,
    required String model,
    required String constraintVersion,
    required String toolVersion,

    @Default(<String, Object?>{}) Map<String, Object?> metadata,
  }) = _InspectionReport;

  factory InspectionReport.fromJson(Map<String, Object?> json) =>
      _$InspectionReportFromJson(json);
}

AiOperation _operationFromJson(String wireName) =>
    AiOperation.fromWireName(wireName);

String _operationToJson(AiOperation operation) => operation.wireName;

AiProviderId _providerFromJson(String wireName) =>
    AiProviderId.fromWireName(wireName);

String _providerToJson(AiProviderId provider) => provider.wireName;

GarmentType? _garmentFromJson(String? wireName) =>
    wireName == null ? null : GarmentType.fromWireName(wireName);

String? _garmentToJson(GarmentType? garment) => garment?.wireName;

GarmentPart _partFromJson(String wireName) =>
    GarmentPart.fromWireName(wireName);

String _partToJson(GarmentPart part) => part.wireName;

RepeatType? _repeatFromJson(String? wireName) =>
    wireName == null ? null : RepeatType.fromWireName(wireName);

String? _repeatToJson(RepeatType? repeat) => repeat?.wireName;
