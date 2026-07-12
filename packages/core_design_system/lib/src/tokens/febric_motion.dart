import 'package:flutter/animation.dart';

/// FEBRIC motion tokens: durations and curves.
abstract final class FebricMotion {
  /// Micro-interactions: hover, press, toggles.
  static const Duration fast = Duration(milliseconds: 120);

  /// Standard transitions: panel collapse, selection moves.
  static const Duration base = Duration(milliseconds: 200);

  /// Large transitions: sheets, layout changes.
  static const Duration slow = Duration(milliseconds: 320);

  static const Curve standard = Curves.easeInOut;
  static const Curve emphasized = Curves.easeOutCubic;
}
