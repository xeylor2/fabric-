import 'package:core_geometry/core_geometry.dart';
import 'package:core_performance/core_performance.dart';
import 'package:test/test.dart';

void main() {
  test('cache tiers and worker priorities are frozen', () {
    expect(CacheTier.values.map((v) => v.wireName), [
      'memory',
      'texture',
      'disk',
    ]);
    expect(WorkerPriority.values.map((v) => v.wireName), [
      'interactive',
      'high',
      'normal',
      'idle',
    ]);
  });

  test('standard policies carry production-sane defaults', () {
    expect(TileSpec.standard.tileSize, 256);
    expect(TileSpec.standard.levels, 6);
    expect(HistoryCompressionPolicy.standard.deltaEncoding, isTrue);
    expect(HistoryCompressionPolicy.standard.snapshotInterval, 32);
    expect(LargeDocumentPolicy.standard.virtualizeAboveNodes, 500);
    expect(LargeDocumentPolicy.standard.tileAboveDimension, 4096);
  });

  test('models round-trip json', () {
    const tile = TileCoordinate(level: 2, x: 5, y: 7);
    expect(TileCoordinate.fromJson(tile.toJson()), tile);

    const config = QuadTreeConfig(
      bounds: Rect2D(left: 0, top: 0, width: 8192, height: 8192),
      maxDepth: 10,
    );
    expect(QuadTreeConfig.fromJson(config.toJson()), config);

    const budget = CacheBudget(
      tier: CacheTier.texture,
      maxBytes: 134217728,
      maxEntries: 512,
    );
    expect(CacheBudget.fromJson(budget.toJson()), budget);
  });
}
