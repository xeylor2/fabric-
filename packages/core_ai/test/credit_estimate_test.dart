import 'package:core_ai/core_ai.dart';
import 'package:core_textile/core_textile.dart';
import 'package:test/test.dart';

/// M12B verification suite — Credit Estimation.
///
/// All rate tables below are TEST-SUPPLIED policy: the package ships no
/// prices (the approved pricing-policy resolution — `core_ai` stays
/// vendor-blind; pricing truth arrives with later layers behind the
/// CreditEstimator seam).
void main() {
  group('freeze — CreditEstimate model', () {
    test('JSON round-trip', () {
      final estimate = CreditEstimate(
        jobId: 'j-1',
        credits: 12,
        breakdown: {'base': 10, 'scope': 2},
        estimatorVersion: 'test-1.0.0',
      );
      expect(CreditEstimate.fromJson(estimate.toJson()), estimate);
    });

    test('asserts: negative credits rejected', () {
      expect(
        () => CreditEstimate(
          jobId: 'j-neg',
          credits: -1,
          estimatorVersion: 'test-1.0.0',
        ),
        throwsA(isA<AssertionError>()),
      );
    });

    test('asserts: a non-empty breakdown must sum to credits', () {
      expect(
        () => CreditEstimate(
          jobId: 'j-sum',
          credits: 5,
          breakdown: const {'base': 3, 'scope': 3},
          estimatorVersion: 'test-1.0.0',
        ),
        throwsA(isA<AssertionError>()),
      );
      // Empty breakdown carries no sum obligation.
      final bare = CreditEstimate(
        jobId: 'j-bare',
        credits: 5,
        estimatorVersion: 'test-1.0.0',
      );
      expect(bare.breakdown, isEmpty);
    });
  });

  group('TableCreditEstimator — policy-free mechanics', () {
    test('deterministic: same job → identical estimate across repeated '
        'calls and fresh instances given the same injected table', () {
      final job = _job(id: 'j-det', scopeNodes: 3);
      final a = _estimator().estimate(job);
      final b = _estimator().estimate(job);
      final c = _estimator().estimate(job);
      expect(a, b);
      expect(b, c);
    });

    test('mechanics: base + perScopeNodeCredits × scope, breakdown sums', () {
      final estimate = _estimator().estimate(_job(id: 'j-m', scopeNodes: 4));
      expect(estimate.credits, 10 + 2 * 4);
      expect(estimate.breakdown, {'base': 10, 'scope': 8});
      expect(
        estimate.breakdown.values.fold(0, (a, b) => a + b),
        estimate.credits,
      );
      expect(estimate.jobId, 'j-m');
    });

    test('scope term is linear and zero-scope prices at base', () {
      expect(_estimator().estimate(_job(id: 'j-0', scopeNodes: 0)).credits, 10);
      expect(_estimator().estimate(_job(id: 'j-1', scopeNodes: 1)).credits, 12);
      expect(_estimator().estimate(_job(id: 'j-2', scopeNodes: 2)).credits, 14);
    });

    test('injected version is stamped into every estimate', () {
      final estimate = _estimator().estimate(_job(id: 'j-v', scopeNodes: 1));
      expect(estimate.estimatorVersion, 'test-1.0.0');
    });

    test('unpriced operation → ArgumentError, never a fabricated cost', () {
      final estimator = TableCreditEstimator(
        baseCredits: const {AiOperation.motifRefinement: 10},
        version: 'test-1.0.0',
      );
      const unpriced = AiJob(
        id: 'j-u',
        operation: AiOperation.fabricRestoration,
        promptHash: 'sha256:m12b',
      );
      expect(() => estimator.estimate(unpriced), throwsArgumentError);
    });

    test('mechanics cover every frozen AiOperation with a test-supplied '
        'table (the package ships no prices)', () {
      final table = {
        for (final (i, op) in AiOperation.values.indexed) op: (i + 1) * 5,
      };
      final estimator = TableCreditEstimator(
        baseCredits: table,
        perScopeNodeCredits: 1,
        version: 'test-exhaustive',
      );
      for (final op in AiOperation.values) {
        final estimate = estimator.estimate(
          AiJob(
            id: 'j-${op.wireName}',
            operation: op,
            scopeNodeIds: const ['n1', 'n2'],
            promptHash: 'sha256:m12b',
          ),
        );
        expect(estimate.credits, table[op]! + 2, reason: op.wireName);
        expect(estimate.estimatorVersion, 'test-exhaustive');
      }
    });

    test('the injected table is defensively unmodifiable', () {
      final mutable = {AiOperation.motifRefinement: 10};
      final estimator = TableCreditEstimator(
        baseCredits: mutable,
        version: 'test-1.0.0',
      );
      mutable[AiOperation.motifRefinement] = 999;
      // The estimator captured an unmodifiable copy at construction.
      expect(estimator.estimate(_job(id: 'j-d', scopeNodes: 0)).credits, 10);
    });
  });
}

TableCreditEstimator _estimator() {
  return TableCreditEstimator(
    baseCredits: const {AiOperation.motifRefinement: 10},
    perScopeNodeCredits: 2,
    version: 'test-1.0.0',
  );
}

AiJob _job({required String id, required int scopeNodes}) {
  return AiJob(
    id: id,
    operation: AiOperation.motifRefinement,
    scopeNodeIds: [for (var i = 0; i < scopeNodes; i++) 'node-$i'],
    promptHash: 'sha256:m12b',
  );
}
