import 'package:core_ai/src/jobs/ai_job.dart';
import 'package:core_textile/core_textile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'credit_estimate.freezed.dart';
part 'credit_estimate.g.dart';

/// A deterministic credit estimate for one [AiJob], produced *before*
/// compute is spent (Architecture V2 §6 step 6: the Execution Plan's
/// "credit estimate"; aligned with invariant I4's pre-compute philosophy).
///
/// Estimates are reproducible facts: [estimatorVersion] is stamped like
/// the frozen `AiProvenanceRecord.constraintVersion`/`toolVersion`.
@freezed
abstract class CreditEstimate with _$CreditEstimate {
  @Assert('credits >= 0', 'credits must be non-negative')
  @Assert(
    'breakdown.isEmpty || '
        'breakdown.values.fold(0, (int a, int b) => a + b) == credits',
    'a non-empty breakdown must sum to credits',
  )
  // Non-const factory: the sum assert requires runtime evaluation, which a
  // const constructor cannot host. The model stays fully immutable.
  factory CreditEstimate({
    /// The job priced.
    required String jobId,

    /// Whole-credit estimate (credits are counted units — the frozen
    /// `core_plugin` permission `use_ai_credits`).
    required int credits,

    /// Named components summing to [credits] — the §6 plan surface shows
    /// the user *why*.
    @Default(<String, int>{}) Map<String, int> breakdown,

    /// Version of the estimator that produced this estimate.
    required String estimatorVersion,

    @Default(<String, Object?>{}) Map<String, Object?> metadata,
  }) = _CreditEstimate;

  factory CreditEstimate.fromJson(Map<String, Object?> json) =>
      _$CreditEstimateFromJson(json);
}

/// The credit-estimation contract: prices an [AiJob] before any compute is
/// spent.
///
/// Deterministic, pure and stateless by contract: [estimate] takes only
/// the job value and returns only an estimate value — same job, same
/// estimate. Implementations hold no mutable state, perform no IO and
/// read no clock. Synchronous by design: estimation is static analysis of
/// a value, never a network call — network pricing belongs to backend
/// layers behind this same seam.
abstract interface class CreditEstimator {
  /// Version stamped into every produced [CreditEstimate.estimatorVersion].
  String get version;

  /// Prices [job]. Pure: identical input yields an identical estimate.
  CreditEstimate estimate(AiJob job);
}

/// Purely architectural reference [CreditEstimator]: deterministic
/// table-lookup mechanics with **no pricing policy of its own**.
///
/// This class ships **no rates**: every number enters by injection
/// ([baseCredits], [perScopeNodeCredits], [version]). It freezes only the
/// estimation *mechanics* — base + perScopeNodeCredits × scope size, with
/// a breakdown naming both components — pure arithmetic structure, zero
/// economic content. Whether pricing is managed, BYOK-tiered,
/// per-provider or per-quota remains entirely open: any future policy
/// source constructs this estimator with its table, or implements
/// [CreditEstimator] directly (`core_ai` stays vendor-blind, §16).
final class TableCreditEstimator implements CreditEstimator {
  TableCreditEstimator({
    required Map<AiOperation, int> baseCredits,
    this.perScopeNodeCredits = 0,
    required this.version,
  }) : _baseCredits = Map.unmodifiable(baseCredits);

  final Map<AiOperation, int> _baseCredits;

  /// Caller-supplied linear scope term (credits per declared scope node).
  final int perScopeNodeCredits;

  @override
  final String version;

  @override
  CreditEstimate estimate(AiJob job) {
    final base = _baseCredits[job.operation];
    if (base == null) {
      // An unpriced operation is a caller error — never a fabricated cost.
      throw ArgumentError.value(
        job.operation.wireName,
        'job',
        'No base credits supplied for this operation',
      );
    }
    final scope = perScopeNodeCredits * job.scopeNodeIds.length;
    return CreditEstimate(
      jobId: job.id,
      credits: base + scope,
      breakdown: {'base': base, 'scope': scope},
      estimatorVersion: version,
    );
  }
}
