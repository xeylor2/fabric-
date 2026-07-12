import 'package:core_geometry/core_geometry.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'overlay.freezed.dart';
part 'overlay.g.dart';

/// The kinds of visual overlay the Canvas Runtime owns. Tools *contribute*
/// overlay descriptions; they never render overlays directly (ADR-0018).
///
/// Wire names are frozen (append-only) and pinned by the freeze test.
enum OverlayKind {
  selection('selection', 'Selection'),
  hover('hover', 'Hover'),
  brushCursor('brush_cursor', 'Brush Cursor'),
  polygonPreview('polygon_preview', 'Polygon Preview'),
  magicWandPreview('magic_wand_preview', 'Magic Wand Preview'),
  aiPreview('ai_preview', 'AI Preview'),
  measurement('measurement', 'Measurement'),
  grid('grid', 'Grid'),
  snapGuide('snap_guide', 'Snap Guide'),
  alignmentGuide('alignment_guide', 'Alignment Guide'),
  ruler('ruler', 'Ruler'),

  /// Extension point for future tool overlays — kept last so additions are
  /// append-only.
  toolOverlay('tool_overlay', 'Tool Overlay');

  const OverlayKind(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static OverlayKind fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown OverlayKind wire name',
      ),
    );
  }
}

/// A single overlay description. It carries only *references* (ids) and a
/// bounding region — never pixels, never rendering instructions.
@freezed
abstract class OverlayModel with _$OverlayModel {
  const factory OverlayModel({
    required String id,
    required OverlayKind kind,

    /// Draw order within the overlay stack (higher paints later/on top).
    @Default(0) int order,

    @Default(true) bool visible,

    /// Ids this overlay refers to (e.g. selected node ids). References only.
    @Default(<String>[]) List<String> references,

    /// Optional bounding region in document space.
    Rect2D? bounds,

    /// Open, tool-specific metadata (kept out of the frozen schema).
    @Default(<String, Object?>{}) Map<String, Object?> metadata,
  }) = _OverlayModel;

  factory OverlayModel.fromJson(Map<String, Object?> json) =>
      _$OverlayModelFromJson(json);
}

/// The ordered, immutable stack of overlays the canvas owns.
///
/// **Deterministic paint order (frozen rule):** entries are kept sorted by
/// ascending [OverlayModel.order], ties broken by ascending [OverlayModel.id].
/// Paint order is a pure function of the overlay set — independent of the
/// sequence they were contributed in — so serialise → restore reproduces an
/// identical stack. Later entries paint on top. Mutators return new stacks.
@freezed
abstract class OverlayStack with _$OverlayStack {
  const factory OverlayStack({
    @Default(<OverlayModel>[]) List<OverlayModel> entries,
  }) = _OverlayStack;

  factory OverlayStack.fromJson(Map<String, Object?> json) =>
      _$OverlayStackFromJson(json);

  const OverlayStack._();

  /// The empty stack.
  static const OverlayStack empty = OverlayStack();

  /// Adds or replaces [overlay] by id, returning a new stack in deterministic
  /// paint order (ascending [OverlayModel.order], ties by [OverlayModel.id]).
  OverlayStack contribute(OverlayModel overlay) {
    final next = [...entries.where((e) => e.id != overlay.id), overlay]
      ..sort(_byPaintOrder);
    return OverlayStack(entries: next);
  }

  /// Removes the overlay with [overlayId], if present.
  OverlayStack withdraw(String overlayId) {
    return OverlayStack(
      entries: entries.where((e) => e.id != overlayId).toList(),
    );
  }

  /// Overlays of a given [kind], in paint order.
  List<OverlayModel> ofKind(OverlayKind kind) =>
      entries.where((e) => e.kind == kind).toList();

  /// Total, deterministic paint ordering: by [OverlayModel.order] then id.
  static int _byPaintOrder(OverlayModel a, OverlayModel b) {
    final byOrder = a.order.compareTo(b.order);
    return byOrder != 0 ? byOrder : a.id.compareTo(b.id);
  }
}

/// The canvas-owned overlay runtime. Tools contribute descriptions and
/// withdraw them; only the canvas enumerates and (later, outside M5A) paints
/// them. Pure contract — no rendering in M5A.
abstract interface class OverlayRuntimeContract {
  /// The current overlay stack (draw order).
  OverlayStack get overlays;

  /// Contributes (adds/replaces) an overlay description.
  void contribute(OverlayModel overlay);

  /// Withdraws a previously contributed overlay by id.
  void withdraw(String overlayId);
}
