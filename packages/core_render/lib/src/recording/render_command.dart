import 'package:freezed_annotation/freezed_annotation.dart';

part 'render_command.freezed.dart';
part 'render_command.g.dart';

/// The backend-independent recorded rendering command kinds (M5B-3). A
/// [CommandBuffer] is an ordered, immutable stream of these — no GPU, no
/// pixels. Wire names are frozen (append-only) and pinned by the freeze test.
enum RenderCommandKind {
  beginFrame('begin_frame', 'Begin Frame'),
  beginRenderTarget('begin_render_target', 'Begin Render Target'),
  beginPass('begin_pass', 'Begin Pass'),
  setRenderState('set_render_state', 'Set Render State'),
  bindResource('bind_resource', 'Bind Resource'),
  draw('draw', 'Draw'),
  endPass('end_pass', 'End Pass'),
  endRenderTarget('end_render_target', 'End Render Target'),
  composite('composite', 'Composite'),
  endFrame('end_frame', 'End Frame');

  const RenderCommandKind(this.wireName, this.label);

  final String wireName;
  final String label;

  static RenderCommandKind fromWireName(String name) => values.firstWhere(
    (v) => v.wireName == name,
    orElse: () => throw ArgumentError.value(
      name,
      'name',
      'Unknown RenderCommandKind wire name',
    ),
  );
}

/// One recorded, immutable rendering command (M5B-3). A flat record: only the
/// fields relevant to [kind] are populated. Backend-independent — it names
/// *what* to do (draw object X, bind resource Y, set blend Z), never *how*.
/// Deterministic: produced identically from identical inputs.
@freezed
abstract class RenderCommand with _$RenderCommand {
  const factory RenderCommand({
    @JsonKey(fromJson: _kindFromJson, toJson: _kindToJson)
    required RenderCommandKind kind,

    /// Draw: the render object's id (a reference — never owned data, R2).
    String? objectId,

    /// Bind: the logical resource key (content-addressed).
    String? resourceKey,

    /// Set-state: the blend mode wire name (frozen `FebricBlendMode`).
    String? blend,

    /// Set-state: opacity in [0,1].
    double? opacity,

    /// Begin-pass: the pass kind wire name (frozen `RenderPassKind`).
    String? passKind,

    /// Begin-target: the target kind wire name (frozen `RenderTargetKind`).
    String? targetKind,

    /// Begin-frame: the deterministic frame id.
    int? frameId,
  }) = _RenderCommand;

  factory RenderCommand.fromJson(Map<String, Object?> json) =>
      _$RenderCommandFromJson(json);
}

/// The tracked render state (blend + opacity). The encoder emits a
/// `set_render_state` command only when this changes — deterministic state
/// minimization (M5B-3 render state tracking).
@freezed
abstract class RenderStateSnapshot with _$RenderStateSnapshot {
  const factory RenderStateSnapshot({
    /// Blend mode wire name (frozen `FebricBlendMode`).
    @Default('normal') String blend,
    @Default(1.0) double opacity,
  }) = _RenderStateSnapshot;

  factory RenderStateSnapshot.fromJson(Map<String, Object?> json) =>
      _$RenderStateSnapshotFromJson(json);

  const RenderStateSnapshot._();

  /// The identity state (normal blend, fully opaque) — the state at the start
  /// of every pass.
  static const RenderStateSnapshot identity = RenderStateSnapshot();
}

RenderCommandKind _kindFromJson(String wireName) =>
    RenderCommandKind.fromWireName(wireName);

String _kindToJson(RenderCommandKind kind) => kind.wireName;
