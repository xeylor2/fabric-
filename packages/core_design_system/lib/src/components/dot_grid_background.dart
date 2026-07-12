import 'package:core_design_system/src/febric_context.dart';
import 'package:flutter/material.dart';

/// Faint dot grid drawn behind workspace content — the "canvas at rest"
/// texture of professional design tools.
class DotGridBackground extends StatelessWidget {
  const DotGridBackground({required this.child, this.spacing = 24, super.key});

  final Widget child;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    final colors = context.febricColors;
    return CustomPaint(
      painter: _DotGridPainter(
        dotColor: colors.hairlineStrong.withValues(alpha: 0.45),
        spacing: spacing,
      ),
      child: child,
    );
  }
}

class _DotGridPainter extends CustomPainter {
  _DotGridPainter({required this.dotColor, required this.spacing});

  final Color dotColor;
  final double spacing;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = dotColor;
    for (var x = spacing; x < size.width; x += spacing) {
      for (var y = spacing; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), 1, paint);
      }
    }
  }

  @override
  bool shouldRepaint(_DotGridPainter oldDelegate) {
    return oldDelegate.dotColor != dotColor || oldDelegate.spacing != spacing;
  }
}
