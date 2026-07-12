import 'package:core_design_system/src/themes/febric_theme_variant.dart';
import 'package:core_design_system/src/tokens/color_utils.dart';
import 'package:core_design_system/src/tokens/febric_colors.dart';
import 'package:flutter/painting.dart';

/// Neutral foundations of one theme variant. Accent-dependent tokens are
/// derived in [buildFebricColors] so custom accents inherit the same rules.
class _Neutrals {
  const _Neutrals({
    required this.canvas,
    required this.panel,
    required this.surface,
    required this.hairline,
    required this.hairlineStrong,
    required this.ink,
    required this.inkSecondary,
    required this.inkMuted,
    required this.defaultAccent,
    required this.success,
    required this.warning,
    required this.danger,
    required this.info,
  });

  final Color canvas;
  final Color panel;
  final Color surface;
  final Color hairline;
  final Color hairlineStrong;
  final Color ink;
  final Color inkSecondary;
  final Color inkMuted;
  final Color defaultAccent;
  final Color success;
  final Color warning;
  final Color danger;
  final Color info;
}

const _light = _Neutrals(
  canvas: Color(0xFFEFEFF2),
  panel: Color(0xFFFAFAFB),
  surface: Color(0xFFFFFFFF),
  hairline: Color(0xFFE4E4E9),
  hairlineStrong: Color(0xFFCFCFD8),
  ink: Color(0xFF1A1A21),
  inkSecondary: Color(0xFF585864),
  inkMuted: Color(0xFF8E8E9A),
  defaultAccent: Color(0xFF8C2B4A),
  success: Color(0xFF247A50),
  warning: Color(0xFF8F6414),
  danger: Color(0xFFB3283E),
  info: Color(0xFF2B6CB8),
);

const _dark = _Neutrals(
  canvas: Color(0xFF101014),
  panel: Color(0xFF17171C),
  surface: Color(0xFF1E1E25),
  hairline: Color(0xFF26262E),
  hairlineStrong: Color(0xFF3A3A46),
  ink: Color(0xFFEDEDF2),
  inkSecondary: Color(0xFFA5A5B3),
  inkMuted: Color(0xFF71717F),
  defaultAccent: Color(0xFFD26A88),
  success: Color(0xFF4CC38A),
  warning: Color(0xFFE2B93B),
  danger: Color(0xFFE5566B),
  info: Color(0xFF6CA8E8),
);

const _luxuryIvory = _Neutrals(
  canvas: Color(0xFFF0EADD),
  panel: Color(0xFFF8F3E9),
  surface: Color(0xFFFFFCF4),
  hairline: Color(0xFFE3D9C4),
  hairlineStrong: Color(0xFFCFC1A2),
  ink: Color(0xFF2B241B),
  inkSecondary: Color(0xFF6B5F4C),
  inkMuted: Color(0xFF9C8D74),
  defaultAccent: Color(0xFF8A6420),
  success: Color(0xFF3F7A44),
  warning: Color(0xFF8F6414),
  danger: Color(0xFFA6394B),
  info: Color(0xFF4A6FA5),
);

const _luxuryMaroon = _Neutrals(
  canvas: Color(0xFF1A0F13),
  panel: Color(0xFF221319),
  surface: Color(0xFF2B181F),
  hairline: Color(0xFF392028),
  hairlineStrong: Color(0xFF50303B),
  ink: Color(0xFFF4E9DF),
  inkSecondary: Color(0xFFC6ACA0),
  inkMuted: Color(0xFF937A6F),
  defaultAccent: Color(0xFFD6A84E),
  success: Color(0xFF67B98B),
  warning: Color(0xFFE2B93B),
  danger: Color(0xFFE06A7B),
  info: Color(0xFF8FA8D8),
);

const _midnight = _Neutrals(
  canvas: Color(0xFF0D1017),
  panel: Color(0xFF121722),
  surface: Color(0xFF191F2E),
  hairline: Color(0xFF222A3B),
  hairlineStrong: Color(0xFF35405A),
  ink: Color(0xFFE8EDF6),
  inkSecondary: Color(0xFF99A3B8),
  inkMuted: Color(0xFF667089),
  defaultAccent: Color(0xFF7C97F2),
  success: Color(0xFF4CC38A),
  warning: Color(0xFFD9B23F),
  danger: Color(0xFFE5566B),
  info: Color(0xFF6CB4E8),
);

_Neutrals _neutralsFor(FebricThemeVariant variant) {
  return switch (variant) {
    FebricThemeVariant.light => _light,
    FebricThemeVariant.dark => _dark,
    FebricThemeVariant.luxuryIvory => _luxuryIvory,
    FebricThemeVariant.luxuryMaroon => _luxuryMaroon,
    FebricThemeVariant.midnight => _midnight,
  };
}

/// Builds the full semantic token set for [variant].
///
/// [accentOverride] (the user's custom accent) is contrast-guarded against
/// the variant's surfaces, and all accent-derived tokens (soft tint,
/// selection, focus ring, on-accent ink) are re-derived from it.
FebricColors buildFebricColors(
  FebricThemeVariant variant, {
  Color? accentOverride,
}) {
  final n = _neutralsFor(variant);
  final isLight = !variant.isDark;

  final accent = FebricColorUtils.ensureAccentReadable(
    accentOverride ?? n.defaultAccent,
    n.surface,
  );
  final onAccent = FebricColorUtils.foregroundFor(accent);

  return FebricColors(
    canvas: n.canvas,
    panel: n.panel,
    surface: n.surface,
    surfaceHover: FebricColorUtils.tint(n.panel, n.ink, isLight ? 0.05 : 0.06),
    surfaceSelected: FebricColorUtils.tint(
      n.panel,
      accent,
      isLight ? 0.11 : 0.16,
    ),
    hairline: n.hairline,
    hairlineStrong: n.hairlineStrong,
    ink: n.ink,
    inkSecondary: n.inkSecondary,
    inkMuted: n.inkMuted,
    accent: accent,
    onAccent: onAccent,
    accentSoft: FebricColorUtils.tint(n.panel, accent, isLight ? 0.13 : 0.20),
    focusRing: accent.withValues(alpha: 0.55),
    success: n.success,
    warning: n.warning,
    danger: n.danger,
    info: n.info,
    glassTint: n.panel.withValues(alpha: isLight ? 0.72 : 0.66),
    scrim: const Color(0xFF000000).withValues(alpha: isLight ? 0.40 : 0.58),
  );
}
