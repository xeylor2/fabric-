import 'package:core_asset/core_asset.dart';
import 'package:test/test.dart';
import 'support/fixtures.dart';

void main() {
  group('AssetUsageGraph', () {
    test('edges are a set: duplicate recording is identity-stable', () {
      var graph = AssetUsageGraph.empty.withUsage(usage('a-1'));
      final again = graph.withUsage(usage('a-1'));
      expect(identical(graph, again), isTrue);
      graph = graph.withUsage(usage('a-1', nodeId: 'n-2'));
      expect(graph.count, 2);
    });

    test('projections cover the full Asset → Node → Artboard → Document '
        'chain', () {
      final graph = AssetUsageGraph(
        usages: [
          usage('a-1', nodeId: 'n-1', artboardId: 'ab-1', documentId: 'd-1'),
          usage('a-1', nodeId: 'n-2', artboardId: 'ab-2', documentId: 'd-2'),
          usage('a-2', nodeId: 'n-1', artboardId: 'ab-1', documentId: 'd-1'),
        ],
      );

      expect(graph.usagesOf('a-1').length, 2);
      expect(graph.referenceCount('a-1'), 2);
      expect(graph.nodesUsing('a-1'), ['n-1', 'n-2']);
      expect(graph.documentsUsing('a-1'), ['d-1', 'd-2']);
      expect(graph.assetsInDocument('d-1'), ['a-1', 'a-2']);
      expect(graph.assetsInArtboard('ab-2'), ['a-1']);
      expect(graph.assetsInNode('n-1'), ['a-1', 'a-2']);
    });

    test('distinct projections deduplicate repeated ids', () {
      final graph = AssetUsageGraph(
        usages: [
          usage('a-1', nodeId: 'n-1', documentId: 'd-1'),
          usage('a-1', nodeId: 'n-1', artboardId: 'ab-2', documentId: 'd-1'),
        ],
      );
      expect(graph.nodesUsing('a-1'), ['n-1']);
      expect(graph.documentsUsing('a-1'), ['d-1']);
    });

    test('unused / shared / broken detection against a catalogue', () {
      final e = engine();
      registerMotif(e, id: 'a-1');
      registerMotif(e, id: 'a-2', hash: 'sha256:other');
      final graph = AssetUsageGraph(
        usages: [
          usage('a-1', nodeId: 'n-1'),
          usage('a-1', nodeId: 'n-2'),
          usage('ghost', nodeId: 'n-3'),
        ],
      );

      expect(graph.unusedAssetIds(e.catalogue), ['a-2']);
      expect(graph.sharedAssetIds(e.catalogue), ['a-1']);
      expect(graph.brokenReferences(e.catalogue).single.assetId, 'ghost');
    });

    test('withoutNode drops every edge of a deleted node in its document', () {
      final graph = AssetUsageGraph(
        usages: [
          usage('a-1', nodeId: 'n-1'),
          usage('a-2', nodeId: 'n-1'),
          usage('a-1', nodeId: 'n-2'),
        ],
      ).withoutNode('n-1', documentId: 'doc-1');
      expect(graph.count, 1);
      expect(graph.usages.single.nodeId, 'n-2');
    });

    test('withoutNode is document-scoped: a same-id node in another '
        'document keeps its edges (node ids collide across documents)', () {
      final graph = AssetUsageGraph(
        usages: [
          usage('a-1', nodeId: 'n-1', documentId: 'd-1'),
          usage('a-1', nodeId: 'n-1', documentId: 'd-2'),
        ],
      ).withoutNode('n-1', documentId: 'd-1');
      expect(graph.count, 1);
      expect(graph.usages.single.documentId, 'd-2');
      expect(
        graph.referenceCount('a-1'),
        1,
        reason: 'd-2 still references a-1 — it must not read as unused',
      );
    });

    test('sharing is counted per (document, node): colliding node ids in '
        'two documents are two distinct users, not one', () {
      final e = engine();
      registerMotif(e, id: 'a-1');
      final graph = AssetUsageGraph(
        usages: [
          usage('a-1', nodeId: 'n-1', documentId: 'd-1'),
          usage('a-1', nodeId: 'n-1', documentId: 'd-2'),
        ],
      );
      expect(graph.nodeKeysUsing('a-1'), ['d-1 n-1', 'd-2 n-1']);
      expect(
        graph.sharedAssetIds(e.catalogue),
        ['a-1'],
        reason: 'two documents both using a-1 makes it genuinely shared',
      );
      expect(
        graph.nodesUsing('a-1', documentId: 'd-1'),
        ['n-1'],
        reason: 'document-scoped query stays unambiguous',
      );
    });

    test('replacingDocument swaps one document wholesale and dedups', () {
      final graph = AssetUsageGraph(
        usages: [
          usage('a-1', documentId: 'd-1'),
          usage('a-1', documentId: 'd-2', nodeId: 'n-9'),
        ],
      ).replacingDocument('d-1', [
        usage('a-2', documentId: 'd-1'),
        usage('a-2', documentId: 'd-1'),
        usage('a-3', documentId: 'd-9', nodeId: 'n-x'),
      ]);

      expect(graph.assetsInDocument('d-1'), ['a-2']);
      expect(graph.assetsInDocument('d-2'), ['a-1']);
      expect(
        graph.assetsInDocument('d-9'),
        isEmpty,
        reason: 'a sync may only write edges of ITS document',
      );
    });

    test('graph JSON round-trips losslessly', () {
      final graph = AssetUsageGraph(
        usages: [usage('a-1'), usage('a-2', nodeId: 'n-2')],
      );
      expect(AssetUsageGraph.fromJson(graph.toJson()), graph);
    });
  });
}
