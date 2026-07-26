import 'package:core_garment/src/packs/template_pack.dart';
import 'package:core_garment/src/schema/garment_schema.dart';
import 'package:core_garment/src/templates/garment_template.dart';

/// The synchronous Library registry (the approved Q5 ruling — the frozen
/// M11/M12D/M12F registry pattern): register/lookup over already-injected
/// in-memory content. Content arrives from outside (content packs,
/// `content/schemas/`, later save-back layers); **none ships here**.
///
/// Origin-blind (the approved Q6 ruling: a user template registers
/// identically to a pack template) and version-blind (the approved Q7
/// ruling: version fields are data; update policy is a later slice).
abstract interface class GarmentTemplateRegistry {
  /// Registers [template] under its own id and returns that id.
  /// Re-registering an id replaces the instance (the frozen registry
  /// semantics).
  String registerTemplate(GarmentTemplate template);

  /// Registers [schema] under its own id and returns that id.
  String registerSchema(GarmentSchema schema);

  /// Registers [pack], its templates and its schemas, each under their
  /// own ids (last registration wins — the frozen replace semantics; no
  /// conflict policy). Returns the pack id.
  String registerPack(TemplatePack pack);

  /// The template with [templateId], or null when none is registered.
  GarmentTemplate? templateFor(String templateId);

  /// The schema with [schemaId], or null when none is registered.
  GarmentSchema? schemaFor(String schemaId);

  /// The pack with [packId], or null when none is registered.
  TemplatePack? packFor(String packId);

  /// Whether a template is registered under [templateId].
  bool isTemplateRegistered(String templateId);

  /// The registered template ids, in registration order.
  List<String> get registeredTemplateIds;

  /// The registered pack ids, in registration order.
  List<String> get registeredPackIds;

  /// Every registered template carrying [tag] under [axis] (the approved
  /// Q3 ruling: exact-match mechanics over injected taxonomy data — the
  /// frozen `AssetCatalogue.withTag` precedent), in registration order.
  List<GarmentTemplate> templatesWhere(String axis, String tag);
}

/// Reference in-memory [GarmentTemplateRegistry]. Pure mechanics: maps
/// keyed by id — no template, schema or taxonomy content ships here.
final class GarmentTemplateRegistryImpl implements GarmentTemplateRegistry {
  final Map<String, GarmentTemplate> _templates = <String, GarmentTemplate>{};
  final Map<String, GarmentSchema> _schemas = <String, GarmentSchema>{};
  final Map<String, TemplatePack> _packs = <String, TemplatePack>{};

  @override
  String registerTemplate(GarmentTemplate template) {
    _templates[template.id] = template;
    return template.id;
  }

  @override
  String registerSchema(GarmentSchema schema) {
    _schemas[schema.id] = schema;
    return schema.id;
  }

  @override
  String registerPack(TemplatePack pack) {
    _packs[pack.id] = pack;
    for (final schema in pack.schemas) {
      registerSchema(schema);
    }
    for (final template in pack.templates) {
      registerTemplate(template);
    }
    return pack.id;
  }

  @override
  GarmentTemplate? templateFor(String templateId) => _templates[templateId];

  @override
  GarmentSchema? schemaFor(String schemaId) => _schemas[schemaId];

  @override
  TemplatePack? packFor(String packId) => _packs[packId];

  @override
  bool isTemplateRegistered(String templateId) =>
      _templates.containsKey(templateId);

  @override
  List<String> get registeredTemplateIds => List.unmodifiable(_templates.keys);

  @override
  List<String> get registeredPackIds => List.unmodifiable(_packs.keys);

  @override
  List<GarmentTemplate> templatesWhere(String axis, String tag) => [
    for (final template in _templates.values)
      if (template.taxonomy[axis]?.contains(tag) ?? false) template,
  ];
}
