import 'package:core_interaction/src/gestures/key_modifiers.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'selection_state.freezed.dart';
part 'selection_state.g.dart';

/// How a select action combines with the existing selection.
enum SelectionMode {
  /// Replace the selection with the target.
  replace('replace', 'Replace'),

  /// Add the target to the selection.
  add('add', 'Add'),

  /// Toggle the target's membership.
  toggle('toggle', 'Toggle');

  const SelectionMode(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Universal modifier policy (identical on every platform, ADR-0003):
  /// primary modifier (Ctrl/Cmd) toggles, Shift adds, otherwise replace.
  static SelectionMode forModifiers(KeyModifiers modifiers) {
    if (modifiers.primary) {
      return toggle;
    }
    if (modifiers.shift) {
      return add;
    }
    return replace;
  }

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static SelectionMode fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown SelectionMode wire name',
      ),
    );
  }
}

/// Immutable selection of node/object ids, shared by every editing surface.
///
/// Ids reference `DesignNode.id` (or any addressable object). All mutations
/// return new states.
@freezed
abstract class SelectionState with _$SelectionState {
  const factory SelectionState({@Default(<String>{}) Set<String> selectedIds}) =
      _SelectionState;

  factory SelectionState.fromJson(Map<String, Object?> json) =>
      _$SelectionStateFromJson(json);

  const SelectionState._();

  static const SelectionState empty = SelectionState();

  bool get isEmpty => selectedIds.isEmpty;
  bool get isNotEmpty => selectedIds.isNotEmpty;
  int get count => selectedIds.length;

  bool isSelected(String id) => selectedIds.contains(id);

  /// Applies a select action on [id] with [mode].
  SelectionState select(
    String id, {
    SelectionMode mode = SelectionMode.replace,
  }) {
    switch (mode) {
      case SelectionMode.replace:
        return SelectionState(selectedIds: {id});
      case SelectionMode.add:
        return SelectionState(selectedIds: {...selectedIds, id});
      case SelectionMode.toggle:
        return isSelected(id)
            ? SelectionState(selectedIds: {...selectedIds}..remove(id))
            : SelectionState(selectedIds: {...selectedIds, id});
    }
  }

  /// Selects [ids] (replacing the current selection).
  SelectionState selectAll(Iterable<String> ids) =>
      SelectionState(selectedIds: {...ids});

  /// Clears the selection.
  SelectionState cleared() => SelectionState.empty;
}
