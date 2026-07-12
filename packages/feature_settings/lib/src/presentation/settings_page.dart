import 'package:core_design_system/core_design_system.dart';
import 'package:feature_settings/src/presentation/sections/about_section.dart';
import 'package:feature_settings/src/presentation/sections/appearance_section.dart';
import 'package:feature_settings/src/presentation/sections/placeholder_section.dart';
import 'package:flutter/material.dart';

/// Settings foundation (M1): functional Appearance (Theme Engine) plus
/// placeholder sections for future milestones.
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 760),
        child: ListView(
          padding: const EdgeInsets.all(FebricSpacing.xxl),
          children: const [
            AppearanceSection(),
            SizedBox(height: FebricSpacing.lg),
            PlaceholderSection(
              header: 'Language',
              icon: Icons.translate_outlined,
              description: 'Interface language and regional formats.',
              milestone: 'Planned',
            ),
            SizedBox(height: FebricSpacing.lg),
            PlaceholderSection(
              header: 'API',
              icon: Icons.cloud_outlined,
              description:
                  'AI provider profiles, health, quotas and key validation '
                  '(API Manager).',
              milestone: 'M6',
            ),
            SizedBox(height: FebricSpacing.lg),
            PlaceholderSection(
              header: 'Workspace',
              icon: Icons.dashboard_customize_outlined,
              description: 'Layout presets, density modes and panel behavior.',
              milestone: 'M6+',
            ),
            SizedBox(height: FebricSpacing.lg),
            PlaceholderSection(
              header: 'Performance',
              icon: Icons.speed_outlined,
              description: 'Rendering diagnostics and cache controls.',
              milestone: 'M4+',
            ),
            SizedBox(height: FebricSpacing.lg),
            AboutSection(),
            SizedBox(height: FebricSpacing.lg),
            PlaceholderSection(
              header: 'Experimental',
              icon: Icons.science_outlined,
              description: 'Early features behind flags.',
              milestone: 'Planned',
            ),
          ],
        ),
      ),
    );
  }
}
