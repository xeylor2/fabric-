import 'package:core_canvas/core_canvas.dart';
import 'package:core_interaction/core_interaction.dart';

/// The **Selection Runtime**: the stateful wiring that connects the frozen
/// M6 Interaction Runtime's hit results to the frozen selection engine.
///
/// This runtime introduces **no new selection semantics**. It is a thin
/// stateful shell that:
/// - holds the live [SelectionState] (the frozen id-based interaction-level
///   selection, `core_interaction` / ADR-0003);
/// - consumes the [HitTestResult] the [InteractionSession] surfaces via its
///   `lastHit` (M6 / ADR-0018 — the Hit Test Entry output);
/// - applies the **frozen** [SelectionState] operations, choosing the
///   combine mode with the **frozen** universal policy
///   [SelectionMode.forModifiers] (ADR-0003);
/// - exposes the current [SelectionState] to downstream runtimes.
///
/// Every model, vocabulary and operation it touches is frozen and reused
/// exactly: [SelectionState], [SelectionMode], [KeyModifiers], [HitTestResult].
/// The runtime defines none of them and adds no selection logic of its own —
/// all mutation flows through the frozen `SelectionState.select` / `selectAll`
/// / `cleared` (invariant I1: state changes only by feeding events in).
final class SelectionRuntime {
  /// Creates a runtime seeded with an optional starting [selection]
  /// (empty by default).
  SelectionRuntime({SelectionState selection = SelectionState.empty})
    : _selection = selection; // ignore: prefer_initializing_formals

  SelectionState _selection;

  /// The current selection, for downstream runtimes to read.
  SelectionState get selection => _selection;

  /// Whether anything is selected (delegates to the frozen state).
  bool get isEmpty => _selection.isEmpty;

  /// Applies a hit from the M6 Interaction Runtime (an `InteractionSession`
  /// `lastHit`) to the selection.
  ///
  /// A **node hit** selects its `semanticNodeId` using the combine mode the
  /// frozen [SelectionMode.forModifiers] derives from [modifiers] (primary →
  /// toggle, shift → add, otherwise replace). A **miss** with no modifier
  /// clears the selection (a plain click on empty canvas), while a miss with a
  /// held modifier leaves the selection unchanged (additive gesture on empty
  /// space is a no-op). Returns the resulting [SelectionState].
  SelectionState applyHit(
    HitTestResult hit, {
    KeyModifiers modifiers = KeyModifiers.none,
  }) {
    if (hit.isNodeHit) {
      // isNodeHit guarantees semanticNodeId != null (frozen invariant).
      _selection = _selection.select(
        hit.semanticNodeId!,
        mode: SelectionMode.forModifiers(modifiers),
      );
      return _selection;
    }
    if (!modifiers.hasAny) {
      _selection = _selection.cleared();
    }
    return _selection;
  }

  /// Selects [ids] outright, reusing the frozen `SelectionState.selectAll`
  /// (replaces the current selection).
  SelectionState selectAll(Iterable<String> ids) {
    _selection = _selection.selectAll(ids);
    return _selection;
  }

  /// Clears the selection, reusing the frozen `SelectionState.cleared`.
  SelectionState clear() {
    _selection = _selection.cleared();
    return _selection;
  }
}
