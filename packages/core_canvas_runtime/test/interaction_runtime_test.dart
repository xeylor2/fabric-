import 'package:core_canvas/core_canvas.dart';
import 'package:core_canvas_runtime/core_canvas_runtime.dart';
import 'package:core_interaction/core_interaction.dart';
import 'package:test/test.dart';

// ---------------------------------------------------------------- fixtures
ViewportState _viewport() => const ViewportState(
  canvasSize: Size2D(width: 100, height: 100),
  screenSize: Size2D(width: 100, height: 100),
);

CanvasRuntimeState _state() =>
    CanvasRuntimeState(camera: NavigationState(viewport: _viewport()));

/// A deterministic hit-tester double (the renderer implements the real one,
/// M5B). Returns a node hit inside a fixed rect; a miss elsewhere.
final class _StubHitTester implements HitTestContract {
  int hitCount = 0;

  @override
  HitTestResult hitTest(HitTestQuery query) {
    hitCount++;
    final p = query.screenPoint;
    if (p.x >= 0 && p.x <= 50 && p.y >= 0 && p.y <= 50) {
      return HitTestResult(
        kind: HitTargetKind.node,
        documentPoint: p,
        semanticNodeId: 'node-1',
      );
    }
    return HitTestResult.miss(p);
  }

  @override
  List<String> hitTestRegion(Rect2D region) => const ['node-1'];
}

void main() {
  group('Frozen vocabularies — wire names (append-only)', () {
    test('CursorKind', () {
      expect(CursorKind.values.map((v) => v.wireName), [
        'arrow',
        'pointer',
        'grab',
        'grabbing',
        'zoom',
        'busy',
      ]);
    });

    test('InputRoute', () {
      expect(InputRoute.values.map((v) => v.wireName), ['camera', 'content']);
    });

    test('fromWireName rejects unknown input', () {
      expect(() => CursorKind.fromWireName('nope'), throwsArgumentError);
    });

    test('CursorState round-trips through JSON (nested Point2D as a map)', () {
      const state = CursorState(
        kind: CursorKind.grabbing,
        screenPosition: Point2D(x: 12, y: 34),
      );
      final json = state.toJson();
      // explicit_to_json: the nested point must be a plain map, not an
      // instance — the frozen serialization convention (build.yaml).
      expect(json['screenPosition'], isA<Map<String, dynamic>>());
      expect(json['kind'], 'grabbing');
      expect(CursorState.fromJson(json), state);
    });
  });

  group('Coordinate conversion (reuses frozen transforms)', () {
    test('screen↔document round-trips exactly at identity viewport', () {
      const conv = CoordinateConversion(
        ViewportState(
          canvasSize: Size2D(width: 100, height: 100),
          screenSize: Size2D(width: 100, height: 100),
        ),
      );
      const p = Point2D(x: 20, y: 35);
      expect(conv.documentToScreen(conv.screenToDocument(p)), p);
      // world hop is identity in the single-artboard runtime.
      expect(conv.documentToWorld(p), p);
      expect(conv.screenToWorld(p), conv.screenToDocument(p));
    });

    test('matches the frozen ViewportState transform under zoom/pan', () {
      final vp = _viewport().zoomedBy(2).panned(const Point2D(x: 10, y: 5));
      final conv = CoordinateConversion(vp);
      const screen = Point2D(x: 60, y: 40);
      // The conversion must equal the frozen maths exactly (no re-impl).
      expect(conv.screenToDocument(screen), vp.screenToCanvas(screen));
    });

    test('world↔screen composes the document hop (world hop is identity)', () {
      final vp = _viewport().zoomedBy(1.5).panned(const Point2D(x: 4, y: 6));
      final conv = CoordinateConversion(vp);
      const world = Point2D(x: 30, y: 20);
      // world→screen must equal document→screen (world hop is identity now).
      expect(conv.worldToScreen(world), conv.documentToScreen(world));
      // and worldToDocument is the inverse identity, so screen→world→document
      // is a faithful round-trip.
      final screen = conv.worldToScreen(world);
      expect(conv.worldToDocument(conv.screenToWorld(screen)), world);
    });
  });

  group('Viewport controller (drives frozen viewport maths)', () {
    test('zoomBy multiplies zoom via frozen ViewportOps', () {
      final c = ViewportController(
        camera: NavigationState(viewport: _viewport()),
      );
      c.zoomBy(2, screenAnchor: const Point2D(x: 50, y: 50));
      expect(c.viewport.zoom, 2.0);
    });

    test('panBy translates the shared viewport', () {
      final c = ViewportController(
        camera: NavigationState(viewport: _viewport()),
      );
      c.panBy(const Point2D(x: 10, y: -5));
      expect(c.viewport.offset, const Point2D(x: 10, y: -5));
    });

    test('applyZoomCommand pushes previous-view history; back() restores', () {
      final c = ViewportController(
        camera: NavigationState(viewport: _viewport()),
      );
      final before = c.viewport;
      c.applyZoomCommand(ZoomCommand.zoomIn);
      expect(c.viewport == before, isFalse);
      expect(c.canGoBack, isTrue);
      c.back();
      expect(c.viewport, before);
    });

    test('a no-op zoom command (absent input) does not push history', () {
      final c = ViewportController(
        camera: NavigationState(viewport: _viewport()),
      );
      c.applyZoomCommand(ZoomCommand.zoomToSelection); // no bounds → no-op
      expect(c.canGoBack, isFalse);
    });

    test('setViewport replaces the live viewport, preserving the camera', () {
      final c = ViewportController(
        camera: NavigationState(viewport: _viewport()),
      );
      const resized = ViewportState(
        canvasSize: Size2D(width: 100, height: 100),
        screenSize: Size2D(width: 200, height: 120),
      );
      c.setViewport(resized);
      expect(c.viewport.screenSize, const Size2D(width: 200, height: 120));
      // resize is not a discrete "view jump" → no history push.
      expect(c.canGoBack, isFalse);
    });

    test('fitToScreen drives the frozen ViewportOps.fittedToScreen', () {
      final c = ViewportController(
        camera: NavigationState(viewport: _viewport().zoomedBy(3)),
      );
      c.fitToScreen();
      // equals the frozen op applied to the same starting viewport.
      final expected = _viewport()
          .zoomedBy(3)
          .fittedToScreen(constraints: InteractionConfig.standard.constraints);
      expect(c.viewport, expected);
    });
  });

  group('Input dispatcher — pointer routing (frozen policy)', () {
    const d = InputDispatcher();

    test('tap/drag/longPress route to content; others to camera', () {
      expect(
        d.routeOf(const InteractionEvent.tap(position: Point2D.zero)),
        InputRoute.content,
      );
      expect(
        d.routeOf(
          const InteractionEvent.drag(
            phase: GesturePhase.update,
            position: Point2D.zero,
          ),
        ),
        InputRoute.content,
      );
      expect(
        d.routeOf(const InteractionEvent.pan(phase: GesturePhase.update)),
        InputRoute.camera,
      );
      expect(
        d.routeOf(
          const InteractionEvent.pinch(
            phase: GesturePhase.update,
            focalPoint: Point2D.zero,
          ),
        ),
        InputRoute.camera,
      );
    });

    test('content gesture reaches hit testing; camera gesture does not', () {
      final hitter = _StubHitTester();
      final c = ViewportController(
        camera: NavigationState(viewport: _viewport()),
      );
      final hit = d.dispatch(
        const InteractionEvent.tap(position: Point2D(x: 10, y: 10)),
        viewport: c,
        hitTest: hitter,
      );
      expect(hit?.isNodeHit, isTrue);
      expect(hitter.hitCount, 1);

      d.dispatch(
        const InteractionEvent.pan(
          phase: GesturePhase.update,
          delta: Point2D(x: 5, y: 5),
        ),
        viewport: c,
        hitTest: hitter,
      );
      expect(hitter.hitCount, 1); // camera route did NOT hit test
      expect(c.viewport.offset, const Point2D(x: 5, y: 5)); // it panned
    });
  });

  group('Interaction session (implements frozen CanvasRuntimeContract)', () {
    test('is a CanvasRuntimeContract and shares one viewport', () {
      final s = InteractionSession(
        state: _state(),
        hitTester: _StubHitTester(),
      );
      expect(s, isA<CanvasRuntimeContract>());
      expect(s.viewport, s.state.viewport);
    });

    test('camera input moves the shared viewport through the session', () {
      final s = InteractionSession(
        state: _state(),
        hitTester: _StubHitTester(),
      );
      s.handleInput(
        const InteractionEvent.pan(
          phase: GesturePhase.update,
          delta: Point2D(x: 12, y: 8),
        ),
      );
      expect(s.viewport.offset, const Point2D(x: 12, y: 8));
    });

    test('content tap resolves a hit and updates the cursor to pointer', () {
      final s = InteractionSession(
        state: _state(),
        hitTester: _StubHitTester(),
      );
      s.handleInput(
        const InteractionEvent.tap(position: Point2D(x: 10, y: 10)),
      );
      expect(s.lastHit?.semanticNodeId, 'node-1');
      expect(s.cursor.kind, CursorKind.pointer);
      // a tap on empty canvas → arrow
      s.handleInput(
        const InteractionEvent.tap(position: Point2D(x: 90, y: 90)),
      );
      expect(s.cursor.kind, CursorKind.arrow);
    });

    test('applyZoomCommand drives the shared viewport', () {
      final s = InteractionSession(
        state: _state(),
        hitTester: _StubHitTester(),
      );
      final before = s.viewport.zoom;
      s.applyZoomCommand(ZoomCommand.zoomIn);
      expect(s.viewport.zoom > before, isTrue);
    });

    test('overlay contribute/withdraw routes through the frozen stack', () {
      final s = InteractionSession(
        state: _state(),
        hitTester: _StubHitTester(),
      );
      s.contribute(const OverlayModel(id: 'sel', kind: OverlayKind.selection));
      expect(s.overlays.ofKind(OverlayKind.selection), hasLength(1));
      s.withdraw('sel');
      expect(s.overlays.entries, isEmpty);
    });

    test('hit testing delegates to the injected contract (M5B)', () {
      final hitter = _StubHitTester();
      final s = InteractionSession(state: _state(), hitTester: hitter);
      s.hitTest(const HitTestQuery(screenPoint: Point2D(x: 10, y: 10)));
      expect(hitter.hitCount, 1);
      expect(
        s.hitTestRegion(const Rect2D(left: 0, top: 0, width: 5, height: 5)),
        ['node-1'],
      );
    });

    test('selection is empty (M6 does not own selection logic)', () {
      final s = InteractionSession(
        state: _state(),
        hitTester: _StubHitTester(),
      );
      expect(s.selection, SelectionState.empty);
    });
  });
}
