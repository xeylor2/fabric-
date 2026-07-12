import 'package:core_design_system/src/febric_context.dart';
import 'package:core_design_system/src/tokens/febric_radius.dart';
import 'package:core_design_system/src/tokens/febric_spacing.dart';
import 'package:flutter/material.dart';

/// Bordered raised surface with an optional uppercase section header —
/// the standard card of the FEBRIC workspace (settings sections,
/// inspector groups).
class PanelSurface extends StatelessWidget {
  const PanelSurface({
    required this.child,
    this.header,
    this.padding = const EdgeInsets.all(FebricSpacing.lg),
    super.key,
  });

  final String? header;
  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final colors = context.febricColors;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: FebricRadius.lgAll,
        border: Border.all(color: colors.hairline),
      ),
      child: Padding(
        padding: padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (header != null) ...[
              Text(header!.toUpperCase(), style: context.febricText.labelSmall),
              const SizedBox(height: FebricSpacing.md),
            ],
            child,
          ],
        ),
      ),
    );
  }
}
