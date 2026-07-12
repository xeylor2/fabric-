import 'package:core_design_system/core_design_system.dart';
import 'package:feature_settings/src/presentation/settings_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Settings → About: application identity and blueprint status.
class AboutSection extends ConsumerWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final info = ref.watch(settingsAboutInfoProvider);
    return PanelSurface(
      header: 'About',
      child: Column(
        children: [
          _InfoRow(label: 'Application', value: info.appName),
          _InfoRow(label: 'Version', value: info.version),
          _InfoRow(label: 'Environment', value: info.environment),
          _InfoRow(label: 'Milestone', value: info.milestone),
          _InfoRow(label: 'Blueprint', value: info.blueprint),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final colors = context.febricColors;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: FebricSpacing.xs),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: context.febricText.bodySmall!.copyWith(
                color: colors.inkMuted,
              ),
            ),
          ),
          Expanded(child: Text(value, style: context.febricText.bodyMedium)),
        ],
      ),
    );
  }
}
