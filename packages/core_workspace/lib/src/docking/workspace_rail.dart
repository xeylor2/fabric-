import 'package:core_design_system/core_design_system.dart';
import 'package:core_workspace/src/model/workspace_destination.dart';
import 'package:flutter/material.dart';

/// Slim navigation rail for tablets and landscape phones.
/// Scrollable by design — it never overflows, whatever the window height
/// (split screen, foldables).
class WorkspaceRail extends StatelessWidget {
  const WorkspaceRail({
    required this.destinations,
    required this.selectedIndex,
    required this.onDestinationSelected,
    this.showLabels = true,
    super.key,
  });

  final List<WorkspaceDestination> destinations;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final bool showLabels;

  @override
  Widget build(BuildContext context) {
    final colors = context.febricColors;
    return Container(
      width: showLabels ? 72 : 56,
      decoration: BoxDecoration(
        color: colors.panel,
        border: Border(right: BorderSide(color: colors.hairline)),
      ),
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: FebricSpacing.sm),
        itemCount: destinations.length,
        itemBuilder: (context, index) {
          final destination = destinations[index];
          final selected = index == selectedIndex;
          return Tooltip(
            message: destination.label,
            child: InkWell(
              onTap: () => onDestinationSelected(index),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: FebricSpacing.xs),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 40,
                      height: 32,
                      decoration: BoxDecoration(
                        color: selected
                            ? colors.accentSoft
                            : Colors.transparent,
                        borderRadius: FebricRadius.mdAll,
                      ),
                      child: Icon(
                        selected ? destination.selectedIcon : destination.icon,
                        size: FebricIconSize.md,
                        color: selected ? colors.accent : colors.inkSecondary,
                      ),
                    ),
                    if (showLabels) ...[
                      const SizedBox(height: FebricSpacing.xxs),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: FebricSpacing.xxs,
                        ),
                        child: Text(
                          destination.label,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: context.febricText.labelSmall!.copyWith(
                            color: selected ? colors.ink : colors.inkMuted,
                            fontSize: 9.5,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
