import 'package:core_render/src/vocabulary/render_vocabulary.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'render_metrics.freezed.dart';
part 'render_metrics.g.dart';

/// An immutable per-frame metrics snapshot (Rendering Constitution §G).
///
/// Observation is side-effect-free: producing a snapshot never alters a
/// frame. Deterministic metrics (scene/graph counts) may be asserted exactly
/// in tests; runtime-variable metrics (timing/memory/scheduler) are telemetry
/// only. Keys are the frozen `RenderMetricKind` vocabulary; values are
/// numbers. Pushed to a `RenderMetricsSink` (interface, this milestone).
@freezed
abstract class RenderMetrics with _$RenderMetrics {
  const factory RenderMetrics({
    /// The frame this snapshot describes (deterministic identity).
    @Default(0) int frameId,

    /// Metric values keyed by wire name (`RenderMetricKind.wireName`).
    @Default(<String, num>{}) Map<String, num> values,
  }) = _RenderMetrics;

  factory RenderMetrics.fromJson(Map<String, Object?> json) =>
      _$RenderMetricsFromJson(json);

  const RenderMetrics._();

  /// Reads a metric by kind, or null if absent.
  num? valueOf(RenderMetricKind kind) => values[kind.wireName];

  /// A copy with [kind] set to [value].
  RenderMetrics withMetric(RenderMetricKind kind, num value) =>
      copyWith(values: {...values, kind.wireName: value});
}
