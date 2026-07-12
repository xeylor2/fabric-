import 'package:febric/navigation/app_destinations.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/test_app.dart';

void main() {
  testWidgets('all nine module routes render their placeholder', (
    tester,
  ) async {
    await pumpFebricApp(tester);
    final router = routerOf(tester);

    final expectations = <String, String>{
      '/dashboard': 'Coming in M10',
      '/projects': 'Coming in M11',
      '/library': 'Coming in M3',
      '/design-tree': 'Coming in M2',
      '/canvas': 'Coming in M4',
      '/conversation': 'Coming in M9',
      '/inspector': 'Coming in M7',
      '/production': 'Coming in M12',
    };

    for (final entry in expectations.entries) {
      router.go(entry.key);
      await tester.pumpAndSettle();
      expect(
        find.textContaining(entry.value),
        findsOneWidget,
        reason: '${entry.key} shows its milestone pill',
      );
    }

    router.go('/settings');
    await tester.pumpAndSettle();
    expect(find.text('APPEARANCE'), findsOneWidget);

    // About sits below the fold; scroll the settings list to it.
    await tester.drag(find.text('APPEARANCE'), const Offset(0, -1400));
    await tester.pumpAndSettle();
    expect(find.text('Architecture V2'), findsOneWidget, reason: 'About');
  });

  testWidgets('sidebar navigation switches modules', (tester) async {
    await pumpFebricApp(tester);

    await tester.tap(find.text('Design Tree'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Coming in M2'), findsOneWidget);

    await tester.tap(find.text('Settings'));
    await tester.pumpAndSettle();
    expect(find.text('APPEARANCE'), findsOneWidget);
  });

  testWidgets('root path redirects to first destination', (tester) async {
    await pumpFebricApp(tester);
    final router = routerOf(tester);

    router.go('/');
    await tester.pumpAndSettle();
    expect(find.textContaining('Coming in M10'), findsOneWidget);
  });

  testWidgets('registry paths and shell destinations stay in sync', (
    tester,
  ) async {
    expect(appDestinations.length, 9);
    expect(
      appDestinations.map((d) => d.destination.id).toSet().length,
      9,
      reason: 'destination ids unique',
    );
    expect(
      appDestinations.where((d) => d.destination.compactPrimary).length,
      inInclusiveRange(3, 4),
      reason: 'mobile bar holds at most 4 primaries',
    );
  });
}
