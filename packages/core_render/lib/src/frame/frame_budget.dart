import 'package:core_render/src/vocabulary/render_vocabulary.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'frame_budget.freezed.dart';
part 'frame_budget.g.dart';

/// The four separated frame budgets (Rendering Constitution §D), in
/// microseconds. The three phase budgets partition the [frameMicros]
/// envelope; each phase carries its own [OverrunPolicy]. Data only — the
/// Frame Lifecycle enforces these later (M5B-2).
@freezed
abstract class FrameBudget with _$FrameBudget {
  const factory FrameBudget({
    /// Update + cull allowance (graph recompile, damage, culling).
    @Default(4000) int updateMicros,

    /// Record + submit allowance (pass recording, backend submit).
    @Default(8000) int renderMicros,

    /// Composite + present allowance.
    @Default(4000) int presentMicros,

    /// The total frame envelope (16667 ≈ 60fps by default).
    @Default(16667) int frameMicros,

    @JsonKey(fromJson: _policyFromJson, toJson: _policyToJson)
    @Default(OverrunPolicy.defer)
    OverrunPolicy updateOverrun,

    @JsonKey(fromJson: _policyFromJson, toJson: _policyToJson)
    @Default(OverrunPolicy.degradeLod)
    OverrunPolicy renderOverrun,

    @JsonKey(fromJson: _policyFromJson, toJson: _policyToJson)
    @Default(OverrunPolicy.presentLast)
    OverrunPolicy presentOverrun,
  }) = _FrameBudget;

  factory FrameBudget.fromJson(Map<String, Object?> json) =>
      _$FrameBudgetFromJson(json);

  const FrameBudget._();

  /// The OS-wide default interactive budget (≈60fps).
  static const FrameBudget interactive = FrameBudget();

  /// The throughput profile for Production Export: no frame cap (render to
  /// completion). Zero [frameMicros] denotes "uncapped".
  static const FrameBudget throughput = FrameBudget(
    updateMicros: 0,
    renderMicros: 0,
    presentMicros: 0,
    frameMicros: 0,
  );

  /// Whether the three phase budgets fit within the frame envelope. Always
  /// true for the uncapped [throughput] profile.
  bool get phasesWithinFrame =>
      frameMicros == 0 ||
      updateMicros + renderMicros + presentMicros <= frameMicros;

  /// Whether this profile is uncapped (throughput mode).
  bool get isUncapped => frameMicros == 0;
}

OverrunPolicy _policyFromJson(String wireName) =>
    OverrunPolicy.fromWireName(wireName);

String _policyToJson(OverrunPolicy policy) => policy.wireName;
