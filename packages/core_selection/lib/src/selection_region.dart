import 'package:core_geometry/core_geometry.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'selection_region.freezed.dart';
part 'selection_region.g.dart';

/// The frozen selection shape/technique kinds of the FEBRIC Selection
/// Engine (ADR-0008).
enum SelectionShapeKind {
  rectangle('rectangle', 'Rectangle'),
  ellipse('ellipse', 'Ellipse'),
  polygon('polygon', 'Polygon'),
  lasso('lasso', 'Lasso'),
  brush('brush', 'Brush'),
  magicWand('magic_wand', 'Magic Wand'),
  quickSelect('quick_select', 'Quick Select'),
  aiSelect('ai_select', 'AI Select'),
  selectSimilar('select_similar', 'Select Similar'),
  selectColour('select_colour', 'Select Colour');

  const SelectionShapeKind(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Whether this technique is AI-assisted (staging + provenance apply).
  bool get isAiAssisted => this == aiSelect;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static SelectionShapeKind fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown SelectionShapeKind wire name',
      ),
    );
  }
}

/// Non-destructive selection refinements.
enum SelectionRefinementKind {
  grow('grow', 'Grow'),
  shrink('shrink', 'Shrink'),
  feather('feather', 'Feather'),
  inverse('inverse', 'Inverse');

  const SelectionRefinementKind(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static SelectionRefinementKind fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown SelectionRefinementKind wire name',
      ),
    );
  }
}

/// One refinement step ([amount] in logical pixels; unused by [inverse]).
@freezed
abstract class SelectionRefinement with _$SelectionRefinement {
  const factory SelectionRefinement({
    required SelectionRefinementKind kind,
    @Default(0.0) double amount,
  }) = _SelectionRefinement;

  factory SelectionRefinement.fromJson(Map<String, Object?> json) =>
      _$SelectionRefinementFromJson(json);
}

/// One immutable selection region: the shape/technique, its geometry, and
/// technique parameters. Rasterisation is a rendering concern (later
/// milestone) — the description is frozen here.
@freezed
abstract class SelectionRegion with _$SelectionRegion {
  const factory SelectionRegion({
    /// Stable UUID.
    required String id,

    required SelectionShapeKind kind,

    /// Axis-aligned bounds (rectangle/ellipse geometry; envelope for the
    /// other techniques).
    required Rect2D bounds,

    /// Vertices for polygon/lasso; stroke samples for brush.
    @Default(<Point2D>[]) List<Point2D> points,

    /// Colour tolerance (0..1) for magic wand / select colour / similar.
    double? tolerance,

    /// Reference colour (#RRGGBB) for colour-driven techniques.
    String? colourHex,

    /// Open metadata (AI prompts, provenance) until typed models land.
    @Default(<String, Object?>{}) Map<String, Object?> metadata,
  }) = _SelectionRegion;

  factory SelectionRegion.fromJson(Map<String, Object?> json) =>
      _$SelectionRegionFromJson(json);
}

/// A complete, restorable selection state at a point in time.
@freezed
abstract class SelectionSnapshot with _$SelectionSnapshot {
  const factory SelectionSnapshot({
    /// Stable UUID.
    required String id,

    /// Monotonic revision assigned by the owning history.
    required int revision,

    @Default(<SelectionRegion>[]) List<SelectionRegion> regions,

    /// Refinements applied to the combined region, in order.
    @Default(<SelectionRefinement>[]) List<SelectionRefinement> refinements,

    /// Open metadata.
    @Default(<String, Object?>{}) Map<String, Object?> metadata,
  }) = _SelectionSnapshot;

  factory SelectionSnapshot.fromJson(Map<String, Object?> json) =>
      _$SelectionSnapshotFromJson(json);

  const SelectionSnapshot._();

  bool get isEmpty => regions.isEmpty;
}

/// Bounded, immutable selection history with cursor-based undo/redo.
@freezed
abstract class SelectionHistory with _$SelectionHistory {
  const factory SelectionHistory({
    @Default(<SelectionSnapshot>[]) List<SelectionSnapshot> snapshots,

    /// Index of the active snapshot; -1 when empty.
    @Default(-1) int cursor,

    @Default(64) int maxSnapshots,
  }) = _SelectionHistory;

  factory SelectionHistory.fromJson(Map<String, Object?> json) =>
      _$SelectionHistoryFromJson(json);

  const SelectionHistory._();

  static const SelectionHistory empty = SelectionHistory();

  SelectionSnapshot? get current =>
      cursor >= 0 && cursor < snapshots.length ? snapshots[cursor] : null;

  bool get canUndo => cursor > 0;
  bool get canRedo => cursor >= 0 && cursor < snapshots.length - 1;

  /// Records [snapshot], truncating any redo branch and bounding size.
  SelectionHistory push(SelectionSnapshot snapshot) {
    final kept = [...snapshots.take(cursor + 1), snapshot];
    final overflow = kept.length - maxSnapshots;
    final bounded = overflow > 0 ? kept.sublist(overflow) : kept;
    return copyWith(snapshots: bounded, cursor: bounded.length - 1);
  }

  /// Moves the cursor back one snapshot (no-op at the start).
  SelectionHistory undo() => canUndo ? copyWith(cursor: cursor - 1) : this;

  /// Moves the cursor forward one snapshot (no-op at the end).
  SelectionHistory redo() => canRedo ? copyWith(cursor: cursor + 1) : this;
}
