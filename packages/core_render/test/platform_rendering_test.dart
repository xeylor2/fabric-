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

void main() {
  group('Render command executor (executes the M5B-3 stream)', () {
    test('replays every command in record order onto the backend', () {
      final buffer = CommandRecordingRuntime()
          .record(_doc(_tree()), _target(), _viewport())
          .commands;
      final backend = ReferenceBackendAdapter(platform: RenderPlatform.windows);
      final n = const RenderCommandExecutor().execute(
        buffer,
        backend,
        RenderContext(viewport: _viewport()),
      );
      expect(n, buffer.commands.length);
      final frame = backend.build(0);
      // One draw per visible object (group + 2 motifs = 3), composited.
      expect(frame.drawCount, buffer.drawCount);
      expect(frame.commandsExecuted, buffer.commands.length);
      expect(frame.composited, isTrue);
    });

    test('rejects a malformed command envelope (frozen begin/end frame)', () {
      const bad = CommandBuffer(
        frameId: 0,
        commands: [RenderCommand(kind: RenderCommandKind.draw)],
      );
      expect(
        () => const RenderCommandExecutor().execute(
          bad,
          ReferenceBackendAdapter(platform: RenderPlatform.windows),
          RenderContext(viewport: _viewport()),
        ),
        throwsStateError,
      );
    });
  });

  group('Platform rendering runtime — determinism & consistency', () {
    test('identical inputs produce an equal RenderedFrame (deterministic)', () {
      final rt = PlatformRenderingRuntime();
      final a = rt
          .render(_doc(_tree()), _target(), _viewport(), RenderPlatform.windows)
          .frame;
      final b = rt
          .render(_doc(_tree()), _target(), _viewport(), RenderPlatform.windows)
          .frame;
      expect(a.toJson(), b.toJson());
      expect(a, b);
    });

    test('RenderedFrame is JSON round-trippable (immutable summary)', () {
      final frame = PlatformRenderingRuntime()
          .render(_doc(_tree()), _target(), _viewport(), RenderPlatform.android)
          .frame;
      expect(RenderedFrame.fromJson(frame.toJson()), frame);
    });

    test('same document renders identically across Android/iOS/Windows', () {
      final frames = PlatformRenderingRuntime().renderOnAll(
        _doc(_tree()),
        _target(),
        _viewport(),
      );
      expect(frames.keys, containsAll(RenderPlatform.values));
      // Every platform's fingerprint (frame minus which platform produced
      // it) is identical — cross-platform consistency by construction.
      final fingerprints = frames.values
          .map((f) => f.consistencyFingerprint)
          .toList();
      for (final fp in fingerprints) {
        expect(fp, fingerprints.first);
      }
      // But each frame is correctly tagged with its own platform.
      expect(frames[RenderPlatform.ios]!.platform, RenderPlatform.ios);
      expect(frames[RenderPlatform.windows]!.platform, RenderPlatform.windows);
    });

    test('read-only: the document is never mutated by rendering (R1)', () {
      final doc = _doc(_tree());
      final before = doc.toJson();
      PlatformRenderingRuntime().render(
        doc,
        _target(),
        _viewport(),
        RenderPlatform.windows,
      );
      expect(doc.toJson(), before);
    });

    test('offscreen target is not marked presented', () {
      const thumbnail = RenderTarget(
        kind: RenderTargetKind.thumbnail,
        onScreen: false,
      );
      final frame = PlatformRenderingRuntime()
          .render(_doc(_tree()), thumbnail, _viewport(), RenderPlatform.windows)
          .frame;
      expect(frame.presented, isFalse);
    });
  });

  group('Platform capability detection (§B — data, no leakage)', () {
    test('every supported platform declares a deterministic profile', () {
      for (final p in RenderPlatform.values) {
        final caps = PlatformCapabilityDetector.detect(p);
        expect(caps.features, contains(BackendCapabilityKind.tileCaching));
        expect(caps.determinism, RenderDeterminismLevel.backendExact);
      }
      // Deterministic: same platform → same profile.
      expect(
        PlatformCapabilityDetector.detect(RenderPlatform.ios),
        PlatformCapabilityDetector.detect(RenderPlatform.ios),
      );
    });
  });

  group('Frame synchronization (drives the frozen FrameLifecycle)', () {
    test('runs the unskippable frame order and returns to idle', () {
      final sync = FrameSynchronizer();
      expect(sync.state, FrameLifecycleState.idle);
      sync.beginFrame();
      sync.toPresent();
      sync.endFrame();
      expect(sync.state, FrameLifecycleState.idle);
    });
  });

  group('Contract reuse (interface freeze — no redefinition)', () {
    test('ReferenceBackendAdapter implements the platform backend seam', () {
      expect(
        ReferenceBackendAdapter(platform: RenderPlatform.android),
        isA<PlatformRenderBackend>(),
      );
    });

    test('RenderSurfaceRuntime implements the frozen PresentationPipeline', () {
      final surface = RenderSurfaceRuntime(
        platform: RenderPlatform.windows,
        backend: ReferenceBackendAdapter(platform: RenderPlatform.windows),
      );
      expect(surface, isA<PresentationPipeline>());
      surface.presentFrame(
        RenderContext(viewport: _viewport()),
        OverlayStack.empty,
      );
      expect(surface.lastOverlayCount, 0);
    });
  });
}
