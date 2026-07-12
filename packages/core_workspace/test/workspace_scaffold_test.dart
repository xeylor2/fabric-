import 'package:core_design_system/core_design_system.dart';
import 'package:core_workspace/core_workspace.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

const _destinations = [
  WorkspaceDestination(
    id: 'dashboard',
    label: 'Dashboard',
    icon: Icons.space_dashboard_outlined,
    compactPrimary: true,
  ),
  WorkspaceDestination(
    id: 'projects',
    label: 'Projects',
    icon: Icons.folder_open_outlined,
    compactPrimary: true,
  ),
  WorkspaceDestination(
    id: 'canvas',
    label: 'Canvas',
    icon: Icons.design_services_outlined,
    compactPrimary: true,
  ),
  WorkspaceDestination(
    id: 'library',
    label: 'Library',
    icon: Icons.checkroom_outlined,
    compactPrimary: true,
  ),
  WorkspaceDestination(
    id: 'production',
    label: 'Production',
    icon: Icons.print_outlined,
  ),
  WorkspaceDestination(
    id: 'settings',
    label: 'Settings',
    icon: Icons.settings_outlined,
  ),
];

Future<int> _pump(WidgetTester tester, Size size, {int selected = 0}) async {
  var tapped = -1;
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.reset);

  await tester.pumpWidget(
    MaterialApp(
      theme: FebricTheme.build(FebricThemeVariant.light),
      home: WorkspaceScaffold(
        destinations: _destinations,
        selectedIndex: selected,
        onDestinationSelected: (i) => tapped = i,
        body: const Center(child: Text('BODY')),
        inspector: const Center(child: Text('INSPECTOR-CONTENT')),
        statusItems: const [WorkspaceStatusItem(label: 'M1')],
      ),
    ),
  );
  await tester.pumpAndSettle();
  return tapped;
}

void main() {
  testWidgets('desktop: sidebar, toolbar, inspector and status bar', (
    tester,
  ) async {
    await _pump(tester, const Size(1440, 900));

    expect(find.text('FEBRIC'), findsOneWidget, reason: 'sidebar brand');
    expect(find.text('INSPECTOR'), findsOneWidget, reason: 'inspector header');
    expect(find.text('INSPECTOR-CONTENT'), findsOneWidget);
    expect(find.text('M1'), findsOneWidget, reason: 'status bar item');
    expect(find.textContaining('Desktop'), findsOneWidget);
    expect(find.text('BODY'), findsOneWidget);
    expect(find.byType(NavigationBar), findsNothing);
  });

  testWidgets('desktop: sidebar collapses to icon rail', (tester) async {
    await _pump(tester, const Size(1440, 900));

    expect(find.text('Projects'), findsOneWidget);
    await tester.tap(find.text('Collapse'));
    await tester.pumpAndSettle();
    expect(find.text('Projects'), findsNothing, reason: 'labels hidden');
    expect(find.byTooltip('Projects'), findsOneWidget, reason: 'tooltip kept');
  });

  testWidgets('desktop: inspector hides and returns', (tester) async {
    await _pump(tester, const Size(1440, 900));

    await tester.tap(find.byTooltip('Hide inspector').first);
    await tester.pumpAndSettle();
    expect(find.text('INSPECTOR-CONTENT'), findsNothing);

    await tester.tap(find.byTooltip('Show inspector'));
    await tester.pumpAndSettle();
    expect(find.text('INSPECTOR-CONTENT'), findsOneWidget);
  });

  testWidgets('tablet: rail without sidebar; inspector via end drawer', (
    tester,
  ) async {
    await _pump(tester, const Size(800, 1100));

    expect(find.text('FEBRIC'), findsNothing, reason: 'no expanded sidebar');
    expect(find.byType(NavigationBar), findsNothing);
    expect(find.text('INSPECTOR-CONTENT'), findsNothing);

    await tester.tap(find.byTooltip('Show inspector'));
    await tester.pumpAndSettle();
    expect(find.text('INSPECTOR-CONTENT'), findsOneWidget);
  });

  testWidgets('phone portrait: bottom navigation with More sheet', (
    tester,
  ) async {
    await _pump(tester, const Size(390, 844));

    expect(find.byType(NavigationBar), findsOneWidget);
    expect(find.text('More'), findsOneWidget);

    await tester.tap(find.text('More'));
    await tester.pumpAndSettle();
    expect(find.text('ALL MODULES'), findsOneWidget);
    expect(find.text('Settings'), findsOneWidget);
  });

  testWidgets('phone portrait: More sheet selects a non-primary module', (
    tester,
  ) async {
    var tapped = -1;
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      MaterialApp(
        theme: FebricTheme.build(FebricThemeVariant.light),
        home: StatefulBuilder(
          builder: (context, setState) => WorkspaceScaffold(
            destinations: _destinations,
            selectedIndex: 0,
            onDestinationSelected: (i) => setState(() => tapped = i),
            body: const SizedBox(),
          ),
        ),
      ),
    );
    await tester.tap(find.text('More'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Production'));
    await tester.pumpAndSettle();
    expect(tapped, 4);
  });

  testWidgets('phone landscape: icon rail, no bottom bar', (tester) async {
    await _pump(tester, const Size(844, 390));

    expect(find.byType(NavigationBar), findsNothing);
    expect(find.byTooltip('Projects'), findsOneWidget, reason: 'rail tooltip');
    expect(find.text('BODY'), findsOneWidget);
  });

  testWidgets('keyboard insets do not overflow the shell', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1.0;
    tester.view.viewInsets = const FakeViewPadding(bottom: 640);
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      MaterialApp(
        theme: FebricTheme.build(FebricThemeVariant.light),
        home: WorkspaceScaffold(
          destinations: _destinations,
          selectedIndex: 0,
          onDestinationSelected: (_) {},
          body: const Center(child: TextField()),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
  });

  testWidgets('system safe areas are respected (notch + nav bar)', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1.0;
    tester.view.padding = const FakeViewPadding(top: 47, bottom: 34);
    tester.view.viewPadding = const FakeViewPadding(top: 47, bottom: 34);
    addTearDown(tester.view.reset);

    await _pumpWithView(tester);
    final appBarTop = tester.getTopLeft(find.byType(AppBar)).dy;
    expect(appBarTop, 0, reason: 'AppBar starts at 0 and pads internally');
    expect(tester.takeException(), isNull);
  });
}

Future<void> _pumpWithView(WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      theme: FebricTheme.build(FebricThemeVariant.light),
      home: WorkspaceScaffold(
        destinations: _destinations,
        selectedIndex: 0,
        onDestinationSelected: (_) {},
        body: const Center(child: Text('BODY')),
      ),
    ),
  );
  await tester.pumpAndSettle();
}
