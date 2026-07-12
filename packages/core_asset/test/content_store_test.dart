import 'dart:convert';
import 'dart:typed_data';

import 'package:core_asset/core_asset.dart';
import 'package:test/test.dart';
import 'support/fixtures.dart';

Uint8List bytesOf(String text) => Uint8List.fromList(utf8.encode(text));

void main() {
  group('Sha256ContentHasher', () {
    test('produces the canonical sha256 address (known vector)', () {
      const hasher = Sha256ContentHasher();
      expect(
        hasher.hashOf(bytesOf('abc')),
        'sha256:ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad',
      );
    });

    test('is deterministic and content-sensitive', () {
      const hasher = Sha256ContentHasher();
      expect(hasher.hashOf(bytesOf('febric')), hasher.hashOf(bytesOf('febric')));
      expect(
        hasher.hashOf(bytesOf('febric')),
        isNot(hasher.hashOf(bytesOf('fabric'))),
      );
    });
  });

  group('InMemoryAssetContentStore (content-addressed)', () {
    test('put/get round-trips bytes at their address', () async {
      final store = InMemoryAssetContentStore();
      final hash = await store.put(bytesOf('boteh-pixels'));
      expect(hash, startsWith('sha256:'));
      expect(await store.contains(hash), isTrue);
      expect(await store.get(hash), bytesOf('boteh-pixels'));
      expect(await store.get('sha256:absent'), isNull);
    });

    test('identical content deduplicates to one entry (no duplicate '
        'storage, by construction)', () async {
      final store = InMemoryAssetContentStore();
      final first = await store.put(bytesOf('same'));
      final second = await store.put(bytesOf('same'));
      expect(first, second);
      expect(await store.hashes(), hasLength(1));
    });

    test('stored content is immune to caller-side mutation', () async {
      final store = InMemoryAssetContentStore();
      final original = bytesOf('immutable');
      final hash = await store.put(original);
      original[0] = 0;
      final first = (await store.get(hash))!;
      first[1] = 0;
      expect(await store.get(hash), bytesOf('immutable'));
    });

    test('remove garbage-collects an address', () async {
      final store = InMemoryAssetContentStore();
      final hash = await store.put(bytesOf('gone'));
      await store.remove(hash);
      expect(await store.contains(hash), isFalse);
    });
  });

  group('content store ↔ engine (bytes live once; everyone holds hashes)', () {
    test('bytes → store.put → register(hash) → catalogue.byHash resolves '
        'AND the bytes are in the store, exactly once', () async {
      final store = InMemoryAssetContentStore();
      final e = engine();

      final hash = await store.put(bytesOf('boteh-pixels'));
      final asset = registerMotif(e, id: 'a-1', hash: hash);

      // The asset holds only the hash; the catalogue resolves by it.
      expect(asset.hash, hash);
      expect(e.catalogue.byId('a-1')!.hash, hash);
      expect(e.catalogue.byHash(hash)!.id, 'a-1');
      // The bytes live in the store, addressed by that same hash.
      expect(await store.contains(hash), isTrue);
      expect(await store.get(hash), bytesOf('boteh-pixels'));
    });

    test('registering the same content under two identities stores the '
        'bytes once — no duplicate storage', () async {
      final store = InMemoryAssetContentStore();
      final e = engine();

      final h1 = await store.put(bytesOf('shared'));
      final h2 = await store.put(bytesOf('shared'));
      expect(h1, h2, reason: 'content-addressed: identical bytes, one address');

      registerMotif(e, id: 'a-1', hash: h1);
      registerMotif(e, id: 'a-2', name: 'Copy', hash: h2);

      // Two identities, one stored byte-string, flagged as duplicate content.
      expect(await store.hashes(), hasLength(1));
      expect(e.catalogue.duplicateGroups[h1]!.map((a) => a.id), ['a-1', 'a-2']);
    });

    test('a new version puts new bytes; both addresses coexist in the '
        'store and the old hash still resolves in the catalogue', () async {
      final store = InMemoryAssetContentStore();
      final e = engine();

      final v1 = await store.put(bytesOf('v1-pixels'));
      registerMotif(e, id: 'a-1', hash: v1);
      final v2 = await store.put(bytesOf('v2-pixels'));
      e.addVersion('a-1', hash: v2, operation: 'colour_shift');

      expect(await store.hashes()..sort(), containsAll([v1, v2]));
      expect(
        e.catalogue.byHash(v1)!.id,
        'a-1',
        reason: 'historical content address stays resolvable',
      );
      expect(e.catalogue.byHash(v2)!.id, 'a-1');
    });
  });
}
