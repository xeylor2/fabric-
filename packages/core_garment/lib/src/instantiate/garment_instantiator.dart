import 'package:core_garment/src/schema/garment_schema.dart';
import 'package:core_textile/core_textile.dart';

/// The deterministic §3 instantiator: `GarmentSchema` → a frozen
/// [DesignNode] subtree (§3 "schema (content, versioned) vs **instance
/// (in tree)**").
///
/// Returns a **value** (the approved Q3 ruling — the M12G treeProposal
/// pattern): the instantiator emits nothing; landing the subtree belongs
/// to the existing frozen paths (the M12G `TreeProposalStager`, the
/// document bridges), where invariant I2 and the frozen bus already
/// govern.
///
/// The instantiator writes the **frozen `SemanticPath` metadata keys**
/// exactly as the frozen resolver reads them (`semantic_path.dart`:
/// `garment_type`, `part`, `instance`) — the write-side of a frozen
/// read-side contract (the M13A frozen-key lesson, applied proactively).
/// Zone slots become frozen `DesignNodeType.zone` nodes carrying their
/// slot id (zone semantics stay with the tree engine — the approved
/// representation determination).
///
/// Deterministic: same (schema, ids) → the same subtree. Node ids are
/// derived mechanically from [rootId] + the schema structure; no clock,
/// no randomness (ids are the caller's namespace — the frozen
/// `IdGenerator` doctrine applies at the caller when uniqueness beyond
/// the derivation is needed).
abstract interface class GarmentInstantiator {
  /// Builds the instance subtree for [schema] rooted at [rootId].
  DesignNode instantiate(GarmentSchema schema, {required String rootId});
}

/// Reference [GarmentInstantiator] (M13F): pure mechanical tree
/// derivation — zero content, zero policy, zero fitting.
///
/// Structure produced:
/// - root: `DesignNodeType.garment`, named by the frozen
///   `GarmentType.label`, metadata `garment_type` = the frozen wire name;
/// - one `DesignNodeType.garmentPart` child per part instance
///   (cardinality expands; instances of a multi-part are qualified
///   `instance` = `left`/`right` for cardinality 2 — the §3 mirrored
///   pair — or 1-based ordinals otherwise), metadata `part` = the frozen
///   wire name, plus the part's `symmetryGroup` when present;
/// - one `DesignNodeType.zone` child per zone slot, named by the slot,
///   carrying `zone_slot` = the slot id.
final class SchemaGarmentInstantiator implements GarmentInstantiator {
  const SchemaGarmentInstantiator();

  @override
  DesignNode instantiate(GarmentSchema schema, {required String rootId}) {
    final parts = <DesignNode>[];
    for (final definition in schema.parts) {
      for (var i = 0; i < definition.cardinality; i++) {
        final instance = _instanceQualifier(definition.cardinality, i);
        final partId = instance == null
            ? '$rootId-${definition.part.wireName}'
            : '$rootId-${definition.part.wireName}-$instance';
        parts.add(
          DesignNode(
            id: partId,
            name: definition.part.label,
            type: DesignNodeType.garmentPart,
            metadata: {
              'part': definition.part.wireName,
              if (instance != null) 'instance': instance,
              if (definition.symmetryGroup != null)
                'symmetry_group': definition.symmetryGroup,
            },
            children: [
              for (final slot in definition.zoneSlots)
                DesignNode(
                  id: '$partId-${slot.id}',
                  name: slot.name,
                  type: DesignNodeType.zone,
                  metadata: {'zone_slot': slot.id},
                ),
            ],
          ),
        );
      }
    }

    return DesignNode(
      id: rootId,
      name: schema.garment.label,
      type: DesignNodeType.garment,
      metadata: {'garment_type': schema.garment.wireName},
      children: parts,
    );
  }

  /// §3 mirrored pairs: cardinality 2 → `left`/`right`; other
  /// multiplicities → 1-based ordinals; single parts are unqualified.
  static String? _instanceQualifier(int cardinality, int index) {
    if (cardinality == 1) {
      return null;
    }
    if (cardinality == 2) {
      return index == 0 ? 'left' : 'right';
    }
    return '${index + 1}';
  }
}
