import 'package:core_design_system/core_design_system.dart';
import 'package:flutter/material.dart';

/// Top toolbar of the workspace (tablet/desktop): current module title,
/// command-palette affordance, and window-level actions.
class WorkspaceToolbar extends StatelessWidget {
  const WorkspaceToolbar({
    required this.title,
    this.actions = const [],
    this.showCommandField = true,
    this.inspectorVisible,
    this.onToggleInspector,
    super.key,
  });

  final String title;
  final List<Widget> actions;
  final bool showCommandField;

  /// Null hides the inspector toggle entirely.
  final bool? inspectorVisible;
  final VoidCallback? onToggleInspector;

  static const double height = 48;

  @override
  Widget build(BuildContext context) {
    final colors = context.febricColors;
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: colors.panel,
        border: Border(bottom: BorderSide(color: colors.hairline)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: FebricSpacing.md),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.febricText.titleSmall,
            ),
          ),
          if (showCommandField) ...[
            const _CommandFieldPlaceholder(),
            const SizedBox(width: FebricSpacing.sm),
          ],
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ...actions,
                if (onToggleInspector != null)
                  Tooltip(
                    message: (inspectorVisible ?? false)
                        ? 'Hide inspector'
                        : 'Show inspector',
                    child: IconButton(
                      onPressed: onToggleInspector,
                      iconSize: FebricIconSize.lg,
                      icon: Icon(
                        Icons.view_sidebar_outlined,
                        color: (inspectorVisible ?? false)
                            ? colors.accent
                            : colors.inkSecondary,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Non-functional command palette affordance — the real palette arrives with
/// the workspace engine milestone.
class _CommandFieldPlaceholder extends StatelessWidget {
  const _CommandFieldPlaceholder();

  @override
  Widget build(BuildContext context) {
    final colors = context.febricColors;
    return Tooltip(
      message: 'Command palette — coming with the workspace engine',
      child: Container(
        width: 320,
        height: 30,
        decoration: BoxDecoration(
          color: colors.canvas,
          borderRadius: FebricRadius.mdAll,
          border: Border.all(color: colors.hairline),
        ),
        padding: const EdgeInsets.symmetric(horizontal: FebricSpacing.md),
        child: Row(
          children: [
            Icon(Icons.search, size: FebricIconSize.sm, color: colors.inkMuted),
            const SizedBox(width: FebricSpacing.sm),
            Expanded(
              child: Text(
                'Search or run a command…',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.febricText.bodySmall!.copyWith(
                  color: colors.inkMuted,
                ),
              ),
            ),
            const SizedBox(width: FebricSpacing.sm),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: FebricSpacing.xs,
                vertical: 1,
              ),
              decoration: BoxDecoration(
                borderRadius: FebricRadius.xsAll,
                border: Border.all(color: colors.hairlineStrong),
              ),
              child: Text(
                'Ctrl K',
                style: context.febricText.labelSmall!.copyWith(
                  color: colors.inkMuted,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
