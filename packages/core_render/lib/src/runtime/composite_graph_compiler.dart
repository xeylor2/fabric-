import 'package:core_canvas/core_canvas.dart';
import 'package:core_document/core_document.dart';
import 'package:core_geometry/core_geometry.dart';
import 'package:core_layer/core_layer.dart';
import 'package:core_performance/core_performance.dart';
import 'package:core_render/src/contracts/render_contracts.dart';
import 'package:core_render/src/graph/render_graph.dart';
import 'package:core_render/src/objects/render_object.dart';
import 'package:core_render/src/runtime/render_graph_compiler.dart';
import 'package:core_render/src/target/render_target.dart';
import 'package:core_render/src/vocabulary/render_vocabulary.dart';

/// The Composite Graph Compiler (M17, ADR-0019) — the layer-tier render
/// entry, realized by COMPOSITION over frozen surfaces (M17-D1).
///
/// Delegation: the ENTIRE node tier is delegated verbatim to a contained
/// frozen [RenderGraphCompiler] — `compile` and `recompile` both — so every
/// M5B/M16 guarantee (L1 determinism, incremental == full, R1/R2, the M16
/// per-key discipline) is preserved by delegation, not re-implemented. The
/// node tier keeps exactly one owner (M16-D1 honoured, not excepted).
///
/// Layer participation (M17-D2, computed — never persisted): after the
/// delegated node objects, the compiler walks `artboard.layerRoot`
/// depth-first pre-order; every non-hidden layer emits EXACTLY ONE render
/// object — a pure function of the layer value and the artboard size; a
/// hidden layer prunes its subtree ("Hidden layers keep their place but
/// render nowhere" — the frozen field's own text; hidden ≠ deficient).
/// Attributes: `blend`/`opacity` from the layer's frozen fields (identical
/// frozen types — zero invention), bounds = the full artboard rect (the
/// layer tier is surface compositing), `source` =
/// `CanvasReference(layer, id)` (the frozen M5A anticipation),
/// `maskId: null` (D2-d#1 — mask attachment binds at its own consumer,
/// with DQ-S4-1). Panel state (`locked`/`pinned`/`favourite`/`tags`) is
/// NOT consumed — not a compositing attribute.
///
/// Per-key consumption (M17-D3): `colour` present as `String` →
/// [RenderObjectKind.colourFill] (the frozen kind whose name IS the
/// datum); otherwise the non-painting [RenderObjectKind.group] default.
/// `repeat` is KIND-NEUTRAL — it derives nothing in the compiled object;
/// both keys' CONTENT resolves at reference resolution (R2 — the object
/// carries no hex, no repeat parameters, no metadata payloads). Malformed
/// values degrade treat-as-absent (M16-D5 P2, extended verbatim).
///
/// Q3-d adjudication (M17-D4): node-tier and layer-tier repeats compose
/// UNDER THE FROZEN ORDER — no override, no merge. Structurally: layer
/// objects append strictly after node objects with ascending `order`
/// (the compositing tier draws above the content tier at equal pass
/// depth — M17-D2(d)); each repeat resolves independently at its own
/// object's reference.
///
/// Recompile (M17-D5 E2): `previous.objects` is partitioned TOTALLY over
/// the frozen three-value `CanvasReferenceKind` — the `designNode`
/// partition feeds the inner frozen compiler as its `previous` (its reuse
/// map provably unpolluted by layer entries); the `layer` partition feeds
/// this compiler's own reuse (undamaged layers' objects reused
/// byte-identically before `order`/`tileKeys` re-derivation — the frozen
/// exactness mechanism extended); the `asset` partition — empty by
/// construction today — is deterministically discarded if ever non-empty.
/// Layer damage arrives via the frozen `affectedIds: [layerId]` wiring
/// (`_setLayerMetadata`, both frozen layer-key writers delegating to it).
final class CompositeGraphCompiler implements GraphCompiler {
  CompositeGraphCompiler({RenderGraphCompiler? inner})
    : _inner = inner ?? RenderGraphCompiler();

  final RenderGraphCompiler _inner;

  /// The contained frozen node-tier compiler (exposed for the E3
  /// cross-tier observable: `inner.lastProduceCount`).
  RenderGraphCompiler get inner => _inner;

  /// Diagnostic mirror of the frozen `lastProduceCount`: the number of
  /// layer objects EMITTED (not reused) in the most recent operation.
  /// Proves layer-tier incrementality (E3).
  int lastLayerEmitCount = 0;

  @override
  RenderGraph compile(FebricDocument document, RenderTarget target) {
    final nodeGraph = _inner.compile(document, target);
    return _withLayers(nodeGraph, document, reuseById: null);
  }

  @override
  RenderGraph recompile(
    RenderGraph previous,
    FebricDocument document,
    Set<String> damagedNodeIds,
  ) {
    // E2 — total partition over the frozen three-value reference kinds.
    final nodePrevious = <RenderObject>[];
    final layerPrevious = <String, RenderObject>{};
    for (final object in previous.objects) {
      switch (object.source.kind) {
        case CanvasReferenceKind.designNode:
          nodePrevious.add(object);
        case CanvasReferenceKind.layer:
          layerPrevious[object.source.refId] = object;
        case CanvasReferenceKind.asset:
          break; // Empty by construction today; discarded deterministically.
      }
    }
    final nodeGraph = _inner.recompile(
      previous.copyWith(objects: nodePrevious),
      document,
      damagedNodeIds,
    );
    return _withLayers(
      nodeGraph,
      document,
      reuseById: layerPrevious,
      damaged: damagedNodeIds,
    );
  }

  /// Appends the layer tier to the delegated node graph. Pure; mutates
  /// nothing (R1); emits no command.
  RenderGraph _withLayers(
    RenderGraph nodeGraph,
    FebricDocument document, {
    required Map<String, RenderObject>? reuseById,
    Set<String> damaged = const {},
  }) {
    lastLayerEmitCount = 0;
    final artboard = document.artboards.isEmpty
        ? null
        : document.artboards.first;
    if (artboard == null) {
      return nodeGraph;
    }
    final objects = [...nodeGraph.objects];
    _walkLayer(
      artboard.layerRoot,
      artboard,
      objects,
      reuseById: reuseById,
      damaged: damaged,
    );
    return nodeGraph.copyWith(objects: objects);
  }

  /// Depth-first pre-order walk of the layer tree = z-order (the frozen
  /// bottom-to-top children semantics). `order` continues ascending after
  /// the node tier; `tileKeys` re-derived here (the frozen exactness
  /// mechanism).
  void _walkLayer(
    LayerModel layer,
    Artboard artboard,
    List<RenderObject> out, {
    required Map<String, RenderObject>? reuseById,
    Set<String> damaged = const {},
  }) {
    if (layer.hidden) {
      return; // Hidden layer and its subtree render nowhere.
    }
    final order = out.length;
    final reused = reuseById != null && !damaged.contains(layer.id)
        ? reuseById[layer.id]
        : null;

    final RenderObject base;
    if (reused != null) {
      base = reused; // Reused — byte-identical before re-derivation (E3).
    } else {
      base = _produceLayerObject(layer, artboard);
      lastLayerEmitCount += 1;
    }

    out.add(
      base.copyWith(
        order: order,
        tileKeys: tileKeysFor(base.bounds, TileSpec.standard),
      ),
    );

    for (final child in layer.children) {
      _walkLayer(child, artboard, out, reuseById: reuseById, damaged: damaged);
    }
  }

  /// Exactly one object per participating layer — a pure function of
  /// `(layer value, artboard size)` (E4). Reference-only (R2/E5).
  RenderObject _produceLayerObject(LayerModel layer, Artboard artboard) {
    return RenderObject(
      id: 'rl:${layer.id}',
      kind: _layerKindFor(layer),
      source: CanvasReference(kind: CanvasReferenceKind.layer, refId: layer.id),
      bounds: Rect2D(
        left: 0,
        top: 0,
        width: artboard.size.width,
        height: artboard.size.height,
      ),
      blend: layer.blendMode,
      opacity: layer.opacity,
    );
  }
}

/// The frozen M17-D3 layer kind-derivation chain: `colour` present as a
/// `String` → `colourFill`; otherwise the non-painting `group` default.
/// `repeat` NEVER affects the kind (kind-neutral routing — its content
/// resolves at reference resolution). Total and pure over every layer
/// value; malformed values degrade treat-as-absent (P2). Frozen on
/// shipment (E8) — changing a cell changes compiled output for existing
/// documents; pinned by the derivation freeze test.
RenderObjectKind _layerKindFor(LayerModel layer) {
  final colour = layer.metadata['colour'];
  if (colour is String) {
    return RenderObjectKind.colourFill;
  }
  return RenderObjectKind.group;
}
