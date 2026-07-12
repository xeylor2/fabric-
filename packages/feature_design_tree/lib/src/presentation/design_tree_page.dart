import 'package:core_design_system/core_design_system.dart';
import 'package:flutter/material.dart';

/// M1 placeholder for the Design Tree module — presentation only, no business
/// logic until its milestone (M2).
class DesignTreePage extends StatelessWidget {
  const DesignTreePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ModulePlaceholderView(
      icon: Icons.account_tree_outlined,
      moduleName: 'Design Tree',
      description:
          'Every garment part and textile element as an editable, lockable, versionable node.',
      packageId: 'feature_design_tree',
      milestone: 'M2',
    );
  }
}
