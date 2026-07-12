import 'package:flutter_test/flutter_test.dart';

import 'support/test_app.dart';

void main() {
  testWidgets('boots into the workspace shell on Dashboard', (tester) async {
    await pumpFebricApp(tester);

    expect(find.text('FEBRIC'), findsOneWidget, reason: 'sidebar brand');
    expect(find.text('Dashboard'), findsWidgets, reason: 'module page + nav');
    expect(
      find.textContaining('Coming in M10'),
      findsOneWidget,
      reason: 'dashboard placeholder milestone pill',
    );
    expect(find.text('M1 · Workspace Foundation'), findsOneWidget);
    expect(find.text('DEVELOPMENT'), findsOneWidget);
  });
}
