import 'package:core_document/core_document.dart';
import 'package:core_render/src/objects/render_object.dart';
import 'package:core_render/src/target/render_target.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'render_graph.freezed.dart';
part 'render_graph.g.dart';

/// The compiled, immutable render representation of an artboard for one
/// target and document revision (Rendering Constitution §3.1). One graph per
/// revision (R3); rebuilt incrementally from damage by the compiler (M5B-2).
///
/// The model is frozen now; it holds render objects (references only, R2) in
/// deterministic draw order — a pure function of its inputs (§F, L1).
@freezed
abstract class RenderGraph with _$RenderGraph {
  const factory RenderGraph({
    /// The document revision this graph was compiled from (frozen
    /// `core_document` identity — immutable, hash-pinnable).
    required RevisionId revision,

    /// The target this graph was compiled for.
    required RenderTarget target,

    /// Render objects in deterministic draw order (ascending
    /// `RenderObject.order`, ties by `RenderObject.id`).
    @Default(<RenderObject>[]) List<RenderObject> objects,
  }) = _RenderGraph;

  factory RenderGraph.fromJson(Map<String, Object?> json) =>
      _$RenderGraphFromJson(json);

  const RenderGraph._();

  /// The deterministic draw ordering: by `order`, ties by `id` — a total,
  /// registration-independent order (mirrors the overlay rule, ADR-0018).
  static int drawOrder(RenderObject a, RenderObject b) {
    final byOrder = a.order.compareTo(b.order);
    return byOrder != 0 ? byOrder : a.id.compareTo(b.id);
  }
}
