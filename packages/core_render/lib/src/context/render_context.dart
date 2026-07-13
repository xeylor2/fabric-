import 'package:core_asset/core_asset.dart';
import 'package:core_interaction/core_interaction.dart';
import 'package:core_performance/core_performance.dart';
import 'package:core_tooling/core_tooling.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'render_context.freezed.dart';
part 'render_context.g.dart';

/// The immutable per-frame/per-pass parameter bundle (Rendering Constitution
/// §3.8). No ambient state: every invariant a pass or the backend needs is
/// passed explicitly. Composes frozen contracts — never redefines them.
@freezed
abstract class RenderContext with _$RenderContext {
  const factory RenderContext({
    /// The camera transform for this frame (frozen `core_interaction`). The
    /// single shared viewport (R4) — the renderer never creates its own.
    required ViewportState viewport,

    /// Physical-unit system + DPI (frozen `core_tooling`).
    @Default(CanvasCoordinateSystem.standard)
    CanvasCoordinateSystem coordinateSystem,

    /// Tiling parameters for this frame (frozen `core_performance`).
    @Default(TileSpec.standard) TileSpec tiles,

    /// Cache budget for this frame's tier (frozen `core_performance`).
    CacheBudget? cacheBudget,

    /// Level-of-detail level chosen from zoom (0 = full resolution).
    @Default(0) int lodLevel,

    /// Output colour space (frozen `core_asset`).
    @JsonKey(fromJson: _colourFromJson, toJson: _colourToJson)
    @Default(AssetColourSpace.srgb)
    AssetColourSpace colourSpace,

    /// Deterministic frame identity (injected, never wall-clock).
    @Default(0) int frameId,
  }) = _RenderContext;

  factory RenderContext.fromJson(Map<String, Object?> json) =>
      _$RenderContextFromJson(json);
}

AssetColourSpace _colourFromJson(String wireName) =>
    AssetColourSpace.fromWireName(wireName);

String _colourToJson(AssetColourSpace space) => space.wireName;
