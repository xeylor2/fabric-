import 'package:core_interaction/src/viewport/viewport_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation_state.freezed.dart';
part 'navigation_state.g.dart';

/// View navigation state: the live camera plus a bounded history of
/// previous views, so every surface offers "previous view" navigation
/// (e.g. after Zoom to Selection) with identical semantics.
@freezed
abstract class NavigationState with _$NavigationState {
  const factory NavigationState({
    required ViewportState viewport,
    @Default(<ViewportState>[]) List<ViewportState> history,
    @Default(32) int maxHistory,
  }) = _NavigationState;

  factory NavigationState.fromJson(Map<String, Object?> json) =>
      _$NavigationStateFromJson(json);

  const NavigationState._();

  /// Whether a previous view exists.
  bool get canGoBack => history.isNotEmpty;

  /// Moves to [next], remembering the current view (history is bounded by
  /// [maxHistory], oldest entries dropped first).
  NavigationState pushViewport(ViewportState next) {
    final entries = [...history, viewport];
    return copyWith(
      viewport: next,
      history: entries.length > maxHistory
          ? entries.sublist(entries.length - maxHistory)
          : entries,
    );
  }

  /// Returns to the most recent previous view; no-op when history is empty.
  NavigationState back() {
    if (history.isEmpty) {
      return this;
    }
    return copyWith(
      viewport: history.last,
      history: history.sublist(0, history.length - 1),
    );
  }
}
