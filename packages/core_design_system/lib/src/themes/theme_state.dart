import 'dart:ui';
import 'package:core_design_system/src/themes/febric_theme_variant.dart';
import 'package:flutter/foundation.dart';

/// The user's theme choice: a fixed variant or follow-the-system.
enum FebricThemeSetting {
  system('System'),
  light('Light'),
  dark('Dark'),
  luxuryIvory('Luxury Ivory'),
  luxuryMaroon('Luxury Maroon'),
  midnight('Midnight');

  const FebricThemeSetting(this.label);

  final String label;

  /// The fixed variant this setting maps to, or null for [system].
  FebricThemeVariant? get fixedVariant {
    return switch (this) {
      system => null,
      light => FebricThemeVariant.light,
      dark => FebricThemeVariant.dark,
      luxuryIvory => FebricThemeVariant.luxuryIvory,
      luxuryMaroon => FebricThemeVariant.luxuryMaroon,
      midnight => FebricThemeVariant.midnight,
    };
  }
}

/// Immutable Theme Engine state (persisted between sessions).
@immutable
class FebricThemeState {
  const FebricThemeState({
    this.setting = FebricThemeSetting.system,
    this.accentOverride,
  });

  final FebricThemeSetting setting;

  /// Custom accent color; null means the variant's default accent.
  final Color? accentOverride;

  FebricThemeState copyWith({
    FebricThemeSetting? setting,
    Color? accentOverride,
    bool clearAccent = false,
  }) {
    return FebricThemeState(
      setting: setting ?? this.setting,
      accentOverride: clearAccent
          ? null
          : (accentOverride ?? this.accentOverride),
    );
  }

  /// Variant to render given the platform [brightness] (used when
  /// [FebricThemeSetting.system] is active).
  FebricThemeVariant resolveVariant(Brightness platformBrightness) {
    return setting.fixedVariant ??
        (platformBrightness == Brightness.dark
            ? FebricThemeVariant.dark
            : FebricThemeVariant.light);
  }

  @override
  bool operator ==(Object other) {
    return other is FebricThemeState &&
        other.setting == setting &&
        other.accentOverride == accentOverride;
  }

  @override
  int get hashCode => Object.hash(setting, accentOverride);
}

/// Persistence seam for the Theme Engine. The app layer provides an
/// implementation (e.g. shared_preferences); the engine stays storage-free.
abstract interface class FebricThemePreferenceStore {
  /// Synchronous read — the app loads storage before `runApp`.
  FebricThemeState? read();

  Future<void> write(FebricThemeState state);
}
