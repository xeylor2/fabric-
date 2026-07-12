import 'package:core_design_system/core_design_system.dart';
import 'package:flutter/material.dart';

/// M1 placeholder for the Production module — presentation only, no business
/// logic until its milestone (M12).
class ProductionPage extends StatelessWidget {
  const ProductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ModulePlaceholderView(
      icon: Icons.print_outlined,
      moduleName: 'Production',
      description:
          'Preflight, CMYK color management, TIFF/PNG/PDF export and factory preview.',
      packageId: 'feature_production',
      milestone: 'M12',
    );
  }
}
