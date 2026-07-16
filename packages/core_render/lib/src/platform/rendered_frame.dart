import 'package:core_render/src/platform/render_platform.dart';
import 'package:core_render/src/vocabulary/render_vocabulary.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rendered_frame.freezed.dart';
part 'rendered_frame.g.dart';

/// The immutable, platform-independent **result** of executing one command
/// stream (M5B-4). It is not pixels: it is a deterministic *summary* of what a
/// backend executed (draw/bind/state/composite counts, the ordered command
/// kinds, target + platform). Real pixels are produced by the Flutter driver in
/// a later milestone; this record is what makes cross-platform consistency
/// *testable* here — two backends on two platforms replaying the same
/// [CommandBuffer] must yield an equal [RenderedFrame] modulo [platform].
///
/// Deterministic and JSON round-trippable — identical inputs yield an equal
/// frame.
@freezed
abstract class RenderedFrame with _$RenderedFrame {
  const factory RenderedFrame({
    /// The deterministic frame id (mirrors `CommandBuffer.frameId`).
    required int frameId,

    /// The platform whose adapter produced this frame.
    @JsonKey(fromJson: _platformFromJson, toJson: _platformToJson)
    required RenderPlatform platform,

    /// The target this frame rendered to.
    @JsonKey(fromJson: _targetFromJson, toJson: _targetToJson)
    required RenderTargetKind target,

    /// Total commands executed.
    @Default(0) int commandsExecuted,

    /// Draw commands executed (one per visible object).
    @Default(0) int drawCount,

    /// Distinct resources bound during the frame.
    @Default(0) int bindCount,

    /// Render-state changes applied.
    @Default(0) int stateChanges,

    /// Whether the frame reached composite.
    @Default(false) bool composited,

    /// Whether the frame was presented to a surface.
    @Default(false) bool presented,

    /// The executed command kinds, in order (wire names) — the deterministic
    /// fingerprint that must match across platforms.
    @Default(<String>[]) List<String> commandOrder,
  }) = _RenderedFrame;

  factory RenderedFrame.fromJson(Map<String, Object?> json) =>
      _$RenderedFrameFromJson(json);

  const RenderedFrame._();

  /// The cross-platform equality key: everything that must be identical across
  /// platforms (i.e. the frame minus which [platform] produced it). Two frames
  /// with equal fingerprints are the *same render*, deterministically.
  Map<String, Object?> get consistencyFingerprint => {
    'frameId': frameId,
    'target': target.wireName,
    'commandsExecuted': commandsExecuted,
    'drawCount': drawCount,
    'bindCount': bindCount,
    'stateChanges': stateChanges,
    'composited': composited,
    'presented': presented,
    'commandOrder': commandOrder,
  };
}

RenderPlatform _platformFromJson(String wireName) =>
    RenderPlatform.fromWireName(wireName);
String _platformToJson(RenderPlatform platform) => platform.wireName;

RenderTargetKind _targetFromJson(String wireName) =>
    RenderTargetKind.fromWireName(wireName);
String _targetToJson(RenderTargetKind kind) => kind.wireName;
