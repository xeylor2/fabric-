import 'package:core_design_system/core_design_system.dart';
import 'package:core_workspace/src/model/workspace_destination.dart';
import 'package:flutter/material.dart';

/// Mobile "More" sheet listing every workspace module.
Future<void> showMoreModulesSheet({
  required BuildContext context,
  required List<WorkspaceDestination> destinations,
  required int selectedIndex,
  required ValueChanged<int> onDestinationSelected,
}) {
  return showModalBottomSheet<void>(
    context: context,
    useSafeArea: true,
    isScrollControlled: true,
    builder: (sheetContext) {
      final colors = sheetContext.febricColors;
      return SafeArea(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.sizeOf(sheetContext).height * 0.7,
          ),
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(
              FebricSpacing.md,
              FebricSpacing.xs,
              FebricSpacing.md,
              FebricSpacing.lg,
            ),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: FebricSpacing.md,
                  vertical: FebricSpacing.sm,
                ),
                child: Text(
                  'ALL MODULES',
                  style: sheetContext.febricText.labelSmall,
                ),
              ),
              for (var i = 0; i < destinations.length; i++)
                ListTile(
                  onTap: () {
                    Navigator.of(sheetContext).pop();
                    onDestinationSelected(i);
                  },
                  selected: i == selectedIndex,
                  selectedTileColor: colors.surfaceSelected,
                  leading: Icon(
                    i == selectedIndex
                        ? destinations[i].selectedIcon
                        : destinations[i].icon,
                    size: FebricIconSize.lg,
                    color: i == selectedIndex
                        ? colors.accent
                        : colors.inkSecondary,
                  ),
                  title: Text(
                    destinations[i].label,
                    style: sheetContext.febricText.bodyMedium,
                  ),
                  trailing: i == selectedIndex
                      ? Icon(
                          Icons.check,
                          size: FebricIconSize.sm,
                          color: colors.accent,
                        )
                      : null,
                ),
            ],
          ),
        ),
      );
    },
  );
}
