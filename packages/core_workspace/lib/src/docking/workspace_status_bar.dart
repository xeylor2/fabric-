import 'package:core_design_system/core_design_system.dart';
import 'package:core_workspace/src/model/workspace_destination.dart';
import 'package:flutter/material.dart';

/// Bottom status bar (tablet/desktop): app-supplied items on the left,
/// live window/breakpoint telemetry on the right.
class WorkspaceStatusBar extends StatelessWidget {
  const WorkspaceStatusBar({
    this.items = const [],
    this.trailing = const [],
    super.key,
  });

  final List<WorkspaceStatusItem> items;
  final List<WorkspaceStatusItem> trailing;

  static const double height = 26;

  @override
  Widget build(BuildContext context) {
    final colors = context.febricColors;
    final size = MediaQuery.sizeOf(context);
    final breakpoint = FebricBreakpoint.fromWidth(size.width);

    final telemetry = WorkspaceStatusItem(
      label:
          '${size.width.round()} × ${size.height.round()} · ${breakpoint.label}',
      icon: Icons.aspect_ratio,
    );

    return Container(
      height: height,
      decoration: BoxDecoration(
        color: colors.panel,
        border: Border(top: BorderSide(color: colors.hairline)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: FebricSpacing.md),
      child: Row(
        children: [
          for (final item in items) ...[
            Flexible(child: _StatusEntry(item: item)),
            const SizedBox(width: FebricSpacing.lg),
          ],
          const Spacer(),
          for (final item in trailing) ...[
            Flexible(child: _StatusEntry(item: item)),
            const SizedBox(width: FebricSpacing.lg),
          ],
          Flexible(child: _StatusEntry(item: telemetry)),
        ],
      ),
    );
  }
}

class _StatusEntry extends StatelessWidget {
  const _StatusEntry({required this.item});

  final WorkspaceStatusItem item;

  @override
  Widget build(BuildContext context) {
    final colors = context.febricColors;
    final color = item.accent ? colors.accent : colors.inkMuted;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (item.icon != null) ...[
          Icon(item.icon, size: FebricIconSize.xs, color: color),
          const SizedBox(width: FebricSpacing.xs),
        ],
        Flexible(
          child: Text(
            item.label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.febricText.labelSmall!.copyWith(
              color: color,
              letterSpacing: 0.2,
            ),
          ),
        ),
      ],
    );
  }
}
