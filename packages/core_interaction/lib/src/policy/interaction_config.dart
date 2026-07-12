import 'package:core_interaction/src/viewport/zoom_constraints.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'interaction_config.freezed.dart';
part 'interaction_config.g.dart';

/// Tunable — but universal — interaction parameters.
///
/// One config governs every editing surface; tools receive it, they never
/// define their own (ADR-0003).
@freezed
abstract class InteractionConfig with _$InteractionConfig {
  const factory InteractionConfig({
    /// The zoom envelope applied to all viewport mutations.
    @Default(ZoomConstraints.standard) ZoomConstraints constraints,

    /// When true (default, Figma-style), a bare wheel pans and
    /// Ctrl/Cmd+wheel zooms; when false, a bare wheel zooms.
    /// Either way "Mouse Wheel Zoom" is always available.
    @Default(true) bool wheelZoomRequiresModifier,

    /// Exponential zoom sensitivity per wheel scroll unit.
    @Default(0.002) double wheelZoomSensitivity,

    /// Friction (1/s) for pan inertia simulations.
    @Default(4.0) double inertiaFriction,
  }) = _InteractionConfig;

  factory InteractionConfig.fromJson(Map<String, Object?> json) =>
      _$InteractionConfigFromJson(json);

  const InteractionConfig._();

  /// The OS-wide default configuration.
  static const InteractionConfig standard = InteractionConfig();
}
