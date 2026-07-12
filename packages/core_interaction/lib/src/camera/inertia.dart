import 'dart:math' as math;

import 'package:core_geometry/core_geometry.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'inertia.freezed.dart';
part 'inertia.g.dart';

/// Pan inertia (fling) simulation shared by every editing surface.
///
/// Exponential decay: `velocity(t) = v₀ · e^(−λt)`, giving displacement
/// `d(t) = v₀ · (1 − e^(−λt)) / λ`. Pure math — the shell samples
/// [offsetDeltaAt] per frame and applies it via `ViewportOps.panned`.
@freezed
abstract class InertiaSpec with _$InertiaSpec {
  const factory InertiaSpec({
    /// Release velocity in logical pixels per second.
    required Point2D initialVelocity,

    /// Decay rate λ per second — higher stops sooner.
    @Default(4.5) double friction,

    /// Velocity magnitude (px/s) below which the fling is considered done.
    @Default(20.0) double restVelocity,
  }) = _InertiaSpec;

  factory InertiaSpec.fromJson(Map<String, Object?> json) =>
      _$InertiaSpecFromJson(json);

  const InertiaSpec._();

  double _seconds(Duration elapsed) => elapsed.inMicroseconds / 1e6;

  /// Total pan displacement accumulated by [elapsed].
  Point2D offsetDeltaAt(Duration elapsed) {
    final t = _seconds(elapsed);
    final factor = (1 - math.exp(-friction * t)) / friction;
    return initialVelocity * factor;
  }

  /// Instantaneous velocity at [elapsed].
  Point2D velocityAt(Duration elapsed) {
    return initialVelocity * math.exp(-friction * _seconds(elapsed));
  }

  /// Whether the fling has decayed below [restVelocity].
  bool isDoneAt(Duration elapsed) =>
      velocityAt(elapsed).magnitude < restVelocity;

  /// The displacement this fling converges to (t → ∞).
  Point2D get terminalDelta => initialVelocity / friction;
}
