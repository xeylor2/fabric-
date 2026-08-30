import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:core_canvas/core_canvas.dart';
import 'package:core_geometry/core_geometry.dart';
import 'package:core_render/core_render.dart';
import 'package:feature_canvas_editor/feature_canvas_editor.dart';
import 'package:flutter/material.dart' hide RenderObject;
import 'package:flutter_test/flutter_test.dart';

import 'support/canvas_test_document.dart';

/// Drives the frozen pipeline into the Flutter driver exactly as the surface
/// painter does, and returns the backend so structure can be asserted.
FlutterRenderBackend _drive(
  ui.Canvas surface, {
  Map<String, ResolvedCanvasArtwork> artwork =
      const <String, ResolvedCanvasArtwork>{},
  ResourceRegistry? resources,
  OverlayStack overlays = OverlayStack.empty,
}) {
  final backend = FlutterRenderBackend(
    palette: canvasTestPalette,
    artwork: artwork,
    resources: resources,
  );
  backend.beginFrame(surface);
  final visible = const CullServiceImpl().cull(
    canvasTestGraph(),
    canvasTestContext.viewport.visibleRect,
  );
  RenderPassExecutor(
    RenderPassRegistryImpl.standard(),
  ).execute(visible, backend, canvasTestContext);
  FlutterPresentationPipeline(
    backend,
  ).presentFrame(canvasTestContext, overlays);
  return backend;
}

void main() {
  test('the driver implements the frozen backend seam', () {
    final backend = FlutterRenderBackend(palette: canvasTestPalette);
    expect(backend, isA<RenderBackend>());
    // Capabilities are declared as data (§B) — never probed.
    expect(
      backend.capabilities.determinism,
      RenderDeterminismLevel.backendExact,
    );
    expect(backend.capabilities.blendModes.length, 16);
    backend.dispose();
  });

  test('records the frozen pass order, then composites and presents', () async {
    late FlutterRenderBackend backend;
    await rasterize((canvas) => backend = _drive(canvas));
    expect(backend.recordedPasses, RenderConstitution.passOrder);
    expect(backend.composited, isTrue);
    expect(backend.presented, isTrue);
    // One draw per compiled object: root, panel, zone, fabric, motif.
    expect(backend.drawCalls, canvasTestGraph().objects.length);
    expect(backend.drawCalls, 5);
    backend.dispose();
  });

  test('produces actual pixels: substrate and print differ', () async {
    late FlutterRenderBackend backend;
    final pixels = await rasterize((canvas) => backend = _drive(canvas));
    backend.dispose();

    // Inside the fabric zone, outside the motif: the substrate's own colour.
    final substrate = pixels.at(15, 15);
    expect(substrate.a, closeTo(1, 0.01), reason: 'the cloth is opaque');
    expect(substrate.r, closeTo(canvasTestPalette.fabric.r, 0.01));
    expect(substrate.g, closeTo(canvasTestPalette.fabric.g, 0.01));
    expect(substrate.b, closeTo(canvasTestPalette.fabric.b, 0.01));

    // Inside the printed motif: the print over the cloth — a different pixel,
    // pulled towards the motif token because the substrate reads through it.
    final print = pixels.at(45, 37);
    expect(print, isNot(substrate));
    expect(print.a, closeTo(1, 0.01));
    expect(print.r, greaterThan(substrate.r), reason: 'print tints the cloth');

    // Outside every panel: nothing was painted there.
    expect(pixels.at(2, 78).a, closeTo(0, 0.01));
  });

  test('resolves referenced artwork and paints the real bytes', () async {
    const artworkColour = Color(0xFF00FF00);
    final bytes = await pngBytes(artworkColour);
    final resolved = await resolveCanvasArtwork([
      CanvasArtworkSource(
        nodeId: 'motif',
        contentHash: 'sha256:motif-artwork',
        bytes: bytes,
      ),
    ]);
    expect(resolved.keys, ['motif'], reason: 'real PNG bytes decoded');

    final resources = ResourceRegistryImpl();
    late FlutterRenderBackend backend;
    final pixels = await rasterize(
      (canvas) =>
          backend = _drive(canvas, artwork: resolved, resources: resources),
    );
    backend.dispose();

    // The motif node now shows its artwork, not its classification colour.
    final print = pixels.at(45, 37);
    expect(print.a, closeTo(1, 0.01));
    expect(print.r, closeTo(artworkColour.r, 0.02));
    expect(print.g, closeTo(artworkColour.g, 0.02));
    expect(print.b, closeTo(artworkColour.b, 0.02));

    // The cloth around it is untouched — only the referencing node changed.
    expect(pixels.at(15, 15).b, closeTo(canvasTestPalette.fabric.b, 0.01));

    // The artwork was acquired through the frozen resource registry, keyed by
    // its frozen content address.
    expect(
      resources.refCountOf(
        const ResourceKey(
          kind: ResourceKind.texture,
          key: 'sha256:motif-artwork',
        ),
      ),
      greaterThan(0),
    );

    for (final artwork in resolved.values) {
      artwork.image.dispose();
    }
  });

  test('an undecodable payload is skipped, never thrown', () async {
    final resolved = await resolveCanvasArtwork([
      CanvasArtworkSource(
        nodeId: 'motif',
        contentHash: 'sha256:vector',
        bytes: Uint8List.fromList('<svg/>'.codeUnits),
      ),
    ]);
    expect(resolved, isEmpty);
  });

  test('overlays paint through the frozen presentation pipeline', () async {
    final overlays = OverlayStack.empty.contribute(
      const OverlayModel(
        id: 'canvas-hit',
        kind: OverlayKind.hover,
        references: ['fabric'],
        bounds: Rect2D(left: 10, top: 10, width: 80, height: 60),
      ),
    );
    late FlutterRenderBackend bare;
    late FlutterRenderBackend marked;
    final plain = await rasterize((canvas) => bare = _drive(canvas));
    final highlighted = await rasterize(
      (canvas) => marked = _drive(canvas, overlays: overlays),
    );
    bare.dispose();
    marked.dispose();

    // The overlay hairline sits on the zone edge and changes that pixel only.
    expect(highlighted.at(10, 40), isNot(plain.at(10, 40)));
    expect(highlighted.at(45, 15), plain.at(45, 15));
  });
}
