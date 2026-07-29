import 'package:core_common/core_common.dart';
import 'package:core_document/core_document.dart';
import 'package:core_interaction/core_interaction.dart';
import 'package:core_lock/core_lock.dart';
import 'package:core_textile/core_textile.dart';
import 'package:core_tooling/core_tooling.dart';

/// The Repeat Pattern tool (M15 S2) — the first `FebricTool`-identified
/// implementation of the frozen `UniversalToolContract` (ADR-0012), and
/// the first PRODUCTION writer of the M14 S3 node-repeat representation.
///
/// Emission (approved D4): targets selected NODE ids and emits ONLY the
/// frozen `setNodeMetadata` command carrying the S3-bound payload
/// `{'type': <RepeatType wireName>, ...parameters}` — one command per
/// capable target, each with its exact inverse. The layer-tier
/// `RepeatPatternCommand` is never named here; no precedence or merge
/// semantics between the tiers is asserted (Q3's co-existence question
/// stays open).
///
/// Preview/execute (approved D2, deterministic regime): the returned
/// [ToolPreview] value IS the staged proposal — tool-local, described,
/// non-applied. Nothing applies at preview; `execute` applies through the
/// injected sink (`CommandSource.user` — the frozen engine default), after
/// validation. No `AiProposal` is created and no staging area is touched.
///
/// History (approved D5): the document engine owns the one timeline;
/// [ToolHistory] here is a descriptive, non-authoritative projection —
/// one entry per emitted command; `undo`/`redo` perform exactly one
/// injected engine call per invocation.
///
/// Capability gating (approved D4, the M12E precedent): the frozen
/// [ToolContext] carries no tree, so target node types arrive
/// caller-supplied via `parameters['target_types']` and are checked
/// against the frozen `NodeCapabilityMatrix` — exactly the frozen
/// `StaticPlanValidator` semantics. That inherits M12E's trust model: the
/// caller carries the burden of truthful types (the reducer does not
/// capability-gate `setNodeMetadata`). An untyped target is rejected.
///
/// Lock gating (approved D4, invariant I4 — both layers): tool-side, the
/// injected [LockSet] is consulted via the frozen
/// `blockingLock(LockScope.object, targetId: ...)` BEFORE any emission;
/// reducer-side, the frozen `_mutateNode` path independently rejects
/// node-flag-locked subtrees with `locked` (verified frozen behaviour),
/// surfaced by this tool as a failed result.
///
/// Mixed selections are ALL-OR-NOTHING (the approved S2 policy): any
/// failing target rejects the whole request with zero emissions
/// (`ToolResultStatus.rejected` — "refused before execution", the frozen
/// status semantics). A mid-sequence sink rejection stops emission and
/// returns `failed` naming the offender; commands already applied remain
/// individually undoable — the frozen stepwise reality (Q7-d#1 grouping
/// stays open; no rollback mechanism exists or is invented).
final class RepeatPatternTool implements UniversalToolContract {
  RepeatPatternTool({
    required this.sink,
    required this.undoDelegate,
    required this.redoDelegate,
    required this.ids,
    required this.artboardId,
  });

  /// The injected apply seam (the frozen M12A sink pattern; D2) —
  /// tear-off-compatible with the frozen `DocumentEngine.apply`.
  final CommandResult Function(DocumentCommand command) sink;

  /// The injected undo/redo delegates (D5) — tear-off-compatible with the
  /// frozen `DocumentEngine.undo`/`redo`.
  final CommandResult Function() undoDelegate;
  final CommandResult Function() redoDelegate;

  /// Mints preview and history-entry ids (the frozen IdGenerator seam).
  final IdGenerator ids;

  /// The artboard whose design tree this tool targets.
  final String artboardId;

  /// Set by [initialize] (the frozen contract order: initialize/dispose
  /// bracket the tool's lifetime — state members are meaningful only
  /// inside that bracket).
  late ToolContext _context;
  bool _initialized = false;
  bool _active = false;
  ToolPreview? _pendingPreview;
  final List<ToolHistoryEntry> _entries = [];
  int _cursor = -1;

  @override
  Future<void> initialize(ToolContext context) async {
    _context = context;
    _initialized = true;
  }

  @override
  Future<void> dispose() async {
    _initialized = false;
    _active = false;
    _pendingPreview = null;
  }

  @override
  Future<void> activate() async {
    _active = true;
  }

  @override
  Future<void> deactivate() async {
    _active = false;
  }

  @override
  Future<ToolPreview> preview(ToolRequest request) async {
    final failure = _validate(request);
    final previewId = ids.next();
    if (failure != null) {
      final preview = ToolPreview(
        previewId: previewId,
        description: 'Repeat rejected: $failure',
        payload: {'rejects': failure},
      );
      _pendingPreview = preview;
      return preview;
    }
    final payload = _repeatPayload(request);
    final preview = ToolPreview(
      previewId: previewId,
      description:
          'Repeat ${payload['type']} over '
          '${request.targetIds.length} node(s)',
      payload: {'targets': request.targetIds, 'repeat': payload},
    );
    _pendingPreview = preview;
    return preview;
  }

  @override
  Future<ToolResult> execute(ToolRequest request) async {
    final failure = _validate(request);
    if (failure != null) {
      return ToolResult(
        status: ToolResultStatus.rejected,
        message: failure,
        previewId: _pendingPreview?.previewId,
      );
    }
    final payload = _repeatPayload(request);
    for (final targetId in request.targetIds) {
      final result = sink(
        DocumentCommand.setNodeMetadata(
          artboardId: artboardId,
          nodeId: targetId,
          key: 'repeat',
          value: payload,
        ),
      );
      if (result is! CommandApplied) {
        final reason = result is CommandRejected
            ? result.reason.wireName
            : 'unknown';
        return ToolResult(
          status: ToolResultStatus.failed,
          message: 'setNodeMetadata rejected for $targetId: $reason',
          previewId: _pendingPreview?.previewId,
        );
      }
      _entries.add(
        ToolHistoryEntry(
          id: ids.next(),
          description: 'Repeat ${payload['type']} on $targetId',
          metadata: {'nodeId': targetId},
        ),
      );
      _cursor = _entries.length - 1;
    }
    return ToolResult(
      status: ToolResultStatus.success,
      previewId: _pendingPreview?.previewId,
    );
  }

  @override
  Future<void> cancel() async {
    _pendingPreview = null;
  }

  @override
  Future<ToolResult> undo() async {
    if (!history().canUndo) {
      return const ToolResult(
        status: ToolResultStatus.rejected,
        message: 'Nothing to undo',
      );
    }
    final result = undoDelegate();
    if (result is! CommandApplied) {
      return const ToolResult(status: ToolResultStatus.failed);
    }
    _cursor--;
    return ToolResult.success;
  }

  @override
  Future<ToolResult> redo() async {
    if (!history().canRedo) {
      return const ToolResult(
        status: ToolResultStatus.rejected,
        message: 'Nothing to redo',
      );
    }
    final result = redoDelegate();
    if (result is! CommandApplied) {
      return const ToolResult(status: ToolResultStatus.failed);
    }
    _cursor++;
    return ToolResult.success;
  }

  @override
  SelectionState selection() => _context.selection;

  @override
  ViewportState viewport() => _context.viewport;

  @override
  ToolHistory history() =>
      ToolHistory(entries: List.unmodifiable(_entries), cursor: _cursor);

  @override
  LockSet lock() => _context.locks;

  @override
  ToolMetadata metadata() =>
      const ToolMetadata(tool: FebricTool.repeatPattern, version: '0.1.0');

  /// Whether the tool has been initialized and activated (exposed for
  /// lifecycle verification; the runtime drives the frozen order).
  bool get isInitialized => _initialized;
  bool get isActive => _active;

  /// Shared validation (used verbatim by preview and execute): returns
  /// the first offending condition, or null when the request is valid.
  /// ALL-OR-NOTHING: any failure rejects the whole request.
  String? _validate(ToolRequest request) {
    if (request.targetIds.isEmpty) {
      return 'No target nodes';
    }
    final typeWire = request.parameters['type'];
    if (typeWire is! String) {
      return 'Missing repeat type';
    }
    final RepeatType repeat;
    try {
      repeat = RepeatType.fromWireName(typeWire);
    } on ArgumentError {
      return 'Unknown repeat type: $typeWire';
    }
    // Referenced to keep the validated value in use; the payload builder
    // re-reads the wire name.
    assert(repeat.wireName == typeWire);
    final rawTypes = request.parameters['target_types'];
    final targetTypes = rawTypes is Map ? rawTypes : const <Object?, Object?>{};
    for (final targetId in request.targetIds) {
      final typeName = targetTypes[targetId];
      if (typeName is! String) {
        return 'No node type supplied for $targetId';
      }
      final DesignNodeType nodeType;
      try {
        nodeType = DesignNodeType.fromWireName(typeName);
      } on ArgumentError {
        return 'Unknown node type for $targetId: $typeName';
      }
      if (!NodeCapabilityMatrix.supports(nodeType, NodeCapability.repeat)) {
        return '${nodeType.wireName} nodes do not support repeat '
            '($targetId)';
      }
      final blocking = _context.locks.blockingLock(
        LockScope.object,
        targetId: targetId,
      );
      if (blocking != null) {
        return 'Target $targetId is locked (${blocking.scope.wireName})';
      }
    }
    return null;
  }

  /// The S3-bound node-repeat payload: `{'type': wireName, ...parameters}`.
  Map<String, Object?> _repeatPayload(ToolRequest request) {
    final extra = request.parameters['parameters'];
    return {
      'type': request.parameters['type'],
      if (extra is Map<String, Object?>) ...extra,
    };
  }
}
