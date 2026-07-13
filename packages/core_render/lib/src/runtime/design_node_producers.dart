import 'package:core_canvas/core_canvas.dart';
import 'package:core_geometry/core_geometry.dart';
import 'package:core_render/src/contracts/render_contracts.dart';
import 'package:core_render/src/objects/render_object.dart';
import 'package:core_render/src/vocabulary/render_vocabulary.dart';
import 'package:core_textile/core_textile.dart';

/// The frozen `DesignNodeType` → `RenderObjectKind` mapping (M5B-2). Pure and
/// total; adding a node type is a reviewed, append-only event upstream.
RenderObjectKind renderKindForNode(DesignNode node) {
  switch (node.type) {
    case DesignNodeType.project:
    case DesignNodeType.artwork:
    case DesignNodeType.garment:
    case DesignNodeType.garmentPart:
    case DesignNodeType.zone:
    case DesignNodeType.group:
      return RenderObjectKind.group;
    case DesignNodeType.element:
      // A leaf element's technical kind, from the open metadata escape hatch
      // (ADR-0002) — never a new vocabulary. Defaults to a colour fill.
      final wire = node.metadata['render_object_kind'];
      if (wire is String) {
        return RenderObjectKind.fromWireName(wire);
      }
      return RenderObjectKind.colourFill;
  }
}

/// Reads a node's document-space bounds from its open metadata
/// (`render_bounds: [x, y, w, h]`), or a deterministic, **order-independent**
/// fallback derived from the node id (headless layout is not this milestone's
/// concern). Order-independence is what makes `incremental == full` exact: a
/// render object is a pure function of its node alone. Pure, no side effects.
Rect2D boundsForNode(DesignNode node) {
  final raw = node.metadata['render_bounds'];
  if (raw is List && raw.length == 4) {
    return Rect2D(
      left: (raw[0] as num).toDouble(),
      top: (raw[1] as num).toDouble(),
      width: (raw[2] as num).toDouble(),
      height: (raw[3] as num).toDouble(),
    );
  }
  // Deterministic placeholder derived from the id (not from draw order).
  final seed = node.id.codeUnits.fold<int>(0, (a, c) => a + c);
  return Rect2D(
    left: (seed % 64).toDouble(),
    top: ((seed ~/ 64) % 64).toDouble(),
    width: 8,
    height: 8,
  );
}

/// The default producer: turns any visible [DesignNode] into exactly one
/// render object that references the node by id (R2 — references only). Pure
/// and deterministic; no side effects, no document mutation (R1).
final class DefaultRenderObjectProducer implements RenderObjectProducer {
  const DefaultRenderObjectProducer(this.nodeType);

  @override
  final DesignNodeType nodeType;

  @override
  List<RenderObject> produce(DesignNode node) {
    // The object is a pure function of the node. `order` defaults to 0; the
    // compiler assigns the deterministic document-order value after producing.
    return [
      RenderObject(
        id: 'ro:${node.id}',
        kind: renderKindForNode(node),
        source: CanvasReference(
          kind: CanvasReferenceKind.designNode,
          refId: node.id,
        ),
        bounds: boundsForNode(node),
      ),
    ];
  }
}

/// A pure, deterministic producer registry (M5B-2). Keyed by node type; a
/// single default producer covers every frozen type. Implements the frozen
/// `RenderObjectProducerRegistry` contract — no new interface.
final class RenderObjectProducerRegistryImpl
    implements RenderObjectProducerRegistry {
  final Map<DesignNodeType, RenderObjectProducer> _byType = {};

  /// Registers the default producer for every frozen node type.
  factory RenderObjectProducerRegistryImpl.withDefaults() {
    final registry = RenderObjectProducerRegistryImpl();
    for (final type in DesignNodeType.values) {
      registry.register(DefaultRenderObjectProducer(type));
    }
    return registry;
  }

  RenderObjectProducerRegistryImpl();

  @override
  void register(RenderObjectProducer producer) {
    _byType[producer.nodeType] = producer;
  }

  @override
  RenderObjectProducer? producerFor(DesignNodeType type) => _byType[type];
}
