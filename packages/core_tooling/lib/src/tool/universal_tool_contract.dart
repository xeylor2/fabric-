import 'package:core_interaction/core_interaction.dart';
import 'package:core_lock/core_lock.dart';
import 'package:core_tooling/src/tool/tool_models.dart';

/// THE Universal Tool Contract of the FEBRIC OS (ADR-0012).
///
/// Every tool — Repeat Pattern, Colour Shift, Print Ready Enhancement,
/// Enhance Model Cloth, Motif Refinement, Redesign Textile Print, and every
/// future AI tool — implements exactly this interface. **Nothing else.**
/// The fourteen members below are frozen; extending the contract requires
/// an ADR.
///
/// Contract semantics:
/// - [initialize]/[dispose] bracket the tool's lifetime;
///   [activate]/[deactivate] bracket each time it becomes the active tool.
/// - [preview] stages a non-destructive proposal (invariant I2);
///   [execute] applies through the command bus (I1) after lock checks (I4).
/// - [cancel] aborts in-flight work; it must always be safe to call.
/// - [undo]/[redo] traverse the tool's history via the document timeline.
/// - [selection], [viewport], [history], [lock] and [metadata] expose the
///   tool's live state to the workspace — tools consume the shared
///   engines (interaction, lock, selection); they never re-implement them.
abstract interface class UniversalToolContract {
  Future<void> initialize(ToolContext context);

  Future<void> dispose();

  Future<void> activate();

  Future<void> deactivate();

  Future<ToolPreview> preview(ToolRequest request);

  Future<ToolResult> execute(ToolRequest request);

  Future<void> cancel();

  Future<ToolResult> undo();

  Future<ToolResult> redo();

  SelectionState selection();

  ViewportState viewport();

  ToolHistory history();

  LockSet lock();

  ToolMetadata metadata();
}
