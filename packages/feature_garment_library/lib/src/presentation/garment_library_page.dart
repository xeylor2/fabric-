import 'package:core_design_system/core_design_system.dart';
import 'package:flutter/material.dart';

/// M1 placeholder for the Library module — presentation only, no business
/// logic until its milestone (M3).
class GarmentLibraryPage extends StatelessWidget {
  const GarmentLibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ModulePlaceholderView(
      icon: Icons.checkroom_outlined,
      moduleName: 'Library',
      description:
          'Pakistani, Indian, luxury and seasonal garment templates - start any design from a structured garment.',
      packageId: 'feature_garment_library',
      milestone: 'M3',
    );
  }
}
