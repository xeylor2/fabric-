// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DocumentMetadata _$DocumentMetadataFromJson(Map<String, dynamic> json) =>
    _DocumentMetadata(
      title: json['title'] as String,
      description: json['description'] as String?,
      author: json['author'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      modifiedAt: DateTime.parse(json['modifiedAt'] as String),
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const <String>[],
    );

Map<String, dynamic> _$DocumentMetadataToJson(_DocumentMetadata instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'author': instance.author,
      'createdAt': instance.createdAt.toIso8601String(),
      'modifiedAt': instance.modifiedAt.toIso8601String(),
      'tags': instance.tags,
    };

_DocumentVersion _$DocumentVersionFromJson(Map<String, dynamic> json) =>
    _DocumentVersion(
      schema: (json['schema'] as num).toInt(),
      generator: json['generator'] as String,
    );

Map<String, dynamic> _$DocumentVersionToJson(_DocumentVersion instance) =>
    <String, dynamic>{
      'schema': instance.schema,
      'generator': instance.generator,
    };

_DocumentManifest _$DocumentManifestFromJson(Map<String, dynamic> json) =>
    _DocumentManifest(
      format: json['format'] as String? ?? DocumentManifest.formatName,
      version: DocumentVersion.fromJson(
        json['version'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$DocumentManifestToJson(_DocumentManifest instance) =>
    <String, dynamic>{
      'format': instance.format,
      'version': instance.version.toJson(),
    };

_DocumentSettings _$DocumentSettingsFromJson(Map<String, dynamic> json) =>
    _DocumentSettings(
      defaultUnit: json['defaultUnit'] == null
          ? MeasurementUnit.millimetre
          : _unitFromJson(json['defaultUnit'] as String),
      defaultDpi: (json['defaultDpi'] as num?)?.toDouble() ?? 300.0,
      autosaveIntervalSeconds:
          (json['autosaveIntervalSeconds'] as num?)?.toInt() ?? 120,
      maxHistoryEntries: (json['maxHistoryEntries'] as num?)?.toInt() ?? 200,
      activeColourProfileId: json['activeColourProfileId'] as String?,
    );

Map<String, dynamic> _$DocumentSettingsToJson(_DocumentSettings instance) =>
    <String, dynamic>{
      'defaultUnit': _unitToJson(instance.defaultUnit),
      'defaultDpi': instance.defaultDpi,
      'autosaveIntervalSeconds': instance.autosaveIntervalSeconds,
      'maxHistoryEntries': instance.maxHistoryEntries,
      'activeColourProfileId': instance.activeColourProfileId,
    };

_DocumentPreferences _$DocumentPreferencesFromJson(Map<String, dynamic> json) =>
    _DocumentPreferences(
      values:
          json['values'] as Map<String, dynamic>? ?? const <String, Object?>{},
    );

Map<String, dynamic> _$DocumentPreferencesToJson(
  _DocumentPreferences instance,
) => <String, dynamic>{'values': instance.values};

_DocumentStatistics _$DocumentStatisticsFromJson(Map<String, dynamic> json) =>
    _DocumentStatistics(
      artboards: (json['artboards'] as num).toInt(),
      layers: (json['layers'] as num).toInt(),
      designNodes: (json['designNodes'] as num).toInt(),
      assets: (json['assets'] as num).toInt(),
      historyEntries: (json['historyEntries'] as num).toInt(),
      aiProvenanceRecords: (json['aiProvenanceRecords'] as num).toInt(),
      revision: (json['revision'] as num).toInt(),
    );

Map<String, dynamic> _$DocumentStatisticsToJson(_DocumentStatistics instance) =>
    <String, dynamic>{
      'artboards': instance.artboards,
      'layers': instance.layers,
      'designNodes': instance.designNodes,
      'assets': instance.assets,
      'historyEntries': instance.historyEntries,
      'aiProvenanceRecords': instance.aiProvenanceRecords,
      'revision': instance.revision,
    };
