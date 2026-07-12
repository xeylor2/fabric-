// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prompt_pipeline.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConversationInput _$ConversationInputFromJson(Map<String, dynamic> json) =>
    _ConversationInput(
      utterance: json['utterance'] as String,
      projectId: json['projectId'] as String?,
      documentId: json['documentId'] as String?,
      metadata:
          json['metadata'] as Map<String, dynamic>? ??
          const <String, Object?>{},
    );

Map<String, dynamic> _$ConversationInputToJson(_ConversationInput instance) =>
    <String, dynamic>{
      'utterance': instance.utterance,
      'projectId': instance.projectId,
      'documentId': instance.documentId,
      'metadata': instance.metadata,
    };

_PromptIntent _$PromptIntentFromJson(
  Map<String, dynamic> json,
) => _PromptIntent(
  kind: $enumDecode(_$ConversationIntentKindEnumMap, json['kind']),
  operation: _operationFromJson(json['operation'] as String?),
  targetIds:
      (json['targetIds'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  confidence: (json['confidence'] as num?)?.toDouble() ?? 1.0,
  metadata:
      json['metadata'] as Map<String, dynamic>? ?? const <String, Object?>{},
);

Map<String, dynamic> _$PromptIntentToJson(_PromptIntent instance) =>
    <String, dynamic>{
      'kind': _$ConversationIntentKindEnumMap[instance.kind]!,
      'operation': _operationToJson(instance.operation),
      'targetIds': instance.targetIds,
      'confidence': instance.confidence,
      'metadata': instance.metadata,
    };

const _$ConversationIntentKindEnumMap = {
  ConversationIntentKind.generate: 'generate',
  ConversationIntentKind.modify: 'modify',
  ConversationIntentKind.replace: 'replace',
  ConversationIntentKind.recolour: 'recolour',
  ConversationIntentKind.constraint: 'constraint',
  ConversationIntentKind.arrange: 'arrange',
  ConversationIntentKind.query: 'query',
  ConversationIntentKind.batch: 'batch',
};

_PromptContext _$PromptContextFromJson(Map<String, dynamic> json) =>
    _PromptContext(
      documentSummary: json['documentSummary'] as String?,
      selectionSummary: json['selectionSummary'] as String?,
      locks: json['locks'] == null
          ? LockSet.none
          : LockSet.fromJson(json['locks'] as Map<String, dynamic>),
      paletteHex:
          (json['paletteHex'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      metadata:
          json['metadata'] as Map<String, dynamic>? ??
          const <String, Object?>{},
    );

Map<String, dynamic> _$PromptContextToJson(_PromptContext instance) =>
    <String, dynamic>{
      'documentSummary': instance.documentSummary,
      'selectionSummary': instance.selectionSummary,
      'locks': instance.locks.toJson(),
      'paletteHex': instance.paletteHex,
      'metadata': instance.metadata,
    };

_PromptConstraint _$PromptConstraintFromJson(Map<String, dynamic> json) =>
    _PromptConstraint(
      kind: $enumDecode(_$PromptConstraintKindEnumMap, json['kind']),
      description: json['description'] as String,
      payload:
          json['payload'] as Map<String, dynamic>? ?? const <String, Object?>{},
    );

Map<String, dynamic> _$PromptConstraintToJson(_PromptConstraint instance) =>
    <String, dynamic>{
      'kind': _$PromptConstraintKindEnumMap[instance.kind]!,
      'description': instance.description,
      'payload': instance.payload,
    };

const _$PromptConstraintKindEnumMap = {
  PromptConstraintKind.scopeMask: 'scopeMask',
  PromptConstraintKind.lockedRegion: 'lockedRegion',
  PromptConstraintKind.palette: 'palette',
  PromptConstraintKind.dimensions: 'dimensions',
  PromptConstraintKind.styleGuard: 'styleGuard',
  PromptConstraintKind.safety: 'safety',
};

_PromptSegment _$PromptSegmentFromJson(Map<String, dynamic> json) =>
    _PromptSegment(
      role: $enumDecode(_$PromptSegmentRoleEnumMap, json['role']),
      content: json['content'] as String,
    );

Map<String, dynamic> _$PromptSegmentToJson(_PromptSegment instance) =>
    <String, dynamic>{
      'role': _$PromptSegmentRoleEnumMap[instance.role]!,
      'content': instance.content,
    };

const _$PromptSegmentRoleEnumMap = {
  PromptSegmentRole.system: 'system',
  PromptSegmentRole.context: 'context',
  PromptSegmentRole.user: 'user',
  PromptSegmentRole.constraint: 'constraint',
};

_CompiledPrompt _$CompiledPromptFromJson(Map<String, dynamic> json) =>
    _CompiledPrompt(
      operation: _requiredOperationFromJson(json['operation'] as String),
      templateId: json['templateId'] as String,
      segments:
          (json['segments'] as List<dynamic>?)
              ?.map((e) => PromptSegment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <PromptSegment>[],
      constraints:
          (json['constraints'] as List<dynamic>?)
              ?.map((e) => PromptConstraint.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <PromptConstraint>[],
      seed: (json['seed'] as num?)?.toInt(),
      metadata:
          json['metadata'] as Map<String, dynamic>? ??
          const <String, Object?>{},
    );

Map<String, dynamic> _$CompiledPromptToJson(_CompiledPrompt instance) =>
    <String, dynamic>{
      'operation': _operationToJson(instance.operation),
      'templateId': instance.templateId,
      'segments': instance.segments.map((e) => e.toJson()).toList(),
      'constraints': instance.constraints.map((e) => e.toJson()).toList(),
      'seed': instance.seed,
      'metadata': instance.metadata,
    };

_PromptValidation _$PromptValidationFromJson(Map<String, dynamic> json) =>
    _PromptValidation(
      valid: json['valid'] as bool,
      violations:
          (json['violations'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
    );

Map<String, dynamic> _$PromptValidationToJson(_PromptValidation instance) =>
    <String, dynamic>{
      'valid': instance.valid,
      'violations': instance.violations,
    };

_ProviderResponse _$ProviderResponseFromJson(Map<String, dynamic> json) =>
    _ProviderResponse(
      provider: $enumDecode(_$AiProviderIdEnumMap, json['provider']),
      succeeded: json['succeeded'] as bool,
      payload:
          json['payload'] as Map<String, dynamic>? ?? const <String, Object?>{},
      error: json['error'] as String?,
    );

Map<String, dynamic> _$ProviderResponseToJson(_ProviderResponse instance) =>
    <String, dynamic>{
      'provider': _$AiProviderIdEnumMap[instance.provider]!,
      'succeeded': instance.succeeded,
      'payload': instance.payload,
      'error': instance.error,
    };

const _$AiProviderIdEnumMap = {
  AiProviderId.claude: 'claude',
  AiProviderId.gemini: 'gemini',
  AiProviderId.gpt: 'gpt',
  AiProviderId.nanoBanana: 'nanoBanana',
};
