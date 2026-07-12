import 'package:core_ai/core_ai.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_provenance.freezed.dart';
part 'ai_provenance.g.dart';

/// Traceability record for every AI-produced change (invariant I5;
/// ADR-0014). Stores **no raw conversation** — only the compiled prompt
/// reference (hash + template) and execution parameters.
@freezed
abstract class AiProvenanceRecord with _$AiProvenanceRecord {
  const factory AiProvenanceRecord({
    /// Stable UUID of this record.
    required String id,

    /// Hash of the [CompiledPrompt] that produced the change.
    required String promptHash,

    /// Template the prompt compiler applied.
    String? templateId,

    @JsonKey(fromJson: _providerFromJson, toJson: _providerToJson)
    required AiProviderId provider,

    /// Provider model identifier (e.g. a model version string).
    required String model,

    /// Execution parameters (seed, quality tier…).
    @Default(<String, Object?>{}) Map<String, Object?> parameters,

    /// Version of the constraint engine that guarded the execution.
    required String constraintVersion,

    /// Version of the tool that requested the execution.
    required String toolVersion,

    required DateTime timestamp,

    /// Document revision the change landed as.
    required int revision,

    /// Ids of the objects the change touched.
    @Default(<String>[]) List<String> affectedIds,
  }) = _AiProvenanceRecord;

  factory AiProvenanceRecord.fromJson(Map<String, Object?> json) =>
      _$AiProvenanceRecordFromJson(json);
}

AiProviderId _providerFromJson(String wireName) =>
    AiProviderId.fromWireName(wireName);

String _providerToJson(AiProviderId provider) => provider.wireName;
