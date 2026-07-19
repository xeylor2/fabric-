import 'package:core_ai/core_ai.dart';
import 'package:core_textile/core_textile.dart';
import 'package:test/test.dart';

/// M12B verification suite — AI Job Model.
void main() {
  group('freeze — AiJobStatus vocabulary', () {
    test('wire names are frozen — the six lifecycle states in order', () {
      expect(AiJobStatus.values.map((v) => v.wireName), [
        'planned',
        'queued',
        'running',
        'succeeded',
        'failed',
        'cancelled',
      ]);
      for (final v in AiJobStatus.values) {
        expect(AiJobStatus.fromWireName(v.wireName), v);
      }
    });

    test('fromWireName rejects unknown input', () {
      expect(
        () => AiJobStatus.fromWireName('auto_completed'),
        throwsArgumentError,
      );
    });
  });

  group('lifecycle — the state machine as values', () {
    test('full legal-transition matrix of canTransitionTo', () {
      const legal = {
        (AiJobStatus.planned, AiJobStatus.queued),
        (AiJobStatus.planned, AiJobStatus.cancelled),
        (AiJobStatus.queued, AiJobStatus.running),
        (AiJobStatus.queued, AiJobStatus.cancelled),
        (AiJobStatus.running, AiJobStatus.succeeded),
        (AiJobStatus.running, AiJobStatus.failed),
        (AiJobStatus.running, AiJobStatus.cancelled),
      };
      for (final from in AiJobStatus.values) {
        for (final to in AiJobStatus.values) {
          expect(
            from.canTransitionTo(to),
            legal.contains((from, to)),
            reason: '${from.wireName} → ${to.wireName}',
          );
        }
      }
    });

    test('isTerminal truth table', () {
      expect(AiJobStatus.planned.isTerminal, isFalse);
      expect(AiJobStatus.queued.isTerminal, isFalse);
      expect(AiJobStatus.running.isTerminal, isFalse);
      expect(AiJobStatus.succeeded.isTerminal, isTrue);
      expect(AiJobStatus.failed.isTerminal, isTrue);
      expect(AiJobStatus.cancelled.isTerminal, isTrue);
    });

    test('withStatus applies every legal transition as a copy', () {
      final job = _job(id: 'j-t');
      final queued = job.withStatus(AiJobStatus.queued);
      expect(queued.status, AiJobStatus.queued);
      expect(job.status, AiJobStatus.planned); // immutable original
      final running = queued.withStatus(AiJobStatus.running);
      final done = running.withStatus(AiJobStatus.succeeded);
      expect(done.isTerminal, isTrue);
      // Cancellation before execution starts:
      expect(
        _job(id: 'j-c').withStatus(AiJobStatus.cancelled).status,
        AiJobStatus.cancelled,
      );
    });

    test('withStatus throws StateError on every illegal transition', () {
      final planned = _job(id: 'j-i');
      expect(() => planned.withStatus(AiJobStatus.running), throwsStateError);
      expect(() => planned.withStatus(AiJobStatus.succeeded), throwsStateError);
      final done = planned
          .withStatus(AiJobStatus.queued)
          .withStatus(AiJobStatus.running)
          .withStatus(AiJobStatus.succeeded);
      for (final next in AiJobStatus.values) {
        expect(
          () => done.withStatus(next),
          throwsStateError,
          reason: 'terminal → ${next.wireName}',
        );
      }
    });
  });

  group('freeze — AiJob model', () {
    test('JSON round-trip preserves all wire vocabularies', () {
      final job = _job(
        id: 'j-json',
        capabilities: const {AiCapability.imageGeneration, AiCapability.text},
      ).copyWith(provider: AiProviderId.gemini, model: 'gemini-x');
      final restored = AiJob.fromJson(job.toJson());
      expect(restored, job);
      final json = job.toJson();
      expect(json['operation'], AiOperation.motifRefinement.wireName);
      expect(json['status'], AiJobStatus.planned.wireName);
      expect(json['provider'], AiProviderId.gemini.wireName);
      // Capabilities serialize as sorted wire names (deterministic JSON).
      expect(json['requiredCapabilities'], ['image_generation', 'text']);
    });

    test('defaults: planned, unrouted, empty scope/capabilities', () {
      const j = AiJob(
        id: 'j-min',
        operation: AiOperation.backgroundCleanup,
        promptHash: 'sha256:m12b',
      );
      expect(j.status, AiJobStatus.planned);
      expect(j.provider, isNull); // I5: stamped by the API Manager slice
      expect(j.model, isNull);
      expect(j.scopeNodeIds, isEmpty);
      expect(j.scopeMaskIds, isEmpty);
      expect(j.requiredCapabilities, isEmpty);
      expect(j.failureReason, isNull);
      expect(j.isTerminal, isFalse);
    });

    test('I3 — declared scope ids round-trip; ids only by type', () {
      final job = _job(
        id: 'j-scope',
        scopeNodeIds: const ['node-1', 'node-2'],
        scopeMaskIds: const ['mask-1'],
      );
      final restored = AiJob.fromJson(job.toJson());
      expect(restored.scopeNodeIds, ['node-1', 'node-2']);
      expect(restored.scopeMaskIds, ['mask-1']);
    });

    test('failureReason is populated only when failed (assert)', () {
      expect(
        () => AiJob(
          id: 'j-bad',
          operation: AiOperation.motifRefinement,
          promptHash: 'sha256:m12b',
          failureReason: 'boom',
        ),
        throwsA(isA<AssertionError>()),
      );
      final failed = _job(id: 'j-f')
          .withStatus(AiJobStatus.queued)
          .withStatus(AiJobStatus.running)
          .withStatus(AiJobStatus.failed)
          .copyWith(failureReason: 'provider timeout');
      expect(failed.failureReason, 'provider timeout');
    });
  });

  group('I6 — whole-design regeneration stays a distinct labelled type', () {
    test('isWholeDesignRegeneration true only for redesignTextilePrint', () {
      for (final op in AiOperation.values) {
        final job = AiJob(
          id: 'j-${op.wireName}',
          operation: op,
          promptHash: 'sha256:m12b',
        );
        expect(
          job.isWholeDesignRegeneration,
          op == AiOperation.redesignTextilePrint,
          reason: op.wireName,
        );
      }
    });

    test('no escalation path: operation is carried verbatim through the '
        'lifecycle', () {
      final job = _job(id: 'j-esc')
          .withStatus(AiJobStatus.queued)
          .withStatus(AiJobStatus.running)
          .withStatus(AiJobStatus.succeeded);
      expect(job.operation, AiOperation.motifRefinement);
      expect(job.isWholeDesignRegeneration, isFalse);
    });
  });
}

AiJob _job({
  required String id,
  List<String> scopeNodeIds = const ['node-1'],
  List<String> scopeMaskIds = const [],
  Set<AiCapability> capabilities = const {AiCapability.imageGeneration},
}) {
  return AiJob(
    id: id,
    operation: AiOperation.motifRefinement,
    scopeNodeIds: scopeNodeIds,
    scopeMaskIds: scopeMaskIds,
    promptHash: 'sha256:m12b',
    templateId: 'motif-refine-v1',
    requiredCapabilities: capabilities,
    seed: 42,
    parameters: const {'quality': 'standard'},
  );
}
