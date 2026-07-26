/// FEBRIC Garment Structure and Library engines: schemas, part
/// definitions, templates, content packs, instantiation.
///
/// M13F ships the §3 Garment Structure vocabulary (versioned
/// GarmentSchema over the frozen GarmentType/GarmentPart keys) and the
/// deterministic instantiator producing frozen DesignNode subtrees that
/// write the frozen SemanticPath metadata keys. M13G ships the §2
/// Garment Library: the GarmentTemplate/TemplatePack containers, the
/// synchronous injected registry, and the InstantiateTemplate operation
/// emitting the existing frozen createDesignNode tree-fragment command.
/// All schema/template/pack content is injected; zero content ships.
///
/// Blueprint: docs/architecture/architecture-v2.md (Architecture V2).
library;

export 'src/core_garment_package.dart';
export 'src/instantiate/garment_instantiator.dart';
export 'src/packs/template_pack.dart';
export 'src/parts/symmetry_link.dart';
export 'src/schema/garment_schema.dart';
export 'src/templates/garment_template.dart';
export 'src/templates/template_instantiator.dart';
export 'src/templates/template_registry.dart';
