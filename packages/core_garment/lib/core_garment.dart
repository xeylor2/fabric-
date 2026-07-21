/// FEBRIC Garment Structure and Library engines: schemas, part
/// definitions, templates, content packs, instantiation.
///
/// M13F ships the §3 Garment Structure vocabulary (versioned
/// GarmentSchema over the frozen GarmentType/GarmentPart keys) and the
/// deterministic instantiator producing frozen DesignNode subtrees that
/// write the frozen SemanticPath metadata keys. Schema content is
/// injected; the Library (templates/packs) arrives with its own slice.
///
/// Blueprint: docs/architecture/architecture-v2.md (Architecture V2).
library;

export 'src/core_garment_package.dart';
export 'src/instantiate/garment_instantiator.dart';
export 'src/parts/symmetry_link.dart';
export 'src/schema/garment_schema.dart';
