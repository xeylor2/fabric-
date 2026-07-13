import 'package:core_document/core_document.dart';
import 'package:core_geometry/core_geometry.dart';
import 'package:core_performance/core_performance.dart';
import 'package:core_render/src/contracts/render_contracts.dart';
import 'package:core_render/src/graph/render_graph.dart';
import 'package:core_render/src/objects/render_object.dart';
import 'package:core_render/src/runtime/design_node_producers.dart';
import 'package:core_render/src/target/render_target.dart';
import 'package:core_textile/core_textile.dart';

/// Computes the tile keys a bounds covers, deterministically (level 0), using
/// the frozen `TileSpec` sizing. Pure; format `level:x:y`.
List<String> tileKeysFor(Rect2D bounds, TileSpec tiles) {
  final size = tiles.tileSize.toDouble();
  final x0 = (bounds.left / size).floor();
  final x1 = (bounds.right / size).floor();
  final y0 = (bounds.top / size).floor();
  final y1 = (bounds.bottom / size).floor();
  final keys = <String>[];
  for (var y = y0; y <= y1; y++) {
    for (var x = x0; x <= x1; x++) {
      keys.add('0:$x:$y');
    }
  }
  return keys;
}

/// The headless Render Graph Compiler (M5B-2), implementing the frozen
/// `GraphCompiler` contract. Walks an artboard's design tree in document
/// order (= z-order) into an immutable, deterministic [RenderGraph] of render
/// objects that reference nodes by id (R2). Read-only: it never mutates the
/// document (R1) and emits no command.
///
/// Determinism (§F, L1): the object set, draw order and tile keys are a pure
/// function of `(document, target)`. Incremental recompilation is **exactly
/// equal** to a full compile (`incremental == full`) because a render object
/// is a pure function of its node; recompilation only skips re-producing
/// undamaged nodes.
final class RenderGraphCompiler implements GraphCompiler {
  RenderGraphCompiler({RenderObjectProducerRegistry? producers})
    : _producers = producers ?? RenderObjectProducerRegistryImpl.withDefaults();

  final RenderObjectProducerRegistry _producers;

  /// Diagnostic: number of `produce()` calls in the most recent operation.
  /// Proves incrementality (undamaged nodes are skipped on recompile).
  int lastProduceCount = 0;

  @override
  RenderGraph compile(FebricDocument document, RenderTarget target) {
    lastProduceCount = 0;
    final objects = <RenderObject>[];
    final artboard = document.artboards.isEmpty
        ? null
        : document.artboards.first;
    if (artboard != null) {
      _walk(artboard.designTreeRoot, objects, reuseById: null);
    }
    return RenderGraph(
      revision: document.revision,
      target: target,
      objects: objects,
    );
  }

  @override
  RenderGraph recompile(
    RenderGraph previous,
    FebricDocument document,
    Set<String> damagedNodeIds,
  ) {
    lastProduceCount = 0;
    // Index previous objects by their source node id for reuse.
    final reuse = <String, RenderObject>{
      for (final o in previous.objects) o.source.refId: o,
    };
    final objects = <RenderObject>[];
    final artboard = document.artboards.isEmpty
        ? null
        : document.artboards.first;
    if (artboard != null) {
      _walk(
        artboard.designTreeRoot,
        objects,
        reuseById: reuse,
        damaged: damagedNodeIds,
      );
    }
    return RenderGraph(
      revision: document.revision,
      target: previous.target,
      objects: objects,
    );
  }

  /// Depth-first pre-order walk = z-order. Assigns deterministic draw [order]
  /// and tile keys. On recompile, reuses an undamaged node's prior object
  /// (skipping `produce`) — byte-identical to a fresh produce because objects
  /// are order-independent and `order`/`tileKeys` are re-derived here.
  void _walk(
    DesignNode node,
    List<RenderObject> out, {
    required Map<String, RenderObject>? reuseById,
    Set<String> damaged = const {},
  }) {
    if (!node.visible) {
      return; // Hidden node and its subtree render nowhere.
    }
    final order = out.length;
    final reused = reuseById != null && !damaged.contains(node.id)
        ? reuseById[node.id]
        : null;

    final RenderObject base;
    if (reused != null) {
      base = reused; // Skipped produce() — incremental path.
    } else {
      final producer = _producers.producerFor(node.type);
      final produced = producer?.produce(node) ?? const [];
      lastProduceCount += 1;
      base = produced.isNotEmpty ? produced.first : _fallbackObject(node);
    }

    out.add(
      base.copyWith(
        order: order,
        tileKeys: tileKeysFor(base.bounds, TileSpec.standard),
      ),
    );

    for (final child in node.children) {
      _walk(child, out, reuseById: reuseById, damaged: damaged);
    }
  }

  RenderObject _fallbackObject(DesignNode node) =>
      DefaultRenderObjectProducer(node.type).produce(node).first;
}
