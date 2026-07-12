import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_pipeline.freezed.dart';
part 'ai_pipeline.g.dart';

/// The frozen Universal AI Pipeline (ADR-0013): every AI provider and every
/// AI operation flows through exactly these thirteen stages —
/// conversation → prompt compiler → constraint engine → provider adapter →
/// execution → response parser → validation → history → document update →
/// undo stack → review → approval → production ready.
///
/// The stages encode the constitutional invariants structurally: document
/// update happens only after validation and lands on the undo stack (I1);
/// review/approval gate acceptance (I2); constraints run pre-execution (I3,
/// I4); history records provenance (I5).
enum AiPipelineStage {
  conversation('conversation', 'Conversation'),
  promptCompiler('prompt_compiler', 'Prompt Compiler'),
  constraintEngine('constraint_engine', 'Constraint Engine'),
  providerAdapter('provider_adapter', 'Provider Adapter'),
  execution('execution', 'Execution'),
  responseParser('response_parser', 'Response Parser'),
  validation('validation', 'Validation'),
  history('history', 'History'),
  documentUpdate('document_update', 'Document Update'),
  undoStack('undo_stack', 'Undo Stack'),
  review('review', 'Review'),
  approval('approval', 'Approval'),
  productionReady('production_ready', 'Production Ready');

  const AiPipelineStage(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// The stage that must complete before this one (null for the first).
  AiPipelineStage? get previous {
    final i = index;
    return i == 0 ? null : values[i - 1];
  }

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static AiPipelineStage fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown AiPipelineStage wire name',
      ),
    );
  }
}

/// Immutable progress record of one AI execution through the pipeline.
/// Stages complete strictly in order; skipping is impossible by
/// construction ([advanceTo] refuses non-successor stages).
@freezed
abstract class AiPipelineRun with _$AiPipelineRun {
  const factory AiPipelineRun({
    /// Stable UUID of this run.
    required String id,

    /// Stages completed so far, in order.
    @Default(<AiPipelineStage>[]) List<AiPipelineStage> completed,

    @Default(<String, Object?>{}) Map<String, Object?> metadata,
  }) = _AiPipelineRun;

  factory AiPipelineRun.fromJson(Map<String, Object?> json) =>
      _$AiPipelineRunFromJson(json);

  const AiPipelineRun._();

  /// The last completed stage, or null before the run starts.
  AiPipelineStage? get currentStage =>
      completed.isEmpty ? null : completed.last;

  /// The next stage this run must complete.
  AiPipelineStage? get nextStage {
    if (completed.isEmpty) {
      return AiPipelineStage.values.first;
    }
    final i = completed.last.index + 1;
    return i < AiPipelineStage.values.length ? AiPipelineStage.values[i] : null;
  }

  bool get isComplete => currentStage == AiPipelineStage.productionReady;

  /// Completes [stage]; throws [StateError] unless [stage] is exactly the
  /// next stage — the pipeline cannot be skipped or reordered.
  AiPipelineRun advanceTo(AiPipelineStage stage) {
    if (stage != nextStage) {
      throw StateError(
        'Pipeline order violation: expected ${nextStage?.wireName}, '
        'got ${stage.wireName}',
      );
    }
    return copyWith(completed: [...completed, stage]);
  }
}
