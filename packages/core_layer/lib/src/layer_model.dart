import 'package:core_layer/src/layer_kind.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'layer_model.freezed.dart';
part 'layer_model.g.dart';

/// The immutable compositing layer of the FEBRIC OS (ADR-0006).
///
/// Relationship to the Design Tree: `DesignNode` (core_textile) is the
/// *semantic* structure (garments, parts, motifs); `LayerModel` is the
/// *compositing* structure the renderer consumes. The document engine (M2)
/// binds them — a design node materialises as one or more layers.
///
/// Authoritative locking lives in the Lock Engine (`LockSet`, keyed by
/// [id]); [locked] is the layer's own convenience flag, honoured by the
/// same policy path.
@freezed
abstract class LayerModel with _$LayerModel {
  const factory LayerModel({
    /// Stable UUID (assigned by the document engine).
    required String id,

    /// Human-readable, renamable name.
    required String name,

    required LayerKind kind,

    /// Ordered children (only meaningful for container kinds); order is
    /// z-order, bottom to top.
    @Default(<LayerModel>[]) List<LayerModel> children,

    @Default(FebricBlendMode.normal) FebricBlendMode blendMode,

    /// 0.0 (transparent) … 1.0 (opaque).
    @Default(1.0) double opacity,

    /// Hidden layers keep their place but render nowhere.
    @Default(false) bool hidden,

    /// Convenience lock flag (see class docs).
    @Default(false) bool locked,

    /// Pinned layers stay visible in panel shortlists.
    @Default(false) bool pinned,

    /// User favourite flag.
    @Default(false) bool favourite,

    /// Ids of masks applied to this layer (Mask Engine).
    @Default(<String>[]) List<String> maskIds,

    /// Free-form organisational tags.
    @Default(<String>[]) List<String> tags,

    /// Open metadata (provenance, tool payloads) until typed models land.
    @Default(<String, Object?>{}) Map<String, Object?> metadata,
  }) = _LayerModel;

  factory LayerModel.fromJson(Map<String, Object?> json) =>
      _$LayerModelFromJson(json);

  const LayerModel._();

  /// Depth-first traversal of this layer and all descendants.
  Iterable<LayerModel> get descendantsAndSelf sync* {
    yield this;
    for (final child in children) {
      yield* child.descendantsAndSelf;
    }
  }

  /// Finds the first layer with [id] in this subtree, or null.
  LayerModel? findById(String id) {
    for (final layer in descendantsAndSelf) {
      if (layer.id == id) {
        return layer;
      }
    }
    return null;
  }
}
