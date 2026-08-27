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

/// Garment Composition Content & Instantiation.
///
/// injected GarmentSchema content → SchemaGarmentInstantiator (a value; emits
/// nothing) → LayerRuntime.createDesignNode (the M21-authorized emission) →
/// DocumentCommandSink → DocumentEngine.apply → Lock → Validation → History →
/// Document → CommandResult → presentation re-reads state.
void main() {
  DesignNode treeRoot(DocumentEngine engine) =>
      engine.document.artboards.first.designTreeRoot;

  /// The garment node a `garment_type` addresses, via the frozen resolver.
  DesignNode garmentNode(DocumentEngine engine, String wireName) =>
      SemanticPath.parse('*.$wireName').resolve(treeRoot(engine)).single;

  /// Part nodes of a garment, in tree order.
  List<DesignNode> partsOf(DocumentEngine engine, String wireName) =>
      garmentNode(engine, wireName).children;

  /// How many part *instances* an anatomy expands to under the launch content.
  int expectedPartCount(GarmentType type) => garmentSchemaFor(type).parts.fold(
    0,
    (sum, definition) => sum + definition.cardinality,
  );

  group('the three launch garments instantiate from injected content', () {
    for (final type in launchGarmentTypes) {
      test('${type.label} instantiates its frozen anatomy', () {
        final session = DesignTreeSession.inMemory();
        addTearDown(session.dispose);
        final result = session.instantiateGarment(type.wireName);
        expect(result, isA<CommandApplied>(), reason: session.lastResult);

        final garment = garmentNode(session.engine, type.wireName);
        expect(garment.type, DesignNodeType.garment);
        expect(garment.name, type.label);
        expect(garment.metadata['garment_type'], type.wireName);

        // The frozen GarmentAnatomy is the authority for which parts exist and
        // in what order; cardinality expands instances in place.
        final parts = partsOf(session.engine, type.wireName);
        expect(parts, hasLength(expectedPartCount(type)));
        expect(
          parts.map((p) => p.metadata['part']).toSet(),
          GarmentAnatomy.of(type).map((p) => p.wireName).toSet(),
        );
        expect(
          parts.every((p) => p.type == DesignNodeType.garmentPart),
          isTrue,
        );
        expect(session.engine.document.history.entries, hasLength(1));
        expect(session.isDirty, isTrue);
      });
    }
    test('mirrored parts expand to left/right instances with a symmetry group', () {
      final session = DesignTreeSession.inMemory();
      addTearDown(session.dispose);
      session.instantiateGarment(GarmentType.kurta.wireName);
      final sleeves = partsOf(session.engine, 'kurta')
          .where((p) => p.metadata['part'] == GarmentPart.sleeve.wireName)
          .toList();
      expect(sleeves, hasLength(2));
      expect(sleeves.map((p) => p.metadata['instance']), ['left', 'right']);
      expect(
        sleeves.every(
          (p) => p.metadata['symmetry_group'] == GarmentPart.sleeve.wireName,
        ),
        isTrue,
      );
    });

    test('schema zone slots become frozen zone nodes carrying their slot id', () {
      final session = DesignTreeSession.inMemory();
      addTearDown(session.dispose);
      session.instantiateGarment(GarmentType.kurta.wireName);
      final base = partsOf(session.engine, 'kurta').firstWhere(
        (p) => p.metadata['part'] == GarmentPart.base.wireName,
      );
      expect(base.children.map((z) => z.type).toSet(), {DesignNodeType.zone});
      expect(base.children.map((z) => z.metadata['zone_slot']), [
        'field',
        'edge',
      ]);
    });

    test('all three coexist as independent garments under one project', () {
      final session = DesignTreeSession.inMemory();
      addTearDown(session.dispose);
      for (final type in launchGarmentTypes) {
        expect(
          session.instantiateGarment(type.wireName),
          isA<CommandApplied>(),
          reason: session.lastResult,
        );
      }
      for (final type in launchGarmentTypes) {
        expect(
          partsOf(session.engine, type.wireName),
          hasLength(expectedPartCount(type)),
        );
      }
      expect(session.engine.document.history.entries, hasLength(3));
    });
    // PLACEHOLDER-GC
  });

  group('independent addressability through the frozen resolver', () {
    test('each garment part resolves by its own semantic path', () {
      final session = DesignTreeSession.inMemory();
      addTearDown(session.dispose);
      for (final type in launchGarmentTypes) {
        session.instantiateGarment(type.wireName);
      }
      final root = treeRoot(session.engine);

      // A mirrored instance is addressable on its own.
      final leftSleeve = SemanticPath.parse(
        '*.kurta.sleeve[left]',
      ).resolve(root);
      expect(leftSleeve, hasLength(1));
      expect(leftSleeve.single.metadata['instance'], 'left');

      // A zone inside a part is addressable by its slug.
      expect(
        SemanticPath.parse('*.kurta.base.field').resolve(root),
        hasLength(1),
      );

      // Each garment's own parts are reachable and do not collide.
      expect(SemanticPath.parse('*.pant.waist').resolve(root), hasLength(1));
      expect(SemanticPath.parse('*.pant.leg[right]').resolve(root), hasLength(1));
      expect(
        SemanticPath.parse('*.dupatta.top_pallu').resolve(root),
        hasLength(1),
      );
      expect(
        SemanticPath.parse('*.dupatta.corner_motif').resolve(root),
        hasLength(4),
      );
      // A kurta part is NOT reachable through the dupatta, and vice versa.
      expect(SemanticPath.parse('*.dupatta.sleeve').resolve(root), isEmpty);
      expect(SemanticPath.parse('*.kurta.top_pallu').resolve(root), isEmpty);
    });
    test('every part id is unique and derived from the garment root id', () {
      final session = DesignTreeSession.inMemory();
      addTearDown(session.dispose);
      session.instantiateGarment(GarmentType.kurta.wireName);
      session.instantiateGarment(GarmentType.kurta.wireName);
      final ids = treeRoot(
        session.engine,
      ).descendantsAndSelf.map((n) => n.id).toList();
      expect(ids.toSet(), hasLength(ids.length)); // no duplicate anywhere
      // Two instantiations of the same schema coexist.
      expect(SemanticPath.parse('*.kurta').resolve(treeRoot(session.engine)),
          hasLength(2));
      expect(session.engine.document.history.entries, hasLength(2));
    });
    // PLACEHOLDER-GC2
  });

  group('frozen guarantees through the garment path', () {
    test('deterministic: identical sequences yield identical trees', () {
      final a = DesignTreeSession.inMemory();
      final b = DesignTreeSession.inMemory();
      addTearDown(a.dispose);
      addTearDown(b.dispose);
      for (final session in [a, b]) {
        for (final type in launchGarmentTypes) {
          session.instantiateGarment(type.wireName);
        }
      }
      expect(
        a.engine.document.artboards.first.designTreeRoot,
        b.engine.document.artboards.first.designTreeRoot,
      );
      expect(a.engine.document.revision, b.engine.document.revision);
    });

    test('the instantiated composition is one undoable engine step', () {
      final session = DesignTreeSession.inMemory();
      addTearDown(session.dispose);
      final before = treeRoot(session.engine);
      session.instantiateGarment(GarmentType.dupatta.wireName);
      expect(session.canUndo, isTrue);
      expect(session.undo(), isA<CommandApplied>());
      expect(treeRoot(session.engine), before); // the whole subtree is gone
      expect(session.canRedo, isTrue);
      expect(session.redo(), isA<CommandApplied>());
      expect(partsOf(session.engine, 'dupatta'), hasLength(10));
    });
    test('lock rejection is engine-owned: nothing is instantiated', () {
      final locked = DocumentEngine(
        document: seedDocument().copyWith(
          locks: const lock.LockSet(
            locks: [
              lock.LockState(
                scope: lock.LockScope.project,
                reason: 'locked for garment stage',
              ),
            ],
          ),
        ),
      );
      final session = DesignTreeSession(engine: locked);
      addTearDown(session.dispose);
      final before = locked.document;
      final result = session.instantiateGarment(GarmentType.kurta.wireName);
      expect(result, isA<CommandRejected>());
      expect((result as CommandRejected).reason, CommandRejectionReason.locked);
      expect(locked.document, same(before));
      expect(locked.document.history.entries, isEmpty);
    });

    test('existing Design Tree operations still work on garment parts', () {
      final session = DesignTreeSession.inMemory();
      addTearDown(session.dispose);
      session.instantiateGarment(GarmentType.pant.wireName);
      final waist = partsOf(session.engine, 'pant').first;

      expect(session.renameNode(waist.id, 'Waistband'), isA<CommandApplied>());
      expect(
        session.setNodeMetadata(waist.id, 'role', 'hero-motif'),
        isA<CommandApplied>(),
      );
      expect(session.setNodeVisibility(waist.id, false), isA<CommandApplied>());
      expect(session.duplicateNode(waist.id), isA<CommandApplied>());
      final pantId = garmentNode(session.engine, 'pant').id;
      expect(session.moveNode(waist.id, pantId, 2), isA<CommandApplied>());
      expect(session.deleteNode(waist.id), isA<CommandApplied>());
      // The garment itself, and the rest of its parts, survive.
      expect(partsOf(session.engine, 'pant'), isNotEmpty);
    });

    test('the layer tree is untouched by garment instantiation', () {
      final session = DesignTreeSession.inMemory();
      addTearDown(session.dispose);
      final layersBefore = session.engine.document.artboards.first.layerRoot;
      for (final type in launchGarmentTypes) {
        session.instantiateGarment(type.wireName);
      }
      expect(session.engine.document.artboards.first.layerRoot, layersBefore);
    });
    // PLACEHOLDER-GC3
  });

  group('end-to-end — garment composition is genuinely user-invocable', () {
    testWidgets('adding Kurta, Pant and Dupatta from the Design Tree surface', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(1500, 6000);
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

      for (final type in launchGarmentTypes) {
        await tester.tap(find.byKey(const Key('garment-menu')));
        await tester.pumpAndSettle();
        expect(find.byKey(Key('garment-add-${type.wireName}')), findsOneWidget);
        await tester.tap(find.byKey(Key('garment-add-${type.wireName}')));
        await tester.pumpAndSettle();
        expect(
          partsOf(session.engine, type.wireName),
          hasLength(expectedPartCount(type)),
          reason: session.lastResult,
        );
      }

      // Real, labelled garment parts are on screen — not anonymous layers.
      expect(find.text('Kurta'), findsOneWidget);
      expect(find.text('Pant'), findsOneWidget);
      expect(find.text('Dupatta'), findsOneWidget);
      expect(find.text('Top Pallu'), findsOneWidget);
      expect(find.text('Waist'), findsOneWidget);
      expect(find.text('Sleeve'), findsNWidgets(2)); // left + right

      // Each part row exposes the existing M19/M21 operations.
      final sleeve = SemanticPath.parse(
        '*.kurta.sleeve[left]',
      ).resolve(treeRoot(session.engine)).single;
      expect(find.byKey(Key('node-menu-${sleeve.id}')), findsOneWidget);
      expect(find.byKey(Key('move-down-${sleeve.id}')), findsOneWidget);
    });
  });
}
