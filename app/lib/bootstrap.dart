import 'package:core_design_system/core_design_system.dart';
import 'package:feature_settings/feature_settings.dart';
import 'package:febric/app.dart';
import 'package:febric/di/app_environment_provider.dart';
import 'package:febric/di/logging_provider_observer.dart';
import 'package:febric/di/theme_preference_store.dart';
import 'package:febric/env/app_environment.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Composition root: wires environment + persistence into the provider
/// graph and launches the workspace shell. All entrypoints funnel through
/// here.
Future<void> bootstrap(AppEnvironment environment) async {
  WidgetsFlutterBinding.ensureInitialized();

  // Edge-to-edge with transparent system bars; every shell region is
  // SafeArea-aware, so content never sits under system UI.
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  final prefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        appEnvironmentProvider.overrideWith((ref) => environment),
        febricThemeStoreProvider.overrideWith(
          (ref) => SharedPreferencesThemeStore(prefs),
        ),
        settingsAboutInfoProvider.overrideWith(
          (ref) => SettingsAboutInfo(
            appName: 'FEBRIC',
            version: '0.1.0',
            environment: environment.label,
            milestone: 'M1 — Workspace Foundation',
            blueprint: 'Architecture V2',
          ),
        ),
      ],
      observers: [
        if (environment.isDevelopment) const LoggingProviderObserver(),
      ],
      child: const FebricApp(),
    ),
  );
}
