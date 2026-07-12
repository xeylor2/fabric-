import 'package:core_geometry/core_geometry.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mask_model.freezed.dart';
part 'mask_model.g.dart';

/// The frozen mask kinds of the FEBRIC Mask Engine (ADR-0007).
enum MaskKind {
  /// Raster mask attached to a layer.
  layerMask('layer_mask', 'Layer Mask'),

  /// Path-defined vector mask.
  vectorMask('vector_mask', 'Vector Mask'),

  /// Painted (brush) mask.
  brushMask('brush_mask', 'Brush Mask'),

  /// AI-generated mask (segmentation output; carries provenance).
  aiMask('ai_mask', 'AI Mask'),

  /// Clipping mask (clips to the layer below).
  clipMask('clip_mask', 'Clip Mask'),

  /// Alpha-channel-derived mask.
  alphaMask('alpha_mask', 'Alpha Mask');

  const MaskKind(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static MaskKind fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () =>
          throw ArgumentError.value(name, 'name', 'Unknown MaskKind wire name'),
    );
  }
}

/// Boolean combination applied when stacking masks.
enum MaskBooleanOp {
  union('union', 'Union'),
  intersect('intersect', 'Intersect'),
  subtract('subtract', 'Subtract'),
  invert('invert', 'Invert');

  const MaskBooleanOp(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static MaskBooleanOp fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown MaskBooleanOp wire name',
      ),
    );
  }
}

/// Non-destructive mask edge refinements.
enum MaskRefinementKind {
  feather('feather', 'Feather'),
  expand('expand', 'Expand'),
  shrink('shrink', 'Shrink'),
  grow('grow', 'Grow');

  const MaskRefinementKind(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static MaskRefinementKind fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown MaskRefinementKind wire name',
      ),
    );
  }
}

/// One refinement step with its amount (logical pixels).
@freezed
abstract class MaskRefinement with _$MaskRefinement {
  const factory MaskRefinement({
    required MaskRefinementKind kind,
    required double amount,
  }) = _MaskRefinement;

  factory MaskRefinement.fromJson(Map<String, Object?> json) =>
      _$MaskRefinementFromJson(json);
}

/// The immutable mask of the FEBRIC OS.
@freezed
abstract class MaskModel with _$MaskModel {
  const factory MaskModel({
    /// Stable UUID.
    required String id,

    required String name,
    required MaskKind kind,

    /// Disabled masks are kept but not applied.
    @Default(true) bool enabled,

    /// Inverts the mask's coverage.
    @Default(false) bool inverted,

    /// Mask density: 1.0 fully masks, lower values partially reveal.
    @Default(1.0) double density,

    /// Non-destructive refinement pipeline, applied in order.
    @Default(<MaskRefinement>[]) List<MaskRefinement> refinements,

    /// Canvas-space bounds of the mask content, when known.
    Rect2D? bounds,

    /// Open metadata (payloads, AI provenance) until typed models land.
    @Default(<String, Object?>{}) Map<String, Object?> metadata,
  }) = _MaskModel;

  factory MaskModel.fromJson(Map<String, Object?> json) =>
      _$MaskModelFromJson(json);
}

/// One entry of a mask stack: a mask combined with the accumulated result
/// by [op].
@freezed
abstract class MaskStackEntry with _$MaskStackEntry {
  const factory MaskStackEntry({
    required MaskModel mask,
    @Default(MaskBooleanOp.union) MaskBooleanOp op,
  }) = _MaskStackEntry;

  factory MaskStackEntry.fromJson(Map<String, Object?> json) =>
      _$MaskStackEntryFromJson(json);
}

/// An ordered stack of masks targeting one entity (layer/object id).
/// Evaluation order is list order; evaluation itself is a rendering
/// concern (later milestone) — the structure is frozen here.
@freezed
abstract class MaskStack with _$MaskStack {
  const factory MaskStack({
    /// The layer/object this stack applies to.
    required String targetId,

    @Default(<MaskStackEntry>[]) List<MaskStackEntry> entries,
  }) = _MaskStack;

  factory MaskStack.fromJson(Map<String, Object?> json) =>
      _$MaskStackFromJson(json);

  const MaskStack._();

  bool get isEmpty => entries.isEmpty;

  /// Returns a stack with [entry] appended.
  MaskStack withEntry(MaskStackEntry entry) =>
      MaskStack(targetId: targetId, entries: [...entries, entry]);
}
