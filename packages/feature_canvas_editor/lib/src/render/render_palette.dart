import 'dart:ui' show Color;

import 'package:core_render/core_render.dart';

/// How one compiled render object is painted: an optional fill and an
/// optional hairline, both already resolved to Theme Engine colours.
///
/// A style is *data*. The driver reads it and draws; it never chooses a
/// colour, so the canvas follows the active FEBRIC theme exactly like every
/// other surface (token discipline, Architecture V2 §16 rule 6).
final class CanvasObjectStyle {
  const CanvasObjectStyle({
    this.fill,
    this.fillAlpha = 1,
    this.stroke,
    this.strokeAlpha = 1,
    this.strokeWidth = 1,
  });

  /// Interior colour, or null when the object contributes no fill (structure).
  final Color? fill;

  /// Alpha applied to [fill] — how much of what lies beneath reads through.
  final double fillAlpha;

  /// Hairline colour, or null when the object draws no outline.
  final Color? stroke;

  /// Alpha applied to [stroke].
  final double strokeAlpha;

  /// Hairline width in logical pixels.
  final double strokeWidth;
}

/// The Theme Engine palette the Flutter render driver draws the document with,
/// keyed by the frozen [RenderObjectKind] vocabulary.
///
/// The mapping is total over that vocabulary and introduces none of its own:
/// a render object's appearance is a pure function of the kind the frozen
/// producers already computed from the document (`object_type` → kind, ADR-0019
/// and `textile_render_producers.dart`). Structural kinds (`group` — garment,
/// part and zone nodes) contribute an outline so garment sections are visible
/// as sections; content kinds contribute the substrate and the print above it.
final class CanvasRenderPalette {
  const CanvasRenderPalette({
    required this.structure,
    required this.fabric,
    required this.fill,
    required this.motif,
    required this.border,
    required this.texture,
    required this.shadow,
    required this.image,
    required this.preview,
    required this.highlight,
  });

  /// Garment / part / zone outlines.
  final Color structure;

  /// The substrate cloth of a section.
  final Color fabric;

  /// A flat colour fill.
  final Color fill;

  /// A printed motif layer.
  final Color motif;

  /// A running border band.
  final Color border;

  /// A surface texture.
  final Color texture;

  /// A cast shadow.
  final Color shadow;

  /// A raster image placement with no decoded artwork yet.
  final Color image;

  /// An AI preview placement.
  final Color preview;

  /// The hairline drawn around the object a hit test resolved to.
  final Color highlight;

  /// The style of [kind]. Total over the frozen vocabulary.
  CanvasObjectStyle styleFor(RenderObjectKind kind) {
    switch (kind) {
      case RenderObjectKind.group:
        // Structure: garment, part and zone nodes frame their content and
        // never cover it.
        return CanvasObjectStyle(
          stroke: structure,
          strokeAlpha: 0.55,
          strokeWidth: 0.75,
        );
      case RenderObjectKind.fabricBase:
        return CanvasObjectStyle(
          fill: fabric,
          stroke: structure,
          strokeAlpha: 0.35,
          strokeWidth: 0.5,
        );
      case RenderObjectKind.colourFill:
        return CanvasObjectStyle(fill: fill);
      case RenderObjectKind.motif:
        // A print sits ON the cloth: the substrate reads through it.
        return CanvasObjectStyle(
          fill: motif,
          fillAlpha: 0.42,
          stroke: motif,
          strokeAlpha: 0.9,
          strokeWidth: 0.75,
        );
      case RenderObjectKind.border:
        return CanvasObjectStyle(fill: border, fillAlpha: 0.85);
      case RenderObjectKind.outline:
        return CanvasObjectStyle(stroke: border, strokeWidth: 1.25);
      case RenderObjectKind.texture:
        return CanvasObjectStyle(fill: texture, fillAlpha: 0.35);
      case RenderObjectKind.shadow:
        return CanvasObjectStyle(fill: shadow, fillAlpha: 0.25);
      case RenderObjectKind.image:
        return CanvasObjectStyle(
          fill: image,
          fillAlpha: 0.6,
          stroke: image,
          strokeWidth: 0.5,
        );
      case RenderObjectKind.preview:
        return CanvasObjectStyle(stroke: preview, strokeWidth: 1);
    }
  }

  /// Value equality: a palette IS its ten colours, so a theme change is a
  /// different palette and the surface repaints.
  @override
  bool operator ==(Object other) =>
      other is CanvasRenderPalette &&
      other.structure == structure &&
      other.fabric == fabric &&
      other.fill == fill &&
      other.motif == motif &&
      other.border == border &&
      other.texture == texture &&
      other.shadow == shadow &&
      other.image == image &&
      other.preview == preview &&
      other.highlight == highlight;

  @override
  int get hashCode => Object.hash(
    structure,
    fabric,
    fill,
    motif,
    border,
    texture,
    shadow,
    image,
    preview,
    highlight,
  );
}
