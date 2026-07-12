import 'dart:ui';

import 'package:core_design_system/core_design_system.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// shared_preferences-backed implementation of the Theme Engine's
/// persistence seam. Loaded synchronously at bootstrap (prefs are read
/// before `runApp`), written fire-and-forget on change.
class SharedPreferencesThemeStore implements FebricThemePreferenceStore {
  SharedPreferencesThemeStore(this._prefs);

  static const String _settingKey = 'febric.theme.setting';
  static const String _accentKey = 'febric.theme.accent';

  final SharedPreferences _prefs;

  @override
  FebricThemeState? read() {
    final settingName = _prefs.getString(_settingKey);
    if (settingName == null) {
      return null;
    }
    final setting =
        FebricThemeSetting.values.asNameMap()[settingName] ??
        FebricThemeSetting.system;
    final accentValue = _prefs.getInt(_accentKey);
    return FebricThemeState(
      setting: setting,
      accentOverride: accentValue == null ? null : Color(accentValue),
    );
  }

  @override
  Future<void> write(FebricThemeState state) async {
    await _prefs.setString(_settingKey, state.setting.name);
    final accent = state.accentOverride;
    if (accent == null) {
      await _prefs.remove(_accentKey);
    } else {
      await _prefs.setInt(_accentKey, accent.toARGB32());
    }
  }
}
