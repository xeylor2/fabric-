import 'package:flutter/material.dart';

/// FEBRIC typography — Inter, bundled with this package (OFL licensed).
///
/// The scale is tuned for a dense professional workspace: quiet weights,
/// tight display tracking, generous body line-height.
abstract final class FebricTypography {
  static const String fontFamily = 'Inter';
  static const String fontPackage = 'core_design_system';
  static const List<String> fallback = <String>[
    'Segoe UI',
    'SF Pro Text',
    'Roboto',
  ];

  static TextStyle _style(
    double size,
    FontWeight weight,
    Color color, {
    double? height,
    double spacing = 0,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      package: fontPackage,
      fontFamilyFallback: fallback,
      fontSize: size,
      fontWeight: weight,
      color: color,
      height: height,
      letterSpacing: spacing,
    );
  }

  static TextTheme textTheme(Color ink, Color inkSecondary) {
    return TextTheme(
      displayLarge: _style(
        34,
        FontWeight.w600,
        ink,
        height: 1.2,
        spacing: -0.6,
      ),
      displayMedium: _style(
        30,
        FontWeight.w600,
        ink,
        height: 1.2,
        spacing: -0.5,
      ),
      displaySmall: _style(
        26,
        FontWeight.w600,
        ink,
        height: 1.25,
        spacing: -0.4,
      ),
      headlineMedium: _style(
        22,
        FontWeight.w600,
        ink,
        height: 1.25,
        spacing: -0.3,
      ),
      titleLarge: _style(18, FontWeight.w600, ink, height: 1.3, spacing: -0.2),
      titleMedium: _style(15, FontWeight.w600, ink, height: 1.35),
      titleSmall: _style(13.5, FontWeight.w600, ink, height: 1.35),
      bodyLarge: _style(15, FontWeight.w400, ink, height: 1.5),
      bodyMedium: _style(13.5, FontWeight.w400, ink, height: 1.5),
      bodySmall: _style(12, FontWeight.w400, inkSecondary, height: 1.45),
      labelLarge: _style(13, FontWeight.w600, ink, height: 1.3),
      labelMedium: _style(
        11.5,
        FontWeight.w600,
        inkSecondary,
        height: 1.3,
        spacing: 0.3,
      ),
      labelSmall: _style(
        10.5,
        FontWeight.w600,
        inkSecondary,
        height: 1.3,
        spacing: 0.7,
      ),
    );
  }

  /// Panel/section header style (rendered uppercase by convention).
  static TextStyle panelHeader(TextTheme theme) => theme.labelSmall!;
}
