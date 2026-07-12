import 'package:core_asset/core_asset.dart';
import 'package:test/test.dart';
import 'support/fixtures.dart';

void main() {
  group('FebricAsset', () {
    FebricAsset fullAsset() {
      return FebricAsset(
        id: 'a-1',
        name: 'Boteh',
        type: AssetType.motif,
        origin: AssetOrigin.imported,
        mimeType: 'image/png',
        hash: 'sha256:v2',
        width: 512,
        height: 512,
        dpi: 300,
        colourSpace: AssetColourSpace.srgb,
        createdAt: t0,
        modifiedAt: t0.add(const Duration(minutes: 5)),
        version: 2,
        versions: [
          AssetVersionRecord(
            version: 1,
            hash: 'sha256:v1',
            createdAt: t0,
            operation: 'import',
          ),
          AssetVersionRecord(
            version: 2,
            hash: 'sha256:v2',
            createdAt: t0.add(const Duration(minutes: 5)),
            operation: 'colour_shift',
            provenanceId: 'prov-1',
            comment: 'Warmer maroon',
            parameters: {'deltaHue': 12},
          ),
        ],
        tags: const ['paisley', 'hero'],
        metadata: const {'palette_signature': 'warm-01'},
      );
    }

    test('a fully loaded asset JSON round-trips losslessly', () {
      final asset = fullAsset();
      final restored = FebricAsset.fromJson(asset.toJson());
      expect(restored, asset);
      expect(restored.toJson(), asset.toJson());
    });

    test('enums travel by frozen wire names', () {
      final json = fullAsset().toJson();
      expect(json['type'], 'motif');
      expect(json['origin'], 'imported');
      expect(json['colourSpace'], 'srgb');
    });

    test('non-visual assets carry no dimensions or colour space', () {
      final font = FebricAsset(
        id: 'a-2',
        name: 'Nastaliq',
        type: AssetType.font,
        origin: AssetOrigin.library,
        mimeType: 'font/ttf',
        hash: 'sha256:f1',
        createdAt: t0,
        modifiedAt: t0,
      );
      final restored = FebricAsset.fromJson(font.toJson());
      expect(restored.colourSpace, isNull);
      expect(restored.width, isNull);
      expect(restored, font);
    });

    test('lineage helpers: ownsHash, allHashes, currentVersion', () {
      final asset = fullAsset();
      expect(asset.ownsHash('sha256:v2'), isTrue);
      expect(asset.ownsHash('sha256:v1'), isTrue, reason: 'history counts');
      expect(asset.ownsHash('sha256:v3'), isFalse);
      expect(asset.allHashes, ['sha256:v1', 'sha256:v2']);
      expect(asset.currentVersion!.version, 2);
      expect(asset.isLineageConsistent, isTrue);
    });

    test('lineage inconsistency is detectable', () {
      final broken = fullAsset().copyWith(hash: 'sha256:drifted');
      expect(broken.isLineageConsistent, isFalse);
      final gapped = fullAsset().copyWith(
        versions: [
          AssetVersionRecord(version: 1, hash: 'sha256:v1', createdAt: t0),
          AssetVersionRecord(version: 3, hash: 'sha256:v2', createdAt: t0),
        ],
      );
      expect(gapped.isLineageConsistent, isFalse);
    });
  });

  group('AssetCatalogue', () {
    test('lookups: by id, by any-version hash, by type, by tag', () {
      final e = engine();
      final motif = registerMotif(e, id: 'a-1');
      e.addVersion('a-1', hash: 'sha256:m2');
      e.register(
        id: 'a-2',
        name: 'Silk Ground',
        type: AssetType.fabric,
        origin: AssetOrigin.library,
        mimeType: 'image/tiff',
        hash: 'sha256:f1',
        width: 2048,
        height: 2048,
        tags: const ['ground'],
      );
      final catalogue = e.catalogue;

      expect(catalogue.count, 2);
      expect(catalogue.byId('a-1')!.name, motif.name);
      expect(catalogue.byHash('sha256:m2')!.id, 'a-1');
      expect(
        catalogue.byHash('sha256:m1')!.id,
        'a-1',
        reason: 'historical hashes stay resolvable forever',
      );
      expect(catalogue.byHash('sha256:none'), isNull);
      expect(catalogue.ofType(AssetType.fabric).single.id, 'a-2');
      expect(catalogue.withTag('paisley').single.id, 'a-1');
      expect(catalogue.withTag('ground').single.id, 'a-2');
    });

    test('duplicate content detection groups identical current hashes', () {
      final e = engine();
      registerMotif(e, id: 'a-1', hash: 'sha256:same');
      registerMotif(e, id: 'a-2', name: 'Boteh Copy', hash: 'sha256:same');
      registerMotif(e, id: 'a-3', name: 'Unique', hash: 'sha256:other');

      final groups = e.catalogue.duplicateGroups;
      expect(groups.keys, ['sha256:same']);
      expect(groups['sha256:same']!.map((a) => a.id), ['a-1', 'a-2']);
    });

    test('with/without are immutable edits', () {
      const empty = AssetCatalogue.empty;
      final e = engine();
      final asset = registerMotif(e, id: 'a-1');
      final one = empty.withAsset(asset);
      expect(empty.count, 0);
      expect(one.count, 1);
      expect(one.withoutAsset('a-1').count, 0);
      expect(one.count, 1);
    });
  });

  group('AssetEngineState', () {
    test('catalogue + graph persist and round-trip as one state', () {
      final e = engine();
      registerMotif(e, id: 'a-1');
      e.recordUsage(usage('a-1'));

      final state = AssetEngineState(
        projectId: 'project-1',
        catalogue: e.catalogue,
        graph: e.graph,
      );
      final restored = AssetEngineState.fromJson(state.toJson());
      expect(restored, state);
      expect(restored.catalogue.byId('a-1'), isNotNull);
      expect(restored.graph.referenceCount('a-1'), 1);
    });
  });
}
