import 'package:core_interaction/core_interaction.dart';
import 'package:core_lock/core_lock.dart';
import 'package:core_selection/core_selection.dart';
import 'package:core_textile/core_textile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tool_models.freezed.dart';
part 'tool_models.g.dart';

/// Identity and capabilities of a tool (returned by
/// `UniversalToolContract.metadata()`).
@freezed
abstract class ToolMetadata with _$ToolMetadata {
  const factory ToolMetadata({
    /// The frozen FEBRIC tool this instance implements.
    @JsonKey(fromJson: _toolFromJson, toJson: _toolToJson)
    required FebricTool tool,

    required String version,

    /// Whether the tool invokes AI (staging, credits, provenance apply).
    @Default(false) bool aiBacked,

    @Default(<String, Object?>{}) Map<String, Object?> metadata,
  }) = _ToolMetadata;

  factory ToolMetadata.fromJson(Map<String, Object?> json) =>
      _$ToolMetadataFromJson(json);
}

FebricTool _toolFromJson(String wireName) => FebricTool.fromWireName(wireName);

String _toolToJson(FebricTool tool) => tool.wireName;

/// Everything a tool receives at initialization — tools obtain state from
/// the context; they never reach into engines directly (dependency
/// inversion).
@freezed
abstract class ToolContext with _$ToolContext {
  const factory ToolContext({
    required ViewportState viewport,
    @Default(SelectionState.empty) SelectionState selection,
    @Default(LockSet.none) LockSet locks,
    SelectionSnapshot? regionSelection,
    @Default(<String, Object?>{}) Map<String, Object?> config,
  }) = _ToolContext;

  factory ToolContext.fromJson(Map<String, Object?> json) =>
      _$ToolContextFromJson(json);
}

/// One request to preview or execute a tool operation.
@freezed
abstract class ToolRequest with _$ToolRequest {
  const factory ToolRequest({
    /// Target node/layer ids the operation is scoped to.
    @Default(<String>[]) List<String> targetIds,

    /// Optional region scope (canvas units).
    Rect2D? region,

    /// Tool-specific parameters (typed per tool in its milestone).
    @Default(<String, Object?>{}) Map<String, Object?> parameters,

    /// Reproducibility seed for AI-backed tools.
    int? seed,
  }) = _ToolRequest;

  factory ToolRequest.fromJson(Map<String, Object?> json) =>
      _$ToolRequestFromJson(json);
}

/// A staged, non-destructive preview of what execute() would do
/// (constitutional invariant I2: nothing applies without approval).
@freezed
abstract class ToolPreview with _$ToolPreview {
  const factory ToolPreview({
    /// Stable UUID of the staged proposal.
    required String previewId,

    /// Human-readable description of the pending change.
    required String description,

    @Default(<String, Object?>{}) Map<String, Object?> payload,
  }) = _ToolPreview;

  factory ToolPreview.fromJson(Map<String, Object?> json) =>
      _$ToolPreviewFromJson(json);
}

/// Terminal status of a tool operation.
enum ToolResultStatus {
  success('success', 'Success'),
  cancelled('cancelled', 'Cancelled'),

  /// Refused before execution (locks, validation) — never an exception.
  rejected('rejected', 'Rejected'),

  failed('failed', 'Failed');

  const ToolResultStatus(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static ToolResultStatus fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown ToolResultStatus wire name',
      ),
    );
  }
}

/// Outcome of execute()/undo()/redo().
@freezed
abstract class ToolResult with _$ToolResult {
  const factory ToolResult({
    required ToolResultStatus status,
    String? message,

    /// The staged proposal this result refers to, when applicable.
    String? previewId,

    @Default(<String, Object?>{}) Map<String, Object?> payload,
  }) = _ToolResult;

  factory ToolResult.fromJson(Map<String, Object?> json) =>
      _$ToolResultFromJson(json);

  const ToolResult._();

  static const ToolResult success = ToolResult(
    status: ToolResultStatus.success,
  );
}

/// One entry in a tool's history (returned by history()).
@freezed
abstract class ToolHistoryEntry with _$ToolHistoryEntry {
  const factory ToolHistoryEntry({
    required String id,
    required String description,
    @Default(<String, Object?>{}) Map<String, Object?> metadata,
  }) = _ToolHistoryEntry;

  factory ToolHistoryEntry.fromJson(Map<String, Object?> json) =>
      _$ToolHistoryEntryFromJson(json);
}

/// Cursor-based tool history (the document engine owns the global
/// timeline; this is the tool-local view of it).
@freezed
abstract class ToolHistory with _$ToolHistory {
  const factory ToolHistory({
    @Default(<ToolHistoryEntry>[]) List<ToolHistoryEntry> entries,
    @Default(-1) int cursor,
  }) = _ToolHistory;

  factory ToolHistory.fromJson(Map<String, Object?> json) =>
      _$ToolHistoryFromJson(json);

  const ToolHistory._();

  static const ToolHistory empty = ToolHistory();

  bool get canUndo => cursor >= 0;
  bool get canRedo => cursor < entries.length - 1;
}
