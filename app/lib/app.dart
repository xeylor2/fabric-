import 'package:core_design_system/core_design_system.dart';
import 'package:febric/l10n/generated/app_localizations.dart';
import 'package:febric/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Root widget: binds the Riverpod router and the Theme Engine.
/// With a fixed variant both theme slots receive the same ThemeData; with
/// System the light/dark pair follows platform brightness.
class FebricApp extends ConsumerWidget {
  const FebricApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    final themeState = ref.watch(febricThemeControllerProvider);

    final fixedVariant = themeState.setting.fixedVariant;
    final lightTheme = FebricTheme.build(
      fixedVariant ?? FebricThemeVariant.light,
      accentOverride: themeState.accentOverride,
    );
    final darkTheme = fixedVariant == null
        ? FebricTheme.build(
            FebricThemeVariant.dark,
            accentOverride: themeState.accentOverride,
          )
        : lightTheme;
    final themeMode = fixedVariant == null
        ? ThemeMode.system
        : (fixedVariant.isDark ? ThemeMode.dark : ThemeMode.light);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: router,
    );
  }
}
