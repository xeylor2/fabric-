import 'package:core_ai/core_ai.dart';
import 'package:core_textile/core_textile.dart';
import 'package:test/test.dart';

/// M12D-1 verification suite — ProviderAdapterRegistry + ExecutionOutcome.
void main() {
  group('registry — keyed by the frozen AiProviderId', () {
    test('register keys by adapter.provider and returns the key', () {
      final registry = ProviderAdapterRegistryImpl();
      final key = registry.register(_FakeAdapter(AiProviderId.claude));
      expect(key, AiProviderId.claude);
      expect(registry.isRegistered(AiProviderId.claude), isTrue);
      expect(registry.isRegistered(AiProviderId.gemini), isFalse);
      expect(registry.registeredProviders, [AiProviderId.claude]);
    });

    test('adapterFor resolves the registered instance; null when absent', () {
      final registry = ProviderAdapterRegistryImpl();
      final adapter = _FakeAdapter(AiProviderId.gpt);
      registry.register(adapter);
      expect(registry.adapterFor(AiProviderId.gpt), same(adapter));
      expect(registry.adapterFor(AiProviderId.nanoBanana), isNull);
    });

    test('re-registering a provider replaces the instance (M11 semantics)', () {
      final registry = ProviderAdapterRegistryImpl();
      registry.register(_FakeAdapter(AiProviderId.claude));
      final second = _FakeAdapter(AiProviderId.claude);
      registry.register(second);
      expect(registry.adapterFor(AiProviderId.claude), same(second));
      expect(registry.registeredProviders, [AiProviderId.claude]);
    });

    test('registeredProviders is registration-ordered and unmodifiable', () {
      final registry = ProviderAdapterRegistryImpl();
      registry.register(_FakeAdapter(AiProviderId.gemini));
      registry.register(_FakeAdapter(AiProviderId.claude));
      expect(registry.registeredProviders, [
        AiProviderId.gemini,
        AiProviderId.claude,
      ]);
      expect(
        () => registry.registeredProviders.clear(),
        throwsUnsupportedError,
      );
    });
  });

  group('freeze — ExecutionOutcome union + ExecutionAttempt', () {
    test('executed round-trips with kind discriminator', () {
      final outcome = ExecutionOutcome.executed(
        job: _queuedJob(),
        proposalId: 'p-1',
        attempts: const [
          ExecutionAttempt(
            profileId: 'prof-1',
            provider: AiProviderId.claude,
            model: 'claude-fable-5',
            succeeded: true,
          ),
        ],
      );
      expect(ExecutionOutcome.fromJson(outcome.toJson()), outcome);
      expect(outcome.toJson()['kind'], 'executed');
    });

    test('failed round-trips', () {
      final outcome = ExecutionOutcome.failed(
        job: _queuedJob()
            .withStatus(AiJobStatus.running)
            .withStatus(AiJobStatus.failed)
            .copyWith(failureReason: 'boom'),
        attempts: const [
          ExecutionAttempt(
            profileId: 'prof-1',
            provider: AiProviderId.claude,
            succeeded: false,
            error: 'boom',
          ),
        ],
      );
      expect(ExecutionOutcome.fromJson(outcome.toJson()), outcome);
      expect(outcome.toJson()['kind'], 'failed');
    });

    test('notExecuted round-trips with the job untouched', () {
      final outcome = ExecutionOutcome.notExecuted(
        job: _queuedJob(),
        detail: 'no adapters',
      );
      final restored =
          ExecutionOutcome.fromJson(outcome.toJson()) as ExecutionNotExecuted;
      expect(restored, outcome);
      expect(restored.job.status, AiJobStatus.queued);
      expect(outcome.toJson()['kind'], 'not_executed');
    });

    test('ExecutionAttempt round-trips with wire-named provider', () {
      const attempt = ExecutionAttempt(
        profileId: 'prof-1',
        provider: AiProviderId.nanoBanana,
        succeeded: false,
        error: 'No adapter registered for nano_banana',
      );
      expect(ExecutionAttempt.fromJson(attempt.toJson()), attempt);
      expect(attempt.toJson()['provider'], 'nano_banana');
    });
  });
}

/// Minimal frozen-contract adapter for registry tests (never invoked).
final class _FakeAdapter implements ProviderAdapter {
  _FakeAdapter(this.provider);

  @override
  final AiProviderId provider;

  @override
  Set<AiCapability> get capabilities => const {AiCapability.imageGeneration};

  @override
  Future<ProviderResponse> submit(CompiledPrompt prompt) async =>
      ProviderResponse(provider: provider, succeeded: true);
}

AiJob _queuedJob() => const AiJob(
  id: 'j-1',
  operation: AiOperation.motifRefinement,
  promptHash: 'sha256:m12d',
  requiredCapabilities: {AiCapability.imageGeneration},
).withStatus(AiJobStatus.queued);
