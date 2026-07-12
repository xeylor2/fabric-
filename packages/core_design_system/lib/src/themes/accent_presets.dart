import 'dart:ui';

/// Curated accent presets offered in Settings → Appearance.
/// Any other color is allowed via the custom picker; all accents pass
/// through the same contrast guard.
class FebricAccentPreset {
  const FebricAccentPreset(this.label, this.color);

  final String label;
  final Color color;
}

const List<FebricAccentPreset> febricAccentPresets = [
  FebricAccentPreset('Maroon', Color(0xFF8C2B4A)),
  FebricAccentPreset('Gold', Color(0xFFA87932)),
  FebricAccentPreset('Indigo', Color(0xFF5B5BD6)),
  FebricAccentPreset('Teal', Color(0xFF1F8A8A)),
  FebricAccentPreset('Forest', Color(0xFF2F7D4F)),
  FebricAccentPreset('Sky', Color(0xFF2B7DB8)),
  FebricAccentPreset('Plum', Color(0xFF7A3E8F)),
  FebricAccentPreset('Copper', Color(0xFFB25E38)),
];
