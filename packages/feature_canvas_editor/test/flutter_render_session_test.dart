import 'package:core_canvas/core_canvas.dart';
import 'package:core_geometry/core_geometry.dart';
import 'package:core_interaction/core_interaction.dart';
import 'package:core_render/core_render.dart';
import 'package:feature_canvas_editor/feature_canvas_editor.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/canvas_test_document.dart';

FlutterRenderSession _session({RenderGraph? graph}) => FlutterRenderSession(
  target: DesignTreeTarget.editor,
  context: canvasTestContext,
  graph: graph ?? canvasTestGraph(),
);

void main() {
  test('the session is the frozen RenderSession / HitTestContract', () {
    final session = _session();
    expect(session, isA<RenderSession>());
    expect(session, isA<HitTestContract>());
    expect(session.target, DesignTreeTarget.editor);
  });

  test('a hit returns the existing node identity, topmost first', () {
    final session = _session();

    // Over the printed motif: the deepest node at that point wins, so the
    // answer is the motif's own node id — not the cloth, zone, part or garment.
    final onMotif = session.hitTest(
      const HitTestQuery(screenPoint: Point2D(x: 45, y: 37)),
    );
    expect(onMotif.kind, HitTargetKind.node);
    expect(onMotif.isNodeHit, isTrue);
    expect(onMotif.semanticNodeId, 'motif');

    // Over the cloth but outside the print: the cloth's node id.
    final onFabric = session.hitTest(
      const HitTestQuery(screenPoint: Point2D(x: 15, y: 15)),
    );
    expect(onFabric.semanticNodeId, 'fabric');

    // Inside the panel but outside every zone: the panel itself.
    final onPanel = session.hitTest(
      const HitTestQuery(screenPoint: Point2D(x: 95, y: 75)),
    );
    expect(onPanel.semanticNodeId, 'panel');
  });

  test('a hit reports the pointer in document space', () {
    final hit = _session().hitTest(
      const HitTestQuery(screenPoint: Point2D(x: 45, y: 37)),
    );
    // The 1:1 test viewport maps screen to document one for one, through the
    // frozen coordinate pipeline.
    expect(hit.documentPoint, const Point2D(x: 45, y: 37));
  });

  test('empty canvas is a miss, not a guess', () {
    final hit = _session().hitTest(
      const HitTestQuery(screenPoint: Point2D(x: 400, y: 400)),
    );
    expect(hit.kind, HitTargetKind.empty);
    expect(hit.isNodeHit, isFalse);
    expect(hit.semanticNodeId, isNull);
  });

  test('tolerance widens the probe without moving the answer', () {
    final session = _session();
    // Just outside the motif's right edge (x = 60).
    const justOutside = Point2D(x: 61, y: 37);
    expect(
      session
          .hitTest(const HitTestQuery(screenPoint: justOutside))
          .semanticNodeId,
      'fabric',
    );
    expect(
      session
          .hitTest(const HitTestQuery(screenPoint: justOutside, tolerance: 4))
          .semanticNodeId,
      'motif',
    );
  });

  test('region hit testing returns every node id in draw order', () {
    final ids = _session().hitTestRegion(
      const Rect2D(left: 0, top: 0, width: 100, height: 80),
    );
    expect(ids, ['root', 'panel', 'zone', 'fabric', 'motif']);
  });

  test('hit testing mutates nothing', () {
    final graph = canvasTestGraph();
    final before = graph.toJson();
    final session = FlutterRenderSession(
      target: DesignTreeTarget.editor,
      context: canvasTestContext,
      graph: graph,
    );
    session.hitTest(const HitTestQuery(screenPoint: Point2D(x: 45, y: 37)));
    session.hitTestRegion(
      const Rect2D(left: 0, top: 0, width: 100, height: 80),
    );
    expect(graph.toJson(), before);
    // The document the graph was compiled from is untouched too: compiling it
    // again yields the identical graph.
    expect(canvasTestGraph(), graph);
  });

  test('a hidden node is absent from the surface and unhittable', () {
    final graph = canvasTestGraph(root: canvasTestRootWithHiddenMotif);
    expect(graph.objects.length, 4, reason: 'the motif renders nowhere');
    final hit = _session(
      graph: graph,
    ).hitTest(const HitTestQuery(screenPoint: Point2D(x: 45, y: 37)));
    expect(hit.semanticNodeId, 'fabric');
  });
}
