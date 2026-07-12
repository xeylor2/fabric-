import 'package:core_design_system/core_design_system.dart';
import 'package:flutter/material.dart';

/// M1 placeholder for the Dashboard module — presentation only, no business
/// logic until its milestone (M10).
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ModulePlaceholderView(
      icon: Icons.space_dashboard_outlined,
      moduleName: 'Dashboard',
      description:
          'Recent projects, pinned work, assets, AI jobs and system health - mission control for your studio.',
      packageId: 'feature_dashboard',
      milestone: 'M10',
    );
  }
}
