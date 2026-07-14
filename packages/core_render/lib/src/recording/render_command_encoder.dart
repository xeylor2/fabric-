import 'package:core_layer/core_layer.dart';
import 'package:core_render/src/context/render_context.dart';
import 'package:core_render/src/objects/render_object.dart';
import 'package:core_render/src/recording/command_buffer.dart';
import 'package:core_render/src/recording/render_command.dart';
import 'package:core_render/src/resource/resource.dart';
import 'package:core_render/src/vocabulary/render_vocabulary.dart';

/// The mutable builder that records a deterministic [CommandBuffer] (M5B-3).
///
/// Backend-independent: it appends typed [RenderCommand]s in strict draw order
/// and tracks render state so redundant state changes are elided. Nothing is
/// rasterized or presented. `build()` freezes the stream into an immutable
/// [CommandBuffer]. Given identical calls, the output is byte-identical.
final class RenderCommandEncoder {
  RenderCommandEncoder();

  int _frameId = 0;
  final List<RenderCommand> _commands = [];

  // Render State Tracking — current tracked state within the active pass.
  FebricBlendMode _blend = FebricBlendMode.normal;
  double _opacity = 1.0;
  final Set<String> _boundThisPass = {};

  // ------------------------------------------------------------- frame/target
  void beginFrame(RenderContext context) {
    _frameId = context.frameId;
    _commands.add(
      RenderCommand(
        kind: RenderCommandKind.beginFrame,
        frameId: context.frameId,
      ),
    );
  }

  void endFrame() =>
      _commands.add(const RenderCommand(kind: RenderCommandKind.endFrame));

  void beginTarget(RenderTargetKind target) => _commands.add(
    RenderCommand(
      kind: RenderCommandKind.beginRenderTarget,
      targetKind: target.wireName,
    ),
  );

  void endTarget() => _commands.add(
    const RenderCommand(kind: RenderCommandKind.endRenderTarget),
  );

  // --------------------------------------------------------------------- pass
  /// Opens a pass; resets tracked state so recording is order-independent
  /// across passes (determinism: a pass always starts from identity state).
  void beginPass(RenderPassKind kind) {
    _blend = FebricBlendMode.normal;
    _opacity = 1.0;
    _boundThisPass.clear();
    _commands.add(
      RenderCommand(kind: RenderCommandKind.beginPass, passKind: kind.wireName),
    );
  }

  void endPass(RenderPassKind kind) => _commands.add(
    RenderCommand(kind: RenderCommandKind.endPass, passKind: kind.wireName),
  );

  // ------------------------------------------------------------ state & bind
  /// Emits a state change only when [blend]/[opacity] differ from the tracked
  /// state (minimises the command stream; deterministic).
  void setRenderState({
    required FebricBlendMode blend,
    required double opacity,
  }) {
    if (blend == _blend && opacity == _opacity) return;
    _blend = blend;
    _opacity = opacity;
    _commands.add(
      RenderCommand(
        kind: RenderCommandKind.setRenderState,
        blend: blend.wireName,
        opacity: opacity,
      ),
    );
  }

  /// Binds a resource by logical key once per pass (deduped, content-addressed).
  void bindResource(ResourceKey key) {
    if (!_boundThisPass.add(key.key)) return;
    _commands.add(
      RenderCommand(kind: RenderCommandKind.bindResource, resourceKey: key.key),
    );
  }

  // --------------------------------------------------------------------- draw
  void draw(RenderObject object) => _commands.add(
    RenderCommand(kind: RenderCommandKind.draw, objectId: object.id),
  );

  void composite(RenderContext context) =>
      _commands.add(const RenderCommand(kind: RenderCommandKind.composite));

  /// Freezes the recorded stream into an immutable buffer.
  CommandBuffer build() =>
      CommandBuffer(frameId: _frameId, commands: List.unmodifiable(_commands));
}
