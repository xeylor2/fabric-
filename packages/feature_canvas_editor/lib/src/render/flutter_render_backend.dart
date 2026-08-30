import 'dart:ui' as ui;

import 'package:core_canvas/core_canvas.dart';
import 'package:core_canvas_runtime/core_canvas_runtime.dart';
import 'package:core_geometry/core_geometry.dart';
import 'package:core_layer/core_layer.dart';
import 'package:core_render/core_render.dart';
import 'package:feature_canvas_editor/src/render/canvas_artwork.dart';
import 'package:feature_canvas_editor/src/render/render_palette.dart';

/// The **Flutter render driver**: the concrete implementation of the frozen
/// `RenderBackend` seam (Rendering Constitution §3.7/§B) that produces actual
/// pixels on a Flutter surface.
///
/// It is a driver, not a renderer. Everything above it stays the frozen
/// pipeline: the graph is compiled by the frozen `GraphCompiler`, culled by the
/// frozen `CullService`, and handed to this backend one pass at a time by the
/// frozen `RenderPassExecutor` through `record(pass, context, objects)`. No
/// parallel renderer, no second rendering authority, no new command system and
/// no new geometry, bounds or measurement system exists here:
///
/// - **where** an object draws is `RenderObject.bounds` (the frozen bounds
///   discipline the producers already applied), mapped to screen space by the
///   frozen `CoordinateConversion` over the single shared `ViewportState` (R4);
/// - **what** it looks like is `RenderObject.kind` through a Theme Engine
///   [CanvasRenderPalette], or the node's own resolved artwork when it has any;
/// - **in what order** is the frozen draw order inside the frozen pass order.
///
/// It is read-only with respect to the document (R1): it holds render objects
/// and images, mutates no document, and emits no `DocumentCommand`.
final class FlutterRenderBackend implements RenderBackend {
  FlutterRenderBackend({
    required this.palette,
    this.artwork = const <String, ResolvedCanvasArtwork>{},
    ResourceRegistry? resources,
    BackendCapabilities? capabilities,
  }) : _resources = resources ?? ResourceRegistryImpl(),
       _caps = BackendCapabilityRuntime(
         capabilities ?? FlutterRenderBackend.defaultCapabilities,
       );

  /// What a Flutter/Skia-Impeller surface declares as data (§B): it rasterizes
  /// offscreen pictures and masks, antialiases, and implements every one of the
  /// frozen sixteen blend modes natively.
  static final BackendCapabilities defaultCapabilities = BackendCapabilities(
    features: const {
      BackendCapabilityKind.offscreenTargets,
      BackendCapabilityKind.maskRasterization,
      BackendCapabilityKind.multisampleAntialiasing,
    },
    blendModes: FebricBlendMode.values.toSet(),
    determinism: RenderDeterminismLevel.backendExact,
  );

  /// The Theme Engine colours this driver paints with.
  final CanvasRenderPalette palette;

  /// Decoded artwork, keyed by the design node id that references it — the same
  /// id a compiled object's `CanvasReference.refId` carries.
  final Map<String, ResolvedCanvasArtwork> artwork;

  /// The frozen resource registry: an artwork's content-addressed
  /// [ResourceKey] is acquired here before it is drawn, and ref-counted by it.
  final ResourceRegistry _resources;

  final BackendCapabilityRuntime _caps;

  /// The surface of the frame in flight, bound by [beginFrame].
  ui.Canvas? _surface;

  /// Per-pass recordings of the frame in flight, in the order they were
  /// recorded (= the frozen pass order the executor drives).
  final List<ui.Picture> _passes = [];

  /// The composited frame, produced by [composite].
  ui.Picture? _frame;

  int _drawCalls = 0;
  final List<RenderPassKind> _recordedPasses = [];
  bool _composited = false;
  bool _presented = false;

  @override
  BackendCapabilities get capabilities => _caps.capabilities;

  /// Draw calls issued this frame — one per object actually painted.
  int get drawCalls => _drawCalls;

  /// The passes recorded this frame, in execution order.
  List<RenderPassKind> get recordedPasses => List.unmodifiable(_recordedPasses);

  bool get composited => _composited;
  bool get presented => _presented;

  /// Binds [surface] as the target of the next frame and clears per-frame
  /// state. Driven by the surface painter, exactly as the recording backend's
  /// lifecycle markers are driven by its runtime.
  void beginFrame(ui.Canvas surface) {
    _disposeFrame();
    _surface = surface;
    _drawCalls = 0;
    _recordedPasses.clear();
    _composited = false;
    _presented = false;
  }

  // ------------------------------------------- the frozen RenderBackend seam

  @override
  void record(
    RenderPass pass,
    RenderContext context,
    List<RenderObject> objects,
  ) {
    final recorder = ui.PictureRecorder();
    final canvas = ui.Canvas(recorder);
    // The frozen named pipeline stage, over the single shared viewport — this
    // driver implements no transform of its own.
    final conversion = CoordinateConversion(context.viewport);
    for (final object in objects) {
      _draw(canvas, conversion, object);
      _drawCalls++;
    }
    _passes.add(recorder.endRecording());
    _recordedPasses.add(pass.kind);
  }

  @override
  void composite(RenderContext context) {
    // Compositing is real work: the per-pass recordings merge into one frame
    // in the frozen pass order they were recorded in (R6).
    final recorder = ui.PictureRecorder();
    final canvas = ui.Canvas(recorder);
    for (final pass in _passes) {
      canvas.drawPicture(pass);
    }
    _frame = recorder.endRecording();
    for (final pass in _passes) {
      pass.dispose();
    }
    _passes.clear();
    _composited = true;
  }

  @override
  void present(RenderContext context) {
    final surface = _surface;
    final frame = _frame;
    if (surface == null || frame == null) {
      return;
    }
    surface.drawPicture(frame);
    _presented = true;
  }

  /// Paints the frozen [OverlayStack] onto the bound surface, in the stack's own
  /// deterministic paint order (ADR-0018). Overlays are canvas-owned chrome, not
  /// document content: they carry references and a document-space region only,
  /// and painting one writes nothing.
  void drawOverlays(OverlayStack overlays, RenderContext context) {
    final surface = _surface;
    if (surface == null) {
      return;
    }
    final conversion = CoordinateConversion(context.viewport);
    for (final overlay in overlays.entries) {
      final bounds = overlay.bounds;
      if (!overlay.visible || bounds == null) {
        continue;
      }
      final rect = _screenRect(conversion, bounds);
      surface.drawRect(
        rect,
        ui.Paint()
          ..style = ui.PaintingStyle.stroke
          ..strokeWidth = 1.5
          ..isAntiAlias = true
          ..color = palette.highlight,
      );
    }
  }

  /// Releases the frame in flight. Called when the surface is discarded.
  void dispose() => _disposeFrame();

  void _disposeFrame() {
    for (final pass in _passes) {
      pass.dispose();
    }
    _passes.clear();
    _frame?.dispose();
    _frame = null;
  }

  // ------------------------------------------------------------ drawing

  void _draw(
    ui.Canvas canvas,
    CoordinateConversion conversion,
    RenderObject object,
  ) {
    final rect = _screenRect(conversion, object.bounds);
    // Blend resolved through declared capabilities as data (§B) — the driver
    // never probes the device.
    final blend = _blendOf(_caps.resolveBlend(object.blend));
    final artworkOf = artwork[object.source.refId];
    if (artworkOf != null) {
      // The node references real artwork: acquire its frozen content-addressed
      // resource key, then draw the actual bytes the content store held.
      _resources.acquire(artworkOf.resourceKey);
      canvas.drawImageRect(
        artworkOf.image,
        ui.Rect.fromLTWH(
          0,
          0,
          artworkOf.image.width.toDouble(),
          artworkOf.image.height.toDouble(),
        ),
        rect,
        ui.Paint()
          ..blendMode = blend
          ..isAntiAlias = true
          ..filterQuality = ui.FilterQuality.medium
          // Only a paint's alpha modulates an image; the token supplies it so
          // the object's own opacity is honoured without inventing a colour.
          ..color = _opacity(palette.fill, object.opacity),
      );
      return;
    }
    final style = palette.styleFor(object.kind);
    final fill = style.fill;
    if (fill != null) {
      canvas.drawRect(
        rect,
        ui.Paint()
          ..style = ui.PaintingStyle.fill
          ..blendMode = blend
          ..isAntiAlias = true
          ..color = _opacity(fill, object.opacity * style.fillAlpha),
      );
    }
    final stroke = style.stroke;
    if (stroke != null) {
      canvas.drawRect(
        rect,
        ui.Paint()
          ..style = ui.PaintingStyle.stroke
          ..strokeWidth = style.strokeWidth
          ..blendMode = blend
          ..isAntiAlias = true
          ..color = _opacity(stroke, object.opacity * style.strokeAlpha),
      );
    }
  }

  /// Document-space [bounds] → the screen rectangle, through the frozen
  /// coordinate pipeline and the frozen bounding-box primitive. No transform
  /// maths is written here.
  ui.Rect _screenRect(CoordinateConversion conversion, Rect2D bounds) {
    final corners = Rect2D.boundingPoints([
      conversion.documentToScreen(Point2D(x: bounds.left, y: bounds.top)),
      conversion.documentToScreen(Point2D(x: bounds.right, y: bounds.top)),
      conversion.documentToScreen(Point2D(x: bounds.left, y: bounds.bottom)),
      conversion.documentToScreen(Point2D(x: bounds.right, y: bounds.bottom)),
    ]);
    return ui.Rect.fromLTWH(
      corners.left,
      corners.top,
      corners.width,
      corners.height,
    );
  }

  ui.Color _opacity(ui.Color colour, double opacity) =>
      colour.withValues(alpha: colour.a * opacity.clamp(0.0, 1.0));

  /// The frozen sixteen blend modes on their Flutter equivalents. Total; adds
  /// no vocabulary on either side.
  ui.BlendMode _blendOf(FebricBlendMode blend) => switch (blend) {
    FebricBlendMode.normal => ui.BlendMode.srcOver,
    FebricBlendMode.multiply => ui.BlendMode.multiply,
    FebricBlendMode.screen => ui.BlendMode.screen,
    FebricBlendMode.overlay => ui.BlendMode.overlay,
    FebricBlendMode.darken => ui.BlendMode.darken,
    FebricBlendMode.lighten => ui.BlendMode.lighten,
    FebricBlendMode.colourDodge => ui.BlendMode.colorDodge,
    FebricBlendMode.colourBurn => ui.BlendMode.colorBurn,
    FebricBlendMode.hardLight => ui.BlendMode.hardLight,
    FebricBlendMode.softLight => ui.BlendMode.softLight,
    FebricBlendMode.difference => ui.BlendMode.difference,
    FebricBlendMode.exclusion => ui.BlendMode.exclusion,
    FebricBlendMode.hue => ui.BlendMode.hue,
    FebricBlendMode.saturation => ui.BlendMode.saturation,
    FebricBlendMode.colour => ui.BlendMode.color,
    FebricBlendMode.luminosity => ui.BlendMode.luminosity,
  };
}
