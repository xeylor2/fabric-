import 'package:core_canvas/core_canvas.dart';
import 'package:core_document/core_document.dart';
import 'package:core_interaction/core_interaction.dart';
import 'package:core_layer/core_layer.dart';
import 'package:core_performance/core_performance.dart';
import 'package:core_render/core_render.dart';
import 'package:core_textile/core_textile.dart';
import 'package:test/test.dart';

// ---------------------------------------------------------------------------
// Fixtures — a tiny artwork tree with explicit render bounds via metadata.
// ---------------------------------------------------------------------------

DesignNode _element(String id, List<double> bounds) => DesignNode(
  id: id,
  name: id,
  type: DesignNodeType.element,
  metadata: {'render_bounds': bounds},
);

DesignNode _tree({bool motifVisible = true}) => DesignNode(
  id: 'artwork',
  name: 'Artwork',
  type: DesignNodeType.artwork,
  metadata: const {
    'render_bounds': <double>[0, 0, 10, 10],
  },
  children: [
    _element('base', const [0, 0, 100, 100]),
    _element('motif', const [10, 10, 20, 20]).copyWith(visible: motifVisible),
    _element('border', const [900, 900, 20, 20]), // far away → cullable
  ],
);

FebricDocument _doc(DesignNode tree, {int revision = 1}) => FebricDocument(
  id: const DocumentId('doc-1'),
  projectId: const ProjectId('proj-1'),
  revision: RevisionId(revision),
  manifest: const DocumentManifest(
    version: DocumentVersion(schema: 1, generator: 'test'),
  ),
  metadata: DocumentMetadata(
    title: 'T',
    createdAt: DateTime.utc(2026),
    modifiedAt: DateTime.utc(2026),
  ),
  artboards: [
    Artboard(
      id: 'ab-1',
      name: 'AB',
      size: const Size2D(width: 1000, height: 1000),
      layerRoot: const LayerModel(id: 'l', name: 'root', kind: LayerKind.layer),
      designTreeRoot: tree,
    ),
  ],
);

RenderTarget _target() => const RenderTarget(kind: RenderTargetKind.editor);

// A viewport whose visible rect covers the near objects but not the far one.
const _ctx = RenderContext(
  viewport: ViewportState(
    canvasSize: Size2D(width: 200, height: 200),
    screenSize: Size2D(width: 200, height: 200),
  ),
);

void main() {
  group('Render Graph Compiler', () {
    test('walks the tree in document order (= z-order), references only', () {
      final graph = RenderGraphCompiler().compile(_doc(_tree()), _target());
      // artwork, base, motif, border → 4 objects, order 0..3.
      expect(graph.objects.map((o) => o.source.refId), [
        'artwork',
        'base',
        'motif',
        'border',
      ]);
      expect(graph.objects.map((o) => o.order), [0, 1, 2, 3]);
      // Every object references a design node by id — never owned data (R2).
      for (final o in graph.objects) {
        expect(o.source.kind, CanvasReferenceKind.designNode);
      }
    });

    test('hidden node (and subtree) renders nowhere', () {
      final graph = RenderGraphCompiler().compile(
        _doc(_tree(motifVisible: false)),
        _target(),
      );
      expect(
        graph.objects.map((o) => o.source.refId),
        isNot(contains('motif')),
      );
    });

    test('is deterministic — identical inputs yield identical graphs', () {
      final a = RenderGraphCompiler().compile(_doc(_tree()), _target());
      final b = RenderGraphCompiler().compile(_doc(_tree()), _target());
      expect(a, b); // freezed value equality over the whole graph
      expect(a.toJson(), b.toJson());
    });
  });

  group('Incremental rebuild (incremental == full)', () {
    test('recompile equals a full compile of the same revision', () {
      final compiler = RenderGraphCompiler();
      final v1 = _doc(_tree());
      final full1 = compiler.compile(v1, _target());

      // Change only the motif's bounds; new revision.
      final changedTree = _tree().copyWith(
        children: [
          _element('base', const [0, 0, 100, 100]),
          _element('motif', const [10, 10, 40, 40]), // changed
          _element('border', const [900, 900, 20, 20]),
        ],
      );
      final v2 = _doc(changedTree, revision: 2);

      final incremental = compiler.recompile(full1, v2, {'motif'});
      final incrementalProduce = compiler.lastProduceCount;
      final full2 = compiler.compile(v2, _target());

      // Byte-identical result.
      expect(incremental, full2);
      expect(incremental.toJson(), full2.toJson());
      // ...but incremental only produced the damaged node (3 of 4 reused).
      expect(incrementalProduce, 1);
      expect(compiler.lastProduceCount, 4); // the full compile produced all
    });

    test('dirty region = only the damaged objects + their tiles', () {
      final compiler = RenderGraphCompiler();
      final graph = compiler.compile(_doc(_tree()), _target());
      final dirty = const DirtyRegionProcessor().compute(graph, {'motif'});
      expect(dirty.objects.map((o) => o.source.refId), ['motif']);
      expect(dirty.tileKeys, isNotEmpty);
      expect(dirty.tileCount, dirty.tileKeys.length);
    });
  });

  group('Culling runtime', () {
    test(
      'returns only objects intersecting the visible rect, in draw order',
      () {
        final graph = RenderGraphCompiler().compile(_doc(_tree()), _target());
        final visible = const CullServiceImpl().cull(
          graph,
          _ctx.viewport.visibleRect,
        );
        final ids = visible.map((o) => o.source.refId);
        expect(ids, contains('motif'));
        expect(ids, isNot(contains('border'))); // far away → culled
        // Draw order preserved (ascending order field).
        final orders = visible.map((o) => o.order).toList();
        expect(orders, orders.toList()..sort());
      },
    );
  });

  group('Render Queue + Scheduler (deterministic, order-independent)', () {
    test('coalesces by key and drains by priority then key', () {
      final q = RenderQueueImpl();
      q.enqueue(
        const RenderWorkItem(
          key: 'b',
          kind: RenderWorkItemKind.tileRender,
          priority: WorkerPriority.normal,
        ),
      );
      q.enqueue(
        const RenderWorkItem(
          key: 'a',
          kind: RenderWorkItemKind.tileRender,
          priority: WorkerPriority.interactive,
        ),
      );
      q.enqueue(
        const RenderWorkItem(
          // supersedes the first 'b'
          key: 'b',
          kind: RenderWorkItemKind.present,
          priority: WorkerPriority.interactive,
        ),
      );
      final drained = q.drain();
      // interactive first (a, b by key), coalesced b is present-kind.
      expect(drained.map((w) => w.key), ['a', 'b']);
      expect(
        drained.firstWhere((w) => w.key == 'b').kind,
        RenderWorkItemKind.present,
      );
    });

    test('scheduler dispatch order is independent of submission order', () {
      RenderSchedulerImpl build(List<String> order) {
        final s = RenderSchedulerImpl();
        for (final k in order) {
          s.submit(
            RenderWorkItem(
              key: k,
              kind: RenderWorkItemKind.tileRender,
              priority: WorkerPriority.normal,
            ),
          );
        }
        return s;
      }

      final a = build(['x', 'y', 'z']).dispatchOrder().map((w) => w.key);
      final b = build(['z', 'y', 'x']).dispatchOrder().map((w) => w.key);
      expect(a, b);
    });
  });

  group('Resource Registry (content-addressed dedup + ref counting)', () {
    test('same key dedups and ref-counts; release frees at zero', () {
      final r = ResourceRegistryImpl();
      const key = ResourceKey(kind: ResourceKind.texture, key: 'sha256:ab');
      final h1 = r.acquire(key);
      final h2 = r.acquire(key);
      expect(h1.handleId, h2.handleId); // same handle (dedup)
      expect(r.refCountOf(key), 2);
      r.release(key);
      expect(r.refCountOf(key), 1);
      r.release(key);
      expect(r.refCountOf(key), 0); // freed
    });
  });

  group('Frame Lifecycle (unskippable order)', () {
    test('advances through the frozen order and wraps end → idle', () {
      final fl = FrameLifecycleImpl();
      for (final s in RenderConstitution.frameStateOrder.skip(1)) {
        fl.advanceTo(s);
      }
      expect(fl.state, FrameLifecycleState.end);
      fl.advanceTo(FrameLifecycleState.idle); // legal wrap
      expect(fl.state, FrameLifecycleState.idle);
    });

    test('rejects an out-of-order transition', () {
      final fl = FrameLifecycleImpl();
      expect(() => fl.advanceTo(FrameLifecycleState.present), throwsStateError);
    });
  });

  group('Render Pipeline (frozen RenderPipeline contract)', () {
    test('runs the frozen stages and produces frame metrics', () {
      final backend = HeadlessRenderBackend();
      final pipeline = RenderPipelineImpl(
        cull: const CullServiceImpl(),
        passes: RenderPassExecutor(RenderPassRegistryImpl.standard()),
        backend: backend,
      );
      final graph = RenderGraphCompiler().compile(_doc(_tree()), _target());

      final outcome = pipeline.run(graph, _ctx, dirtyTileCount: 0);

      expect(outcome.visible.map((o) => o.source.refId), contains('motif'));
      expect(
        outcome.metrics.valueOf(RenderMetricKind.totalObjects),
        graph.objects.length,
      );
      expect(backend.composited, isTrue);
      expect(backend.presented, isTrue);
    });

    test('is a RenderPipeline; renderFrame runs without error (read-only)', () {
      final pipeline = RenderPipelineImpl(
        cull: const CullServiceImpl(),
        passes: RenderPassExecutor(RenderPassRegistryImpl.standard()),
        backend: HeadlessRenderBackend(),
      );
      expect(pipeline, isA<RenderPipeline>());
      final graph = RenderGraphCompiler().compile(_doc(_tree()), _target());
      pipeline.renderFrame(graph, _ctx); // frozen contract entry point
    });
  });

  group('Headless Renderer Service (read-only, deterministic frame)', () {
    test('renders a full frame; document is untouched (read-only, R1)', () {
      final doc = _doc(_tree());
      final before = doc.toJson();
      final result = HeadlessRenderer().renderFrame(doc, _target(), _ctx);

      expect(doc.toJson(), before); // no mutation
      expect(result.graph.objects, isNotEmpty);
      expect(result.visible.map((o) => o.source.refId), contains('motif'));
      expect(
        result.metrics.valueOf(RenderMetricKind.totalObjects),
        result.graph.objects.length,
      );
      expect(
        result.metrics.valueOf(RenderMetricKind.visibleObjects),
        result.visible.length,
      );
      // draw calls == visible objects (headless backend records structurally)
      expect(
        result.metrics.valueOf(RenderMetricKind.drawCalls),
        result.visible.length,
      );
    });

    test('two renders of the same inputs are byte-identical (§F, L1)', () {
      final r1 = HeadlessRenderer().renderFrame(_doc(_tree()), _target(), _ctx);
      final r2 = HeadlessRenderer().renderFrame(_doc(_tree()), _target(), _ctx);
      expect(r1.graph.toJson(), r2.graph.toJson());
      expect(r1.metrics.toJson(), r2.metrics.toJson());
    });

    test('incremental frame equals full frame render', () {
      final renderer = HeadlessRenderer();
      final v1 = _doc(_tree());
      final full1 = renderer.renderFrame(v1, _target(), _ctx);
      final v2 = _doc(_tree(), revision: 2);
      final incr = renderer.renderIncremental(full1.graph, v2, {}, _ctx);
      expect(
        incr.graph.objects.map((o) => o.source.refId),
        full1.graph.objects.map((o) => o.source.refId),
      );
    });

    test('backend recorded passes in the frozen pass order', () {
      final backend = HeadlessRenderBackend();
      HeadlessRenderer(
        backend: backend,
      ).renderFrame(_doc(_tree()), _target(), _ctx);
      // Recorded passes are a subsequence of the frozen order.
      const frozen = RenderConstitution.passOrder;
      var last = -1;
      for (final k in backend.recordedPasses) {
        final i = frozen.indexOf(k);
        expect(i, greaterThanOrEqualTo(last));
        last = i;
      }
      expect(backend.composited, isTrue);
      expect(backend.presented, isTrue);
    });
  });

  group('Headless Render Session (hit testing → semantic node)', () {
    test('resolves the topmost node whose bounds contain the point', () {
      final graph = RenderGraphCompiler().compile(_doc(_tree()), _target());
      final session = HeadlessRenderSession(
        target: _target(),
        context: _ctx,
        graph: graph,
      );
      // Point (15,15) is inside base (0..100) and motif (10..30); motif is
      // later in draw order → topmost.
      final hit = session.hitTest(
        const HitTestQuery(screenPoint: Point2D(x: 15, y: 15)),
      );
      expect(hit.isNodeHit, isTrue);
      expect(hit.semanticNodeId, 'motif');

      // A point in empty space misses.
      final miss = session.hitTest(
        const HitTestQuery(screenPoint: Point2D(x: 500, y: 500)),
      );
      expect(miss.isNodeHit, isFalse);
    });
  });
}
