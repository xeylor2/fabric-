import 'package:core_design_system/core_design_system.dart';
import 'package:flutter/material.dart';

/// M1 placeholder for the Inspector module — presentation only, no business
/// logic until its milestone (M7).
class InspectorPage extends StatelessWidget {
  const InspectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ModulePlaceholderView(
      icon: Icons.document_scanner_outlined,
      moduleName: 'Inspector',
      description:
          'Upload artwork and FEBRIC detects garment, motifs, borders, repeat and palette - staged into the Design Tree.',
      packageId: 'feature_inspector',
      milestone: 'M7',
    );
  }
}
