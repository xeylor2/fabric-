import 'dart:ui';

import 'package:core_design_system/core_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class _RecordingStore implements FebricThemePreferenceStore {
  FebricThemeState? stored;
  int writes = 0;

  @override
  FebricThemeState? read() => stored;

  @override
  Future<void> write(FebricThemeState state) async {
    stored = state;
    writes++;
  }
}

void main() {
  group('FebricTheme.build', () {
    for (final variant in FebricThemeVariant.values) {
      test('${variant.label}: tokens are wired into ThemeData', () {
        final theme = FebricTheme.build(variant);
        final colors = theme.extension<FebricColors>();

        expect(colors, isNotNull, reason: 'FebricColors extension registered');
        expect(theme.brightness, variant.brightness);
        expect(theme.scaffoldBackgroundColor, colors!.canvas);
        expect(theme.colorScheme.primary, colors.accent);
        expect(theme.dividerColor, colors.hairline);
      });
    }

    test('custom accent flows into ThemeData and derived tokens', () {
      const accent = Color(0xFF1F8A8A);
      final theme = FebricTheme.build(
        FebricThemeVariant.light,
        accentOverride: accent,
      );
      final colors = theme.extension<FebricColors>()!;
      expect(theme.colorScheme.primary, colors.accent);
      expect(
        FebricColorUtils.contrastRatio(colors.accent, colors.surface),
        greaterThanOrEqualTo(3),
      );
    });
  });

  group('FebricThemeState', () {
    test('system resolves via platform brightness', () {
      const state = FebricThemeState();
      expect(state.resolveVariant(Brightness.light), FebricThemeVariant.light);
      expect(state.resolveVariant(Brightness.dark), FebricThemeVariant.dark);
    });

    test('fixed settings ignore platform brightness', () {
      const state = FebricThemeState(setting: FebricThemeSetting.luxuryMaroon);
      expect(
        state.resolveVariant(Brightness.light),
        FebricThemeVariant.luxuryMaroon,
      );
    });
  });

  group('FebricThemeController', () {
    test('hydrates from store and persists changes', () async {
      final store = _RecordingStore()
        ..stored = const FebricThemeState(setting: FebricThemeSetting.midnight);
      final container = ProviderContainer(
        overrides: [febricThemeStoreProvider.overrideWith((ref) => store)],
      );
      addTearDown(container.dispose);

      expect(
        container.read(febricThemeControllerProvider).setting,
        FebricThemeSetting.midnight,
      );

      container
          .read(febricThemeControllerProvider.notifier)
          .setSetting(FebricThemeSetting.luxuryIvory);
      await Future<void>.delayed(Duration.zero);

      expect(store.stored!.setting, FebricThemeSetting.luxuryIvory);
      expect(store.writes, 1);
    });

    test('accent override set and reset', () async {
      final store = _RecordingStore();
      final container = ProviderContainer(
        overrides: [febricThemeStoreProvider.overrideWith((ref) => store)],
      );
      addTearDown(container.dispose);
      final controller = container.read(febricThemeControllerProvider.notifier);

      const accent = Color(0xFF2F7D4F);
      controller.setAccentOverride(accent);
      expect(
        container.read(febricThemeControllerProvider).accentOverride,
        accent,
      );

      controller.setAccentOverride(null);
      expect(
        container.read(febricThemeControllerProvider).accentOverride,
        isNull,
      );
    });
  });

  group('FebricBreakpoint', () {
    test('boundary mapping', () {
      expect(FebricBreakpoint.fromWidth(320), FebricBreakpoint.compact);
      expect(FebricBreakpoint.fromWidth(599.9), FebricBreakpoint.compact);
      expect(FebricBreakpoint.fromWidth(600), FebricBreakpoint.medium);
      expect(FebricBreakpoint.fromWidth(1023.9), FebricBreakpoint.medium);
      expect(FebricBreakpoint.fromWidth(1024), FebricBreakpoint.expanded);
      expect(FebricBreakpoint.fromWidth(1439.9), FebricBreakpoint.expanded);
      expect(FebricBreakpoint.fromWidth(1440), FebricBreakpoint.large);
    });
  });
}
