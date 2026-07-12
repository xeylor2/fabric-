import 'package:core_lock/src/lock_scope.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lock_state.freezed.dart';
part 'lock_state.g.dart';

/// One active lock: a [scope], optionally narrowed to a [targetId]
/// (a lock with a null target locks the scope globally).
@freezed
abstract class LockState with _$LockState {
  const factory LockState({
    required LockScope scope,

    /// The locked entity id (layer/object/mask/tool id…); null locks the
    /// entire scope.
    String? targetId,

    /// Who placed the lock — release rules follow origin (a user cannot
    /// release a policy lock; policy resolution is a later milestone).
    @Default(LockOrigin.user) LockOrigin origin,

    /// Human-readable reason surfaced by UI when a mutation is refused.
    String? reason,
  }) = _LockState;

  factory LockState.fromJson(Map<String, Object?> json) =>
      _$LockStateFromJson(json);
}

/// The immutable set of active locks for one context (project session),
/// with the frozen implication semantics of [LockScope.directlyImplies].
@freezed
abstract class LockSet with _$LockSet {
  const factory LockSet({@Default(<LockState>[]) List<LockState> locks}) =
      _LockSet;

  factory LockSet.fromJson(Map<String, Object?> json) =>
      _$LockSetFromJson(json);

  const LockSet._();

  static const LockSet none = LockSet();

  bool get isEmpty => locks.isEmpty;

  /// All scopes locked for [targetId] (or globally), including implied
  /// scopes (transitive closure of the frozen hierarchy).
  Set<LockScope> effectiveScopes({String? targetId}) {
    final result = <LockScope>{};
    for (final lock in locks) {
      final applies = lock.targetId == null || lock.targetId == targetId;
      if (applies) {
        _close(lock.scope, result);
      }
    }
    return result;
  }

  /// Whether a mutation in [scope] on [targetId] is blocked.
  bool isLocked(LockScope scope, {String? targetId}) {
    return effectiveScopes(targetId: targetId).contains(scope);
  }

  /// The lock that blocks [scope] on [targetId], or null when unlocked
  /// (surfaced to UI for the refusal reason).
  LockState? blockingLock(LockScope scope, {String? targetId}) {
    for (final lock in locks) {
      final applies = lock.targetId == null || lock.targetId == targetId;
      if (!applies) {
        continue;
      }
      final closure = <LockScope>{};
      _close(lock.scope, closure);
      if (closure.contains(scope)) {
        return lock;
      }
    }
    return null;
  }

  /// Returns a set with [lock] added.
  LockSet withLock(LockState lock) => LockSet(locks: [...locks, lock]);

  /// Returns a set with every lock matching [scope]/[targetId] removed.
  LockSet withoutLock(LockScope scope, {String? targetId}) {
    return LockSet(
      locks: [
        for (final lock in locks)
          if (!(lock.scope == scope && lock.targetId == targetId)) lock,
      ],
    );
  }

  static void _close(LockScope scope, Set<LockScope> into) {
    if (!into.add(scope)) {
      return;
    }
    for (final implied in scope.directlyImplies) {
      _close(implied, into);
    }
  }
}

/// The verdict of a lock check, carrying the blocking lock for UI/telemetry.
@freezed
abstract class LockDecision with _$LockDecision {
  const factory LockDecision({required bool allowed, LockState? blockedBy}) =
      _LockDecision;

  factory LockDecision.fromJson(Map<String, Object?> json) =>
      _$LockDecisionFromJson(json);

  const LockDecision._();

  static const LockDecision permit = LockDecision(allowed: true);
}

/// The Lock Engine's policy seam: every engine (document, tools, AI,
/// export, plugins) checks mutations through a [LockPolicy] before acting.
/// Implementations arrive with the document engine (M2); the contract is
/// frozen here (ADR-0005). No engine may mutate without a permit.
abstract interface class LockPolicy {
  /// Decides whether a mutation in [scope] on [targetId] may proceed given
  /// the active [locks].
  LockDecision check(LockSet locks, LockScope scope, {String? targetId});
}
