import 'package:core_document/core_document.dart';
// Prefixed: core_lock's LockState collides with Flutter's widget LockState.
import 'package:core_lock/core_lock.dart' as lock;
import 'package:core_textile/core_textile.dart';
import 'package:febric/di/design_tree_session.dart';
import 'package:febric/di/garment_content.dart';
import 'package:febric/workspace/design_tree_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

/// Fabric / base + printed motif layer structure.
///
/// Both are frozen Design Tree content nodes classified by the frozen
/// `object_type` metadata carrier (read side: ADR-0019 and
/// `core_render/.../textile_render_producers.dart`). No node↔layer binding is
/// created — the frozen "unrendered lawfulness" guarantee makes binding-free
/// content first-class, so ADR-0006 mutual blindness is untouched.
void main() {
  DesignNode treeRoot(DocumentEngine engine) =>
      engine.document.artboards.first.designTreeRoot;

  /// Resolves exactly one node through the frozen semantic resolver.
  DesignNode at(DocumentEngine engine, String path) =>
      SemanticPath.parse(path).resolve(treeRoot(engine)).single;

  List<String?> objectTypesIn(DesignNode node) =>
      node.children.map((c) => c.metadata['object_type'] as String?).toList();

  /// Every field zone of the three launch garments.
  const fieldPaths = <String>[
    '*.kurta.base.field',
    '*.kurta.ground.field',
    '*.kurta.sleeve[left].field',
    '*.pant.leg[right].field',
    '*.dupatta.middle_field.field',
  ];

  DesignTreeSession sessionWithGarments() {
    final session = DesignTreeSession.inMemory();
    for (final type in launchGarmentTypes) {
      final result = session.instantiateGarment(type.wireName);
      expect(result, isA<CommandApplied>(), reason: session.lastResult);
    }
    return session;
  }

  group('fabric / base and printed motif exist in every printable field', () {
    test(
      'each field zone carries a fabric then a printed motif, in z-order',
      () {
        final session = sessionWithGarments();
        addTearDown(session.dispose);
        for (final path in fieldPaths) {
          final zone = at(session.engine, path);
          expect(zone.type, DesignNodeType.zone, reason: path);
          // Child order IS z-order: substrate first, printed motif above it.
          expect(objectTypesIn(zone), [
            TextileObjectType.fabric.wireName,
            TextileObjectType.motif.wireName,
          ], reason: path);
          expect(
            zone.children.every((c) => c.type == DesignNodeType.element),
            isTrue,
            reason: path,
          );
        }
      },
    );
    test('the classification carrier is the frozen object_type key only', () {
      final session = sessionWithGarments();
      addTearDown(session.dispose);
      final content = treeRoot(
        session.engine,
      ).descendantsAndSelf.where((n) => n.metadata.containsKey('object_type'));
      expect(content, isNotEmpty);
      final frozen = TextileObjectType.values.map((t) => t.wireName).toSet();
      for (final node in content) {
        // Only frozen TextileObjectType wire names are ever written.
        expect(frozen, contains(node.metadata['object_type']));
        // The carrier is the sole classification key: no invented alternative.
        // (Deterministic geometry rides the separate frozen `render_bounds`
        // key, which classifies nothing.)
        expect(node.metadata.keys.where((k) => k != 'render_bounds'), [
          'object_type',
        ]);
      }
    });

    test('band and surface slots get no fabric; placements get motif only', () {
      final session = sessionWithGarments();
      addTearDown(session.dispose);
      // A running band accepts neither substrate nor motif.
      expect(objectTypesIn(at(session.engine, '*.kurta.hem.band')), isEmpty);
      expect(
        objectTypesIn(at(session.engine, '*.kurta.texture.surface')),
        isEmpty,
      );
      expect(
        objectTypesIn(at(session.engine, '*.dupatta.top_pallu.band')),
        isEmpty,
      );
      // A motif placement carries a printed motif and no substrate.
      expect(
        objectTypesIn(at(session.engine, '*.kurta.hero_motif.placement')),
        [TextileObjectType.motif.wireName],
      );
      expect(objectTypesIn(at(session.engine, '*.pant.leg[left].field')), [
        TextileObjectType.fabric.wireName,
        TextileObjectType.motif.wireName,
      ]);
    });

    test('the motif is never flattened into the fabric or the garment', () {
      final session = sessionWithGarments();
      addTearDown(session.dispose);
      final zone = at(session.engine, '*.kurta.base.field');
      final fabric = zone.children.first;
      final motif = zone.children.last;
      expect(fabric.id, isNot(motif.id)); // two distinct nodes
      expect(fabric.children, isEmpty); // the motif is not inside the fabric
      expect(motif.children, isEmpty);
      // Editing the motif leaves the fabric and the garment untouched.
      expect(session.renameNode(motif.id, 'Boteh'), isA<CommandApplied>());
      expect(session.setNodeVisibility(motif.id, false), isA<CommandApplied>());
      final after = at(session.engine, '*.kurta.base.field');
      expect(after.children.first, fabric); // byte-identical substrate
      expect(after.children.last.name, 'Boteh');
      expect(after.children.last.visible, isFalse);
    });
    // PLACEHOLDER-FM
  });

  group('independent motif layers', () {
    test('further printed motif layers can be added and edited separately', () {
      final session = sessionWithGarments();
      addTearDown(session.dispose);
      final zoneId = at(session.engine, '*.kurta.base.field').id;

      expect(session.createMotif(zoneId), isA<CommandApplied>());
      expect(session.createMotif(zoneId), isA<CommandApplied>());
      var zone = at(session.engine, '*.kurta.base.field');
      expect(objectTypesIn(zone), [
        TextileObjectType.fabric.wireName,
        TextileObjectType.motif.wireName,
        TextileObjectType.motif.wireName,
        TextileObjectType.motif.wireName,
      ]);

      // Each motif layer is its own addressable, independently editable node.
      final motifIds = zone.children
          .where((c) => c.metadata['object_type'] == 'motif')
          .map((c) => c.id)
          .toList();
      expect(motifIds.toSet(), hasLength(3));
      expect(
        session.renameNode(motifIds[1], 'Second Motif'),
        isA<CommandApplied>(),
      );
      expect(session.deleteNode(motifIds[0]), isA<CommandApplied>());

      zone = at(session.engine, '*.kurta.base.field');
      expect(zone.children.map((c) => c.name), [
        'Fabric / Base',
        'Second Motif',
        'Printed Motif',
      ]);
    });

    test(
      'a motif layer participates in the existing structural operations',
      () {
        final session = sessionWithGarments();
        addTearDown(session.dispose);
        final zone = at(session.engine, '*.pant.leg[left].field');
        final motifId = zone.children.last.id;

        // Reorder below the substrate, duplicate, lock, metadata, then delete.
        expect(session.moveNode(motifId, zone.id, 0), isA<CommandApplied>());
        expect(
          at(session.engine, '*.pant.leg[left].field').children.first.id,
          motifId,
        );
        expect(session.duplicateNode(motifId), isA<CommandApplied>());
        expect(
          at(session.engine, '*.pant.leg[left].field').children,
          hasLength(3),
        );
        expect(
          session.setNodeMetadata(motifId, 'role', 'hero-motif'),
          isA<CommandApplied>(),
        );
        expect(session.setNodeLocked(motifId, true), isA<CommandApplied>());
        expect(session.renameNode(motifId, 'x'), isA<CommandRejected>());
      },
    );

    test('extra fabric can be added where a slot accepts it', () {
      final session = sessionWithGarments();
      addTearDown(session.dispose);
      final zoneId = at(session.engine, '*.dupatta.middle_field.field').id;
      expect(session.createFabric(zoneId), isA<CommandApplied>());
      expect(
        objectTypesIn(at(session.engine, '*.dupatta.middle_field.field')),
        [
          TextileObjectType.fabric.wireName,
          TextileObjectType.motif.wireName,
          TextileObjectType.fabric.wireName,
        ],
      );
    });
    // PLACEHOLDER-FM2
  });

  group('frozen guarantees — no binding, no parallel path', () {
    test(
      'content nodes hold no layer-referencing key and the layer tree is inert',
      () {
        final session = DesignTreeSession.inMemory();
        addTearDown(session.dispose);
        final layersBefore = session.engine.document.artboards.first.layerRoot;
        for (final type in launchGarmentTypes) {
          session.instantiateGarment(type.wireName);
        }
        final zoneId = at(session.engine, '*.kurta.base.field').id;
        session.createMotif(zoneId);
        session.createFabric(zoneId);

        // The whole content population leaves the compositing tree identical.
        expect(session.engine.document.artboards.first.layerRoot, layersBefore);
        // And no content node references a layer in any way.
        for (final node in treeRoot(session.engine).descendantsAndSelf) {
          expect(
            node.metadata.keys.where((k) => k.contains('layer')),
            isEmpty,
            reason: node.id,
          );
        }
      },
    );

    test('a garment plus its textile content lands as one undoable step', () {
      final session = DesignTreeSession.inMemory();
      addTearDown(session.dispose);
      final before = treeRoot(session.engine);
      session.instantiateGarment(GarmentType.kurta.wireName);
      expect(session.engine.document.history.entries, hasLength(1));
      expect(
        objectTypesIn(at(session.engine, '*.kurta.base.field')),
        isNotEmpty,
      );
      expect(session.undo(), isA<CommandApplied>());
      expect(treeRoot(session.engine), before); // garment and content both gone
      expect(session.redo(), isA<CommandApplied>());
      expect(
        objectTypesIn(at(session.engine, '*.kurta.base.field')),
        hasLength(2),
      );
    });

    test('deterministic: identical sequences yield identical trees', () {
      final a = DesignTreeSession.inMemory();
      final b = DesignTreeSession.inMemory();
      addTearDown(a.dispose);
      addTearDown(b.dispose);
      for (final session in [a, b]) {
        for (final type in launchGarmentTypes) {
          session.instantiateGarment(type.wireName);
        }
        final zoneId = SemanticPath.parse('*.kurta.base.field')
            .resolve(session.engine.document.artboards.first.designTreeRoot)
            .single
            .id;
        session.createMotif(zoneId);
        session.createFabric(zoneId);
      }
      expect(
        a.engine.document.artboards.first.designTreeRoot,
        b.engine.document.artboards.first.designTreeRoot,
      );
      expect(a.engine.document.revision, b.engine.document.revision);
    });
    test('lock rejection stays engine-owned for fabric and motif creation', () {
      final locked = DocumentEngine(
        document: seedDocument().copyWith(
          locks: const lock.LockSet(
            locks: [
              lock.LockState(
                scope: lock.LockScope.project,
                reason: 'locked for fabric/motif stage',
              ),
            ],
          ),
        ),
      );
      final session = DesignTreeSession(engine: locked);
      addTearDown(session.dispose);
      final before = locked.document;
      for (final result in <CommandResult>[
        session.createFabric('node-chest'),
        session.createMotif('node-chest'),
      ]) {
        expect(result, isA<CommandRejected>());
        expect(
          (result as CommandRejected).reason,
          CommandRejectionReason.locked,
        );
      }
      expect(locked.document, same(before));
      expect(locked.document.history.entries, isEmpty);
    });

    test('rejection is inert: an absent parent changes nothing', () {
      final session = DesignTreeSession.inMemory();
      addTearDown(session.dispose);
      final before = session.engine.document;
      expect(session.createMotif('no-such-node'), isA<CommandRejected>());
      expect(session.createFabric('no-such-node'), isA<CommandRejected>());
      expect(session.engine.document, same(before));
      expect(session.engine.document.history.entries, isEmpty);
      expect(session.isDirty, isFalse);
    });
    // PLACEHOLDER-FM3
  });

  group('end-to-end — fabric and motif layers are user-invocable', () {
    testWidgets(
      'a Kurta arrives with fabric + motif; more motifs can be added',
      (tester) async {
        tester.view.physicalSize = const Size(1600, 9000);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

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

        // The structure is on screen as real, named rows.
        expect(find.text('Fabric / Base'), findsWidgets);
        expect(find.text('Printed Motif'), findsWidgets);

        final zoneId = at(session.engine, '*.kurta.base.field').id;
        final menu = find.byKey(Key('node-menu-$zoneId'));
        await tester.ensureVisible(menu);
        await tester.pumpAndSettle();
        await tester.tap(menu);
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(Key('node-add-motif-$zoneId')));
        await tester.pumpAndSettle();

        expect(
          objectTypesIn(at(session.engine, '*.kurta.base.field')),
          [
            TextileObjectType.fabric.wireName,
            TextileObjectType.motif.wireName,
            TextileObjectType.motif.wireName,
          ],
          reason: session.lastResult,
        );

        // Undo is the engine's own mechanism, driven from the surface.
        await tester.tap(find.byKey(const Key('design-tree-undo')));
        await tester.pumpAndSettle();
        expect(
          objectTypesIn(at(session.engine, '*.kurta.base.field')),
          hasLength(2),
        );
      },
    );
  });
}
