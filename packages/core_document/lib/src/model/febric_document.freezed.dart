// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'febric_document.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FebricDocument {

 DocumentId get id; ProjectId get projectId;/// Monotonic revision (increments per applied command).
 RevisionId get revision; DocumentManifest get manifest; DocumentMetadata get metadata; DocumentSettings get settings; DocumentPreferences get preferences;/// Content: any number of artboards, each owning its layer tree and
/// design tree.
 List<Artboard> get artboards;/// Central asset registry.
 AssetRegistry get assets;/// Mask registry: target id (layer/node) → mask stack.
 Map<String, MaskStack> get masks;/// Lock registry (frozen Lock Engine, ADR-0005).
 LockSet get locks;/// Tool-state registry: tool/plugin id → typed envelope
/// (frozen rules 3 and 6 — the schema never changes per tool).
 Map<String, ToolStateExtension> get toolStates;/// Per-workspace persisted viewports.
 Map<String, WorkspaceViewportState> get viewports;/// The command journal (undo/redo stacks derive from its cursor).
 DocumentHistory get history;/// AI provenance ledger (invariant I5).
 List<AiProvenanceRecord> get aiProvenance;/// Plugin-isolated extension storage:
/// namespace → (entry kind → payload). Plugins never touch core schema.
 Map<String, Map<String, Object?>> get pluginData; List<ExportProfile> get exportProfiles; List<ProductionProfile> get productionProfiles; List<MeasurementProfile> get measurementProfiles; List<ColourProfile> get colourProfiles; List<PrintProfile> get printProfiles;
/// Create a copy of FebricDocument
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FebricDocumentCopyWith<FebricDocument> get copyWith => _$FebricDocumentCopyWithImpl<FebricDocument>(this as FebricDocument, _$identity);

  /// Serializes this FebricDocument to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FebricDocument&&(identical(other.id, id) || other.id == id)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.revision, revision) || other.revision == revision)&&(identical(other.manifest, manifest) || other.manifest == manifest)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.settings, settings) || other.settings == settings)&&(identical(other.preferences, preferences) || other.preferences == preferences)&&const DeepCollectionEquality().equals(other.artboards, artboards)&&(identical(other.assets, assets) || other.assets == assets)&&const DeepCollectionEquality().equals(other.masks, masks)&&(identical(other.locks, locks) || other.locks == locks)&&const DeepCollectionEquality().equals(other.toolStates, toolStates)&&const DeepCollectionEquality().equals(other.viewports, viewports)&&(identical(other.history, history) || other.history == history)&&const DeepCollectionEquality().equals(other.aiProvenance, aiProvenance)&&const DeepCollectionEquality().equals(other.pluginData, pluginData)&&const DeepCollectionEquality().equals(other.exportProfiles, exportProfiles)&&const DeepCollectionEquality().equals(other.productionProfiles, productionProfiles)&&const DeepCollectionEquality().equals(other.measurementProfiles, measurementProfiles)&&const DeepCollectionEquality().equals(other.colourProfiles, colourProfiles)&&const DeepCollectionEquality().equals(other.printProfiles, printProfiles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,projectId,revision,manifest,metadata,settings,preferences,const DeepCollectionEquality().hash(artboards),assets,const DeepCollectionEquality().hash(masks),locks,const DeepCollectionEquality().hash(toolStates),const DeepCollectionEquality().hash(viewports),history,const DeepCollectionEquality().hash(aiProvenance),const DeepCollectionEquality().hash(pluginData),const DeepCollectionEquality().hash(exportProfiles),const DeepCollectionEquality().hash(productionProfiles),const DeepCollectionEquality().hash(measurementProfiles),const DeepCollectionEquality().hash(colourProfiles),const DeepCollectionEquality().hash(printProfiles)]);

@override
String toString() {
  return 'FebricDocument(id: $id, projectId: $projectId, revision: $revision, manifest: $manifest, metadata: $metadata, settings: $settings, preferences: $preferences, artboards: $artboards, assets: $assets, masks: $masks, locks: $locks, toolStates: $toolStates, viewports: $viewports, history: $history, aiProvenance: $aiProvenance, pluginData: $pluginData, exportProfiles: $exportProfiles, productionProfiles: $productionProfiles, measurementProfiles: $measurementProfiles, colourProfiles: $colourProfiles, printProfiles: $printProfiles)';
}


}

/// @nodoc
abstract mixin class $FebricDocumentCopyWith<$Res>  {
  factory $FebricDocumentCopyWith(FebricDocument value, $Res Function(FebricDocument) _then) = _$FebricDocumentCopyWithImpl;
@useResult
$Res call({
 DocumentId id, ProjectId projectId, RevisionId revision, DocumentManifest manifest, DocumentMetadata metadata, DocumentSettings settings, DocumentPreferences preferences, List<Artboard> artboards, AssetRegistry assets, Map<String, MaskStack> masks, LockSet locks, Map<String, ToolStateExtension> toolStates, Map<String, WorkspaceViewportState> viewports, DocumentHistory history, List<AiProvenanceRecord> aiProvenance, Map<String, Map<String, Object?>> pluginData, List<ExportProfile> exportProfiles, List<ProductionProfile> productionProfiles, List<MeasurementProfile> measurementProfiles, List<ColourProfile> colourProfiles, List<PrintProfile> printProfiles
});


$DocumentIdCopyWith<$Res> get id;$ProjectIdCopyWith<$Res> get projectId;$RevisionIdCopyWith<$Res> get revision;$DocumentManifestCopyWith<$Res> get manifest;$DocumentMetadataCopyWith<$Res> get metadata;$DocumentSettingsCopyWith<$Res> get settings;$DocumentPreferencesCopyWith<$Res> get preferences;$AssetRegistryCopyWith<$Res> get assets;$LockSetCopyWith<$Res> get locks;$DocumentHistoryCopyWith<$Res> get history;

}
/// @nodoc
class _$FebricDocumentCopyWithImpl<$Res>
    implements $FebricDocumentCopyWith<$Res> {
  _$FebricDocumentCopyWithImpl(this._self, this._then);

  final FebricDocument _self;
  final $Res Function(FebricDocument) _then;

/// Create a copy of FebricDocument
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? projectId = null,Object? revision = null,Object? manifest = null,Object? metadata = null,Object? settings = null,Object? preferences = null,Object? artboards = null,Object? assets = null,Object? masks = null,Object? locks = null,Object? toolStates = null,Object? viewports = null,Object? history = null,Object? aiProvenance = null,Object? pluginData = null,Object? exportProfiles = null,Object? productionProfiles = null,Object? measurementProfiles = null,Object? colourProfiles = null,Object? printProfiles = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as DocumentId,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as ProjectId,revision: null == revision ? _self.revision : revision // ignore: cast_nullable_to_non_nullable
as RevisionId,manifest: null == manifest ? _self.manifest : manifest // ignore: cast_nullable_to_non_nullable
as DocumentManifest,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as DocumentMetadata,settings: null == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as DocumentSettings,preferences: null == preferences ? _self.preferences : preferences // ignore: cast_nullable_to_non_nullable
as DocumentPreferences,artboards: null == artboards ? _self.artboards : artboards // ignore: cast_nullable_to_non_nullable
as List<Artboard>,assets: null == assets ? _self.assets : assets // ignore: cast_nullable_to_non_nullable
as AssetRegistry,masks: null == masks ? _self.masks : masks // ignore: cast_nullable_to_non_nullable
as Map<String, MaskStack>,locks: null == locks ? _self.locks : locks // ignore: cast_nullable_to_non_nullable
as LockSet,toolStates: null == toolStates ? _self.toolStates : toolStates // ignore: cast_nullable_to_non_nullable
as Map<String, ToolStateExtension>,viewports: null == viewports ? _self.viewports : viewports // ignore: cast_nullable_to_non_nullable
as Map<String, WorkspaceViewportState>,history: null == history ? _self.history : history // ignore: cast_nullable_to_non_nullable
as DocumentHistory,aiProvenance: null == aiProvenance ? _self.aiProvenance : aiProvenance // ignore: cast_nullable_to_non_nullable
as List<AiProvenanceRecord>,pluginData: null == pluginData ? _self.pluginData : pluginData // ignore: cast_nullable_to_non_nullable
as Map<String, Map<String, Object?>>,exportProfiles: null == exportProfiles ? _self.exportProfiles : exportProfiles // ignore: cast_nullable_to_non_nullable
as List<ExportProfile>,productionProfiles: null == productionProfiles ? _self.productionProfiles : productionProfiles // ignore: cast_nullable_to_non_nullable
as List<ProductionProfile>,measurementProfiles: null == measurementProfiles ? _self.measurementProfiles : measurementProfiles // ignore: cast_nullable_to_non_nullable
as List<MeasurementProfile>,colourProfiles: null == colourProfiles ? _self.colourProfiles : colourProfiles // ignore: cast_nullable_to_non_nullable
as List<ColourProfile>,printProfiles: null == printProfiles ? _self.printProfiles : printProfiles // ignore: cast_nullable_to_non_nullable
as List<PrintProfile>,
  ));
}
/// Create a copy of FebricDocument
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentIdCopyWith<$Res> get id {
  
  return $DocumentIdCopyWith<$Res>(_self.id, (value) {
    return _then(_self.copyWith(id: value));
  });
}/// Create a copy of FebricDocument
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectIdCopyWith<$Res> get projectId {
  
  return $ProjectIdCopyWith<$Res>(_self.projectId, (value) {
    return _then(_self.copyWith(projectId: value));
  });
}/// Create a copy of FebricDocument
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RevisionIdCopyWith<$Res> get revision {
  
  return $RevisionIdCopyWith<$Res>(_self.revision, (value) {
    return _then(_self.copyWith(revision: value));
  });
}/// Create a copy of FebricDocument
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentManifestCopyWith<$Res> get manifest {
  
  return $DocumentManifestCopyWith<$Res>(_self.manifest, (value) {
    return _then(_self.copyWith(manifest: value));
  });
}/// Create a copy of FebricDocument
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentMetadataCopyWith<$Res> get metadata {
  
  return $DocumentMetadataCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}/// Create a copy of FebricDocument
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentSettingsCopyWith<$Res> get settings {
  
  return $DocumentSettingsCopyWith<$Res>(_self.settings, (value) {
    return _then(_self.copyWith(settings: value));
  });
}/// Create a copy of FebricDocument
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentPreferencesCopyWith<$Res> get preferences {
  
  return $DocumentPreferencesCopyWith<$Res>(_self.preferences, (value) {
    return _then(_self.copyWith(preferences: value));
  });
}/// Create a copy of FebricDocument
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssetRegistryCopyWith<$Res> get assets {
  
  return $AssetRegistryCopyWith<$Res>(_self.assets, (value) {
    return _then(_self.copyWith(assets: value));
  });
}/// Create a copy of FebricDocument
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LockSetCopyWith<$Res> get locks {
  
  return $LockSetCopyWith<$Res>(_self.locks, (value) {
    return _then(_self.copyWith(locks: value));
  });
}/// Create a copy of FebricDocument
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentHistoryCopyWith<$Res> get history {
  
  return $DocumentHistoryCopyWith<$Res>(_self.history, (value) {
    return _then(_self.copyWith(history: value));
  });
}
}


/// Adds pattern-matching-related methods to [FebricDocument].
extension FebricDocumentPatterns on FebricDocument {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FebricDocument value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FebricDocument() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FebricDocument value)  $default,){
final _that = this;
switch (_that) {
case _FebricDocument():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FebricDocument value)?  $default,){
final _that = this;
switch (_that) {
case _FebricDocument() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DocumentId id,  ProjectId projectId,  RevisionId revision,  DocumentManifest manifest,  DocumentMetadata metadata,  DocumentSettings settings,  DocumentPreferences preferences,  List<Artboard> artboards,  AssetRegistry assets,  Map<String, MaskStack> masks,  LockSet locks,  Map<String, ToolStateExtension> toolStates,  Map<String, WorkspaceViewportState> viewports,  DocumentHistory history,  List<AiProvenanceRecord> aiProvenance,  Map<String, Map<String, Object?>> pluginData,  List<ExportProfile> exportProfiles,  List<ProductionProfile> productionProfiles,  List<MeasurementProfile> measurementProfiles,  List<ColourProfile> colourProfiles,  List<PrintProfile> printProfiles)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FebricDocument() when $default != null:
return $default(_that.id,_that.projectId,_that.revision,_that.manifest,_that.metadata,_that.settings,_that.preferences,_that.artboards,_that.assets,_that.masks,_that.locks,_that.toolStates,_that.viewports,_that.history,_that.aiProvenance,_that.pluginData,_that.exportProfiles,_that.productionProfiles,_that.measurementProfiles,_that.colourProfiles,_that.printProfiles);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DocumentId id,  ProjectId projectId,  RevisionId revision,  DocumentManifest manifest,  DocumentMetadata metadata,  DocumentSettings settings,  DocumentPreferences preferences,  List<Artboard> artboards,  AssetRegistry assets,  Map<String, MaskStack> masks,  LockSet locks,  Map<String, ToolStateExtension> toolStates,  Map<String, WorkspaceViewportState> viewports,  DocumentHistory history,  List<AiProvenanceRecord> aiProvenance,  Map<String, Map<String, Object?>> pluginData,  List<ExportProfile> exportProfiles,  List<ProductionProfile> productionProfiles,  List<MeasurementProfile> measurementProfiles,  List<ColourProfile> colourProfiles,  List<PrintProfile> printProfiles)  $default,) {final _that = this;
switch (_that) {
case _FebricDocument():
return $default(_that.id,_that.projectId,_that.revision,_that.manifest,_that.metadata,_that.settings,_that.preferences,_that.artboards,_that.assets,_that.masks,_that.locks,_that.toolStates,_that.viewports,_that.history,_that.aiProvenance,_that.pluginData,_that.exportProfiles,_that.productionProfiles,_that.measurementProfiles,_that.colourProfiles,_that.printProfiles);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DocumentId id,  ProjectId projectId,  RevisionId revision,  DocumentManifest manifest,  DocumentMetadata metadata,  DocumentSettings settings,  DocumentPreferences preferences,  List<Artboard> artboards,  AssetRegistry assets,  Map<String, MaskStack> masks,  LockSet locks,  Map<String, ToolStateExtension> toolStates,  Map<String, WorkspaceViewportState> viewports,  DocumentHistory history,  List<AiProvenanceRecord> aiProvenance,  Map<String, Map<String, Object?>> pluginData,  List<ExportProfile> exportProfiles,  List<ProductionProfile> productionProfiles,  List<MeasurementProfile> measurementProfiles,  List<ColourProfile> colourProfiles,  List<PrintProfile> printProfiles)?  $default,) {final _that = this;
switch (_that) {
case _FebricDocument() when $default != null:
return $default(_that.id,_that.projectId,_that.revision,_that.manifest,_that.metadata,_that.settings,_that.preferences,_that.artboards,_that.assets,_that.masks,_that.locks,_that.toolStates,_that.viewports,_that.history,_that.aiProvenance,_that.pluginData,_that.exportProfiles,_that.productionProfiles,_that.measurementProfiles,_that.colourProfiles,_that.printProfiles);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FebricDocument extends FebricDocument {
  const _FebricDocument({required this.id, required this.projectId, this.revision = RevisionId.initial, required this.manifest, required this.metadata, this.settings = const DocumentSettings(), this.preferences = const DocumentPreferences(), final  List<Artboard> artboards = const <Artboard>[], this.assets = AssetRegistry.empty, final  Map<String, MaskStack> masks = const <String, MaskStack>{}, this.locks = LockSet.none, final  Map<String, ToolStateExtension> toolStates = const <String, ToolStateExtension>{}, final  Map<String, WorkspaceViewportState> viewports = const <String, WorkspaceViewportState>{}, this.history = DocumentHistory.empty, final  List<AiProvenanceRecord> aiProvenance = const <AiProvenanceRecord>[], final  Map<String, Map<String, Object?>> pluginData = const <String, Map<String, Object?>>{}, final  List<ExportProfile> exportProfiles = const <ExportProfile>[], final  List<ProductionProfile> productionProfiles = const <ProductionProfile>[], final  List<MeasurementProfile> measurementProfiles = const <MeasurementProfile>[], final  List<ColourProfile> colourProfiles = const <ColourProfile>[], final  List<PrintProfile> printProfiles = const <PrintProfile>[]}): _artboards = artboards,_masks = masks,_toolStates = toolStates,_viewports = viewports,_aiProvenance = aiProvenance,_pluginData = pluginData,_exportProfiles = exportProfiles,_productionProfiles = productionProfiles,_measurementProfiles = measurementProfiles,_colourProfiles = colourProfiles,_printProfiles = printProfiles,super._();
  factory _FebricDocument.fromJson(Map<String, dynamic> json) => _$FebricDocumentFromJson(json);

@override final  DocumentId id;
@override final  ProjectId projectId;
/// Monotonic revision (increments per applied command).
@override@JsonKey() final  RevisionId revision;
@override final  DocumentManifest manifest;
@override final  DocumentMetadata metadata;
@override@JsonKey() final  DocumentSettings settings;
@override@JsonKey() final  DocumentPreferences preferences;
/// Content: any number of artboards, each owning its layer tree and
/// design tree.
 final  List<Artboard> _artboards;
/// Content: any number of artboards, each owning its layer tree and
/// design tree.
@override@JsonKey() List<Artboard> get artboards {
  if (_artboards is EqualUnmodifiableListView) return _artboards;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_artboards);
}

/// Central asset registry.
@override@JsonKey() final  AssetRegistry assets;
/// Mask registry: target id (layer/node) → mask stack.
 final  Map<String, MaskStack> _masks;
/// Mask registry: target id (layer/node) → mask stack.
@override@JsonKey() Map<String, MaskStack> get masks {
  if (_masks is EqualUnmodifiableMapView) return _masks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_masks);
}

/// Lock registry (frozen Lock Engine, ADR-0005).
@override@JsonKey() final  LockSet locks;
/// Tool-state registry: tool/plugin id → typed envelope
/// (frozen rules 3 and 6 — the schema never changes per tool).
 final  Map<String, ToolStateExtension> _toolStates;
/// Tool-state registry: tool/plugin id → typed envelope
/// (frozen rules 3 and 6 — the schema never changes per tool).
@override@JsonKey() Map<String, ToolStateExtension> get toolStates {
  if (_toolStates is EqualUnmodifiableMapView) return _toolStates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_toolStates);
}

/// Per-workspace persisted viewports.
 final  Map<String, WorkspaceViewportState> _viewports;
/// Per-workspace persisted viewports.
@override@JsonKey() Map<String, WorkspaceViewportState> get viewports {
  if (_viewports is EqualUnmodifiableMapView) return _viewports;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_viewports);
}

/// The command journal (undo/redo stacks derive from its cursor).
@override@JsonKey() final  DocumentHistory history;
/// AI provenance ledger (invariant I5).
 final  List<AiProvenanceRecord> _aiProvenance;
/// AI provenance ledger (invariant I5).
@override@JsonKey() List<AiProvenanceRecord> get aiProvenance {
  if (_aiProvenance is EqualUnmodifiableListView) return _aiProvenance;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_aiProvenance);
}

/// Plugin-isolated extension storage:
/// namespace → (entry kind → payload). Plugins never touch core schema.
 final  Map<String, Map<String, Object?>> _pluginData;
/// Plugin-isolated extension storage:
/// namespace → (entry kind → payload). Plugins never touch core schema.
@override@JsonKey() Map<String, Map<String, Object?>> get pluginData {
  if (_pluginData is EqualUnmodifiableMapView) return _pluginData;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_pluginData);
}

 final  List<ExportProfile> _exportProfiles;
@override@JsonKey() List<ExportProfile> get exportProfiles {
  if (_exportProfiles is EqualUnmodifiableListView) return _exportProfiles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_exportProfiles);
}

 final  List<ProductionProfile> _productionProfiles;
@override@JsonKey() List<ProductionProfile> get productionProfiles {
  if (_productionProfiles is EqualUnmodifiableListView) return _productionProfiles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_productionProfiles);
}

 final  List<MeasurementProfile> _measurementProfiles;
@override@JsonKey() List<MeasurementProfile> get measurementProfiles {
  if (_measurementProfiles is EqualUnmodifiableListView) return _measurementProfiles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_measurementProfiles);
}

 final  List<ColourProfile> _colourProfiles;
@override@JsonKey() List<ColourProfile> get colourProfiles {
  if (_colourProfiles is EqualUnmodifiableListView) return _colourProfiles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_colourProfiles);
}

 final  List<PrintProfile> _printProfiles;
@override@JsonKey() List<PrintProfile> get printProfiles {
  if (_printProfiles is EqualUnmodifiableListView) return _printProfiles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_printProfiles);
}


/// Create a copy of FebricDocument
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FebricDocumentCopyWith<_FebricDocument> get copyWith => __$FebricDocumentCopyWithImpl<_FebricDocument>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FebricDocumentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FebricDocument&&(identical(other.id, id) || other.id == id)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.revision, revision) || other.revision == revision)&&(identical(other.manifest, manifest) || other.manifest == manifest)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.settings, settings) || other.settings == settings)&&(identical(other.preferences, preferences) || other.preferences == preferences)&&const DeepCollectionEquality().equals(other._artboards, _artboards)&&(identical(other.assets, assets) || other.assets == assets)&&const DeepCollectionEquality().equals(other._masks, _masks)&&(identical(other.locks, locks) || other.locks == locks)&&const DeepCollectionEquality().equals(other._toolStates, _toolStates)&&const DeepCollectionEquality().equals(other._viewports, _viewports)&&(identical(other.history, history) || other.history == history)&&const DeepCollectionEquality().equals(other._aiProvenance, _aiProvenance)&&const DeepCollectionEquality().equals(other._pluginData, _pluginData)&&const DeepCollectionEquality().equals(other._exportProfiles, _exportProfiles)&&const DeepCollectionEquality().equals(other._productionProfiles, _productionProfiles)&&const DeepCollectionEquality().equals(other._measurementProfiles, _measurementProfiles)&&const DeepCollectionEquality().equals(other._colourProfiles, _colourProfiles)&&const DeepCollectionEquality().equals(other._printProfiles, _printProfiles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,projectId,revision,manifest,metadata,settings,preferences,const DeepCollectionEquality().hash(_artboards),assets,const DeepCollectionEquality().hash(_masks),locks,const DeepCollectionEquality().hash(_toolStates),const DeepCollectionEquality().hash(_viewports),history,const DeepCollectionEquality().hash(_aiProvenance),const DeepCollectionEquality().hash(_pluginData),const DeepCollectionEquality().hash(_exportProfiles),const DeepCollectionEquality().hash(_productionProfiles),const DeepCollectionEquality().hash(_measurementProfiles),const DeepCollectionEquality().hash(_colourProfiles),const DeepCollectionEquality().hash(_printProfiles)]);

@override
String toString() {
  return 'FebricDocument(id: $id, projectId: $projectId, revision: $revision, manifest: $manifest, metadata: $metadata, settings: $settings, preferences: $preferences, artboards: $artboards, assets: $assets, masks: $masks, locks: $locks, toolStates: $toolStates, viewports: $viewports, history: $history, aiProvenance: $aiProvenance, pluginData: $pluginData, exportProfiles: $exportProfiles, productionProfiles: $productionProfiles, measurementProfiles: $measurementProfiles, colourProfiles: $colourProfiles, printProfiles: $printProfiles)';
}


}

/// @nodoc
abstract mixin class _$FebricDocumentCopyWith<$Res> implements $FebricDocumentCopyWith<$Res> {
  factory _$FebricDocumentCopyWith(_FebricDocument value, $Res Function(_FebricDocument) _then) = __$FebricDocumentCopyWithImpl;
@override @useResult
$Res call({
 DocumentId id, ProjectId projectId, RevisionId revision, DocumentManifest manifest, DocumentMetadata metadata, DocumentSettings settings, DocumentPreferences preferences, List<Artboard> artboards, AssetRegistry assets, Map<String, MaskStack> masks, LockSet locks, Map<String, ToolStateExtension> toolStates, Map<String, WorkspaceViewportState> viewports, DocumentHistory history, List<AiProvenanceRecord> aiProvenance, Map<String, Map<String, Object?>> pluginData, List<ExportProfile> exportProfiles, List<ProductionProfile> productionProfiles, List<MeasurementProfile> measurementProfiles, List<ColourProfile> colourProfiles, List<PrintProfile> printProfiles
});


@override $DocumentIdCopyWith<$Res> get id;@override $ProjectIdCopyWith<$Res> get projectId;@override $RevisionIdCopyWith<$Res> get revision;@override $DocumentManifestCopyWith<$Res> get manifest;@override $DocumentMetadataCopyWith<$Res> get metadata;@override $DocumentSettingsCopyWith<$Res> get settings;@override $DocumentPreferencesCopyWith<$Res> get preferences;@override $AssetRegistryCopyWith<$Res> get assets;@override $LockSetCopyWith<$Res> get locks;@override $DocumentHistoryCopyWith<$Res> get history;

}
/// @nodoc
class __$FebricDocumentCopyWithImpl<$Res>
    implements _$FebricDocumentCopyWith<$Res> {
  __$FebricDocumentCopyWithImpl(this._self, this._then);

  final _FebricDocument _self;
  final $Res Function(_FebricDocument) _then;

/// Create a copy of FebricDocument
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? projectId = null,Object? revision = null,Object? manifest = null,Object? metadata = null,Object? settings = null,Object? preferences = null,Object? artboards = null,Object? assets = null,Object? masks = null,Object? locks = null,Object? toolStates = null,Object? viewports = null,Object? history = null,Object? aiProvenance = null,Object? pluginData = null,Object? exportProfiles = null,Object? productionProfiles = null,Object? measurementProfiles = null,Object? colourProfiles = null,Object? printProfiles = null,}) {
  return _then(_FebricDocument(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as DocumentId,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as ProjectId,revision: null == revision ? _self.revision : revision // ignore: cast_nullable_to_non_nullable
as RevisionId,manifest: null == manifest ? _self.manifest : manifest // ignore: cast_nullable_to_non_nullable
as DocumentManifest,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as DocumentMetadata,settings: null == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as DocumentSettings,preferences: null == preferences ? _self.preferences : preferences // ignore: cast_nullable_to_non_nullable
as DocumentPreferences,artboards: null == artboards ? _self._artboards : artboards // ignore: cast_nullable_to_non_nullable
as List<Artboard>,assets: null == assets ? _self.assets : assets // ignore: cast_nullable_to_non_nullable
as AssetRegistry,masks: null == masks ? _self._masks : masks // ignore: cast_nullable_to_non_nullable
as Map<String, MaskStack>,locks: null == locks ? _self.locks : locks // ignore: cast_nullable_to_non_nullable
as LockSet,toolStates: null == toolStates ? _self._toolStates : toolStates // ignore: cast_nullable_to_non_nullable
as Map<String, ToolStateExtension>,viewports: null == viewports ? _self._viewports : viewports // ignore: cast_nullable_to_non_nullable
as Map<String, WorkspaceViewportState>,history: null == history ? _self.history : history // ignore: cast_nullable_to_non_nullable
as DocumentHistory,aiProvenance: null == aiProvenance ? _self._aiProvenance : aiProvenance // ignore: cast_nullable_to_non_nullable
as List<AiProvenanceRecord>,pluginData: null == pluginData ? _self._pluginData : pluginData // ignore: cast_nullable_to_non_nullable
as Map<String, Map<String, Object?>>,exportProfiles: null == exportProfiles ? _self._exportProfiles : exportProfiles // ignore: cast_nullable_to_non_nullable
as List<ExportProfile>,productionProfiles: null == productionProfiles ? _self._productionProfiles : productionProfiles // ignore: cast_nullable_to_non_nullable
as List<ProductionProfile>,measurementProfiles: null == measurementProfiles ? _self._measurementProfiles : measurementProfiles // ignore: cast_nullable_to_non_nullable
as List<MeasurementProfile>,colourProfiles: null == colourProfiles ? _self._colourProfiles : colourProfiles // ignore: cast_nullable_to_non_nullable
as List<ColourProfile>,printProfiles: null == printProfiles ? _self._printProfiles : printProfiles // ignore: cast_nullable_to_non_nullable
as List<PrintProfile>,
  ));
}

/// Create a copy of FebricDocument
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentIdCopyWith<$Res> get id {
  
  return $DocumentIdCopyWith<$Res>(_self.id, (value) {
    return _then(_self.copyWith(id: value));
  });
}/// Create a copy of FebricDocument
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectIdCopyWith<$Res> get projectId {
  
  return $ProjectIdCopyWith<$Res>(_self.projectId, (value) {
    return _then(_self.copyWith(projectId: value));
  });
}/// Create a copy of FebricDocument
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RevisionIdCopyWith<$Res> get revision {
  
  return $RevisionIdCopyWith<$Res>(_self.revision, (value) {
    return _then(_self.copyWith(revision: value));
  });
}/// Create a copy of FebricDocument
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentManifestCopyWith<$Res> get manifest {
  
  return $DocumentManifestCopyWith<$Res>(_self.manifest, (value) {
    return _then(_self.copyWith(manifest: value));
  });
}/// Create a copy of FebricDocument
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentMetadataCopyWith<$Res> get metadata {
  
  return $DocumentMetadataCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}/// Create a copy of FebricDocument
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentSettingsCopyWith<$Res> get settings {
  
  return $DocumentSettingsCopyWith<$Res>(_self.settings, (value) {
    return _then(_self.copyWith(settings: value));
  });
}/// Create a copy of FebricDocument
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentPreferencesCopyWith<$Res> get preferences {
  
  return $DocumentPreferencesCopyWith<$Res>(_self.preferences, (value) {
    return _then(_self.copyWith(preferences: value));
  });
}/// Create a copy of FebricDocument
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssetRegistryCopyWith<$Res> get assets {
  
  return $AssetRegistryCopyWith<$Res>(_self.assets, (value) {
    return _then(_self.copyWith(assets: value));
  });
}/// Create a copy of FebricDocument
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LockSetCopyWith<$Res> get locks {
  
  return $LockSetCopyWith<$Res>(_self.locks, (value) {
    return _then(_self.copyWith(locks: value));
  });
}/// Create a copy of FebricDocument
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentHistoryCopyWith<$Res> get history {
  
  return $DocumentHistoryCopyWith<$Res>(_self.history, (value) {
    return _then(_self.copyWith(history: value));
  });
}
}

// dart format on
