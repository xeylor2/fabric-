import 'package:core_geometry/core_geometry.dart';
import 'package:core_textile/core_textile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'hit_test.freezed.dart';
part 'hit_test.g.dart';

/// What a hit test resolved to on the canvas surface.
///
/// Hit testing **operates on semantic nodes** (ADR-0018): the primary target
/// is a Design Tree node. Wire names are frozen and pinned by the test.
enum HitTargetKind {
  /// A semantic Design Tree node ([HitTestResult.semanticNodeId] is set).
  node('node', 'Semantic Node'),

  /// A canvas guide line.
  guide('guide', 'Guide'),

  /// A transform/selection handle overlay.
  handle('handle', 'Handle'),

  /// Empty canvas (no target).
  empty('empty', 'Empty');

  const HitTargetKind(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static HitTargetKind fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown HitTargetKind wire name',
      ),
    );
  }
}

/// A hit-test request. Input is a screen-space point (device pixels); the
/// runtime converts it through the frozen coordinate pipeline before
/// resolving against the semantic tree.
@freezed
abstract class HitTestQuery with _$HitTestQuery {
  const factory HitTestQuery({
    /// Pointer position in screen space.
    required Point2D screenPoint,

    /// Slop radius in screen pixels for near-miss targets (handles, guides).
    @Default(0.0) double tolerance,
  }) = _HitTestQuery;

  factory HitTestQuery.fromJson(Map<String, Object?> json) =>
      _$HitTestQueryFromJson(json);
}

/// The outcome of a hit test: the resolved target plus the pointer position
/// expressed in document space. The canvas holds the semantic node **id**
/// only (references, not node objects — `CanvasConstitution`).
@freezed
abstract class HitTestResult with _$HitTestResult {
  const factory HitTestResult({
    required HitTargetKind kind,

    /// The pointer position converted to document space.
    required Point2D documentPoint,

    /// The resolved Design Tree node id, when [kind] is
    /// [HitTargetKind.node]. Null otherwise.
    String? semanticNodeId,

    /// The resolved node's semantic type, when known — a convenience for
    /// tools so they need not re-resolve the tree.
    @JsonKey(fromJson: _typeFromJson, toJson: _typeToJson)
    DesignNodeType? nodeType,
  }) = _HitTestResult;

  factory HitTestResult.fromJson(Map<String, Object?> json) =>
      _$HitTestResultFromJson(json);

  const HitTestResult._();

  /// A miss (empty canvas) at [documentPoint].
  factory HitTestResult.miss(Point2D documentPoint) =>
      HitTestResult(kind: HitTargetKind.empty, documentPoint: documentPoint);

  /// Whether a semantic node was resolved.
  bool get isNodeHit => kind == HitTargetKind.node && semanticNodeId != null;
}

/// Resolves pointer input to semantic targets. Implementations use the
/// frozen `SpatialIndexContract` (`core_performance`) for culling and the
/// viewport transform (`core_interaction`) for coordinate conversion — this
/// is a pure contract, no implementation lives in M5A.
abstract interface class HitTestContract {
  /// Resolves a single point to its topmost semantic target.
  HitTestResult hitTest(HitTestQuery query);

  /// Resolves all semantic node ids whose bounds intersect [region]
  /// (document space) — marquee selection.
  List<String> hitTestRegion(Rect2D region);
}

DesignNodeType? _typeFromJson(String? wireName) =>
    wireName == null ? null : DesignNodeType.fromWireName(wireName);

String? _typeToJson(DesignNodeType? type) => type?.wireName;
