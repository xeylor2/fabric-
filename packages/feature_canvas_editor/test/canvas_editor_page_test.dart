import 'package:core_design_system/core_design_system.dart';
import 'package:core_geometry/core_geometry.dart';
import 'package:core_render/core_render.dart';
import 'package:feature_canvas_editor/feature_canvas_editor.dart';
import 'package:flutter/material.dart' hide RenderObject;
import 'package:flutter_test/flutter_test.dart';

import 'support/canvas_test_document.dart';

/// Collects the frozen per-frame metrics the surface pushes (§G).
final class _Metrics implements RenderMetricsSink {
  final List<RenderMetrics> frames = [];

  @override
  void onFrameMetrics(RenderMetrics metrics) => frames.add(metrics);
}

Future<void> _pump(
  WidgetTester tester, {
  RenderGraph? graph,
  RenderMetricsSink? metricsSink,
  void Function(String? nodeId)? onNodeHit,
  void Function(CanvasMoveGesture gesture)? onMoveGesture,
  CanvasMovePreviewReader? movePreview,
  Size size = const Size(400, 320),
}) async {
  await tester.pumpWidget(
    MaterialApp(
      theme: FebricTheme.build(FebricThemeVariant.light),
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: CanvasEditorPage(
              graph: graph,
              metricsSink: metricsSink,
              onNodeHit: onNodeHit,
              onMoveGesture: onMoveGesture,
              movePreview: movePreview,
            ),
          ),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

/// The painter of the frame currently on screen.
CanvasSurfacePainter _painter(WidgetTester tester) =>
    tester.widget<CustomPaint>(find.byKey(const Key('canvas-surface'))).painter!
        as CanvasSurfacePainter;

/// The presented bounds of the object sourced from [nodeId].
Rect2D _boundsOf(WidgetTester tester, String nodeId) => _painter(
  tester,
).graph.objects.firstWhere((o) => o.source.refId == nodeId).bounds;

/// The global position of a document-space point, through the surface's OWN
/// live viewport (the frozen `ViewportState.canvasToScreen`).
Offset _globalOf(WidgetTester tester, Point2D documentPoint) {
  final local = _painter(
    tester,
  ).renderContext.viewport.canvasToScreen(documentPoint);
  final surface = tester.getRect(
    find.byKey(const Key('canvas-surface-gestures')),
  );
  return surface.topLeft + Offset(local.x, local.y);
}

void main() {
  testWidgets('unwired, the module stays a placeholder', (tester) async {
    await _pump(tester);
    expect(find.byType(ModulePlaceholderView), findsOneWidget);
    expect(find.byKey(const Key('canvas-surface')), findsNothing);
  });

  testWidgets('wired, a real painted surface replaces the placeholder', (
    tester,
  ) async {
    await _pump(tester, graph: canvasTestGraph());
    expect(find.byType(ModulePlaceholderView), findsNothing);
    final surface = find.byKey(const Key('canvas-surface'));
    expect(surface, findsOneWidget);
    expect(
      tester.widget<CustomPaint>(surface).painter,
      isA<CanvasSurfacePainter>(),
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets('the frame draws every compiled object', (tester) async {
    final metrics = _Metrics();
    await _pump(tester, graph: canvasTestGraph(), metricsSink: metrics);
    expect(metrics.frames, isNotEmpty, reason: 'a frame actually ran');
    final last = metrics.frames.last;
    expect(last.valueOf(RenderMetricKind.totalObjects), 5);
    expect(last.valueOf(RenderMetricKind.visibleObjects), 5);
    expect(last.valueOf(RenderMetricKind.culledObjects), 0);
    expect(
      last.valueOf(RenderMetricKind.drawCalls),
      5,
      reason: 'five objects reached the driver',
    );
  });

  testWidgets('a tap resolves the existing node identity', (tester) async {
    final hits = <String?>[];
    await _pump(tester, graph: canvasTestGraph(), onNodeHit: hits.add);

    // The fitted viewport centres the document, so the centre of the surface is
    // the centre of the sheet — inside the printed motif layer.
    await tester.tap(find.byKey(const Key('canvas-surface-gestures')));
    await tester.pumpAndSettle();
    expect(hits, ['motif']);

    // Beyond the sheet (fit leaves padding around it) resolves to nothing.
    final surface = tester.getRect(
      find.byKey(const Key('canvas-surface-gestures')),
    );
    await tester.tapAt(surface.topLeft + const Offset(2, 2));
    await tester.pumpAndSettle();
    expect(hits, ['motif', null]);
  });

  testWidgets('a tap changes no document and no compiled graph', (
    tester,
  ) async {
    final graph = canvasTestGraph();
    final before = graph.toJson();
    await _pump(tester, graph: graph);
    await tester.tap(find.byKey(const Key('canvas-surface-gestures')));
    await tester.pumpAndSettle();
    expect(graph.toJson(), before);
    expect(canvasTestGraph(), graph, reason: 'recompiling is identical');
    expect(tester.takeException(), isNull);
  });

  testWidgets('the surface follows the Theme Engine, not its own colours', (
    tester,
  ) async {
    for (final variant in [
      FebricThemeVariant.light,
      FebricThemeVariant.midnight,
      FebricThemeVariant.luxuryMaroon,
    ]) {
      await tester.pumpWidget(
        MaterialApp(
          theme: FebricTheme.build(variant),
          home: Scaffold(
            body: SizedBox(
              width: 400,
              height: 320,
              child: CanvasEditorPage(graph: canvasTestGraph()),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(
        tester
            .widget<ColoredBox>(find.byKey(const Key('canvas-surface-ground')))
            .color,
        buildFebricColors(variant).canvas,
        reason: '${variant.name} canvas token',
      );
      expect(tester.takeException(), isNull);
    }
  });

  // NDH-2 / B-2, authorized for canvas motif movement only. The surface reports
  // a drag on already-selected content and presents whatever ephemeral
  // transform its owner holds. It decides neither.
  group('the in-flight motif move', () {
    testWidgets('a drag on nothing selected reports no move', (tester) async {
      final reports = <CanvasMoveGesture>[];
      // Unwired, the frozen M6 session's selection is the deliberate empty
      // stub, so no content is ever "already selected" here.
      await _pump(tester, graph: canvasTestGraph(), onMoveGesture: reports.add);
      final before = _painter(tester).graph;

      await tester.drag(
        find.byKey(const Key('canvas-surface-gestures')),
        const Offset(40, 24),
      );
      await tester.pumpAndSettle();

      expect(reports, isEmpty, reason: 'nothing was grabbed, nothing moved');
      expect(_painter(tester).graph, before, reason: 'the graph is untouched');
      expect(tester.takeException(), isNull);
    });

    testWidgets('with nothing in flight the compiled graph is presented', (
      tester,
    ) async {
      await _pump(tester, graph: canvasTestGraph(), movePreview: () => null);
      expect(_painter(tester).graph, canvasTestGraph());
    });

    testWidgets('the ephemeral transform is what the surface presents', (
      tester,
    ) async {
      // The whole document projection, for the viewport comparison below.
      await _pump(tester, graph: canvasTestGraph());
      final settledViewport = _painter(tester).renderContext.viewport;
      final fabricBounds = _boundsOf(tester, 'fabric');

      const inFlight = Transform2D(translation: Point2D(x: 10, y: 5));
      await _pump(
        tester,
        graph: canvasTestGraph(),
        movePreview: () => (nodeId: 'motif', transform: inFlight),
      );

      // The motif alone is displaced, by exactly the ephemeral translation.
      expect(
        _boundsOf(tester, 'motif'),
        const Rect2D(left: 40, top: 30, width: 30, height: 25),
      );
      expect(_boundsOf(tester, 'fabric'), fabricBounds);

      // The camera does NOT re-fit under an ephemeral move: the viewport is the
      // document's, so the motif tracks the pointer one-for-one.
      expect(_painter(tester).renderContext.viewport, settledViewport);
    });

    testWidgets('hit testing follows the presented motif, not the stale one', (
      tester,
    ) async {
      // (65, 52) lies inside the displaced motif and outside the compiled one.
      const probe = Point2D(x: 65, y: 52);
      final hits = <String?>[];
      await _pump(tester, graph: canvasTestGraph(), onNodeHit: hits.add);
      await tester.tapAt(_globalOf(tester, probe));
      await tester.pumpAndSettle();
      expect(hits, ['fabric'], reason: 'the motif is not there yet');

      await _pump(
        tester,
        graph: canvasTestGraph(),
        onNodeHit: hits.add,
        movePreview: () => (
          nodeId: 'motif',
          transform: const Transform2D(translation: Point2D(x: 10, y: 5)),
        ),
      );
      await tester.tapAt(_globalOf(tester, probe));
      await tester.pumpAndSettle();
      expect(hits, ['fabric', 'motif']);
    });

    testWidgets('presenting an in-flight transform mutates no compiled graph', (
      tester,
    ) async {
      final graph = canvasTestGraph();
      final before = graph.toJson();
      await _pump(
        tester,
        graph: graph,
        movePreview: () => (
          nodeId: 'motif',
          transform: const Transform2D(translation: Point2D(x: 12, y: 12)),
        ),
      );
      await tester.drag(
        find.byKey(const Key('canvas-surface-gestures')),
        const Offset(30, 30),
      );
      await tester.pumpAndSettle();
      expect(graph.toJson(), before);
      expect(canvasTestGraph(), graph, reason: 'recompiling is identical');
      expect(tester.takeException(), isNull);
    });
  });
}
