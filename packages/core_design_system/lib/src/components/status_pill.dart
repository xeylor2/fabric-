import 'package:core_design_system/src/febric_context.dart';
import 'package:core_design_system/src/tokens/color_utils.dart';
import 'package:core_design_system/src/tokens/febric_radius.dart';
import 'package:core_design_system/src/tokens/febric_spacing.dart';
import 'package:flutter/material.dart';

/// Semantic tone of a [StatusPill].
enum StatusPillTone { neutral, accent, success, warning, danger }

/// Small rounded badge used for statuses and metadata chips.
class StatusPill extends StatelessWidget {
  const StatusPill({
    required this.label,
    this.tone = StatusPillTone.neutral,
    super.key,
  });

  final String label;
  final StatusPillTone tone;

  @override
  Widget build(BuildContext context) {
    final colors = context.febricColors;
    final toneColor = switch (tone) {
      StatusPillTone.neutral => colors.inkSecondary,
      StatusPillTone.accent => colors.accent,
      StatusPillTone.success => colors.success,
      StatusPillTone.warning => colors.warning,
      StatusPillTone.danger => colors.danger,
    };
    final background = tone == StatusPillTone.neutral
        ? colors.surfaceHover
        : FebricColorUtils.tint(colors.panel, toneColor, 0.14);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: background,
        borderRadius: FebricRadius.pillAll,
        border: Border.all(color: toneColor.withValues(alpha: 0.25)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: FebricSpacing.md,
          vertical: FebricSpacing.xs,
        ),
        child: Text(
          label,
          style: context.febricText.labelMedium!.copyWith(
            color: tone == StatusPillTone.neutral
                ? colors.inkSecondary
                : toneColor,
          ),
        ),
      ),
    );
  }
}
