import 'dart:ui';
import 'package:core_design_system/src/febric_context.dart';
import 'package:core_design_system/src/tokens/febric_radius.dart';
import 'package:flutter/material.dart';

/// Subtle glass (blur + tint) surface, used sparingly: sheets and overlays.
class FebricGlass extends StatelessWidget {
  const FebricGlass({
    required this.child,
    this.borderRadius = FebricRadius.lgAll,
    this.sigma = 24,
    super.key,
  });

  final Widget child;
  final BorderRadius borderRadius;
  final double sigma;

  @override
  Widget build(BuildContext context) {
    final colors = context.febricColors;
    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: colors.glassTint,
            borderRadius: borderRadius,
            border: Border.all(color: colors.hairline),
          ),
          child: child,
        ),
      ),
    );
  }
}
