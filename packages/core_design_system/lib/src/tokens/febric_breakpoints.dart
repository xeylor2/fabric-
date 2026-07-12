import 'package:flutter/widgets.dart';

/// Responsive breakpoints of the FEBRIC workspace.
///
/// Derived from the *window* size (not the physical screen), so split-screen,
/// foldables, and desktop window resizing all adapt correctly.
enum FebricBreakpoint {
  /// Phones, split-screen slivers (< 600 dp wide).
  compact,

  /// Tablets, half-desktop windows (600–1023 dp).
  medium,

  /// Desktop (1024–1439 dp).
  expanded,

  /// Large desktop (≥ 1440 dp).
  large;

  static const double compactMax = 600;
  static const double mediumMax = 1024;
  static const double expandedMax = 1440;

  /// Height below which a compact-width device is considered a landscape
  /// phone (bottom navigation would waste vertical space).
  static const double shortHeightMax = 500;

  static FebricBreakpoint fromWidth(double width) {
    if (width < compactMax) {
      return compact;
    }
    if (width < mediumMax) {
      return medium;
    }
    if (width < expandedMax) {
      return expanded;
    }
    return large;
  }

  static FebricBreakpoint of(BuildContext context) {
    return fromWidth(MediaQuery.sizeOf(context).width);
  }

  bool get isCompact => this == compact;
  bool get isMedium => this == medium;
  bool get isDesktop => this == expanded || this == large;

  /// Human-readable label (status bar, diagnostics).
  String get label {
    return switch (this) {
      compact => 'Compact',
      medium => 'Tablet',
      expanded => 'Desktop',
      large => 'Desktop XL',
    };
  }
}
