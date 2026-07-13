import 'package:core_canvas/core_canvas.dart';
import 'package:core_geometry/core_geometry.dart';
import 'package:core_layer/core_layer.dart';
import 'package:core_render/src/vocabulary/render_vocabulary.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'render_object.freezed.dart';
part 'render_object.g.dart';

/// A compiled, immutable drawable leaf (Rendering Constitution §3.9).
///
/// It carries only a *reference* to its source — a `CanvasReference`
/// (design-node id / asset hash / layer id, the frozen M5A contract) — plus
/// resolved visual attributes. It never owns node or asset data (R2).
/// Produced later (M5B-2) by a RenderObjectProducer; the model is frozen now.
@freezed
abstract class RenderObject with _$RenderObject {
  const factory RenderObject({
    /// Stable identity of this render object within a graph.
    required String id,

    @JsonKey(fromJson: _kindFromJson, toJson: _kindToJson)
    required RenderObjectKind kind,

    /// The source this object visualises (id/hash only — never owned data).
    required CanvasReference source,

    /// Resolved local→world transform (frozen `core_geometry` primitive).
    @Default(Transform2D.identity) Transform2D transform,

    /// Axis-aligned bounds in document space (culling + spatial index).
    required Rect2D bounds,

    @JsonKey(fromJson: _blendFromJson, toJson: _blendToJson)
    @Default(FebricBlendMode.normal)
    FebricBlendMode blend,

    @Default(1.0) double opacity,

    /// Draw order within the graph (ascending; ties broken by [id]).
    @Default(0) int order,

    /// Optional clip/mask reference id (mask model frozen in `core_mask`;
    /// rasterization happens in the backend, not here).
    String? maskId,

    /// Tile coordinates this object touches (populated by the compiler).
    @Default(<String>[]) List<String> tileKeys,
  }) = _RenderObject;

  factory RenderObject.fromJson(Map<String, Object?> json) =>
      _$RenderObjectFromJson(json);

  const RenderObject._();
}

RenderObjectKind _kindFromJson(String wireName) =>
    RenderObjectKind.fromWireName(wireName);

String _kindToJson(RenderObjectKind kind) => kind.wireName;

FebricBlendMode _blendFromJson(String wireName) =>
    FebricBlendMode.fromWireName(wireName);

String _blendToJson(FebricBlendMode blend) => blend.wireName;
