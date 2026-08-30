import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:core_document/core_document.dart';
import 'package:core_interaction/core_interaction.dart';
import 'package:core_layer/core_layer.dart';
import 'package:core_render/core_render.dart';
import 'package:core_textile/core_textile.dart';
import 'package:feature_canvas_editor/feature_canvas_editor.dart';
import 'package:flutter/material.dart' hide RenderObject;

/// A garment-shaped design tree carrying the SAME frozen carriers the product
/// authors: `render_bounds` for document-space geometry and `object_type` for
/// the textile classification. One panel, one zone, the substrate cloth and one
/// printed motif layer above it.
const DesignNode canvasTestRoot = DesignNode(
  id: 'root',
  name: 'Session',
  type: DesignNodeType.project,
  metadata: {
    'render_bounds': [0, 0, 100, 80],
  },
  children: [
    DesignNode(
      id: 'panel',
      name: 'Front Panel',
      type: DesignNodeType.garmentPart,
      metadata: {
        'render_bounds': [0, 0, 100, 80],
      },
      children: [
        DesignNode(
          id: 'zone',
          name: 'Field',
          type: DesignNodeType.zone,
          metadata: {
            'render_bounds': [10, 10, 80, 60],
          },
          children: [
            DesignNode(
              id: 'fabric',
              name: 'Fabric / Base',
              type: DesignNodeType.element,
              metadata: {
                'object_type': 'fabric',
                'render_bounds': [10, 10, 80, 60],
              },
            ),
            DesignNode(
              id: 'motif',
              name: 'Printed Motif',
              type: DesignNodeType.element,
              metadata: {
                'object_type': 'motif',
                'render_bounds': [30, 25, 30, 25],
              },
            ),
          ],
        ),
      ],
    ),
  ],
);

/// The same tree with the printed motif layer hidden. A hidden node renders
/// nowhere and keeps its place in the tree (the frozen `DesignNode` contract).
const DesignNode canvasTestRootWithHiddenMotif = DesignNode(
  id: 'root',
  name: 'Session',
  type: DesignNodeType.project,
  metadata: {
    'render_bounds': [0, 0, 100, 80],
  },
  children: [
    DesignNode(
      id: 'panel',
      name: 'Front Panel',
      type: DesignNodeType.garmentPart,
      metadata: {
        'render_bounds': [0, 0, 100, 80],
      },
      children: [
        DesignNode(
          id: 'zone',
          name: 'Field',
          type: DesignNodeType.zone,
          metadata: {
            'render_bounds': [10, 10, 80, 60],
          },
          children: [
            DesignNode(
              id: 'fabric',
              name: 'Fabric / Base',
              type: DesignNodeType.element,
              metadata: {
                'object_type': 'fabric',
                'render_bounds': [10, 10, 80, 60],
              },
            ),
            DesignNode(
              id: 'motif',
              name: 'Printed Motif',
              type: DesignNodeType.element,
              visible: false,
              metadata: {
                'object_type': 'motif',
                'render_bounds': [30, 25, 30, 25],
              },
            ),
          ],
        ),
      ],
    ),
  ],
);

/// A document holding [canvasTestRoot] on one artboard.
FebricDocument canvasTestDocument({DesignNode root = canvasTestRoot}) =>
    FebricDocument(
      id: const DocumentId('doc-canvas-test'),
      projectId: const ProjectId('project-canvas-test'),
      manifest: const DocumentManifest(
        version: DocumentVersion(
          schema: DocumentVersion.currentSchema,
          generator: 'febric-test',
        ),
      ),
      metadata: DocumentMetadata(
        title: 'Canvas Test',
        author: 'test',
        createdAt: DateTime.utc(2026, 1, 1),
        modifiedAt: DateTime.utc(2026, 1, 1),
      ),
      artboards: [
        Artboard(
          id: 'artboard-canvas-test',
          name: 'Artboard',
          size: const Size2D(width: 100, height: 80),
          layerRoot: const LayerModel(
            id: 'layer-root',
            name: 'Layers',
            kind: LayerKind.artboard,
          ),
          designTreeRoot: root,
        ),
      ],
    );

/// The graph the frozen compiler produces for [canvasTestDocument], with the
/// frozen textile producer registered over the frozen default (the M16 seam).
RenderGraph canvasTestGraph({DesignNode root = canvasTestRoot}) =>
    RenderGraphCompiler(
      producers: textileProducerRegistry(),
    ).compile(canvasTestDocument(root: root), DesignTreeTarget.editor);

/// The frozen editor target used by every canvas test.
abstract final class DesignTreeTarget {
  static const RenderTarget editor = RenderTarget(
    kind: RenderTargetKind.editor,
  );
}

/// A 1:1 viewport: document units map to screen pixels one for one, so an
/// asserted pixel coordinate IS a document coordinate.
const ViewportState canvasTestViewport = ViewportState(
  canvasSize: Size2D(width: 100, height: 80),
  screenSize: Size2D(width: 100, height: 80),
);

/// A render context over [canvasTestViewport].
const RenderContext canvasTestContext = RenderContext(
  viewport: canvasTestViewport,
);

/// A palette of unmistakable, mutually distinct colours so a rasterized pixel
/// identifies which classification painted it.
const CanvasRenderPalette canvasTestPalette = CanvasRenderPalette(
  structure: Color(0xFF202020),
  fabric: Color(0xFF3060C0),
  fill: Color(0xFFFFFFFF),
  motif: Color(0xFFC03060),
  border: Color(0xFF806020),
  texture: Color(0xFF208060),
  shadow: Color(0xFF000000),
  image: Color(0xFF60C030),
  preview: Color(0xFFC0A020),
  highlight: Color(0xFFFFAA00),
);

/// Rasterizes [paint] into a [width]×[height] RGBA buffer — the proof that a
/// frame produced actual pixels rather than structure.
Future<CanvasTestPixels> rasterize(
  void Function(ui.Canvas canvas) paint, {
  int width = 100,
  int height = 80,
}) async {
  final recorder = ui.PictureRecorder();
  final canvas = ui.Canvas(recorder);
  paint(canvas);
  final picture = recorder.endRecording();
  final image = await picture.toImage(width, height);
  final data = await image.toByteData();
  picture.dispose();
  image.dispose();
  return CanvasTestPixels(data!, width);
}

/// An RGBA pixel buffer with coordinate access.
final class CanvasTestPixels {
  const CanvasTestPixels(this.data, this.width);

  final ByteData data;
  final int width;

  Color at(int x, int y) {
    final offset = (y * width + x) * 4;
    return Color.fromARGB(
      data.getUint8(offset + 3),
      data.getUint8(offset),
      data.getUint8(offset + 1),
      data.getUint8(offset + 2),
    );
  }
}

/// Real PNG bytes of a [size]×[size] square of [colour] — a genuine encoded
/// raster payload, produced by the platform encoder rather than hand-written.
Future<Uint8List> pngBytes(Color colour, {int size = 8}) async {
  final recorder = ui.PictureRecorder();
  final canvas = ui.Canvas(recorder);
  canvas.drawRect(
    ui.Rect.fromLTWH(0, 0, size.toDouble(), size.toDouble()),
    ui.Paint()..color = colour,
  );
  final picture = recorder.endRecording();
  final image = await picture.toImage(size, size);
  final data = await image.toByteData(format: ui.ImageByteFormat.png);
  picture.dispose();
  image.dispose();
  return data!.buffer.asUint8List();
}
