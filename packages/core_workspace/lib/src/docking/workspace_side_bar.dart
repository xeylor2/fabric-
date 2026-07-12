import 'package:core_design_system/core_design_system.dart';
import 'package:core_workspace/src/model/workspace_destination.dart';
import 'package:flutter/material.dart';

/// Desktop sidebar: brand header, module navigation, pinned settings,
/// collapsible to an icon rail.
class WorkspaceSideBar extends StatelessWidget {
  const WorkspaceSideBar({
    required this.destinations,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.collapsed,
    required this.onToggleCollapsed,
    super.key,
  });

  final List<WorkspaceDestination> destinations;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final bool collapsed;
  final VoidCallback onToggleCollapsed;

  static const double expandedWidth = 232;
  static const double collapsedWidth = 60;

  @override
  Widget build(BuildContext context) {
    final colors = context.febricColors;

    final settingsIndex = destinations.indexWhere((d) => d.id == 'settings');
    final mainIndexes = [
      for (var i = 0; i < destinations.length; i++)
        if (i != settingsIndex) i,
    ];

    return AnimatedContainer(
      duration: FebricMotion.base,
      curve: FebricMotion.emphasized,
      width: collapsed ? collapsedWidth : expandedWidth,
      decoration: BoxDecoration(
        color: colors.panel,
        border: Border(right: BorderSide(color: colors.hairline)),
      ),
      child: Column(
        children: [
          _BrandHeader(collapsed: collapsed),
          Divider(color: colors.hairline),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: FebricSpacing.sm,
                vertical: FebricSpacing.sm,
              ),
              children: [
                for (final i in mainIndexes)
                  _SideBarItem(
                    destination: destinations[i],
                    selected: i == selectedIndex,
                    collapsed: collapsed,
                    onTap: () => onDestinationSelected(i),
                  ),
              ],
            ),
          ),
          Divider(color: colors.hairline),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: FebricSpacing.sm,
              vertical: FebricSpacing.xs,
            ),
            child: Column(
              children: [
                if (settingsIndex >= 0)
                  _SideBarItem(
                    destination: destinations[settingsIndex],
                    selected: settingsIndex == selectedIndex,
                    collapsed: collapsed,
                    onTap: () => onDestinationSelected(settingsIndex),
                  ),
                _CollapseButton(collapsed: collapsed, onTap: onToggleCollapsed),
              ],
            ),
          ),
          const SizedBox(height: FebricSpacing.xs),
        ],
      ),
    );
  }
}

class _BrandHeader extends StatelessWidget {
  const _BrandHeader({required this.collapsed});

  final bool collapsed;

  @override
  Widget build(BuildContext context) {
    final colors = context.febricColors;
    return SizedBox(
      height: 52,
      child: Row(
        mainAxisAlignment: collapsed
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: [
          if (!collapsed) const SizedBox(width: FebricSpacing.lg),
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: colors.accent,
              borderRadius: FebricRadius.smAll,
            ),
            alignment: Alignment.center,
            child: Text(
              'F',
              style: context.febricText.labelLarge!.copyWith(
                color: colors.onAccent,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          if (!collapsed) ...[
            const SizedBox(width: FebricSpacing.md),
            Text(
              'FEBRIC',
              style: context.febricText.titleSmall!.copyWith(
                letterSpacing: 2.5,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _SideBarItem extends StatelessWidget {
  const _SideBarItem({
    required this.destination,
    required this.selected,
    required this.collapsed,
    required this.onTap,
  });

  final WorkspaceDestination destination;
  final bool selected;
  final bool collapsed;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.febricColors;
    final text = context.febricText;

    final item = Padding(
      padding: const EdgeInsets.symmetric(vertical: FebricSpacing.xxs),
      child: Material(
        color: selected ? colors.surfaceSelected : Colors.transparent,
        borderRadius: FebricRadius.mdAll,
        child: InkWell(
          onTap: onTap,
          borderRadius: FebricRadius.mdAll,
          hoverColor: colors.surfaceHover,
          child: SizedBox(
            height: 36,
            child: Row(
              mainAxisAlignment: collapsed
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              children: [
                if (!collapsed) const SizedBox(width: FebricSpacing.md),
                Icon(
                  selected ? destination.selectedIcon : destination.icon,
                  size: FebricIconSize.md,
                  color: selected ? colors.accent : colors.inkSecondary,
                ),
                if (!collapsed) ...[
                  const SizedBox(width: FebricSpacing.md),
                  Expanded(
                    child: Text(
                      destination.label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: (selected ? text.labelLarge : text.bodyMedium)!
                          .copyWith(
                            color: selected ? colors.ink : colors.inkSecondary,
                          ),
                    ),
                  ),
                  const SizedBox(width: FebricSpacing.sm),
                ],
              ],
            ),
          ),
        ),
      ),
    );

    return collapsed ? Tooltip(message: destination.label, child: item) : item;
  }
}

class _CollapseButton extends StatelessWidget {
  const _CollapseButton({required this.collapsed, required this.onTap});

  final bool collapsed;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.febricColors;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: FebricSpacing.xxs),
      child: Material(
        color: Colors.transparent,
        borderRadius: FebricRadius.mdAll,
        child: InkWell(
          onTap: onTap,
          borderRadius: FebricRadius.mdAll,
          hoverColor: colors.surfaceHover,
          child: SizedBox(
            height: 32,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  collapsed
                      ? Icons.keyboard_double_arrow_right
                      : Icons.keyboard_double_arrow_left,
                  size: FebricIconSize.sm,
                  color: colors.inkMuted,
                ),
                if (!collapsed) ...[
                  const SizedBox(width: FebricSpacing.sm),
                  Text(
                    'Collapse',
                    style: context.febricText.labelMedium!.copyWith(
                      color: colors.inkMuted,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
