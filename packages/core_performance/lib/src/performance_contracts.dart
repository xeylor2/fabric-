import 'package:core_geometry/core_geometry.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'performance_contracts.freezed.dart';
part 'performance_contracts.g.dart';

/// Address of one tile in the level-of-detail pyramid (ADR-0011).
/// [level] 0 is full resolution; each level halves resolution.
@freezed
abstract class TileCoordinate with _$TileCoordinate {
  const factory TileCoordinate({
    required int level,
    required int x,
    required int y,
  }) = _TileCoordinate;

  factory TileCoordinate.fromJson(Map<String, Object?> json) =>
      _$TileCoordinateFromJson(json);
}

/// Tiling parameters of a render surface.
@freezed
abstract class TileSpec with _$TileSpec {
  const factory TileSpec({
    /// Tile edge in physical pixels (power of two).
    @Default(256) int tileSize,

    /// Overlap bleed between adjacent tiles (filtering artefact guard).
    @Default(2) int overlap,

    /// Number of LOD levels in the pyramid.
    @Default(6) int levels,
  }) = _TileSpec;

  factory TileSpec.fromJson(Map<String, Object?> json) =>
      _$TileSpecFromJson(json);

  const TileSpec._();

  /// The OS-wide default tiling.
  static const TileSpec standard = TileSpec();
}

/// Spatial index contract (quad-tree implementation arrives with the
/// renderer). Pure interface — engines depend on the contract, never a
/// concrete structure (dependency inversion).
abstract interface class SpatialIndexContract<T> {
  void insert(T item, Rect2D bounds);
  void remove(T item);

  /// Items whose bounds intersect [region].
  List<T> query(Rect2D region);

  void clear();
}

/// Configuration of the standard quad-tree spatial index.
@freezed
abstract class QuadTreeConfig with _$QuadTreeConfig {
  const factory QuadTreeConfig({
    required Rect2D bounds,
    @Default(8) int maxDepth,
    @Default(16) int maxItemsPerNode,
  }) = _QuadTreeConfig;

  factory QuadTreeConfig.fromJson(Map<String, Object?> json) =>
      _$QuadTreeConfigFromJson(json);
}

/// Cache tiers of the rendering/memory strategy.
enum CacheTier {
  memory('memory', 'Memory Cache'),
  texture('texture', 'Texture Cache'),
  disk('disk', 'Disk Cache');

  const CacheTier(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static CacheTier fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown CacheTier wire name',
      ),
    );
  }
}

/// Budget for one cache tier.
@freezed
abstract class CacheBudget with _$CacheBudget {
  const factory CacheBudget({
    required CacheTier tier,
    required int maxBytes,
    @Default(0) int maxEntries,
  }) = _CacheBudget;

  factory CacheBudget.fromJson(Map<String, Object?> json) =>
      _$CacheBudgetFromJson(json);
}

/// Object pool contract (buffers, paths, temporary rasters).
abstract interface class ObjectPoolContract<T> {
  T acquire();
  void release(T item);
  int get size;
}

/// Background worker priorities (isolate scheduling).
enum WorkerPriority {
  interactive('interactive', 'Interactive'),
  high('high', 'High'),
  normal('normal', 'Normal'),
  idle('idle', 'Idle');

  const WorkerPriority(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static WorkerPriority fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown WorkerPriority wire name',
      ),
    );
  }
}

/// Undo/history compression policy: deltas between snapshots, full
/// snapshots at intervals, bounded retention (see the Performance
/// Strategy document).
@freezed
abstract class HistoryCompressionPolicy with _$HistoryCompressionPolicy {
  const factory HistoryCompressionPolicy({
    /// A full snapshot is stored every N entries; deltas in between.
    @Default(32) int snapshotInterval,

    /// Delta-encode entries between snapshots.
    @Default(true) bool deltaEncoding,

    /// Full snapshots retained before archival compaction.
    @Default(16) int maxRetainedSnapshots,
  }) = _HistoryCompressionPolicy;

  factory HistoryCompressionPolicy.fromJson(Map<String, Object?> json) =>
      _$HistoryCompressionPolicyFromJson(json);

  const HistoryCompressionPolicy._();

  /// The OS-wide default policy.
  static const HistoryCompressionPolicy standard = HistoryCompressionPolicy();
}

/// Thresholds at which large-document strategies engage.
@freezed
abstract class LargeDocumentPolicy with _$LargeDocumentPolicy {
  const factory LargeDocumentPolicy({
    /// Virtualize panels/lists above this node count.
    @Default(500) int virtualizeAboveNodes,

    /// Tile rasters above this edge length (physical pixels).
    @Default(4096) int tileAboveDimension,

    /// Stream (never fully load) documents above this byte size.
    @Default(268435456) int streamAboveBytes,
  }) = _LargeDocumentPolicy;

  factory LargeDocumentPolicy.fromJson(Map<String, Object?> json) =>
      _$LargeDocumentPolicyFromJson(json);

  const LargeDocumentPolicy._();

  /// The OS-wide default policy.
  static const LargeDocumentPolicy standard = LargeDocumentPolicy();
}
