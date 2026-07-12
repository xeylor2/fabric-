import 'package:freezed_annotation/freezed_annotation.dart';

part 'key_modifiers.freezed.dart';
part 'key_modifiers.g.dart';

/// Immutable keyboard modifier snapshot accompanying pointer events.
///
/// Platform note: `meta` is Cmd on macOS/iPadOS and Win on Windows; the
/// interaction policy treats `control` and `meta` as equivalent so shortcuts
/// behave identically across platforms (ADR-0003).
@freezed
abstract class KeyModifiers with _$KeyModifiers {
  const factory KeyModifiers({
    @Default(false) bool control,
    @Default(false) bool shift,
    @Default(false) bool alt,
    @Default(false) bool meta,
  }) = _KeyModifiers;

  factory KeyModifiers.fromJson(Map<String, Object?> json) =>
      _$KeyModifiersFromJson(json);

  const KeyModifiers._();

  static const KeyModifiers none = KeyModifiers();

  /// Control or Meta — the cross-platform "primary" modifier.
  bool get primary => control || meta;

  bool get hasAny => control || shift || alt || meta;
}
