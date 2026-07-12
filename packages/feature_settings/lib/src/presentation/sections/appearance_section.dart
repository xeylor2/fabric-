import 'package:core_design_system/core_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The functional Theme Engine surface: theme variant, system-follow, and
/// custom accent color. Everything else in Settings is a placeholder (M1).
class AppearanceSection extends ConsumerWidget {
  const AppearanceSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(febricThemeControllerProvider);
    final controller = ref.read(febricThemeControllerProvider.notifier);
    final colors = context.febricColors;
    final text = context.febricText;

    return PanelSurface(
      header: 'Appearance',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Theme', style: text.titleSmall),
          const SizedBox(height: FebricSpacing.md),
          Wrap(
            spacing: FebricSpacing.md,
            runSpacing: FebricSpacing.md,
            children: [
              for (final setting in FebricThemeSetting.values)
                _ThemeChoiceCard(
                  setting: setting,
                  selected: state.setting == setting,
                  onTap: () => controller.setSetting(setting),
                ),
            ],
          ),
          const SizedBox(height: FebricSpacing.xxl),
          Text('Accent color', style: text.titleSmall),
          const SizedBox(height: FebricSpacing.xs),
          Text(
            'Custom accents are contrast-guarded against every theme.',
            style: text.bodySmall!.copyWith(color: colors.inkMuted),
          ),
          const SizedBox(height: FebricSpacing.md),
          Wrap(
            spacing: FebricSpacing.md,
            runSpacing: FebricSpacing.md,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              for (final preset in febricAccentPresets)
                _AccentSwatch(
                  color: preset.color,
                  label: preset.label,
                  selected: state.accentOverride == preset.color,
                  onTap: () => controller.setAccentOverride(preset.color),
                ),
              _CustomAccentButton(
                onPicked: controller.setAccentOverride,
                current: state.accentOverride ?? colors.accent,
              ),
              if (state.accentOverride != null)
                TextButton.icon(
                  onPressed: () => controller.setAccentOverride(null),
                  icon: const Icon(Icons.restart_alt, size: FebricIconSize.sm),
                  label: const Text('Reset to default'),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ThemeChoiceCard extends StatelessWidget {
  const _ThemeChoiceCard({
    required this.setting,
    required this.selected,
    required this.onTap,
  });

  final FebricThemeSetting setting;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.febricColors;
    return Semantics(
      button: true,
      selected: selected,
      label: 'Theme: ${setting.label}',
      child: InkWell(
        onTap: onTap,
        borderRadius: FebricRadius.lgAll,
        child: Container(
          width: 112,
          padding: const EdgeInsets.all(FebricSpacing.xs),
          decoration: BoxDecoration(
            borderRadius: FebricRadius.lgAll,
            border: Border.all(
              color: selected ? colors.accent : colors.hairline,
              width: selected ? 1.5 : 1,
            ),
            color: selected ? colors.surfaceSelected : colors.surface,
          ),
          child: Column(
            children: [
              _ThemePreviewSwatch(setting: setting),
              const SizedBox(height: FebricSpacing.sm),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (selected) ...[
                    Icon(
                      Icons.check_circle,
                      size: FebricIconSize.xs,
                      color: colors.accent,
                    ),
                    const SizedBox(width: FebricSpacing.xs),
                  ],
                  Flexible(
                    child: Text(
                      setting.label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.febricText.labelMedium!.copyWith(
                        color: selected ? colors.ink : colors.inkSecondary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: FebricSpacing.xs),
            ],
          ),
        ),
      ),
    );
  }
}

/// Miniature preview of a variant's surfaces; System shows a split preview.
class _ThemePreviewSwatch extends StatelessWidget {
  const _ThemePreviewSwatch({required this.setting});

  final FebricThemeSetting setting;

  @override
  Widget build(BuildContext context) {
    final variant = setting.fixedVariant;
    if (variant != null) {
      return _VariantMini(colors: buildFebricColors(variant));
    }
    return Row(
      children: [
        Expanded(
          child: _VariantMini(
            colors: buildFebricColors(FebricThemeVariant.light),
            roundRight: false,
          ),
        ),
        Expanded(
          child: _VariantMini(
            colors: buildFebricColors(FebricThemeVariant.dark),
            roundLeft: false,
          ),
        ),
      ],
    );
  }
}

class _VariantMini extends StatelessWidget {
  const _VariantMini({
    required this.colors,
    this.roundLeft = true,
    this.roundRight = true,
  });

  final FebricColors colors;
  final bool roundLeft;
  final bool roundRight;

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(FebricRadius.md);
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: colors.canvas,
        borderRadius: BorderRadius.horizontal(
          left: roundLeft ? radius : Radius.zero,
          right: roundRight ? radius : Radius.zero,
        ),
        border: Border.all(color: colors.hairline),
      ),
      padding: const EdgeInsets.all(FebricSpacing.xs),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 8,
            decoration: BoxDecoration(
              color: colors.panel,
              borderRadius: FebricRadius.xsAll,
              border: Border.all(color: colors.hairline, width: 0.5),
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: colors.accent,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: FebricSpacing.xs),
              Expanded(
                child: Container(
                  height: 4,
                  decoration: BoxDecoration(
                    color: colors.inkMuted,
                    borderRadius: FebricRadius.xsAll,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AccentSwatch extends StatelessWidget {
  const _AccentSwatch({
    required this.color,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final Color color;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.febricColors;
    return Tooltip(
      message: label,
      child: Semantics(
        button: true,
        selected: selected,
        label: 'Accent: $label',
        child: InkWell(
          onTap: onTap,
          customBorder: const CircleBorder(),
          child: Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: selected ? colors.accent : colors.hairline,
                width: selected ? 2 : 1,
              ),
            ),
            padding: const EdgeInsets.all(3),
            child: DecoratedBox(
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomAccentButton extends StatelessWidget {
  const _CustomAccentButton({required this.onPicked, required this.current});

  final ValueChanged<Color?> onPicked;
  final Color current;

  @override
  Widget build(BuildContext context) {
    final colors = context.febricColors;
    return Tooltip(
      message: 'Custom accent…',
      child: InkWell(
        onTap: () async {
          final picked = await showDialog<Color>(
            context: context,
            builder: (_) => _CustomAccentDialog(initial: current),
          );
          if (picked != null) {
            onPicked(picked);
          }
        },
        customBorder: const CircleBorder(),
        child: Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: colors.hairlineStrong),
            gradient: SweepGradient(
              colors: [
                for (final preset in febricAccentPresets) preset.color,
                febricAccentPresets.first.color,
              ],
            ),
          ),
          child: Icon(
            Icons.add,
            size: FebricIconSize.sm,
            color: colors.onAccent,
          ),
        ),
      ),
    );
  }
}

/// Minimal HSL picker — enough to prove the custom-accent pipeline; a full
/// picker ships with the Theme Engine milestone.
class _CustomAccentDialog extends StatefulWidget {
  const _CustomAccentDialog({required this.initial});

  final Color initial;

  @override
  State<_CustomAccentDialog> createState() => _CustomAccentDialogState();
}

class _CustomAccentDialogState extends State<_CustomAccentDialog> {
  late HSLColor _hsl = HSLColor.fromColor(widget.initial);

  @override
  Widget build(BuildContext context) {
    final colors = context.febricColors;
    final color = _hsl.toColor();
    return AlertDialog(
      title: const Text('Custom accent'),
      content: SizedBox(
        width: 320,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: FebricRadius.mdAll,
                    border: Border.all(color: colors.hairline),
                  ),
                ),
                const SizedBox(width: FebricSpacing.md),
                Text(
                  '#${color.toARGB32().toRadixString(16).substring(2).toUpperCase()}',
                  style: context.febricText.bodyMedium,
                ),
              ],
            ),
            const SizedBox(height: FebricSpacing.lg),
            _slider(
              'Hue',
              _hsl.hue,
              360,
              (v) => setState(() => _hsl = _hsl.withHue(v)),
            ),
            _slider(
              'Saturation',
              _hsl.saturation,
              1,
              (v) => setState(() => _hsl = _hsl.withSaturation(v)),
            ),
            _slider(
              'Lightness',
              _hsl.lightness,
              1,
              (v) => setState(() => _hsl = _hsl.withLightness(v)),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () => Navigator.of(context).pop(color),
          child: const Text('Apply'),
        ),
      ],
    );
  }

  Widget _slider(
    String label,
    double value,
    double max,
    ValueChanged<double> onChanged,
  ) {
    return Row(
      children: [
        SizedBox(
          width: 76,
          child: Text(label, style: context.febricText.bodySmall),
        ),
        Expanded(
          child: Slider(value: value, max: max, onChanged: onChanged),
        ),
      ],
    );
  }
}
