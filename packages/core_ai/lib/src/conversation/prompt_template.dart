import 'package:core_ai/src/prompt/prompt_pipeline.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'prompt_template.freezed.dart';
part 'prompt_template.g.dart';

/// The template artefact the frozen `CompiledPrompt.templateId` points at —
/// previously a dangling reference (verified absent repo-wide).
///
/// A template is an **ordered, role-tagged segment skeleton** whose content
/// may carry `{{placeholder}}` markers substituted mechanically at compile
/// time. Template *content* is injected policy (the M12B/M12C doctrine —
/// mechanics frozen, policy injected): this package ships **zero prompt
/// copy**.
@freezed
abstract class PromptTemplate with _$PromptTemplate {
  const factory PromptTemplate({
    /// Stable template id — the value stamped into
    /// `CompiledPrompt.templateId` and, downstream, the frozen
    /// `AiProvenanceRecord.templateId`.
    required String id,

    /// The ordered skeleton (frozen [PromptSegment] role vocabulary).
    /// Segment content may contain `{{key}}` placeholders.
    @Default(<PromptSegment>[]) List<PromptSegment> segments,

    @Default(<String, Object?>{}) Map<String, Object?> metadata,
  }) = _PromptTemplate;

  factory PromptTemplate.fromJson(Map<String, Object?> json) =>
      _$PromptTemplateFromJson(json);
}

/// Registry of injected [PromptTemplate]s, keyed by template id (the M12D
/// `ProviderAdapterRegistry` precedent).
abstract interface class PromptTemplateRegistry {
  /// Registers [template] under its own id and returns that id.
  /// Re-registering an id replaces the instance (the M11/M12D registry
  /// semantics).
  String register(PromptTemplate template);

  /// The template with [templateId], or null when none is registered.
  PromptTemplate? templateFor(String templateId);

  /// Whether a template is registered under [templateId].
  bool isRegistered(String templateId);

  /// The registered template ids, in registration order.
  List<String> get registeredIds;
}

/// Reference in-memory [PromptTemplateRegistry]. Pure mechanics: a map
/// keyed by id — no template content ships here.
final class PromptTemplateRegistryImpl implements PromptTemplateRegistry {
  final Map<String, PromptTemplate> _templates = <String, PromptTemplate>{};

  @override
  String register(PromptTemplate template) {
    _templates[template.id] = template;
    return template.id;
  }

  @override
  PromptTemplate? templateFor(String templateId) => _templates[templateId];

  @override
  bool isRegistered(String templateId) => _templates.containsKey(templateId);

  @override
  List<String> get registeredIds => List.unmodifiable(_templates.keys);
}
