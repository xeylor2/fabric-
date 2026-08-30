/// App-level end-to-end verification of the individual printed motif free move
/// (B-2 / NDH-2): the one thing the existing coverage never exercised — a REAL
/// pointer drag on the real composition root.
///
/// The chain under test is the frozen one, composed and nothing more:
///
///   real pointer drag on the garment surface (Key('canvas-surface-gestures'))
///   → CanvasEditorPage gesture handlers → CanvasMoveGesture
///   → CanvasPanel._onMoveGesture
///   → DesignTreeSession.beginCanvasMove / updateCanvasMove / endCanvasMove
///   → frozen TransformRuntime (the EPHEMERAL transform, never document state)
///   → LayerRuntime.setNodeMetadata → DocumentCommand.setNodeMetadata
///   → DocumentEngine.apply → Lock → Validation → History → Document
///
/// Nothing is introduced here: the test drives existing public APIs only and
/// reads the frozen models back. `DocumentEngine.apply` stays the sole mutation
/// authority, and every "it moved" assertion is read off the document or off
/// the graph the frozen compiler produced from it.
library;

import 'package:core_design_system/core_design_system.dart';
import 'package:core_geometry/core_geometry.dart';
import 'package:core_render/core_render.dart';
import 'package:core_textile/core_textile.dart';
import 'package:feature_canvas_editor/feature_canvas_editor.dart';
import 'package:febric/di/design_tree_session.dart';
import 'package:febric/di/garment_content.dart';
import 'package:febric/workspace/canvas_panel.dart';
import 'package:flutter/material.dart' hide RenderObject;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  DesignNode treeRoot(DesignTreeSession session) =>
      session.engine.document.artboards.first.designTreeRoot;

  DesignNode nodeFor(DesignTreeSession session, String id) =>
      treeRoot(session).findById(id)!;

  CanvasSurfacePainter painterOf(WidgetTester tester) =>
      tester
              .widget<CustomPaint>(find.byKey(const Key('canvas-surface')))
              .painter!
          as CanvasSurfacePainter;

  /// The graph the surface actually presents: the compiled graph with every
  /// object's own transform folded into the frozen `bounds` field and — while a
  /// move is in flight — the moving motif carrying the ephemeral one.
  RenderGraph presentedGraph(WidgetTester tester) => painterOf(tester).graph;

  Rect2D presentedBoundsOf(WidgetTester tester, String nodeId) =>
      presentedGraph(
        tester,
      ).objects.firstWhere((o) => o.source.refId == nodeId).bounds;

  /// A document-space point as a global pointer position, through the surface's
  /// OWN live viewport (the frozen `ViewportState.canvasToScreen`) — never a
  /// duplicated layout calculation.
  Offset globalOf(WidgetTester tester, Point2D documentPoint) {
    final local = painterOf(
      tester,
    ).renderContext.viewport.canvasToScreen(documentPoint);
    final surface = tester.getRect(
      find.byKey(const Key('canvas-surface-gestures')),
    );
    return surface.topLeft + Offset(local.x, local.y);
  }

  /// Where to grab the object sourced from [nodeId]: the centre of what is
  /// presented, so it keeps working after the motif has already been moved.
  Offset centreOf(WidgetTester tester, String nodeId) =>
      globalOf(tester, presentedBoundsOf(tester, nodeId).center);

  List<RenderObject> motifObjects(RenderGraph graph) => graph.objects
      .where((o) => o.kind == RenderObjectKind.motif)
      .toList(growable: false);

  /// The transform the DOCUMENT persists for [nodeId], read through the frozen
  /// metadata key the session writes and the frozen producer reads. Null when
  /// the node carries none.
  Transform2D? persistedTransformOf(DesignTreeSession session, String nodeId) {
    final raw = nodeFor(
      session,
      nodeId,
    ).metadata[DesignTreeSession.transformMetadataKey];
    return raw == null
        ? null
        : Transform2D.fromJson(Map<String, Object?>.from(raw as Map));
  }

  /// The transform the frozen compiler read back out of the document for
  /// [nodeId] — the proof a persisted move survives recompilation.
  Transform2D compiledTransformOf(DesignTreeSession session, String nodeId) =>
      session.canvasRenderGraph.objects
          .firstWhere((o) => o.source.refId == nodeId)
          .transform;

  Future<DesignTreeSession> pumpCanvas(
    WidgetTester tester,
    GarmentType type,
  ) async {
    tester.view.physicalSize = const Size(1200, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    final session = DesignTreeSession.inMemory();
    addTearDown(session.dispose);
    expect(session.instantiateGarment(type.wireName).wasApplied, isTrue);
    await tester.pumpWidget(
      ProviderScope(
        overrides: [designTreeSessionProvider.overrideWithValue(session)],
        child: MaterialApp(
          theme: FebricTheme.build(FebricThemeVariant.light),
          home: const Scaffold(body: CanvasPanel()),
        ),
      ),
    );
    await tester.pumpAndSettle();
    return session;
  }

  /// Selects the motif and swipes it by [by] with a real pointer, exactly as a
  /// finger would: down on the already-selected motif, move, release.
  Future<void> swipeMotif(
    WidgetTester tester,
    DesignTreeSession session,
    String motifId,
    Offset by,
  ) async {
    final grab = centreOf(tester, motifId);
    await tester.tapAt(grab);
    await tester.pumpAndSettle();
    expect(session.canvasSelection.isSelected(motifId), isTrue);
    final gesture = await tester.startGesture(grab);
    await tester.pump();
    await gesture.moveBy(by);
    await tester.pump();
    await gesture.up();
    await tester.pumpAndSettle();
  }

  // --------------------------------------------------- the full E2E cycle
  group('select → real swipe → live move → release → persist → undo → redo', () {
    for (final type in launchGarmentTypes) {
      testWidgets('${type.label}', (tester) async {
        final session = await pumpCanvas(tester, type);
        final motifs = motifObjects(session.canvasRenderGraph);
        expect(motifs, isNotEmpty, reason: '${type.label} has printed motifs');
        final motifId = motifs.first.source.refId;

        // ---- select the individual printed motif
        await tester.tapAt(centreOf(tester, motifId));
        await tester.pumpAndSettle();
        expect(session.canvasSelection.selectedIds, {motifId});
        expect(
          nodeFor(session, motifId).metadata['object_type'],
          TextileObjectType.motif.wireName,
        );

        // ---- baseline, before anything moves
        final document = session.engine.document;
        final revision = document.revision.value;
        final history = document.history.entries.length;
        final notifications = session.revision.value;
        final rows = session.rows.length;
        final anchor = compiledTransformOf(session, motifId);
        final before = persistedTransformOf(session, motifId);
        final untouched = {
          for (final object in presentedGraph(tester).objects)
            if (object.source.refId != motifId) object.source.refId: object,
        };
        final viewport = painterOf(tester).renderContext.viewport;
        final startCentre = viewport.canvasToScreen(
          presentedBoundsOf(tester, motifId).center,
        );

        // ---- a real pointer swipe on the already-selected motif
        const step = Offset(60, 40);
        final gesture = await tester.startGesture(centreOf(tester, motifId));
        await tester.pump();
        await gesture.moveBy(step);
        await tester.pump();

        // ---- LIVE: the motif tracks the pointer one-for-one, measured from
        // where the finger went down (the gesture-origin contract: no slop
        // jump, no accumulation).
        final preview = session.canvasMovePreview;
        expect(preview, isNotNull, reason: 'the move is in flight');
        expect(preview!.nodeId, motifId);
        expect(
          painterOf(tester).renderContext.viewport,
          viewport,
          reason: 'the camera does not re-fit under the gesture',
        );
        final liveCentre = viewport.canvasToScreen(
          presentedBoundsOf(tester, motifId).center,
        );
        expect(liveCentre.x - startCentre.x, closeTo(step.dx, 0.001));
        expect(liveCentre.y - startCentre.y, closeTo(step.dy, 0.001));

        // Only the grabbed motif is displaced; every other object is identical.
        for (final entry in untouched.entries) {
          expect(
            presentedGraph(
              tester,
            ).objects.firstWhere((o) => o.source.refId == entry.key),
            entry.value,
            reason: '${entry.key} did not move',
          );
        }

        // In flight is NOT document state: no command, no revision, no history
        // entry, no notification — there is no second mutation path.
        expect(session.engine.document, same(document));
        expect(session.engine.document.revision.value, revision);
        expect(session.engine.document.history.entries, hasLength(history));
        expect(session.revision.value, notifications);
        expect(persistedTransformOf(session, motifId), before);

        // A second step still measures from the origin.
        await gesture.moveBy(step);
        await tester.pump();
        final farCentre = viewport.canvasToScreen(
          presentedBoundsOf(tester, motifId).center,
        );
        expect(farCentre.x - startCentre.x, closeTo(step.dx * 2, 0.001));
        expect(farCentre.y - startCentre.y, closeTo(step.dy * 2, 0.001));
        final inFlight = session.canvasMovePreview!.transform;

        // ---- release: the settled transform reaches the document, and only
        // through DocumentEngine.apply.
        await gesture.up();
        await tester.pumpAndSettle();
        expect(session.canvasMovePreview, isNull, reason: 'nothing in flight');
        final persisted = persistedTransformOf(session, motifId);
        expect(
          persisted,
          inFlight,
          reason: 'what the surface presented is what the document persisted',
        );
        expect(persisted!.translation, isNot(anchor.translation));
        expect(session.engine.document.revision.value, revision + 1);
        expect(session.engine.document.history.entries, hasLength(history + 1));
        expect(session.engine.document.history.entries.last.affectedIds, [
          motifId,
        ]);
        expect(session.isDirty, isTrue);
        expect(session.lastResult, startsWith('Applied'));

        // The frozen compiler reads the move back out of the document, so the
        // motif stays where it was dropped instead of snapping back.
        expect(compiledTransformOf(session, motifId), persisted);

        // The Design Tree projection survives, and selection never entered it.
        expect(session.rows, hasLength(rows));
        expect(treeRoot(session).findById(motifId), isNotNull);
        expect(
          treeRoot(session).descendantsAndSelf.every((n) => !n.selected),
          isTrue,
        );

        // ---- undo
        expect(session.canUndo, isTrue);
        expect(session.undo().wasApplied, isTrue);
        await tester.pumpAndSettle();
        expect(persistedTransformOf(session, motifId), before);
        expect(compiledTransformOf(session, motifId), anchor);

        // ---- redo
        expect(session.canRedo, isTrue);
        expect(session.redo().wasApplied, isTrue);
        await tester.pumpAndSettle();
        expect(persistedTransformOf(session, motifId), persisted);
        expect(compiledTransformOf(session, motifId), persisted);
        expect(session.rows, hasLength(rows));
        expect(tester.takeException(), isNull);
      });
    }
  });

  // ------------------------------------------- what may not move, and why
  testWidgets('only an individual printed motif may move', (tester) async {
    final session = await pumpCanvas(tester, GarmentType.kurta);
    final graph = session.canvasRenderGraph;
    final document = session.engine.document;
    final history = document.history.entries.length;

    // The sweep below is not vacuous: the fabric/base and the garment/part/zone
    // groups really are on this graph.
    expect(
      graph.objects.any((o) => o.kind == RenderObjectKind.fabricBase),
      isTrue,
      reason: 'the fabric/base renders',
    );
    expect(
      graph.objects.any((o) => o.kind == RenderObjectKind.group),
      isTrue,
      reason: 'the garment, its parts and its zones render',
    );

    // The frozen classification decides and nothing else does: the fabric /
    // base, the zones, the garment parts and the garment itself all refuse.
    for (final object in graph.objects) {
      expect(
        session.beginCanvasMove(object.source.refId),
        object.kind == RenderObjectKind.motif,
        reason: '${object.kind.wireName} ${object.source.refId}',
      );
      session.cancelCanvasMove();
    }
    expect(session.engine.document, same(document));
    expect(session.engine.document.history.entries, hasLength(history));

    // And through a real pointer: a drag that grabs an already-selected
    // non-motif runs the whole gesture and still moves nothing.
    final bareZone = treeRoot(session).descendantsAndSelf.firstWhere(
      (n) => n.type == DesignNodeType.zone && n.children.isEmpty,
    );
    final grab = centreOf(tester, bareZone.id);
    await tester.tapAt(grab);
    await tester.pumpAndSettle();
    expect(session.canvasSelection.selectedIds, {bareZone.id});
    final presented = presentedGraph(tester);

    final gesture = await tester.startGesture(grab);
    await tester.pump();
    await gesture.moveBy(const Offset(60, 40));
    await tester.pump();
    expect(session.canvasMovePreview, isNull, reason: 'no move ever began');
    expect(presentedGraph(tester), presented);
    await gesture.up();
    await tester.pumpAndSettle();
    expect(session.engine.document, same(document));
    expect(session.engine.document.history.entries, hasLength(history));
    expect(tester.takeException(), isNull);
  });

  // ------------------------------------------------- abandoned gestures
  testWidgets('a pointer cancelled before the drag is accepted moves nothing', (
    tester,
  ) async {
    final session = await pumpCanvas(tester, GarmentType.kurta);
    final motifId = motifObjects(session.canvasRenderGraph).first.source.refId;
    final anchor = compiledTransformOf(session, motifId);
    final grab = centreOf(tester, motifId);
    await tester.tapAt(grab);
    await tester.pumpAndSettle();
    final document = session.engine.document;

    // Below the frozen pan slop the gesture never becomes a drag, so no move is
    // ever begun and a cancelled pointer has nothing to roll back.
    final gesture = await tester.startGesture(grab);
    await tester.pump();
    await gesture.moveBy(const Offset(4, 3));
    await tester.pump();
    expect(session.canvasMovePreview, isNull);
    await gesture.cancel();
    await tester.pumpAndSettle();
    expect(session.canvasMovePreview, isNull);
    expect(session.engine.document, same(document));
    expect(compiledTransformOf(session, motifId), anchor);
    expect(tester.takeException(), isNull);
  });

  testWidgets('cancelling an in-flight move leaves the document untouched', (
    tester,
  ) async {
    final session = await pumpCanvas(tester, GarmentType.kurta);
    final motifId = motifObjects(session.canvasRenderGraph).first.source.refId;
    final anchor = compiledTransformOf(session, motifId);
    final grab = centreOf(tester, motifId);
    await tester.tapAt(grab);
    await tester.pumpAndSettle();
    final document = session.engine.document;
    final history = document.history.entries.length;
    final placed = presentedBoundsOf(tester, motifId);

    final gesture = await tester.startGesture(grab);
    await tester.pump();
    await gesture.moveBy(const Offset(60, 40));
    await tester.pump();
    expect(session.canvasMovePreview, isNotNull);

    // The frozen `GesturePhase.cancel` route, exactly as CanvasPanel wires it.
    // (A pointer cancel cannot be driven through the widget once the drag has
    // been accepted: Flutter's own drag recognizer turns a post-acceptance
    // PointerCancelEvent into `onEnd`, not `onCancel`.)
    session.cancelCanvasMove();
    await gesture.moveBy(const Offset(6, 4));
    await tester.pump();
    expect(session.canvasMovePreview, isNull);
    expect(
      presentedBoundsOf(tester, motifId),
      placed,
      reason: 'straight back where the document says it is',
    );

    // Releasing an abandoned gesture persists nothing either.
    await gesture.up();
    await tester.pumpAndSettle();
    expect(session.engine.document, same(document));
    expect(session.engine.document.history.entries, hasLength(history));
    expect(compiledTransformOf(session, motifId), anchor);
    expect(session.canvasMovePreview, isNull);
    expect(tester.takeException(), isNull);
  });

  testWidgets('a zero-net swipe writes no history', (tester) async {
    final session = await pumpCanvas(tester, GarmentType.kurta);
    final motifId = motifObjects(session.canvasRenderGraph).first.source.refId;
    final anchor = compiledTransformOf(session, motifId);
    final grab = centreOf(tester, motifId);
    await tester.tapAt(grab);
    await tester.pumpAndSettle();
    final document = session.engine.document;
    final history = document.history.entries.length;
    final dirty = session.isDirty;

    const step = Offset(60, 40);
    final gesture = await tester.startGesture(grab);
    await tester.pump();
    await gesture.moveBy(step);
    await tester.pump();
    expect(session.canvasMovePreview!.transform, isNot(anchor));
    await gesture.moveBy(-step);
    await tester.pump();
    expect(
      session.canvasMovePreview!.transform,
      anchor,
      reason: 'the gesture ended exactly where it began',
    );
    await gesture.up();
    await tester.pumpAndSettle();

    // A press-and-release is not a movement: no command is built for it, so no
    // history entry whose inverse equals itself and no truncated redo branch.
    expect(session.engine.document, same(document));
    expect(session.engine.document.history.entries, hasLength(history));
    expect(session.isDirty, dirty);
    expect(compiledTransformOf(session, motifId), anchor);
    expect(tester.takeException(), isNull);
  });

  // -------------------------------------------------- engine-owned refusal
  testWidgets('a locked motif previews its move and the engine refuses it', (
    tester,
  ) async {
    final session = await pumpCanvas(tester, GarmentType.kurta);
    final motifId = motifObjects(session.canvasRenderGraph).first.source.refId;
    final anchor = compiledTransformOf(session, motifId);
    final before = persistedTransformOf(session, motifId);
    expect(session.setNodeLocked(motifId, true).wasApplied, isTrue);
    await tester.pumpAndSettle();

    final document = session.engine.document;
    final revision = document.revision.value;
    final history = document.history.entries.length;
    final grab = centreOf(tester, motifId);
    await tester.tapAt(grab);
    await tester.pumpAndSettle();

    final gesture = await tester.startGesture(grab);
    await tester.pump();
    await gesture.moveBy(const Offset(60, 40));
    await tester.pump();
    // Nothing is pre-empted: the locked motif still previews its move.
    expect(session.canvasMovePreview, isNotNull);
    await gesture.up();
    await tester.pumpAndSettle();

    // The engine refused, so the document is inert and the motif is back where
    // the document says it is.
    expect(session.lastResult, startsWith('Rejected'));
    expect(session.engine.document.revision.value, revision);
    expect(session.engine.document.history.entries, hasLength(history));
    expect(persistedTransformOf(session, motifId), before);
    expect(compiledTransformOf(session, motifId), anchor);
    expect(session.canvasMovePreview, isNull);
    expect(nodeFor(session, motifId).locked, isTrue);
    expect(tester.takeException(), isNull);
  });

  // --------------------------------------------------- history branch policy
  testWidgets('a new move after undo invalidates the pending redo', (
    tester,
  ) async {
    final session = await pumpCanvas(tester, GarmentType.kurta);
    final motifId = motifObjects(session.canvasRenderGraph).first.source.refId;
    expect(session.canRedo, isFalse, reason: 'nothing undone yet');

    await swipeMotif(tester, session, motifId, const Offset(60, 40));
    final first = persistedTransformOf(session, motifId);
    expect(first, isNotNull, reason: 'the first move persisted');

    expect(session.undo().wasApplied, isTrue);
    await tester.pumpAndSettle();
    expect(session.canRedo, isTrue, reason: 'the move is redoable');

    // A fresh move on top of an undone one truncates the redo branch, exactly
    // as the frozen history does for every other command.
    await swipeMotif(tester, session, motifId, const Offset(-72, 48));
    expect(session.canRedo, isFalse, reason: 'the redo branch was truncated');
    final second = persistedTransformOf(session, motifId);
    expect(second, isNotNull);
    expect(second, isNot(first));
    expect(compiledTransformOf(session, motifId), second);
    expect(session.rows, isNotEmpty, reason: 'the Design Tree survives');
    expect(tester.takeException(), isNull);
  });
}
