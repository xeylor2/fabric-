import 'package:core_ai/core_ai.dart';
import 'package:core_lock/core_lock.dart';
import 'package:core_textile/core_textile.dart';
import 'package:test/test.dart';

void main() {
  test(
    'AiProviderId wire names are frozen — Claude, Gemini, GPT, Nano Banana',
    () {
      expect(AiProviderId.values.map((v) => v.wireName), [
        'claude',
        'gemini',
        'gpt',
        'nano_banana',
      ]);
      for (final v in AiProviderId.values) {
        expect(AiProviderId.fromWireName(v.wireName), v);
      }
    },
  );

  test(
    'PromptPipelineStage wire names are frozen — the ten stages in order',
    () {
      expect(PromptPipelineStage.values.map((v) => v.wireName), [
        'conversation',
        'intent_parser',
        'context_builder',
        'constraint_engine',
        'prompt_compiler',
        'template_engine',
        'provider_adapter',
        'prompt_validator',
        'execution',
        'result',
      ]);
    },
  );

  test(
    'AiPipelineStage wire names are frozen — the thirteen stages in order',
    () {
      expect(AiPipelineStage.values.map((v) => v.wireName), [
        'conversation',
        'prompt_compiler',
        'constraint_engine',
        'provider_adapter',
        'execution',
        'response_parser',
        'validation',
        'history',
        'document_update',
        'undo_stack',
        'review',
        'approval',
        'production_ready',
      ]);
      expect(AiPipelineStage.conversation.previous, isNull);
      expect(
        AiPipelineStage.approval.previous,
        AiPipelineStage.review,
        reason: 'approval strictly follows review',
      );
    },
  );

  test('intent, constraint, segment vocabularies are frozen', () {
    expect(ConversationIntentKind.values.map((v) => v.wireName), [
      'generate',
      'modify',
      'replace',
      'recolour',
      'constraint',
      'arrange',
      'query',
      'batch',
    ]);
    expect(PromptConstraintKind.values.map((v) => v.wireName), [
      'scope_mask',
      'locked_region',
      'palette',
      'dimensions',
      'style_guard',
      'safety',
    ]);
    expect(PromptSegmentRole.values.map((v) => v.wireName), [
      'system',
      'context',
      'user',
      'constraint',
    ]);
    expect(AiCapability.values.map((v) => v.wireName), [
      'text',
      'vision',
      'image_generation',
      'inpainting',
      'segmentation',
      'upscale',
      'embedding',
    ]);
  });

  group('AiPipelineRun — order is unskippable', () {
    test('advances strictly stage by stage to production ready', () {
      var run = const AiPipelineRun(id: 'run-1');
      expect(run.currentStage, isNull);
      for (final stage in AiPipelineStage.values) {
        expect(run.nextStage, stage);
        run = run.advanceTo(stage);
      }
      expect(run.isComplete, isTrue);
      expect(run.nextStage, isNull);
    });

    test('skipping a stage throws', () {
      const run = AiPipelineRun(id: 'run-2');
      expect(
        () => run.advanceTo(AiPipelineStage.execution),
        throwsStateError,
        reason: 'cannot execute before compiling and constraining',
      );
      expect(
        () => run
            .advanceTo(AiPipelineStage.conversation)
            .advanceTo(AiPipelineStage.constraintEngine),
        throwsStateError,
        reason: 'cannot bypass the prompt compiler',
      );
    });

    test('document update is unreachable before validation', () {
      var run = const AiPipelineRun(id: 'run-3');
      for (final stage in AiPipelineStage.values) {
        if (stage == AiPipelineStage.documentUpdate) {
          break;
        }
        run = run.advanceTo(stage);
      }
      expect(run.completed, contains(AiPipelineStage.validation));
      expect(run.nextStage, AiPipelineStage.documentUpdate);
    });
  });

  group('CompiledPrompt', () {
    const prompt = CompiledPrompt(
      operation: AiOperation.motifRefinement,
      templateId: 'motif-refine-v1',
      segments: [
        PromptSegment(
          role: PromptSegmentRole.system,
          content: 'You refine textile motifs.',
        ),
        PromptSegment(role: PromptSegmentRole.user, content: 'Clean edges.'),
      ],
      constraints: [
        PromptConstraint(
          kind: PromptConstraintKind.scopeMask,
          description: 'Only the selected motif region may change.',
        ),
        PromptConstraint(
          kind: PromptConstraintKind.lockedRegion,
          description: 'Neck border is locked by review.',
        ),
      ],
      seed: 42,
    );

    test('json round trip', () {
      expect(CompiledPrompt.fromJson(prompt.toJson()), prompt);
      expect(prompt.toJson()['operation'], 'motif_refinement');
    });

    test('context carries locks for pre-compute constraint derivation', () {
      const context = PromptContext(
        locks: LockSet(locks: [LockState(scope: LockScope.ai)]),
        paletteHex: ['#8C2B4A', '#F0EADD'],
      );
      expect(PromptContext.fromJson(context.toJson()), context);
      expect(context.locks.isLocked(LockScope.ai), isTrue);
    });
  });
}
