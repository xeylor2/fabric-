import 'dart:math' as math;

import 'package:core_geometry/core_geometry.dart';
import 'package:core_interaction/src/viewport/viewport_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'viewport_animation.freezed.dart';
part 'viewport_animation.g.dart';

/// Animation curves of the interaction foundation (pure functions — the
/// shell drives ticks; this module owns the math so every surface animates
/// identically).
enum ViewportCurve {
  linear('linear', 'Linear'),
  easeOut('ease_out', 'Ease Out'),
  easeInOut('ease_in_out', 'Ease In Out');

  const ViewportCurve(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Transforms linear progress `t ∈ [0, 1]` into eased progress.
  double transform(double t) {
    final x = t.clamp(0.0, 1.0);
    return switch (this) {
      linear => x,
      easeOut => 1 - math.pow(1 - x, 3).toDouble(),
      easeInOut =>
        x < 0.5 ? 4 * x * x * x : 1 - math.pow(-2 * x + 2, 3).toDouble() / 2,
    };
  }

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static ViewportCurve fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown ViewportCurve wire name',
      ),
    );
  }
}

/// A smooth camera transition between two viewport states.
///
/// [stateAt] is deterministic and side-effect free: the shell samples it at
/// its own frame rate. Zoom interpolates **geometrically** (constant
/// perceived rate), offsets and rotation linearly in eased time.
@freezed
abstract class ViewportAnimation with _$ViewportAnimation {
  const factory ViewportAnimation({
    required ViewportState from,
    required ViewportState to,
    @Default(Duration(milliseconds: 240)) Duration duration,
    @Default(ViewportCurve.easeOut) ViewportCurve curve,
  }) = _ViewportAnimation;

  factory ViewportAnimation.fromJson(Map<String, Object?> json) =>
      _$ViewportAnimationFromJson(json);

  const ViewportAnimation._();

  /// The interpolated camera at [elapsed] (clamped to the duration).
  ViewportState stateAt(Duration elapsed) {
    if (duration.inMicroseconds <= 0) {
      return to;
    }
    final t = curve.transform(elapsed.inMicroseconds / duration.inMicroseconds);
    final zoom = from.zoom * math.pow(to.zoom / from.zoom, t).toDouble();
    return to.copyWith(
      zoom: zoom,
      offset: Point2D(
        x: from.offset.x + (to.offset.x - from.offset.x) * t,
        y: from.offset.y + (to.offset.y - from.offset.y) * t,
      ),
      rotation: from.rotation + (to.rotation - from.rotation) * t,
    );
  }

  /// Whether [elapsed] has reached the end of the animation.
  bool isCompleteAt(Duration elapsed) => elapsed >= duration;
}
