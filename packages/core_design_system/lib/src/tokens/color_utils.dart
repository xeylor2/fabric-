import 'package:flutter/painting.dart';

/// WCAG-style color math used by the Theme Engine so every generated theme —
/// including user-picked custom accents — stays readable.
abstract final class FebricColorUtils {
  static const Color _lightInk = Color(0xFFF7F7FA);
  static const Color _darkInk = Color(0xFF17171B);

  /// WCAG contrast ratio between two colors (1..21).
  static double contrastRatio(Color a, Color b) {
    final la = a.computeLuminance();
    final lb = b.computeLuminance();
    final lighter = la > lb ? la : lb;
    final darker = la > lb ? lb : la;
    return (lighter + 0.05) / (darker + 0.05);
  }

  /// Foreground (text/icon) color that stays readable on [background].
  static Color foregroundFor(Color background) {
    final withLight = contrastRatio(_lightInk, background);
    final withDark = contrastRatio(_darkInk, background);
    return withLight >= withDark ? _lightInk : _darkInk;
  }

  /// Nudges [color]'s lightness until it reaches [minRatio] against
  /// [against]. The direction (darken vs lighten) is chosen away from the
  /// background's own lightness so the hue survives.
  static Color ensureContrast(
    Color color,
    Color against, {
    double minRatio = 3.0,
  }) {
    if (contrastRatio(color, against) >= minRatio) {
      return color;
    }
    final darken = against.computeLuminance() > 0.5;
    var hsl = HSLColor.fromColor(color);
    for (var i = 0; i < 50; i++) {
      final lightness = (hsl.lightness + (darken ? -0.02 : 0.02)).clamp(
        0.0,
        1.0,
      );
      hsl = hsl.withLightness(lightness);
      if (contrastRatio(hsl.toColor(), against) >= minRatio ||
          lightness == 0.0 ||
          lightness == 1.0) {
        break;
      }
    }
    return hsl.toColor();
  }

  /// Full accent guard: the returned color keeps ≥3.0 contrast against
  /// [surface] AND ≥4.5 contrast for its own foreground ink. Both fixes push
  /// lightness in the same direction (away from the surface), so they never
  /// fight each other.
  static Color ensureAccentReadable(Color accent, Color surface) {
    var color = ensureContrast(accent, surface);
    final darken = surface.computeLuminance() > 0.5;
    for (var i = 0; i < 50; i++) {
      if (contrastRatio(foregroundFor(color), color) >= 4.5) {
        break;
      }
      final hsl = HSLColor.fromColor(color);
      final lightness = (hsl.lightness + (darken ? -0.02 : 0.02)).clamp(
        0.0,
        1.0,
      );
      color = hsl.withLightness(lightness).toColor();
      if (lightness == 0.0 || lightness == 1.0) {
        break;
      }
    }
    return color;
  }

  /// Opaque color produced by laying [overlay] at [alpha] over [base].
  /// Preferred over translucent colors for large surfaces (cheaper to
  /// composite, predictable stacking).
  static Color tint(Color base, Color overlay, double alpha) {
    return Color.alphaBlend(overlay.withValues(alpha: alpha), base);
  }
}
