import 'package:core_ai/core_ai.dart';
import 'package:core_lock/core_lock.dart';
import 'package:core_textile/core_textile.dart';
import 'package:test/test.dart';

/// M12F verification suite — deterministic prompt compilation.
///
/// All template CONTENT below is TEST-SUPPLIED policy: the package ships
/// no prompt copy (the approved injected-policy doctrine).
void main() {
  group('template registry — keyed by template id', () {
    test('register keys by template.id and returns it; resolution and '
        'replacement follow the M11/M12D registry semantics', () {
      final registry = PromptTemplateRegistryImpl();
      final id = registry.register(_template());
      expect(id, 'motif-refine-v1');
      expect(registry.isRegistered('motif-refine-v1'), isTrue);
      expect(registry.isRegistered('ghost'), isFalse);
      expect(registry.templateFor('motif-refine-v1')!.segments, hasLength(3));
      expect(registry.templateFor('ghost'), isNull);
      const replacement = PromptTemplate(
        id: 'motif-refine-v1',
        segments: [PromptSegment(role: PromptSegmentRole.user, content: 'v2')],
      );
      registry.register(replacement);
      expect(registry.templateFor('motif-refine-v1'), replacement);
      expect(registry.registeredIds, ['motif-refine-v1']);
      expect(() => registry.registeredIds.clear(), throwsUnsupportedError);
    });

    test(
      'PromptTemplate JSON round-trips on the frozen segment vocabulary',
      () {
        final template = _template();
        expect(PromptTemplate.fromJson(template.toJson()), template);
        final segments = template.toJson()['segments']! as List;
        expect((segments[0] as Map)['role'], 'system');
      },
    );
  });

  group('LockConstraintEngine — the frozen I4 mapping as data', () {
    const engine = LockConstraintEngine();

    test('locks become lockedRegion constraints before any compute; the '
        'frozen LockState vocabulary rides the payload', () {
      final constraints = engine.derive(
        _intent(),
        const PromptContext(
          locks: LockSet(
            locks: [
              LockState(
                scope: LockScope.layer,
                targetId: 'l-border',
                reason: 'client approved',
              ),
              LockState(scope: LockScope.ai),
            ],
          ),
        ),
      );
      expect(constraints, hasLength(2));
      expect(constraints.map((c) => c.kind).toSet(), {
        PromptConstraintKind.lockedRegion,
      });
      expect(constraints[0].payload['scope'], 'layer');
      expect(constraints[0].payload['targetId'], 'l-border');
      expect(constraints[0].payload['reason'], 'client approved');
      expect(constraints[1].payload.containsKey('targetId'), isFalse);
    });

    test('palette and resolved targets map to palette / scopeMask '
        'constraints (I3: ids only)', () {
      final constraints = engine.derive(
        _intent(targetIds: const ['node-1', 'node-2']),
        const PromptContext(paletteHex: ['#AA0000', '#00AA00']),
      );
      expect(constraints.map((c) => c.kind), [
        PromptConstraintKind.palette,
        PromptConstraintKind.scopeMask,
      ]);
      expect(constraints[0].payload['palette'], ['#AA0000', '#00AA00']);
      expect(constraints[1].payload['targetIds'], ['node-1', 'node-2']);
    });

    test('empty context derives no constraints; determinism: same inputs '
        '→ same list', () {
      expect(engine.derive(_intent(), const PromptContext()), isEmpty);
      final a = engine.derive(_intent(), _context());
      final b = engine.derive(_intent(), _context());
      expect(a, b);
    });
  });

  group('TemplatePromptCompiler — stage 5+6 assembly mechanics', () {
    test('compiles through the injected template with mechanical '
        'placeholder substitution; constraints attach verbatim AND render '
        'as a constraint-role segment', () {
      final compiler = _compiler(seed: 42);
      final constraints = const LockConstraintEngine().derive(
        _intent(targetIds: const ['node-1']),
        _context(),
      );
      final prompt = compiler.compile(
        intent: _intent(targetIds: const ['node-1']),
        context: _context(),
        constraints: constraints,
      );
      expect(prompt.operation, AiOperation.motifRefinement);
      expect(prompt.templateId, 'motif-refine-v1');
      expect(prompt.seed, 42);
      // Substitution happened mechanically.
      expect(prompt.segments[0].content, 'You are FEBRIC.');
      expect(
        prompt.segments[1].content,
        'Document: front panel; Selection: hero paisley',
      );
      expect(
        prompt.segments[2].content,
        'refine the hero motif (motif_refinement)',
      );
      // Constraints ride the prompt verbatim (ADR-0009) and are IN it.
      expect(prompt.constraints, constraints);
      expect(prompt.segments.last.role, PromptSegmentRole.constraint);
      expect(prompt.segments.last.content, contains('Locked scope: ai'));
      // The compiled prompt passes the frozen stage-8 gate.
      expect(
        const StaticPromptValidator().validate(prompt),
        PromptValidation.ok,
      );
    });

    test('absent optional inputs substitute to the empty string '
        '(deterministic, never a fabricated value)', () {
      final prompt = _compiler(input: null).compile(
        intent: _intent(),
        context: const PromptContext(),
        constraints: const [],
      );
      expect(prompt.segments[1].content, 'Document: ; Selection: ');
      expect(prompt.segments[2].content, ' (motif_refinement)');
    });

    test('determinism: same inputs → identical CompiledPrompt across '
        'calls and fresh compilers', () {
      final constraints = const LockConstraintEngine().derive(
        _intent(),
        _context(),
      );
      CompiledPrompt run() => _compiler(seed: 7).compile(
        intent: _intent(),
        context: _context(),
        constraints: constraints,
      );
      expect(run(), run());
    });

    test('substitutionsFor exposes the derived map as data — each key a '
        '1:1 reflection of a frozen field (the approved determination)', () {
      final constraints = const LockConstraintEngine().derive(
        _intent(),
        _context(),
      );
      final map = TemplatePromptCompiler.substitutionsFor(
        intent: _intent(),
        context: _context(),
        constraints: constraints,
        input: const ConversationInput(utterance: 'refine the hero motif'),
      );
      expect(map.keys, [
        'utterance',
        'operation',
        'document',
        'selection',
        'constraints',
      ]);
      expect(map['utterance'], 'refine the hero motif');
      expect(map['operation'], AiOperation.motifRefinement.wireName);
      expect(map['document'], 'front panel');
      expect(map['selection'], 'hero paisley');
      expect(
        map['constraints'],
        constraints.map((c) => c.description).join('; '),
      );
      // Absent inputs reflect to empty strings, never fabricated values.
      final bare = TemplatePromptCompiler.substitutionsFor(
        intent: const PromptIntent(kind: ConversationIntentKind.query),
        context: const PromptContext(),
        constraints: const [],
      );
      expect(bare.values.every((v) => v.isEmpty), isTrue);
    });

    test('unknown {{key}} markers are left verbatim — uninterpreted '
        'injected policy, never erased, never errored', () {
      final registry = PromptTemplateRegistryImpl()
        ..register(
          const PromptTemplate(
            id: 'policy-keys-v1',
            segments: [
              PromptSegment(
                role: PromptSegmentRole.user,
                content: '{{utterance}} in {{house_style}} for {{season}}',
              ),
            ],
          ),
        );
      final prompt =
          TemplatePromptCompiler(
            templates: registry,
            templateId: 'policy-keys-v1',
            input: const ConversationInput(utterance: 'refine'),
          ).compile(
            intent: _intent(),
            context: const PromptContext(),
            constraints: const [],
          );
      expect(
        prompt.segments.single.content,
        'refine in {{house_style}} for {{season}}',
      );
    });

    test('a non-AI intent (no frozen operation) is a caller error', () {
      expect(
        () => _compiler().compile(
          intent: const PromptIntent(kind: ConversationIntentKind.query),
          context: const PromptContext(),
          constraints: const [],
        ),
        throwsArgumentError,
      );
    });

    test('an unregistered template id is a caller error — never a '
        'fabricated prompt', () {
      final compiler = TemplatePromptCompiler(
        templates: PromptTemplateRegistryImpl(),
        templateId: 'ghost',
      );
      expect(
        () => compiler.compile(
          intent: _intent(),
          context: const PromptContext(),
          constraints: const [],
        ),
        throwsArgumentError,
      );
    });
  });

  group('StaticPromptValidator — the frozen structural gate (7 checks)', () {
    const validator = StaticPromptValidator();

    test('a well-formed prompt validates ok', () {
      expect(validator.validate(_wellFormed()), PromptValidation.ok);
    });

    test('1: no segments; 3: blank template id', () {
      final verdict = validator.validate(
        const CompiledPrompt(
          operation: AiOperation.motifRefinement,
          templateId: '  ',
        ),
      );
      expect(verdict.valid, isFalse);
      expect(verdict.violations, [
        'Prompt has no segments',
        'Template id is blank',
      ]);
    });

    test('2: blank segment content is reported per segment', () {
      final verdict = validator.validate(
        _wellFormed().copyWith(
          segments: const [
            PromptSegment(role: PromptSegmentRole.system, content: '  '),
            PromptSegment(role: PromptSegmentRole.user, content: 'ok'),
          ],
        ),
      );
      expect(verdict.violations.single, contains('Segment 0 (system)'));
    });

    test('4: the frozen role ordering — a system segment after user '
        'violates; equal roles and forward order pass', () {
      final verdict = validator.validate(
        _wellFormed().copyWith(
          segments: const [
            PromptSegment(role: PromptSegmentRole.user, content: 'u'),
            PromptSegment(role: PromptSegmentRole.system, content: 's'),
          ],
        ),
      );
      expect(
        verdict.violations.single,
        contains('violates the frozen role ordering'),
      );
      final ok = validator.validate(
        _wellFormed().copyWith(
          segments: const [
            PromptSegment(role: PromptSegmentRole.system, content: 'a'),
            PromptSegment(role: PromptSegmentRole.system, content: 'b'),
            PromptSegment(role: PromptSegmentRole.context, content: 'c'),
            PromptSegment(role: PromptSegmentRole.user, content: 'd'),
          ],
        ),
      );
      expect(ok, PromptValidation.ok);
    });

    test('5: blank constraint description; 6: constraints attached but '
        'not in the prompt', () {
      final verdict = validator.validate(
        _wellFormed().copyWith(
          constraints: const [
            PromptConstraint(
              kind: PromptConstraintKind.palette,
              description: ' ',
            ),
          ],
          segments: const [
            PromptSegment(role: PromptSegmentRole.user, content: 'u'),
          ],
        ),
      );
      expect(verdict.violations, [
        'Constraint 0 (palette) has a blank description',
        'Constraints are attached but no constraint-role segment exists',
      ]);
    });

    test('7: negative seed violates; zero and positive pass', () {
      expect(
        validator.validate(_wellFormed().copyWith(seed: -1)).violations.single,
        'Seed is negative',
      );
      expect(validator.validate(_wellFormed().copyWith(seed: 0)).valid, isTrue);
    });

    test('violations accumulate across checks; verdict uses the frozen '
        'PromptValidation strings (no new vocabulary)', () {
      final verdict = validator.validate(
        const CompiledPrompt(
          operation: AiOperation.motifRefinement,
          templateId: '',
          seed: -5,
          constraints: [
            PromptConstraint(
              kind: PromptConstraintKind.safety,
              description: 'no logos',
            ),
          ],
        ),
      );
      expect(verdict.valid, isFalse);
      expect(verdict.violations, hasLength(4));
      expect(PromptValidation.fromJson(verdict.toJson()), verdict);
    });
  });

  group('end-to-end — compiled prompt through the frozen ADR-0009 seam', () {
    test('derive → compile → validate → ProviderAdapter.submit receives '
        'the CompiledPrompt (the structural guarantee, executed)', () async {
      final constraints = const LockConstraintEngine().derive(
        _intent(targetIds: const ['node-1']),
        _context(),
      );
      final prompt = _compiler(seed: 9).compile(
        intent: _intent(targetIds: const ['node-1']),
        context: _context(),
        constraints: constraints,
      );
      expect(
        const StaticPromptValidator().validate(prompt),
        PromptValidation.ok,
      );
      final adapter = _CapturingAdapter();
      final response = await adapter.submit(prompt);
      expect(response.succeeded, isTrue);
      expect(adapter.received.single, same(prompt));
      expect(adapter.received.single.constraints, constraints);
    });
  });
}

/// Frozen-contract adapter capturing what it receives (test seam only).
final class _CapturingAdapter implements ProviderAdapter {
  final List<CompiledPrompt> received = [];

  @override
  AiProviderId get provider => AiProviderId.claude;

  @override
  Set<AiCapability> get capabilities => const {AiCapability.imageGeneration};

  @override
  Future<ProviderResponse> submit(CompiledPrompt prompt) async {
    received.add(prompt);
    return const ProviderResponse(
      provider: AiProviderId.claude,
      succeeded: true,
    );
  }
}

PromptTemplate _template() => const PromptTemplate(
  id: 'motif-refine-v1',
  segments: [
    PromptSegment(role: PromptSegmentRole.system, content: 'You are FEBRIC.'),
    PromptSegment(
      role: PromptSegmentRole.context,
      content: 'Document: {{document}}; Selection: {{selection}}',
    ),
    PromptSegment(
      role: PromptSegmentRole.user,
      content: '{{utterance}} ({{operation}})',
    ),
  ],
);

TemplatePromptCompiler _compiler({
  ConversationInput? input = const ConversationInput(
    utterance: 'refine the hero motif',
  ),
  int? seed,
}) => TemplatePromptCompiler(
  templates: PromptTemplateRegistryImpl()..register(_template()),
  templateId: 'motif-refine-v1',
  input: input,
  seed: seed,
);

PromptIntent _intent({List<String> targetIds = const []}) => PromptIntent(
  kind: ConversationIntentKind.modify,
  operation: AiOperation.motifRefinement,
  targetIds: targetIds,
);

PromptContext _context() => const PromptContext(
  documentSummary: 'front panel',
  selectionSummary: 'hero paisley',
  locks: LockSet(locks: [LockState(scope: LockScope.ai)]),
  paletteHex: ['#AA0000'],
);

CompiledPrompt _wellFormed() => const CompiledPrompt(
  operation: AiOperation.motifRefinement,
  templateId: 'motif-refine-v1',
  segments: [
    PromptSegment(role: PromptSegmentRole.system, content: 's'),
    PromptSegment(role: PromptSegmentRole.user, content: 'u'),
  ],
);
