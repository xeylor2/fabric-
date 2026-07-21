import 'package:freezed_annotation/freezed_annotation.dart';

part 'symmetry_link.freezed.dart';
part 'symmetry_link.g.dart';

/// A symmetry link between part instances (§3: "left/right parts share
/// content by default; breakable/re-linkable") — a **data relation**
/// only (the approved Q4 ruling): breaking/re-linking is a state change
/// by later tools; no mirroring logic lives in this slice.
@freezed
abstract class SymmetryLink with _$SymmetryLink {
  const factory SymmetryLink({
    /// The symmetry group this link realises.
    required String group,

    /// The linked instance qualifiers (e.g. `left`, `right`).
    @Default(<String>[]) List<String> instances,

    /// Whether content is currently shared (default per §3).
    @Default(true) bool linked,
  }) = _SymmetryLink;

  factory SymmetryLink.fromJson(Map<String, Object?> json) =>
      _$SymmetryLinkFromJson(json);
}
