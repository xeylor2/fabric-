import 'package:core_lock/core_lock.dart';
import 'package:test/test.dart';

void main() {
  test('LockScope wire names are frozen — the sixteen scopes', () {
    expect(LockScope.values.map((v) => v.wireName), [
      'project',
      'document',
      'layer',
      'object',
      'selection',
      'reference',
      'mask',
      'tool',
      'viewport',
      'history',
      'undo',
      'ai',
      'export',
      'production',
      'review',
      'approval',
    ]);
    expect(LockOrigin.values.map((v) => v.wireName), [
      'user',
      'system',
      'policy',
      'review',
    ]);
    for (final v in LockScope.values) {
      expect(LockScope.fromWireName(v.wireName), v);
    }
    expect(() => LockScope.fromWireName('vault'), throwsArgumentError);
  });

  group('implication hierarchy', () {
    test('project lock implies everything', () {
      const locks = LockSet(locks: [LockState(scope: LockScope.project)]);
      for (final scope in LockScope.values) {
        expect(
          locks.isLocked(scope),
          isTrue,
          reason: 'project should imply ${scope.wireName}',
        );
      }
    });

    test('document lock implies content scopes but not tool/viewport', () {
      const locks = LockSet(locks: [LockState(scope: LockScope.document)]);
      expect(locks.isLocked(LockScope.layer), isTrue);
      expect(locks.isLocked(LockScope.object), isTrue, reason: 'via layer');
      expect(locks.isLocked(LockScope.mask), isTrue);
      expect(locks.isLocked(LockScope.ai), isTrue);
      expect(locks.isLocked(LockScope.undo), isTrue, reason: 'via history');
      expect(locks.isLocked(LockScope.tool), isFalse);
      expect(locks.isLocked(LockScope.viewport), isFalse);
      expect(locks.isLocked(LockScope.production), isFalse);
    });

    test('approval lock freezes the document', () {
      const locks = LockSet(locks: [LockState(scope: LockScope.approval)]);
      expect(locks.isLocked(LockScope.object), isTrue);
      expect(locks.isLocked(LockScope.ai), isTrue);
    });

    test('narrow locks do not leak upward', () {
      const locks = LockSet(locks: [LockState(scope: LockScope.object)]);
      expect(locks.isLocked(LockScope.object), isTrue);
      expect(locks.isLocked(LockScope.layer), isFalse);
      expect(locks.isLocked(LockScope.document), isFalse);
    });
  });

  group('targeted locks', () {
    const locks = LockSet(
      locks: [
        LockState(
          scope: LockScope.layer,
          targetId: 'layer-1',
          origin: LockOrigin.review,
          reason: 'Approved by merchandiser',
        ),
      ],
    );

    test('apply to their target only', () {
      expect(locks.isLocked(LockScope.layer, targetId: 'layer-1'), isTrue);
      expect(
        locks.isLocked(LockScope.object, targetId: 'layer-1'),
        isTrue,
        reason: 'layer implies its objects',
      );
      expect(locks.isLocked(LockScope.layer, targetId: 'layer-2'), isFalse);
    });

    test('blockingLock surfaces the reason', () {
      final blocking = locks.blockingLock(
        LockScope.object,
        targetId: 'layer-1',
      );
      expect(blocking, isNotNull);
      expect(blocking!.reason, 'Approved by merchandiser');
      expect(blocking.origin, LockOrigin.review);
      expect(locks.blockingLock(LockScope.viewport), isNull);
    });
  });

  test('withLock / withoutLock are immutable operations', () {
    const initial = LockSet.none;
    final locked = initial.withLock(const LockState(scope: LockScope.ai));
    expect(initial.isEmpty, isTrue, reason: 'original untouched');
    expect(locked.isLocked(LockScope.ai), isTrue);
    final released = locked.withoutLock(LockScope.ai);
    expect(released.isLocked(LockScope.ai), isFalse);
  });

  test('json round trip', () {
    const locks = LockSet(
      locks: [
        LockState(
          scope: LockScope.export,
          targetId: 'doc-1',
          origin: LockOrigin.policy,
          reason: 'Pending review',
        ),
      ],
    );
    expect(LockSet.fromJson(locks.toJson()), locks);
    expect(
      LockDecision.fromJson(const LockDecision(allowed: true).toJson()),
      LockDecision.permit,
    );
  });
}
