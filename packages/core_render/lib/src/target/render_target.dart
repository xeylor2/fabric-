import 'package:core_asset/core_asset.dart';
import 'package:core_render/src/frame/frame_budget.dart';
import 'package:core_render/src/vocabulary/render_vocabulary.dart';
import 'package:core_tooling/core_tooling.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'render_target.freezed.dart';
part 'render_target.g.dart';

/// Where a frame goes and for what purpose (Rendering Constitution §A). A
/// target is an immutable policy configuration — resolution, colour space,
/// coordinate system, pass set, budget profile — never a second renderer.
///
/// One Render Session may drive many targets (Editor + Navigator +
/// Thumbnails) sharing one Render Graph and cache tier.
@freezed
abstract class RenderTarget with _$RenderTarget {
  const factory RenderTarget({
    @JsonKey(fromJson: _kindFromJson, toJson: _kindToJson)
    required RenderTargetKind kind,

    /// Physical-unit coordinate system + DPI of this target (frozen
    /// `core_tooling` contract — never redefined).
    @Default(CanvasCoordinateSystem.standard)
    CanvasCoordinateSystem coordinateSystem,

    /// Output colour space (frozen `core_asset` vocabulary; CMYK for print).
    @JsonKey(fromJson: _colourFromJson, toJson: _colourToJson)
    @Default(AssetColourSpace.srgb)
    AssetColourSpace colourSpace,

    /// The passes this target renders, in the constitution's order.
    @JsonKey(fromJson: _passesFromJson, toJson: _passesToJson)
    @Default(<RenderPassKind>[])
    List<RenderPassKind> passes,

    /// The frame budget profile for this target.
    @Default(FrameBudget.interactive) FrameBudget budget,

    /// Whether this target presents on-screen (false → offscreen: thumbnail,
    /// export encoder).
    @Default(true) bool onScreen,

    /// Whether full-resolution rendering is forced (no LOD reduction) — true
    /// for Production Export.
    @Default(false) bool fullResolution,
  }) = _RenderTarget;

  factory RenderTarget.fromJson(Map<String, Object?> json) =>
      _$RenderTargetFromJson(json);

  const RenderTarget._();
}

RenderTargetKind _kindFromJson(String wireName) =>
    RenderTargetKind.fromWireName(wireName);

String _kindToJson(RenderTargetKind kind) => kind.wireName;

AssetColourSpace _colourFromJson(String wireName) =>
    AssetColourSpace.fromWireName(wireName);

String _colourToJson(AssetColourSpace space) => space.wireName;

List<RenderPassKind> _passesFromJson(List<dynamic> json) =>
    json.map((e) => RenderPassKind.fromWireName(e as String)).toList();

List<String> _passesToJson(List<RenderPassKind> passes) =>
    passes.map((p) => p.wireName).toList();
