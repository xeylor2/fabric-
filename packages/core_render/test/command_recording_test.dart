import 'package:core_canvas/core_canvas.dart';
import 'package:core_document/core_document.dart';
import 'package:core_interaction/core_interaction.dart';
import 'package:core_layer/core_layer.dart';
import 'package:core_render/core_render.dart';
import 'package:core_textile/core_textile.dart';
import 'package:test/test.dart';

// ---------------------------------------------------------------- fixtures
DesignNode _element(String id, {Map<String, Object?> meta = const {}}) =>
    DesignNode(
      id: id,
      name: id,
      type: DesignNodeType.element,
      metadata: {
        'render_bounds': [0, 0, 10, 10],
        ...meta,
      },
    );

DesignNode _tree() => DesignNode(
  id: 'artwork',
  name: 'Artwork',
  type: DesignNodeType.artwork,
  children: [
    _element('motif-a', meta: {'render_object_kind': 'motif'}),
    _element('motif-b', meta: {'render_object_kind': 'motif'}),
  ],
);

FebricDocument _doc(DesignNode tree) {
  final now = DateTime.utc(2026);
  return FebricDocument(
    id: const DocumentId('doc-1'),
    projectId: const ProjectId('proj-1'),
    manifest: const DocumentManifest(
      version: DocumentVersion(schema: 1, generator: 'test'),
    ),
    metadata: DocumentMetadata(title: 'T', createdAt: now, modifiedAt: now),
    artboards: [
      Artboard(
        id: 'ab-1',
        name: 'AB',
        size: const Size2D(width: 100, height: 100),
        layerRoot: const LayerModel(
          id: 'root',
          name: 'root',
          kind: LayerKind.group,
        ),
        designTreeRoot: tree,
      ),
    ],
  );
}

RenderTarget _target() => const RenderTarget(kind: RenderTargetKind.editor);

ViewportState _viewport() => const ViewportState(
  canvasSize: Size2D(width: 100, height: 100),
  screenSize: Size2D(width: 100, height: 100),
);

RenderObject _obj(
  String id, {
  FebricBlendMode blend = FebricBlendMode.normal,
  double opacity = 1.0,
  String? assetId,
  String? maskId,
}) => RenderObject(
  id: id,
  kind: RenderObjectKind.motif,
  source: assetId == null
      ? CanvasReference(kind: CanvasReferenceKind.designNode, refId: id)
      : CanvasReference(kind: CanvasReferenceKind.asset, refId: assetId),
  bounds: const Rect2D(left: 0, top: 0, width: 10, height: 10),
  blend: blend,
  opacity: opacity,
  maskId: maskId,
);

void main() {
  final ctx = RenderContext(viewport: _viewport());

  group('Command recording — determinism & backend-independence', () {
    test('identical inputs produce byte-identical command buffers', () {
      final rt = CommandRecordingRuntime();
      final a = rt.record(_doc(_tree()), _target(), _viewport());
      final b = rt.record(_doc(_tree()), _target(), _viewport());
      expect(a.commands.toJson(), b.commands.toJson());
      expect(a.commands, b.commands);
    });

    test('command buffer is JSON round-trippable (immutable stream)', () {
      final rt = CommandRecordingRuntime();
      final buf = rt.record(_doc(_tree()), _target(), _viewport()).commands;
      expect(CommandBuffer.fromJson(buf.toJson()), buf);
    });

    test('records a well-formed frame/pass envelope in frozen order', () {
      final rt = CommandRecordingRuntime();
      final buf = rt.record(_doc(_tree()), _target(), _viewport()).commands;
      final kinds = buf.commands.map((c) => c.kind).toList();
      expect(kinds.first, RenderCommandKind.beginFrame);
      expect(kinds.last, RenderCommandKind.endFrame);
      expect(kinds, contains(RenderCommandKind.beginRenderTarget));
      expect(kinds, contains(RenderCommandKind.composite));
      // every beginPass has a matching endPass
      expect(
        buf.ofKind(RenderCommandKind.beginPass).length,
        buf.ofKind(RenderCommandKind.endPass).length,
      );
      // one draw per visible object (artwork group node + its 2 elements)
      expect(buf.drawCount, 3);
    });
  });

  group('Render state tracking (deterministic minimization)', () {
    test('no set_render_state for identity state; one when blend changes', () {
      final backend = RecordingRenderBackend();
      const pass = RenderPass(kind: RenderPassKind.motif);
      // First object at identity → no state command.
      backend.record(pass, ctx, [_obj('a')]);
      // Second object multiply → exactly one state command.
      backend.record(pass, ctx, [_obj('b', blend: FebricBlendMode.multiply)]);
      final buf = backend.build();
      // beginPass resets to identity each record() call, so 'a' emits none,
      // and the multiply object emits exactly one.
      expect(buf.ofKind(RenderCommandKind.setRenderState).length, 1);
    });

    test('repeated identical state does not re-emit', () {
      final backend = RecordingRenderBackend();
      const pass = RenderPass(kind: RenderPassKind.motif);
      backend.record(pass, ctx, [
        _obj('a', blend: FebricBlendMode.multiply),
        _obj('b', blend: FebricBlendMode.multiply),
        _obj('c', blend: FebricBlendMode.multiply),
      ]);
      // First object sets multiply; the next two match → only one state cmd.
      expect(
        backend.build().ofKind(RenderCommandKind.setRenderState).length,
        1,
      );
    });
  });

  group('Resource binding (content-addressed, deduped per pass)', () {
    test('asset-referencing objects bind once per pass', () {
      final backend = RecordingRenderBackend();
      const pass = RenderPass(kind: RenderPassKind.motif);
      backend.record(pass, ctx, [
        _obj('a', assetId: 'sha256:AAA'),
        _obj('b', assetId: 'sha256:AAA'), // same asset → deduped
        _obj('c', assetId: 'sha256:BBB'),
      ]);
      final binds = backend.build().ofKind(RenderCommandKind.bindResource);
      expect(binds.length, 2); // AAA + BBB, AAA not re-bound
    });

    test('mask reference records a bind', () {
      final backend = RecordingRenderBackend();
      const pass = RenderPass(kind: RenderPassKind.motif);
      backend.record(pass, ctx, [_obj('a', maskId: 'm1')]);
      expect(backend.build().ofKind(RenderCommandKind.bindResource).length, 1);
    });
  });

  group('Backend capability runtime (§B — data, no leakage)', () {
    test('unsupported blend falls back to normal deterministically', () {
      // A backend that supports only "normal".
      const caps = BackendCapabilities(blendModes: {FebricBlendMode.normal});
      const rt = BackendCapabilityRuntime(caps);
      expect(rt.resolveBlend(FebricBlendMode.multiply), FebricBlendMode.normal);
      expect(rt.resolveBlend(FebricBlendMode.normal), FebricBlendMode.normal);
    });

    test('empty blend set = permissive (records the requested blend)', () {
      const rt = BackendCapabilityRuntime(
        RecordingRenderBackend.defaultCapabilities,
      );
      expect(
        rt.resolveBlend(FebricBlendMode.multiply),
        FebricBlendMode.multiply,
      );
    });
  });

  group('Read-only rendering (R1) & session integration', () {
    test('recording never mutates the document', () {
      final doc = _doc(_tree());
      final before = doc.toJson();
      CommandRecordingRuntime().record(doc, _target(), _viewport());
      expect(doc.toJson(), before);
    });

    test('RecordingRenderSession implements the frozen HitTestContract', () {
      final rt = CommandRecordingRuntime();
      final target = _target();
      final result = rt.record(_doc(_tree()), target, _viewport());
      final context = const RenderContextRuntime().contextFor(
        target,
        _viewport(),
      );
      final session = RecordingRenderSession(
        target: target,
        context: context,
        commands: result.commands,
        hitTester: HeadlessRenderSession(
          target: target,
          context: context,
          graph: result.graph,
        ),
      );
      expect(session, isA<RenderSession>());
      // hit-test delegates to the headless session (topmost node or miss).
      final hit = session.hitTest(
        const HitTestQuery(screenPoint: Point2D(x: 5, y: 5)),
      );
      expect(hit, isA<HitTestResult>());
    });
  });
}
