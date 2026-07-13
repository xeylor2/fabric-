import 'package:core_render/src/constitution/render_constitution.dart';
import 'package:core_render/src/context/render_context.dart';
import 'package:core_render/src/contracts/render_contracts.dart';
import 'package:core_render/src/objects/render_object.dart';
import 'package:core_render/src/pass/render_pass.dart';
import 'package:core_render/src/vocabulary/render_vocabulary.dart';

/// Maps a render-object kind to the pass that draws it (M5B-2). Pure and
/// total over the frozen `RenderObjectKind`; no new vocabulary.
RenderPassKind passForObjectKind(RenderObjectKind kind) {
  switch (kind) {
    case RenderObjectKind.fabricBase:
    case RenderObjectKind.group:
      return RenderPassKind.base;
    case RenderObjectKind.colourFill:
    case RenderObjectKind.image:
      return RenderPassKind.fill;
    case RenderObjectKind.motif:
      return RenderPassKind.motif;
    case RenderObjectKind.border:
    case RenderObjectKind.outline:
      return RenderPassKind.border;
    case RenderObjectKind.texture:
      return RenderPassKind.texture;
    case RenderObjectKind.shadow:
      return RenderPassKind.shadow;
    case RenderObjectKind.preview:
      return RenderPassKind.aiPreview;
  }
}

/// The headless Render Pass registry (M5B-2), implementing the frozen
/// `RenderPassRegistry`. Passes are kept in the constitution's frozen order
/// (`RenderConstitution.passOrder`), then by slot — never reordered (R6).
final class RenderPassRegistryImpl implements RenderPassRegistry {
  final Map<RenderPassKind, RenderPass> _byKind = {};

  /// A registry pre-populated with the frozen pass order.
  factory RenderPassRegistryImpl.standard() {
    final r = RenderPassRegistryImpl();
    for (final kind in RenderConstitution.passOrder) {
      r.register(
        RenderPass(
          kind: kind,
          slot: RenderConstitution.passOrder.indexOf(kind),
        ),
      );
    }
    return r;
  }

  RenderPassRegistryImpl();

  @override
  void register(RenderPass pass) => _byKind[pass.kind] = pass;

  @override
  List<RenderPass> get orderedPasses {
    final passes = _byKind.values.toList();
    passes.sort((a, b) {
      final ia = RenderConstitution.passOrder.indexOf(a.kind);
      final ib = RenderConstitution.passOrder.indexOf(b.kind);
      final byFrozen = ia.compareTo(ib);
      return byFrozen != 0 ? byFrozen : a.slot.compareTo(b.slot);
    });
    return passes;
  }
}

/// Executes passes in frozen order against a `RenderBackend` (M5B-2).
/// Organizes the culled objects by pass (via [passForObjectKind]) and calls
/// `backend.record` per pass, then `composite`. Draw order within a pass is
/// the objects' deterministic draw order. Headless: the backend records
/// structure only — no rasterization, no presentation here.
final class RenderPassExecutor {
  const RenderPassExecutor(this.registry);

  final RenderPassRegistryImpl registry;

  void execute(
    List<RenderObject> culled,
    RenderBackend backend,
    RenderContext context,
  ) {
    final byPass = <RenderPassKind, List<RenderObject>>{};
    for (final object in culled) {
      byPass.putIfAbsent(passForObjectKind(object.kind), () => []).add(object);
    }
    for (final pass in registry.orderedPasses) {
      final objects = byPass[pass.kind] ?? const [];
      backend.record(pass, context, objects);
    }
    backend.composite(context);
  }
}
