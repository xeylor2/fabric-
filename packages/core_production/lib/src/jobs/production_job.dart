import 'package:core_geometry/core_geometry.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'production_job.freezed.dart';
part 'production_job.g.dart';

/// The frozen §12 ProductionJob pipeline stages:
/// preflight → render → color → encode → package.
///
/// Frozen initial set; append-only. Order is encoded as data (the frozen
/// `AiPipelineStage.previous` precedent): a job advances strictly
/// stage-by-stage; skipping is impossible by construction
/// ([ProductionJob.advanceTo] refuses non-successor stages).
enum ProductionStage {
  /// Rule engine over the finished tree (this slice).
  preflight('preflight', 'Preflight'),

  /// Full-res per panel/tile (isolate or backend farm; later slice).
  render('render', 'Render'),

  /// ICC-managed CMYK, profile per mill (later slice).
  color('color', 'Color'),

  /// TIFF incl. CMYK, PNG, print-ready PDF (later slice).
  encode('encode', 'Encode'),

  /// Production sheet (later slice).
  package('package', 'Package');

  const ProductionStage(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// The stage that must complete before this one (null for the first).
  ProductionStage? get previous {
    final i = index;
    return i == 0 ? null : values[i - 1];
  }

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static ProductionStage fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown ProductionStage wire name',
      ),
    );
  }
}

/// Production deliverable classes (§12: "repeat tile, panel set, tiled
/// yardage strike-off").
///
/// Frozen initial set; append-only.
enum ProductionDeliverable {
  repeatTile('repeat_tile', 'Repeat Tile'),
  panelSet('panel_set', 'Panel Set'),
  yardageStrikeOff('yardage_strike_off', 'Yardage Strike-Off');

  const ProductionDeliverable(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static ProductionDeliverable fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown ProductionDeliverable wire name',
      ),
    );
  }
}

/// The immutable identity of one production run (§12): which artboards,
/// which deliverable, at what exact physical size and DPI — "exact
/// physical size + DPI always embedded".
///
/// A value model: *advancing* a job at runtime belongs to the later
/// render/encode slices; M13A ships the state machine as values (the
/// frozen `AiPipelineRun` precedent). Stages complete strictly in order
/// via [advanceTo].
@freezed
abstract class ProductionJob with _$ProductionJob {
  @Assert('dpi > 0', 'dpi must be positive')
  const factory ProductionJob({
    /// Stable UUID of this job.
    required String id,

    /// The document being produced — id only.
    required String documentId,

    /// The artboards to produce — ids only (the renders-references-only
    /// convention).
    @Default(<String>[]) List<String> artboardIds,

    @JsonKey(fromJson: _deliverableFromJson, toJson: _deliverableToJson)
    required ProductionDeliverable deliverable,

    /// Exact physical output size (frozen geometry vocabulary).
    required Size2D physicalSize,

    /// Unit of [physicalSize] (frozen vocabulary; §12 physical-unit
    /// mandate).
    @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson)
    @Default(MeasurementUnit.centimetre)
    MeasurementUnit unit,

    /// Output resolution — always embedded (§12).
    @Default(300.0) double dpi,

    /// Stages completed so far, in order.
    @JsonKey(fromJson: _stagesFromJson, toJson: _stagesToJson)
    @Default(<ProductionStage>[])
    List<ProductionStage> completed,

    @Default(<String, Object?>{}) Map<String, Object?> metadata,
  }) = _ProductionJob;

  factory ProductionJob.fromJson(Map<String, Object?> json) =>
      _$ProductionJobFromJson(json);

  const ProductionJob._();

  /// The last completed stage, or null before the run starts.
  ProductionStage? get currentStage =>
      completed.isEmpty ? null : completed.last;

  /// The next stage this job must complete, or null when packaged.
  ProductionStage? get nextStage {
    if (completed.isEmpty) {
      return ProductionStage.values.first;
    }
    final i = completed.last.index + 1;
    return i < ProductionStage.values.length ? ProductionStage.values[i] : null;
  }

  /// Whether every §12 stage has completed.
  bool get isComplete => currentStage == ProductionStage.package;

  /// Completes [stage]; throws [StateError] unless [stage] is exactly
  /// the next stage — the pipeline cannot be skipped or reordered (the
  /// frozen `AiPipelineRun.advanceTo` precedent).
  ProductionJob advanceTo(ProductionStage stage) {
    if (stage != nextStage) {
      throw StateError(
        'Production order violation: expected ${nextStage?.wireName}, '
        'got ${stage.wireName}',
      );
    }
    return copyWith(completed: [...completed, stage]);
  }
}

MeasurementUnit _unitFromJson(String wireName) =>
    MeasurementUnit.fromWireName(wireName);

String _unitToJson(MeasurementUnit unit) => unit.wireName;

ProductionDeliverable _deliverableFromJson(String wireName) =>
    ProductionDeliverable.fromWireName(wireName);

String _deliverableToJson(ProductionDeliverable deliverable) =>
    deliverable.wireName;

List<ProductionStage> _stagesFromJson(List<Object?> wireNames) => [
  for (final name in wireNames) ProductionStage.fromWireName(name! as String),
];

List<String> _stagesToJson(List<ProductionStage> stages) => [
  for (final stage in stages) stage.wireName,
];
