import 'dart:ui';

import 'package:core_design_system/core_design_system.dart';
import 'package:flutter_test/flutter_test.dart';

/// Constitutional readability gates: every built-in theme — and every
/// custom accent — must stay WCAG-readable. These thresholds are contracts,
/// not aspirations; lowering them requires an ADR.
void main() {
  group('built-in palettes', () {
    for (final variant in FebricThemeVariant.values) {
      test('${variant.label} passes contrast gates', () {
        final c = buildFebricColors(variant);

        expect(
          FebricColorUtils.contrastRatio(c.ink, c.canvas),
          greaterThanOrEqualTo(7),
          reason: 'primary ink vs canvas (AAA)',
        );
        expect(
          FebricColorUtils.contrastRatio(c.ink, c.surface),
          greaterThanOrEqualTo(7),
          reason: 'primary ink vs raised surface',
        );
        expect(
          FebricColorUtils.contrastRatio(c.inkSecondary, c.panel),
          greaterThanOrEqualTo(4.5),
          reason: 'secondary ink vs panel (AA)',
        );
        expect(
          FebricColorUtils.contrastRatio(c.accent, c.surface),
          greaterThanOrEqualTo(3),
          reason: 'accent vs surface (AA large/UI)',
        );
        expect(
          FebricColorUtils.contrastRatio(c.onAccent, c.accent),
          greaterThanOrEqualTo(4.5),
          reason: 'on-accent ink vs accent',
        );
      });
    }
  });

  group('custom accents are contrast-guarded', () {
    final hostileAccents = <Color>[
      const Color(0xFFFFFF00), // pure yellow
      const Color(0xFFFFFFFF), // white
      const Color(0xFF000000), // black
      const Color(0xFF19FF19), // neon green
      for (final preset in febricAccentPresets) preset.color,
    ];

    for (final variant in FebricThemeVariant.values) {
      test('${variant.label} guards every accent', () {
        for (final accent in hostileAccents) {
          final c = buildFebricColors(variant, accentOverride: accent);
          expect(
            FebricColorUtils.contrastRatio(c.accent, c.surface),
            greaterThanOrEqualTo(3),
            reason: 'accent $accent vs ${variant.label} surface',
          );
          expect(
            FebricColorUtils.contrastRatio(c.onAccent, c.accent),
            greaterThanOrEqualTo(4.5),
            reason: 'onAccent for $accent on ${variant.label}',
          );
        }
      });
    }
  });

  group('FebricColorUtils', () {
    test('contrastRatio bounds and symmetry', () {
      const white = Color(0xFFFFFFFF);
      const black = Color(0xFF000000);
      expect(FebricColorUtils.contrastRatio(white, black), closeTo(21, 0.1));
      expect(
        FebricColorUtils.contrastRatio(white, black),
        FebricColorUtils.contrastRatio(black, white),
      );
      expect(FebricColorUtils.contrastRatio(white, white), closeTo(1, 0.001));
    });

    test('foregroundFor picks the readable ink', () {
      const nearBlack = Color(0xFF101014);
      const nearWhite = Color(0xFFFAFAFB);
      expect(
        FebricColorUtils.contrastRatio(
          FebricColorUtils.foregroundFor(nearBlack),
          nearBlack,
        ),
        greaterThan(10),
      );
      expect(
        FebricColorUtils.contrastRatio(
          FebricColorUtils.foregroundFor(nearWhite),
          nearWhite,
        ),
        greaterThan(10),
      );
    });

    test('ensureContrast reaches the requested ratio', () {
      const surface = Color(0xFFFFFFFF);
      const weak = Color(0xFFFFF3B0); // pale yellow on white
      final fixed = FebricColorUtils.ensureContrast(weak, surface);
      expect(
        FebricColorUtils.contrastRatio(fixed, surface),
        greaterThanOrEqualTo(3),
      );
    });
  });
}
