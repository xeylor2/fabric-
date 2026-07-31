import 'package:core_canvas/core_canvas.dart';
import 'package:core_geometry/core_geometry.dart';
import 'package:core_render/src/contracts/render_contracts.dart';
import 'package:core_render/src/objects/render_object.dart';
import 'package:core_render/src/runtime/design_node_producers.dart';
import 'package:core_render/src/vocabulary/render_vocabulary.dart';
import 'package:core_textile/core_textile.dart';

/// Textile render binding (M16) — the textile-aware element producer,
/// entering the frozen pipeline EXCLUSIVELY through the open producer seam
/// (M16-D1): `RenderObjectProducerRegistry.register` over the frozen
/// default element producer (replace semantics). No compiler, model,
/// constitution, or vocabulary file is modified.
///
/// Participation is COMPUTED, never persisted (M16-D2): the node↔pass
/// association is a pure function of the node value, materialised at each
/// compile — no cross-tree key, field, or side table exists.
///
/// Per-key consumption (M16-D3):
/// - `object_type` → [RenderObject.kind] under the three-tier precedence:
///   the frozen `render_object_kind` escape hatch WINS where present;
///   otherwise the frozen ten-class mapping below; otherwise the frozen
///   `colourFill` default. Unknown/malformed values degrade AS IF ABSENT
///   (D5 P2 — the only total, deterministic, node-local extension).
/// - `transform` → [RenderObject.transform] from the node's OWN key
///   (M14 S2: absence = identity); malformed = identity. Ancestor
///   composition is BARRED — the seam is node-alone by frozen invariant.
/// - node `repeat` → consumed NOT AT ALL here (D3(c) routing-only; D4
///   precedence-neutrality): a node with and without a `repeat` key
///   produces the identical object; no repeat parameter enters the
///   object (R2). Repeat CONTENT resolves at reference resolution.
/// - `render_bounds` → the frozen bounds discipline verbatim
///   ([boundsForNode]), byte-compatible with the default producer.
///
/// Determinism (M16-D5): output is a pure function of the node value
/// (P1), total over every node value (P2), node-local and
/// order-independent (P3), reference-only with no owned data and no sink
/// (P5), and byte-identical to the frozen default for textile-key-free
/// nodes (P6). The mapping below joins the determinism surface and is
/// frozen on shipment (D3-d#2).
///
/// The layer tier (`colour`/`repeat`) has NO graph-entry channel at this
/// seam — deferred with D3-d#1 (Q3-d co-travels); M16 delivers node-tier
/// visibility only.
final class TextileElementProducer implements RenderObjectProducer {
  const TextileElementProducer();

  @override
  DesignNodeType get nodeType => DesignNodeType.element;

  @override
  List<RenderObject> produce(DesignNode node) {
    // Exactly one object per node (the frozen walk consumes one; D5
    // review note) — byte-identical to the frozen default except for the
    // two textile channels determined by D3.
    return [
      RenderObject(
        id: 'ro:${node.id}',
        kind: _textileKindForElement(node),
        source: CanvasReference(
          kind: CanvasReferenceKind.designNode,
          refId: node.id,
        ),
        transform: _transformForNode(node),
        bounds: boundsForNode(node),
      ),
    ];
  }
}

/// The frozen D3-d#2 classification mapping: `TextileObjectType` →
/// `RenderObjectKind`. Total over the frozen ten classes, one cell per
/// class, strictly within the frozen kind set; extends neither
/// vocabulary. Pinned by the mapping freeze test — changing a cell
/// changes compiled output for existing documents.
RenderObjectKind renderKindForTextileClass(TextileObjectType type) {
  switch (type) {
    // Canonical cells — same wire name on both frozen vocabularies.
    case TextileObjectType.motif:
      return RenderObjectKind.motif;
    case TextileObjectType.border:
      return RenderObjectKind.border;
    case TextileObjectType.texture:
      return RenderObjectKind.texture;
    // Residual cells (D3-d#2, bound at the approved specification).
    case TextileObjectType.fabric:
      return RenderObjectKind.fabricBase;
    case TextileObjectType.pattern:
      return RenderObjectKind.motif;
    case TextileObjectType.embroidery:
      return RenderObjectKind.texture;
    case TextileObjectType.lace:
      return RenderObjectKind.texture;
    case TextileObjectType.patch:
      return RenderObjectKind.motif;
    case TextileObjectType.colourPalette:
      return RenderObjectKind.colourFill;
    case TextileObjectType.printLayer:
      return RenderObjectKind.image;
  }
}

/// D3(a) three-tier kind precedence for elements. Pure, total, node-local.
RenderObjectKind _textileKindForElement(DesignNode node) {
  // Tier 1 — the frozen escape hatch wins where present (verbatim frozen
  // behaviour for every existing hatch user).
  final hatch = node.metadata['render_object_kind'];
  if (hatch is String) {
    try {
      return RenderObjectKind.fromWireName(hatch);
    } on ArgumentError {
      // Malformed hatch = treat-as-absent (P2); fall through.
    }
  }
  // Tier 2 — the bound classification.
  final wire = node.metadata['object_type'];
  if (wire is String) {
    try {
      return renderKindForTextileClass(TextileObjectType.fromWireName(wire));
    } on ArgumentError {
      // Unknown class = treat-as-absent (P2); fall through.
    }
  }
  // Tier 3 — the frozen default.
  return RenderObjectKind.colourFill;
}

/// D3(b): the node's own persisted transform (M14 S2 — absence =
/// identity); malformed = identity (P2). Never composes ancestors.
Transform2D _transformForNode(DesignNode node) {
  final raw = node.metadata['transform'];
  if (raw is Map<String, Object?>) {
    try {
      return Transform2D.fromJson(raw);
    } on Object {
      return Transform2D.identity; // Malformed = treat-as-absent (P2).
    }
  }
  return Transform2D.identity;
}

/// Composition helper: the frozen default registry with the textile
/// element producer registered over the default element producer (the
/// frozen replace semantics). Containers keep their frozen defaults.
/// Composition roots adopt this at construction time — exactly as tools
/// choose sinks (M16-D1); nothing is wired here.
RenderObjectProducerRegistryImpl textileProducerRegistry() {
  final registry = RenderObjectProducerRegistryImpl.withDefaults();
  registry.register(const TextileElementProducer());
  return registry;
}
