import 'package:core_design_system/core_design_system.dart';
import 'package:flutter/material.dart';

/// A settings section whose configuration arrives in a later milestone.
class PlaceholderSection extends StatelessWidget {
  const PlaceholderSection({
    required this.header,
    required this.icon,
    required this.description,
    required this.milestone,
    super.key,
  });

  final String header;
  final IconData icon;
  final String description;
  final String milestone;

  @override
  Widget build(BuildContext context) {
    final colors = context.febricColors;
    return PanelSurface(
      header: header,
      child: Row(
        children: [
          Icon(icon, size: FebricIconSize.lg, color: colors.inkMuted),
          const SizedBox(width: FebricSpacing.md),
          Expanded(
            child: Text(
              description,
              style: context.febricText.bodySmall!.copyWith(
                color: colors.inkSecondary,
              ),
            ),
          ),
          const SizedBox(width: FebricSpacing.md),
          StatusPill(label: milestone, tone: StatusPillTone.accent),
        ],
      ),
    );
  }
}
