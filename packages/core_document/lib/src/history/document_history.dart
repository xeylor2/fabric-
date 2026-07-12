import 'package:core_document/src/commands/document_command.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'document_history.freezed.dart';
part 'document_history.g.dart';

/// One applied command in the document timeline (frozen rule 5: History
/// records everything). Undo/redo are **command-based**: [inverse] is the
/// exact command that reverts [command] — no snapshots.
@freezed
abstract class HistoryEntry with _$HistoryEntry {
  const factory HistoryEntry({
    /// Stable UUID of this entry.
    required String id,

    required DocumentCommand command,

    /// The exact inverse command (computed by the reducer at apply time,
    /// capturing prior values).
    required DocumentCommand inverse,

    required DateTime timestamp,

    /// Who authored the change (user id / agent id).
    required String author,

    @JsonKey(fromJson: _sourceFromJson, toJson: _sourceToJson)
    required CommandSource source,

    /// Ids of the objects the command touched.
    @Default(<String>[]) List<String> affectedIds,

    /// Document revision this entry produced.
    required int revision,
  }) = _HistoryEntry;

  factory HistoryEntry.fromJson(Map<String, Object?> json) =>
      _$HistoryEntryFromJson(json);
}

/// The command journal with a cursor: entries before the cursor are the
/// undo stack, entries after it are the redo stack (both derived — one
/// source of truth). Bounded by the document's `maxHistoryEntries`.
@freezed
abstract class DocumentHistory with _$DocumentHistory {
  const factory DocumentHistory({
    @Default(<HistoryEntry>[]) List<HistoryEntry> entries,

    /// Number of entries currently applied; entries[cursor - 1] is the
    /// next undo candidate.
    @Default(0) int cursor,
  }) = _DocumentHistory;

  factory DocumentHistory.fromJson(Map<String, Object?> json) =>
      _$DocumentHistoryFromJson(json);

  const DocumentHistory._();

  static const DocumentHistory empty = DocumentHistory();

  bool get canUndo => cursor > 0;
  bool get canRedo => cursor < entries.length;

  /// The applied entries, newest last (the undo stack).
  List<HistoryEntry> get undoStack => entries.sublist(0, cursor);

  /// The undone entries awaiting redo, oldest first (the redo stack).
  List<HistoryEntry> get redoStack => entries.sublist(cursor);

  /// Appends [entry], truncating any redo branch and bounding size to
  /// [maxEntries].
  DocumentHistory append(HistoryEntry entry, {required int maxEntries}) {
    final kept = [...entries.take(cursor), entry];
    final overflow = kept.length - maxEntries;
    final bounded = overflow > 0 ? kept.sublist(overflow) : kept;
    return DocumentHistory(entries: bounded, cursor: bounded.length);
  }

  /// Moves the cursor back one entry (caller applies the inverse).
  DocumentHistory undone() => canUndo ? copyWith(cursor: cursor - 1) : this;

  /// Moves the cursor forward one entry (caller re-applies the command).
  DocumentHistory redone() => canRedo ? copyWith(cursor: cursor + 1) : this;
}

CommandSource _sourceFromJson(String wireName) =>
    CommandSource.fromWireName(wireName);

String _sourceToJson(CommandSource source) => source.wireName;
