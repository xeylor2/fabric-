import 'package:core_ai/core_ai.dart';
import 'package:core_ai_staging/core_ai_staging.dart';
import 'package:core_common/core_common.dart';
import 'package:core_document/core_document.dart';
import 'package:core_geometry/core_geometry.dart';
import 'package:core_layer/core_layer.dart';
import 'package:core_textile/core_textile.dart';
import 'package:test/test.dart';

/// M12D-2 verification suite — ProviderExecutionOrchestrator.
///
/// Real frozen contracts throughout: a REAL `ProposalStagingArea` receives
/// the orchestrator's hand-off (spy sink behind it, M12A precedent); fake
/// adapters/assembler model the injected seams (the M11 `_FakeTool`
/// precedent). The final group runs the complete M12 spine end-to-end
/// against a real `DocumentEngine`.
void main() {
  group('guard', () {
    test('executing a non-queued job throws StateError', () async {
      final h = _Harness();
      final planned = RoutingDecision.routed(
        job: _plannedJob(id: 'j-g'), // hand-built: not queued
        candidates: const [
          RoutedCandidate(
            profileId: 'prof-a',
            provider: AiProviderId.claude,
            rank: 0,
          ),
        ],
      );
      await expectLater(
        h.orchestrator.execute(planned as RoutingRouted, _prompt()),
        throwsStateError,
      );
    });
  });

  group('success path', () {
    test('first candidate serves: job succeeds, proposal staged, prompt '
        'passed verbatim, assembler sees the running serving job', () async {
      final h = _Harness()..registerAdapter(AiProviderId.claude, succeed: true);
      final decision = h.route(_plannedJob(id: 'j-ok'));
      final prompt = _prompt();

      final outcome = await h.orchestrator.execute(decision, prompt);

      final executed = outcome as ExecutionExecuted;
      expect(executed.job.status, AiJobStatus.succeeded);
      expect(executed.job.provider, AiProviderId.claude);
      expect(executed.job.model, 'claude-fable-5');
      // The staged proposal is in the review queue (I2: bus untouched).
      expect(h.staging.staged.single.id, executed.proposalId);
      expect(h.sink.calls, isEmpty);
      // ADR-0009 structural guarantee: the adapter received the exact
      // CompiledPrompt, nothing else.
      expect(h.submittedPrompts(AiProviderId.claude).single, same(prompt));
      // The assembler saw the job mid-execution with the server stamped.
      expect(h.assembler.seenJobs.single.status, AiJobStatus.running);
      expect(h.assembler.seenJobs.single.provider, AiProviderId.claude);
      expect(executed.attempts.single.succeeded, isTrue);
    });
  });

  group('failover — the ranked M12C list, walked in order', () {
    test('candidate 1 fails, candidate 2 serves: I5 re-stamps the ACTUAL '
        'server; attempts record the walk', () async {
      final h = _Harness()
        ..registerAdapter(AiProviderId.claude, succeed: false, error: 'busy')
        ..registerAdapter(AiProviderId.gemini, succeed: true);
      final decision = h.route(
        _plannedJob(id: 'j-fo'),
        profiles: [
          _profile('prof-a', AiProviderId.claude, models: ['claude-fable-5']),
          _profile('prof-b', AiProviderId.gemini, models: ['gemini-x']),
        ],
      );
      // Routing stamped the FIRST candidate…
      expect(decision.job.provider, AiProviderId.claude);

      final outcome = await h.orchestrator.execute(decision, _prompt());

      final executed = outcome as ExecutionExecuted;
      // …but the SERVER was the second: I5 records reality.
      expect(executed.job.provider, AiProviderId.gemini);
      expect(executed.job.model, 'gemini-x');
      expect(executed.job.status, AiJobStatus.succeeded);
      expect(executed.attempts.map((a) => a.succeeded), [false, true]);
      expect(executed.attempts.first.error, 'busy');
      expect(h.staging.staged, hasLength(1));
    });

    test(
      'adapters are invoked in candidate rank order, sequentially',
      () async {
        final h = _Harness()
          ..registerAdapter(AiProviderId.claude, succeed: false)
          ..registerAdapter(AiProviderId.gemini, succeed: false)
          ..registerAdapter(AiProviderId.gpt, succeed: true);
        final decision = h.route(
          _plannedJob(id: 'j-order'),
          profiles: [
            _profile('prof-a', AiProviderId.claude),
            _profile('prof-b', AiProviderId.gemini),
            _profile('prof-c', AiProviderId.gpt),
          ],
        );
        await h.orchestrator.execute(decision, _prompt());
        expect(h.invocationOrder, [
          AiProviderId.claude,
          AiProviderId.gemini,
          AiProviderId.gpt,
        ]);
      },
    );
  });

  group('failure and not-executed outcomes', () {
    test('all submissions fail → job failed with last error; nothing '
        'staged', () async {
      final h = _Harness()
        ..registerAdapter(AiProviderId.claude, succeed: false, error: 'e1')
        ..registerAdapter(AiProviderId.gemini, succeed: false, error: 'e2');
      final decision = h.route(
        _plannedJob(id: 'j-fail'),
        profiles: [
          _profile('prof-a', AiProviderId.claude),
          _profile('prof-b', AiProviderId.gemini),
        ],
      );
      final outcome = await h.orchestrator.execute(decision, _prompt());
      final failed = outcome as ExecutionFailed;
      expect(failed.job.status, AiJobStatus.failed);
      expect(failed.job.failureReason, 'e2'); // the LAST error
      expect(failed.attempts, hasLength(2));
      expect(h.staging.staged, isEmpty);
      expect(h.sink.calls, isEmpty);
    });

    test('no adapter for any candidate → notExecuted, job UNCHANGED '
        '(still queued), nothing staged', () async {
      final h = _Harness(); // empty registry
      final decision = h.route(_plannedJob(id: 'j-none'));
      final outcome = await h.orchestrator.execute(decision, _prompt());
      final notExecuted = outcome as ExecutionNotExecuted;
      expect(notExecuted.job, same(decision.job)); // identical instance
      expect(notExecuted.job.status, AiJobStatus.queued);
      expect(notExecuted.attempts.single.error, contains('No adapter'));
      expect(h.staging.staged, isEmpty);
    });

    test('missing adapter then failing adapter → failed (a submission '
        'occurred); missing adapter then success → executed', () async {
      // gemini has no adapter; gpt fails.
      final h1 = _Harness()
        ..registerAdapter(AiProviderId.gpt, succeed: false, error: 'down');
      final d1 = h1.route(
        _plannedJob(id: 'j-mix1'),
        profiles: [
          _profile('prof-a', AiProviderId.gemini),
          _profile('prof-b', AiProviderId.gpt),
        ],
      );
      final o1 = await h1.orchestrator.execute(d1, _prompt());
      expect(o1, isA<ExecutionFailed>());
      expect((o1 as ExecutionFailed).attempts.map((a) => a.succeeded), [
        false,
        false,
      ]);

      // gemini has no adapter; gpt serves.
      final h2 = _Harness()..registerAdapter(AiProviderId.gpt, succeed: true);
      final d2 = h2.route(
        _plannedJob(id: 'j-mix2'),
        profiles: [
          _profile('prof-a', AiProviderId.gemini),
          _profile('prof-b', AiProviderId.gpt),
        ],
      );
      final o2 = await h2.orchestrator.execute(d2, _prompt());
      expect(o2, isA<ExecutionExecuted>());
      expect((o2 as ExecutionExecuted).job.provider, AiProviderId.gpt);
    });
  });

  group('end-to-end — the complete M12 spine on real frozen contracts', () {
    test('plan → route (M12C) → execute (M12D) → stage (M12A) → accept → '
        'command bus (M2) with provenance', () async {
      // Real document engine behind the real staging area.
      final engine = DocumentEngine(
        document: _docWithArtboard(),
        clock: FixedClock(_t0),
        historyIds: SequentialIdGenerator(prefix: 'h'),
      );
      final staging = ProposalStagingArea(
        sink: engine.apply,
        clock: FixedClock(_t0),
        provenanceIds: SequentialIdGenerator(prefix: 'prov'),
      );
      final registry = ProviderAdapterRegistryImpl()
        ..register(_FakeAdapter(AiProviderId.claude, succeed: true));
      final orchestrator = ProviderExecutionOrchestrator(
        adapters: registry,
        assembler: _CommandAssembler(),
        staging: staging,
      );

      // 1. Plan (M12B) + route (M12C).
      final decision =
          CapabilityJobRouter().route(_plannedJob(id: 'j-e2e'), [
                _profile(
                  'prof-claude',
                  AiProviderId.claude,
                  models: ['claude-fable-5'],
                ),
              ])
              as RoutingRouted;

      // 2. Execute (M12D): adapter → assembler → staged proposal.
      final outcome =
          await orchestrator.execute(decision, _prompt()) as ExecutionExecuted;
      expect(outcome.job.status, AiJobStatus.succeeded);
      expect(staging.staged.single.id, outcome.proposalId);
      expect(engine.document.aiProvenance, isEmpty); // I2: bus untouched

      // 3. Accept (M12A): the ONLY path to the bus.
      final result = staging.accept(outcome.proposalId, author: 'designer-1');
      expect(result, isA<CommandApplied>());
      final ledger = engine.document.aiProvenance;
      expect(ledger.single.provider, AiProviderId.claude);
      expect(ledger.single.promptHash, 'sha256:m12d');
      expect(ledger.single.revision, (result as CommandApplied).revision);
    });
  });
}

// ---------------------------------------------------------------------------
// Fixtures (frozen models; fakes only at the injected seams).
// ---------------------------------------------------------------------------

final DateTime _t0 = DateTime.utc(2026, 7, 20, 12);

/// Configurable frozen-contract adapter: records prompts, replies per
/// configuration. Failure is modelled as `ProviderResponse(succeeded:
/// false)` per the frozen contract.
final class _FakeAdapter implements ProviderAdapter {
  _FakeAdapter(
    this.provider, {
    required this.succeed,
    this.error,
    this.onSubmit,
  });

  @override
  final AiProviderId provider;
  final bool succeed;
  final String? error;
  final List<CompiledPrompt> submitted = [];
  final void Function(AiProviderId)? onSubmit;

  @override
  Set<AiCapability> get capabilities => const {AiCapability.imageGeneration};

  @override
  Future<ProviderResponse> submit(CompiledPrompt prompt) async {
    submitted.add(prompt);
    onSubmit?.call(provider);
    return ProviderResponse(
      provider: provider,
      succeeded: succeed,
      error: error,
    );
  }
}

/// Fake assembler: builds a real, minimal AiProposal from the job.
final class _CommandAssembler implements ProposalAssembler {
  final List<AiJob> seenJobs = [];

  @override
  AiProposal assemble(AiJob job, ProviderResponse response) {
    seenJobs.add(job);
    return AiProposal(
      id: 'proposal-${job.id}',
      operation: job.operation,
      commands: const [
        DocumentCommand.createLayer(
          artboardId: 'ab-1',
          layer: LayerModel(
            id: 'l-gen',
            name: 'Generated Motif',
            kind: LayerKind.pattern,
          ),
        ),
      ],
      targetNodeIds: job.scopeNodeIds,
      promptHash: job.promptHash,
      provider: job.provider ?? response.provider,
      model: job.model ?? 'unknown',
      constraintVersion: '1.0.0',
      toolVersion: '0.1.0',
      description: 'Assembled from ${response.provider.wireName}',
    );
  }
}

/// Spy sink behind the REAL staging area (M12A precedent).
class _SpySink {
  final List<DocumentCommand> calls = [];

  CommandResult call(
    DocumentCommand command, {
    CommandSource source = CommandSource.user,
    String author = 'local',
    AiProvenanceRecord? provenance,
  }) {
    calls.add(command);
    return CommandResult.applied(revision: calls.length);
  }
}

/// Test harness: real router + real staging area + orchestrator with
/// configurable adapters.
final class _Harness {
  _Harness() {
    staging = ProposalStagingArea(
      sink: sink.call,
      clock: FixedClock(_t0),
      provenanceIds: SequentialIdGenerator(prefix: 'prov'),
    );
    assembler = _CommandAssembler();
    orchestrator = ProviderExecutionOrchestrator(
      adapters: registry,
      assembler: assembler,
      staging: staging,
    );
  }

  final sink = _SpySink();
  final registry = ProviderAdapterRegistryImpl();
  final invocationOrder = <AiProviderId>[];
  late final ProposalStagingArea staging;
  late final _CommandAssembler assembler;
  late final ProviderExecutionOrchestrator orchestrator;
  final Map<AiProviderId, _FakeAdapter> adapters = {};

  void registerAdapter(
    AiProviderId provider, {
    required bool succeed,
    String? error,
  }) {
    final adapter = _FakeAdapter(
      provider,
      succeed: succeed,
      error: error,
      onSubmit: invocationOrder.add,
    );
    adapters[provider] = adapter;
    registry.register(adapter);
  }

  List<CompiledPrompt> submittedPrompts(AiProviderId provider) =>
      adapters[provider]!.submitted;

  /// Routes through the REAL M12C router.
  RoutingRouted route(AiJob job, {List<ProviderProfile>? profiles}) {
    final decision = CapabilityJobRouter().route(
      job,
      profiles ??
          [
            _profile(
              'prof-claude',
              AiProviderId.claude,
              models: ['claude-fable-5'],
            ),
          ],
    );
    return decision as RoutingRouted;
  }
}

AiJob _plannedJob({required String id}) => AiJob(
  id: id,
  operation: AiOperation.motifRefinement,
  scopeNodeIds: const ['node-1'],
  promptHash: 'sha256:m12d',
  requiredCapabilities: const {AiCapability.imageGeneration},
);

ProviderProfile _profile(
  String id,
  AiProviderId provider, {
  List<String> models = const [],
}) => ProviderProfile(
  id: id,
  provider: provider,
  mode: ProviderMode.managed,
  capabilities: const {AiCapability.imageGeneration},
  models: models,
);

CompiledPrompt _prompt() => const CompiledPrompt(
  operation: AiOperation.motifRefinement,
  templateId: 'motif-refine-v1',
  segments: [
    PromptSegment(role: PromptSegmentRole.user, content: 'refine the motif'),
  ],
);

FebricDocument _docWithArtboard() => FebricDocument(
  id: const DocumentId('doc-1'),
  projectId: const ProjectId('project-1'),
  manifest: const DocumentManifest(
    version: DocumentVersion(
      schema: DocumentVersion.currentSchema,
      generator: 'febric-test',
    ),
  ),
  metadata: DocumentMetadata(
    title: 'M12D Orchestration',
    author: 'designer-1',
    createdAt: _t0,
    modifiedAt: _t0,
  ),
  artboards: [
    const Artboard(
      id: 'ab-1',
      name: 'Front Panel',
      size: Size2D(width: 1200, height: 1800),
      dpi: 300,
      backgroundColourHex: '#F0EADD',
      layerRoot: LayerModel(
        id: 'ab-1-layers',
        name: 'Layers',
        kind: LayerKind.artboard,
      ),
      designTreeRoot: DesignNode(
        id: 'ab-1-tree',
        name: 'Artwork',
        type: DesignNodeType.artwork,
      ),
    ),
  ],
);
