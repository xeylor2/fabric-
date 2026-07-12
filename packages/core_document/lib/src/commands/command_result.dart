import 'package:core_lock/core_lock.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'command_result.freezed.dart';
part 'command_result.g.dart';

/// Why a command was refused (frozen, append-only).
enum CommandRejectionReason {
  /// Blocked by the Lock Engine (invariant I4).
  locked('locked', 'Locked'),

  /// Referenced target does not exist.
  notFound('not_found', 'Not Found'),

  /// Structurally invalid (bad payload, cycle, duplicate id…).
  invalid('invalid', 'Invalid'),

  /// The document's runtime status refuses mutations
  /// (read-only / archived / loading).
  statusRefusesMutation('status_refuses_mutation', 'Status Refuses Mutation'),

  /// AI-sourced command arrived without provenance (invariant I5).
  missingProvenance('missing_provenance', 'Missing Provenance');

  const CommandRejectionReason(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static CommandRejectionReason fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown CommandRejectionReason',
      ),
    );
  }
}

/// Outcome of submitting a command to the Document Engine.
@freezed
sealed class CommandResult with _$CommandResult {
  /// The command passed Lock → Validation → History → Document and is now
  /// part of the document at [revision].
  const factory CommandResult.applied({
    required int revision,
    @Default(<String>[]) List<String> affectedIds,
  }) = CommandApplied;

  /// The command was refused; the document is untouched.
  const factory CommandResult.rejected({
    required CommandRejectionReason reason,

    /// The lock that blocked it, when [reason] is `locked`.
    LockState? blockedBy,

    /// Human-readable detail for UI/telemetry.
    String? detail,
  }) = CommandRejected;

  factory CommandResult.fromJson(Map<String, Object?> json) =>
      _$CommandResultFromJson(json);

  const CommandResult._();

  bool get wasApplied => this is CommandApplied;
}
