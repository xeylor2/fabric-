import 'package:core_design_system/core_design_system.dart';
import 'package:feature_settings/feature_settings.dart';
import 'package:febric/app.dart';
import 'package:febric/di/app_environment_provider.dart';
import 'package:febric/env/app_environment.dart';
import 'package:febric/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

/// In-memory theme store with a fixed initial state (no persistence).
class FixedThemeStore implements FebricThemePreferenceStore {
  FixedThemeStore(this.state);

  FebricThemeState state;

  @override
  FebricThemeState? read() => state;

  @override
  Future<void> write(FebricThemeState newState) async {
    state = newState;
  }
}

const testAboutInfo = SettingsAboutInfo(
  appName: 'FEBRIC',
  version: '0.1.0',
  environment: 'Development',
  milestone: 'M1 — Workspace Foundation',
  blueprint: 'Architecture V2',
);

/// Pumps the full FEBRIC app at a given logical [size] with all
/// composition-root overrides in place.
Future<void> pumpFebricApp(
  WidgetTester tester, {
  Size size = const Size(1440, 900),
  double devicePixelRatio = 1.0,
  FebricThemeState? themeState,
  Key? rootKey,
}) async {
  tester.view.physicalSize = Size(
    size.width * devicePixelRatio,
    size.height * devicePixelRatio,
  );
  tester.view.devicePixelRatio = devicePixelRatio;
  addTearDown(tester.view.reset);

  await tester.pumpWidget(
    RepaintBoundary(
      key: rootKey,
      child: ProviderScope(
        overrides: [
          appEnvironmentProvider.overrideWith(
            (ref) => AppEnvironment.development,
          ),
          settingsAboutInfoProvider.overrideWith((ref) => testAboutInfo),
          if (themeState != null)
            febricThemeStoreProvider.overrideWith(
              (ref) => FixedThemeStore(themeState),
            ),
        ],
        child: const FebricApp(),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

/// The app's live router (navigate with `routerOf(tester).go('/path')`).
GoRouter routerOf(WidgetTester tester) {
  final context = tester.element(find.byType(FebricApp));
  return ProviderScope.containerOf(context).read(appRouterProvider);
}
