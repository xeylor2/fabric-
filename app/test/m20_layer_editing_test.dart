import 'package:core_document/core_document.dart';
// Prefixed: core_lock's LockState collides with Flutter's widget LockState.
import 'package:core_lock/core_lock.dart' as lock;
import 'package:febric/di/design_tree_session.dart';
import 'package:febric/workspace/design_tree_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

/// M20 — layer structural editing over the authorized path:
///
/// presentation intent → LayerRuntime (the M9 layer-command emission owner) →
/// existing frozen layer `DocumentCommand` → `DocumentCommandSink` →
/// `DocumentEngine.apply` → Lock → Validation → History → Document →
/// `CommandResult` → presentation re-reads document state.
void main() {
  /// Reads the frozen document; never mutates it.
  List<String> rootChildNames(DocumentEngine engine) => engine
      .document
      .artboards
      .first
      .layerRoot
      .children
      .map((l) => l.name)
      .toList();

  List<String> rootChildIds(DocumentEngine engine) => engine
      .document
      .artboards
      .first
      .layerRoot
      .children
      .map((l) => l.id)
      .toList();

  group('the five authorized layer operations', () {
    test('create appends a child layer under the layer root', () {
      final session = DesignTreeSession.inMemory();
      addTearDown(session.dispose);
      expect(rootChildNames(session.engine), isEmpty);
      final result = session.createLayer('layer-root', 'Base');
      expect(result, isA<CommandApplied>(), reason: session.lastResult);
      expect(rootChildNames(session.engine), ['Base']);
      expect(session.layerRows, hasLength(2)); // root + new child
      expect(session.engine.document.history.entries, hasLength(1));
      expect(session.isDirty, isTrue);
    });

    test('rename changes the layer name', () {
      final session = DesignTreeSession.inMemory();
      addTearDown(session.dispose);
      session.createLayer('layer-root', 'Base');
      final id = rootChildIds(session.engine).single;
      final result = session.renameLayer(id, 'Renamed');
      expect(result, isA<CommandApplied>(), reason: session.lastResult);
      expect(rootChildNames(session.engine), ['Renamed']);
    });

    test('metadata set then clear (null clears the entry)', () {
      final session = DesignTreeSession.inMemory();
      addTearDown(session.dispose);
      session.createLayer('layer-root', 'Base');
      final id = rootChildIds(session.engine).single;
      expect(session.setLayerMetadata(id, 'k', 'v'), isA<CommandApplied>());
      expect(session.layerRows.firstWhere((r) => r.id == id).metadata, 'k=v');
      expect(session.setLayerMetadata(id, 'k', null), isA<CommandApplied>());
      expect(session.layerRows.firstWhere((r) => r.id == id).metadata, isNull);
    });
    test('reorder moves a layer within its sibling list', () {
      final session = DesignTreeSession.inMemory();
      addTearDown(session.dispose);
      session.createLayer('layer-root', 'A');
      session.createLayer('layer-root', 'B');
      expect(rootChildNames(session.engine), ['A', 'B']);
      final idA = rootChildIds(session.engine).first;
      final result = session.moveLayer(idA, 'layer-root', 1);
      expect(result, isA<CommandApplied>(), reason: session.lastResult);
      expect(rootChildNames(session.engine), ['B', 'A']);
    });

    test('reparent moves a layer under a sibling', () {
      final session = DesignTreeSession.inMemory();
      addTearDown(session.dispose);
      session.createLayer('layer-root', 'A');
      session.createLayer('layer-root', 'B');
      final ids = rootChildIds(session.engine);
      final result = session.moveLayer(ids[1], ids[0], 0);
      expect(result, isA<CommandApplied>(), reason: session.lastResult);
      final root = session.engine.document.artboards.first.layerRoot;
      expect(root.children.map((l) => l.name), ['A']);
      expect(root.children.single.children.map((l) => l.name), ['B']);
    });

    test('delete removes the layer', () {
      final session = DesignTreeSession.inMemory();
      addTearDown(session.dispose);
      session.createLayer('layer-root', 'A');
      final id = rootChildIds(session.engine).single;
      final result = session.deleteLayer(id);
      expect(result, isA<CommandApplied>(), reason: session.lastResult);
      expect(rootChildNames(session.engine), isEmpty);
    });

    test('one history entry and one revision step per applied operation', () {
      final session = DesignTreeSession.inMemory();
      addTearDown(session.dispose);
      final before = session.engine.document.revision.value;
      session.createLayer('layer-root', 'A');
      final id = rootChildIds(session.engine).single;
      session.renameLayer(id, 'A2');
      session.setLayerMetadata(id, 'k', 'v');
      expect(session.engine.document.history.entries, hasLength(3));
      expect(session.engine.document.revision.value, before + 3);
    });
  });
  group('frozen guarantees through the layer path', () {
    test('rejection is inert: no mutation, no history, no dirty state', () {
      final session = DesignTreeSession.inMemory();
      addTearDown(session.dispose);
      final before = session.engine.document;
      final result = session.deleteLayer('no-such-layer');
      expect(result, isA<CommandRejected>());
      expect(session.engine.document, same(before));
      expect(session.engine.document.history.entries, isEmpty);
      expect(session.isDirty, isFalse);
      expect(session.canUndo, isFalse);
      expect(session.canRedo, isFalse);
    });

    test('lock rejection is decided by the engine, before any mutation', () {
      final locked = DocumentEngine(
        document: seedDocument().copyWith(
          locks: const lock.LockSet(
            locks: [
              lock.LockState(
                scope: lock.LockScope.project,
                reason: 'locked for M20',
              ),
            ],
          ),
        ),
      );
      final session = DesignTreeSession(engine: locked);
      addTearDown(session.dispose);
      final before = locked.document;
      final result = session.createLayer('layer-root', 'Base');
      expect(result, isA<CommandRejected>());
      expect((result as CommandRejected).reason, CommandRejectionReason.locked);
      expect(locked.document, same(before));
      expect(locked.document.history.entries, isEmpty);
    });

    test('undo/redo via the engine; pending redo survives a rejection', () {
      final session = DesignTreeSession.inMemory();
      addTearDown(session.dispose);
      session.createLayer('layer-root', 'A');
      expect(rootChildNames(session.engine), ['A']);
      expect(session.undo(), isA<CommandApplied>());
      expect(rootChildNames(session.engine), isEmpty);
      expect(session.canRedo, isTrue);
      expect(session.deleteLayer('no-such-layer'), isA<CommandRejected>());
      expect(session.canRedo, isTrue); // pending redo untouched
      expect(session.redo(), isA<CommandApplied>());
      expect(rootChildNames(session.engine), ['A']);
    });
    test('determinism: identical sequences yield identical layer trees', () {
      final a = DesignTreeSession.inMemory();
      final b = DesignTreeSession.inMemory();
      addTearDown(a.dispose);
      addTearDown(b.dispose);
      for (final session in [a, b]) {
        session.createLayer('layer-root', 'A');
        session.createLayer('layer-root', 'B');
        final ids = rootChildIds(session.engine);
        session.moveLayer(ids[1], ids[0], 0);
        session.renameLayer(ids[0], 'A2');
      }
      expect(
        a.engine.document.artboards.first.layerRoot,
        b.engine.document.artboards.first.layerRoot,
      );
      expect(a.engine.document.revision, b.engine.document.revision);
    });

    test('the M19 design-tree path is unaffected by layer editing', () {
      final session = DesignTreeSession.inMemory();
      addTearDown(session.dispose);
      session.createLayer('layer-root', 'A');
      final result = session.moveNode('node-motif-a', 'node-chest', 2);
      expect(result, isA<CommandApplied>(), reason: session.lastResult);
      expect(
        session.engine.document.artboards.first.designTreeRoot
            .findById('node-chest')!
            .children
            .map((n) => n.id),
        ['node-motif-b', 'node-motif-c', 'node-motif-a'],
      );
    });
  });
  group('end-to-end — the five operations are genuinely user-invocable', () {
    testWidgets('add, reorder, rename, set/clear metadata, delete', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(1400, 2600);
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

      Future<void> invoke(String action, String layerId) async {
        await tester.tap(find.byKey(Key('layer-menu-$layerId')));
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(Key('$action-$layerId')));
        await tester.pumpAndSettle();
      }

      Future<void> type(String fieldKey, String text) async {
        await tester.enterText(find.byKey(Key(fieldKey)), text);
        await tester.pumpAndSettle();
      }

      await type('layer-name-field', 'A');
      await invoke('layer-add', 'layer-root');
      expect(rootChildNames(session.engine), ['A']);

      await type('layer-name-field', 'B');
      await invoke('layer-add', 'layer-root');
      expect(rootChildNames(session.engine), ['A', 'B']);

      final idA = rootChildIds(session.engine).first;
      await invoke('layer-down', idA);
      expect(rootChildNames(session.engine), ['B', 'A']);

      await type('layer-name-field', 'A renamed');
      await invoke('layer-rename', idA);
      expect(rootChildNames(session.engine), ['B', 'A renamed']);

      await type('layer-meta-key-field', 'role');
      await type('layer-meta-value-field', 'base');
      await invoke('layer-meta-set', idA);
      expect(find.byKey(Key('layer-meta-$idA')), findsOneWidget);

      await invoke('layer-meta-clear', idA);
      expect(find.byKey(Key('layer-meta-$idA')), findsNothing);

      await invoke('layer-delete', idA);
      expect(rootChildNames(session.engine), ['B']);

      // Undo is the engine's own mechanism, driven from the surface.
      await tester.tap(find.byKey(const Key('design-tree-undo')));
      await tester.pumpAndSettle();
      expect(rootChildNames(session.engine), ['B', 'A renamed']);
    });
  });
}
