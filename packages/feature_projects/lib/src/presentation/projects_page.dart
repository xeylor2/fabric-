import 'package:core_design_system/core_design_system.dart';
import 'package:flutter/material.dart';

/// M1 placeholder for the Projects module — presentation only, no business
/// logic until its milestone (M11).
class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ModulePlaceholderView(
      icon: Icons.folder_open_outlined,
      moduleName: 'Projects',
      description:
          'Project browser, named versions, and import/export of .febric documents.',
      packageId: 'feature_projects',
      milestone: 'M11',
    );
  }
}
