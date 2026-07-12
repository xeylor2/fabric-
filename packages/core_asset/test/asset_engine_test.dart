import 'package:core_asset/core_asset.dart';
import 'package:core_lock/core_lock.dart';
import 'package:test/test.dart';
import 'support/fixtures.dart';

void main() {
  group('registration', () {
    test('registers version 1 with deterministic identity and stamps', () {
      final e = engine();
      final result = e.register(
        name: 'Boteh',
        type: AssetType.motif,
        origin: AssetOrigin.imported,
        mimeType: 'image/png',
        hash: 'sha256:m1',
        width: 512,
        height: 512,
      );
      final asset = (result as AssetApplied).asset!;
      expect(asset.id, 'a-1', reason: 'id from the IdGenerator seam');
      expect(asset.version, 1);
      expect(asset.versions.single.hash, 'sha256:m1');
      expect(asset.versions.single.operation, 'imported');
      expect(asset.createdAt, t0);
      expect(asset.modifiedAt, t0);
      expect(asset.isLineageConsistent, isTrue);
      expect(e.catalogue.byId('a-1'), asset);
    });

    test('duplicate identity is refused (one uuid, everywhere)', () {
      final e = engine();
      registerMotif(e, id: 'a-1');
      final again = e.register(
        id: 'a-1',
        name: 'Other',
        type: AssetType.palette,
        origin: AssetOrigin.created,
        mimeType: 'application/json',
        hash: 'sha256:p1',
      );
      expect(
        (again as AssetRejected).reason,
        AssetRejectionReason.duplicateIdentity,
      );
    });

    test('raster types require full positive dimensions', () {
      final e = engine();
      final missing = e.register(
        name: 'Ground',
        type: AssetType.texture,
        origin: AssetOrigin.imported,
        mimeType: 'image/png',
        hash: 'sha256:t1',
        width: 512,
      );
      expect((missing as AssetRejected).reason, AssetRejectionReason.invalid);

      final negative = e.register(
        name: 'Ground',
        type: AssetType.texture,
        origin: AssetOrigin.imported,
        mimeType: 'image/png',
        hash: 'sha256:t1',
        width: -1,
        height: 512,
      );
      expect((negative as AssetRejected).reason, AssetRejectionReason.invalid);

      final palette = e.register(
        name: 'Eid Palette',
        type: AssetType.palette,
        origin: AssetOrigin.created,
        mimeType: 'application/json',
        hash: 'sha256:p1',
      );
      expect(palette, isA<AssetApplied>(), reason: 'non-raster: no pixels');
    });

    test('empty name, mime or hash are refused', () {
      final e = engine();
      for (final result in [
        e.register(
          name: '  ',
          type: AssetType.palette,
          origin: AssetOrigin.created,
          mimeType: 'application/json',
          hash: 'sha256:p1',
        ),
        e.register(
          name: 'P',
          type: AssetType.palette,
          origin: AssetOrigin.created,
          mimeType: ' ',
          hash: 'sha256:p1',
        ),
        e.register(
          name: 'P',
          type: AssetType.palette,
          origin: AssetOrigin.created,
          mimeType: 'application/json',
          hash: '',
        ),
      ]) {
        expect((result as AssetRejected).reason, AssetRejectionReason.invalid);
      }
    });
  });

  group('immutable versioning (never overwrite)', () {
    test('addVersion appends lineage; old hashes stay resolvable', () {
      final e = engine(clock: TickingClock(t0));
      registerMotif(e, id: 'a-1');
      final result = e.addVersion(
        'a-1',
        hash: 'sha256:m2',
        operation: 'colour_shift',
        provenanceId: 'prov-1',
        parameters: const {'deltaHue': 12},
      );

      final asset = (result as AssetApplied).asset!;
      expect(asset.version, 2);
      expect(asset.hash, 'sha256:m2');
      expect(asset.versions.length, 2);
      expect(asset.versions.first.hash, 'sha256:m1', reason: 'v1 untouched');
      expect(asset.versions.last.provenanceId, 'prov-1');
      expect(asset.isLineageConsistent, isTrue);
      expect(asset.modifiedAt.isAfter(asset.createdAt), isTrue);
      expect(
        e.catalogue.byHash('sha256:m1')!.id,
        'a-1',
        reason: 'immutable lineage: the old address still resolves',
      );
    });

    test('identical content is refused — a version means new content', () {
      final e = engine();
      registerMotif(e, id: 'a-1');
      final result = e.addVersion('a-1', hash: 'sha256:m1');
      expect((result as AssetRejected).reason, AssetRejectionReason.invalid);
    });

    test('versioning an unknown asset is refused', () {
      final e = engine();
      final result = e.addVersion('ghost', hash: 'sha256:x');
      expect((result as AssetRejected).reason, AssetRejectionReason.notFound);
    });

    test('dimension/colour-space refinements ride the new version', () {
      final e = engine();
      registerMotif(e, id: 'a-1');
      final result = e.addVersion(
        'a-1',
        hash: 'sha256:up',
        width: 2048,
        height: 2048,
        dpi: 600,
        colourSpace: AssetColourSpace.adobeRgb,
        operation: 'ai_upscale',
      );
      final asset = (result as AssetApplied).asset!;
      expect(asset.width, 2048);
      expect(asset.dpi, 600);
      expect(asset.colourSpace, AssetColourSpace.adobeRgb);
    });

    test('a version cannot move a raster asset into invalid dimensions '
        '(same discipline as registration)', () {
      final e = engine();
      registerMotif(e, id: 'a-1');
      expect(
        (e.addVersion('a-1', hash: 'sha256:m2', width: -5) as AssetRejected)
            .reason,
        AssetRejectionReason.invalid,
      );
      expect(
        (e.addVersion('a-1', hash: 'sha256:m3', height: 0) as AssetRejected)
            .reason,
        AssetRejectionReason.invalid,
      );
      // The rejected versions never landed — lineage stays at v1.
      expect(e.catalogue.byId('a-1')!.version, 1);
    });
  });

  group('amend (describes the asset, not its content)', () {
    test('renames, retags and annotates without a new version', () {
      final e = engine();
      registerMotif(e, id: 'a-1');
      final result = e.amend(
        'a-1',
        name: 'Boteh Hero',
        tags: const ['paisley', 'hero'],
        metadata: const {'palette_signature': 'warm-01'},
      );
      final asset = (result as AssetApplied).asset!;
      expect(asset.name, 'Boteh Hero');
      expect(asset.tags, ['paisley', 'hero']);
      expect(asset.version, 1, reason: 'metadata edits are not versions');
    });

    test('empty amendments and empty names are refused', () {
      final e = engine();
      registerMotif(e, id: 'a-1');
      expect(
        (e.amend('a-1') as AssetRejected).reason,
        AssetRejectionReason.invalid,
      );
      expect(
        (e.amend('a-1', name: ' ') as AssetRejected).reason,
        AssetRejectionReason.invalid,
      );
      expect(
        (e.amend('ghost', name: 'X') as AssetRejected).reason,
        AssetRejectionReason.notFound,
      );
    });
  });

  group('Lock Engine gating (invariant I4 — checked before compute)', () {
    test('an object lock on the asset blocks every mutation', () {
      final e = engine();
      registerMotif(e, id: 'a-1');
      e.syncLocks(
        const LockSet(
          locks: [
            LockState(
              scope: LockScope.object,
              targetId: 'a-1',
              origin: LockOrigin.review,
              reason: 'Approved for production',
            ),
          ],
        ),
      );

      for (final result in [
        e.addVersion('a-1', hash: 'sha256:m2'),
        e.amend('a-1', name: 'X'),
        e.remove('a-1'),
        e.remove('a-1', force: true),
      ]) {
        final rejected = result as AssetRejected;
        expect(rejected.reason, AssetRejectionReason.locked);
        expect(rejected.blockedBy!.reason, 'Approved for production');
      }

      // Target-scoped: an unrelated registered asset stays mutable.
      registerMotif(e, id: 'a-9', hash: 'sha256:free');
      expect(e.amend('a-9', name: 'Free'), isA<AssetApplied>());
    });

    test('the lock veto PRECEDES validation (checked before compute) — a '
        'locked target reports locked, not the would-be invalid reason', () {
      final e = engine();
      registerMotif(e, id: 'a-1');
      e.syncLocks(
        const LockSet(locks: [LockState(scope: LockScope.project)]),
      );
      // Identical content would be `invalid` if validation ran first.
      expect(
        (e.addVersion('a-1', hash: 'sha256:m1') as AssetRejected).reason,
        AssetRejectionReason.locked,
      );
      // Empty name would be `invalid`; duplicate id would be
      // `duplicateIdentity` — the lock wins over both.
      expect(
        (e.register(
              name: '  ',
              type: AssetType.palette,
              origin: AssetOrigin.created,
              mimeType: 'application/json',
              hash: 'sha256:p1',
            )
            as AssetRejected)
            .reason,
        AssetRejectionReason.locked,
      );
      expect(
        (e.register(
              id: 'a-1',
              name: 'Dup',
              type: AssetType.motif,
              origin: AssetOrigin.imported,
              mimeType: 'image/png',
              hash: 'sha256:x',
              width: 8,
              height: 8,
            )
            as AssetRejected)
            .reason,
        AssetRejectionReason.locked,
      );
    });

    test('project and document locks imply object via the frozen '
        'hierarchy — assets are covered without a new scope', () {
      for (final scope in [LockScope.project, LockScope.document]) {
        final e = engine();
        registerMotif(e, id: 'a-1');
        e.syncLocks(LockSet(locks: [LockState(scope: scope)]));
        expect(
          (e.addVersion('a-1', hash: 'sha256:m2') as AssetRejected).reason,
          AssetRejectionReason.locked,
          reason: '${scope.wireName} lock must gate assets',
        );
        expect(
          e.register(
            name: 'New',
            type: AssetType.palette,
            origin: AssetOrigin.created,
            mimeType: 'application/json',
            hash: 'sha256:p1',
          ),
          isA<AssetRejected>(),
          reason: 'registration is a mutation too',
        );
      }
    });

    test('releasing locks restores mutation', () {
      final e = engine();
      registerMotif(e, id: 'a-1');
      e.syncLocks(
        const LockSet(locks: [LockState(scope: LockScope.project)]),
      );
      expect(e.amend('a-1', name: 'X'), isA<AssetRejected>());
      e.syncLocks(const LockSet());
      expect(e.amend('a-1', name: 'X'), isA<AssetApplied>());
    });
  });

  group('reference-counted removal', () {
    test('an in-use asset refuses removal; releasing usage permits it', () {
      final e = engine();
      registerMotif(e, id: 'a-1');
      e.recordUsage(usage('a-1'));

      final refused = e.remove('a-1');
      expect((refused as AssetRejected).reason, AssetRejectionReason.inUse);
      expect(refused.detail, contains('1 reference'));

      e.releaseUsage(usage('a-1'));
      expect(e.remove('a-1'), isA<AssetApplied>());
      expect(e.catalogue.byId('a-1'), isNull);
    });

    test('force removal leaves DETECTABLE broken references, never '
        'silent ones', () {
      final e = engine();
      registerMotif(e, id: 'a-1');
      e.recordUsage(usage('a-1'));
      expect(e.remove('a-1', force: true), isA<AssetApplied>());
      expect(e.brokenReferences.single.assetId, 'a-1');
    });

    test('removing an unknown asset is refused', () {
      final e = engine();
      expect(
        (e.remove('ghost') as AssetRejected).reason,
        AssetRejectionReason.notFound,
      );
    });
  });

  group('usage recording', () {
    test('usage of an unknown asset is refused (documents sync instead)', () {
      final e = engine();
      final result = e.recordUsage(usage('ghost'));
      expect((result as AssetRejected).reason, AssetRejectionReason.notFound);
    });

    test('recording the same edge twice is a no-op (set semantics)', () {
      final e = engine();
      registerMotif(e, id: 'a-1');
      e.recordUsage(usage('a-1'));
      e.recordUsage(usage('a-1'));
      expect(e.graph.count, 1);
    });

    test('document sync replaces one document and accepts unknown ids', () {
      final e = engine();
      registerMotif(e, id: 'a-1');
      e.recordUsage(usage('a-1', documentId: 'doc-other', nodeId: 'n-9'));
      e.syncDocumentUsages('doc-1', [
        usage('a-1'),
        usage('ghost', nodeId: 'n-2'),
      ]);

      expect(e.graph.referenceCount('a-1'), 2);
      expect(e.brokenReferences.single.assetId, 'ghost');

      e.syncDocumentUsages('doc-1', const []);
      expect(
        e.graph.usagesOf('a-1').single.documentId,
        'doc-other',
        reason: 'other documents are untouched by a sync',
      );
      expect(e.brokenReferences, isEmpty);
    });
  });

  group('statistics', () {
    test('derive live from catalogue + graph', () {
      final e = engine();
      registerMotif(e, id: 'a-1', hash: 'sha256:same');
      registerMotif(e, id: 'a-2', name: 'Copy', hash: 'sha256:same');
      e.register(
        id: 'a-3',
        name: 'Palette',
        type: AssetType.palette,
        origin: AssetOrigin.created,
        mimeType: 'application/json',
        hash: 'sha256:p1',
      );
      e.addVersion('a-3', hash: 'sha256:p2');
      e.recordUsage(usage('a-1', nodeId: 'n-1'));
      e.recordUsage(usage('a-1', nodeId: 'n-2'));
      e.syncDocumentUsages('doc-2', [usage('ghost', documentId: 'doc-2')]);

      final stats = e.statistics;
      expect(stats.assets, 3);
      expect(stats.byType, {'motif': 2, 'palette': 1});
      expect(stats.totalVersions, 4);
      expect(stats.usages, 3);
      expect(stats.unused, 2, reason: 'a-2 and a-3 are unreferenced');
      expect(stats.shared, 1, reason: 'a-1 is used by two nodes');
      expect(stats.duplicateGroups, 1);
      expect(stats.broken, 1);
    });
  });
}
