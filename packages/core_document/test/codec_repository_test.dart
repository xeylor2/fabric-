import 'dart:convert';
import 'package:core_document/core_document.dart';
import 'package:test/test.dart';
import 'support/fixtures.dart';

final class _RenameTitleMigration implements FebricMigration {
  @override
  int get fromSchema => 0;

  @override
  Map<String, Object?> migrate(Map<String, Object?> json) {
    // Simulated legacy shape: schema 0 stored the title under `name`.
    final metadata = {...json['metadata']! as Map<String, Object?>};
    metadata['title'] = metadata.remove('name');
    final manifest = {...json['manifest']! as Map<String, Object?>};
    manifest['version'] = {'schema': 1, 'generator': 'migrated'};
    return {...json, 'metadata': metadata, 'manifest': manifest};
  }
}

void main() {
  group('FebricCodec', () {
    const codec = FebricCodec();

    test('encode/decode is lossless and carries the manifest head', () {
      final doc = documentWithArtboard();
      final encoded = codec.encode(doc);
      final raw = jsonDecode(encoded) as Map<String, Object?>;
      expect(
        (raw['manifest']! as Map<String, Object?>)['format'],
        DocumentManifest.formatName,
      );
      expect(codec.decode(encoded), doc);
    });

    test('refuses non-JSON, foreign formats and missing schema loudly', () {
      expect(
        () => codec.decode('not json'),
        throwsA(isA<FebricFormatException>()),
      );
      expect(
        () => codec.decode('{"manifest": {"format": "psd"}}'),
        throwsA(isA<FebricFormatException>()),
      );
      expect(
        () => codec.decode('{"manifest": {"format": "febric", "version": {}}}'),
        throwsA(isA<FebricFormatException>()),
      );
    });

    test('refuses documents from a NEWER schema (forward compatibility)', () {
      final doc = documentWithArtboard();
      final raw = jsonDecode(codec.encode(doc)) as Map<String, Object?>;
      final manifest = {...raw['manifest']! as Map<String, Object?>};
      manifest['version'] = {'schema': 999, 'generator': 'future'};
      final future = jsonEncode({...raw, 'manifest': manifest});
      expect(() => codec.decode(future), throwsA(isA<FebricFormatException>()));
    });

    test('migrates older schemas stepwise through the registry', () {
      final doc = documentWithArtboard();
      final raw =
          jsonDecode(const FebricCodec().encode(doc)) as Map<String, Object?>;
      // Forge a schema-0 document with the legacy `name` field.
      final metadata = {...raw['metadata']! as Map<String, Object?>};
      metadata['name'] = metadata.remove('title');
      final manifest = {...raw['manifest']! as Map<String, Object?>};
      manifest['version'] = {'schema': 0, 'generator': 'febric-0'};
      final legacy = jsonEncode({
        ...raw,
        'metadata': metadata,
        'manifest': manifest,
      });

      expect(
        () => const FebricCodec().decode(legacy),
        throwsA(isA<FebricFormatException>()),
        reason: 'no migration registered',
      );

      final migrating = FebricCodec(migrations: [_RenameTitleMigration()]);
      final restored = migrating.decode(legacy);
      expect(restored.metadata.title, 'Eid Lawn 01');
    });
  });

  group('DocumentRepository (in-memory implementation)', () {
    test('save/load/exists/delete/list honour the contract', () async {
      final repository = InMemoryDocumentRepository();
      final doc = documentWithArtboard();

      expect(await repository.exists(doc.id), isFalse);
      await repository.save(doc);
      expect(await repository.exists(doc.id), isTrue);
      expect(await repository.load(doc.id), doc);
      expect(await repository.list(), [doc.id]);

      await repository.delete(doc.id);
      expect(await repository.load(doc.id), isNull);
      expect(await repository.list(), isEmpty);
    });
  });
}
