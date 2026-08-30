import 'dart:io';
import 'dart:typed_data';

import 'package:core_asset/core_asset.dart';
import 'package:core_document/core_document.dart';
// Prefixed: core_lock's LockState collides with Flutter's widget LockState.
import 'package:core_lock/core_lock.dart' as lock;
import 'package:core_textile/core_textile.dart';
import 'package:febric/di/design_tree_session.dart';
import 'package:febric/di/garment_content.dart';
import 'package:febric/di/textile_artwork.dart';
import 'package:febric/workspace/design_tree_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

/// Textile artwork upload & replacement — the fabric / print source of a
/// garment section, and the printed motif.
///
/// The content↔asset binding is the frozen ADR-0016 contract, reused exactly:
/// an [AssetRecord] in the document's own frozen `AssetRegistry` (written by
/// the frozen `importAsset`) referenced from the content node's frozen
/// `asset_id` metadata key (written by the frozen `setNodeMetadata`), in the
/// already-approved order. Bytes never enter the document — they live once in
/// the frozen content-addressed store, exactly as ADR-0016 rule 2 requires.
/// Which asset an upload becomes follows the target's own frozen `object_type`
/// through the frozen `DocumentAssetBinding` mapping.
///
/// Replacement re-points the SAME node, so the node keeps its identity, its
/// classification, its z-position and its independence: no flattening, no
/// second representation, no parallel mutation path.
void main() {
  DesignNode treeRoot(DocumentEngine engine) =>
      engine.document.artboards.first.designTreeRoot;

  /// Resolves exactly one node through the frozen semantic resolver.
  DesignNode at(DocumentEngine engine, String path) =>
      SemanticPath.parse(path).resolve(treeRoot(engine)).single;

  /// The printed motif of a field zone (child order IS z-order: the substrate
  /// first, the printed motif above it).
  DesignNode motifAt(DocumentEngine engine, String path) =>
      at(engine, path).children.last;

  /// The substrate cloth of a field zone — first child, beneath the motif.
  DesignNode fabricAt(DocumentEngine engine, String path) =>
      at(engine, path).children.first;

  /// Distinct artwork payloads. The bytes only have to differ — nothing in
  /// this stage decodes them; the frozen hasher addresses them.
  TextileArtwork artwork(String name, int seed) => TextileArtwork(
    name: name,
    mimeType: 'image/png',
    bytes: Uint8List.fromList(
      List<int>.generate(24, (i) => (i * 7 + seed) % 256),
    ),
  );

  DesignTreeSession sessionWithGarments() {
    final session = DesignTreeSession.inMemory();
    for (final type in launchGarmentTypes) {
      final result = session.instantiateGarment(type.wireName);
      expect(result, isA<CommandApplied>(), reason: session.lastResult);
    }
    return session;
  }

  String? artworkRefOf(DesignNode node) => NodeAssetBinding.assetIdOf(node);

  group('upload — the frozen import path, the lawful reference', () {
    test('artwork is registered as a motif asset and the motif references '
        'it by the frozen asset_id key', () async {
      final session = sessionWithGarments();
      addTearDown(session.dispose);
      final motif = motifAt(session.engine, '*.kurta.base.field');
      expect(artworkRefOf(motif), isNull);

      final result = await session.applyTextileArtworkBytes(
        motif.id,
        artwork('boteh.png', 1),
      );
      expect(result, isA<CommandApplied>(), reason: session.lastResult);

      final record = session.engine.document.assets.assets.values.single;
      expect(record.kind, AssetKind.motif);
      expect(record.source, AssetSource.imported);
      expect(record.name, 'boteh.png');
      expect(record.mimeType, 'image/png');
      expect(record.hash, startsWith('sha256:'));
      // The precise Asset Engine vocabularies ride the frozen lossless keys.
      expect(
        record.metadata[DocumentAssetBinding.assetTypeMetadataKey],
        AssetType.motif.wireName,
      );
      expect(
        record.metadata[DocumentAssetBinding.assetOriginMetadataKey],
        AssetOrigin.imported.wireName,
      );

      final bound = motifAt(session.engine, '*.kurta.base.field');
      expect(bound.id, motif.id);
      expect(artworkRefOf(bound), record.id);
      // The classification carrier is untouched; artwork is an addition.
      expect(bound.metadata['object_type'], TextileObjectType.motif.wireName);
    });

    test('bytes live only in the frozen content store, addressed by the '
        'record hash', () async {
      final session = sessionWithGarments();
      addTearDown(session.dispose);
      final art = artwork('paisley.png', 9);
      final motif = motifAt(session.engine, '*.kurta.ground.field');
      await session.applyTextileArtworkBytes(motif.id, art);

      final record = session.engine.document.assets.assets.values.single;
      expect(await session.artworkStore.get(record.hash), art.bytes);
      // The document itself carries identity + hash, never pixels.
      const codec = FebricCodec();
      expect(codec.encode(session.engine.document), isNot(contains('bytes')));
    });
    test('exactly two frozen commands land, in the approved order', () async {
      final session = sessionWithGarments();
      addTearDown(session.dispose);
      final before = session.engine.document.history.entries.length;
      final motif = motifAt(session.engine, '*.kurta.base.field');
      await session.applyTextileArtworkBytes(motif.id, artwork('a.png', 3));

      final added = session.engine.document.history.entries.skip(before);
      expect(added.map((e) => e.command), [
        isA<ImportAssetCommand>(),
        isA<SetNodeMetadataCommand>(),
      ]);
      // Every entry came through the one authority — nothing else can write.
      expect(added.map((e) => e.source), everyElement(CommandSource.user));
    });

    test(
      'identical artwork is registered once and shared by two motifs',
      () async {
        final session = sessionWithGarments();
        addTearDown(session.dispose);
        final art = artwork('shared.png', 5);
        final first = motifAt(session.engine, '*.kurta.base.field');
        final second = motifAt(session.engine, '*.pant.leg[left].field');

        expect(
          await session.applyTextileArtworkBytes(first.id, art),
          isA<CommandApplied>(),
        );
        expect(
          await session.applyTextileArtworkBytes(second.id, art),
          isA<CommandApplied>(),
        );

        // One asset, many nodes — the frozen content address is the dedup key.
        expect(session.engine.document.assets.count, 1);
        final assetId = session.engine.document.assets.assets.keys.single;
        expect(
          artworkRefOf(motifAt(session.engine, '*.kurta.base.field')),
          assetId,
        );
        expect(
          artworkRefOf(motifAt(session.engine, '*.pant.leg[left].field')),
          assetId,
        );
      },
    );
  });
  group(
    'fabric / print source — the substrate cloth takes its own artwork',
    () {
      test('fabric artwork registers as the frozen texture kind carrying the '
          'precise fabric type, and binds to the fabric node', () async {
        final session = sessionWithGarments();
        addTearDown(session.dispose);
        const path = '*.kurta.base.field';
        final fabric = fabricAt(session.engine, path);
        expect(
          fabric.metadata['object_type'],
          TextileObjectType.fabric.wireName,
        );

        final result = await session.applyTextileArtworkBytes(
          fabric.id,
          artwork('handloom.png', 31),
        );
        expect(result, isA<CommandApplied>(), reason: session.lastResult);

        final record = session.engine.document.assets.assets.values.single;
        // Coarse kind derived from the frozen mapping, precise type lossless.
        expect(record.kind, AssetKind.texture);
        expect(record.source, AssetSource.imported);
        expect(
          record.metadata[DocumentAssetBinding.assetTypeMetadataKey],
          AssetType.fabric.wireName,
        );
        final bound = fabricAt(session.engine, path);
        expect(bound.id, fabric.id);
        expect(artworkRefOf(bound), record.id);
        expect(
          bound.metadata['object_type'],
          TextileObjectType.fabric.wireName,
        );
      });

      test('fabric and motif in one zone hold independent artwork; replacing '
          'either leaves the other byte-identical', () async {
        final session = sessionWithGarments();
        addTearDown(session.dispose);
        const path = '*.kurta.base.field';
        final fabricId = fabricAt(session.engine, path).id;
        final motifId = motifAt(session.engine, path).id;

        await session.applyTextileArtworkBytes(
          fabricId,
          artwork('cloth.png', 41),
        );
        await session.applyTextileArtworkBytes(
          motifId,
          artwork('boteh.png', 42),
        );
        final clothRef = artworkRefOf(fabricAt(session.engine, path));
        final motifRef = artworkRefOf(motifAt(session.engine, path));
        expect(clothRef, isNotNull);
        expect(motifRef, isNotNull);
        expect(clothRef, isNot(motifRef));

        // Replace the motif: the substrate is untouched, and vice versa.
        final fabricBefore = fabricAt(session.engine, path);
        await session.applyTextileArtworkBytes(
          motifId,
          artwork('paisley.png', 43),
        );
        expect(fabricAt(session.engine, path), fabricBefore);
        expect(artworkRefOf(motifAt(session.engine, path)), isNot(motifRef));

        final motifBefore = motifAt(session.engine, path);
        await session.applyTextileArtworkBytes(
          fabricId,
          artwork('khadi.png', 44),
        );
        expect(motifAt(session.engine, path), motifBefore);
        expect(artworkRefOf(fabricAt(session.engine, path)), isNot(clothRef));
        // Four distinct uploads, four distinct assets — nothing overwritten.
        expect(session.engine.document.assets.count, 4);
      });

      test('byte-identical content uploaded as fabric and as motif stays two '
          'distinct assets — no cross-class aliasing', () async {
        final session = sessionWithGarments();
        addTearDown(session.dispose);
        const path = '*.pant.leg[left].field';
        final art = artwork('shared.png', 51);
        final fabricId = fabricAt(session.engine, path).id;
        final motifId = motifAt(session.engine, path).id;

        await session.applyTextileArtworkBytes(fabricId, art);
        await session.applyTextileArtworkBytes(motifId, art);

        final records = session.engine.document.assets.assets.values.toList();
        expect(records, hasLength(2));
        // One content address, two precise types — the dedup key is the pair.
        expect(records.map((r) => r.hash).toSet(), hasLength(1));
        expect(
          records
              .map((r) => r.metadata[DocumentAssetBinding.assetTypeMetadataKey])
              .toSet(),
          {AssetType.fabric.wireName, AssetType.motif.wireName},
        );
        expect(records.map((r) => r.kind).toSet(), {
          AssetKind.texture,
          AssetKind.motif,
        });
        expect(
          artworkRefOf(fabricAt(session.engine, path)),
          isNot(artworkRefOf(motifAt(session.engine, path))),
        );
        // And the bytes are one entry in the content-addressed store.
        expect(
          await session.artworkStore.contains(artworkContentHash(art)),
          isTrue,
        );
      });

      test('the fabric / print source of every garment section can be supplied '
          'without changing any structure', () async {
        final session = sessionWithGarments();
        addTearDown(session.dispose);
        const paths = <String>[
          '*.kurta.base.field',
          '*.kurta.ground.field',
          '*.pant.leg[right].field',
          '*.dupatta.middle_field.field',
        ];
        final shapeBefore = _shape(treeRoot(session.engine));
        for (final path in paths) {
          final fabric = fabricAt(session.engine, path);
          expect(
            await session.applyTextileArtworkBytes(
              fabric.id,
              artwork('cloth.png', 61),
            ),
            isA<CommandApplied>(),
            reason: '$path — ${session.lastResult}',
          );
          expect(artworkRefOf(fabricAt(session.engine, path)), isNotNull);
        }
        // One substrate asset shared by all four sections (identical cloth).
        expect(session.engine.document.assets.count, 1);
        expect(_shape(treeRoot(session.engine)), shapeBefore);
      });
    },
  );

  group('replacement — the same motif node, new artwork', () {
    test(
      'replacement re-points the same node and preserves its identity',
      () async {
        final session = sessionWithGarments();
        addTearDown(session.dispose);
        const path = '*.kurta.base.field';
        final motif = motifAt(session.engine, path);
        await session.applyTextileArtworkBytes(
          motif.id,
          artwork('first.png', 1),
        );
        final firstRef = artworkRefOf(motifAt(session.engine, path));

        // Keep editing the motif between the two uploads — it stays a normal,
        // independently editable content node throughout.
        expect(session.renameNode(motif.id, 'Boteh'), isA<CommandApplied>());

        final replaced = await session.applyTextileArtworkBytes(
          motif.id,
          artwork('second.png', 2),
        );
        expect(replaced, isA<CommandApplied>(), reason: session.lastResult);

        final after = motifAt(session.engine, path);
        expect(after.id, motif.id); // same node, not a successor
        expect(after.type, motif.type);
        expect(after.name, 'Boteh'); // edits made in between survive
        expect(after.children, motif.children);
        expect(after.metadata['object_type'], TextileObjectType.motif.wireName);
        expect(artworkRefOf(after), isNot(firstRef));
        expect(session.engine.document.assets.count, 2);
        // The superseded asset stays registered and resolvable — assets are
        // immutable and nothing is overwritten.
        expect(session.engine.document.assets.byId(firstRef!), isNotNull);
      },
    );
    test('only the intended motif changes: fabric, sibling motifs and the '
        'garment structure are untouched', () async {
      final session = sessionWithGarments();
      addTearDown(session.dispose);
      const path = '*.kurta.base.field';
      final zoneId = at(session.engine, path).id;
      expect(session.createMotif(zoneId), isA<CommandApplied>());

      final zoneBefore = at(session.engine, path);
      final fabricBefore = zoneBefore.children.first;
      final siblingBefore = zoneBefore.children[1];
      final targetId = zoneBefore.children.last.id;
      final otherGarmentsBefore = [
        at(session.engine, '*.pant.leg[left].field'),
        at(session.engine, '*.dupatta.middle_field.field'),
      ];

      await session.applyTextileArtworkBytes(targetId, artwork('only.png', 4));
      await session.applyTextileArtworkBytes(targetId, artwork('only2.png', 6));

      final zoneAfter = at(session.engine, path);
      expect(zoneAfter.id, zoneBefore.id);
      expect(zoneAfter.children.length, zoneBefore.children.length);
      expect(zoneAfter.children.first, fabricBefore); // byte-identical fabric
      expect(zoneAfter.children[1], siblingBefore); // untouched sibling motif
      expect(artworkRefOf(zoneAfter.children.last), isNotNull);
      expect(artworkRefOf(siblingBefore), isNull);
      expect([
        at(session.engine, '*.pant.leg[left].field'),
        at(session.engine, '*.dupatta.middle_field.field'),
      ], otherGarmentsBefore);
    });
    test('Kurta, Pant and Dupatta keep their whole structure across upload '
        'and replacement', () async {
      final session = sessionWithGarments();
      addTearDown(session.dispose);
      const paths = <String>[
        '*.kurta.base.field',
        '*.kurta.sleeve[right].field',
        '*.kurta.hero_motif.placement',
        '*.pant.leg[left].field',
        '*.dupatta.middle_field.field',
        '*.dupatta.corner_motif[1].placement',
      ];
      final shapeBefore = _shape(treeRoot(session.engine));

      for (final path in paths) {
        final motif = motifAt(session.engine, path);
        expect(
          await session.applyTextileArtworkBytes(
            motif.id,
            artwork('u.png', 11),
          ),
          isA<CommandApplied>(),
          reason: '$path — ${session.lastResult}',
        );
        expect(
          await session.applyTextileArtworkBytes(
            motif.id,
            artwork('r.png', 12),
          ),
          isA<CommandApplied>(),
          reason: '$path — ${session.lastResult}',
        );
        expect(artworkRefOf(motifAt(session.engine, path)), isNotNull);
      }

      // Every id, type and parent/child relationship is exactly as before:
      // artwork changed nothing structural in any of the three garments.
      expect(_shape(treeRoot(session.engine)), shapeBefore);
    });
  });
  group('refusal — what never lands, and what the frozen pipeline does', () {
    test('a non-content target is refused: the zone, the garment part, the '
        'garment and the root all reject artwork', () async {
      final session = sessionWithGarments();
      addTearDown(session.dispose);
      final zone = at(session.engine, '*.kurta.base.field');
      final before = session.engine.document;

      for (final id in <String>[
        zone.id, // the zone itself
        at(session.engine, '*.kurta.base').id, // the garment part
        at(session.engine, '*.kurta').id, // the garment
        treeRoot(session.engine).id, // the project root
      ]) {
        final result = await session.applyTextileArtworkBytes(
          id,
          artwork('nope.png', 8),
        );
        expect(result, isA<CommandRejected>(), reason: id);
        expect(
          (result as CommandRejected).reason,
          CommandRejectionReason.invalid,
          reason: id,
        );
      }
      expect(session.engine.document, same(before));
      expect(session.engine.document.assets.count, 0);
    });

    test('an absent node is refused not-found and registers nothing', () async {
      final session = sessionWithGarments();
      addTearDown(session.dispose);
      final before = session.engine.document;
      final result = await session.applyTextileArtworkBytes(
        'no-such-node',
        artwork('ghost.png', 2),
      );
      expect(result, isA<CommandRejected>());
      expect(
        (result as CommandRejected).reason,
        CommandRejectionReason.notFound,
      );
      expect(session.engine.document, same(before));
      expect(session.engine.document.assets.count, 0);
    });
    test(
      'a path that is not readable artwork never reaches the document',
      () async {
        final session = sessionWithGarments();
        addTearDown(session.dispose);
        final motifId = motifAt(session.engine, '*.kurta.base.field').id;
        final before = session.engine.document;

        final dir = Directory.systemTemp.createTempSync('febric-artwork-bad');
        addTearDown(() => dir.deleteSync(recursive: true));
        final empty = File('${dir.path}${Platform.pathSeparator}empty.png')
          ..writeAsBytesSync(const <int>[]);
        final notArtwork = File('${dir.path}${Platform.pathSeparator}notes.txt')
          ..writeAsBytesSync(const <int>[1, 2, 3]);

        for (final path in <String>[
          '',
          '   ',
          '${dir.path}${Platform.pathSeparator}missing.png',
          empty.path,
          notArtwork.path,
        ]) {
          final result = await session.applyTextileArtwork(motifId, path);
          expect(result, isA<CommandRejected>(), reason: path);
          expect(
            (result as CommandRejected).reason,
            CommandRejectionReason.invalid,
            reason: path,
          );
        }
        expect(session.engine.document, same(before));
        expect(session.engine.document.assets.count, 0);
        expect(
          artworkRefOf(motifAt(session.engine, '*.kurta.base.field')),
          isNull,
        );
      },
    );
    test('a locked motif rejects the artwork: the motif is untouched, the '
        'bytes never enter the store, and one undo withdraws the '
        'registration', () async {
      final session = sessionWithGarments();
      addTearDown(session.dispose);
      const path = '*.kurta.base.field';
      final motifId = motifAt(session.engine, path).id;
      expect(session.setNodeLocked(motifId, true), isA<CommandApplied>());
      final lockedMotif = motifAt(session.engine, path);
      final historyBefore = session.engine.document.history.entries.length;
      final art = artwork('locked.png', 7);

      final result = await session.applyTextileArtworkBytes(motifId, art);
      // The rejection is the engine's own, on the frozen node-lock rule.
      expect(result, isA<CommandRejected>());
      expect((result as CommandRejected).reason, CommandRejectionReason.locked);
      // The motif is byte-identical and carries no artwork.
      expect(motifAt(session.engine, path), lockedMotif);
      expect(artworkRefOf(motifAt(session.engine, path)), isNull);
      // The bytes followed the reference, so nothing was stored.
      expect(
        await session.artworkStore.contains(artworkContentHash(art)),
        isFalse,
      );

      // NOT ATOMIC, and documented as such: the registration that had to
      // precede the reference stands, because this architecture has no
      // grouping mechanism (Q7 discovered #1, open) and none was invented.
      // It is exactly one frozen command with one exact inverse.
      expect(session.engine.document.history.entries.length, historyBefore + 1);
      expect(
        session.engine.document.history.entries.last.command,
        isA<ImportAssetCommand>(),
      );
      expect(session.engine.document.assets.count, 1);
      expect(session.undo(), isA<CommandApplied>());
      expect(session.engine.document.assets.count, 0);
      expect(motifAt(session.engine, path), lockedMotif);
    });

    test('the composition is NOT atomic, and the frozen consequence is '
        'documented rather than compensated', () async {
      final session = sessionWithGarments();
      addTearDown(session.dispose);
      const path = '*.kurta.base.field';
      final motifId = motifAt(session.engine, path).id;
      expect(session.setNodeLocked(motifId, true), isA<CommandApplied>());
      final art = artwork('atomic.png', 21);

      // A refused reference still leaves its own prerequisite applied, so the
      // engine's history advances even though the operation reports rejected.
      // No grouping mechanism exists to make the pair one step (Q7 discovered
      // #1, open) and inventing a caller-side rollback would be worse: the
      // rollback is itself a forward command, so it would advance the
      // revision again AND truncate the redo branch. Asserted as the frozen
      // reality, not as a guarantee.
      final revisionBefore = session.engine.document.revision.value;
      expect(
        await session.applyTextileArtworkBytes(motifId, art),
        isA<CommandRejected>(),
      );
      expect(
        session.engine.document.revision.value,
        revisionBefore + 1, // the registration only — nothing else
      );

      // And the registration is not wasted: once the motif is unlocked the
      // same artwork is reused by content address, not registered twice.
      expect(session.setNodeLocked(motifId, false), isA<CommandApplied>());
      expect(
        await session.applyTextileArtworkBytes(motifId, art),
        isA<CommandApplied>(),
      );
      expect(session.engine.document.assets.count, 1);
      expect(
        await session.artworkStore.contains(artworkContentHash(art)),
        isTrue,
      );
    });

    test('an empty or non-artwork payload is refused at the bytes entry '
        'point too, not just the file one', () async {
      final session = sessionWithGarments();
      addTearDown(session.dispose);
      final motifId = motifAt(session.engine, '*.kurta.base.field').id;
      final before = session.engine.document;

      final bad = <TextileArtwork>[
        // No content: the empty digest must never become an asset.
        TextileArtwork(
          name: 'empty.png',
          mimeType: 'image/png',
          bytes: Uint8List(0),
        ),
        // Not artwork at all, however it was obtained.
        TextileArtwork(
          name: 'sheet.pdf',
          mimeType: 'application/pdf',
          bytes: Uint8List.fromList(const [1, 2, 3]),
        ),
      ];
      for (final payload in bad) {
        final result = await session.applyTextileArtworkBytes(motifId, payload);
        expect(result, isA<CommandRejected>(), reason: payload.name);
        expect(
          (result as CommandRejected).reason,
          CommandRejectionReason.invalid,
          reason: payload.name,
        );
      }
      expect(session.engine.document, same(before));
      expect(session.engine.document.assets.count, 0);
    });

    test('readArtworkFile refuses hostile paths instead of throwing', () {
      final dir = Directory.systemTemp.createTempSync('febric-artwork-hostile');
      addTearDown(() => dir.deleteSync(recursive: true));
      final asDirectory = Directory(
        '${dir.path}${Platform.pathSeparator}art.png',
      )..createSync();
      final real = File('${dir.path}${Platform.pathSeparator}real.png')
        ..writeAsBytesSync(const <int>[1, 2, 3]);

      for (final path in <String>[
        asDirectory.path, // a directory wearing an artwork extension
        '${real.path}${Platform.pathSeparator}inner.png', // a path through a file
        '${dir.path}${Platform.pathSeparator}missing.png',
        '${dir.path}${Platform.pathSeparator}noextension',
      ]) {
        expect(readArtworkFile(path), isNull, reason: path);
      }
      // The one real file still reads.
      expect(readArtworkFile(real.path)?.bytes, [1, 2, 3]);
    });

    test('a project lock refuses the registration itself — the frozen Lock '
        'Engine runs before anything else', () async {
      final engine = DocumentEngine(document: seedDocument());
      final session = DesignTreeSession(engine: engine);
      addTearDown(session.dispose);
      expect(session.createMotif('node-chest'), isA<CommandApplied>());
      final motifId = treeRoot(engine).findById('node-chest')!.children.last.id;

      expect(
        engine.apply(
          const DocumentCommand.setLock(
            lock: lock.LockState(
              scope: lock.LockScope.project,
              reason: 'locked for the motif artwork stage',
            ),
          ),
        ),
        isA<CommandApplied>(),
      );
      final before = engine.document;

      final result = await session.applyTextileArtworkBytes(
        motifId,
        artwork('locked.png', 7),
      );
      expect(result, isA<CommandRejected>());
      expect((result as CommandRejected).reason, CommandRejectionReason.locked);
      // Not one command got through: the document is the same instance.
      expect(engine.document, same(before));
      expect(engine.document.assets.count, 0);
    });
  });
  group("undo / redo — the engine's own mechanism", () {
    test('undo restores the previous artwork; redo restores the '
        'replacement', () async {
      final session = sessionWithGarments();
      addTearDown(session.dispose);
      const path = '*.kurta.base.field';
      final motifId = motifAt(session.engine, path).id;

      await session.applyTextileArtworkBytes(motifId, artwork('first.png', 1));
      final firstRef = artworkRefOf(motifAt(session.engine, path));
      await session.applyTextileArtworkBytes(motifId, artwork('second.png', 2));
      final secondRef = artworkRefOf(motifAt(session.engine, path));
      expect(secondRef, isNot(firstRef));

      // The replacement is one reference write, so one undo puts the previous
      // artwork back — the frozen inverse carries it verbatim.
      expect(session.undo(), isA<CommandApplied>()); // reference
      expect(artworkRefOf(motifAt(session.engine, path)), firstRef);
      expect(session.redo(), isA<CommandApplied>());
      expect(artworkRefOf(motifAt(session.engine, path)), secondRef);
      // The motif node itself never moved through any of it.
      expect(motifAt(session.engine, path).id, motifId);
    });

    test('undoing a first upload clears the reference, then unwinds the '
        'registration — two frozen commands, two exact inverses', () async {
      final session = sessionWithGarments();
      addTearDown(session.dispose);
      const path = '*.kurta.base.field';
      final motifId = motifAt(session.engine, path).id;
      await session.applyTextileArtworkBytes(motifId, artwork('one.png', 1));
      final assetId = artworkRefOf(motifAt(session.engine, path))!;

      expect(session.undo(), isA<CommandApplied>());
      expect(artworkRefOf(motifAt(session.engine, path)), isNull);
      expect(session.engine.document.assets.byId(assetId), isNotNull);

      expect(session.undo(), isA<CommandApplied>());
      expect(session.engine.document.assets.byId(assetId), isNull);
      // The motif survives both undos: only its artwork was ever in play.
      expect(motifAt(session.engine, path).id, motifId);

      expect(session.redo(), isA<CommandApplied>());
      expect(session.redo(), isA<CommandApplied>());
      expect(artworkRefOf(motifAt(session.engine, path)), assetId);
    });
  });
  group('frozen guarantees — one authority, no second representation', () {
    test(
      'deterministic: identical sequences yield identical documents',
      () async {
        final a = sessionWithGarments();
        final b = sessionWithGarments();
        addTearDown(a.dispose);
        addTearDown(b.dispose);
        for (final session in [a, b]) {
          for (final path in const [
            '*.kurta.base.field',
            '*.pant.leg[left].field',
          ]) {
            final motifId = motifAt(session.engine, path).id;
            await session.applyTextileArtworkBytes(
              motifId,
              artwork('d.png', 1),
            );
            await session.applyTextileArtworkBytes(
              motifId,
              artwork('d2.png', 2),
            );
          }
        }
        expect(treeRoot(a.engine), treeRoot(b.engine));
        expect(a.engine.document.assets, b.engine.document.assets);
        expect(a.engine.document.revision, b.engine.document.revision);
      },
    );

    test('the compositing layer tree stays inert and no node references a '
        'layer: ADR-0006 separation is untouched', () async {
      final session = sessionWithGarments();
      addTearDown(session.dispose);
      final layersBefore = session.engine.document.artboards.first.layerRoot;
      final motifId = motifAt(session.engine, '*.kurta.base.field').id;
      await session.applyTextileArtworkBytes(motifId, artwork('layer.png', 3));

      expect(session.engine.document.artboards.first.layerRoot, layersBefore);
      for (final node in treeRoot(session.engine).descendantsAndSelf) {
        expect(
          node.metadata.keys.where((k) => k.contains('layer')),
          isEmpty,
          reason: node.id,
        );
      }
      // The reference is the ONE frozen key; no alternative was invented.
      // (Deterministic geometry rides the separate frozen `render_bounds`
      // key, which references nothing.)
      final motif = motifAt(session.engine, '*.kurta.base.field');
      expect(motif.metadata.keys.where((k) => k != 'render_bounds'), [
        'object_type',
        NodeAssetBinding.assetIdKey,
      ]);
    });
    test('registry and binding round-trip losslessly through the frozen '
        'codec', () async {
      final session = sessionWithGarments();
      addTearDown(session.dispose);
      const path = '*.kurta.base.field';
      final motifId = motifAt(session.engine, path).id;
      await session.applyTextileArtworkBytes(motifId, artwork('codec.png', 5));
      final assetId = artworkRefOf(motifAt(session.engine, path))!;

      const codec = FebricCodec();
      final restored = codec.decode(codec.encode(session.engine.document));
      expect(
        restored.assets.byId(assetId),
        session.engine.document.assets.byId(assetId),
      );
      final motif = SemanticPath.parse(
        path,
      ).resolve(restored.artboards.first.designTreeRoot).single.children.last;
      expect(motif.id, motifId);
      expect(motif.metadata['object_type'], TextileObjectType.motif.wireName);
      expect(NodeAssetBinding.assetIdOf(motif), assetId);
    });

    test('the frozen coarse document vocabularies agree with the Asset '
        "Engine's own mapping for both imported classes", () {
      // The record's coarse kind is derived from this frozen mapping, never
      // hardcoded — a motif lands as `motif`, a substrate cloth as `texture`.
      expect(
        DocumentAssetBinding.documentKindWireName(AssetType.motif),
        AssetKind.motif.wireName,
      );
      expect(
        DocumentAssetBinding.documentKindWireName(AssetType.fabric),
        AssetKind.texture.wireName,
      );
      expect(
        DocumentAssetBinding.documentSourceWireName(AssetOrigin.imported),
        AssetSource.imported.wireName,
      );
      // The two artwork-bearing classes resolve to frozen AssetType members,
      // and nothing else does.
      expect(artworkAssetTypeFor(TextileObjectType.motif), AssetType.motif);
      expect(artworkAssetTypeFor(TextileObjectType.fabric), AssetType.fabric);
      for (final other in TextileObjectType.values.where(
        (t) => t != TextileObjectType.motif && t != TextileObjectType.fabric,
      )) {
        expect(artworkAssetTypeFor(other), isNull, reason: other.wireName);
      }
      // And the binding key this stage writes is the frozen one.
      expect(NodeAssetBinding.assetIdKey, 'asset_id');
    });
  });
  group('end-to-end — artwork upload and replacement are user-invocable', () {
    testWidgets('the fabric row and the motif row each take their own artwork '
        'through the real Design Tree surface', (tester) async {
      tester.view.physicalSize = const Size(1600, 9000);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final dir = Directory.systemTemp.createTempSync('febric-artwork-ui');
      addTearDown(() => dir.deleteSync(recursive: true));
      File file(String name, int seed) =>
          File('${dir.path}${Platform.pathSeparator}$name')
            ..writeAsBytesSync(artwork(name, seed).bytes);
      final first = file('boteh.png', 1);
      final second = file('paisley.png', 2);
      final cloth = file('handloom.png', 3);

      final session = DesignTreeSession.inMemory();
      addTearDown(session.dispose);
      await tester.pumpWidget(
        ProviderScope(
          overrides: [designTreeSessionProvider.overrideWithValue(session)],
          child: const MaterialApp(home: Scaffold(body: DesignTreePanel())),
        ),
      );

      await tester.tap(find.byKey(const Key('garment-menu')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('garment-add-kurta')));
      await tester.pumpAndSettle();

      const path = '*.kurta.base.field';
      final motifId = motifAt(session.engine, path).id;
      final fabricId = fabricAt(session.engine, path).id;

      Future<void> applyArtwork(
        String nodeId,
        String artworkPath,
        String expectLabel,
      ) async {
        await tester.enterText(
          find.byKey(const Key('artwork-source-field')),
          artworkPath,
        );
        await tester.pumpAndSettle();
        final menu = find.byKey(Key('node-menu-$nodeId'));
        await tester.ensureVisible(menu);
        await tester.pumpAndSettle();
        await tester.tap(menu);
        await tester.pumpAndSettle();
        // The verb follows the row's own current artwork state.
        expect(find.text(expectLabel), findsOneWidget);
        await tester.tap(find.byKey(Key('node-artwork-$nodeId')));
        await tester.pumpAndSettle();
      }

      await applyArtwork(motifId, first.path, 'Upload artwork');
      final uploadedRef = artworkRefOf(motifAt(session.engine, path));
      expect(uploadedRef, isNotNull, reason: session.lastResult);
      expect(session.engine.document.assets.count, 1);

      await applyArtwork(motifId, second.path, 'Replace artwork');
      final replacedRef = artworkRefOf(motifAt(session.engine, path));
      expect(replacedRef, isNotNull, reason: session.lastResult);
      expect(replacedRef, isNot(uploadedRef));
      expect(session.engine.document.assets.count, 2);
      // The same motif node carried both, and the fabric is still beside it.
      expect(motifAt(session.engine, path).id, motifId);
      expect(
        fabricAt(session.engine, path).metadata['object_type'],
        TextileObjectType.fabric.wireName,
      );

      // The substrate cloth of the same garment section takes its own artwork,
      // from the same surface, without disturbing the motif above it.
      await applyArtwork(fabricId, cloth.path, 'Upload artwork');
      final clothRef = artworkRefOf(fabricAt(session.engine, path));
      expect(clothRef, isNotNull, reason: session.lastResult);
      expect(clothRef, isNot(replacedRef));
      expect(session.engine.document.assets.count, 3);
      expect(
        session.engine.document.assets.byId(clothRef!)!.kind,
        AssetKind.texture,
      );
      expect(artworkRefOf(motifAt(session.engine, path)), replacedRef);
      expect(fabricAt(session.engine, path).id, fabricId);

      // Undo is the engine's own mechanism, driven from the surface.
      await tester.tap(find.byKey(const Key('design-tree-undo')));
      await tester.pumpAndSettle();
      expect(artworkRefOf(fabricAt(session.engine, path)), isNull);
      expect(artworkRefOf(motifAt(session.engine, path)), replacedRef);
    });
  });
}

/// The structural shape of a subtree — ids, node types and nesting, with no
/// metadata. Two equal shapes mean nothing structural moved.
Object _shape(DesignNode node) => [
  node.id,
  node.type.wireName,
  node.name,
  [for (final child in node.children) _shape(child)],
];
