import 'package:core_design_system/src/components/dot_grid_background.dart';
import 'package:core_design_system/src/components/status_pill.dart';
import 'package:core_design_system/src/febric_context.dart';
import 'package:core_design_system/src/tokens/febric_icon_size.dart';
import 'package:core_design_system/src/tokens/febric_radius.dart';
import 'package:core_design_system/src/tokens/febric_spacing.dart';
import 'package:flutter/material.dart';

/// Premium placeholder surface shown by every module until its milestone
/// lands: module identity, architecture status, and arrival milestone.
/// Strictly presentational — no business logic (M1 contract).
class ModulePlaceholderView extends StatelessWidget {
  const ModulePlaceholderView({
    required this.icon,
    required this.moduleName,
    required this.description,
    required this.packageId,
    required this.milestone,
    super.key,
  });

  final IconData icon;
  final String moduleName;
  final String description;
  final String packageId;
  final String milestone;

  @override
  Widget build(BuildContext context) {
    final colors = context.febricColors;
    final text = context.febricText;

    return DotGridBackground(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(FebricSpacing.xxl),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 76,
                  height: 76,
                  decoration: BoxDecoration(
                    color: colors.accentSoft,
                    borderRadius: FebricRadius.xlAll,
                    border: Border.all(
                      color: colors.accent.withValues(alpha: 0.25),
                    ),
                  ),
                  child: Icon(
                    icon,
                    size: FebricIconSize.xxl,
                    color: colors.accent,
                  ),
                ),
                const SizedBox(height: FebricSpacing.xxl),
                Text(
                  moduleName,
                  style: text.displaySmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: FebricSpacing.md),
                Text(
                  description,
                  style: text.bodyMedium!.copyWith(color: colors.inkSecondary),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: FebricSpacing.xxl),
                Wrap(
                  spacing: FebricSpacing.sm,
                  runSpacing: FebricSpacing.sm,
                  alignment: WrapAlignment.center,
                  children: [
                    StatusPill(label: packageId),
                    const StatusPill(
                      label: 'Architecture ready',
                      tone: StatusPillTone.success,
                    ),
                    StatusPill(
                      label: 'Coming in $milestone',
                      tone: StatusPillTone.accent,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
