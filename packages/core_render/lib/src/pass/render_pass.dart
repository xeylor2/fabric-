import 'package:core_render/src/vocabulary/render_vocabulary.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'render_pass.freezed.dart';
part 'render_pass.g.dart';

/// A named render pass description (Rendering Constitution §3.6). Passes run
/// in the constitution's frozen order; [slot] is the ascending position used
/// for extension insertion. Data only — execution arrives in M5B-2.
@freezed
abstract class RenderPass with _$RenderPass {
  const factory RenderPass({
    @JsonKey(fromJson: _kindFromJson, toJson: _kindToJson)
    required RenderPassKind kind,

    /// Ordering slot; lower runs earlier.
    @Default(0) int slot,

    /// Object kinds this pass draws (empty = all).
    @JsonKey(fromJson: _filterFromJson, toJson: _filterToJson)
    @Default(<RenderObjectKind>[])
    List<RenderObjectKind> objectFilter,

    @Default(true) bool enabled,
  }) = _RenderPass;

  factory RenderPass.fromJson(Map<String, Object?> json) =>
      _$RenderPassFromJson(json);
}

RenderPassKind _kindFromJson(String wireName) =>
    RenderPassKind.fromWireName(wireName);

String _kindToJson(RenderPassKind kind) => kind.wireName;

List<RenderObjectKind> _filterFromJson(List<dynamic> json) =>
    json.map((e) => RenderObjectKind.fromWireName(e as String)).toList();

List<String> _filterToJson(List<RenderObjectKind> kinds) =>
    kinds.map((k) => k.wireName).toList();
