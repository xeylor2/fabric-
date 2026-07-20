import 'package:core_ai/core_ai.dart';
import 'package:core_ai_staging/core_ai_staging.dart';
import 'package:core_common/core_common.dart';
import 'package:core_document/core_document.dart';
import 'package:core_geometry/core_geometry.dart';
import 'package:core_layer/core_layer.dart';
import 'package:core_textile/core_textile.dart';
import 'package:test/test.dart';

/// M12E verification suite — ExecutionPlanDispatcher.
///
/// Real frozen spine throughout: real M12C router, real M12D
/// orchestrator, real M12A staging area (spy sink); fakes only at the
/// injected adapter/assembler seams (the M11/M12D precedent). The final
/// group drives a full plan into a real DocumentEngine.
void main() {
  group('gate — an invalid plan is never dispatched', () {
    test('dispatch with a failed validation throws StateError; nothing '
        'routed, nothing staged', () async {
      final h = _Harness();
      const invalid = PlanValidation(
        valid: false,
        violations: [PlanViolation(kind: PlanViolationKind.locked)],
      );
      await expectLater(
        h.dispatcher.dispatch(
          _plan(steps: [_commandStep()]),
          validation: invalid,
          profiles: h.profiles,
          author: 'designer-1',
        ),
        throwsStateError,
      );
      expect(h.staging.staged, isEmpty);
    });
  });

  group('step dispatch through the frozen spine', () {
    test('a job step routes (M12C) and executes (M12D); the outcome trail '
        'records both', () async {
      final h = _Harness()..registerAdapter(AiProviderId.claude);
      final result = await h.dispatch(_plan(steps: [_jobStep(id: 'j-1')]));
      final outcome = result.outcomes.single as PlanJobOutcome;
      expect(outcome.stepIndex, 0);
      expect(outcome.routing, isA<RoutingRouted>());
      final execution = outcome.execution! as ExecutionExecuted;
      expect(execution.job.status, AiJobStatus.succeeded);
      expect(h.staging.staged, hasLength(1)); // the assembled proposal
    });

    test('a command step is staged as a proposal carrying the plan\'s '
        'provenance precursors (I5) — never a bus emission (I2)', () async {
      final h = _Harness();
      final result = await h.dispatch(_plan(steps: [_commandStep()]));
      final outcome = result.outcomes.single as PlanCommandOutcome;
      final proposal = h.staging.proposal(outcome.proposalId)!;
      expect(proposal.status, AiProposalStatus.staged);
      expect(proposal.promptHash, 'sha256:m12e-plan');
      expect(proposal.provider, AiProviderId.claude);
      expect(proposal.model, 'claude-fable-5');
      expect(proposal.metadata['planId'], 'plan-1');
      expect(proposal.metadata['stepIndex'], 0);
      expect(proposal.commands.single, isA<CreateLayerCommand>());
      expect(h.sink.calls, isEmpty); // I2: the bus is untouched
    });

    test('a noRoute job step records the decision and the plan moves on '
        '(absence of a path is an outcome)', () async {
      final h = _Harness(); // no adapters — but also: no capable profile
      final result = await h.dispatch(
        _plan(
          steps: [
            PlanStep.job(
              job: const AiJob(
                id: 'j-nr',
                operation: AiOperation.motifRefinement,
                scopeNodeIds: ['node-1'],
                promptHash: 'sha256:m12e',
                requiredCapabilities: {AiCapability.embedding},
              ),
              prompt: _prompt(),
            ),
            _commandStep(),
          ],
        ),
      );
      expect(result.outcomes, hasLength(2));
      final jobOutcome = result.outcomes[0] as PlanJobOutcome;
      expect(jobOutcome.routing, isA<RoutingNoRoute>());
      expect(
        (jobOutcome.routing as RoutingNoRoute).reason,
        NoRouteReason.capabilityUnmatched,
      );
      expect(jobOutcome.execution, isNull);
      // The following command step still dispatched.
      expect(result.outcomes[1], isA<PlanCommandOutcome>());
      expect(h.staging.staged, hasLength(1));
    });

    test('mixed plan dispatches sequentially in step order', () async {
      final h = _Harness()..registerAdapter(AiProviderId.claude);
      final result = await h.dispatch(
        _plan(
          steps: [
            _commandStep(),
            _jobStep(id: 'j-mid'),
            _commandStep(description: 'Second edit'),
          ],
        ),
      );
      expect(result.planId, 'plan-1');
      expect(result.outcomes.map((o) => o.stepIndex), [0, 1, 2]);
      expect(result.outcomes[0], isA<PlanCommandOutcome>());
      expect(result.outcomes[1], isA<PlanJobOutcome>());
      expect(result.outcomes[2], isA<PlanCommandOutcome>());
      // Two command proposals + one assembled job proposal.
      expect(h.staging.staged, hasLength(3));
    });
  });

  group('freeze — outcome JSON round-trips', () {
    test('PlanDispatchResult with both outcome kinds round-trips', () async {
      final h = _Harness()..registerAdapter(AiProviderId.claude);
      final result = await h.dispatch(
        _plan(
          steps: [
            _jobStep(id: 'j-json'),
            _commandStep(),
          ],
        ),
      );
      final restored = PlanDispatchResult.fromJson(result.toJson());
      expect(restored, result);
      final outcomes = result.toJson()['outcomes']! as List;
      expect((outcomes[0] as Map)['kind'], 'job');
      expect((outcomes[1] as Map)['kind'], 'command');
    });
  });

  group('end-to-end — §6 steps 6→9 on real frozen contracts', () {
    test('validate → dispatch → staged proposals → accept → command bus '
        'with provenance', () async {
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
      final dispatcher = ExecutionPlanDispatcher(
        router: CapabilityJobRouter(),
        orchestrator: ProviderExecutionOrchestrator(
          adapters: ProviderAdapterRegistryImpl()
            ..register(_FakeAdapter(AiProviderId.claude)),
          assembler: _Assembler(),
          staging: staging,
        ),
        staging: staging,
      );

      final plan = _plan(
        steps: [
          _jobStep(id: 'j-e2e'),
          _commandStep(),
        ],
      );
      // Step 7: the gate, on the real validator.
      final verdict = const StaticPlanValidator().validate(
        plan,
        targetTypes: {'node-1': DesignNodeType.element},
      );
      expect(verdict, PlanValidation.ok);

      // Step 6→8: dispatch; proposals land in staging; bus untouched.
      final result = await dispatcher.dispatch(
        plan,
        validation: verdict,
        profiles: [_profile(AiProviderId.claude)],
        author: 'designer-1',
      );
      expect(result.outcomes, hasLength(2));
      expect(staging.staged, hasLength(2));
      expect(engine.document.aiProvenance, isEmpty); // I2

      // Step 9: accept each proposal — the only path to the bus.
      for (final proposal in staging.staged.toList()) {
        final applied = staging.accept(proposal.id, author: 'designer-1');
        expect(applied, isA<CommandApplied>());
      }
      expect(engine.document.aiProvenance, hasLength(2));
      expect(engine.document.aiProvenance.map((p) => p.provider).toSet(), {
        AiProviderId.claude,
      });
    });
  });
}

// ---------------------------------------------------------------------------
// Fixtures (real frozen contracts; fakes only at injected seams).
// ---------------------------------------------------------------------------

final DateTime _t0 = DateTime.utc(2026, 7, 20, 14);

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

final class _Assembler implements ProposalAssembler {
  @override
  AiProposal assemble(AiJob job, ProviderResponse response) => AiProposal(
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

final class _Harness {
  _Harness() {
    staging = ProposalStagingArea(
      sink: sink.call,
      clock: FixedClock(_t0),
      provenanceIds: SequentialIdGenerator(prefix: 'prov'),
    );
    dispatcher = ExecutionPlanDispatcher(
      router: CapabilityJobRouter(),
      orchestrator: ProviderExecutionOrchestrator(
        adapters: registry,
        assembler: _Assembler(),
        staging: staging,
      ),
      staging: staging,
    );
  }

  final sink = _SpySink();
  final registry = ProviderAdapterRegistryImpl();
  late final ProposalStagingArea staging;
  late final ExecutionPlanDispatcher dispatcher;
  final profiles = [_profile(AiProviderId.claude)];

  void registerAdapter(AiProviderId provider) =>
      registry.register(_FakeAdapter(provider));

  Future<PlanDispatchResult> dispatch(ExecutionPlan plan) =>
      dispatcher.dispatch(
        plan,
        validation: PlanValidation.ok,
        profiles: profiles,
        author: 'designer-1',
      );
}

ProviderProfile _profile(AiProviderId provider) => ProviderProfile(
  id: 'prof-${provider.wireName}',
  provider: provider,
  mode: ProviderMode.managed,
  capabilities: const {AiCapability.imageGeneration},
  models: const ['claude-fable-5'],
);

PlanStep _jobStep({required String id}) => PlanStep.job(
  job: AiJob(
    id: id,
    operation: AiOperation.motifRefinement,
    scopeNodeIds: const ['node-1'],
    promptHash: 'sha256:m12e',
    requiredCapabilities: const {AiCapability.imageGeneration},
  ),
  prompt: _prompt(),
);

PlanStep _commandStep({String description = 'Add the planned layer'}) =>
    PlanStep.command(
      command: const DocumentCommand.createLayer(
        artboardId: 'ab-1',
        layer: LayerModel(id: 'l-cmd', name: 'Planned', kind: LayerKind.vector),
      ),
      description: description,
    );

CompiledPrompt _prompt() => const CompiledPrompt(
  operation: AiOperation.motifRefinement,
  templateId: 'motif-refine-v1',
);

ExecutionPlan _plan({List<PlanStep> steps = const []}) => ExecutionPlan(
  id: 'plan-1',
  operation: AiOperation.motifRefinement,
  steps: steps,
  affectedNodeIds: const ['node-1'],
  promptHash: 'sha256:m12e-plan',
  provider: AiProviderId.claude,
  model: 'claude-fable-5',
  constraintVersion: '1.0.0',
  toolVersion: '0.1.0',
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
    title: 'M12E Plans',
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
