import 'package:flutter/material.dart';

/// Semantic color tokens of the FEBRIC design system, carried as a
/// [ThemeExtension] so every widget reads colors from the Theme Engine —
/// never from hardcoded values.
///
/// Surface hierarchy (back to front): [canvas] → [panel] → [surface].
@immutable
class FebricColors extends ThemeExtension<FebricColors> {
  const FebricColors({
    required this.canvas,
    required this.panel,
    required this.surface,
    required this.surfaceHover,
    required this.surfaceSelected,
    required this.hairline,
    required this.hairlineStrong,
    required this.ink,
    required this.inkSecondary,
    required this.inkMuted,
    required this.accent,
    required this.onAccent,
    required this.accentSoft,
    required this.focusRing,
    required this.success,
    required this.warning,
    required this.danger,
    required this.info,
    required this.glassTint,
    required this.scrim,
  });

  /// Deepest background — the center workspace / canvas area.
  final Color canvas;

  /// Chrome surfaces: sidebar, toolbar, inspector, status bar.
  final Color panel;

  /// Raised surfaces: cards, sheets, menus, dialogs.
  final Color surface;

  /// Hover state layer for interactive rows/items.
  final Color surfaceHover;

  /// Selected state layer for interactive rows/items.
  final Color surfaceSelected;

  /// Standard 1px border / divider color.
  final Color hairline;

  /// Emphasized border (inputs, resize handles).
  final Color hairlineStrong;

  /// Primary text and icons.
  final Color ink;

  /// Secondary text and icons.
  final Color inkSecondary;

  /// Tertiary / disabled text and icons.
  final Color inkMuted;

  /// Interactive accent (selection, focus, primary actions).
  final Color accent;

  /// Text/icons placed on [accent].
  final Color onAccent;

  /// Soft opaque accent tint used for selected backgrounds and badges.
  final Color accentSoft;

  /// Focus ring color (translucent accent).
  final Color focusRing;

  final Color success;
  final Color warning;
  final Color danger;
  final Color info;

  /// Translucent panel tone for glass (blur) surfaces.
  final Color glassTint;

  /// Modal barrier color.
  final Color scrim;

  @override
  FebricColors copyWith({
    Color? canvas,
    Color? panel,
    Color? surface,
    Color? surfaceHover,
    Color? surfaceSelected,
    Color? hairline,
    Color? hairlineStrong,
    Color? ink,
    Color? inkSecondary,
    Color? inkMuted,
    Color? accent,
    Color? onAccent,
    Color? accentSoft,
    Color? focusRing,
    Color? success,
    Color? warning,
    Color? danger,
    Color? info,
    Color? glassTint,
    Color? scrim,
  }) {
    return FebricColors(
      canvas: canvas ?? this.canvas,
      panel: panel ?? this.panel,
      surface: surface ?? this.surface,
      surfaceHover: surfaceHover ?? this.surfaceHover,
      surfaceSelected: surfaceSelected ?? this.surfaceSelected,
      hairline: hairline ?? this.hairline,
      hairlineStrong: hairlineStrong ?? this.hairlineStrong,
      ink: ink ?? this.ink,
      inkSecondary: inkSecondary ?? this.inkSecondary,
      inkMuted: inkMuted ?? this.inkMuted,
      accent: accent ?? this.accent,
      onAccent: onAccent ?? this.onAccent,
      accentSoft: accentSoft ?? this.accentSoft,
      focusRing: focusRing ?? this.focusRing,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      danger: danger ?? this.danger,
      info: info ?? this.info,
      glassTint: glassTint ?? this.glassTint,
      scrim: scrim ?? this.scrim,
    );
  }

  @override
  FebricColors lerp(FebricColors? other, double t) {
    if (other == null) {
      return this;
    }
    return FebricColors(
      canvas: Color.lerp(canvas, other.canvas, t)!,
      panel: Color.lerp(panel, other.panel, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceHover: Color.lerp(surfaceHover, other.surfaceHover, t)!,
      surfaceSelected: Color.lerp(surfaceSelected, other.surfaceSelected, t)!,
      hairline: Color.lerp(hairline, other.hairline, t)!,
      hairlineStrong: Color.lerp(hairlineStrong, other.hairlineStrong, t)!,
      ink: Color.lerp(ink, other.ink, t)!,
      inkSecondary: Color.lerp(inkSecondary, other.inkSecondary, t)!,
      inkMuted: Color.lerp(inkMuted, other.inkMuted, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      onAccent: Color.lerp(onAccent, other.onAccent, t)!,
      accentSoft: Color.lerp(accentSoft, other.accentSoft, t)!,
      focusRing: Color.lerp(focusRing, other.focusRing, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
      info: Color.lerp(info, other.info, t)!,
      glassTint: Color.lerp(glassTint, other.glassTint, t)!,
      scrim: Color.lerp(scrim, other.scrim, t)!,
    );
  }
}
