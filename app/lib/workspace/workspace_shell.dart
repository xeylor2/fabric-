import 'package:core_design_system/core_design_system.dart';
import 'package:core_workspace/core_workspace.dart';
import 'package:febric/di/app_environment_provider.dart';
import 'package:febric/navigation/app_destinations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Binds the router's stateful navigation shell into the adaptive
/// [WorkspaceScaffold], and supplies app-level toolbar/status content.
class WorkspaceShell extends ConsumerWidget {
  const WorkspaceShell({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final environment = ref.watch(appEnvironmentProvider);
    final themeState = ref.watch(febricThemeControllerProvider);
    final destinations = [for (final d in appDestinations) d.destination];
    final current = destinations[navigationShell.currentIndex];

    return WorkspaceScaffold(
      destinations: destinations,
      selectedIndex: navigationShell.currentIndex,
      onDestinationSelected: (index) => navigationShell.goBranch(
        index,
        initialLocation: index == navigationShell.currentIndex,
      ),
      body: navigationShell,
      toolbarActions: const [_ThemeMenuButton()],
      statusItems: [
        const WorkspaceStatusItem(
          label: 'M1 · Workspace Foundation',
          icon: Icons.layers_outlined,
        ),
        WorkspaceStatusItem(
          label: environment.label.toUpperCase(),
          icon: Icons.bolt_outlined,
          accent: environment.isDevelopment,
        ),
      ],
      statusTrailing: [
        WorkspaceStatusItem(
          label: themeState.setting == FebricThemeSetting.system
              ? 'System theme'
              : themeState.setting.label,
          icon: Icons.palette_outlined,
        ),
      ],
      inspector: _InspectorPlaceholder(moduleLabel: current.label),
    );
  }
}

/// Quick theme switcher in the toolbar; full controls live in
/// Settings → Appearance.
class _ThemeMenuButton extends ConsumerWidget {
  const _ThemeMenuButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(febricThemeControllerProvider);
    final controller = ref.read(febricThemeControllerProvider.notifier);
    return PopupMenuButton<FebricThemeSetting>(
      tooltip: 'Theme',
      icon: const Icon(Icons.palette_outlined, size: FebricIconSize.lg),
      onSelected: controller.setSetting,
      itemBuilder: (context) => [
        for (final setting in FebricThemeSetting.values)
          CheckedPopupMenuItem(
            value: setting,
            checked: state.setting == setting,
            child: Text(setting.label),
          ),
      ],
    );
  }
}

/// M1 inspector content: identifies the active module and the milestone in
/// which contextual properties arrive.
class _InspectorPlaceholder extends StatelessWidget {
  const _InspectorPlaceholder({required this.moduleLabel});

  final String moduleLabel;

  @override
  Widget build(BuildContext context) {
    final colors = context.febricColors;
    return ListView(
      padding: const EdgeInsets.all(FebricSpacing.lg),
      children: [
        PanelSurface(
          header: 'Module',
          child: Row(
            children: [
              Expanded(
                child: Text(moduleLabel, style: context.febricText.titleSmall),
              ),
              const StatusPill(label: 'M1', tone: StatusPillTone.accent),
            ],
          ),
        ),
        const SizedBox(height: FebricSpacing.md),
        PanelSurface(
          header: 'Properties',
          child: Text(
            'Contextual properties appear here once the Design Tree lands '
            '(M2). Selection, node capabilities and version history will be '
            'inspectable per element.',
            style: context.febricText.bodySmall!.copyWith(
              color: colors.inkSecondary,
            ),
          ),
        ),
      ],
    );
  }
}
