import 'dart:async';
import 'dart:ui';
import 'package:core_design_system/src/themes/theme_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Persistence seam — overridden by the app's composition root with a real
/// store. Defaults to null (no persistence: tests, tools).
final febricThemeStoreProvider = Provider<FebricThemePreferenceStore?>(
  (ref) => null,
);

/// Tier-3 Riverpod provider owning the Theme Engine state
/// (Architecture V2, §9/§18).
final febricThemeControllerProvider =
    NotifierProvider<FebricThemeController, FebricThemeState>(
      FebricThemeController.new,
    );

class FebricThemeController extends Notifier<FebricThemeState> {
  @override
  FebricThemeState build() {
    return ref.watch(febricThemeStoreProvider)?.read() ??
        const FebricThemeState();
  }

  void setSetting(FebricThemeSetting setting) {
    state = state.copyWith(setting: setting);
    _persist();
  }

  /// Sets a custom accent; pass null to restore the variant's default.
  void setAccentOverride(Color? accent) {
    state = accent == null
        ? state.copyWith(clearAccent: true)
        : state.copyWith(accentOverride: accent);
    _persist();
  }

  void _persist() {
    final store = ref.read(febricThemeStoreProvider);
    if (store != null) {
      unawaited(store.write(state));
    }
  }
}
