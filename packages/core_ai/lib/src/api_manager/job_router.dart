import 'package:core_ai/src/api_manager/provider_profile.dart';
import 'package:core_ai/src/jobs/ai_job.dart';
import 'package:core_ai/src/prompt/ai_provider_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_router.freezed.dart';
part 'job_router.g.dart';

/// Why routing produced no candidate — the three §10 filter axes.
///
/// Frozen initial set; append-only. Absence of a provider is an outcome,
/// never an exception (the frozen `CommandResult.rejected` philosophy).
enum NoRouteReason {
  /// No profiles were supplied at all.
  noProfiles('no_profiles', 'No Profiles'),

  /// No profile serves the job's required capabilities.
  capabilityUnmatched('capability_unmatched', 'Capability Unmatched'),

  /// Capability-matched profiles exist, but none is eligible
  /// (health/circuit/quota/validity).
  allIneligible('all_ineligible', 'All Ineligible');

  const NoRouteReason(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static NoRouteReason fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown NoRouteReason wire name',
      ),
    );
  }
}

/// One ranked routing candidate. The full ranked list makes failover
/// structural: the orchestrator walks it without re-routing.
@freezed
abstract class RoutedCandidate with _$RoutedCandidate {
  const factory RoutedCandidate({
    /// The [ProviderProfile.id] this candidate refers to.
    required String profileId,

    /// The candidate's provider (frozen vocabulary).
    @JsonKey(fromJson: _providerFromJson, toJson: _providerToJson)
    required AiProviderId provider,

    /// The profile's first-preference model, or null when the profile
    /// lists none (the orchestrator then picks concretely).
    String? model,

    /// 0-based rank (0 = best).
    required int rank,
  }) = _RoutedCandidate;

  factory RoutedCandidate.fromJson(Map<String, Object?> json) =>
      _$RoutedCandidateFromJson(json);
}

/// The outcome of routing one [AiJob] over a set of [ProviderProfile]s
/// (sealed union — the frozen `CommandResult` precedent).
@Freezed(unionKey: 'kind')
sealed class RoutingDecision with _$RoutingDecision {
  /// At least one eligible candidate exists. [job] is the input job with
  /// `provider`/`model` stamped from `candidates.first` (invariant I5)
  /// and its status advanced planned → queued via the frozen
  /// `AiJob.withStatus`. [candidates] is the full ranked list (failover
  /// is structural).
  const factory RoutingDecision.routed({
    required AiJob job,
    required List<RoutedCandidate> candidates,
  }) = RoutingRouted;

  /// No eligible candidate. The caller keeps its untouched `planned` job.
  const factory RoutingDecision.noRoute({
    @JsonKey(fromJson: _reasonFromJson, toJson: _reasonToJson)
    required NoRouteReason reason,

    /// Human-readable detail for UI/telemetry.
    String? detail,
  }) = RoutingNoRoute;

  factory RoutingDecision.fromJson(Map<String, Object?> json) =>
      _$RoutingDecisionFromJson(json);
}

/// Injected ranking policy — the M12B `TableCreditEstimator` doctrine:
/// mechanics frozen, policy injected, no frozen weights.
///
/// Pure: same (job, profile) → same score; higher wins. A future
/// cost-aware policy may wrap the frozen M12B `CreditEstimator` seam —
/// the router itself never prices anything.
abstract interface class RoutingPolicy {
  /// Version stamped nowhere by M12C but exposed so decisions are
  /// attributable by callers that log them.
  String get version;

  /// Scores [profile] for [job]; higher ranks earlier. Pure.
  int score(AiJob job, ProviderProfile profile);
}

/// The routing contract: the pure decision
/// `(AiJob, profiles) → RoutingDecision` — the §19 "API Manager routing"
/// node between plan-time (M12B jobs) and execution (future orchestrator).
///
/// Deterministic and synchronous by contract: values in, decision out —
/// no IO, no clock, no state, input list order irrelevant.
abstract interface class JobRouter {
  /// Routes [job] over [profiles].
  ///
  /// [job] must be [AiJobStatus.planned]; anything else throws
  /// [StateError] — routing *is* the planned → queued step.
  RoutingDecision route(AiJob job, List<ProviderProfile> profiles);
}

/// Reference [JobRouter]: the §10 filter/rank pipeline with **no scoring
/// numbers of its own**.
///
/// 1. Guard — the job must be `planned`.
/// 2. Filter — capability superset ([ProviderProfile.supports]) and
///    eligibility ([ProviderProfile.isRoutable]).
/// 3. Rank — by the injected [RoutingPolicy] (higher score first) or,
///    absent one, the neutral documented ordering: `healthy` before
///    `degraded`, then ascending profile id. Ties always break by
///    ascending id — a pure function of the input set, independent of
///    list order (the frozen overlay paint-order precedent).
/// 4. Decide — survivors → routed (stamp + queue via the frozen
///    `withStatus`); none → a typed no-route outcome.
final class CapabilityJobRouter implements JobRouter {
  // ignore: prefer_initializing_formals
  CapabilityJobRouter({RoutingPolicy? policy}) : _policy = policy;

  final RoutingPolicy? _policy;

  @override
  RoutingDecision route(AiJob job, List<ProviderProfile> profiles) {
    if (job.status != AiJobStatus.planned) {
      throw StateError(
        'Only a planned job can be routed; '
        '"${job.id}" is ${job.status.wireName}',
      );
    }
    if (profiles.isEmpty) {
      return const RoutingDecision.noRoute(reason: NoRouteReason.noProfiles);
    }

    final capable = profiles
        .where((p) => p.supports(job.requiredCapabilities))
        .toList();
    if (capable.isEmpty) {
      return const RoutingDecision.noRoute(
        reason: NoRouteReason.capabilityUnmatched,
      );
    }

    final eligible = capable.where((p) => p.isRoutable).toList();
    if (eligible.isEmpty) {
      return const RoutingDecision.noRoute(reason: NoRouteReason.allIneligible);
    }

    eligible.sort(_compare(job));
    final candidates = [
      for (final (i, p) in eligible.indexed)
        RoutedCandidate(
          profileId: p.id,
          provider: p.provider,
          model: p.models.isEmpty ? null : p.models.first,
          rank: i,
        ),
    ];

    final best = candidates.first;
    final routed = job
        .copyWith(provider: best.provider, model: best.model)
        .withStatus(AiJobStatus.queued);
    return RoutingDecision.routed(job: routed, candidates: candidates);
  }

  /// Deterministic comparator: injected policy score (higher first) or
  /// the neutral ordering (healthy before degraded); ascending profile id
  /// always breaks ties.
  Comparator<ProviderProfile> _compare(AiJob job) {
    final policy = _policy;
    return (a, b) {
      final byScore = policy == null
          ? _neutralOrder(a).compareTo(_neutralOrder(b))
          : policy.score(job, b).compareTo(policy.score(job, a));
      return byScore != 0 ? byScore : a.id.compareTo(b.id);
    };
  }

  /// Neutral ordering rank: not a weight, a documented ordering —
  /// `healthy` (0) sorts before `degraded` (1).
  static int _neutralOrder(ProviderProfile p) =>
      p.health.status == HealthStatus.healthy ? 0 : 1;
}

AiProviderId _providerFromJson(String wireName) =>
    AiProviderId.fromWireName(wireName);

String _providerToJson(AiProviderId provider) => provider.wireName;

NoRouteReason _reasonFromJson(String wireName) =>
    NoRouteReason.fromWireName(wireName);

String _reasonToJson(NoRouteReason reason) => reason.wireName;
