import 'package:core_design_system/core_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/test_app.dart';

void main() {
  testWidgets('settings theme card switches the active theme', (tester) async {
    await pumpFebricApp(tester);
    routerOf(tester).go('/settings');
    await tester.pumpAndSettle();

    await tester.tap(find.text('Midnight'));
    await tester.pumpAndSettle();

    final context = tester.element(find.byType(Scaffold).first);
    final colors = Theme.of(context).extension<FebricColors>()!;
    final midnight = buildFebricColors(FebricThemeVariant.midnight);
    expect(colors.canvas, midnight.canvas);
  });

  testWidgets('accent preset updates the accent', (tester) async {
    await pumpFebricApp(tester, themeState: const FebricThemeState());
    routerOf(tester).go('/settings');
    await tester.pumpAndSettle();

    await tester.tap(find.byTooltip('Teal'));
    await tester.pumpAndSettle();

    final context = tester.element(find.byType(Scaffold).first);
    final colors = Theme.of(context).extension<FebricColors>()!;
    final expected = buildFebricColors(
      FebricThemeVariant.light,
      accentOverride: const Color(0xFF1F8A8A),
    );
    expect(colors.accent, expected.accent);
  });

  testWidgets('theme choice hydrates from the persisted store', (tester) async {
    await pumpFebricApp(
      tester,
      themeState: const FebricThemeState(
        setting: FebricThemeSetting.luxuryMaroon,
      ),
    );

    final context = tester.element(find.byType(Scaffold).first);
    final colors = Theme.of(context).extension<FebricColors>()!;
    final maroon = buildFebricColors(FebricThemeVariant.luxuryMaroon);
    expect(colors.canvas, maroon.canvas);
    expect(find.text('Luxury Maroon'), findsOneWidget, reason: 'status bar');
  });
}
