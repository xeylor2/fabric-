import 'package:core_canvas/core_canvas.dart';
import 'package:core_design_system/core_design_system.dart';
import 'package:core_interaction/core_interaction.dart';
import 'package:core_lock/core_lock.dart';
import 'package:core_render/core_render.dart';
import 'package:core_textile/core_textile.dart';
import 'package:core_tooling/core_tooling.dart';
import 'package:feature_canvas_editor/feature_canvas_editor.dart';
import 'package:febric/di/design_tree_session.dart';
import 'package:febric/di/garment_content.dart';
import 'package:febric/workspace/canvas_panel.dart';
import 'package:flutter/material.dart' hide RenderObject;
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

/// Individual printed-motif selection on the canvas.
///
/// The chain under test is the frozen one, composed and nothing more:
///
///   tap on the real garment surface
///   → frozen CanvasRuntimeContract.handleInput  (CompositeCanvasRuntime)
///   → frozen InteractionSession + InputDispatcher (content route)
///   → frozen HitTestContract (FlutterRenderSession) → existing node identity
///   → frozen SelectionRuntime.applyHit + SelectionMode.forModifiers
///   → frozen SelectionState (ids only, ephemeral)
///   → frozen OverlayKind.selection through CanvasRuntimeContract.contribute
///   → frozen ToolContext.selection → ToolRequest.targetIds
///
/// Nothing in it mutates the document: no `DocumentCommand` is built, no
/// `DesignNode.selected` is written, and `DocumentEngine.apply` is never
/// reached. Movement, transform writing, repeat and AI are out of scope.
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

  /// The global tap position of a document-space rectangle's centre, mapped
  /// through the surface's OWN live viewport (the frozen
  /// `ViewportState.canvasToScreen`) — never a duplicated layout calculation.
  Offset tapPointOf(WidgetTester tester, Rect2D bounds) {
    final viewport = painterOf(tester).renderContext.viewport;
    final local = viewport.canvasToScreen(bounds.center);
    final surface = tester.getRect(
      find.byKey(const Key('canvas-surface-gestures')),
    );
    return surface.topLeft + Offset(local.x, local.y);
  }

  List<RenderObject> motifObjects(RenderGraph graph) => graph.objects
      .where((o) => o.kind == RenderObjectKind.motif)
      .toList(growable: false);

  Future<DesignTreeSession> pumpCanvas(
    WidgetTester tester, {
    List<GarmentType> garments = const [],
  }) async {
    tester.view.physicalSize = const Size(1200, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    final session = DesignTreeSession.inMemory();
    addTearDown(session.dispose);
    for (final type in garments) {
      session.instantiateGarment(type.wireName);
    }
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

  group('a tap on a printed motif selects that exact motif', () {
    for (final type in launchGarmentTypes) {
      testWidgets('${type.label}', (tester) async {
        final session = await pumpCanvas(tester, garments: [type]);
        expect(session.canvasSelection.isEmpty, isTrue, reason: 'starts empty');

        final graph = session.canvasRenderGraph;
        final motifs = motifObjects(graph);
        expect(motifs, isNotEmpty, reason: '${type.label} has printed motifs');
        final motif = motifs.first;
        final motifId = motif.source.refId;

        await tester.tapAt(tapPointOf(tester, motif.bounds));
        await tester.pumpAndSettle();

        // The exact motif node identity — not the cloth, zone, part or garment.
        expect(session.canvasSelection.selectedIds, {motifId});
        expect(session.canvasSelection.count, 1);
        expect(session.canvasSelection.isSelected(motifId), isTrue);

        // It is a real document node, and it is a printed motif.
        final node = nodeFor(session, motifId);
        expect(node.type, DesignNodeType.element);
        expect(node.metadata['object_type'], TextileObjectType.motif.wireName);
        expect(tester.takeException(), isNull);
      });
    }
  });

  testWidgets('selecting another motif replaces the selection', (tester) async {
    final session = await pumpCanvas(tester, garments: [GarmentType.kurta]);
    final motifs = motifObjects(session.canvasRenderGraph);
    expect(motifs.length, greaterThan(1), reason: 'more than one motif exists');

    await tester.tapAt(tapPointOf(tester, motifs.first.bounds));
    await tester.pumpAndSettle();
    expect(session.canvasSelection.selectedIds, {motifs.first.source.refId});

    // No modifier → the frozen SelectionMode.replace.
    await tester.tapAt(tapPointOf(tester, motifs.last.bounds));
    await tester.pumpAndSettle();
    expect(session.canvasSelection.selectedIds, {motifs.last.source.refId});
  });

  testWidgets('the frozen modifier policy still decides how taps combine', (
    tester,
  ) async {
    final session = await pumpCanvas(tester, garments: [GarmentType.kurta]);
    final motifs = motifObjects(session.canvasRenderGraph);
    final first = motifs.first.source.refId;
    final second = motifs.last.source.refId;

    await tester.tapAt(tapPointOf(tester, motifs.first.bounds));
    await tester.pumpAndSettle();

    // Shift → the frozen SelectionMode.add.
    await tester.sendKeyDownEvent(LogicalKeyboardKey.shiftLeft);
    await tester.tapAt(tapPointOf(tester, motifs.last.bounds));
    await tester.pumpAndSettle();
    await tester.sendKeyUpEvent(LogicalKeyboardKey.shiftLeft);
    expect(session.canvasSelection.selectedIds, {first, second});

    // Primary modifier → the frozen SelectionMode.toggle.
    await tester.sendKeyDownEvent(LogicalKeyboardKey.controlLeft);
    await tester.tapAt(tapPointOf(tester, motifs.last.bounds));
    await tester.pumpAndSettle();
    await tester.sendKeyUpEvent(LogicalKeyboardKey.controlLeft);
    expect(session.canvasSelection.selectedIds, {first});
  });

  testWidgets('a non-motif hit never becomes a motif selection', (
    tester,
  ) async {
    final session = await pumpCanvas(tester, garments: [GarmentType.kurta]);
    final graph = session.canvasRenderGraph;
    final motifIds = motifObjects(graph).map((o) => o.source.refId).toSet();

    // A zone whose declared slot accepts neither the substrate nor a print
    // therefore holds no content node: its own identity is the topmost there.
    final bareZone = treeRoot(session).descendantsAndSelf.firstWhere(
      (n) => n.type == DesignNodeType.zone && n.children.isEmpty,
    );
    final zoneObject = graph.objects.firstWhere(
      (o) => o.source.refId == bareZone.id,
    );
    expect(zoneObject.kind, RenderObjectKind.group);

    await tester.tapAt(tapPointOf(tester, zoneObject.bounds));
    await tester.pumpAndSettle();

    expect(session.canvasSelection.selectedIds, {bareZone.id});
    expect(
      session.canvasSelection.selectedIds.intersection(motifIds),
      isEmpty,
      reason: 'no motif was substituted for a non-motif hit',
    );
  });

  testWidgets('empty canvas clears the selection', (tester) async {
    final session = await pumpCanvas(tester, garments: [GarmentType.dupatta]);
    final motifs = motifObjects(session.canvasRenderGraph);
    await tester.tapAt(tapPointOf(tester, motifs.first.bounds));
    await tester.pumpAndSettle();
    expect(session.canvasSelection.isNotEmpty, isTrue);

    // Beyond the sheet: the frozen miss with no modifier clears.
    final surface = tester.getRect(
      find.byKey(const Key('canvas-surface-gestures')),
    );
    await tester.tapAt(surface.topLeft + const Offset(2, 2));
    await tester.pumpAndSettle();
    expect(session.canvasSelection.isEmpty, isTrue);
  });

  testWidgets('the frozen selection overlay is presented for the motif', (
    tester,
  ) async {
    final session = await pumpCanvas(tester, garments: [GarmentType.pant]);
    expect(
      painterOf(tester).overlays.ofKind(OverlayKind.selection),
      isEmpty,
      reason: 'nothing selected yet',
    );

    final motif = motifObjects(session.canvasRenderGraph).first;
    await tester.tapAt(tapPointOf(tester, motif.bounds));
    await tester.pumpAndSettle();

    final overlays = painterOf(tester).overlays.ofKind(OverlayKind.selection);
    expect(overlays, hasLength(1));
    expect(overlays.single.references, [motif.source.refId]);
    expect(overlays.single.bounds, motif.bounds);
    expect(overlays.single.visible, isTrue);

    // Selecting elsewhere moves the overlay with the selection.
    final other = motifObjects(session.canvasRenderGraph).last;
    await tester.tapAt(tapPointOf(tester, other.bounds));
    await tester.pumpAndSettle();
    final moved = painterOf(tester).overlays.ofKind(OverlayKind.selection);
    expect(moved, hasLength(1));
    expect(moved.single.references, [other.source.refId]);
  });

  testWidgets('selection mutates no document state', (tester) async {
    final session = await pumpCanvas(tester, garments: [GarmentType.kurta]);
    final document = session.engine.document;
    final revision = document.revision;
    final history = document.history.entries.length;
    final dirty = session.isDirty;
    final notifications = session.revision.value;
    final rows = session.rows.length;
    final motifs = motifObjects(session.canvasRenderGraph);

    for (final motif in motifs.take(3)) {
      await tester.tapAt(tapPointOf(tester, motif.bounds));
      await tester.pumpAndSettle();
    }
    expect(session.canvasSelection.isNotEmpty, isTrue, reason: 'it did select');

    // The identical document instance, and the engine never ran.
    expect(session.engine.document, same(document));
    expect(session.engine.document.revision, revision);
    expect(session.engine.document.history.entries, hasLength(history));
    expect(session.isDirty, dirty);
    expect(session.revision.value, notifications);

    // DesignNode.selected stays dormant — selection lives only in the runtime.
    expect(
      treeRoot(session).descendantsAndSelf.every((n) => !n.selected),
      isTrue,
    );

    // The Design Tree projection is untouched and still functional.
    expect(session.rows, hasLength(rows));
    expect(session.canvasRenderGraph, session.canvasRenderGraph);
    expect(tester.takeException(), isNull);
  });

  testWidgets('the frozen ToolContext receives the selected motif', (
    tester,
  ) async {
    final session = await pumpCanvas(tester, garments: [GarmentType.kurta]);
    final motif = motifObjects(session.canvasRenderGraph).first;
    await tester.tapAt(tapPointOf(tester, motif.bounds));
    await tester.pumpAndSettle();
    final motifId = motif.source.refId;

    // Registration and activation ride the existing runtimes; the composition
    // assembles the frozen ToolContext from its own live viewport + selection.
    final probe = _ContextProbeTool();
    final toolId = session.canvasTools.registerTool(probe);
    final runtime = session.activeCanvasRuntime!;
    await runtime.activateTool(toolId);

    expect(probe.context, isNotNull);
    expect(probe.context!.selection.selectedIds, {motifId});
    expect(probe.context!.viewport, painterOf(tester).renderContext.viewport);
    expect(runtime.selection.selectedIds, {motifId});

    // The selected identity reaches a tool request as its target.
    final result = await runtime.executeTool(
      ToolRequest(targetIds: runtime.selection.selectedIds.toList()),
    );
    expect(result.status, ToolResultStatus.success);
    expect(probe.lastRequest!.targetIds, [motifId]);

    // Observing a tool changed nothing in the document.
    expect(session.engine.document.history.entries, hasLength(1));
    await runtime.deactivateTool();
    await runtime.disposeTool(toolId);
  });
}

/// A frozen [UniversalToolContract] that records the context and request it is
/// given and does nothing else — no command, no sink, no document. It exists to
/// observe that the existing tool path sees the selected motif; it is not a
/// product tool and implements no operation.
final class _ContextProbeTool implements UniversalToolContract {
  ToolContext? context;
  ToolRequest? lastRequest;

  @override
  Future<void> initialize(ToolContext toolContext) async {
    context = toolContext;
  }

  @override
  Future<void> dispose() async {}

  @override
  Future<void> activate() async {}

  @override
  Future<void> deactivate() async {}

  @override
  Future<ToolPreview> preview(ToolRequest request) async {
    lastRequest = request;
    return const ToolPreview(previewId: 'probe', description: 'probe');
  }

  @override
  Future<ToolResult> execute(ToolRequest request) async {
    lastRequest = request;
    return ToolResult.success;
  }

  @override
  Future<void> cancel() async {}

  @override
  Future<ToolResult> undo() async => ToolResult.success;

  @override
  Future<ToolResult> redo() async => ToolResult.success;

  @override
  SelectionState selection() => context?.selection ?? SelectionState.empty;

  @override
  ViewportState viewport() => context!.viewport;

  @override
  ToolHistory history() => const ToolHistory();

  @override
  LockSet lock() => context?.locks ?? LockSet.none;

  @override
  ToolMetadata metadata() =>
      const ToolMetadata(tool: FebricTool.repeatPattern, version: '0.0.0');
}
