/// Runtime lifecycle states of an open document (frozen, ADR-0014).
///
/// `dirty` and `modified` are distinct by mandate: `modified` means the
/// content changed this session; `dirty` means unsaved changes exist
/// (a document can be `modified` yet not `dirty` right after undo back to
/// the saved revision — the engine derives both from revisions).
enum DocumentStatus {
  clean('clean', 'Clean'),
  dirty('dirty', 'Dirty'),
  modified('modified', 'Modified'),
  saving('saving', 'Saving'),
  loading('loading', 'Loading'),
  recovered('recovered', 'Recovered'),
  readOnly('read_only', 'Read Only'),
  locked('locked', 'Locked'),
  archived('archived', 'Archived');

  const DocumentStatus(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// States in which mutation commands are refused outright.
  bool get rejectsMutations =>
      this == readOnly || this == locked || this == archived || this == loading;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static DocumentStatus fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown DocumentStatus wire name',
      ),
    );
  }
}
