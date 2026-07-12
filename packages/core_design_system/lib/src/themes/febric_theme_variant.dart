import 'dart:ui';

/// The built-in FEBRIC theme variants (Architecture V2, System 8).
enum FebricThemeVariant {
  light('Light', Brightness.light),
  dark('Dark', Brightness.dark),
  luxuryIvory('Luxury Ivory', Brightness.light),
  luxuryMaroon('Luxury Maroon', Brightness.dark),
  midnight('Midnight', Brightness.dark);

  const FebricThemeVariant(this.label, this.brightness);

  final String label;
  final Brightness brightness;

  bool get isDark => brightness == Brightness.dark;
}
