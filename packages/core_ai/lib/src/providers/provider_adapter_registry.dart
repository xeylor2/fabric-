import 'package:core_ai/src/prompt/ai_provider_id.dart';
import 'package:core_ai/src/prompt/prompt_pipeline.dart';

/// Registry of frozen [ProviderAdapter]s, keyed by the frozen
/// [AiProviderId] (the M11 `ToolRuntime` registry and M5B
/// `RenderObjectProducerRegistry` precedents).
///
/// `core_ai` stays vendor-blind (§16): concrete adapters live in data
/// layers and are *registered into* this contract — none ships here.
abstract interface class ProviderAdapterRegistry {
  /// Registers [adapter] under its own frozen `adapter.provider` key and
  /// returns that key. Re-registering a provider replaces the instance
  /// (the M11 registry semantics).
  AiProviderId register(ProviderAdapter adapter);

  /// The adapter serving [provider], or null when none is registered.
  ProviderAdapter? adapterFor(AiProviderId provider);

  /// Whether an adapter is registered for [provider].
  bool isRegistered(AiProviderId provider);

  /// The registered provider keys, in registration order.
  List<AiProviderId> get registeredProviders;
}

/// Reference in-memory [ProviderAdapterRegistry] (the M5B
/// `RenderObjectProducerRegistryImpl` naming precedent). Pure mechanics:
/// a map keyed by the frozen vocabulary — no vendor code, no IO.
final class ProviderAdapterRegistryImpl implements ProviderAdapterRegistry {
  final Map<AiProviderId, ProviderAdapter> _adapters =
      <AiProviderId, ProviderAdapter>{};

  @override
  AiProviderId register(ProviderAdapter adapter) {
    _adapters[adapter.provider] = adapter;
    return adapter.provider;
  }

  @override
  ProviderAdapter? adapterFor(AiProviderId provider) => _adapters[provider];

  @override
  bool isRegistered(AiProviderId provider) => _adapters.containsKey(provider);

  @override
  List<AiProviderId> get registeredProviders =>
      List.unmodifiable(_adapters.keys);
}
