import 'package:febric/navigation/app_destinations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/test_app.dart';

/// The responsive regression net: every module route is pumped at every
/// representative window geometry — phones (both orientations), foldable
/// halves, split-screen slivers, tablets and desktops. Any RenderFlex
/// overflow or layout exception fails the sweep.
void main() {
  const geometries = <Size>[
    Size(320, 568), // small phone portrait
    Size(360, 800), // common phone portrait
    Size(390, 844), // modern phone portrait
    Size(800, 360), // phone landscape
    Size(844, 390), // modern phone landscape
    Size(400, 400), // split-screen square sliver
    Size(500, 700), // foldable half / narrow window
    Size(600, 960), // small tablet portrait
    Size(820, 1180), // tablet portrait
    Size(1180, 820), // tablet landscape (desktop layout)
    Size(1024, 768), // small desktop window
    Size(1440, 900), // desktop
    Size(2560, 1440), // large desktop
    Size(1200, 500), // wide short window
  ];

  testWidgets(
    'all routes render overflow-free at all geometries',
    (tester) async {
      for (final size in geometries) {
        await pumpFebricApp(tester, size: size);
        final router = routerOf(tester);

        for (final destination in appDestinations) {
          router.go(destination.path);
          await tester.pumpAndSettle();
          expect(
            tester.takeException(),
            isNull,
            reason: '${destination.path} @ ${size.width}×${size.height}',
          );
        }
      }
    },
    timeout: const Timeout(Duration(minutes: 5)),
  );
}
