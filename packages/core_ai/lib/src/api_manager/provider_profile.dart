import 'package:core_ai/src/prompt/ai_provider_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'provider_profile.freezed.dart';
part 'provider_profile.g.dart';

/// Provider account modes (Architecture V2 §10). Managed and BYOK modes
/// implement the same interface — one [ProviderProfile] type serves both.
///
/// Frozen initial set; future modes are appended (never renamed).
enum ProviderMode {
  /// FEBRIC-managed cloud account.
  managed('managed', 'Managed'),

  /// Bring-your-own-key account.
  byok('byok', 'BYOK');

  const ProviderMode(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static ProviderMode fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown ProviderMode wire name',
      ),
    );
  }
}

/// Provider health classes written by the future probing runtime (§10
/// "continuous jittered health probes") and read by routing.
///
/// Frozen initial set; append-only. Eligibility is encoded as data:
/// routing admits `healthy` and `degraded` (a degraded provider ranks
/// worse; an unhealthy or unprobed one is filtered).
enum HealthStatus {
  healthy('healthy', 'Healthy'),
  degraded('degraded', 'Degraded'),
  unhealthy('unhealthy', 'Unhealthy'),

  /// Never probed.
  unknown('unknown', 'Unknown');

  const HealthStatus(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Whether routing may consider a provider in this state.
  bool get isEligible => this == healthy || this == degraded;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static HealthStatus fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown HealthStatus wire name',
      ),
    );
  }
}

/// Per-provider circuit-breaker states (§10: closed / open / half-open).
///
/// The legal breaker cycle is encoded as data on the vocabulary (the
/// frozen `AiJobStatus.canTransitionTo` precedent): closed → open,
/// open → halfOpen, halfOpen → closed | open. *Driving* the breaker
/// (failure counting, timers) belongs to the orchestrator/backend slices —
/// M12C ships the legal moves only.
enum CircuitState {
  /// Traffic flows normally.
  closed('closed', 'Closed'),

  /// Tripped: no traffic.
  open('open', 'Open'),

  /// Trial traffic admitted to test recovery.
  halfOpen('half_open', 'Half-Open');

  const CircuitState(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Whether the breaker cycle permits moving from this state to [next].
  bool canTransitionTo(CircuitState next) {
    return switch (this) {
      closed => next == open,
      open => next == halfOpen,
      halfOpen => next == closed || next == open,
    };
  }

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static CircuitState fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown CircuitState wire name',
      ),
    );
  }
}

/// Live health snapshot of one provider profile (§10
/// `health{status, latencyP50/P95, lastCheck, circuit}`). Written by the
/// future probing runtime; read (never written) by routing.
@freezed
abstract class ProviderHealth with _$ProviderHealth {
  const factory ProviderHealth({
    @Default(HealthStatus.unknown)
    @JsonKey(fromJson: _healthStatusFromJson, toJson: _healthStatusToJson)
    HealthStatus status,

    @Default(CircuitState.closed)
    @JsonKey(fromJson: _circuitFromJson, toJson: _circuitToJson)
    CircuitState circuit,

    /// Median probe latency, milliseconds.
    int? latencyP50Ms,

    /// 95th-percentile probe latency, milliseconds.
    int? latencyP95Ms,

    /// When the last probe ran.
    DateTime? lastCheck,
  }) = _ProviderHealth;

  factory ProviderHealth.fromJson(Map<String, Object?> json) =>
      _$ProviderHealthFromJson(json);

  const ProviderHealth._();

  /// Whether routing may consider this provider: the status admits
  /// traffic and the circuit is not open. Half-open admits trial traffic —
  /// that is its §10 purpose.
  bool get isEligible => status.isEligible && circuit != CircuitState.open;
}

/// Quota snapshot of one provider profile (§10
/// `quota{used, limit, resetAt}`). Accounting (incrementing, resetting)
/// belongs to later layers; M12C ships the data and the pure queries.
@freezed
abstract class ProviderQuota with _$ProviderQuota {
  @Assert('used >= 0', 'used must be non-negative')
  @Assert('limit > 0', 'limit must be positive')
  const factory ProviderQuota({
    required int used,
    required int limit,

    /// When the quota window resets.
    DateTime? resetAt,
  }) = _ProviderQuota;

  factory ProviderQuota.fromJson(Map<String, Object?> json) =>
      _$ProviderQuotaFromJson(json);

  const ProviderQuota._();

  /// Whether the window is spent.
  bool get isExhausted => used >= limit;

  /// Units left in the window (never negative).
  int get remaining => used >= limit ? 0 : limit - used;
}

/// Key-validity snapshot of one provider profile (§10
/// `validity{keyValid, lastValidation}`). Validation itself (calling the
/// provider) belongs to later layers.
@freezed
abstract class ProviderValidity with _$ProviderValidity {
  const factory ProviderValidity({
    required bool keyValid,
    DateTime? lastValidation,
  }) = _ProviderValidity;

  factory ProviderValidity.fromJson(Map<String, Object?> json) =>
      _$ProviderValidityFromJson(json);
}

/// One provider account record (§10) — the API Manager's unit of routing.
/// Managed and BYOK profiles are the same type (§10: "Managed and BYOK
/// modes implement the same interface").
///
/// Pure data: [endpoint] is never dialled and [keyRef] is an opaque
/// reference into OS secure storage, never resolved here — `core_ai`
/// stays vendor-blind (§16).
@freezed
abstract class ProviderProfile with _$ProviderProfile {
  const factory ProviderProfile({
    /// Stable profile id (a user may hold several profiles per provider).
    required String id,

    /// The provider this profile targets (frozen vocabulary).
    @JsonKey(fromJson: _providerFromJson, toJson: _providerToJson)
    required AiProviderId provider,

    @JsonKey(fromJson: _modeFromJson, toJson: _modeToJson)
    required ProviderMode mode,

    /// Service endpoint — data only; never dialled by this package.
    String? endpoint,

    /// Opaque reference into OS secure storage; never resolved here.
    String? keyRef,

    /// Capability classes this profile serves (frozen vocabulary).
    @JsonKey(fromJson: _capabilitiesFromJson, toJson: _capabilitiesToJson)
    @Default(<AiCapability>{})
    Set<AiCapability> capabilities,

    /// Ordered model preference list (§10 `models[tier]` — order
    /// expresses tier preference).
    @Default(<String>[]) List<String> models,

    /// Quota snapshot; null = unmetered.
    ProviderQuota? quota,

    /// Health snapshot. A fresh profile starts routable (§10: probes
    /// adjust it continuously).
    @Default(ProviderHealth(status: HealthStatus.healthy))
    ProviderHealth health,

    /// Key-validity snapshot; null = never validated.
    ProviderValidity? validity,

    @Default(<String, Object?>{}) Map<String, Object?> metadata,
  }) = _ProviderProfile;

  factory ProviderProfile.fromJson(Map<String, Object?> json) =>
      _$ProviderProfileFromJson(json);

  const ProviderProfile._();

  /// Whether this profile serves every capability in [required].
  bool supports(Set<AiCapability> required) =>
      capabilities.containsAll(required);

  /// Whether routing may consider this profile at all: health eligible
  /// (which excludes an open circuit), quota not exhausted, and the key
  /// not known-invalid (never-validated keys pass — validation is a
  /// later layer's job).
  bool get isRoutable =>
      health.isEligible &&
      (quota == null || !quota!.isExhausted) &&
      (validity == null || validity!.keyValid);
}

ProviderMode _modeFromJson(String wireName) =>
    ProviderMode.fromWireName(wireName);

String _modeToJson(ProviderMode mode) => mode.wireName;

HealthStatus _healthStatusFromJson(String wireName) =>
    HealthStatus.fromWireName(wireName);

String _healthStatusToJson(HealthStatus status) => status.wireName;

CircuitState _circuitFromJson(String wireName) =>
    CircuitState.fromWireName(wireName);

String _circuitToJson(CircuitState state) => state.wireName;

AiProviderId _providerFromJson(String wireName) =>
    AiProviderId.fromWireName(wireName);

String _providerToJson(AiProviderId provider) => provider.wireName;

Set<AiCapability> _capabilitiesFromJson(List<Object?> wireNames) =>
    wireNames.map((n) => AiCapability.fromWireName(n! as String)).toSet();

List<String> _capabilitiesToJson(Set<AiCapability> capabilities) =>
    capabilities.map((c) => c.wireName).toList()..sort();
