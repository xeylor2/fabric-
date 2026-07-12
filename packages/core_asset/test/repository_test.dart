import 'package:core_asset/core_asset.dart';
import 'package:test/test.dart';
import 'support/fixtures.dart';

void main() {
  group('InMemoryAssetRepository (full contract semantics)', () {
    test('save/load/exists/delete/list round-trip engine state', () async {
      final repository = InMemoryAssetRepository();
      final e = engine();
      registerMotif(e, id: 'a-1');
      e.recordUsage(usage('a-1'));
      final state = AssetEngineState(
        projectId: 'project-1',
        catalogue: e.catalogue,
        graph: e.graph,
      );

      expect(await repository.exists('project-1'), isFalse);
      await repository.save(state);
      expect(await repository.exists('project-1'), isTrue);
      expect(await repository.list(), ['project-1']);
      expect(await repository.load('project-1'), state);

      await repository.delete('project-1');
      expect(await repository.load('project-1'), isNull);
      expect(await repository.list(), isEmpty);
    });

    test('a rehydrated engine answers the same queries', () async {
      final repository = InMemoryAssetRepository();
      final e = engine();
      registerMotif(e, id: 'a-1');
      registerMotif(e, id: 'a-2', hash: 'sha256:other');
      e.recordUsage(usage('a-1', nodeId: 'n-1'));
      e.recordUsage(usage('a-1', nodeId: 'n-2'));
      await repository.save(
        AssetEngineState(
          projectId: 'project-1',
          catalogue: e.catalogue,
          graph: e.graph,
        ),
      );

      final loaded = (await repository.load('project-1'))!;
      final rehydrated = AssetEngine(
        catalogue: loaded.catalogue,
        graph: loaded.graph,
      );
      expect(rehydrated.sharedAssetIds, ['a-1']);
      expect(rehydrated.unusedAssetIds, ['a-2']);
      expect(rehydrated.catalogue.byHash('sha256:m1')!.id, 'a-1');
    });
  });
}
