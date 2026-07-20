import 'package:core_ai/core_ai.dart';
import 'package:test/test.dart';

/// M12C verification suite — ProviderProfile, health, circuit, quota.
void main() {
  group('freeze — vocabularies', () {
    test('ProviderMode wire names are frozen — managed, byok', () {
      expect(ProviderMode.values.map((v) => v.wireName), ['managed', 'byok']);
      for (final v in ProviderMode.values) {
        expect(ProviderMode.fromWireName(v.wireName), v);
      }
      expect(() => ProviderMode.fromWireName('trial'), throwsArgumentError);
    });

    test('HealthStatus wire names are frozen', () {
      expect(HealthStatus.values.map((v) => v.wireName), [
        'healthy',
        'degraded',
        'unhealthy',
        'unknown',
      ]);
      for (final v in HealthStatus.values) {
        expect(HealthStatus.fromWireName(v.wireName), v);
      }
      expect(() => HealthStatus.fromWireName('down'), throwsArgumentError);
    });

    test('CircuitState wire names are frozen — closed, open, half_open', () {
      expect(CircuitState.values.map((v) => v.wireName), [
        'closed',
        'open',
        'half_open',
      ]);
      for (final v in CircuitState.values) {
        expect(CircuitState.fromWireName(v.wireName), v);
      }
      expect(() => CircuitState.fromWireName('tripped'), throwsArgumentError);
    });
  });

  group('circuit machine — the §10 breaker cycle as data', () {
    test('exhaustive canTransitionTo matrix', () {
      const legal = {
        (CircuitState.closed, CircuitState.open),
        (CircuitState.open, CircuitState.halfOpen),
        (CircuitState.halfOpen, CircuitState.closed),
        (CircuitState.halfOpen, CircuitState.open),
      };
      for (final from in CircuitState.values) {
        for (final to in CircuitState.values) {
          expect(
            from.canTransitionTo(to),
            legal.contains((from, to)),
            reason: '${from.wireName} → ${to.wireName}',
          );
        }
      }
    });
  });

  group('eligibility queries', () {
    test('HealthStatus.isEligible truth table', () {
      expect(HealthStatus.healthy.isEligible, isTrue);
      expect(HealthStatus.degraded.isEligible, isTrue);
      expect(HealthStatus.unhealthy.isEligible, isFalse);
      expect(HealthStatus.unknown.isEligible, isFalse);
    });

    test('ProviderHealth.isEligible — half-open admits trial traffic', () {
      const h = ProviderHealth(status: HealthStatus.healthy);
      expect(h.isEligible, isTrue);
      expect(h.copyWith(circuit: CircuitState.open).isEligible, isFalse);
      expect(h.copyWith(circuit: CircuitState.halfOpen).isEligible, isTrue);
      expect(h.copyWith(status: HealthStatus.unhealthy).isEligible, isFalse);
    });

    test('ProviderQuota — isExhausted boundary and remaining floor', () {
      const q = ProviderQuota(used: 3, limit: 10);
      expect(q.isExhausted, isFalse);
      expect(q.remaining, 7);
      const boundary = ProviderQuota(used: 10, limit: 10);
      expect(boundary.isExhausted, isTrue);
      expect(boundary.remaining, 0);
      const over = ProviderQuota(used: 12, limit: 10);
      expect(over.isExhausted, isTrue);
      expect(over.remaining, 0);
    });

    test('ProviderQuota asserts — negative used, non-positive limit', () {
      expect(
        () => ProviderQuota(used: -1, limit: 10),
        throwsA(isA<AssertionError>()),
      );
      expect(
        () => ProviderQuota(used: 0, limit: 0),
        throwsA(isA<AssertionError>()),
      );
    });

    test('isRoutable over health × circuit × quota × validity', () {
      final base = _profile(id: 'p');
      expect(base.isRoutable, isTrue); // fresh default: healthy/closed
      expect(
        base
            .copyWith(
              health: const ProviderHealth(status: HealthStatus.unknown),
            )
            .isRoutable,
        isFalse,
      );
      expect(
        base
            .copyWith(
              health: const ProviderHealth(
                status: HealthStatus.healthy,
                circuit: CircuitState.open,
              ),
            )
            .isRoutable,
        isFalse,
      );
      expect(
        base.copyWith(quota: const ProviderQuota(used: 5, limit: 5)).isRoutable,
        isFalse,
      );
      expect(
        base.copyWith(quota: const ProviderQuota(used: 4, limit: 5)).isRoutable,
        isTrue,
      );
      expect(
        base
            .copyWith(validity: const ProviderValidity(keyValid: false))
            .isRoutable,
        isFalse,
      );
      // Never-validated keys pass — validation is a later layer's job.
      expect(base.copyWith(validity: null).isRoutable, isTrue);
      expect(
        base
            .copyWith(validity: const ProviderValidity(keyValid: true))
            .isRoutable,
        isTrue,
      );
    });

    test('supports is a superset test', () {
      final p = _profile(
        id: 'p',
        capabilities: const {AiCapability.text, AiCapability.vision},
      );
      expect(p.supports(const {AiCapability.text}), isTrue);
      expect(
        p.supports(const {AiCapability.text, AiCapability.vision}),
        isTrue,
      );
      expect(p.supports(const {AiCapability.inpainting}), isFalse);
      expect(p.supports(const {}), isTrue);
    });
  });

  group('freeze — model JSON round-trips', () {
    test('ProviderProfile round-trips with sorted capability wire names', () {
      final profile = ProviderProfile(
        id: 'prof-1',
        provider: AiProviderId.claude,
        mode: ProviderMode.byok,
        endpoint: 'https://example.invalid/v1',
        keyRef: 'sec://febric/claude-key',
        capabilities: const {AiCapability.vision, AiCapability.text},
        models: const ['model-a', 'model-b'],
        quota: ProviderQuota(
          used: 10,
          limit: 100,
          resetAt: DateTime.utc(2026, 8),
        ),
        health: ProviderHealth(
          status: HealthStatus.degraded,
          circuit: CircuitState.halfOpen,
          latencyP50Ms: 120,
          latencyP95Ms: 800,
          lastCheck: DateTime.utc(2026, 7, 19, 11),
        ),
        validity: ProviderValidity(
          keyValid: true,
          lastValidation: DateTime.utc(2026, 7, 19, 10),
        ),
      );
      expect(ProviderProfile.fromJson(profile.toJson()), profile);
      final json = profile.toJson();
      expect(json['provider'], 'claude');
      expect(json['mode'], 'byok');
      expect(json['capabilities'], ['text', 'vision']); // sorted
      expect((json['health'] as Map<String, Object?>)['circuit'], 'half_open');
    });

    test('defaults: fresh profile is routable, unmetered, unvalidated', () {
      final p = _profile(id: 'p-min');
      expect(p.health.status, HealthStatus.healthy);
      expect(p.health.circuit, CircuitState.closed);
      expect(p.quota, isNull);
      expect(p.validity, isNull);
      expect(p.models, isEmpty);
      expect(p.isRoutable, isTrue);
    });
  });
}

ProviderProfile _profile({
  required String id,
  Set<AiCapability> capabilities = const {AiCapability.imageGeneration},
}) {
  return ProviderProfile(
    id: id,
    provider: AiProviderId.claude,
    mode: ProviderMode.managed,
    capabilities: capabilities,
  );
}
