import 'package:core_ai/core_ai.dart';
import 'package:core_document/core_document.dart';
import 'package:core_lock/core_lock.dart';
import 'package:core_textile/core_textile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'execution_plan.freezed.dart';
part 'execution_plan.g.dart';

/// One step of an [ExecutionPlan] — the §6 step-6 union
/// `steps: [AiJob|Command]` as a sealed type (explicit `kind`
/// discriminator, the M12C/M12D precedent).
@Freezed(unionKey: 'kind')
sealed class PlanStep with _$PlanStep {
  /// An AI compute step: the frozen M12B [AiJob] plus the frozen
  /// ADR-0009 [CompiledPrompt] its provider adapter will receive (the
  /// structural guarantee — no step carries raw conversation), plus the
  /// frozen [NodeCapability] this step exercises, declared by the
  /// planner and checked mechanically against the frozen
  /// `NodeCapabilityMatrix` (the M12B `requiredCapabilities`
  /// declared-data pattern; null = no per-node capability claim, the
  /// matrix doc's "tool and AI layers enforce the rest").
  @FreezedUnionValue('job')
  const factory PlanStep.job({
    required AiJob job,
    required CompiledPrompt prompt,
    @JsonKey(fromJson: _capabilityFromJson, toJson: _capabilityToJson)
    NodeCapability? nodeCapability,
  }) = PlanJobStep;

  /// A deterministic edit step: one frozen [DocumentCommand]. Command
  /// steps never bypass staging — dispatch turns them into staged
  /// [AiProposal]s awaiting explicit acceptance (invariant I2).
  @FreezedUnionValue('command')
  const factory PlanStep.command({
    required DocumentCommand command,

    /// Human-readable summary for the staged proposal's review card.
    required String description,
  }) = PlanCommandStep;

  factory PlanStep.fromJson(Map<String, Object?> json) =>
      _$PlanStepFromJson(json);
}

/// The §6 step-6 Execution Plan: the typed artefact every §19 source
/// converges through —
/// `{steps: [AiJob|Command], scope masks, credit estimate, affected
/// nodes}` — proposed by the planning model, validated and dispatched by
/// deterministic client code ("the LLM never holds the pen").
///
/// Carries the provenance precursors of the *plan itself* (the compiled
/// planning prompt's hash and the proposing provider/model), so
/// command-step proposals stage with full invariant-I5 lineage.
@freezed
abstract class ExecutionPlan with _$ExecutionPlan {
  const factory ExecutionPlan({
    /// Stable UUID of this plan.
    required String id,

    /// The frozen textile operation this plan realises (invariant I6:
    /// carried verbatim; see [wholeDesignRegeneration]).
    @JsonKey(fromJson: _operationFromJson, toJson: _operationToJson)
    required AiOperation operation,

    /// Ordered steps (§6: the plan executes in order).
    @Default(<PlanStep>[]) List<PlanStep> steps,

    /// Declared scope-mask ids (invariant I3) — ids only, never
    /// resolved objects.
    @Default(<String>[]) List<String> scopeMaskIds,

    /// Every node id this plan may affect — the step-7 superset each
    /// job step's scope must stay inside (I3: scope ⊆ target).
    @Default(<String>[]) List<String> affectedNodeIds,

    /// Credit estimates for the plan's job steps (the M12B seam;
    /// estimation happens before compute, §6 step 6).
    @Default(<CreditEstimate>[]) List<CreditEstimate> estimates,

    /// Invariant I6: a plan containing a `redesignTextilePrint` job must
    /// carry this explicit label — the validator refuses unlabelled
    /// whole-design work; nothing ever infers it.
    @Default(false) bool wholeDesignRegeneration,

    /// Hash of the compiled planning prompt (the frozen
    /// `AiProvenanceRecord.promptHash` linkage; no raw conversation).
    required String promptHash,

    /// The provider/model that proposed the plan (provenance
    /// precursors, invariant I5).
    @JsonKey(fromJson: _providerFromJson, toJson: _providerToJson)
    required AiProviderId provider,
    required String model,

    /// Versions of the guards that shaped the plan (the frozen
    /// provenance-record versioning precedent).
    required String constraintVersion,
    required String toolVersion,

    @Default(<String, Object?>{}) Map<String, Object?> metadata,
  }) = _ExecutionPlan;

  factory ExecutionPlan.fromJson(Map<String, Object?> json) =>
      _$ExecutionPlanFromJson(json);
}

/// The step-7 violation classes (§6: "capability matrix, locks,
/// scope ⊆ target, I6 gate"). Frozen initial set; append-only.
enum PlanViolationKind {
  /// A step's declared node capability is unsupported by a target's
  /// frozen `NodeCapabilityMatrix` row — or the target's type is
  /// unknown to the validator (fail-closed: unverifiable capability is
  /// a violation, since validation runs *before* compute is spent).
  capabilityUnsupported('capability_unsupported', 'Capability Unsupported'),

  /// A job step's scope hits an active AI lock (invariant I4 —
  /// validated before compute is spent).
  locked('locked', 'Locked'),

  /// A job step's declared scope escapes the plan's affected set
  /// (invariant I3: scope ⊆ target).
  scopeExceedsTarget('scope_exceeds_target', 'Scope Exceeds Target'),

  /// A `redesignTextilePrint` job rides a plan without the explicit
  /// whole-design label (invariant I6: no operation escalates into it).
  unlabelledWholeDesign('unlabelled_whole_design', 'Unlabelled Whole Design');

  const PlanViolationKind(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static PlanViolationKind fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown PlanViolationKind wire name',
      ),
    );
  }
}

/// One step-7 violation, anchored to the step and target that raised it.
@freezed
abstract class PlanViolation with _$PlanViolation {
  const factory PlanViolation({
    @JsonKey(fromJson: _violationKindFromJson, toJson: _violationKindToJson)
    required PlanViolationKind kind,

    /// 0-based index of the offending step, when step-specific.
    int? stepIndex,

    /// The node/mask id that raised the violation, when target-specific.
    String? targetId,

    /// Human-readable detail for UI/telemetry (e.g. the frozen
    /// `LockState.reason`).
    String? detail,
  }) = _PlanViolation;

  factory PlanViolation.fromJson(Map<String, Object?> json) =>
      _$PlanViolationFromJson(json);
}

/// The step-7 verdict (mirrors the frozen `PromptValidation` shape).
@freezed
abstract class PlanValidation with _$PlanValidation {
  const factory PlanValidation({
    required bool valid,
    @Default(<PlanViolation>[]) List<PlanViolation> violations,
  }) = _PlanValidation;

  factory PlanValidation.fromJson(Map<String, Object?> json) =>
      _$PlanValidationFromJson(json);

  const PlanValidation._();

  static const PlanValidation ok = PlanValidation(valid: true);
}

/// The step-7 static validation gate: "static, before compute:
/// capability matrix, locks, scope ⊆ target, I6 gate" (§6) — the
/// deterministic client code the blueprint mandates. Pure: same
/// (plan, locks, targetTypes) → same verdict; no IO, no clock.
abstract interface class PlanValidator {
  /// Validates [plan] against the active [locks] (invariant I4) and
  /// [targetTypes] — the caller-supplied mapping of the plan's target
  /// node ids to their frozen [DesignNodeType]s (data in, never a
  /// document read: this package holds no document access).
  PlanValidation validate(
    ExecutionPlan plan, {
    LockSet locks = LockSet.none,
    Map<String, DesignNodeType> targetTypes = const {},
  });
}

/// Reference [PlanValidator]: exactly the four §6-step-7 mechanical
/// checks, nothing else. Violations accumulate — the verdict reports
/// every failure at once (validation is a review surface, not a
/// short-circuit).
final class StaticPlanValidator implements PlanValidator {
  const StaticPlanValidator();

  @override
  PlanValidation validate(
    ExecutionPlan plan, {
    LockSet locks = LockSet.none,
    Map<String, DesignNodeType> targetTypes = const {},
  }) {
    final violations = <PlanViolation>[];
    final affected = plan.affectedNodeIds.toSet();
    final masks = plan.scopeMaskIds.toSet();

    for (final (i, step) in plan.steps.indexed) {
      if (step is! PlanJobStep) {
        continue;
      }
      final job = step.job;

      // I6 gate: whole-design regeneration must be explicitly labelled.
      if (job.isWholeDesignRegeneration && !plan.wholeDesignRegeneration) {
        violations.add(
          PlanViolation(
            kind: PlanViolationKind.unlabelledWholeDesign,
            stepIndex: i,
            detail:
                'redesign_textile_print requires the explicit '
                'whole-design label on the plan',
          ),
        );
      }

      for (final nodeId in job.scopeNodeIds) {
        // I3: scope ⊆ target.
        if (!affected.contains(nodeId)) {
          violations.add(
            PlanViolation(
              kind: PlanViolationKind.scopeExceedsTarget,
              stepIndex: i,
              targetId: nodeId,
              detail: 'Node is outside the plan\'s affected set',
            ),
          );
        }

        // I4: AI locks block before compute is spent.
        final blocking = locks.blockingLock(LockScope.ai, targetId: nodeId);
        if (blocking != null) {
          violations.add(
            PlanViolation(
              kind: PlanViolationKind.locked,
              stepIndex: i,
              targetId: nodeId,
              detail: blocking.reason ?? 'AI lock active',
            ),
          );
        }

        // Capability matrix (declared capability, mechanical check;
        // unknown target type fails closed — unverifiable capability is
        // a violation before compute).
        final capability = step.nodeCapability;
        if (capability != null) {
          final type = targetTypes[nodeId];
          if (type == null) {
            violations.add(
              PlanViolation(
                kind: PlanViolationKind.capabilityUnsupported,
                stepIndex: i,
                targetId: nodeId,
                detail:
                    'Target type unknown; ${capability.wireName} '
                    'cannot be verified',
              ),
            );
          } else if (!NodeCapabilityMatrix.supports(type, capability)) {
            violations.add(
              PlanViolation(
                kind: PlanViolationKind.capabilityUnsupported,
                stepIndex: i,
                targetId: nodeId,
                detail:
                    '${type.wireName} does not support '
                    '${capability.wireName}',
              ),
            );
          }
        }
      }

      // I3 on masks: a step cannot use masks the plan does not declare.
      for (final maskId in job.scopeMaskIds) {
        if (!masks.contains(maskId)) {
          violations.add(
            PlanViolation(
              kind: PlanViolationKind.scopeExceedsTarget,
              stepIndex: i,
              targetId: maskId,
              detail: 'Mask is outside the plan\'s declared mask set',
            ),
          );
        }
      }
    }

    return violations.isEmpty
        ? PlanValidation.ok
        : PlanValidation(valid: false, violations: violations);
  }
}

AiOperation _operationFromJson(String wireName) =>
    AiOperation.fromWireName(wireName);

String _operationToJson(AiOperation operation) => operation.wireName;

AiProviderId _providerFromJson(String wireName) =>
    AiProviderId.fromWireName(wireName);

String _providerToJson(AiProviderId provider) => provider.wireName;

NodeCapability? _capabilityFromJson(String? wireName) =>
    wireName == null ? null : NodeCapability.fromWireName(wireName);

String? _capabilityToJson(NodeCapability? capability) => capability?.wireName;

PlanViolationKind _violationKindFromJson(String wireName) =>
    PlanViolationKind.fromWireName(wireName);

String _violationKindToJson(PlanViolationKind kind) => kind.wireName;
