import 'package:core_common/core_common.dart';
import 'package:core_document/src/commands/command_result.dart';
import 'package:core_document/src/commands/document_command.dart';
import 'package:core_document/src/engine/document_reducer.dart';
import 'package:core_document/src/history/document_history.dart';
import 'package:core_document/src/model/ai_provenance.dart';
import 'package:core_document/src/model/document_status.dart';
import 'package:core_document/src/model/febric_document.dart';
import 'package:core_lock/core_lock.dart';

/// The standard lock policy: a mutation is allowed iff the Lock Engine's
/// implication closure does not lock its scope/target (invariant I4).
final class StandardLockPolicy implements LockPolicy {
  const StandardLockPolicy();

  @override
  LockDecision check(LockSet locks, LockScope scope, {String? targetId}) {
    final blocking = locks.blockingLock(scope, targetId: targetId);
    return blocking == null
        ? LockDecision.permit
        : LockDecision(allowed: false, blockedBy: blocking);
  }
}

/// THE Document Engine (ADR-0014) — the single runtime source of truth.
///
/// Frozen pipeline (rule 5), executed for every command with no bypass:
///
/// ```
/// Lock Engine → Validation → History → Document
/// ```
///
/// - Nothing edits the document directly (rule 2): the only mutation entry
///   point is [apply].
/// - AI never modifies the document (rule 4): AI produces commands with
///   `source: CommandSource.ai`, which additionally REQUIRE provenance.
/// - Undo/redo are command-based: inverses computed at apply time.
final class DocumentEngine {
  DocumentEngine({
    required FebricDocument document,
    this.lockPolicy = const StandardLockPolicy(),
    this.clock = const SystemClock(),
    IdGenerator? historyIds,
  }) : _document = document,
       _historyIds = historyIds ?? SequentialIdGenerator(prefix: 'h'),
       _savedRevision = document.revision.value;

  /// The lock policy every mutation is checked against (invariant I4).
  final LockPolicy lockPolicy;

  /// Time seam for history timestamps.
  final Clock clock;

  final IdGenerator _historyIds;

  FebricDocument _document;
  DocumentStatus _status = DocumentStatus.clean;
  int _savedRevision;

  /// The current immutable document.
  FebricDocument get document => _document;

  /// The current runtime status.
  DocumentStatus get status => _status;

  /// Whether unsaved changes exist.
  bool get isDirty => _document.revision.value != _savedRevision;

  bool get canUndo => _document.history.canUndo;
  bool get canRedo => _document.history.canRedo;

  /// Submits a command through the frozen pipeline.
  ///
  /// [provenance] is REQUIRED when [source] is [CommandSource.ai]
  /// (invariant I5) and recorded into the provenance ledger with the
  /// resulting revision.
  CommandResult apply(
    DocumentCommand command, {
    CommandSource source = CommandSource.user,
    String author = 'local',
    AiProvenanceRecord? provenance,
  }) {
    // Runtime status gate.
    if (_status.rejectsMutations) {
      return CommandResult.rejected(
        reason: CommandRejectionReason.statusRefusesMutation,
        detail: 'Document is ${_status.label}',
      );
    }

    // Invariant I5: AI-sourced commands carry provenance, always.
    if (source == CommandSource.ai && provenance == null) {
      return const CommandResult.rejected(
        reason: CommandRejectionReason.missingProvenance,
        detail: 'AI commands must carry an AiProvenanceRecord',
      );
    }

    // 1 — LOCK ENGINE (before any compute; invariant I4).
    final historyLock = lockPolicy.check(_document.locks, LockScope.history);
    if (!historyLock.allowed) {
      return CommandResult.rejected(
        reason: CommandRejectionReason.locked,
        blockedBy: historyLock.blockedBy,
        detail: 'History is locked — no new commands may be recorded',
      );
    }
    final requirement = command.lockRequirement;
    final decision = lockPolicy.check(
      _document.locks,
      requirement.scope,
      targetId: requirement.targetId,
    );
    if (!decision.allowed) {
      return CommandResult.rejected(
        reason: CommandRejectionReason.locked,
        blockedBy: decision.blockedBy,
        detail: decision.blockedBy?.reason,
      );
    }

    // 2 — VALIDATION + pure reduction.
    final outcome = DocumentReducer.apply(_document, command);
    if (outcome is ReduceFailure) {
      return CommandResult.rejected(
        reason: outcome.reason,
        detail: outcome.detail,
      );
    }
    final success = outcome as ReduceSuccess;

    // 3 — HISTORY.
    final revision = _document.revision.next;
    final entry = HistoryEntry(
      id: _historyIds.next(),
      command: command,
      inverse: success.inverse,
      timestamp: clock.now(),
      author: author,
      source: source,
      affectedIds: success.affectedIds,
      revision: revision.value,
    );

    // 4 — DOCUMENT.
    _document = success.document.copyWith(
      revision: revision,
      history: _document.history.append(
        entry,
        maxEntries: _document.settings.maxHistoryEntries,
      ),
      aiProvenance: provenance == null
          ? success.document.aiProvenance
          : [
              ...success.document.aiProvenance,
              provenance.copyWith(
                revision: revision.value,
                affectedIds: success.affectedIds,
              ),
            ],
    );
    _status = DocumentStatus.modified;
    return CommandResult.applied(
      revision: revision.value,
      affectedIds: success.affectedIds,
    );
  }

  /// Undoes the last applied command by applying its stored inverse.
  /// Gated by the undo lock scope; never recorded as new history.
  CommandResult undo() => _traverse(isUndo: true);

  /// Re-applies the last undone command.
  CommandResult redo() => _traverse(isUndo: false);

  CommandResult _traverse({required bool isUndo}) {
    if (_status.rejectsMutations) {
      return CommandResult.rejected(
        reason: CommandRejectionReason.statusRefusesMutation,
        detail: 'Document is ${_status.label}',
      );
    }
    final undoLock = lockPolicy.check(_document.locks, LockScope.undo);
    if (!undoLock.allowed) {
      return CommandResult.rejected(
        reason: CommandRejectionReason.locked,
        blockedBy: undoLock.blockedBy,
        detail: 'Undo/redo traversal is locked',
      );
    }
    final history = _document.history;
    if (isUndo ? !history.canUndo : !history.canRedo) {
      return const CommandResult.rejected(
        reason: CommandRejectionReason.invalid,
        detail: 'Nothing to traverse',
      );
    }
    final entry = isUndo
        ? history.entries[history.cursor - 1]
        : history.entries[history.cursor];
    final replay = isUndo ? entry.inverse : entry.command;

    final outcome = DocumentReducer.apply(_document, replay);
    if (outcome is ReduceFailure) {
      return CommandResult.rejected(
        reason: outcome.reason,
        detail: outcome.detail,
      );
    }
    final success = outcome as ReduceSuccess;
    _document = success.document.copyWith(
      revision: _document.revision.next,
      history: isUndo ? history.undone() : history.redone(),
    );
    _status = DocumentStatus.modified;
    return CommandResult.applied(
      revision: _document.revision.value,
      affectedIds: success.affectedIds,
    );
  }

  // ---- runtime status transitions ------------------------------------------

  /// Marks a save in progress.
  void markSaving() => _status = DocumentStatus.saving;

  /// Marks the current revision as persisted.
  void markSaved() {
    _savedRevision = _document.revision.value;
    _status = DocumentStatus.clean;
  }

  /// Marks the document as recovered from a crash journal.
  void markRecovered() => _status = DocumentStatus.recovered;

  /// Switches read-only mode on/off.
  void setReadOnly({required bool readOnly}) {
    _status = readOnly ? DocumentStatus.readOnly : _deriveEditableStatus();
  }

  /// Archives the document (terminal until unarchived by a repository).
  void markArchived() => _status = DocumentStatus.archived;

  DocumentStatus _deriveEditableStatus() =>
      isDirty ? DocumentStatus.dirty : DocumentStatus.clean;
}
