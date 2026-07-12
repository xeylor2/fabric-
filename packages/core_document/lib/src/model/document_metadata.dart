import 'package:core_geometry/core_geometry.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'document_metadata.freezed.dart';
part 'document_metadata.g.dart';

/// Human-facing document metadata.
@freezed
abstract class DocumentMetadata with _$DocumentMetadata {
  const factory DocumentMetadata({
    required String title,
    String? description,
    String? author,
    required DateTime createdAt,
    required DateTime modifiedAt,
    @Default(<String>[]) List<String> tags,
  }) = _DocumentMetadata;

  factory DocumentMetadata.fromJson(Map<String, Object?> json) =>
      _$DocumentMetadataFromJson(json);
}

/// Schema version of the `.febric` format (migration-ready; ADR-0014).
@freezed
abstract class DocumentVersion with _$DocumentVersion {
  const factory DocumentVersion({
    /// Monotonic `.febric` schema version; migrations step through it.
    required int schema,

    /// FEBRIC application version that last wrote the document.
    required String generator,
  }) = _DocumentVersion;

  factory DocumentVersion.fromJson(Map<String, Object?> json) =>
      _$DocumentVersionFromJson(json);

  const DocumentVersion._();

  /// The schema this engine reads and writes.
  static const int currentSchema = 1;

  /// Oldest schema this engine can read without migration.
  static const int minReadableSchema = 1;
}

/// Format identity written at the head of every `.febric` file.
@freezed
abstract class DocumentManifest with _$DocumentManifest {
  const factory DocumentManifest({
    /// Frozen format name.
    @Default(DocumentManifest.formatName) String format,
    required DocumentVersion version,
  }) = _DocumentManifest;

  factory DocumentManifest.fromJson(Map<String, Object?> json) =>
      _$DocumentManifestFromJson(json);

  const DocumentManifest._();

  /// The frozen format identifier (`.febric`).
  static const String formatName = 'febric';
}

/// Engine-level document settings.
@freezed
abstract class DocumentSettings with _$DocumentSettings {
  const factory DocumentSettings({
    @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson)
    @Default(MeasurementUnit.millimetre)
    MeasurementUnit defaultUnit,
    @Default(300.0) double defaultDpi,
    @Default(120) int autosaveIntervalSeconds,
    @Default(200) int maxHistoryEntries,
    String? activeColourProfileId,
  }) = _DocumentSettings;

  factory DocumentSettings.fromJson(Map<String, Object?> json) =>
      _$DocumentSettingsFromJson(json);
}

/// Free-form, user-scoped preferences (never engine semantics).
@freezed
abstract class DocumentPreferences with _$DocumentPreferences {
  const factory DocumentPreferences({
    @Default(<String, Object?>{}) Map<String, Object?> values,
  }) = _DocumentPreferences;

  factory DocumentPreferences.fromJson(Map<String, Object?> json) =>
      _$DocumentPreferencesFromJson(json);
}

/// Derived document statistics — computed, never stored, so it can never
/// disagree with the content (single source of truth).
@freezed
abstract class DocumentStatistics with _$DocumentStatistics {
  const factory DocumentStatistics({
    required int artboards,
    required int layers,
    required int designNodes,
    required int assets,
    required int historyEntries,
    required int aiProvenanceRecords,
    required RevisionIdValue revision,
  }) = _DocumentStatistics;

  factory DocumentStatistics.fromJson(Map<String, Object?> json) =>
      _$DocumentStatisticsFromJson(json);
}

/// Bare revision value used inside computed statistics.
typedef RevisionIdValue = int;

MeasurementUnit _unitFromJson(String wireName) =>
    MeasurementUnit.fromWireName(wireName);

String _unitToJson(MeasurementUnit unit) => unit.wireName;
