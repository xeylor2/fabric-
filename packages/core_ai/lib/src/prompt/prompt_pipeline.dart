import 'package:core_ai/src/prompt/ai_provider_id.dart';
import 'package:core_lock/core_lock.dart';
import 'package:core_textile/core_textile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'prompt_pipeline.freezed.dart';
part 'prompt_pipeline.g.dart';

/// The frozen prompt pipeline stages (ADR-0009):
/// conversation → intent parser → context builder → constraint engine →
/// prompt compiler → template engine → provider adapter → prompt
/// validator → execution → result.
enum PromptPipelineStage {
  conversation('conversation', 'Conversation'),
  intentParser('intent_parser', 'Intent Parser'),
  contextBuilder('context_builder', 'Context Builder'),
  constraintEngine('constraint_engine', 'Constraint Engine'),
  promptCompiler('prompt_compiler', 'Prompt Compiler'),
  templateEngine('template_engine', 'Template Engine'),
  providerAdapter('provider_adapter', 'Provider Adapter'),
  promptValidator('prompt_validator', 'Prompt Validator'),
  execution('execution', 'Execution'),
  result('result', 'Result');

  const PromptPipelineStage(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static PromptPipelineStage fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown PromptPipelineStage wire name',
      ),
    );
  }
}

/// Intent classes recognised by the intent parser (mirrors Architecture V2
/// §6; frozen).
enum ConversationIntentKind {
  generate('generate', 'Generate'),
  modify('modify', 'Modify'),
  replace('replace', 'Replace'),
  recolour('recolour', 'Recolour'),
  constraint('constraint', 'Constraint'),
  arrange('arrange', 'Arrange'),
  query('query', 'Query'),
  batch('batch', 'Batch');

  const ConversationIntentKind(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static ConversationIntentKind fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown ConversationIntentKind wire name',
      ),
    );
  }
}

/// One user utterance entering the pipeline.
@freezed
abstract class ConversationInput with _$ConversationInput {
  const factory ConversationInput({
    required String utterance,

    /// Session identifiers binding the utterance to its workspace context.
    String? projectId,
    String? documentId,

    @Default(<String, Object?>{}) Map<String, Object?> metadata,
  }) = _ConversationInput;

  factory ConversationInput.fromJson(Map<String, Object?> json) =>
      _$ConversationInputFromJson(json);
}

/// Parsed intent: what the user wants, aimed at which targets.
@freezed
abstract class PromptIntent with _$PromptIntent {
  const factory PromptIntent({
    required ConversationIntentKind kind,

    /// The frozen textile operation this intent maps to, when AI-backed.
    @JsonKey(fromJson: _operationFromJson, toJson: _operationToJson)
    AiOperation? operation,

    /// Resolved semantic target ids (Design Tree nodes, layers).
    @Default(<String>[]) List<String> targetIds,

    /// Parser confidence 0..1 (low confidence triggers clarification).
    @Default(1.0) double confidence,

    @Default(<String, Object?>{}) Map<String, Object?> metadata,
  }) = _PromptIntent;

  factory PromptIntent.fromJson(Map<String, Object?> json) =>
      _$PromptIntentFromJson(json);
}

/// Workspace context assembled for the compiler.
@freezed
abstract class PromptContext with _$PromptContext {
  const factory PromptContext({
    /// Serialized summary of the relevant document/tree region.
    String? documentSummary,

    /// Serialized summary of the current selection.
    String? selectionSummary,

    /// Active locks — the constraint engine turns these into hard
    /// constraints (invariant I4 pre-compute enforcement).
    @Default(LockSet.none) LockSet locks,

    /// Working palette (#RRGGBB), when palette-locked.
    @Default(<String>[]) List<String> paletteHex,

    @Default(<String, Object?>{}) Map<String, Object?> metadata,
  }) = _PromptContext;

  factory PromptContext.fromJson(Map<String, Object?> json) =>
      _$PromptContextFromJson(json);
}

/// Constraint classes the constraint engine emits (frozen).
enum PromptConstraintKind {
  scopeMask('scope_mask', 'Scope Mask'),
  lockedRegion('locked_region', 'Locked Region'),
  palette('palette', 'Palette'),
  dimensions('dimensions', 'Dimensions'),
  styleGuard('style_guard', 'Style Guard'),
  safety('safety', 'Safety');

  const PromptConstraintKind(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static PromptConstraintKind fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown PromptConstraintKind wire name',
      ),
    );
  }
}

/// One hard constraint attached to a compiled prompt.
@freezed
abstract class PromptConstraint with _$PromptConstraint {
  const factory PromptConstraint({
    required PromptConstraintKind kind,
    required String description,
    @Default(<String, Object?>{}) Map<String, Object?> payload,
  }) = _PromptConstraint;

  factory PromptConstraint.fromJson(Map<String, Object?> json) =>
      _$PromptConstraintFromJson(json);
}

/// Roles of compiled prompt segments (provider-independent).
enum PromptSegmentRole {
  system('system', 'System'),
  context('context', 'Context'),
  user('user', 'User'),
  constraint('constraint', 'Constraint');

  const PromptSegmentRole(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static PromptSegmentRole fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown PromptSegmentRole wire name',
      ),
    );
  }
}

/// One ordered segment of a compiled prompt.
@freezed
abstract class PromptSegment with _$PromptSegment {
  const factory PromptSegment({
    required PromptSegmentRole role,
    required String content,
  }) = _PromptSegment;

  factory PromptSegment.fromJson(Map<String, Object?> json) =>
      _$PromptSegmentFromJson(json);
}

/// The provider-independent compiled prompt — **the only artefact a
/// provider adapter may receive**. Raw conversation never reaches a
/// provider; the type system enforces it (`ProviderAdapter.submit` accepts
/// only [CompiledPrompt]).
@freezed
abstract class CompiledPrompt with _$CompiledPrompt {
  const factory CompiledPrompt({
    /// The frozen textile operation being executed.
    @JsonKey(fromJson: _requiredOperationFromJson, toJson: _operationToJson)
    required AiOperation operation,

    /// Template applied by the template engine.
    required String templateId,

    /// Ordered, role-tagged segments.
    @Default(<PromptSegment>[]) List<PromptSegment> segments,

    /// Hard constraints (validated again post-execution).
    @Default(<PromptConstraint>[]) List<PromptConstraint> constraints,

    /// Reproducibility seed.
    int? seed,

    @Default(<String, Object?>{}) Map<String, Object?> metadata,
  }) = _CompiledPrompt;

  factory CompiledPrompt.fromJson(Map<String, Object?> json) =>
      _$CompiledPromptFromJson(json);
}

/// Validation verdict from the prompt validator (pre-execution gate).
@freezed
abstract class PromptValidation with _$PromptValidation {
  const factory PromptValidation({
    required bool valid,
    @Default(<String>[]) List<String> violations,
  }) = _PromptValidation;

  factory PromptValidation.fromJson(Map<String, Object?> json) =>
      _$PromptValidationFromJson(json);

  const PromptValidation._();

  static const PromptValidation ok = PromptValidation(valid: true);
}

// ---------------------------------------------------------------------------
// Stage interfaces (implementations arrive with the AI backbone milestone).
// Each stage is pure input → output; the pipeline is fully typed end-to-end.
// ---------------------------------------------------------------------------

/// Stage 2: classifies an utterance into a typed intent.
abstract interface class IntentParser {
  Future<PromptIntent> parse(ConversationInput input);
}

/// Stage 3: assembles workspace context for the compiler.
abstract interface class ContextBuilder {
  Future<PromptContext> build(ConversationInput input, PromptIntent intent);
}

/// Stage 4: derives hard constraints from context (locks, palette, scope).
/// Locks become constraints *before* any compute is spent (invariant I4).
abstract interface class ConstraintEngine {
  List<PromptConstraint> derive(PromptIntent intent, PromptContext context);
}

/// Stage 5+6: compiles intent + context + constraints through a template
/// into the provider-independent [CompiledPrompt].
abstract interface class PromptCompiler {
  CompiledPrompt compile({
    required PromptIntent intent,
    required PromptContext context,
    required List<PromptConstraint> constraints,
  });
}

/// Stage 8: static validation gate before execution.
abstract interface class PromptValidator {
  PromptValidation validate(CompiledPrompt prompt);
}

/// Stage 7/9: submits a compiled prompt to one provider.
///
/// This interface is the structural guarantee that **no provider receives
/// raw conversation**: the only accepted input type is [CompiledPrompt].
abstract interface class ProviderAdapter {
  AiProviderId get provider;

  Set<AiCapability> get capabilities;

  Future<ProviderResponse> submit(CompiledPrompt prompt);
}

AiOperation? _operationFromJson(String? wireName) =>
    wireName == null ? null : AiOperation.fromWireName(wireName);

AiOperation _requiredOperationFromJson(String wireName) =>
    AiOperation.fromWireName(wireName);

String? _operationToJson(AiOperation? operation) => operation?.wireName;

/// Raw provider output handed to the response parser.
@freezed
abstract class ProviderResponse with _$ProviderResponse {
  const factory ProviderResponse({
    required AiProviderId provider,
    required bool succeeded,

    /// Provider-neutral payload (parsed downstream).
    @Default(<String, Object?>{}) Map<String, Object?> payload,

    String? error,
  }) = _ProviderResponse;

  factory ProviderResponse.fromJson(Map<String, Object?> json) =>
      _$ProviderResponseFromJson(json);
}
