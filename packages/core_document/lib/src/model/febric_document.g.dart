// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'febric_document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FebricDocument _$FebricDocumentFromJson(
  Map<String, dynamic> json,
) => _FebricDocument(
  id: DocumentId.fromJson(json['id'] as String),
  projectId: ProjectId.fromJson(json['projectId'] as String),
  revision: json['revision'] == null
      ? RevisionId.initial
      : RevisionId.fromJson((json['revision'] as num).toInt()),
  manifest: DocumentManifest.fromJson(json['manifest'] as Map<String, dynamic>),
  metadata: DocumentMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
  settings: json['settings'] == null
      ? const DocumentSettings()
      : DocumentSettings.fromJson(json['settings'] as Map<String, dynamic>),
  preferences: json['preferences'] == null
      ? const DocumentPreferences()
      : DocumentPreferences.fromJson(
          json['preferences'] as Map<String, dynamic>,
        ),
  artboards:
      (json['artboards'] as List<dynamic>?)
          ?.map((e) => Artboard.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <Artboard>[],
  assets: json['assets'] == null
      ? AssetRegistry.empty
      : AssetRegistry.fromJson(json['assets'] as Map<String, dynamic>),
  masks:
      (json['masks'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, MaskStack.fromJson(e as Map<String, dynamic>)),
      ) ??
      const <String, MaskStack>{},
  locks: json['locks'] == null
      ? LockSet.none
      : LockSet.fromJson(json['locks'] as Map<String, dynamic>),
  toolStates:
      (json['toolStates'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, ToolStateExtension.fromJson(e as Map<String, dynamic>)),
      ) ??
      const <String, ToolStateExtension>{},
  viewports:
      (json['viewports'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
          k,
          WorkspaceViewportState.fromJson(e as Map<String, dynamic>),
        ),
      ) ??
      const <String, WorkspaceViewportState>{},
  history: json['history'] == null
      ? DocumentHistory.empty
      : DocumentHistory.fromJson(json['history'] as Map<String, dynamic>),
  aiProvenance:
      (json['aiProvenance'] as List<dynamic>?)
          ?.map((e) => AiProvenanceRecord.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <AiProvenanceRecord>[],
  pluginData:
      (json['pluginData'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as Map<String, dynamic>),
      ) ??
      const <String, Map<String, Object?>>{},
  exportProfiles:
      (json['exportProfiles'] as List<dynamic>?)
          ?.map((e) => ExportProfile.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ExportProfile>[],
  productionProfiles:
      (json['productionProfiles'] as List<dynamic>?)
          ?.map((e) => ProductionProfile.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ProductionProfile>[],
  measurementProfiles:
      (json['measurementProfiles'] as List<dynamic>?)
          ?.map((e) => MeasurementProfile.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <MeasurementProfile>[],
  colourProfiles:
      (json['colourProfiles'] as List<dynamic>?)
          ?.map((e) => ColourProfile.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ColourProfile>[],
  printProfiles:
      (json['printProfiles'] as List<dynamic>?)
          ?.map((e) => PrintProfile.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <PrintProfile>[],
);

Map<String, dynamic> _$FebricDocumentToJson(_FebricDocument instance) =>
    <String, dynamic>{
      'id': instance.id.toJson(),
      'projectId': instance.projectId.toJson(),
      'revision': instance.revision.toJson(),
      'manifest': instance.manifest.toJson(),
      'metadata': instance.metadata.toJson(),
      'settings': instance.settings.toJson(),
      'preferences': instance.preferences.toJson(),
      'artboards': instance.artboards.map((e) => e.toJson()).toList(),
      'assets': instance.assets.toJson(),
      'masks': instance.masks.map((k, e) => MapEntry(k, e.toJson())),
      'locks': instance.locks.toJson(),
      'toolStates': instance.toolStates.map((k, e) => MapEntry(k, e.toJson())),
      'viewports': instance.viewports.map((k, e) => MapEntry(k, e.toJson())),
      'history': instance.history.toJson(),
      'aiProvenance': instance.aiProvenance.map((e) => e.toJson()).toList(),
      'pluginData': instance.pluginData,
      'exportProfiles': instance.exportProfiles.map((e) => e.toJson()).toList(),
      'productionProfiles': instance.productionProfiles
          .map((e) => e.toJson())
          .toList(),
      'measurementProfiles': instance.measurementProfiles
          .map((e) => e.toJson())
          .toList(),
      'colourProfiles': instance.colourProfiles.map((e) => e.toJson()).toList(),
      'printProfiles': instance.printProfiles.map((e) => e.toJson()).toList(),
    };
