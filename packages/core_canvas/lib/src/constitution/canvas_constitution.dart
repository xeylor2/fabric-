/// The Canvas Constitution (M5A, ADR-0018) — permanent, testable rules
/// governing what the Canvas Runtime may and may not own.
///
/// The Canvas is **not** a source of truth. The Document owns data, the
/// Semantic Design Tree owns meaning, the Asset Engine owns resources; the
/// Canvas only *visualises references* to them. Nothing bypasses the Canvas
/// Runtime for on-surface input, and no actor edits the canvas directly.
///
/// This file freezes those rules as data so a test can enforce them.
library;

/// The responsibilities the Canvas Runtime must **never** own. Each is owned
/// by another engine; the canvas holds only references (ids) to them.
///
/// Wire names are frozen (append-only) and pinned by
/// `canvas_constitution_freeze_test.dart`.
enum CanvasNeverOwns {
  /// Owned by `core_document` (M2).
  document('document', 'Document'),

  /// Owned by `core_asset` (M4).
  assets('assets', 'Assets'),

  /// Owned by `core_layer` / the document artboard tree.
  layers('layers', 'Layers'),

  /// Owned by the document history/command journal (M2).
  history('history', 'History'),

  /// Owned by `core_selection` / `core_interaction` (selection is *routed*
  /// through the canvas, never *stored* as truth by it).
  selection('selection', 'Selection'),

  /// Owned by the Design Tree / Repeat engine — pattern data is a document
  /// concern, never canvas state.
  patterns('patterns', 'Patterns'),

  /// Owned by the Design Tree — motif content is a document concern.
  motifs('motifs', 'Motifs'),

  /// Owned by `core_ai` — AI never edits the canvas directly.
  ai('ai', 'AI'),

  /// Owned by `core_plugin` — plugins reach engines through the host, never
  /// through canvas state.
  plugins('plugins', 'Plugins');

  const CanvasNeverOwns(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static CanvasNeverOwns fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown CanvasNeverOwns wire name',
      ),
    );
  }
}

/// The frozen constitutional principles of the Canvas Runtime.
///
/// This is a pure, const, dependency-free statement of architecture — no
/// rendering, no Flutter, no business logic. Engines and tools consult it;
/// the freeze test pins it.
final class CanvasConstitution {
  const CanvasConstitution._();

  /// The Canvas Runtime holds visual runtime state only, and always defers
  /// data/semantics/resources to their owning engines.
  static const bool ownsOnlyVisualRuntimeState = true;

  /// The Canvas renders *references* (ids), never the referenced data.
  static const bool rendersReferencesOnly = true;

  /// All on-surface user input flows through the one Canvas Runtime input
  /// pipeline; no tool implements its own input handling.
  static const bool singleInputPipeline = true;

  /// There is exactly one shared viewport; every tool uses it.
  static const bool singleSharedViewport = true;

  /// AI never edits the canvas directly; it stages proposals onto the
  /// command bus (invariant I2), which the canvas later visualises.
  static const bool aiNeverEditsCanvasDirectly = true;

  /// The frozen articles of the constitution, in order. Pinned by test.
  static const List<String> principles = <String>[
    'The Canvas is not the source of truth.',
    'The Document owns data.',
    'The Semantic Tree owns semantics.',
    'The Asset Engine owns resources.',
    'The Canvas visualises references only.',
    'Tools interact through the Canvas Runtime.',
    'AI never edits the Canvas directly.',
    'Nothing bypasses the Canvas Runtime.',
  ];

  /// Everything the canvas must never own (see [CanvasNeverOwns]).
  static const List<CanvasNeverOwns> forbiddenOwnership =
      CanvasNeverOwns.values;

  /// Whether [responsibility] is forbidden to the canvas. Always true — the
  /// enum enumerates exactly the forbidden set; the method exists so callers
  /// read as intent, not membership checks.
  static bool forbidsOwnershipOf(CanvasNeverOwns responsibility) => true;
}
