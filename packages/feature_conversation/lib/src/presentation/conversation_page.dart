import 'package:core_design_system/core_design_system.dart';
import 'package:flutter/material.dart';

/// M1 placeholder for the Conversation module — presentation only, no business
/// logic until its milestone (M9).
class ConversationPage extends StatelessWidget {
  const ConversationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ModulePlaceholderView(
      icon: Icons.forum_outlined,
      moduleName: 'Conversation',
      description:
          'Scoped natural-language editing: intent, target, constraints, plan, preview, approval.',
      packageId: 'feature_conversation',
      milestone: 'M9',
    );
  }
}
