import 'package:core_canvas/core_canvas.dart';
import 'package:core_interaction/core_interaction.dart';
import 'package:core_performance/core_performance.dart';
import 'package:core_textile/core_textile.dart';
import 'package:core_tooling/core_tooling.dart';
import 'package:test/test.dart';

ViewportState _viewport() => const ViewportState(
  canvasSize: Size2D(width: 400, height: 400),
  screenSize: Size2D(width: 800, height: 600),
);

/// Compile-time proof that [CanvasRuntimeContract] is complete and
/// implementable (interface freeze: adding a member breaks this test's
/// compilation — by design). Pure test double; no rendering, no business
/// logic.
final class _ProbeRuntime implements CanvasRuntimeContract {
  _ProbeRuntime()
    : _state = CanvasRuntimeState(
        camera: NavigationState(viewport: _viewport()),
      );

  CanvasRuntimeState _state;
  var _selection = const SelectionState();

  @override
  CanvasRuntimeState get state => _state;

  @override
  ViewportState get viewport => _state.viewport;

  @override
  CanvasCoordinateSystem get coordinateSystem => _state.coordinateSystem;

  @override
  SelectionState get selection => _selection;

  @override
  List<CanvasReference> get references => _state.references;

  @override
  OverlayStack get overlays => _state.overlays;

  @override
  void handleInput(InteractionEvent event) {
    // A conforming runtime routes input through hit-testing to selection;
    // the probe records that the pipeline reached selection.
    _selection = _selection.copyWith(selectedIds: {'node-1'});
  }

  @override
  void applyZoomCommand(ZoomCommand command) {
    _state = _state.copyWith(
      camera: _state.camera.copyWith(
        viewport: _state.viewport.copyWith(zoom: 2),
      ),
    );
  }

  @override
  void contribute(OverlayModel overlay) {
    _state = _state.copyWith(overlays: _state.overlays.contribute(overlay));
  }

  @override
  void withdraw(String overlayId) {
    _state = _state.copyWith(overlays: _state.overlays.withdraw(overlayId));
  }

  @override
  HitTestResult hitTest(HitTestQuery query) => HitTestResult(
    kind: HitTargetKind.node,
    documentPoint: query.screenPoint,
    semanticNodeId: 'node-1',
    nodeType: DesignNodeType.zone,
  );

  @override
  List<String> hitTestRegion(Rect2D region) => const ['node-1'];
}

void main() {
  group('Model JSON round-trips', () {
    test('CanvasReference', () {
      const ref = CanvasReference(
        kind: CanvasReferenceKind.asset,
        refId: 'asset-9',
      );
      expect(CanvasReference.fromJson(ref.toJson()), ref);
    });

    test('HitTestResult (node hit + miss)', () {
      const hit = HitTestResult(
        kind: HitTargetKind.node,
        documentPoint: Point2D(x: 12, y: 8),
        semanticNodeId: 'n-1',
        nodeType: DesignNodeType.zone,
      );
      expect(HitTestResult.fromJson(hit.toJson()), hit);
      expect(hit.isNodeHit, isTrue);

      final miss = HitTestResult.miss(const Point2D(x: 1, y: 1));
      expect(HitTestResult.fromJson(miss.toJson()), miss);
      expect(miss.isNodeHit, isFalse);
    });

    test('OverlayModel + OverlayStack (contribute/withdraw/ofKind)', () {
      const a = OverlayModel(id: 'o1', kind: OverlayKind.selection, order: 1);
      const b = OverlayModel(id: 'o2', kind: OverlayKind.hover, order: 0);
      final stack = OverlayStack.empty.contribute(a).contribute(b);
      // Sorted by order: hover(0) before selection(1).
      expect(stack.entries.map((e) => e.id), ['o2', 'o1']);
      expect(stack.ofKind(OverlayKind.selection), [a]);
      expect(stack.withdraw('o1').entries.map((e) => e.id), ['o2']);
      expect(OverlayStack.fromJson(stack.toJson()), stack);
    });

    test('RulerSpec', () {
      const ruler = RulerSpec(visible: true, majorInterval: 25);
      expect(RulerSpec.fromJson(ruler.toJson()), ruler);
    });

    test('PrintRegionSpec + CanvasInsets (insetsOf/uniform)', () {
      final spec = PrintRegionSpec(
        safeArea: CanvasInsets.uniform(5),
        bleed: const CanvasInsets(left: 3, top: 3, right: 3, bottom: 3),
      );
      expect(PrintRegionSpec.fromJson(spec.toJson()), spec);
      expect(spec.insetsOf(PrintRegionKind.safeArea).left, 5);
      expect(spec.insetsOf(PrintRegionKind.printMargin).isZero, isTrue);
    });

    test(
      'CanvasPerformanceStrategy composes frozen core_performance specs',
      () {
        const strategy = CanvasPerformanceStrategy.standard;
        // Composition — the frozen specs are reused, not redefined.
        expect(strategy.tiles, TileSpec.standard);
        expect(strategy.largeDocument, LargeDocumentPolicy.standard);
        expect(strategy.infiniteCanvas, isTrue);
        expect(strategy.objectCulling, isTrue);
        expect(CanvasPerformanceStrategy.fromJson(strategy.toJson()), strategy);
      },
    );

    test('CanvasRuntimeState round-trips and shares one viewport', () {
      final s = CanvasRuntimeState(
        camera: NavigationState(viewport: _viewport()),
      );
      // The runtime viewport IS the camera viewport (single source of truth).
      expect(identical(s.viewport, s.camera.viewport), isTrue);
      expect(CanvasRuntimeState.fromJson(s.toJson()), s);
    });
  });

  group('CanvasRuntimeContract implementability', () {
    test(
      'a conforming runtime routes input, hit-tests nodes, owns overlays',
      () {
        final rt = _ProbeRuntime();

        // Universal input pipeline → selection.
        expect(rt.selection.selectedIds, isEmpty);
        rt.handleInput(
          const InteractionEvent.tap(position: Point2D(x: 5, y: 5)),
        );
        expect(rt.selection.selectedIds, {'node-1'});

        // One shared viewport, mutated only through commands.
        expect(rt.viewport.zoom, 1.0);
        rt.applyZoomCommand(ZoomCommand.zoomIn);
        expect(rt.viewport.zoom, 2.0);

        // Hit testing resolves a semantic node.
        final hit = rt.hitTest(
          const HitTestQuery(screenPoint: Point2D(x: 5, y: 5)),
        );
        expect(hit.isNodeHit, isTrue);
        expect(hit.semanticNodeId, 'node-1');
        expect(
          rt.hitTestRegion(const Rect2D(left: 0, top: 0, width: 9, height: 9)),
          ['node-1'],
        );

        // Canvas owns overlays; tools contribute.
        rt.contribute(
          const OverlayModel(id: 'sel', kind: OverlayKind.selection),
        );
        expect(rt.overlays.ofKind(OverlayKind.selection), hasLength(1));
        rt.withdraw('sel');
        expect(rt.overlays.entries, isEmpty);
      },
    );
  });

  group('M5A pre-freeze verifications', () {
    test(
      '1. viewport state survives serialize→restore for session restore',
      () {
        // A non-default camera: custom zoom/offset/rotation/DPR/sizes + a
        // previous view in history — the full session-restore payload.
        final camera = NavigationState(
          viewport: const ViewportState(
            canvasSize: Size2D(width: 640, height: 480),
            screenSize: Size2D(width: 1920, height: 1080),
            zoom: 2.5,
            offset: Point2D(x: 120, y: -40),
            rotation: 0.3,
            devicePixelRatio: 2,
          ),
          history: [_viewport()],
          maxHistory: 16,
        );
        final state = CanvasRuntimeState(camera: camera);

        final restored = CanvasRuntimeState.fromJson(state.toJson());

        // Whole-state fidelity, and every viewport field explicitly.
        expect(restored, state);
        expect(restored.viewport.zoom, 2.5);
        expect(restored.viewport.offset, const Point2D(x: 120, y: -40));
        expect(restored.viewport.rotation, 0.3);
        expect(restored.viewport.devicePixelRatio, 2);
        expect(
          restored.viewport.canvasSize,
          const Size2D(width: 640, height: 480),
        );
        expect(restored.camera.history, hasLength(1));
      },
    );

    test(
      '2. overlay paint order is deterministic and contribution-independent',
      () {
        const back = OverlayModel(id: 'b', kind: OverlayKind.grid, order: 0);
        const midA = OverlayModel(id: 'a', kind: OverlayKind.hover, order: 5);
        const midZ = OverlayModel(
          id: 'z',
          kind: OverlayKind.selection,
          order: 5,
        );
        const front = OverlayModel(
          id: 'c',
          kind: OverlayKind.aiPreview,
          order: 9,
        );

        // Two different contribution sequences → identical paint order.
        final s1 = OverlayStack.empty
            .contribute(front)
            .contribute(midZ)
            .contribute(back)
            .contribute(midA);
        final s2 = OverlayStack.empty
            .contribute(midA)
            .contribute(back)
            .contribute(front)
            .contribute(midZ);

        // Ascending order; ties (a & z at order 5) broken by ascending id.
        const expectedIds = ['b', 'a', 'z', 'c'];
        expect(s1.entries.map((e) => e.id), expectedIds);
        expect(s2.entries.map((e) => e.id), expectedIds);
        expect(s1, s2);
        // Restore reproduces identical order.
        expect(
          OverlayStack.fromJson(s1.toJson()).entries.map((e) => e.id),
          expectedIds,
        );
      },
    );

    test('3. print regions convert mm ↔ inch ↔ pixel with explicit DPI', () {
      final spec = PrintRegionSpec(
        safeArea: CanvasInsets.uniform(25.4), // 1 inch in mm
        bleed: const CanvasInsets(left: 3, top: 3, right: 3, bottom: 3),
        // unit defaults to millimetre (physical-unit-first).
      );

      // mm → inch (DPI-independent).
      expect(
        spec.insetsIn(PrintRegionKind.safeArea, MeasurementUnit.inch).left,
        closeTo(1.0, 1e-9),
      );
      // mm → pixel at 300 DPI: 25.4 mm = 1 in = 300 px.
      expect(
        spec
            .insetsIn(
              PrintRegionKind.safeArea,
              MeasurementUnit.pixel,
              dotsPerInch: 300,
            )
            .top,
        closeTo(300.0, 1e-9),
      );
      // Same physical size, 72 DPI → 72 px.
      expect(
        spec
            .insetsIn(
              PrintRegionKind.safeArea,
              MeasurementUnit.pixel,
              dotsPerInch: 72,
            )
            .right,
        closeTo(72.0, 1e-9),
      );
      // Authored unit is preserved; conversion is non-destructive.
      expect(spec.unit, MeasurementUnit.millimetre);
      expect(spec.insetsOf(PrintRegionKind.bleed).left, 3);
    });

    test(
      '3b. conversion is lossless at rest, identity- and round-trip-exact',
      () {
        final spec = PrintRegionSpec(safeArea: CanvasInsets.uniform(25.4));

        // Lossless at rest: converting many times never mutates the source.
        spec.insetsIn(PrintRegionKind.safeArea, MeasurementUnit.pixel);
        spec.insetsIn(PrintRegionKind.safeArea, MeasurementUnit.inch);
        spec.insetsIn(PrintRegionKind.safeArea, MeasurementUnit.centimetre);
        expect(spec.insetsOf(PrintRegionKind.safeArea).left, 25.4);
        expect(spec.unit, MeasurementUnit.millimetre);

        final safe = spec.insetsOf(PrintRegionKind.safeArea);

        // Identity conversion is exact (short-circuit).
        expect(
          safe.convert(
            from: MeasurementUnit.millimetre,
            to: MeasurementUnit.millimetre,
          ),
          safe,
        );

        // Commensurable round-trips are exact (not closeTo): mm→in→mm,
        // mm→px→mm at 300 and 72 DPI.
        final inch = safe.convert(
          from: MeasurementUnit.millimetre,
          to: MeasurementUnit.inch,
        );
        expect(inch.left, 1.0);
        expect(
          inch
              .convert(
                from: MeasurementUnit.inch,
                to: MeasurementUnit.millimetre,
              )
              .left,
          25.4,
        );
        for (final dpi in [300.0, 72.0]) {
          final px = safe.convert(
            from: MeasurementUnit.millimetre,
            to: MeasurementUnit.pixel,
            dotsPerInch: dpi,
          );
          // 25.4 mm = 1 in = dpi px, exactly (identity pivot 25.4/25.4 == 1.0).
          expect(px.left, dpi);
          expect(
            px
                .convert(
                  from: MeasurementUnit.pixel,
                  to: MeasurementUnit.millimetre,
                  dotsPerInch: dpi,
                )
                .left,
            25.4,
          );
        }
      },
    );
  });
}
