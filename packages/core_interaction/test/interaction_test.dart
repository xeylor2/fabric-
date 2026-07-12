import 'dart:math' as math;

import 'package:core_interaction/core_interaction.dart';
import 'package:test/test.dart';

const _canvas = Size2D(width: 2000, height: 1000);
const _screen = Size2D(width: 1200, height: 800);

ViewportState _base({double zoom = 1}) {
  return ViewportState(canvasSize: _canvas, screenSize: _screen, zoom: zoom);
}

void main() {
  const mapper = ViewportInteractionMapper();

  group('platform behaviour parity (ADR-0003)', () {
    const focal = Point2D(x: 400, y: 300);
    const factor = 1.6;

    test('touch pinch ≡ trackpad pinch ≡ Ctrl+wheel for the same intent', () {
      final start = _base(zoom: 0.9).panned(const Point2D(x: 25, y: 10));

      final viaTouch = mapper.apply(
        start,
        const InteractionEvent.pinch(
          phase: GesturePhase.update,
          focalPoint: focal,
          scaleFactor: factor,
        ),
      );
      final viaTrackpad = mapper.apply(
        start,
        const InteractionEvent.pinch(
          phase: GesturePhase.update,
          focalPoint: focal,
          scaleFactor: factor,
          device: InputDevice.trackpad,
        ),
      );
      // Wheel delta chosen so exp(-dy·sensitivity) == factor.
      final dy = -math.log(factor) / 0.002;
      final viaWheel = mapper.apply(
        start,
        InteractionEvent.wheel(
          position: focal,
          scrollDelta: Point2D(x: 0, y: dy),
          modifiers: const KeyModifiers(control: true),
        ),
      );

      expect(viaTrackpad, viaTouch);
      expect(viaWheel.zoom, closeTo(viaTouch.zoom, 1e-9));
      expect(viaWheel.offset.x, closeTo(viaTouch.offset.x, 1e-6));
      expect(viaWheel.offset.y, closeTo(viaTouch.offset.y, 1e-6));
    });

    test('meta (Cmd) and control are equivalent primary modifiers', () {
      final start = _base();
      const wheel = Point2D(x: 0, y: -120);
      final viaCtrl = mapper.apply(
        start,
        const InteractionEvent.wheel(
          position: focal,
          scrollDelta: wheel,
          modifiers: KeyModifiers(control: true),
        ),
      );
      final viaCmd = mapper.apply(
        start,
        const InteractionEvent.wheel(
          position: focal,
          scrollDelta: wheel,
          modifiers: KeyModifiers(meta: true),
        ),
      );
      expect(viaCmd, viaCtrl);
    });

    test('two-finger pan ≡ single-pointer viewport pan', () {
      const delta = Point2D(x: -18, y: 7);
      final one = mapper.apply(
        _base(),
        const InteractionEvent.pan(
          phase: GesturePhase.update,
          delta: delta,
          pointerCount: 1,
          device: InputDevice.mouse,
        ),
      );
      final two = mapper.apply(
        _base(),
        const InteractionEvent.pan(
          phase: GesturePhase.update,
          delta: delta,
          pointerCount: 2,
        ),
      );
      expect(one, two);
    });
  });

  group('universal wheel policy', () {
    test('bare wheel pans (natural direction), shift pans horizontally', () {
      final start = _base();
      final panned = mapper.apply(
        start,
        const InteractionEvent.wheel(
          position: Point2D(x: 10, y: 10),
          scrollDelta: Point2D(x: 0, y: 40),
        ),
      );
      expect(panned.offset, const Point2D(x: 0, y: -40));

      final horizontal = mapper.apply(
        start,
        const InteractionEvent.wheel(
          position: Point2D(x: 10, y: 10),
          scrollDelta: Point2D(x: 0, y: 40),
          modifiers: KeyModifiers(shift: true),
        ),
      );
      expect(horizontal.offset, const Point2D(x: -40, y: 0));
    });

    test('wheelZoomRequiresModifier=false makes a bare wheel zoom', () {
      const eager = ViewportInteractionMapper(
        config: InteractionConfig(wheelZoomRequiresModifier: false),
      );
      final result = eager.apply(
        _base(),
        const InteractionEvent.wheel(
          position: Point2D(x: 600, y: 400),
          scrollDelta: Point2D(x: 0, y: -100),
        ),
      );
      expect(result.zoom, greaterThan(1));
    });
  });

  group('double-tap smart zoom', () {
    test('below 100% jumps to actual size at the tap point', () {
      final start = _base(zoom: 0.5);
      const tap = Point2D(x: 200, y: 200);
      final before = start.screenToCanvas(tap);
      final result = mapper.apply(
        start,
        const InteractionEvent.doubleTap(position: tap),
      );
      expect(result.zoom, 1);
      expect(result.screenToCanvas(tap).x, closeTo(before.x, 1e-6));
      expect(result.screenToCanvas(tap).y, closeTo(before.y, 1e-6));
    });

    test('at or above 100% returns to fit', () {
      final result = mapper.apply(
        _base(zoom: 3),
        const InteractionEvent.doubleTap(position: Point2D(x: 5, y: 5)),
      );
      expect(result, _base(zoom: 3).fittedToScreen());
    });
  });

  group('content events never move the viewport', () {
    test('tap, long press and drag are viewport no-ops', () {
      final start = _base(zoom: 1.3).panned(const Point2D(x: 9, y: 9));
      const position = Point2D(x: 50, y: 60);
      final events = [
        const InteractionEvent.tap(position: position),
        const InteractionEvent.longPress(position: position),
        const InteractionEvent.drag(
          phase: GesturePhase.update,
          position: position,
          delta: Point2D(x: 30, y: 30),
        ),
      ];
      for (final event in events) {
        expect(mapper.apply(start, event), start, reason: '${event.kind}');
      }
    });
  });

  group('shortcuts route to frozen zoom commands', () {
    test('every shortcut applies its command', () {
      final start = _base(zoom: 0.4);
      const bounds = Rect2D(left: 0, top: 0, width: 100, height: 100);
      for (final shortcut in InteractionShortcut.values) {
        final viaMapper = mapper.apply(
          start,
          InteractionEvent.shortcut(shortcut: shortcut),
          selectionBounds: bounds,
        );
        final direct = start.applyZoomCommand(
          shortcut.command,
          selectionBounds: bounds,
        );
        expect(viaMapper, direct, reason: shortcut.wireName);
      }
    });
  });

  group('gesture kind mapping covers the frozen vocabulary', () {
    test('all 11 gesture kinds are reachable from events', () {
      final kinds = <GestureKind>{
        const InteractionEvent.tap(position: Point2D.zero).kind,
        const InteractionEvent.doubleTap(position: Point2D.zero).kind,
        const InteractionEvent.longPress(position: Point2D.zero).kind,
        const InteractionEvent.drag(
          phase: GesturePhase.start,
          position: Point2D.zero,
        ).kind,
        const InteractionEvent.pan(phase: GesturePhase.start).kind,
        const InteractionEvent.pan(
          phase: GesturePhase.start,
          pointerCount: 2,
        ).kind,
        const InteractionEvent.pinch(
          phase: GesturePhase.start,
          focalPoint: Point2D.zero,
          scaleFactor: 1.4,
        ).kind,
        const InteractionEvent.pinch(
          phase: GesturePhase.start,
          focalPoint: Point2D.zero,
          device: InputDevice.trackpad,
          scaleFactor: 1.4,
        ).kind,
        const InteractionEvent.pinch(
          phase: GesturePhase.start,
          focalPoint: Point2D.zero,
          rotationDelta: 0.2,
        ).kind,
        const InteractionEvent.wheel(
          position: Point2D.zero,
          scrollDelta: Point2D.zero,
        ).kind,
        const InteractionEvent.shortcut(
          shortcut: InteractionShortcut.zoomIn,
        ).kind,
      };
      expect(kinds, GestureKind.values.toSet());
    });
  });

  group('selection behaviour', () {
    test('modifier policy: primary toggles, shift adds, bare replaces', () {
      expect(
        SelectionMode.forModifiers(const KeyModifiers(control: true)),
        SelectionMode.toggle,
      );
      expect(
        SelectionMode.forModifiers(const KeyModifiers(meta: true)),
        SelectionMode.toggle,
      );
      expect(
        SelectionMode.forModifiers(const KeyModifiers(shift: true)),
        SelectionMode.add,
      );
      expect(
        SelectionMode.forModifiers(KeyModifiers.none),
        SelectionMode.replace,
      );
    });

    test('select modes compose immutably', () {
      var selection = SelectionState.empty.select('a');
      expect(selection.selectedIds, {'a'});

      selection = selection.select('b', mode: SelectionMode.add);
      expect(selection.selectedIds, {'a', 'b'});

      selection = selection.select('a', mode: SelectionMode.toggle);
      expect(selection.selectedIds, {'b'});

      selection = selection.select('c');
      expect(selection.selectedIds, {'c'}, reason: 'replace drops the rest');

      expect(selection.cleared().isEmpty, isTrue);
      expect(SelectionState.empty.selectAll(['x', 'y']).count, 2);
    });

    test('json round trip', () {
      final selection = SelectionState.empty.selectAll(['n1', 'n2']);
      expect(SelectionState.fromJson(selection.toJson()), selection);
    });
  });

  group('interaction event json', () {
    test('sealed events round-trip losslessly', () {
      const events = <InteractionEvent>[
        InteractionEvent.doubleTap(position: Point2D(x: 1, y: 2)),
        InteractionEvent.pinch(
          phase: GesturePhase.update,
          focalPoint: Point2D(x: 3, y: 4),
          scaleFactor: 1.5,
          rotationDelta: 0.1,
          device: InputDevice.trackpad,
        ),
        InteractionEvent.wheel(
          position: Point2D(x: 5, y: 6),
          scrollDelta: Point2D(x: 0, y: -120),
          modifiers: KeyModifiers(control: true),
        ),
        InteractionEvent.shortcut(shortcut: InteractionShortcut.fitScreen),
      ];
      for (final event in events) {
        expect(InteractionEvent.fromJson(event.toJson()), event);
      }
    });
  });
}
