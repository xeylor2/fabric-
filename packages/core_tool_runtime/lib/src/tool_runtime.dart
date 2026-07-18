import 'package:core_document/core_document.dart';
import 'package:core_interaction/core_interaction.dart';
import 'package:core_lock/core_lock.dart';
import 'package:core_selection/core_selection.dart';
import 'package:core_tooling/core_tooling.dart';

/// The **Tool Runtime** (M11): the runtime orchestration shell that hosts and
/// drives frozen [UniversalToolContract] instances (`core_tooling`,
/// ADR-0012). It is, for tools, the analogue of the Layer Runtime (M9) for
/// layer commands: a thin shell that owns *when* and *with what context* a
/// tool's contract methods run — never *what* a tool does.
///
/// It closes the `… → Tool` edge of the frozen canvas flow (ADR-0018) that
/// the M10 composition left as an extension point.
///
/// Responsibilities:
/// - **Lifecycle** — register tools keyed by their frozen
///   `metadata().tool.wireName`, enforce a single active tool, and drive
///   `initialize`/`activate`/`deactivate`/`dispose` in contract order
///   (initialize/dispose bracket lifetime; activate/deactivate bracket each
///   active period).
/// - **Context assembly** — build the frozen [ToolContext] from the live
///   viewport/selection/lock/region the caller supplies, handed to the tool
///   at `initialize`. It assembles from existing state; it fabricates
///   nothing.
/// - **Request routing** — forward `preview`/`execute`/`cancel`/`undo`/`redo`
///   to the active tool and return its frozen result **verbatim**.
/// - **State exposure** — surface the active tool's
///   `selection`/`viewport`/`history`/`lock`/`metadata` verbatim.
/// - **Tool-state seam** — carry a tool's [ToolStateExtension] keyed by
///   `toolId`, treating its `data` as opaque.
///
/// Ownership boundaries (resolved at Architecture Review):
/// - it **never owns a command sink** — the path from a tool's `execute` to
///   `DocumentEngine.apply` is established at that tool's own construction
///   (the frozen contracts intentionally do not define it; ADR-0012/0014).
///   The runtime is not a command-bus intermediary.
/// - it **never** builds, inspects or reduces a `DocumentCommand`, and never
///   reinterprets a [ToolResult]/[ToolPreview].
/// - it introduces **no new tool behaviour, model, vocabulary or contract**.
final class ToolRuntime {
  /// Creates an empty tool runtime. Tools are added via [registerTool]; the
  /// runtime builds none of them and holds no command sink.
  ToolRuntime();

  final Map<String, UniversalToolContract> _tools =
      <String, UniversalToolContract>{};
  final Set<String> _initialized = <String>{};
  final Map<String, ToolStateExtension> _toolStates =
      <String, ToolStateExtension>{};
  String? _activeId;

  // --------------------------------------------------------------- registry

  /// Registers [tool] keyed by its frozen `metadata().tool.wireName` and
  /// returns that id. Re-registering the same id replaces the instance. This
  /// is a pure registry update — it runs no lifecycle method.
  String registerTool(UniversalToolContract tool) {
    final toolId = tool.metadata().tool.wireName;
    _tools[toolId] = tool;
    return toolId;
  }

  /// Whether a tool is registered under [toolId].
  bool isRegistered(String toolId) => _tools.containsKey(toolId);

  /// The ids of all registered tools.
  List<String> get registeredToolIds => _tools.keys.toList(growable: false);

  /// The active tool id, or null when no tool is active.
  String? get activeToolId => _activeId;

  // -------------------------------------------------------------- lifecycle

  /// Makes the tool registered under [toolId] the active tool.
  ///
  /// Follows the frozen contract order: deactivate the current tool (if any),
  /// set the active reference, `initialize` with an assembled [ToolContext]
  /// on first use, then `activate`. The context is built from the supplied
  /// live state — the runtime fabricates none of it.
  ///
  /// Throws [ArgumentError] if [toolId] is not registered (a caller
  /// precondition; nothing reaches the document).
  Future<void> activate(
    String toolId, {
    required ViewportState viewport,
    SelectionState selection = SelectionState.empty,
    LockSet locks = LockSet.none,
    SelectionSnapshot? regionSelection,
    Map<String, Object?> config = const <String, Object?>{},
  }) async {
    final tool = _tools[toolId];
    if (tool == null) {
      throw ArgumentError.value(toolId, 'toolId', 'No tool registered');
    }
    final current = _activeId;
    if (current != null && current != toolId) {
      await _tools[current]!.deactivate();
    }
    _activeId = toolId;
    if (!_initialized.contains(toolId)) {
      await tool.initialize(
        ToolContext(
          viewport: viewport,
          selection: selection,
          locks: locks,
          regionSelection: regionSelection,
          config: config,
        ),
      );
      _initialized.add(toolId);
    }
    await tool.activate();
  }

  /// Deactivates the active tool (if any). Safe to call with no active tool.
  /// The tool's lifetime is not ended — [disposeTool] does that.
  Future<void> deactivate() async {
    final tool = _active;
    if (tool == null) {
      return;
    }
    await tool.deactivate();
    _activeId = null;
  }

  /// Ends the lifetime of the tool under [toolId]: deactivates it first if it
  /// is active, then `dispose`, and forgets its initialization. Safe to call
  /// for an unknown id (no-op).
  Future<void> disposeTool(String toolId) async {
    final tool = _tools[toolId];
    if (tool == null) {
      return;
    }
    if (_activeId == toolId) {
      await tool.deactivate();
      _activeId = null;
    }
    await tool.dispose();
    _initialized.remove(toolId);
  }

  // ------------------------------------------------------- request routing

  /// Routes a non-destructive [preview] to the active tool (invariant I2:
  /// preview never reaches the document). Returns the tool's frozen
  /// [ToolPreview] verbatim, or null when there is no active tool.
  Future<ToolPreview?> preview(ToolRequest request) async {
    final tool = _active;
    if (tool == null) {
      return null;
    }
    return tool.preview(request);
  }

  /// Routes [execute] to the active tool, returning its frozen [ToolResult]
  /// verbatim. With no active tool it returns a frozen rejected result and
  /// never reaches the document. The tool applies through the command bus it
  /// was constructed with — the runtime holds no sink.
  Future<ToolResult> execute(ToolRequest request) async {
    final tool = _active;
    if (tool == null) {
      return _noActiveTool;
    }
    return tool.execute(request);
  }

  /// Aborts in-flight work on the active tool. Always safe: a no-op when no
  /// tool is active (frozen contract: cancel is always safe to call).
  Future<void> cancel() async {
    await _active?.cancel();
  }

  /// Routes [undo] to the active tool, returning its frozen [ToolResult]
  /// verbatim; a frozen rejected result when no tool is active.
  Future<ToolResult> undo() async {
    final tool = _active;
    if (tool == null) {
      return _noActiveTool;
    }
    return tool.undo();
  }

  /// Routes [redo] to the active tool, returning its frozen [ToolResult]
  /// verbatim; a frozen rejected result when no tool is active.
  Future<ToolResult> redo() async {
    final tool = _active;
    if (tool == null) {
      return _noActiveTool;
    }
    return tool.redo();
  }

  // -------------------------------------------------------- state exposure
  // The active tool's frozen state, surfaced verbatim. Null when no tool is
  // active (the runtime fabricates no empty state for types that have none).

  /// The active tool's `selection()`, or null when no tool is active.
  SelectionState? get activeSelection => _active?.selection();

  /// The active tool's `viewport()`, or null when no tool is active.
  ViewportState? get activeViewport => _active?.viewport();

  /// The active tool's `history()`, or null when no tool is active.
  ToolHistory? get activeHistory => _active?.history();

  /// The active tool's `lock()`, or null when no tool is active.
  LockSet? get activeLock => _active?.lock();

  /// The active tool's `metadata()`, or null when no tool is active.
  ToolMetadata? get activeMetadata => _active?.metadata();

  // ----------------------------------------------------- tool-state seam
  // A keyed carrier of the frozen persistence envelope (ADR-0014 rule 3).
  // The runtime keys by toolId and treats `data` as opaque — it never reads,
  // interprets or mutates the payload, and holds no document/sink itself.

  /// Stores a tool's [ToolStateExtension], keyed by its `toolId`. The payload
  /// is opaque to the runtime.
  void saveToolState(ToolStateExtension state) =>
      _toolStates[state.toolId] = state;

  /// The stored [ToolStateExtension] for [toolId], or null when none has been
  /// saved. Returned verbatim.
  ToolStateExtension? toolState(String toolId) => _toolStates[toolId];

  // ------------------------------------------------------------- internals

  UniversalToolContract? get _active =>
      _activeId == null ? null : _tools[_activeId];

  static const ToolResult _noActiveTool = ToolResult(
    status: ToolResultStatus.rejected,
    message: 'No active tool',
  );
}
