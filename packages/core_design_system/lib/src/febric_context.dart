import 'package:core_design_system/src/tokens/febric_breakpoints.dart';
import 'package:core_design_system/src/tokens/febric_colors.dart';
import 'package:flutter/material.dart';

/// Ergonomic access to FEBRIC tokens from any [BuildContext].
extension FebricContext on BuildContext {
  /// Semantic color tokens of the active theme.
  FebricColors get febricColors => Theme.of(this).extension<FebricColors>()!;

  /// The active text theme (FEBRIC typography).
  TextTheme get febricText => Theme.of(this).textTheme;

  /// Current responsive breakpoint (window-size derived).
  FebricBreakpoint get febricBreakpoint => FebricBreakpoint.of(this);
}
