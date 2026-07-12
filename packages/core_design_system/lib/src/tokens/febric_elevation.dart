import 'package:flutter/material.dart';

/// FEBRIC elevation: layered, very soft shadows (premium apps whisper).
/// Dark themes rely more on hairline borders than on shadows.
abstract final class FebricElevation {
  /// Subtle lift: list hover cards, small popovers.
  static List<BoxShadow> level1(Brightness brightness) {
    final strength = brightness == Brightness.light ? 0.07 : 0.34;
    return [
      BoxShadow(
        color: const Color(0xFF000000).withValues(alpha: strength),
        blurRadius: 3,
        offset: const Offset(0, 1),
      ),
    ];
  }

  /// Floating surfaces: menus, tooltips, dropdowns.
  static List<BoxShadow> level2(Brightness brightness) {
    final light = brightness == Brightness.light;
    return [
      BoxShadow(
        color: const Color(0xFF000000).withValues(alpha: light ? 0.06 : 0.30),
        blurRadius: 4,
        offset: const Offset(0, 2),
      ),
      BoxShadow(
        color: const Color(0xFF000000).withValues(alpha: light ? 0.08 : 0.36),
        blurRadius: 16,
        offset: const Offset(0, 8),
      ),
    ];
  }

  /// Modal surfaces: dialogs, command palette, sheets on desktop.
  static List<BoxShadow> level3(Brightness brightness) {
    final light = brightness == Brightness.light;
    return [
      BoxShadow(
        color: const Color(0xFF000000).withValues(alpha: light ? 0.10 : 0.44),
        blurRadius: 32,
        offset: const Offset(0, 16),
      ),
      BoxShadow(
        color: const Color(0xFF000000).withValues(alpha: light ? 0.05 : 0.28),
        blurRadius: 6,
        offset: const Offset(0, 2),
      ),
    ];
  }
}
