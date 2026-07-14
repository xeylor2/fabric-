import 'package:core_render/src/recording/render_command.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'command_buffer.freezed.dart';
part 'command_buffer.g.dart';

/// An immutable, ordered stream of recorded [RenderCommand]s for one frame
/// (M5B-3). Backend-independent: any backend (headless, or a future Impeller
/// driver in M5B-3+) could replay it, but nothing is rasterized or presented
/// here. Deterministic — identical inputs yield an equal buffer.
@freezed
abstract class CommandBuffer with _$CommandBuffer {
  const factory CommandBuffer({
    required int frameId,
    @Default(<RenderCommand>[]) List<RenderCommand> commands,
  }) = _CommandBuffer;

  factory CommandBuffer.fromJson(Map<String, Object?> json) =>
      _$CommandBufferFromJson(json);

  const CommandBuffer._();

  /// Total recorded commands.
  int get length => commands.length;

  /// Commands of a given [kind], in record order.
  List<RenderCommand> ofKind(RenderCommandKind kind) =>
      commands.where((c) => c.kind == kind).toList(growable: false);

  /// Number of draw commands (one per visible render object).
  int get drawCount => ofKind(RenderCommandKind.draw).length;
}
