import 'package:core_common/core_common.dart';
import 'package:core_document/core_document.dart';
import 'package:core_garment/src/instantiate/garment_instantiator.dart';
import 'package:core_garment/src/templates/template_registry.dart';

/// The §2 `InstantiateTemplate` **operation** (the approved Q2 ruling: an
/// operation that *emits* the existing tree-fragment command, never a bus
/// command itself): template id → one frozen [CreateDesignNodeCommand]
/// carrying the fully instantiated garment subtree.
///
/// Returns a **value** (the M12G/M13F emit-nothing pattern): applying
/// (user path, `DocumentEngine.apply`) or staging (AI path,
/// `PlanStep.command`) belongs to the caller on the existing frozen
/// paths — one history entry, whole-subtree inverse, locks and
/// provenance inherited (invariant I1: no second mutation path).
abstract interface class TemplateInstantiator {
  /// Builds the instantiation command for [templateId] under
  /// [parentNodeId] (null = artboard design tree root) at [index]
  /// (null = append).
  ///
  /// Returns null when the template — or the schema its `schemaRef`
  /// names — is not registered (the frozen null-returning lookup shape).
  CreateDesignNodeCommand? instantiate(
    String templateId, {
    required String artboardId,
    String? parentNodeId,
    int? index,
    required IdGenerator ids,
  });
}

/// Reference [TemplateInstantiator]: pure, synchronous, deterministic
/// mechanics over the injected registry — no clock, no randomness, no IO,
/// no content, no fitting.
///
/// Fragment selection (the approved composition rule — the two sources
/// are alternatives, never combined; no merge policy exists):
/// - a template with a `starterDesign` instantiates **the starter,
///   whole** (§2: the template IS the authored "garment starting point";
///   conformance of starter content to its schema is the content
///   pipeline's concern, never binder behaviour);
/// - a template without one derives the bare skeleton from its schema
///   via the frozen [SchemaGarmentInstantiator] (M13F, reused exactly).
///
/// The selected fragment is re-identified through the frozen
/// `DesignTreeOps.cloneWithIds` + [IdGenerator] seam (the approved Q4
/// ruling): fresh ids per instantiation — deep copy by construction,
/// collision-free under the reducer's descendant-freshness check — with
/// all authored content and metadata preserved verbatim.
///
/// The instantiated root is stamped with the frozen linkage keys
/// `schema_id` and `schema_version` (the approved Q7 ruling — the
/// document-side pinning seam: every instance stays permanently
/// associable with its source schema; no `template_id` is stamped).
final class RegistryTemplateInstantiator implements TemplateInstantiator {
  const RegistryTemplateInstantiator({
    required this.registry,
    this.garmentInstantiator = const SchemaGarmentInstantiator(),
  });

  /// The injected Library registry (synchronous lookups only).
  final GarmentTemplateRegistry registry;

  /// The frozen §3 skeleton derivation (M13F).
  final GarmentInstantiator garmentInstantiator;

  @override
  CreateDesignNodeCommand? instantiate(
    String templateId, {
    required String artboardId,
    String? parentNodeId,
    int? index,
    required IdGenerator ids,
  }) {
    final template = registry.templateFor(templateId);
    if (template == null) {
      return null;
    }
    final schema = registry.schemaFor(template.schemaRef);
    if (schema == null) {
      return null;
    }

    // Fragment selection: starter whole, or schema skeleton — never both.
    final source =
        template.starterDesign ??
        garmentInstantiator.instantiate(schema, rootId: ids.next());

    // Re-identification at the frozen seam: deep copy by construction.
    final fragment = DesignTreeOps.cloneWithIds(source, ids);

    // The Q7 linkage stamp, on the root only.
    final stamped = fragment.copyWith(
      metadata: {
        ...fragment.metadata,
        'schema_id': schema.id,
        'schema_version': schema.schemaVersion,
      },
    );

    return CreateDesignNodeCommand(
      artboardId: artboardId,
      parentNodeId: parentNodeId,
      node: stamped,
      index: index,
    );
  }
}
