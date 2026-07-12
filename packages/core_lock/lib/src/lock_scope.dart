/// The sixteen frozen lock scopes of the FEBRIC OS (ADR-0005).
///
/// Locks are constitutional (invariant I4): a locked scope rejects every
/// mutation — human, tool, plugin or AI — and lock checks run *before*
/// compute is spent. Every future engine consults the Lock Engine; nothing
/// bypasses it.
enum LockScope {
  /// The whole project: implies every other scope.
  project('project', 'Project Lock'),

  /// One document/artwork: implies all content-level scopes within it.
  document('document', 'Document Lock'),

  /// A compositing layer (and, by implication, its objects and masks).
  layer('layer', 'Layer Lock'),

  /// A single object/element.
  object('object', 'Object Lock'),

  /// The current selection set (prevents selection changes).
  selection('selection', 'Selection Lock'),

  /// Reference material (never editable, only viewable).
  reference('reference', 'Reference Lock'),

  /// A mask or mask stack.
  mask('mask', 'Mask Lock'),

  /// A tool (disabled in the workspace, e.g. by policy or plugin).
  tool('tool', 'Tool Lock'),

  /// The viewport camera (prevents zoom/pan/rotate — presentations,
  /// review sessions).
  viewport('viewport', 'Viewport Lock'),

  /// The history timeline (no new entries may be written).
  history('history', 'History Lock'),

  /// Undo/redo traversal (history may grow but not be rewound).
  undo('undo', 'Undo Lock'),

  /// All AI operations on the target.
  ai('ai', 'AI Lock'),

  /// Export of the target in any format.
  export('export', 'Export Lock'),

  /// Production processing (preflight, colour conversion, packaging).
  production('production', 'Production Lock'),

  /// Review workflow state (annotations frozen).
  review('review', 'Review Lock'),

  /// Approval state (an approved target is immutable until unapproved).
  approval('approval', 'Approval Lock');

  const LockScope(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// The scopes a lock on this scope *also* locks (transitive closure is
  /// computed by `LockSet`). Frozen hierarchy:
  /// project ⇒ document ⇒ {layer, selection, mask, history, ai, export} and
  /// layer ⇒ object; undo rides with history; production/review/approval
  /// are workflow scopes implied only by project.
  Set<LockScope> get directlyImplies {
    return switch (this) {
      project => const {document, tool, viewport, production, review, approval},
      document => const {
        layer,
        selection,
        reference,
        mask,
        history,
        ai,
        export,
      },
      layer => const {object},
      history => const {undo},
      approval => const {document},
      _ => const <LockScope>{},
    };
  }

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static LockScope fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown LockScope wire name',
      ),
    );
  }
}

/// Who placed a lock — affects who may release it.
enum LockOrigin {
  /// Explicitly placed by the designer.
  user('user', 'User'),

  /// Placed by the system (e.g. during export or AI execution).
  system('system', 'System'),

  /// Imposed by workspace/enterprise policy.
  policy('policy', 'Policy'),

  /// Result of the review/approval workflow.
  review('review', 'Review');

  const LockOrigin(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static LockOrigin fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown LockOrigin wire name',
      ),
    );
  }
}
