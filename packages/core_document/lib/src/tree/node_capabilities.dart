import 'package:core_textile/core_textile.dart';

/// The twelve frozen node capabilities of the Design Tree
/// (Architecture V2 §4.2; ADR-0015).
enum NodeCapability {
  lock('lock', 'Lock'),
  hide('hide', 'Hide'),
  rename('rename', 'Rename'),
  duplicate('duplicate', 'Duplicate'),
  import('import', 'Import'),
  export('export', 'Export'),
  aiGenerate('ai_generate', 'AI Generate'),
  aiModify('ai_modify', 'AI Modify'),
  aiReplace('ai_replace', 'AI Replace'),
  aiRecolour('ai_recolour', 'AI Recolour'),
  repeat('repeat', 'Repeat Pattern'),
  versionHistory('version_history', 'Version History');

  const NodeCapability(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static NodeCapability fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () =>
          throw ArgumentError.value(name, 'name', 'Unknown NodeCapability'),
    );
  }
}

/// The frozen capability matrix: what each [DesignNodeType] supports
/// (Architecture V2 §4.2). Engines and UIs consult this — the reducer
/// enforces the unambiguous rows (rename/hide/duplicate); tool and AI
/// layers enforce the rest before issuing commands.
abstract final class NodeCapabilityMatrix {
  static const Set<NodeCapability> _all = {...NodeCapability.values};

  /// Capabilities of [type].
  static Set<NodeCapability> capabilitiesOf(DesignNodeType type) {
    return switch (type) {
      // The project root: no hide, no repeat; whole-artwork AI only via
      // the explicit redesign operation (I6) — not per-node AI caps.
      DesignNodeType.project => const {
        NodeCapability.lock,
        NodeCapability.rename,
        NodeCapability.duplicate,
        NodeCapability.import,
        NodeCapability.export,
        NodeCapability.versionHistory,
      },
      DesignNodeType.artwork => const {
        NodeCapability.lock,
        NodeCapability.rename,
        NodeCapability.duplicate,
        NodeCapability.import,
        NodeCapability.export,
        NodeCapability.aiRecolour,
        NodeCapability.versionHistory,
      },
      // Structural nodes: full set minus repeat (repeat applies to
      // zones/elements/groups).
      DesignNodeType.garment || DesignNodeType.garmentPart => const {
        NodeCapability.lock,
        NodeCapability.hide,
        NodeCapability.rename,
        NodeCapability.duplicate,
        NodeCapability.import,
        NodeCapability.export,
        NodeCapability.aiGenerate,
        NodeCapability.aiModify,
        NodeCapability.aiReplace,
        NodeCapability.aiRecolour,
        NodeCapability.versionHistory,
      },
      // Content-bearing nodes support everything.
      DesignNodeType.zone ||
      DesignNodeType.element ||
      DesignNodeType.group => _all,
    };
  }

  /// Whether [type] supports [capability].
  static bool supports(DesignNodeType type, NodeCapability capability) =>
      capabilitiesOf(type).contains(capability);
}
