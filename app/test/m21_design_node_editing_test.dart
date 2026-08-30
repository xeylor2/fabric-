import 'package:core_document/core_document.dart';
// Prefixed: core_lock's LockState collides with Flutter's widget LockState.
import 'package:core_lock/core_lock.dart' as lock;
import 'package:core_textile/core_textile.dart';
import 'package:febric/di/design_tree_session.dart';
import 'package:febric/workspace/design_tree_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

/// M21 — design-node structural/attribute editing over the authorized path:
///
/// presentation intent → LayerRuntime (the M19/M21 design-node emission owner)
/// → existing frozen design-tree `DocumentCommand` → `DocumentCommandSink` →
/// `DocumentEngine.apply` → Lock → Validation → History → Document →
/// `CommandResult` → presentation re-reads document state.
void main() {
  /// Reads the frozen document; never mutates it.
  DesignNode treeRoot(DocumentEngine engine) =>
      engine.document.artboards.first.designTreeRoot;

  List<String> childNames(DocumentEngine engine, String parentId) =>
      treeRoot(engine).findById(parentId)!.children.map((n) => n.name).toList();

  List<String> childIds(DocumentEngine engine, String parentId) =>
      treeRoot(engine).findById(parentId)!.children.map((n) => n.id).toList();

  group('the seven authorized design-node operations', () {
    test('create appends a child node under the given parent', () {
      final session = DesignTreeSession.inMemory();
      addTearDown(session.dispose);
      final result = session.createNode('node-chest', 'Motif D');
      expect(result, isA<CommandApplied>(), reason: session.lastResult);
      expect(childNames(session.engine, 'node-chest'), [
        'Motif A',
        'Motif B',
        'Motif C',
        'Motif D',
      ]);
      expect(session.engine.document.history.entries, hasLength(1));
      expect(session.isDirty, isTrue);
    });

    test('rename changes the node name', () {
      final session = DesignTreeSession.inMemory();
      addTearDown(session.dispose);
      final result = session.renameNode('node-motif-a', 'Renamed');
      expect(result, isA<CommandApplied>(), reason: session.lastResult);
      expect(
        treeRoot(session.engine).findById('node-motif-a')!.name,
        'Renamed',
      );
    });
    test('duplicate inserts a fresh-id clone as the next sibling', () {
      final session = DesignTreeSession.inMemory();
      addTearDown(session.dispose);
      final result = session.duplicateNode('node-chest');
      expect(result, isA<CommandApplied>(), reason: session.lastResult);
      final siblings = childIds(session.engine, 'node-front');
      expect(siblings, hasLength(2));
      expect(siblings.first, 'node-chest');
      final cloneId = siblings[1];
      expect(cloneId, isNot('node-chest')); // fresh identity
      final clone = treeRoot(session.engine).findById(cloneId)!;
      expect(clone.name, 'Chest'); // same content
      expect(clone.children.map((n) => n.name), [
        'Motif A',
        'Motif B',
        'Motif C',
      ]);
      // Every id in the cloned subtree is new.
      final originalIds = {
        'node-chest',
        'node-motif-a',
        'node-motif-b',
        'node-motif-c',
      };
      expect(
        clone.descendantsAndSelf.map((n) => n.id).where(originalIds.contains),
        isEmpty,
      );
    });

    test('visibility hides and shows a node', () {
      final session = DesignTreeSession.inMemory();
      addTearDown(session.dispose);
      expect(
        session.setNodeVisibility('node-motif-a', false),
        isA<CommandApplied>(),
      );
      expect(
        treeRoot(session.engine).findById('node-motif-a')!.visible,
        isFalse,
      );
      expect(
        session.setNodeVisibility('node-motif-a', true),
        isA<CommandApplied>(),
      );
      expect(
        treeRoot(session.engine).findById('node-motif-a')!.visible,
        isTrue,
      );
    });

    test('the node-lock flag is set and cleared', () {
      final session = DesignTreeSession.inMemory();
      addTearDown(session.dispose);
      expect(
        session.setNodeLocked('node-motif-a', true),
        isA<CommandApplied>(),
      );
      expect(treeRoot(session.engine).findById('node-motif-a')!.locked, isTrue);
      expect(
        session.setNodeLocked('node-motif-a', false),
        isA<CommandApplied>(),
      );
      expect(
        treeRoot(session.engine).findById('node-motif-a')!.locked,
        isFalse,
      );
    });
    test('metadata set then clear (null clears the entry)', () {
      final session = DesignTreeSession.inMemory();
      addTearDown(session.dispose);
      expect(
        session.setNodeMetadata('node-motif-a', 'role', 'hero'),
        isA<CommandApplied>(),
      );
      expect(treeRoot(session.engine).findById('node-motif-a')!.metadata, {
        'role': 'hero',
      });
      expect(
        session.setNodeMetadata('node-motif-a', 'role', null),
        isA<CommandApplied>(),
      );
      expect(
        treeRoot(session.engine).findById('node-motif-a')!.metadata,
        isEmpty,
      );
    });

    test('delete removes the node subtree', () {
      final session = DesignTreeSession.inMemory();
      addTearDown(session.dispose);
      final result = session.deleteNode('node-motif-b');
      expect(result, isA<CommandApplied>(), reason: session.lastResult);
      expect(childNames(session.engine, 'node-chest'), ['Motif A', 'Motif C']);
      expect(treeRoot(session.engine).findById('node-motif-b'), isNull);
    });

    test('one history entry and one revision step per applied operation', () {
      final session = DesignTreeSession.inMemory();
      addTearDown(session.dispose);
      final before = session.engine.document.revision.value;
      session.createNode('node-chest', 'D');
      session.renameNode('node-motif-a', 'A2');
      session.setNodeMetadata('node-motif-a', 'k', 'v');
      session.setNodeVisibility('node-motif-a', false);
      expect(session.engine.document.history.entries, hasLength(4));
      expect(session.engine.document.revision.value, before + 4);
    });
    // PLACEHOLDER-M21-TESTS
  });

  group('frozen guarantees through the design-node path', () {
    test('rejection is inert: no mutation, no history, no dirty state', () {
      final session = DesignTreeSession.inMemory();
      addTearDown(session.dispose);
      final before = session.engine.document;
      expect(session.deleteNode('no-such-node'), isA<CommandRejected>());
      expect(session.engine.document, same(before));
      expect(session.engine.document.history.entries, isEmpty);
      expect(session.isDirty, isFalse);
      expect(session.canUndo, isFalse);
      expect(session.canRedo, isFalse);
    });

    test('duplicating an absent source is rejected and inserts nothing', () {
      final session = DesignTreeSession.inMemory();
      addTearDown(session.dispose);
      final before = session.engine.document;
      final result = session.duplicateNode('no-such-node');
      expect(result, isA<CommandRejected>());
      expect(
        (result as CommandRejected).reason,
        CommandRejectionReason.notFound,
      );
      expect(session.engine.document, same(before));
      expect(session.engine.document.history.entries, isEmpty);
    });

    test('the root cannot be deleted — the engine decides', () {
      final session = DesignTreeSession.inMemory();
      addTearDown(session.dispose);
      final before = session.engine.document;
      expect(session.deleteNode('node-root'), isA<CommandRejected>());
      expect(session.engine.document, same(before));
    });

    test('capability rejection is engine-owned, not pre-empted here', () {
      final session = DesignTreeSession.inMemory();
      addTearDown(session.dispose);
      final before = session.engine.document;
      // The frozen capability matrix gives `project` no `hide` capability.
      final result = session.setNodeVisibility('node-root', false);
      expect(result, isA<CommandRejected>());
      expect(
        (result as CommandRejected).reason,
        CommandRejectionReason.invalid,
      );
      expect(session.engine.document, same(before));
      expect(session.engine.document.history.entries, isEmpty);
    });
    test(
      'a node-locked subtree rejects edits; unlocking is the release path',
      () {
        final session = DesignTreeSession.inMemory();
        addTearDown(session.dispose);
        expect(
          session.setNodeLocked('node-chest', true),
          isA<CommandApplied>(),
        );
        // The node itself and its descendants are now inert to structural edits.
        for (final result in <CommandResult>[
          session.renameNode('node-chest', 'X'),
          session.renameNode('node-motif-a', 'X'),
          session.deleteNode('node-motif-a'),
          session.setNodeMetadata('node-motif-a', 'k', 'v'),
          session.createNode('node-chest', 'D'),
        ]) {
          expect(result, isA<CommandRejected>());
          expect(
            (result as CommandRejected).reason,
            CommandRejectionReason.locked,
          );
        }
        expect(childNames(session.engine, 'node-chest'), [
          'Motif A',
          'Motif B',
          'Motif C',
        ]);
        expect(
          session.engine.document.history.entries,
          hasLength(1),
        ); // the lock
        // Unlocking is always permitted, and editing resumes.
        expect(
          session.setNodeLocked('node-chest', false),
          isA<CommandApplied>(),
        );
        expect(session.renameNode('node-motif-a', 'A2'), isA<CommandApplied>());
      },
    );

    test('document lock rejection is decided by the engine, pre-mutation', () {
      final locked = DocumentEngine(
        document: seedDocument().copyWith(
          locks: const lock.LockSet(
            locks: [
              lock.LockState(
                scope: lock.LockScope.project,
                reason: 'locked for M21',
              ),
            ],
          ),
        ),
      );
      final session = DesignTreeSession(engine: locked);
      addTearDown(session.dispose);
      final before = locked.document;
      final result = session.createNode('node-chest', 'D');
      expect(result, isA<CommandRejected>());
      expect((result as CommandRejected).reason, CommandRejectionReason.locked);
      expect(locked.document, same(before));
      expect(locked.document.history.entries, isEmpty);
    });
    test('undo/redo via the engine; pending redo survives a rejection', () {
      final session = DesignTreeSession.inMemory();
      addTearDown(session.dispose);
      session.createNode('node-chest', 'Motif D');
      expect(childNames(session.engine, 'node-chest'), hasLength(4));
      expect(session.undo(), isA<CommandApplied>());
      expect(childNames(session.engine, 'node-chest'), hasLength(3));
      expect(session.canRedo, isTrue);
      expect(session.deleteNode('no-such-node'), isA<CommandRejected>());
      expect(session.canRedo, isTrue); // pending redo untouched
      expect(session.redo(), isA<CommandApplied>());
      expect(childNames(session.engine, 'node-chest'), hasLength(4));
    });

    test('determinism: identical sequences yield identical trees', () {
      final a = DesignTreeSession.inMemory();
      final b = DesignTreeSession.inMemory();
      addTearDown(a.dispose);
      addTearDown(b.dispose);
      for (final session in [a, b]) {
        session.createNode('node-chest', 'D');
        session.duplicateNode('node-motif-a');
        session.renameNode('node-motif-b', 'B2');
        session.setNodeVisibility('node-motif-c', false);
        session.setNodeMetadata('node-chest', 'k', 'v');
        session.setNodeLocked('node-back', true);
      }
      expect(
        a.engine.document.artboards.first.designTreeRoot,
        b.engine.document.artboards.first.designTreeRoot,
      );
      expect(a.engine.document.revision, b.engine.document.revision);
    });

    test('node/layer separation holds in both directions', () {
      final session = DesignTreeSession.inMemory();
      addTearDown(session.dispose);
      final layersBefore = session.engine.document.artboards.first.layerRoot;
      session.createNode('node-chest', 'D');
      session.duplicateNode('node-motif-a');
      session.setNodeLocked('node-motif-b', true);
      expect(session.engine.document.artboards.first.layerRoot, layersBefore);

      final treeBefore = treeRoot(session.engine);
      session.createLayer('layer-root', 'Base');
      final layerId =
          session.engine.document.artboards.first.layerRoot.children.single.id;
      session.setLayerMetadata(layerId, 'k', 'v');
      expect(treeRoot(session.engine), treeBefore);
    });
    // PLACEHOLDER-M21-E2E
  });

  group('end-to-end — the seven operations are genuinely user-invocable', () {
    testWidgets('add, rename, duplicate, hide, lock, metadata, delete, undo', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(1500, 4600);
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

      Future<void> invoke(String action, String nodeId) async {
        await tester.tap(find.byKey(Key('node-menu-$nodeId')));
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(Key('$action-$nodeId')));
        await tester.pumpAndSettle();
      }

      Future<void> type(String fieldKey, String text) async {
        await tester.enterText(find.byKey(Key(fieldKey)), text);
        await tester.pumpAndSettle();
      }

      // 1. create
      await type('node-name-field', 'Motif D');
      await invoke('node-add', 'node-chest');
      expect(childNames(session.engine, 'node-chest'), [
        'Motif A',
        'Motif B',
        'Motif C',
        'Motif D',
      ]);

      // 2. rename
      await type('node-name-field', 'Motif A renamed');
      await invoke('node-rename', 'node-motif-a');
      expect(
        treeRoot(session.engine).findById('node-motif-a')!.name,
        'Motif A renamed',
      );
      // 3. duplicate
      await invoke('node-duplicate', 'node-motif-c');
      expect(childNames(session.engine, 'node-chest'), hasLength(5));
      final cloneId = childIds(session.engine, 'node-chest')[3];
      expect(cloneId, isNot('node-motif-c'));

      // 4. visibility
      await invoke('node-visibility', 'node-motif-b');
      expect(
        treeRoot(session.engine).findById('node-motif-b')!.visible,
        isFalse,
      );
      expect(find.byKey(const Key('node-state-node-motif-b')), findsOneWidget);

      // 5. metadata set / clear
      await type('node-meta-key-field', 'role');
      await type('node-meta-value-field', 'hero');
      await invoke('node-meta-set', 'node-motif-b');
      expect(treeRoot(session.engine).findById('node-motif-b')!.metadata, {
        'role': 'hero',
      });
      await invoke('node-meta-clear', 'node-motif-b');
      expect(
        treeRoot(session.engine).findById('node-motif-b')!.metadata,
        isEmpty,
      );

      // 6. node lock, then unlock (both directions from the same menu item)
      await invoke('node-lock', 'node-back');
      expect(treeRoot(session.engine).findById('node-back')!.locked, isTrue);
      await invoke('node-lock', 'node-back');
      expect(treeRoot(session.engine).findById('node-back')!.locked, isFalse);

      // 7. delete
      await invoke('node-delete', cloneId);
      expect(childNames(session.engine, 'node-chest'), hasLength(4));
      expect(treeRoot(session.engine).findById(cloneId), isNull);

      // Undo is the engine's own mechanism, driven from the surface.
      await tester.tap(find.byKey(const Key('design-tree-undo')));
      await tester.pumpAndSettle();
      expect(treeRoot(session.engine).findById(cloneId), isNotNull);
      expect(find.byKey(const Key('design-tree-status')), findsOneWidget);
    });
  });
}
