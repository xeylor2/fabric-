import 'package:core_ai/src/conversation/prompt_template.dart';
import 'package:core_ai/src/prompt/prompt_pipeline.dart';

/// Stage 4 (ADR-0009) reference [ConstraintEngine]: the frozen doc-contract
/// — "derives hard constraints from context (locks, palette, scope). Locks
/// become constraints *before* any compute is spent (invariant I4)" —
/// implemented as pure data transformation. Every constraint is a
/// mechanical image of frozen input data; no heuristics, no policy.
///
/// Deterministic: same (intent, context) → the same constraint list, in a
/// fixed order (locks, then palette, then scope).
final class LockConstraintEngine implements ConstraintEngine {
  const LockConstraintEngine();

  @override
  List<PromptConstraint> derive(PromptIntent intent, PromptContext context) {
    final constraints = <PromptConstraint>[];

    // I4 — every active lock becomes a hard constraint before any compute
    // is spent. The frozen LockState carries the vocabulary verbatim.
    for (final lock in context.locks.locks) {
      constraints.add(
        PromptConstraint(
          kind: PromptConstraintKind.lockedRegion,
          description: lock.targetId == null
              ? 'Locked scope: ${lock.scope.wireName}'
              : 'Locked ${lock.scope.wireName}: ${lock.targetId}',
          payload: {
            'scope': lock.scope.wireName,
            if (lock.targetId != null) 'targetId': lock.targetId,
            if (lock.reason != null) 'reason': lock.reason,
          },
        ),
      );
    }

    // Palette lock — the working palette becomes a hard constraint.
    if (context.paletteHex.isNotEmpty) {
      constraints.add(
        PromptConstraint(
          kind: PromptConstraintKind.palette,
          description:
              'Restrict output to the working palette '
              '(${context.paletteHex.length} colours)',
          payload: {'palette': context.paletteHex},
        ),
      );
    }

    // Scope — the intent's resolved targets become the declared scope
    // (invariant I3: the constraint carries ids only).
    if (intent.targetIds.isNotEmpty) {
      constraints.add(
        PromptConstraint(
          kind: PromptConstraintKind.scopeMask,
          description:
              'Affect only the resolved targets '
              '(${intent.targetIds.length} node(s))',
          payload: {'targetIds': intent.targetIds},
        ),
      );
    }

    return constraints;
  }
}

/// Stage 5+6 (ADR-0009) reference [PromptCompiler]: compiles intent +
/// context + constraints through an injected [PromptTemplate] into the
/// frozen provider-independent `CompiledPrompt` — pure assembly mechanics.
///
/// Placeholder substitution is minimal and deterministic. The compiler
/// substitutes only the **derived keys** exposed by [substitutionsFor] —
/// each a 1:1 reflection of a frozen model field it receives, not an
/// independent frozen vocabulary (the approved placeholder determination:
/// the keys mirror the frozen field names they derive from and follow
/// those fields' evolution). Unknown `{{key}}` markers in an injected
/// template are **left verbatim** — never erased, never errored: a
/// template using keys beyond the derived set is exercising policy this
/// package doesn't interpret. No conditionals, no loops — anything richer
/// is prompt-engineering policy and stays injected.
///
/// Constraints are attached **verbatim** to the compiled prompt (the
/// ADR-0009 mandate: constraints ride the prompt and are re-validated
/// post-execution) and additionally rendered as one `constraint`-role
/// segment so they are *in* the prompt the provider sees.
final class TemplatePromptCompiler implements PromptCompiler {
  TemplatePromptCompiler({
    required PromptTemplateRegistry templates,
    required String templateId,
    ConversationInput? input,
    int? seed,
    // ignore: prefer_initializing_formals
  }) : _templates = templates,
       // ignore: prefer_initializing_formals
       _templateId = templateId,
       // ignore: prefer_initializing_formals
       _input = input,
       // ignore: prefer_initializing_formals
       _seed = seed;

  final PromptTemplateRegistry _templates;
  final String _templateId;
  final ConversationInput? _input;
  final int? _seed;

  @override
  CompiledPrompt compile({
    required PromptIntent intent,
    required PromptContext context,
    required List<PromptConstraint> constraints,
  }) {
    final operation = intent.operation;
    if (operation == null) {
      throw ArgumentError.value(
        intent.kind.wireName,
        'intent',
        'Only an AI-backed intent (with a frozen AiOperation) compiles to '
            'a CompiledPrompt',
      );
    }
    final template = _templates.templateFor(_templateId);
    if (template == null) {
      // An unregistered template is a caller error — never a fabricated
      // prompt (the M12B unpriced-operation philosophy).
      throw ArgumentError.value(
        _templateId,
        'templateId',
        'No template registered under this id',
      );
    }

    final substitutions = substitutionsFor(
      intent: intent,
      context: context,
      constraints: constraints,
      input: _input,
    );

    final segments = <PromptSegment>[
      for (final segment in template.segments)
        PromptSegment(
          role: segment.role,
          content: _substitute(segment.content, substitutions),
        ),
      if (constraints.isNotEmpty)
        PromptSegment(
          role: PromptSegmentRole.constraint,
          content: constraints.map((c) => c.description).join('\n'),
        ),
    ];

    return CompiledPrompt(
      operation: operation,
      templateId: template.id,
      segments: segments,
      constraints: constraints,
      seed: _seed,
    );
  }

  /// The derived substitution map — pure, inspectable as data.
  ///
  /// Every key is a 1:1 reflection of a frozen model field or frozen
  /// `PromptCompiler.compile` parameter (absent values substitute to the
  /// empty string, never a fabricated value):
  ///
  /// | key | frozen source |
  /// |---|---|
  /// | `utterance` | `ConversationInput.utterance` |
  /// | `operation` | `PromptIntent.operation` (wire name) |
  /// | `document` | `PromptContext.documentSummary` |
  /// | `selection` | `PromptContext.selectionSummary` |
  /// | `constraints` | the `constraints` parameter (descriptions) |
  ///
  /// This is NOT a frozen vocabulary: the keys mirror the frozen field
  /// names they derive from and follow those fields' evolution. Which
  /// keys an injected template *uses* is the injector's policy.
  static Map<String, String> substitutionsFor({
    required PromptIntent intent,
    required PromptContext context,
    required List<PromptConstraint> constraints,
    ConversationInput? input,
  }) {
    return {
      'utterance': input?.utterance ?? '',
      'operation': intent.operation?.wireName ?? '',
      'document': context.documentSummary ?? '',
      'selection': context.selectionSummary ?? '',
      'constraints': constraints.map((c) => c.description).join('; '),
    };
  }

  /// Replaces each derived `{{key}}` with its value. Markers for keys
  /// outside [values] are left verbatim (uninterpreted policy).
  static String _substitute(String content, Map<String, String> values) {
    var result = content;
    for (final entry in values.entries) {
      result = result.replaceAll('{{${entry.key}}}', entry.value);
    }
    return result;
  }
}

/// Stage 8 (ADR-0009) reference [PromptValidator]: the frozen "static
/// validation gate before execution" — **structural and
/// internal-consistency checks over the single [CompiledPrompt] value
/// only** (the approved responsibility determination). Semantic validation
/// stays with its designated owners: plan validation (M12E), routing
/// (M12C), post-execution constraint re-validation (ADR-0013 stages).
///
/// The seven frozen checks, violations reported as the frozen
/// `List<String>` (no new vocabulary — `PromptValidation.violations` is
/// frozen as strings):
/// 1. segments non-empty;
/// 2. every segment content non-blank;
/// 3. templateId non-blank;
/// 4. frozen role ordering respected (system ≤ context ≤ user/constraint);
/// 5. every constraint description non-blank;
/// 6. attached constraints appear as a constraint-role segment;
/// 7. seed, when present, non-negative.
final class StaticPromptValidator implements PromptValidator {
  const StaticPromptValidator();

  @override
  PromptValidation validate(CompiledPrompt prompt) {
    final violations = <String>[];

    // 1 — an empty prompt cannot be submitted.
    if (prompt.segments.isEmpty) {
      violations.add('Prompt has no segments');
    }

    // 2 — blank segments carry nothing to the provider.
    for (final (i, segment) in prompt.segments.indexed) {
      if (segment.content.trim().isEmpty) {
        violations.add(
          'Segment $i (${segment.role.wireName}) has blank content',
        );
      }
    }

    // 3 — a blank template id defeats provenance linkage.
    if (prompt.templateId.trim().isEmpty) {
      violations.add('Template id is blank');
    }

    // 4 — the frozen role ordering: system before context before
    // user/constraint (PromptSegmentRole is a frozen ordered vocabulary).
    var highestSeen = 0;
    for (final (i, segment) in prompt.segments.indexed) {
      final rank = segment.role.index;
      if (rank < highestSeen) {
        violations.add(
          'Segment $i (${segment.role.wireName}) violates the frozen '
          'role ordering',
        );
      } else {
        highestSeen = rank;
      }
    }

    // 5 — a blank constraint is unverifiable post-execution.
    for (final (i, constraint) in prompt.constraints.indexed) {
      if (constraint.description.trim().isEmpty) {
        violations.add(
          'Constraint $i (${constraint.kind.wireName}) has a blank '
          'description',
        );
      }
    }

    // 6 — constraints must be IN the prompt, not merely attached beside it.
    if (prompt.constraints.isNotEmpty &&
        !prompt.segments.any((s) => s.role == PromptSegmentRole.constraint)) {
      violations.add(
        'Constraints are attached but no constraint-role segment exists',
      );
    }

    // 7 — reproducibility seeds are non-negative.
    final seed = prompt.seed;
    if (seed != null && seed < 0) {
      violations.add('Seed is negative');
    }

    return violations.isEmpty
        ? PromptValidation.ok
        : PromptValidation(valid: false, violations: violations);
  }
}
