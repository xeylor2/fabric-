import 'package:core_common/core_common.dart';
import 'package:core_document/core_document.dart';
import 'package:core_interaction/core_interaction.dart';
import 'package:core_lock/core_lock.dart';
import 'package:core_textile/core_textile.dart';
import 'package:core_tooling/core_tooling.dart';

/// The Colour Shift tool (M15 S3) — the second deterministic
/// `UniversalToolContract` implementation, and the production FRONT-END of
/// the frozen `ChangeColourCommand` (the approved D3 determination).
///
/// Emission (approved D3): targets selected LAYER ids and emits ONLY the
/// frozen `changeColour` command — one per target, each with its exact
/// inverse. The frozen reducer persists the hex string alone under the
/// layer `'colour'` key; the `ColourOperation` rides the journaled command
/// and is never written into metadata (the approved D3 refinement note,
/// repository-verified). Node-tier recolouring is NOT provided here — per
/// D3 it belongs to the AI-backed path and arrives with its own milestone.
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
/// Validation: no capability gate exists for layers — the frozen
/// `NodeCapabilityMatrix`'s domain is `DesignNodeType` (node-tier) and no
/// layer capability contract exists in the repository; inventing one is
/// barred. No hex-grammar validation is invented either: the frozen
/// command accepts any `String` and this tool preserves that surface
/// (presence + `String` type is the whole check). Layer EXISTENCE is not
/// tool-checkable (the frozen [ToolContext] carries no layer tree); a
/// missing layer surfaces as the engine's `notFound` → `failed`.
///
/// Lock gating (invariant I4 — two layers, both repository-verified,
/// located differently than the node tier): tool-side, the injected
/// [LockSet] is consulted via the frozen
/// `blockingLock(LockScope.layer, targetId: ...)` BEFORE any emission;
/// engine-side, the frozen apply PREFLIGHT checks
/// `ChangeColourCommand.lockRequirement` (`LockScope.layer`/layerId)
/// against the document's own locks before reduction — the reducer's
/// `_setLayerMetadata` path itself performs no lock check.
///
/// Mixed selections are ALL-OR-NOTHING (the S2-established policy adopted
/// for this slice): any failing target rejects the whole request with
/// zero emissions (`ToolResultStatus.rejected` — "refused before
/// execution"). A mid-sequence sink rejection stops emission and returns
/// `failed` naming the offender; commands already applied remain
/// individually undoable (Q7-d#1 grouping stays open; no rollback
/// mechanism exists or is invented).
final class ColourShiftTool implements UniversalToolContract {
  ColourShiftTool({
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

  /// The artboard whose layer tree this tool targets.
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
        description: 'Colour shift rejected: $failure',
        payload: {'rejects': failure},
      );
      _pendingPreview = preview;
      return preview;
    }
    final operation = request.parameters['operation']! as String;
    final colourHex = request.parameters['colour']! as String;
    final preview = ToolPreview(
      previewId: previewId,
      description:
          'Colour shift $operation to $colourHex over '
          '${request.targetIds.length} layer(s)',
      payload: {
        'targets': request.targetIds,
        'colour': {'operation': operation, 'colour': colourHex},
      },
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
    final operation = ColourOperation.fromWireName(
      request.parameters['operation']! as String,
    );
    final colourHex = request.parameters['colour']! as String;
    for (final layerId in request.targetIds) {
      final result = sink(
        DocumentCommand.changeColour(
          artboardId: artboardId,
          layerId: layerId,
          operation: operation,
          colourHex: colourHex,
        ),
      );
      if (result is! CommandApplied) {
        final reason = result is CommandRejected
            ? result.reason.wireName
            : 'unknown';
        return ToolResult(
          status: ToolResultStatus.failed,
          message: 'changeColour rejected for $layerId: $reason',
          previewId: _pendingPreview?.previewId,
        );
      }
      _entries.add(
        ToolHistoryEntry(
          id: ids.next(),
          description:
              'Colour shift ${operation.wireName} to $colourHex '
              'on $layerId',
          metadata: {'layerId': layerId},
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
      const ToolMetadata(tool: FebricTool.colourShift, version: '0.1.0');

  /// Whether the tool has been initialized and activated (exposed for
  /// lifecycle verification; the runtime drives the frozen order).
  bool get isInitialized => _initialized;
  bool get isActive => _active;

  /// Shared validation (used verbatim by preview and execute): returns
  /// the first offending condition, or null when the request is valid.
  /// ALL-OR-NOTHING: any failure rejects the whole request.
  String? _validate(ToolRequest request) {
    if (request.targetIds.isEmpty) {
      return 'No target layers';
    }
    final operationWire = request.parameters['operation'];
    if (operationWire is! String) {
      return 'Missing colour operation';
    }
    try {
      ColourOperation.fromWireName(operationWire);
    } on ArgumentError {
      return 'Unknown colour operation: $operationWire';
    }
    if (request.parameters['colour'] is! String) {
      return 'Missing colour value';
    }
    for (final layerId in request.targetIds) {
      final blocking = _context.locks.blockingLock(
        LockScope.layer,
        targetId: layerId,
      );
      if (blocking != null) {
        return 'Target $layerId is locked (${blocking.scope.wireName})';
      }
    }
    return null;
  }
}
