import 'package:core_performance/core_performance.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'canvas_performance_strategy.freezed.dart';
part 'canvas_performance_strategy.g.dart';

/// The canvas performance strategy (M5A, ADR-0018).
///
/// This does **not** redefine tiling, spatial indexing, caching or LOD — those
/// are frozen in `core_performance` (ADR-0011). It *composes* those frozen
/// specs and adds only the canvas-runtime strategy switches that did not exist
/// (infinite canvas, dirty-region tracking, object culling, viewport caching).
/// Architecture only — no renderer, no GPU.
@freezed
abstract class CanvasPerformanceStrategy with _$CanvasPerformanceStrategy {
  const factory CanvasPerformanceStrategy({
    /// Tiling parameters (frozen `core_performance.TileSpec`).
    @Default(TileSpec.standard) TileSpec tiles,

    /// Large-document thresholds (frozen `LargeDocumentPolicy`).
    @Default(LargeDocumentPolicy.standard) LargeDocumentPolicy largeDocument,

    /// Optional spatial-index configuration; null until the scene bounds are
    /// known (frozen `QuadTreeConfig`).
    QuadTreeConfig? spatialIndex,

    /// Canvas extends without fixed bounds (pan beyond the artboard).
    @Default(true) bool infiniteCanvas,

    /// Only regions invalidated by a change are recomputed.
    @Default(true) bool dirtyRegionTracking,

    /// Off-viewport objects are culled from processing (uses the spatial
    /// index).
    @Default(true) bool objectCulling,

    /// Rendered viewport results are cached between frames.
    @Default(true) bool viewportCaching,

    /// Level-of-detail sampling by zoom (uses the tile mip pyramid).
    @Default(true) bool levelOfDetail,
  }) = _CanvasPerformanceStrategy;

  factory CanvasPerformanceStrategy.fromJson(Map<String, Object?> json) =>
      _$CanvasPerformanceStrategyFromJson(json);

  const CanvasPerformanceStrategy._();

  /// The OS-wide default strategy.
  static const CanvasPerformanceStrategy standard = CanvasPerformanceStrategy();
}
