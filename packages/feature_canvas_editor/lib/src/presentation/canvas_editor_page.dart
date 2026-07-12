import 'package:core_design_system/core_design_system.dart';
import 'package:flutter/material.dart';

/// M1 placeholder for the Canvas module — presentation only, no business
/// logic until its milestone (M4).
class CanvasEditorPage extends StatelessWidget {
  const CanvasEditorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ModulePlaceholderView(
      icon: Icons.design_services_outlined,
      moduleName: 'Canvas',
      description:
          'The element-level editing surface: selection, transforms, zones and node-scoped repeats.',
      packageId: 'feature_canvas_editor',
      milestone: 'M4',
    );
  }
}
