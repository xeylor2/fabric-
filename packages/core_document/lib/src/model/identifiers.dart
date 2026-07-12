import 'package:freezed_annotation/freezed_annotation.dart';

part 'identifiers.freezed.dart';

/// Typed identifiers of the Document Engine (ADR-0014). They serialize as
/// bare strings/ints so `.febric` files stay lean; the types exist so ids
/// can never be swapped accidentally in code.
@Freezed(fromJson: false, toJson: false)
abstract class ProjectId with _$ProjectId {
  const factory ProjectId(String value) = _ProjectId;

  factory ProjectId.fromJson(String json) => ProjectId(json);

  const ProjectId._();

  String toJson() => value;
}

/// Unique id of one FEBRIC document.
@Freezed(fromJson: false, toJson: false)
abstract class DocumentId with _$DocumentId {
  const factory DocumentId(String value) = _DocumentId;

  factory DocumentId.fromJson(String json) => DocumentId(json);

  const DocumentId._();

  String toJson() => value;
}

/// Monotonic revision counter of a document: every applied command
/// increments it; history entries and AI provenance reference it.
@Freezed(fromJson: false, toJson: false)
abstract class RevisionId with _$RevisionId {
  const factory RevisionId(int value) = _RevisionId;

  factory RevisionId.fromJson(int json) => RevisionId(json);

  const RevisionId._();

  /// The revision of a freshly created, never-edited document.
  static const RevisionId initial = RevisionId(0);

  int toJson() => value;

  RevisionId get next => RevisionId(value + 1);
}
