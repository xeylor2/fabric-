import 'package:core_ai/core_ai.dart';
import 'package:core_textile/core_textile.dart';
import 'package:test/test.dart';

/// M12C verification suite — JobRouter.
///
/// Any scoring below is TEST-SUPPLIED policy: the router ships no weights
/// (the approved injected-policy design).
void main() {
  group('freeze — NoRouteReason vocabulary', () {
    test('wire names are frozen — the three §10 filter axes', () {
      expect(NoRouteReason.values.map((v) => v.wireName), [
        'no_profiles',
        'capability_unmatched',
        'all_ineligible',
      ]);
      for (final v in NoRouteReason.values) {
        expect(NoRouteReason.fromWireName(v.wireName), v);
      }
      expect(
        () => NoRouteReason.fromWireName('rate_limited'),
        throwsArgumentError,
      );
    });
  });

  group('freeze — decision JSON round-trips (sealed union)', () {
    test('routed decision round-trips', () {
      final routed = CapabilityJobRouter().route(_job(id: 'j-json'), [
        _profile(id: 'a'),
      ]);
      expect(RoutingDecision.fromJson(routed.toJson()), routed);
      expect(routed.toJson()['kind'], 'routed');
    });

    test('noRoute decision round-trips with wire-named reason', () {
      const decision = RoutingDecision.noRoute(
        reason: NoRouteReason.allIneligible,
        detail: 'circuit open everywhere',
      );
      expect(RoutingDecision.fromJson(decision.toJson()), decision);
      expect(decision.toJson()['reason'], 'all_ineligible');
    });

    test('RoutedCandidate round-trips', () {
      const candidate = RoutedCandidate(
        profileId: 'prof-1',
        provider: AiProviderId.gemini,
        model: 'gemini-x',
        rank: 0,
      );
      expect(RoutedCandidate.fromJson(candidate.toJson()), candidate);
    });
  });

  group('guard', () {
    test('routing a non-planned job throws StateError', () {
      final queued = _job(id: 'j-q').withStatus(AiJobStatus.queued);
      expect(
        () => CapabilityJobRouter().route(queued, [_profile(id: 'a')]),
        throwsStateError,
      );
    });
  });

  group('filter — the §10 axes with typed reasons', () {
    test('empty input → noProfiles', () {
      final d = CapabilityJobRouter().route(_job(id: 'j'), const []);
      expect((d as RoutingNoRoute).reason, NoRouteReason.noProfiles);
    });

    test('missing one required capability excludes → capabilityUnmatched', () {
      final d = CapabilityJobRouter().route(
        _job(
          id: 'j',
          capabilities: const {
            AiCapability.imageGeneration,
            AiCapability.inpainting,
          },
        ),
        [
          _profile(id: 'a', capabilities: const {AiCapability.imageGeneration}),
        ],
      );
      expect((d as RoutingNoRoute).reason, NoRouteReason.capabilityUnmatched);
    });

    test('open circuit / exhausted quota / invalid key → allIneligible', () {
      final d = CapabilityJobRouter().route(_job(id: 'j'), [
        _profile(id: 'a').copyWith(
          health: const ProviderHealth(
            status: HealthStatus.healthy,
            circuit: CircuitState.open,
          ),
        ),
        _profile(
          id: 'b',
        ).copyWith(quota: const ProviderQuota(used: 9, limit: 9)),
        _profile(
          id: 'c',
        ).copyWith(validity: const ProviderValidity(keyValid: false)),
      ]);
      expect((d as RoutingNoRoute).reason, NoRouteReason.allIneligible);
    });
  });

  group('routed result', () {
    test('stamps provider/model from candidates.first and queues via the '
        'frozen lifecycle; original job unmutated', () {
      final job = _job(id: 'j-r');
      final d = CapabilityJobRouter().route(job, [
        _profile(id: 'b', models: const ['m-b1', 'm-b2']),
        _profile(id: 'a', models: const ['m-a1']),
      ]);
      final routed = d as RoutingRouted;
      // Neutral order: both healthy → ascending id; 'a' wins.
      expect(routed.candidates.map((c) => c.profileId), ['a', 'b']);
      expect(routed.candidates.map((c) => c.rank), [0, 1]);
      expect(routed.job.provider, AiProviderId.claude);
      expect(routed.job.model, 'm-a1');
      expect(routed.job.status, AiJobStatus.queued);
      // Immutability: the caller's instance is untouched.
      expect(job.status, AiJobStatus.planned);
      expect(job.provider, isNull);
    });

    test('profile without models → model stays null (orchestrator picks)', () {
      final d = CapabilityJobRouter().route(_job(id: 'j-nm'), [
        _profile(id: 'a'),
      ]);
      expect((d as RoutingRouted).job.model, isNull);
      expect(d.candidates.single.model, isNull);
    });
  });

  group('determinism', () {
    test('same job + same profiles in ANY list order → identical decision, '
        'across calls and fresh routers', () {
      final job = _job(id: 'j-det');
      final profiles = [
        _profile(id: 'c', health: HealthStatus.degraded),
        _profile(id: 'a'),
        _profile(id: 'b'),
      ];
      final d1 = CapabilityJobRouter().route(job, profiles);
      final d2 = CapabilityJobRouter().route(job, profiles.reversed.toList());
      final d3 = CapabilityJobRouter().route(job, [
        profiles[1],
        profiles[2],
        profiles[0],
      ]);
      expect(d1, d2);
      expect(d2, d3);
    });

    test('neutral ordering: healthy before degraded, then ascending id', () {
      final d = CapabilityJobRouter().route(_job(id: 'j-n'), [
        _profile(id: 'a', health: HealthStatus.degraded),
        _profile(id: 'z'),
        _profile(id: 'm'),
      ]);
      expect((d as RoutingRouted).candidates.map((c) => c.profileId), [
        'm',
        'z',
        'a',
      ]);
    });
  });

  group('policy injection — no frozen weights', () {
    test('a test-supplied policy reorders candidates', () {
      final d = CapabilityJobRouter(
        policy: _PreferId('z'),
      ).route(_job(id: 'j-p'), [_profile(id: 'a'), _profile(id: 'z')]);
      expect((d as RoutingRouted).candidates.map((c) => c.profileId), [
        'z',
        'a',
      ]);
      expect(d.job.provider, AiProviderId.claude);
    });

    test('policy ties still break by ascending id (order-independent)', () {
      final flat = _FlatPolicy();
      final d1 = CapabilityJobRouter(
        policy: flat,
      ).route(_job(id: 'j-t'), [_profile(id: 'b'), _profile(id: 'a')]);
      final d2 = CapabilityJobRouter(
        policy: flat,
      ).route(_job(id: 'j-t'), [_profile(id: 'a'), _profile(id: 'b')]);
      expect(d1, d2);
      expect((d1 as RoutingRouted).candidates.map((c) => c.profileId), [
        'a',
        'b',
      ]);
    });

    test('policy version is attributable', () {
      expect(_PreferId('z').version, 'test-prefer-1.0.0');
    });
  });
}

/// Test-only policy: strongly prefers one profile id.
final class _PreferId implements RoutingPolicy {
  _PreferId(this.preferred);

  final String preferred;

  @override
  String get version => 'test-prefer-1.0.0';

  @override
  int score(AiJob job, ProviderProfile profile) =>
      profile.id == preferred ? 100 : 0;
}

/// Test-only policy: scores everything equally (tie-break exercise).
final class _FlatPolicy implements RoutingPolicy {
  @override
  String get version => 'test-flat-1.0.0';

  @override
  int score(AiJob job, ProviderProfile profile) => 7;
}

AiJob _job({
  required String id,
  Set<AiCapability> capabilities = const {AiCapability.imageGeneration},
}) {
  return AiJob(
    id: id,
    operation: AiOperation.motifRefinement,
    scopeNodeIds: const ['node-1'],
    promptHash: 'sha256:m12c',
    requiredCapabilities: capabilities,
  );
}

ProviderProfile _profile({
  required String id,
  Set<AiCapability> capabilities = const {AiCapability.imageGeneration},
  List<String> models = const [],
  HealthStatus health = HealthStatus.healthy,
}) {
  return ProviderProfile(
    id: id,
    provider: AiProviderId.claude,
    mode: ProviderMode.managed,
    capabilities: capabilities,
    models: models,
    health: ProviderHealth(status: health),
  );
}
