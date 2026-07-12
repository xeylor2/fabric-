import 'dart:io';
import 'dart:ui' as ui;

import 'package:core_design_system/core_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import '../support/test_app.dart';

/// Deliverable screenshot harness: renders the real app (real fonts, real
/// shadows) at representative geometries and writes PNGs to
/// docs/milestones/m1-screenshots/. Doubles as a rendering smoke test.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(_loadRealFonts);

  final outDir = Directory('../docs/milestones/m1-screenshots');

  const shots = <_Shot>[
    _Shot(
      'mobile-portrait-dashboard-light',
      Size(390, 844),
      FebricThemeSetting.light,
      '/dashboard',
      mobileInsets: true,
    ),
    _Shot(
      'mobile-portrait-more-modules-dark',
      Size(390, 844),
      FebricThemeSetting.dark,
      '/dashboard',
      mobileInsets: true,
      openMoreSheet: true,
    ),
    _Shot(
      'mobile-landscape-canvas-light',
      Size(844, 390),
      FebricThemeSetting.light,
      '/canvas',
      mobileInsets: true,
    ),
    _Shot(
      'tablet-portrait-library-light',
      Size(820, 1180),
      FebricThemeSetting.light,
      '/library',
    ),
    _Shot(
      'desktop-dashboard-light',
      Size(1440, 900),
      FebricThemeSetting.light,
      '/dashboard',
    ),
    _Shot(
      'desktop-settings-dark',
      Size(1440, 900),
      FebricThemeSetting.dark,
      '/settings',
    ),
    _Shot(
      'desktop-library-luxury-ivory',
      Size(1440, 900),
      FebricThemeSetting.luxuryIvory,
      '/library',
    ),
    _Shot(
      'desktop-design-tree-luxury-maroon',
      Size(1440, 900),
      FebricThemeSetting.luxuryMaroon,
      '/design-tree',
    ),
    _Shot(
      'desktop-canvas-midnight',
      Size(1440, 900),
      FebricThemeSetting.midnight,
      '/canvas',
    ),
  ];

  for (final shot in shots) {
    testWidgets('screenshot: ${shot.name}', (tester) async {
      debugDisableShadows = false;
      try {
        await _capture(tester, shot, outDir);
      } finally {
        debugDisableShadows = true;
      }
    });
  }
}

Future<void> _capture(WidgetTester tester, _Shot shot, Directory outDir) async {
  if (shot.mobileInsets) {
    tester.view.padding = const FakeViewPadding(top: 94, bottom: 68);
    tester.view.viewPadding = const FakeViewPadding(top: 94, bottom: 68);
  }

  const rootKey = ValueKey('shot-root');
  await pumpFebricApp(
    tester,
    size: shot.size,
    devicePixelRatio: 2.0,
    themeState: FebricThemeState(setting: shot.theme),
    rootKey: rootKey,
  );
  routerOf(tester).go(shot.route);
  await tester.pumpAndSettle();

  if (shot.openMoreSheet) {
    await tester.tap(find.text('More'));
    await tester.pumpAndSettle();
  }

  final boundary = tester.renderObject<RenderRepaintBoundary>(
    find.byKey(rootKey),
  );
  await tester.runAsync(() async {
    final image = await boundary.toImage(pixelRatio: 2.0);
    final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
    outDir.createSync(recursive: true);
    final file = File('${outDir.path}/${shot.name}.png');
    file.writeAsBytesSync(bytes!.buffer.asUint8List());
    expect(file.lengthSync(), greaterThan(10 * 1024));
  });
}

class _Shot {
  const _Shot(
    this.name,
    this.size,
    this.theme,
    this.route, {
    this.mobileInsets = false,
    this.openMoreSheet = false,
  });

  final String name;
  final Size size;
  final FebricThemeSetting theme;
  final String route;
  final bool mobileInsets;
  final bool openMoreSheet;
}

/// Widget tests render with placeholder boxes unless real fonts are loaded.
/// Loads bundled Inter (both bare and package-prefixed family names) and the
/// SDK's MaterialIcons so screenshots look like the shipping app.
Future<void> _loadRealFonts() async {
  const interDir = '../packages/core_design_system/fonts';
  const weights = {
    'Inter-Regular.ttf',
    'Inter-Medium.ttf',
    'Inter-SemiBold.ttf',
    'Inter-Bold.ttf',
  };

  for (final family in ['Inter', 'packages/core_design_system/Inter']) {
    final loader = FontLoader(family);
    for (final file in weights) {
      final path = '$interDir/$file';
      if (File(path).existsSync()) {
        loader.addFont(_fontData(path));
      }
    }
    await loader.load();
  }

  final flutterRoot = Platform.environment['FLUTTER_ROOT'];
  if (flutterRoot != null) {
    final iconsPath =
        '$flutterRoot/bin/cache/artifacts/material_fonts/MaterialIcons-Regular.otf';
    if (File(iconsPath).existsSync()) {
      final loader = FontLoader('MaterialIcons')..addFont(_fontData(iconsPath));
      await loader.load();
    }
  }
}

Future<ByteData> _fontData(String path) async {
  final bytes = File(path).readAsBytesSync();
  return ByteData.view(bytes.buffer);
}
