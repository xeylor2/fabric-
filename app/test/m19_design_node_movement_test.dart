import 'package:core_document/core_document.dart';
// Prefixed: core_lock's LockState collides with Flutter's widget LockState.
import 'package:core_lock/core_lock.dart' as lock;
import 'package:febric/di/design_tree_session.dart';
import 'package:febric/workspace/design_tree_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

/// M19 — the authorized wired path, end to end:
///
/// presentation intent → LayerRuntime (the single emission owner) → frozen
/// `DocumentCommand.moveDesignNode` → `DocumentCommandSink` →
/// `DocumentEngine.apply` → Lock → Validation → History → Document →
/// `CommandResult` → presentation re-reads document state.
void main() {
  /// Reads the frozen document; never mutates it.
  List<String> zoneOrder(DocumentEngine engine) => engine
      .document
      .artboards
      .first
      .designTreeRoot
      .findById('node-chest')!
      .children
      .map((n) => n.id)
      .toList();

  group('wired path — movement / reorder through the authorized owner', () {
    test('sibling-list reorder applies and reorders the frozen tree', () {
      final session = DesignTreeSession.inMemory();
      addTearDown(session.dispose);
      expect(zoneOrder(session.engine), [
        'node-motif-a',
        'node-motif-b',
        'node-motif-c',
      ]);
      final result = session.moveNode('node-motif-a', 'node-chest', 2);
      expect(result, isA<CommandApplied>(), reason: session.lastResult);
      expect(zoneOrder(session.engine), [
        'node-motif-b',
        'node-motif-c',
        'node-motif-a',
      ]);
      expect(session.isDirty, isTrue);
      expect(session.canUndo, isTrue);
      expect(session.engine.document.history.entries, hasLength(1));
    });

    test('parent-changing movement moves the subtree to the new parent', () {
      final session = DesignTreeSession.inMemory();
      addTearDown(session.dispose);
      final result = session.moveNode('node-chest', 'node-back', 0);
      expect(result, isA<CommandApplied>(), reason: session.lastResult);
      final root = session.engine.document.artboards.first.designTreeRoot;
      expect(root.findById('node-back')!.children.map((n) => n.id), [
        'node-chest',
      ]);
      expect(root.findById('node-front')!.children, isEmpty);
    });

    test('outcome equivalence with the M18-verified direct path', () {
      // Reference: the frozen command applied straight to the engine — the
      // M18-verified surface. Building it here is verification, not a second
      // production emission site.
      final direct = DocumentEngine(document: seedDocument());
      final reference = direct.apply(
        const DocumentCommand.moveDesignNode(
          artboardId: 'artboard-m19',
          nodeId: 'node-motif-a',
          newParentId: 'node-chest',
          index: 2,
        ),
      );
      final wired = DesignTreeSession.inMemory();
      addTearDown(wired.dispose);
      final result = wired.moveNode('node-motif-a', 'node-chest', 2);
      expect(result, reference); // identical CommandResult
      expect(
        wired.engine.document.artboards.first.designTreeRoot,
        direct.document.artboards.first.designTreeRoot,
      );
      expect(wired.engine.document.revision, direct.document.revision);
    });
    test('rejection is inert: no mutation, no history, no dirty state', () {
      final session = DesignTreeSession.inMemory();
      addTearDown(session.dispose);
      final before = session.engine.document;
      final result = session.moveNode('node-motif-a', 'no-such-parent', 0);
      expect(result, isA<CommandRejected>());
      expect(session.engine.document, same(before));
      expect(session.engine.document.history.entries, isEmpty);
      expect(session.isDirty, isFalse);
      expect(session.canUndo, isFalse);
      expect(session.canRedo, isFalse);
    });

    test('semantic discrimination: a layer id is not a design node', () {
      final session = DesignTreeSession.inMemory();
      addTearDown(session.dispose);
      final before = session.engine.document;
      final result = session.moveNode('layer-root', 'node-chest', 0);
      expect(result, isA<CommandRejected>());
      expect(session.engine.document, same(before));
    });

    test('partial-mutation protection: an unlawful move changes nothing', () {
      final session = DesignTreeSession.inMemory();
      addTearDown(session.dispose);
      final before = session.engine.document;
      // Into its own descendant.
      final result = session.moveNode('node-garment', 'node-chest', 0);
      expect(result, isA<CommandRejected>());
      expect(session.engine.document, same(before));
      expect(session.engine.document.history.entries, isEmpty);
    });

    test('lock rejection is decided by the engine, before any mutation', () {
      final locked = DocumentEngine(
        document: seedDocument().copyWith(
          locks: const lock.LockSet(
            locks: [
              lock.LockState(
                scope: lock.LockScope.project,
                reason: 'locked for M19',
              ),
            ],
          ),
        ),
      );
      final session = DesignTreeSession(engine: locked);
      addTearDown(session.dispose);
      final before = locked.document;
      final result = session.moveNode('node-motif-a', 'node-chest', 2);
      expect(result, isA<CommandRejected>());
      expect(
        (result as CommandRejected).reason,
        CommandRejectionReason.locked,
      );
      expect(locked.document, same(before));
      expect(locked.document.history.entries, isEmpty);
    });
    test('undo/redo is the engine mechanism; pending redo survives a reject', () {
      final session = DesignTreeSession.inMemory();
      addTearDown(session.dispose);
      session.moveNode('node-motif-a', 'node-chest', 2);
      final afterMove = zoneOrder(session.engine);
      expect(session.undo(), isA<CommandApplied>());
      expect(zoneOrder(session.engine), [
        'node-motif-a',
        'node-motif-b',
        'node-motif-c',
      ]);
      expect(session.canRedo, isTrue);
      // A rejected command must not disturb the pending redo.
      expect(
        session.moveNode('node-motif-a', 'no-such-parent', 0),
        isA<CommandRejected>(),
      );
      expect(session.canRedo, isTrue);
      expect(session.redo(), isA<CommandApplied>());
      expect(zoneOrder(session.engine), afterMove);
    });

    test('determinism: identical intent sequences yield identical trees', () {
      final a = DesignTreeSession.inMemory();
      final b = DesignTreeSession.inMemory();
      addTearDown(a.dispose);
      addTearDown(b.dispose);
      for (final session in [a, b]) {
        session.moveNode('node-motif-c', 'node-chest', 0);
        session.moveNode('node-chest', 'node-back', 0);
        session.moveNode('node-motif-a', 'node-chest', 0);
      }
      expect(
        a.engine.document.artboards.first.designTreeRoot,
        b.engine.document.artboards.first.designTreeRoot,
      );
      expect(a.engine.document.revision, b.engine.document.revision);
    });
  });

  group('end-to-end — the capability is genuinely user-invocable', () {
    testWidgets('tap reorders, undo restores, redo reapplies', (tester) async {
      final session = DesignTreeSession.inMemory();
      addTearDown(session.dispose);
      await tester.pumpWidget(
        ProviderScope(
          overrides: [designTreeSessionProvider.overrideWithValue(session)],
          child: const MaterialApp(home: Scaffold(body: DesignTreePanel())),
        ),
      );
      expect(find.text('Motif A'), findsOneWidget);
      expect(find.text('Chest'), findsOneWidget);

      await tester.tap(find.byKey(const Key('move-down-node-motif-a')));
      await tester.pump();
      expect(zoneOrder(session.engine), [
        'node-motif-b',
        'node-motif-a',
        'node-motif-c',
      ]);
      expect(find.byKey(const Key('design-tree-status')), findsOneWidget);

      await tester.tap(find.byKey(const Key('design-tree-undo')));
      await tester.pump();
      expect(zoneOrder(session.engine), [
        'node-motif-a',
        'node-motif-b',
        'node-motif-c',
      ]);

      await tester.tap(find.byKey(const Key('design-tree-redo')));
      await tester.pump();
      expect(zoneOrder(session.engine), [
        'node-motif-b',
        'node-motif-a',
        'node-motif-c',
      ]);
    });
  });
}
