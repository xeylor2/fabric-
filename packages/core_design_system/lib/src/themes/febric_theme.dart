import 'package:core_design_system/src/themes/febric_palettes.dart';
import 'package:core_design_system/src/themes/febric_theme_variant.dart';
import 'package:core_design_system/src/tokens/febric_elevation.dart';
import 'package:core_design_system/src/tokens/febric_radius.dart';
import 'package:core_design_system/src/tokens/febric_spacing.dart';
import 'package:core_design_system/src/tokens/febric_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Builds Material [ThemeData] entirely from FEBRIC tokens.
/// No widget should ever hardcode a color — everything flows from here.
abstract final class FebricTheme {
  static ThemeData build(FebricThemeVariant variant, {Color? accentOverride}) {
    final colors = buildFebricColors(variant, accentOverride: accentOverride);
    final brightness = variant.brightness;
    final textTheme = FebricTypography.textTheme(
      colors.ink,
      colors.inkSecondary,
    );

    final scheme = ColorScheme(
      brightness: brightness,
      primary: colors.accent,
      onPrimary: colors.onAccent,
      primaryContainer: colors.accentSoft,
      onPrimaryContainer: colors.ink,
      secondary: colors.accent,
      onSecondary: colors.onAccent,
      secondaryContainer: colors.surfaceSelected,
      onSecondaryContainer: colors.ink,
      error: colors.danger,
      onError: colors.onAccent,
      surface: colors.panel,
      onSurface: colors.ink,
      surfaceContainerLowest: colors.canvas,
      surfaceContainerLow: colors.canvas,
      surfaceContainer: colors.panel,
      surfaceContainerHigh: colors.surface,
      surfaceContainerHighest: colors.surface,
      onSurfaceVariant: colors.inkSecondary,
      outline: colors.hairlineStrong,
      outlineVariant: colors.hairline,
      shadow: const Color(0xFF000000),
      scrim: colors.scrim,
      inverseSurface: colors.ink,
      onInverseSurface: colors.canvas,
      inversePrimary: colors.accentSoft,
      surfaceTint: Colors.transparent,
    );

    final overlayStyle = variant.isDark
        ? SystemUiOverlayStyle.light.copyWith(
            statusBarColor: Colors.transparent,
            systemNavigationBarColor: Colors.transparent,
          )
        : SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: Colors.transparent,
            systemNavigationBarColor: Colors.transparent,
          );

    return ThemeData(
      colorScheme: scheme,
      textTheme: textTheme,
      scaffoldBackgroundColor: colors.canvas,
      canvasColor: colors.panel,
      splashFactory: InkRipple.splashFactory,
      splashColor: colors.accent.withValues(alpha: 0.08),
      highlightColor: Colors.transparent,
      hoverColor: colors.surfaceHover,
      focusColor: colors.focusRing,
      dividerColor: colors.hairline,
      dividerTheme: DividerThemeData(
        color: colors.hairline,
        thickness: 1,
        space: 1,
      ),
      iconTheme: IconThemeData(color: colors.inkSecondary, size: 20),
      appBarTheme: AppBarTheme(
        backgroundColor: colors.panel,
        foregroundColor: colors.ink,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: textTheme.titleMedium,
        systemOverlayStyle: overlayStyle,
        shape: Border(bottom: BorderSide(color: colors.hairline)),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: colors.panel,
        indicatorColor: colors.accentSoft,
        height: 64,
        elevation: 0,
        labelTextStyle: WidgetStatePropertyAll(textTheme.labelMedium),
        iconTheme: WidgetStateProperty.resolveWith(
          (states) => IconThemeData(
            size: 20,
            color: states.contains(WidgetState.selected)
                ? colors.accent
                : colors.inkSecondary,
          ),
        ),
      ),
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: colors.panel,
        indicatorColor: colors.accentSoft,
        selectedIconTheme: IconThemeData(color: colors.accent, size: 20),
        unselectedIconTheme: IconThemeData(
          color: colors.inkSecondary,
          size: 20,
        ),
        selectedLabelTextStyle: textTheme.labelMedium!.copyWith(
          color: colors.ink,
        ),
        unselectedLabelTextStyle: textTheme.labelMedium,
      ),
      listTileTheme: ListTileThemeData(
        dense: true,
        iconColor: colors.inkSecondary,
        textColor: colors.ink,
        shape: const RoundedRectangleBorder(borderRadius: FebricRadius.mdAll),
      ),
      tooltipTheme: TooltipThemeData(
        waitDuration: const Duration(milliseconds: 400),
        decoration: BoxDecoration(
          color: variant.isDark ? colors.surface : colors.ink,
          borderRadius: FebricRadius.smAll,
          border: Border.all(color: colors.hairlineStrong),
          boxShadow: FebricElevation.level2(brightness),
        ),
        textStyle: textTheme.bodySmall!.copyWith(
          color: variant.isDark ? colors.ink : colors.canvas,
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: colors.surface,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: FebricRadius.lgAll,
          side: BorderSide(color: colors.hairline),
        ),
        titleTextStyle: textTheme.titleLarge,
        contentTextStyle: textTheme.bodyMedium,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colors.surface,
        surfaceTintColor: Colors.transparent,
        modalBarrierColor: colors.scrim,
        shape: const RoundedRectangleBorder(
          borderRadius: FebricRadius.sheetTop,
        ),
        showDragHandle: true,
        dragHandleColor: colors.hairlineStrong,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.canvas,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: FebricSpacing.md,
          vertical: FebricSpacing.sm,
        ),
        hintStyle: textTheme.bodyMedium!.copyWith(color: colors.inkMuted),
        border: OutlineInputBorder(
          borderRadius: FebricRadius.mdAll,
          borderSide: BorderSide(color: colors.hairline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: FebricRadius.mdAll,
          borderSide: BorderSide(color: colors.hairline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: FebricRadius.mdAll,
          borderSide: BorderSide(color: colors.accent, width: 1.5),
        ),
      ),
      scrollbarTheme: ScrollbarThemeData(
        thickness: const WidgetStatePropertyAll(6),
        radius: const Radius.circular(FebricRadius.sm),
        thumbColor: WidgetStatePropertyAll(colors.hairlineStrong),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: variant.isDark ? colors.surface : colors.ink,
        contentTextStyle: textTheme.bodyMedium!.copyWith(
          color: variant.isDark ? colors.ink : colors.canvas,
        ),
        behavior: SnackBarBehavior.floating,
        shape: const RoundedRectangleBorder(borderRadius: FebricRadius.mdAll),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? colors.onAccent
              : colors.inkSecondary,
        ),
        trackColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? colors.accent
              : colors.hairlineStrong,
        ),
        trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colors.accent,
          textStyle: textTheme.labelLarge,
          shape: const RoundedRectangleBorder(borderRadius: FebricRadius.mdAll),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: colors.accent,
          foregroundColor: colors.onAccent,
          textStyle: textTheme.labelLarge,
          shape: const RoundedRectangleBorder(borderRadius: FebricRadius.mdAll),
        ),
      ),
      extensions: <ThemeExtension<dynamic>>[colors],
    );
  }
}
