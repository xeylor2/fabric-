import 'package:core_asset/core_asset.dart';
import 'package:core_canvas/core_canvas.dart';
import 'package:core_document/core_document.dart';
import 'package:core_interaction/core_interaction.dart';
import 'package:core_layer/core_layer.dart';
import 'package:core_performance/core_performance.dart';
import 'package:core_render/core_render.dart';
import 'package:core_textile/core_textile.dart';
import 'package:test/test.dart';

const _viewport = ViewportState(
  canvasSize: Size2D(width: 400, height: 400),
  screenSize: Size2D(width: 800, height: 600),
);

RenderTarget _editorTarget() => const RenderTarget(
  kind: RenderTargetKind.editor,
  passes: [RenderPassKind.base, RenderPassKind.motif],
);

RenderObject _motif() => const RenderObject(
  id: 'ro-1',
  kind: RenderObjectKind.motif,
  source: CanvasReference(kind: CanvasReferenceKind.asset, refId: 'sha256:ab'),
  bounds: Rect2D(left: 0, top: 0, width: 32, height: 32),
  blend: FebricBlendMode.multiply,
  order: 2,
);

// ---- contract-implementability probes (no rendering; interface freeze) ----

final class _ProbeProducer implements RenderObjectProducer {
  @override
  DesignNodeType get nodeType => DesignNodeType.zone;
  @override
  List<RenderObject> produce(DesignNode node) => const [];
}

final class _ProbeBackend implements RenderBackend {
  @override
  BackendCapabilities get capabilities => const BackendCapabilities();
  @override
  void record(RenderPass pass, RenderContext context, List<RenderObject> o) {}
  @override
  void composite(RenderContext context) {}
  @override
  void present(RenderContext context) {}
}

final class _ProbeSession implements RenderSession {
  @override
  RenderTarget get target => _editorTarget();
  @override
  RenderContext get context => const RenderContext(viewport: _viewport);
  @override
  HitTestResult hitTest(HitTestQuery query) =>
      HitTestResult.miss(query.screenPoint);
  @override
  List<String> hitTestRegion(Rect2D region) => const [];
}

final class _ProbeSink implements RenderMetricsSink {
  RenderMetrics? last;
  @override
  void onFrameMetrics(RenderMetrics metrics) => last = metrics;
}

void main() {
  group('Model JSON round-trips', () {
    test('FrameBudget (+ phase/uncapped invariants)', () {
      const b = FrameBudget.interactive;
      expect(FrameBudget.fromJson(b.toJson()), b);
      expect(b.phasesWithinFrame, isTrue);
      expect(b.isUncapped, isFalse);
      expect(FrameBudget.throughput.isUncapped, isTrue);
      expect(FrameBudget.throughput.phasesWithinFrame, isTrue);
    });

    test('BackendCapabilities (features/blends/limits)', () {
      const caps = BackendCapabilities(
        features: {
          BackendCapabilityKind.offscreenTargets,
          BackendCapabilityKind.colourManagedOutput,
        },
        blendModes: {FebricBlendMode.normal, FebricBlendMode.multiply},
        determinism: RenderDeterminismLevel.backendExact,
      );
      expect(BackendCapabilities.fromJson(caps.toJson()), caps);
      expect(caps.supports(BackendCapabilityKind.offscreenTargets), isTrue);
      expect(caps.supports(BackendCapabilityKind.floatTextures), isFalse);
      expect(caps.supportsBlend(FebricBlendMode.multiply), isTrue);
    });

    test('RenderTarget', () {
      final t = _editorTarget();
      expect(RenderTarget.fromJson(t.toJson()), t);
    });

    test('RenderObject (references only)', () {
      final o = _motif();
      expect(RenderObject.fromJson(o.toJson()), o);
      expect(o.source.kind, CanvasReferenceKind.asset);
    });

    test('RenderPass', () {
      const p = RenderPass(
        kind: RenderPassKind.motif,
        slot: 2,
        objectFilter: [RenderObjectKind.motif],
      );
      expect(RenderPass.fromJson(p.toJson()), p);
    });

    test('RenderWorkItem', () {
      const w = RenderWorkItem(
        key: 'tile:0:0:0',
        kind: RenderWorkItemKind.tileRender,
        priority: WorkerPriority.interactive,
        tile: TileCoordinate(level: 0, x: 0, y: 0),
      );
      expect(RenderWorkItem.fromJson(w.toJson()), w);
    });

    test('ResourceKey / ResourceHandle', () {
      const k = ResourceKey(kind: ResourceKind.texture, key: 'sha256:ab');
      const h = ResourceHandle(resourceKey: k, handleId: 'h-1', refCount: 2);
      expect(ResourceKey.fromJson(k.toJson()), k);
      expect(ResourceHandle.fromJson(h.toJson()), h);
    });

    test('RenderContext (composes frozen viewport/tiles/cache/colour)', () {
      const ctx = RenderContext(
        viewport: _viewport,
        tiles: TileSpec.standard,
        cacheBudget: CacheBudget(tier: CacheTier.texture, maxBytes: 1024),
        colourSpace: AssetColourSpace.cmyk,
        frameId: 7,
      );
      expect(RenderContext.fromJson(ctx.toJson()), ctx);
    });

    test('RenderGraph (+ deterministic draw order)', () {
      final g = RenderGraph(
        revision: const RevisionId(3),
        target: _editorTarget(),
        objects: [_motif()],
      );
      expect(RenderGraph.fromJson(g.toJson()), g);

      // Total order: by order, ties by id — registration-independent.
      const a = RenderObject(
        id: 'a',
        kind: RenderObjectKind.colourFill,
        source: CanvasReference(kind: CanvasReferenceKind.layer, refId: 'l'),
        bounds: Rect2D(left: 0, top: 0, width: 1, height: 1),
        order: 5,
      );
      const z = RenderObject(
        id: 'z',
        kind: RenderObjectKind.colourFill,
        source: CanvasReference(kind: CanvasReferenceKind.layer, refId: 'l'),
        bounds: Rect2D(left: 0, top: 0, width: 1, height: 1),
        order: 5,
      );
      expect(RenderGraph.drawOrder(a, z), lessThan(0));
      expect(RenderGraph.drawOrder(z, a), greaterThan(0));
    });

    test('RenderMetrics (deterministic-metric read/write)', () {
      final m = const RenderMetrics(frameId: 1)
          .withMetric(RenderMetricKind.visibleObjects, 12)
          .withMetric(RenderMetricKind.drawCalls, 30);
      expect(RenderMetrics.fromJson(m.toJson()), m);
      expect(m.valueOf(RenderMetricKind.visibleObjects), 12);
      expect(m.valueOf(RenderMetricKind.frameTime), isNull);
    });

    test('ReproducibilityRecord (export provenance)', () {
      final r = ReproducibilityRecord(
        revision: const RevisionId(9),
        target: const RenderTarget(
          kind: RenderTargetKind.productionExport,
          colourSpace: AssetColourSpace.cmyk,
          onScreen: false,
          fullResolution: true,
        ),
        backendId: 'headless-1',
        determinismLevel: RenderDeterminismLevel.backendExact.wireName,
      );
      expect(ReproducibilityRecord.fromJson(r.toJson()), r);
    });
  });

  group('Contract implementability (interface freeze; no rendering)', () {
    test('RenderObjectProducer', () {
      final p = _ProbeProducer();
      expect(p.nodeType, DesignNodeType.zone);
      expect(
        p.produce(
          const DesignNode(id: 'n', name: 'z', type: DesignNodeType.zone),
        ),
        isEmpty,
      );
    });

    test('RenderBackend exposes capabilities as data (no leakage)', () {
      final b = _ProbeBackend();
      expect(b.capabilities, isA<BackendCapabilities>());
    });

    test('RenderSession implements the frozen HitTestContract', () {
      final s = _ProbeSession();
      expect(s, isA<HitTestContract>());
      expect(
        s
            .hitTest(const HitTestQuery(screenPoint: Point2D(x: 1, y: 1)))
            .isNodeHit,
        isFalse,
      );
      expect(s.target.kind, RenderTargetKind.editor);
    });

    test('RenderMetricsSink observes without side effects', () {
      final sink = _ProbeSink();
      const m = RenderMetrics(frameId: 2);
      sink.onFrameMetrics(m);
      expect(sink.last, m);
    });
  });
}
