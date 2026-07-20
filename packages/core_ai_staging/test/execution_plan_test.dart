import 'package:core_ai/core_ai.dart';
import 'package:core_ai_staging/core_ai_staging.dart';
import 'package:core_document/core_document.dart';
import 'package:core_layer/core_layer.dart';
import 'package:core_lock/core_lock.dart';
import 'package:core_textile/core_textile.dart';
import 'package:test/test.dart';

/// M12E verification suite — ExecutionPlan model + step-7 validation.
void main() {
  group('freeze — PlanViolationKind vocabulary', () {
    test('wire names are frozen — the four §6-step-7 axes', () {
      expect(PlanViolationKind.values.map((v) => v.wireName), [
        'capability_unsupported',
        'locked',
        'scope_exceeds_target',
        'unlabelled_whole_design',
      ]);
      for (final v in PlanViolationKind.values) {
        expect(PlanViolationKind.fromWireName(v.wireName), v);
      }
      expect(
        () => PlanViolationKind.fromWireName('over_budget'),
        throwsArgumentError,
      );
    });
  });

  group('freeze — model JSON round-trips', () {
    test('ExecutionPlan with both step kinds round-trips', () {
      final plan = _plan(
        steps: [
          PlanStep.job(
            job: _job(id: 'j-1'),
            prompt: _prompt(),
            nodeCapability: NodeCapability.aiModify,
          ),
          const PlanStep.command(
            command: DocumentCommand.createLayer(
              artboardId: 'ab-1',
              layer: LayerModel(id: 'l', name: 'L', kind: LayerKind.pattern),
            ),
            description: 'Add the generated layer',
          ),
        ],
      );
      final restored = ExecutionPlan.fromJson(plan.toJson());
      expect(restored, plan);
      final steps = plan.toJson()['steps']! as List;
      expect((steps[0] as Map)['kind'], 'job');
      expect((steps[1] as Map)['kind'], 'command');
      expect(plan.toJson()['operation'], 'motif_refinement');
    });

    test('PlanValidation + PlanViolation round-trip; ok constant', () {
      const validation = PlanValidation(
        valid: false,
        violations: [
          PlanViolation(
            kind: PlanViolationKind.locked,
            stepIndex: 0,
            targetId: 'node-1',
            detail: 'AI lock active',
          ),
        ],
      );
      expect(PlanValidation.fromJson(validation.toJson()), validation);
      expect(validation.toJson()['violations'], hasLength(1));
      expect(PlanValidation.ok.valid, isTrue);
      expect(PlanValidation.ok.violations, isEmpty);
    });
  });

  group('step-7 gate — the four mechanical checks', () {
    const validator = StaticPlanValidator();

    test('a clean plan validates ok', () {
      final verdict = validator.validate(
        _plan(
          steps: [
            PlanStep.job(
              job: _job(id: 'j-ok'),
              prompt: _prompt(),
              nodeCapability: NodeCapability.aiModify,
            ),
          ],
        ),
        targetTypes: {'node-1': DesignNodeType.element},
      );
      expect(verdict, PlanValidation.ok);
    });

    test('I4 — an AI lock on a scoped node is a violation, before any '
        'compute; the lock reason surfaces', () {
      final verdict = validator.validate(
        _plan(
          steps: [
            PlanStep.job(
              job: _job(id: 'j-l'),
              prompt: _prompt(),
            ),
          ],
        ),
        locks: const LockSet(
          locks: [
            LockState(
              scope: LockScope.ai,
              targetId: 'node-1',
              reason: 'client approval pending',
            ),
          ],
        ),
      );
      expect(verdict.valid, isFalse);
      final v = verdict.violations.single;
      expect(v.kind, PlanViolationKind.locked);
      expect(v.targetId, 'node-1');
      expect(v.detail, 'client approval pending');
    });

    test('I4 — the frozen lock hierarchy applies (a project lock implies '
        'the ai scope)', () {
      final verdict = validator.validate(
        _plan(
          steps: [
            PlanStep.job(
              job: _job(id: 'j-h'),
              prompt: _prompt(),
            ),
          ],
        ),
        locks: const LockSet(locks: [LockState(scope: LockScope.project)]),
      );
      expect(verdict.violations.single.kind, PlanViolationKind.locked);
    });

    test('I3 — scope ⊆ target: a node outside affectedNodeIds violates', () {
      final verdict = validator.validate(
        _plan(
          affectedNodeIds: const ['node-1'],
          steps: [
            PlanStep.job(
              job: _job(id: 'j-s', scopeNodeIds: const ['node-1', 'node-x']),
              prompt: _prompt(),
            ),
          ],
        ),
      );
      final v = verdict.violations.single;
      expect(v.kind, PlanViolationKind.scopeExceedsTarget);
      expect(v.targetId, 'node-x');
    });

    test('I3 — a job mask outside the plan\'s declared mask set violates', () {
      final verdict = validator.validate(
        _plan(
          scopeMaskIds: const ['mask-1'],
          steps: [
            PlanStep.job(
              job: _job(id: 'j-m', scopeMaskIds: const ['mask-2']),
              prompt: _prompt(),
            ),
          ],
        ),
      );
      final v = verdict.violations.single;
      expect(v.kind, PlanViolationKind.scopeExceedsTarget);
      expect(v.targetId, 'mask-2');
    });

    test('I6 — an unlabelled whole-design job violates; the explicit '
        'label clears it', () {
      const redesign = AiJob(
        id: 'j-i6',
        operation: AiOperation.redesignTextilePrint,
        scopeNodeIds: ['node-1'],
        promptHash: 'sha256:m12e',
      );
      final unlabelled = validator.validate(
        _plan(
          steps: [PlanStep.job(job: redesign, prompt: _prompt())],
        ),
      );
      expect(
        unlabelled.violations.single.kind,
        PlanViolationKind.unlabelledWholeDesign,
      );

      final labelled = validator.validate(
        _plan(
          wholeDesignRegeneration: true,
          steps: [PlanStep.job(job: redesign, prompt: _prompt())],
        ),
      );
      expect(labelled, PlanValidation.ok);
    });

    test('capability matrix — the frozen row refuses an unsupported '
        'capability (repeat on a motif is fine; repeat on artwork is not)', () {
      // motif supports repeat per the frozen matrix; artwork does not.
      final onMotif = validator.validate(
        _plan(
          steps: [
            PlanStep.job(
              job: _job(id: 'j-c1'),
              prompt: _prompt(),
              nodeCapability: NodeCapability.repeat,
            ),
          ],
        ),
        targetTypes: {'node-1': DesignNodeType.element},
      );
      expect(onMotif, PlanValidation.ok);

      final onArtwork = validator.validate(
        _plan(
          steps: [
            PlanStep.job(
              job: _job(id: 'j-c2'),
              prompt: _prompt(),
              nodeCapability: NodeCapability.repeat,
            ),
          ],
        ),
        targetTypes: const {'node-1': DesignNodeType.artwork},
      );
      final v = onArtwork.violations.single;
      expect(v.kind, PlanViolationKind.capabilityUnsupported);
      expect(v.detail, contains('artwork'));
    });

    test('capability — an unknown target type fails closed', () {
      final verdict = validator.validate(
        _plan(
          steps: [
            PlanStep.job(
              job: _job(id: 'j-u'),
              prompt: _prompt(),
              nodeCapability: NodeCapability.aiModify,
            ),
          ],
        ),
        // targetTypes deliberately empty.
      );
      final v = verdict.violations.single;
      expect(v.kind, PlanViolationKind.capabilityUnsupported);
      expect(v.detail, contains('cannot be verified'));
    });

    test('violations accumulate — every failure reports at once, anchored '
        'to its step', () {
      final verdict = validator.validate(
        _plan(
          affectedNodeIds: const ['node-1'],
          steps: [
            PlanStep.job(
              job: _job(id: 'j-a', scopeNodeIds: const ['node-x']),
              prompt: _prompt(),
            ),
            PlanStep.job(
              job: const AiJob(
                id: 'j-b',
                operation: AiOperation.redesignTextilePrint,
                scopeNodeIds: ['node-1'],
                promptHash: 'sha256:m12e',
              ),
              prompt: _prompt(),
            ),
          ],
        ),
        locks: const LockSet(
          locks: [LockState(scope: LockScope.ai, targetId: 'node-1')],
        ),
      );
      expect(verdict.valid, isFalse);
      expect(verdict.violations, hasLength(3));
      expect(verdict.violations.map((v) => v.kind), [
        PlanViolationKind.scopeExceedsTarget, // step 0: node-x
        PlanViolationKind.unlabelledWholeDesign, // step 1: I6
        PlanViolationKind.locked, // step 1: node-1 AI-locked
      ]);
      expect(verdict.violations.map((v) => v.stepIndex), [0, 1, 1]);
    });

    test('command steps raise no step-7 violations (they gate at staging '
        'acceptance); determinism: same inputs → same verdict', () {
      final plan = _plan(
        steps: const [
          PlanStep.command(
            command: DocumentCommand.createLayer(
              artboardId: 'ab-1',
              layer: LayerModel(id: 'l', name: 'L', kind: LayerKind.pattern),
            ),
            description: 'Add layer',
          ),
        ],
      );
      const validator = StaticPlanValidator();
      expect(validator.validate(plan), PlanValidation.ok);
      expect(validator.validate(plan), validator.validate(plan));
    });
  });
}

AiJob _job({
  required String id,
  List<String> scopeNodeIds = const ['node-1'],
  List<String> scopeMaskIds = const [],
}) => AiJob(
  id: id,
  operation: AiOperation.motifRefinement,
  scopeNodeIds: scopeNodeIds,
  scopeMaskIds: scopeMaskIds,
  promptHash: 'sha256:m12e',
  requiredCapabilities: const {AiCapability.imageGeneration},
);

CompiledPrompt _prompt() => const CompiledPrompt(
  operation: AiOperation.motifRefinement,
  templateId: 'motif-refine-v1',
);

ExecutionPlan _plan({
  List<PlanStep> steps = const [],
  List<String> affectedNodeIds = const ['node-1'],
  List<String> scopeMaskIds = const [],
  bool wholeDesignRegeneration = false,
}) => ExecutionPlan(
  id: 'plan-1',
  operation: AiOperation.motifRefinement,
  steps: steps,
  scopeMaskIds: scopeMaskIds,
  affectedNodeIds: affectedNodeIds,
  wholeDesignRegeneration: wholeDesignRegeneration,
  promptHash: 'sha256:m12e-plan',
  provider: AiProviderId.claude,
  model: 'claude-fable-5',
  constraintVersion: '1.0.0',
  toolVersion: '0.1.0',
);
