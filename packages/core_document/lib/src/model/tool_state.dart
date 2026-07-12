import 'package:freezed_annotation/freezed_annotation.dart';

part 'tool_state.freezed.dart';
part 'tool_state.g.dart';

/// The tool-agnostic persistence envelope (frozen rule 3/6, ADR-0014).
///
/// The Document Engine has **no tool-specific fields**. Every tool —
/// Repeat Pattern, Colour Shift, Motif Refinement, Print Ready
/// Enhancement, Enhance Model Cloth, future plugins and AI tools —
/// persists state exclusively through this envelope, keyed by its frozen
/// wire name (`FebricTool.wireName` or a plugin's reverse-domain id).
/// **The document schema never changes when a tool is added.**
@freezed
abstract class ToolStateExtension with _$ToolStateExtension {
  const factory ToolStateExtension({
    /// `FebricTool.wireName` or plugin id — the registry key.
    required String toolId,

    /// Tool-owned schema version of [data] (tools migrate their own data).
    @Default(1) int version,

    /// Tool-owned payload; opaque to the Document Engine.
    @Default(<String, Object?>{}) Map<String, Object?> data,
  }) = _ToolStateExtension;

  factory ToolStateExtension.fromJson(Map<String, Object?> json) =>
      _$ToolStateExtensionFromJson(json);
}
