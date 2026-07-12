import 'dart:math' as math;

import 'package:core_interaction/core_interaction.dart';
import 'package:test/test.dart';

const _canvas = Size2D(width: 2000, height: 1000);
const _screen = Size2D(width: 1200, height: 800);

ViewportState _base({double zoom = 1, double rotation = 0}) {
  return ViewportState(
    canvasSize: _canvas,
    screenSize: _screen,
    zoom: zoom,
    rotation: rotation,
    devicePixelRatio: 2,
  );
}

void _expectPoint(Point2D actual, Point2D expected, {double eps = 1e-9}) {
  expect(actual.x, closeTo(expected.x, eps));
  expect(actual.y, closeTo(expected.y, eps));
}

void main() {
  group('transforms', () {
    test('canvasToScreen and screenToCanvas are inverses (with rotation)', () {
      final state = _base(
        zoom: 1.7,
        rotation: 0.6,
      ).panned(const Point2D(x: 33, y: -12));
      const canvasPoint = Point2D(x: 421, y: 377);
      final roundTrip = state.screenToCanvas(state.canvasToScreen(canvasPoint));
      _expectPoint(roundTrip, canvasPoint);
    });

    test(
      'visibleRect without rotation is the screen window in canvas units',
      () {
        final state = _base(zoom: 2).panned(const Point2D(x: -100, y: -50));
        final visible = state.visibleRect;
        expect(visible.left, closeTo(50, 1e-9));
        expect(visible.top, closeTo(25, 1e-9));
        expect(visible.width, closeTo(_screen.width / 2, 1e-9));
        expect(visible.height, closeTo(_screen.height / 2, 1e-9));
      },
    );

    test('visibleRect with 90° rotation swaps the window dimensions', () {
      final state = _base(rotation: math.pi / 2);
      final visible = state.visibleRect;
      expect(visible.width, closeTo(_screen.height, 1e-6));
      expect(visible.height, closeTo(_screen.width, 1e-6));
    });
  });

  group('zoom ops', () {
    test('zoomedTo keeps the anchored canvas point fixed on screen', () {
      final state = _base(zoom: 0.8).panned(const Point2D(x: 40, y: 70));
      const anchor = Point2D(x: 300, y: 500);
      final before = state.screenToCanvas(anchor);
      final zoomed = state.zoomedTo(3.1, screenAnchor: anchor);
      final after = zoomed.screenToCanvas(anchor);
      _expectPoint(after, before, eps: 1e-6);
      expect(zoomed.zoom, 3.1);
    });

    test('zoom is always clamped to the constraints envelope', () {
      const constraints = ZoomConstraints(minZoom: 0.5, maxZoom: 4);
      final tooFar = _base().zoomedBy(1000, constraints: constraints);
      final tooClose = _base().zoomedBy(0.0001, constraints: constraints);
      expect(tooFar.zoom, 4);
      expect(tooClose.zoom, 0.5);
    });

    test('fittedToScreen fits, centers and clears rotation', () {
      final fitted = _base(zoom: 7, rotation: 1.2).fittedToScreen();
      expect(fitted.rotation, 0);
      // Fit is limited by width: 1200/2000 = 0.6 minus padding.
      expect(fitted.zoom, closeTo(0.6 * (1 - 0.08), 1e-9));
      _expectPoint(
        fitted.canvasToScreen(fitted.canvasCenter),
        fitted.screenCenter,
      );
      // Whole canvas is inside the visible region.
      final visible = fitted.visibleRect;
      expect(visible.containsPoint(Point2D.zero), isTrue);
      expect(visible.containsPoint(const Point2D(x: 2000, y: 1000)), isTrue);
    });

    test('actualSized reaches 100% anchored at screen center by default', () {
      final actual = _base(zoom: 0.3).centered().actualSized();
      expect(actual.zoom, 1);
      _expectPoint(
        actual.screenToCanvas(actual.screenCenter),
        _canvas.center,
        eps: 1e-6,
      );
    });

    test('zoomedToRect fits and centers the target bounds', () {
      const bounds = Rect2D(left: 100, top: 200, width: 300, height: 100);
      final state = _base().zoomedToRect(bounds);
      // Width-limited: 1200/300 = 4 minus padding.
      expect(state.zoom, closeTo(4 * (1 - 0.08), 1e-9));
      _expectPoint(
        state.canvasToScreen(bounds.center),
        state.screenCenter,
        eps: 1e-6,
      );
    });

    test('rotatedBy keeps the anchor fixed', () {
      final state = _base(zoom: 1.5).centered();
      const anchor = Point2D(x: 700, y: 300);
      final before = state.screenToCanvas(anchor);
      final rotated = state.rotatedBy(0.9, screenAnchor: anchor);
      _expectPoint(rotated.screenToCanvas(anchor), before, eps: 1e-6);
      expect(rotated.rotation, closeTo(0.9, 1e-12));
    });
  });

  group('applyZoomCommand — the nine frozen rules', () {
    final state = _base(zoom: 0.4).centered();

    test('defaultZoom uses the constraints default, centered', () {
      final result = state.applyZoomCommand(ZoomCommand.defaultZoom);
      expect(result.zoom, 1);
      _expectPoint(
        result.canvasToScreen(result.canvasCenter),
        result.screenCenter,
        eps: 1e-6,
      );
    });

    test('fitScreen and resetView produce the canonical fitted view', () {
      final fit = state.applyZoomCommand(ZoomCommand.fitScreen);
      final reset = _base(
        zoom: 9,
        rotation: 2,
      ).applyZoomCommand(ZoomCommand.resetView);
      expect(fit, reset);
    });

    test('actualSize sets 100%', () {
      expect(state.applyZoomCommand(ZoomCommand.actualSize).zoom, 1);
    });

    test('zoomIn and zoomOut are inverse steps around center', () {
      final inThenOut = state
          .applyZoomCommand(ZoomCommand.zoomIn)
          .applyZoomCommand(ZoomCommand.zoomOut);
      expect(inThenOut.zoom, closeTo(state.zoom, 1e-12));
    });

    test('zoomToCursor anchors at the cursor', () {
      const cursor = Point2D(x: 100, y: 100);
      final before = state.screenToCanvas(cursor);
      final result = state.applyZoomCommand(
        ZoomCommand.zoomToCursor,
        cursor: cursor,
      );
      expect(result.zoom, closeTo(state.zoom * 1.25, 1e-12));
      _expectPoint(result.screenToCanvas(cursor), before, eps: 1e-6);
    });

    test('selection/object/cursor commands without input are no-ops', () {
      expect(state.applyZoomCommand(ZoomCommand.zoomToSelection), state);
      expect(state.applyZoomCommand(ZoomCommand.zoomToObject), state);
      expect(state.applyZoomCommand(ZoomCommand.zoomToCursor), state);
    });

    test('zoomToSelection and zoomToObject fit their bounds', () {
      const bounds = Rect2D(left: 0, top: 0, width: 200, height: 200);
      final selection = state.applyZoomCommand(
        ZoomCommand.zoomToSelection,
        selectionBounds: bounds,
      );
      final object = state.applyZoomCommand(
        ZoomCommand.zoomToObject,
        objectBounds: bounds,
      );
      expect(selection, object);
      expect(selection.zoom, greaterThan(state.zoom));
    });
  });

  group('NavigationState', () {
    test('push remembers views and back returns to them', () {
      final a = _base();
      final b = a.zoomedBy(2);
      final c = b.panned(const Point2D(x: 10, y: 10));

      var nav = NavigationState(viewport: a);
      expect(nav.canGoBack, isFalse);
      nav = nav.pushViewport(b).pushViewport(c);
      expect(nav.viewport, c);
      expect(nav.canGoBack, isTrue);
      nav = nav.back();
      expect(nav.viewport, b);
      nav = nav.back();
      expect(nav.viewport, a);
      expect(nav.back().viewport, a, reason: 'back on empty history no-ops');
    });

    test('history is bounded by maxHistory', () {
      var nav = NavigationState(viewport: _base(), maxHistory: 3);
      for (var i = 1; i <= 10; i++) {
        nav = nav.pushViewport(_base(zoom: 1.0 + i));
      }
      expect(nav.history.length, 3);
    });
  });

  group('json', () {
    test('ViewportState round-trips losslessly', () {
      final state = _base(
        zoom: 2.5,
        rotation: 0.3,
      ).panned(const Point2D(x: 5, y: 6));
      expect(ViewportState.fromJson(state.toJson()), state);
    });
  });
}
