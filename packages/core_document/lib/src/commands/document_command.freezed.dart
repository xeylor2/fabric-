// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'document_command.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
DocumentCommand _$DocumentCommandFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'createArtboard':
          return CreateArtboardCommand.fromJson(
            json
          );
                case 'deleteArtboard':
          return DeleteArtboardCommand.fromJson(
            json
          );
                case 'createLayer':
          return CreateLayerCommand.fromJson(
            json
          );
                case 'deleteLayer':
          return DeleteLayerCommand.fromJson(
            json
          );
                case 'moveLayer':
          return MoveLayerCommand.fromJson(
            json
          );
                case 'renameLayer':
          return RenameLayerCommand.fromJson(
            json
          );
                case 'setLayerMetadata':
          return SetLayerMetadataCommand.fromJson(
            json
          );
                case 'importAsset':
          return ImportAssetCommand.fromJson(
            json
          );
                case 'removeAsset':
          return RemoveAssetCommand.fromJson(
            json
          );
                case 'applyMask':
          return ApplyMaskCommand.fromJson(
            json
          );
                case 'removeMask':
          return RemoveMaskCommand.fromJson(
            json
          );
                case 'updateMetadata':
          return UpdateMetadataCommand.fromJson(
            json
          );
                case 'updateSettings':
          return UpdateSettingsCommand.fromJson(
            json
          );
                case 'updateToolState':
          return UpdateToolStateCommand.fromJson(
            json
          );
                case 'updateViewport':
          return UpdateViewportCommand.fromJson(
            json
          );
                case 'changeColour':
          return ChangeColourCommand.fromJson(
            json
          );
                case 'repeatPattern':
          return RepeatPatternCommand.fromJson(
            json
          );
                case 'setLock':
          return SetLockCommand.fromJson(
            json
          );
                case 'releaseLock':
          return ReleaseLockCommand.fromJson(
            json
          );
                case 'updatePluginData':
          return UpdatePluginDataCommand.fromJson(
            json
          );
                case 'custom':
          return CustomCommand.fromJson(
            json
          );
                case 'createDesignNode':
          return CreateDesignNodeCommand.fromJson(
            json
          );
                case 'deleteDesignNode':
          return DeleteDesignNodeCommand.fromJson(
            json
          );
                case 'moveDesignNode':
          return MoveDesignNodeCommand.fromJson(
            json
          );
                case 'renameDesignNode':
          return RenameDesignNodeCommand.fromJson(
            json
          );
                case 'setNodeVisibility':
          return SetNodeVisibilityCommand.fromJson(
            json
          );
                case 'setNodeLocked':
          return SetNodeLockedCommand.fromJson(
            json
          );
                case 'setNodeMetadata':
          return SetNodeMetadataCommand.fromJson(
            json
          );
                case 'duplicateDesignNode':
          return DuplicateDesignNodeCommand.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'DocumentCommand',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$DocumentCommand {



  /// Serializes this DocumentCommand to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentCommand);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DocumentCommand()';
}


}

/// @nodoc
class $DocumentCommandCopyWith<$Res>  {
$DocumentCommandCopyWith(DocumentCommand _, $Res Function(DocumentCommand) __);
}


/// Adds pattern-matching-related methods to [DocumentCommand].
extension DocumentCommandPatterns on DocumentCommand {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CreateArtboardCommand value)?  createArtboard,TResult Function( DeleteArtboardCommand value)?  deleteArtboard,TResult Function( CreateLayerCommand value)?  createLayer,TResult Function( DeleteLayerCommand value)?  deleteLayer,TResult Function( MoveLayerCommand value)?  moveLayer,TResult Function( RenameLayerCommand value)?  renameLayer,TResult Function( SetLayerMetadataCommand value)?  setLayerMetadata,TResult Function( ImportAssetCommand value)?  importAsset,TResult Function( RemoveAssetCommand value)?  removeAsset,TResult Function( ApplyMaskCommand value)?  applyMask,TResult Function( RemoveMaskCommand value)?  removeMask,TResult Function( UpdateMetadataCommand value)?  updateMetadata,TResult Function( UpdateSettingsCommand value)?  updateSettings,TResult Function( UpdateToolStateCommand value)?  updateToolState,TResult Function( UpdateViewportCommand value)?  updateViewport,TResult Function( ChangeColourCommand value)?  changeColour,TResult Function( RepeatPatternCommand value)?  repeatPattern,TResult Function( SetLockCommand value)?  setLock,TResult Function( ReleaseLockCommand value)?  releaseLock,TResult Function( UpdatePluginDataCommand value)?  updatePluginData,TResult Function( CustomCommand value)?  custom,TResult Function( CreateDesignNodeCommand value)?  createDesignNode,TResult Function( DeleteDesignNodeCommand value)?  deleteDesignNode,TResult Function( MoveDesignNodeCommand value)?  moveDesignNode,TResult Function( RenameDesignNodeCommand value)?  renameDesignNode,TResult Function( SetNodeVisibilityCommand value)?  setNodeVisibility,TResult Function( SetNodeLockedCommand value)?  setNodeLocked,TResult Function( SetNodeMetadataCommand value)?  setNodeMetadata,TResult Function( DuplicateDesignNodeCommand value)?  duplicateDesignNode,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CreateArtboardCommand() when createArtboard != null:
return createArtboard(_that);case DeleteArtboardCommand() when deleteArtboard != null:
return deleteArtboard(_that);case CreateLayerCommand() when createLayer != null:
return createLayer(_that);case DeleteLayerCommand() when deleteLayer != null:
return deleteLayer(_that);case MoveLayerCommand() when moveLayer != null:
return moveLayer(_that);case RenameLayerCommand() when renameLayer != null:
return renameLayer(_that);case SetLayerMetadataCommand() when setLayerMetadata != null:
return setLayerMetadata(_that);case ImportAssetCommand() when importAsset != null:
return importAsset(_that);case RemoveAssetCommand() when removeAsset != null:
return removeAsset(_that);case ApplyMaskCommand() when applyMask != null:
return applyMask(_that);case RemoveMaskCommand() when removeMask != null:
return removeMask(_that);case UpdateMetadataCommand() when updateMetadata != null:
return updateMetadata(_that);case UpdateSettingsCommand() when updateSettings != null:
return updateSettings(_that);case UpdateToolStateCommand() when updateToolState != null:
return updateToolState(_that);case UpdateViewportCommand() when updateViewport != null:
return updateViewport(_that);case ChangeColourCommand() when changeColour != null:
return changeColour(_that);case RepeatPatternCommand() when repeatPattern != null:
return repeatPattern(_that);case SetLockCommand() when setLock != null:
return setLock(_that);case ReleaseLockCommand() when releaseLock != null:
return releaseLock(_that);case UpdatePluginDataCommand() when updatePluginData != null:
return updatePluginData(_that);case CustomCommand() when custom != null:
return custom(_that);case CreateDesignNodeCommand() when createDesignNode != null:
return createDesignNode(_that);case DeleteDesignNodeCommand() when deleteDesignNode != null:
return deleteDesignNode(_that);case MoveDesignNodeCommand() when moveDesignNode != null:
return moveDesignNode(_that);case RenameDesignNodeCommand() when renameDesignNode != null:
return renameDesignNode(_that);case SetNodeVisibilityCommand() when setNodeVisibility != null:
return setNodeVisibility(_that);case SetNodeLockedCommand() when setNodeLocked != null:
return setNodeLocked(_that);case SetNodeMetadataCommand() when setNodeMetadata != null:
return setNodeMetadata(_that);case DuplicateDesignNodeCommand() when duplicateDesignNode != null:
return duplicateDesignNode(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CreateArtboardCommand value)  createArtboard,required TResult Function( DeleteArtboardCommand value)  deleteArtboard,required TResult Function( CreateLayerCommand value)  createLayer,required TResult Function( DeleteLayerCommand value)  deleteLayer,required TResult Function( MoveLayerCommand value)  moveLayer,required TResult Function( RenameLayerCommand value)  renameLayer,required TResult Function( SetLayerMetadataCommand value)  setLayerMetadata,required TResult Function( ImportAssetCommand value)  importAsset,required TResult Function( RemoveAssetCommand value)  removeAsset,required TResult Function( ApplyMaskCommand value)  applyMask,required TResult Function( RemoveMaskCommand value)  removeMask,required TResult Function( UpdateMetadataCommand value)  updateMetadata,required TResult Function( UpdateSettingsCommand value)  updateSettings,required TResult Function( UpdateToolStateCommand value)  updateToolState,required TResult Function( UpdateViewportCommand value)  updateViewport,required TResult Function( ChangeColourCommand value)  changeColour,required TResult Function( RepeatPatternCommand value)  repeatPattern,required TResult Function( SetLockCommand value)  setLock,required TResult Function( ReleaseLockCommand value)  releaseLock,required TResult Function( UpdatePluginDataCommand value)  updatePluginData,required TResult Function( CustomCommand value)  custom,required TResult Function( CreateDesignNodeCommand value)  createDesignNode,required TResult Function( DeleteDesignNodeCommand value)  deleteDesignNode,required TResult Function( MoveDesignNodeCommand value)  moveDesignNode,required TResult Function( RenameDesignNodeCommand value)  renameDesignNode,required TResult Function( SetNodeVisibilityCommand value)  setNodeVisibility,required TResult Function( SetNodeLockedCommand value)  setNodeLocked,required TResult Function( SetNodeMetadataCommand value)  setNodeMetadata,required TResult Function( DuplicateDesignNodeCommand value)  duplicateDesignNode,}){
final _that = this;
switch (_that) {
case CreateArtboardCommand():
return createArtboard(_that);case DeleteArtboardCommand():
return deleteArtboard(_that);case CreateLayerCommand():
return createLayer(_that);case DeleteLayerCommand():
return deleteLayer(_that);case MoveLayerCommand():
return moveLayer(_that);case RenameLayerCommand():
return renameLayer(_that);case SetLayerMetadataCommand():
return setLayerMetadata(_that);case ImportAssetCommand():
return importAsset(_that);case RemoveAssetCommand():
return removeAsset(_that);case ApplyMaskCommand():
return applyMask(_that);case RemoveMaskCommand():
return removeMask(_that);case UpdateMetadataCommand():
return updateMetadata(_that);case UpdateSettingsCommand():
return updateSettings(_that);case UpdateToolStateCommand():
return updateToolState(_that);case UpdateViewportCommand():
return updateViewport(_that);case ChangeColourCommand():
return changeColour(_that);case RepeatPatternCommand():
return repeatPattern(_that);case SetLockCommand():
return setLock(_that);case ReleaseLockCommand():
return releaseLock(_that);case UpdatePluginDataCommand():
return updatePluginData(_that);case CustomCommand():
return custom(_that);case CreateDesignNodeCommand():
return createDesignNode(_that);case DeleteDesignNodeCommand():
return deleteDesignNode(_that);case MoveDesignNodeCommand():
return moveDesignNode(_that);case RenameDesignNodeCommand():
return renameDesignNode(_that);case SetNodeVisibilityCommand():
return setNodeVisibility(_that);case SetNodeLockedCommand():
return setNodeLocked(_that);case SetNodeMetadataCommand():
return setNodeMetadata(_that);case DuplicateDesignNodeCommand():
return duplicateDesignNode(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CreateArtboardCommand value)?  createArtboard,TResult? Function( DeleteArtboardCommand value)?  deleteArtboard,TResult? Function( CreateLayerCommand value)?  createLayer,TResult? Function( DeleteLayerCommand value)?  deleteLayer,TResult? Function( MoveLayerCommand value)?  moveLayer,TResult? Function( RenameLayerCommand value)?  renameLayer,TResult? Function( SetLayerMetadataCommand value)?  setLayerMetadata,TResult? Function( ImportAssetCommand value)?  importAsset,TResult? Function( RemoveAssetCommand value)?  removeAsset,TResult? Function( ApplyMaskCommand value)?  applyMask,TResult? Function( RemoveMaskCommand value)?  removeMask,TResult? Function( UpdateMetadataCommand value)?  updateMetadata,TResult? Function( UpdateSettingsCommand value)?  updateSettings,TResult? Function( UpdateToolStateCommand value)?  updateToolState,TResult? Function( UpdateViewportCommand value)?  updateViewport,TResult? Function( ChangeColourCommand value)?  changeColour,TResult? Function( RepeatPatternCommand value)?  repeatPattern,TResult? Function( SetLockCommand value)?  setLock,TResult? Function( ReleaseLockCommand value)?  releaseLock,TResult? Function( UpdatePluginDataCommand value)?  updatePluginData,TResult? Function( CustomCommand value)?  custom,TResult? Function( CreateDesignNodeCommand value)?  createDesignNode,TResult? Function( DeleteDesignNodeCommand value)?  deleteDesignNode,TResult? Function( MoveDesignNodeCommand value)?  moveDesignNode,TResult? Function( RenameDesignNodeCommand value)?  renameDesignNode,TResult? Function( SetNodeVisibilityCommand value)?  setNodeVisibility,TResult? Function( SetNodeLockedCommand value)?  setNodeLocked,TResult? Function( SetNodeMetadataCommand value)?  setNodeMetadata,TResult? Function( DuplicateDesignNodeCommand value)?  duplicateDesignNode,}){
final _that = this;
switch (_that) {
case CreateArtboardCommand() when createArtboard != null:
return createArtboard(_that);case DeleteArtboardCommand() when deleteArtboard != null:
return deleteArtboard(_that);case CreateLayerCommand() when createLayer != null:
return createLayer(_that);case DeleteLayerCommand() when deleteLayer != null:
return deleteLayer(_that);case MoveLayerCommand() when moveLayer != null:
return moveLayer(_that);case RenameLayerCommand() when renameLayer != null:
return renameLayer(_that);case SetLayerMetadataCommand() when setLayerMetadata != null:
return setLayerMetadata(_that);case ImportAssetCommand() when importAsset != null:
return importAsset(_that);case RemoveAssetCommand() when removeAsset != null:
return removeAsset(_that);case ApplyMaskCommand() when applyMask != null:
return applyMask(_that);case RemoveMaskCommand() when removeMask != null:
return removeMask(_that);case UpdateMetadataCommand() when updateMetadata != null:
return updateMetadata(_that);case UpdateSettingsCommand() when updateSettings != null:
return updateSettings(_that);case UpdateToolStateCommand() when updateToolState != null:
return updateToolState(_that);case UpdateViewportCommand() when updateViewport != null:
return updateViewport(_that);case ChangeColourCommand() when changeColour != null:
return changeColour(_that);case RepeatPatternCommand() when repeatPattern != null:
return repeatPattern(_that);case SetLockCommand() when setLock != null:
return setLock(_that);case ReleaseLockCommand() when releaseLock != null:
return releaseLock(_that);case UpdatePluginDataCommand() when updatePluginData != null:
return updatePluginData(_that);case CustomCommand() when custom != null:
return custom(_that);case CreateDesignNodeCommand() when createDesignNode != null:
return createDesignNode(_that);case DeleteDesignNodeCommand() when deleteDesignNode != null:
return deleteDesignNode(_that);case MoveDesignNodeCommand() when moveDesignNode != null:
return moveDesignNode(_that);case RenameDesignNodeCommand() when renameDesignNode != null:
return renameDesignNode(_that);case SetNodeVisibilityCommand() when setNodeVisibility != null:
return setNodeVisibility(_that);case SetNodeLockedCommand() when setNodeLocked != null:
return setNodeLocked(_that);case SetNodeMetadataCommand() when setNodeMetadata != null:
return setNodeMetadata(_that);case DuplicateDesignNodeCommand() when duplicateDesignNode != null:
return duplicateDesignNode(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Artboard artboard)?  createArtboard,TResult Function( String artboardId)?  deleteArtboard,TResult Function( String artboardId,  String? parentLayerId,  LayerModel layer,  int? index)?  createLayer,TResult Function( String artboardId,  String layerId)?  deleteLayer,TResult Function( String artboardId,  String layerId,  String newParentId,  int index)?  moveLayer,TResult Function( String artboardId,  String layerId,  String name)?  renameLayer,TResult Function( String artboardId,  String layerId,  String key,  Object? value)?  setLayerMetadata,TResult Function( AssetRecord asset)?  importAsset,TResult Function( String assetId)?  removeAsset,TResult Function( String targetId,  MaskStack stack)?  applyMask,TResult Function( String targetId)?  removeMask,TResult Function( DocumentMetadata metadata)?  updateMetadata,TResult Function( DocumentSettings settings)?  updateSettings,TResult Function( ToolStateExtension state)?  updateToolState,TResult Function( WorkspaceViewportState viewport)?  updateViewport,TResult Function( String artboardId,  String layerId, @JsonKey(fromJson: _colourOpFromJson, toJson: _colourOpToJson)  ColourOperation operation,  String colourHex)?  changeColour,TResult Function( String artboardId,  String layerId, @JsonKey(fromJson: _repeatFromJson, toJson: _repeatToJson)  RepeatType repeat,  Map<String, Object?> parameters)?  repeatPattern,TResult Function( LockState lock)?  setLock,TResult Function( LockScope scope,  String? targetId)?  releaseLock,TResult Function( String pluginId,  Map<String, Object?> data)?  updatePluginData,TResult Function( String namespace,  String kind,  Map<String, Object?> payload,  List<String> affectedIds)?  custom,TResult Function( String artboardId,  String? parentNodeId,  DesignNode node,  int? index)?  createDesignNode,TResult Function( String artboardId,  String nodeId)?  deleteDesignNode,TResult Function( String artboardId,  String nodeId,  String newParentId,  int index)?  moveDesignNode,TResult Function( String artboardId,  String nodeId,  String name)?  renameDesignNode,TResult Function( String artboardId,  String nodeId,  bool visible)?  setNodeVisibility,TResult Function( String artboardId,  String nodeId,  bool locked)?  setNodeLocked,TResult Function( String artboardId,  String nodeId,  String key,  Object? value)?  setNodeMetadata,TResult Function( String artboardId,  String sourceNodeId,  DesignNode duplicate)?  duplicateDesignNode,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CreateArtboardCommand() when createArtboard != null:
return createArtboard(_that.artboard);case DeleteArtboardCommand() when deleteArtboard != null:
return deleteArtboard(_that.artboardId);case CreateLayerCommand() when createLayer != null:
return createLayer(_that.artboardId,_that.parentLayerId,_that.layer,_that.index);case DeleteLayerCommand() when deleteLayer != null:
return deleteLayer(_that.artboardId,_that.layerId);case MoveLayerCommand() when moveLayer != null:
return moveLayer(_that.artboardId,_that.layerId,_that.newParentId,_that.index);case RenameLayerCommand() when renameLayer != null:
return renameLayer(_that.artboardId,_that.layerId,_that.name);case SetLayerMetadataCommand() when setLayerMetadata != null:
return setLayerMetadata(_that.artboardId,_that.layerId,_that.key,_that.value);case ImportAssetCommand() when importAsset != null:
return importAsset(_that.asset);case RemoveAssetCommand() when removeAsset != null:
return removeAsset(_that.assetId);case ApplyMaskCommand() when applyMask != null:
return applyMask(_that.targetId,_that.stack);case RemoveMaskCommand() when removeMask != null:
return removeMask(_that.targetId);case UpdateMetadataCommand() when updateMetadata != null:
return updateMetadata(_that.metadata);case UpdateSettingsCommand() when updateSettings != null:
return updateSettings(_that.settings);case UpdateToolStateCommand() when updateToolState != null:
return updateToolState(_that.state);case UpdateViewportCommand() when updateViewport != null:
return updateViewport(_that.viewport);case ChangeColourCommand() when changeColour != null:
return changeColour(_that.artboardId,_that.layerId,_that.operation,_that.colourHex);case RepeatPatternCommand() when repeatPattern != null:
return repeatPattern(_that.artboardId,_that.layerId,_that.repeat,_that.parameters);case SetLockCommand() when setLock != null:
return setLock(_that.lock);case ReleaseLockCommand() when releaseLock != null:
return releaseLock(_that.scope,_that.targetId);case UpdatePluginDataCommand() when updatePluginData != null:
return updatePluginData(_that.pluginId,_that.data);case CustomCommand() when custom != null:
return custom(_that.namespace,_that.kind,_that.payload,_that.affectedIds);case CreateDesignNodeCommand() when createDesignNode != null:
return createDesignNode(_that.artboardId,_that.parentNodeId,_that.node,_that.index);case DeleteDesignNodeCommand() when deleteDesignNode != null:
return deleteDesignNode(_that.artboardId,_that.nodeId);case MoveDesignNodeCommand() when moveDesignNode != null:
return moveDesignNode(_that.artboardId,_that.nodeId,_that.newParentId,_that.index);case RenameDesignNodeCommand() when renameDesignNode != null:
return renameDesignNode(_that.artboardId,_that.nodeId,_that.name);case SetNodeVisibilityCommand() when setNodeVisibility != null:
return setNodeVisibility(_that.artboardId,_that.nodeId,_that.visible);case SetNodeLockedCommand() when setNodeLocked != null:
return setNodeLocked(_that.artboardId,_that.nodeId,_that.locked);case SetNodeMetadataCommand() when setNodeMetadata != null:
return setNodeMetadata(_that.artboardId,_that.nodeId,_that.key,_that.value);case DuplicateDesignNodeCommand() when duplicateDesignNode != null:
return duplicateDesignNode(_that.artboardId,_that.sourceNodeId,_that.duplicate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Artboard artboard)  createArtboard,required TResult Function( String artboardId)  deleteArtboard,required TResult Function( String artboardId,  String? parentLayerId,  LayerModel layer,  int? index)  createLayer,required TResult Function( String artboardId,  String layerId)  deleteLayer,required TResult Function( String artboardId,  String layerId,  String newParentId,  int index)  moveLayer,required TResult Function( String artboardId,  String layerId,  String name)  renameLayer,required TResult Function( String artboardId,  String layerId,  String key,  Object? value)  setLayerMetadata,required TResult Function( AssetRecord asset)  importAsset,required TResult Function( String assetId)  removeAsset,required TResult Function( String targetId,  MaskStack stack)  applyMask,required TResult Function( String targetId)  removeMask,required TResult Function( DocumentMetadata metadata)  updateMetadata,required TResult Function( DocumentSettings settings)  updateSettings,required TResult Function( ToolStateExtension state)  updateToolState,required TResult Function( WorkspaceViewportState viewport)  updateViewport,required TResult Function( String artboardId,  String layerId, @JsonKey(fromJson: _colourOpFromJson, toJson: _colourOpToJson)  ColourOperation operation,  String colourHex)  changeColour,required TResult Function( String artboardId,  String layerId, @JsonKey(fromJson: _repeatFromJson, toJson: _repeatToJson)  RepeatType repeat,  Map<String, Object?> parameters)  repeatPattern,required TResult Function( LockState lock)  setLock,required TResult Function( LockScope scope,  String? targetId)  releaseLock,required TResult Function( String pluginId,  Map<String, Object?> data)  updatePluginData,required TResult Function( String namespace,  String kind,  Map<String, Object?> payload,  List<String> affectedIds)  custom,required TResult Function( String artboardId,  String? parentNodeId,  DesignNode node,  int? index)  createDesignNode,required TResult Function( String artboardId,  String nodeId)  deleteDesignNode,required TResult Function( String artboardId,  String nodeId,  String newParentId,  int index)  moveDesignNode,required TResult Function( String artboardId,  String nodeId,  String name)  renameDesignNode,required TResult Function( String artboardId,  String nodeId,  bool visible)  setNodeVisibility,required TResult Function( String artboardId,  String nodeId,  bool locked)  setNodeLocked,required TResult Function( String artboardId,  String nodeId,  String key,  Object? value)  setNodeMetadata,required TResult Function( String artboardId,  String sourceNodeId,  DesignNode duplicate)  duplicateDesignNode,}) {final _that = this;
switch (_that) {
case CreateArtboardCommand():
return createArtboard(_that.artboard);case DeleteArtboardCommand():
return deleteArtboard(_that.artboardId);case CreateLayerCommand():
return createLayer(_that.artboardId,_that.parentLayerId,_that.layer,_that.index);case DeleteLayerCommand():
return deleteLayer(_that.artboardId,_that.layerId);case MoveLayerCommand():
return moveLayer(_that.artboardId,_that.layerId,_that.newParentId,_that.index);case RenameLayerCommand():
return renameLayer(_that.artboardId,_that.layerId,_that.name);case SetLayerMetadataCommand():
return setLayerMetadata(_that.artboardId,_that.layerId,_that.key,_that.value);case ImportAssetCommand():
return importAsset(_that.asset);case RemoveAssetCommand():
return removeAsset(_that.assetId);case ApplyMaskCommand():
return applyMask(_that.targetId,_that.stack);case RemoveMaskCommand():
return removeMask(_that.targetId);case UpdateMetadataCommand():
return updateMetadata(_that.metadata);case UpdateSettingsCommand():
return updateSettings(_that.settings);case UpdateToolStateCommand():
return updateToolState(_that.state);case UpdateViewportCommand():
return updateViewport(_that.viewport);case ChangeColourCommand():
return changeColour(_that.artboardId,_that.layerId,_that.operation,_that.colourHex);case RepeatPatternCommand():
return repeatPattern(_that.artboardId,_that.layerId,_that.repeat,_that.parameters);case SetLockCommand():
return setLock(_that.lock);case ReleaseLockCommand():
return releaseLock(_that.scope,_that.targetId);case UpdatePluginDataCommand():
return updatePluginData(_that.pluginId,_that.data);case CustomCommand():
return custom(_that.namespace,_that.kind,_that.payload,_that.affectedIds);case CreateDesignNodeCommand():
return createDesignNode(_that.artboardId,_that.parentNodeId,_that.node,_that.index);case DeleteDesignNodeCommand():
return deleteDesignNode(_that.artboardId,_that.nodeId);case MoveDesignNodeCommand():
return moveDesignNode(_that.artboardId,_that.nodeId,_that.newParentId,_that.index);case RenameDesignNodeCommand():
return renameDesignNode(_that.artboardId,_that.nodeId,_that.name);case SetNodeVisibilityCommand():
return setNodeVisibility(_that.artboardId,_that.nodeId,_that.visible);case SetNodeLockedCommand():
return setNodeLocked(_that.artboardId,_that.nodeId,_that.locked);case SetNodeMetadataCommand():
return setNodeMetadata(_that.artboardId,_that.nodeId,_that.key,_that.value);case DuplicateDesignNodeCommand():
return duplicateDesignNode(_that.artboardId,_that.sourceNodeId,_that.duplicate);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Artboard artboard)?  createArtboard,TResult? Function( String artboardId)?  deleteArtboard,TResult? Function( String artboardId,  String? parentLayerId,  LayerModel layer,  int? index)?  createLayer,TResult? Function( String artboardId,  String layerId)?  deleteLayer,TResult? Function( String artboardId,  String layerId,  String newParentId,  int index)?  moveLayer,TResult? Function( String artboardId,  String layerId,  String name)?  renameLayer,TResult? Function( String artboardId,  String layerId,  String key,  Object? value)?  setLayerMetadata,TResult? Function( AssetRecord asset)?  importAsset,TResult? Function( String assetId)?  removeAsset,TResult? Function( String targetId,  MaskStack stack)?  applyMask,TResult? Function( String targetId)?  removeMask,TResult? Function( DocumentMetadata metadata)?  updateMetadata,TResult? Function( DocumentSettings settings)?  updateSettings,TResult? Function( ToolStateExtension state)?  updateToolState,TResult? Function( WorkspaceViewportState viewport)?  updateViewport,TResult? Function( String artboardId,  String layerId, @JsonKey(fromJson: _colourOpFromJson, toJson: _colourOpToJson)  ColourOperation operation,  String colourHex)?  changeColour,TResult? Function( String artboardId,  String layerId, @JsonKey(fromJson: _repeatFromJson, toJson: _repeatToJson)  RepeatType repeat,  Map<String, Object?> parameters)?  repeatPattern,TResult? Function( LockState lock)?  setLock,TResult? Function( LockScope scope,  String? targetId)?  releaseLock,TResult? Function( String pluginId,  Map<String, Object?> data)?  updatePluginData,TResult? Function( String namespace,  String kind,  Map<String, Object?> payload,  List<String> affectedIds)?  custom,TResult? Function( String artboardId,  String? parentNodeId,  DesignNode node,  int? index)?  createDesignNode,TResult? Function( String artboardId,  String nodeId)?  deleteDesignNode,TResult? Function( String artboardId,  String nodeId,  String newParentId,  int index)?  moveDesignNode,TResult? Function( String artboardId,  String nodeId,  String name)?  renameDesignNode,TResult? Function( String artboardId,  String nodeId,  bool visible)?  setNodeVisibility,TResult? Function( String artboardId,  String nodeId,  bool locked)?  setNodeLocked,TResult? Function( String artboardId,  String nodeId,  String key,  Object? value)?  setNodeMetadata,TResult? Function( String artboardId,  String sourceNodeId,  DesignNode duplicate)?  duplicateDesignNode,}) {final _that = this;
switch (_that) {
case CreateArtboardCommand() when createArtboard != null:
return createArtboard(_that.artboard);case DeleteArtboardCommand() when deleteArtboard != null:
return deleteArtboard(_that.artboardId);case CreateLayerCommand() when createLayer != null:
return createLayer(_that.artboardId,_that.parentLayerId,_that.layer,_that.index);case DeleteLayerCommand() when deleteLayer != null:
return deleteLayer(_that.artboardId,_that.layerId);case MoveLayerCommand() when moveLayer != null:
return moveLayer(_that.artboardId,_that.layerId,_that.newParentId,_that.index);case RenameLayerCommand() when renameLayer != null:
return renameLayer(_that.artboardId,_that.layerId,_that.name);case SetLayerMetadataCommand() when setLayerMetadata != null:
return setLayerMetadata(_that.artboardId,_that.layerId,_that.key,_that.value);case ImportAssetCommand() when importAsset != null:
return importAsset(_that.asset);case RemoveAssetCommand() when removeAsset != null:
return removeAsset(_that.assetId);case ApplyMaskCommand() when applyMask != null:
return applyMask(_that.targetId,_that.stack);case RemoveMaskCommand() when removeMask != null:
return removeMask(_that.targetId);case UpdateMetadataCommand() when updateMetadata != null:
return updateMetadata(_that.metadata);case UpdateSettingsCommand() when updateSettings != null:
return updateSettings(_that.settings);case UpdateToolStateCommand() when updateToolState != null:
return updateToolState(_that.state);case UpdateViewportCommand() when updateViewport != null:
return updateViewport(_that.viewport);case ChangeColourCommand() when changeColour != null:
return changeColour(_that.artboardId,_that.layerId,_that.operation,_that.colourHex);case RepeatPatternCommand() when repeatPattern != null:
return repeatPattern(_that.artboardId,_that.layerId,_that.repeat,_that.parameters);case SetLockCommand() when setLock != null:
return setLock(_that.lock);case ReleaseLockCommand() when releaseLock != null:
return releaseLock(_that.scope,_that.targetId);case UpdatePluginDataCommand() when updatePluginData != null:
return updatePluginData(_that.pluginId,_that.data);case CustomCommand() when custom != null:
return custom(_that.namespace,_that.kind,_that.payload,_that.affectedIds);case CreateDesignNodeCommand() when createDesignNode != null:
return createDesignNode(_that.artboardId,_that.parentNodeId,_that.node,_that.index);case DeleteDesignNodeCommand() when deleteDesignNode != null:
return deleteDesignNode(_that.artboardId,_that.nodeId);case MoveDesignNodeCommand() when moveDesignNode != null:
return moveDesignNode(_that.artboardId,_that.nodeId,_that.newParentId,_that.index);case RenameDesignNodeCommand() when renameDesignNode != null:
return renameDesignNode(_that.artboardId,_that.nodeId,_that.name);case SetNodeVisibilityCommand() when setNodeVisibility != null:
return setNodeVisibility(_that.artboardId,_that.nodeId,_that.visible);case SetNodeLockedCommand() when setNodeLocked != null:
return setNodeLocked(_that.artboardId,_that.nodeId,_that.locked);case SetNodeMetadataCommand() when setNodeMetadata != null:
return setNodeMetadata(_that.artboardId,_that.nodeId,_that.key,_that.value);case DuplicateDesignNodeCommand() when duplicateDesignNode != null:
return duplicateDesignNode(_that.artboardId,_that.sourceNodeId,_that.duplicate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class CreateArtboardCommand extends DocumentCommand {
  const CreateArtboardCommand({required this.artboard, final  String? $type}): $type = $type ?? 'createArtboard',super._();
  factory CreateArtboardCommand.fromJson(Map<String, dynamic> json) => _$CreateArtboardCommandFromJson(json);

 final  Artboard artboard;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateArtboardCommandCopyWith<CreateArtboardCommand> get copyWith => _$CreateArtboardCommandCopyWithImpl<CreateArtboardCommand>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateArtboardCommandToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateArtboardCommand&&(identical(other.artboard, artboard) || other.artboard == artboard));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,artboard);

@override
String toString() {
  return 'DocumentCommand.createArtboard(artboard: $artboard)';
}


}

/// @nodoc
abstract mixin class $CreateArtboardCommandCopyWith<$Res> implements $DocumentCommandCopyWith<$Res> {
  factory $CreateArtboardCommandCopyWith(CreateArtboardCommand value, $Res Function(CreateArtboardCommand) _then) = _$CreateArtboardCommandCopyWithImpl;
@useResult
$Res call({
 Artboard artboard
});


$ArtboardCopyWith<$Res> get artboard;

}
/// @nodoc
class _$CreateArtboardCommandCopyWithImpl<$Res>
    implements $CreateArtboardCommandCopyWith<$Res> {
  _$CreateArtboardCommandCopyWithImpl(this._self, this._then);

  final CreateArtboardCommand _self;
  final $Res Function(CreateArtboardCommand) _then;

/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? artboard = null,}) {
  return _then(CreateArtboardCommand(
artboard: null == artboard ? _self.artboard : artboard // ignore: cast_nullable_to_non_nullable
as Artboard,
  ));
}

/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ArtboardCopyWith<$Res> get artboard {
  
  return $ArtboardCopyWith<$Res>(_self.artboard, (value) {
    return _then(_self.copyWith(artboard: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class DeleteArtboardCommand extends DocumentCommand {
  const DeleteArtboardCommand({required this.artboardId, final  String? $type}): $type = $type ?? 'deleteArtboard',super._();
  factory DeleteArtboardCommand.fromJson(Map<String, dynamic> json) => _$DeleteArtboardCommandFromJson(json);

 final  String artboardId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteArtboardCommandCopyWith<DeleteArtboardCommand> get copyWith => _$DeleteArtboardCommandCopyWithImpl<DeleteArtboardCommand>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeleteArtboardCommandToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteArtboardCommand&&(identical(other.artboardId, artboardId) || other.artboardId == artboardId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,artboardId);

@override
String toString() {
  return 'DocumentCommand.deleteArtboard(artboardId: $artboardId)';
}


}

/// @nodoc
abstract mixin class $DeleteArtboardCommandCopyWith<$Res> implements $DocumentCommandCopyWith<$Res> {
  factory $DeleteArtboardCommandCopyWith(DeleteArtboardCommand value, $Res Function(DeleteArtboardCommand) _then) = _$DeleteArtboardCommandCopyWithImpl;
@useResult
$Res call({
 String artboardId
});




}
/// @nodoc
class _$DeleteArtboardCommandCopyWithImpl<$Res>
    implements $DeleteArtboardCommandCopyWith<$Res> {
  _$DeleteArtboardCommandCopyWithImpl(this._self, this._then);

  final DeleteArtboardCommand _self;
  final $Res Function(DeleteArtboardCommand) _then;

/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? artboardId = null,}) {
  return _then(DeleteArtboardCommand(
artboardId: null == artboardId ? _self.artboardId : artboardId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class CreateLayerCommand extends DocumentCommand {
  const CreateLayerCommand({required this.artboardId, this.parentLayerId, required this.layer, this.index, final  String? $type}): $type = $type ?? 'createLayer',super._();
  factory CreateLayerCommand.fromJson(Map<String, dynamic> json) => _$CreateLayerCommandFromJson(json);

 final  String artboardId;
 final  String? parentLayerId;
 final  LayerModel layer;
 final  int? index;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateLayerCommandCopyWith<CreateLayerCommand> get copyWith => _$CreateLayerCommandCopyWithImpl<CreateLayerCommand>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateLayerCommandToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateLayerCommand&&(identical(other.artboardId, artboardId) || other.artboardId == artboardId)&&(identical(other.parentLayerId, parentLayerId) || other.parentLayerId == parentLayerId)&&(identical(other.layer, layer) || other.layer == layer)&&(identical(other.index, index) || other.index == index));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,artboardId,parentLayerId,layer,index);

@override
String toString() {
  return 'DocumentCommand.createLayer(artboardId: $artboardId, parentLayerId: $parentLayerId, layer: $layer, index: $index)';
}


}

/// @nodoc
abstract mixin class $CreateLayerCommandCopyWith<$Res> implements $DocumentCommandCopyWith<$Res> {
  factory $CreateLayerCommandCopyWith(CreateLayerCommand value, $Res Function(CreateLayerCommand) _then) = _$CreateLayerCommandCopyWithImpl;
@useResult
$Res call({
 String artboardId, String? parentLayerId, LayerModel layer, int? index
});


$LayerModelCopyWith<$Res> get layer;

}
/// @nodoc
class _$CreateLayerCommandCopyWithImpl<$Res>
    implements $CreateLayerCommandCopyWith<$Res> {
  _$CreateLayerCommandCopyWithImpl(this._self, this._then);

  final CreateLayerCommand _self;
  final $Res Function(CreateLayerCommand) _then;

/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? artboardId = null,Object? parentLayerId = freezed,Object? layer = null,Object? index = freezed,}) {
  return _then(CreateLayerCommand(
artboardId: null == artboardId ? _self.artboardId : artboardId // ignore: cast_nullable_to_non_nullable
as String,parentLayerId: freezed == parentLayerId ? _self.parentLayerId : parentLayerId // ignore: cast_nullable_to_non_nullable
as String?,layer: null == layer ? _self.layer : layer // ignore: cast_nullable_to_non_nullable
as LayerModel,index: freezed == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LayerModelCopyWith<$Res> get layer {
  
  return $LayerModelCopyWith<$Res>(_self.layer, (value) {
    return _then(_self.copyWith(layer: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class DeleteLayerCommand extends DocumentCommand {
  const DeleteLayerCommand({required this.artboardId, required this.layerId, final  String? $type}): $type = $type ?? 'deleteLayer',super._();
  factory DeleteLayerCommand.fromJson(Map<String, dynamic> json) => _$DeleteLayerCommandFromJson(json);

 final  String artboardId;
 final  String layerId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteLayerCommandCopyWith<DeleteLayerCommand> get copyWith => _$DeleteLayerCommandCopyWithImpl<DeleteLayerCommand>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeleteLayerCommandToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteLayerCommand&&(identical(other.artboardId, artboardId) || other.artboardId == artboardId)&&(identical(other.layerId, layerId) || other.layerId == layerId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,artboardId,layerId);

@override
String toString() {
  return 'DocumentCommand.deleteLayer(artboardId: $artboardId, layerId: $layerId)';
}


}

/// @nodoc
abstract mixin class $DeleteLayerCommandCopyWith<$Res> implements $DocumentCommandCopyWith<$Res> {
  factory $DeleteLayerCommandCopyWith(DeleteLayerCommand value, $Res Function(DeleteLayerCommand) _then) = _$DeleteLayerCommandCopyWithImpl;
@useResult
$Res call({
 String artboardId, String layerId
});




}
/// @nodoc
class _$DeleteLayerCommandCopyWithImpl<$Res>
    implements $DeleteLayerCommandCopyWith<$Res> {
  _$DeleteLayerCommandCopyWithImpl(this._self, this._then);

  final DeleteLayerCommand _self;
  final $Res Function(DeleteLayerCommand) _then;

/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? artboardId = null,Object? layerId = null,}) {
  return _then(DeleteLayerCommand(
artboardId: null == artboardId ? _self.artboardId : artboardId // ignore: cast_nullable_to_non_nullable
as String,layerId: null == layerId ? _self.layerId : layerId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class MoveLayerCommand extends DocumentCommand {
  const MoveLayerCommand({required this.artboardId, required this.layerId, required this.newParentId, required this.index, final  String? $type}): $type = $type ?? 'moveLayer',super._();
  factory MoveLayerCommand.fromJson(Map<String, dynamic> json) => _$MoveLayerCommandFromJson(json);

 final  String artboardId;
 final  String layerId;
 final  String newParentId;
 final  int index;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MoveLayerCommandCopyWith<MoveLayerCommand> get copyWith => _$MoveLayerCommandCopyWithImpl<MoveLayerCommand>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MoveLayerCommandToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoveLayerCommand&&(identical(other.artboardId, artboardId) || other.artboardId == artboardId)&&(identical(other.layerId, layerId) || other.layerId == layerId)&&(identical(other.newParentId, newParentId) || other.newParentId == newParentId)&&(identical(other.index, index) || other.index == index));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,artboardId,layerId,newParentId,index);

@override
String toString() {
  return 'DocumentCommand.moveLayer(artboardId: $artboardId, layerId: $layerId, newParentId: $newParentId, index: $index)';
}


}

/// @nodoc
abstract mixin class $MoveLayerCommandCopyWith<$Res> implements $DocumentCommandCopyWith<$Res> {
  factory $MoveLayerCommandCopyWith(MoveLayerCommand value, $Res Function(MoveLayerCommand) _then) = _$MoveLayerCommandCopyWithImpl;
@useResult
$Res call({
 String artboardId, String layerId, String newParentId, int index
});




}
/// @nodoc
class _$MoveLayerCommandCopyWithImpl<$Res>
    implements $MoveLayerCommandCopyWith<$Res> {
  _$MoveLayerCommandCopyWithImpl(this._self, this._then);

  final MoveLayerCommand _self;
  final $Res Function(MoveLayerCommand) _then;

/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? artboardId = null,Object? layerId = null,Object? newParentId = null,Object? index = null,}) {
  return _then(MoveLayerCommand(
artboardId: null == artboardId ? _self.artboardId : artboardId // ignore: cast_nullable_to_non_nullable
as String,layerId: null == layerId ? _self.layerId : layerId // ignore: cast_nullable_to_non_nullable
as String,newParentId: null == newParentId ? _self.newParentId : newParentId // ignore: cast_nullable_to_non_nullable
as String,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class RenameLayerCommand extends DocumentCommand {
  const RenameLayerCommand({required this.artboardId, required this.layerId, required this.name, final  String? $type}): $type = $type ?? 'renameLayer',super._();
  factory RenameLayerCommand.fromJson(Map<String, dynamic> json) => _$RenameLayerCommandFromJson(json);

 final  String artboardId;
 final  String layerId;
 final  String name;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RenameLayerCommandCopyWith<RenameLayerCommand> get copyWith => _$RenameLayerCommandCopyWithImpl<RenameLayerCommand>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RenameLayerCommandToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RenameLayerCommand&&(identical(other.artboardId, artboardId) || other.artboardId == artboardId)&&(identical(other.layerId, layerId) || other.layerId == layerId)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,artboardId,layerId,name);

@override
String toString() {
  return 'DocumentCommand.renameLayer(artboardId: $artboardId, layerId: $layerId, name: $name)';
}


}

/// @nodoc
abstract mixin class $RenameLayerCommandCopyWith<$Res> implements $DocumentCommandCopyWith<$Res> {
  factory $RenameLayerCommandCopyWith(RenameLayerCommand value, $Res Function(RenameLayerCommand) _then) = _$RenameLayerCommandCopyWithImpl;
@useResult
$Res call({
 String artboardId, String layerId, String name
});




}
/// @nodoc
class _$RenameLayerCommandCopyWithImpl<$Res>
    implements $RenameLayerCommandCopyWith<$Res> {
  _$RenameLayerCommandCopyWithImpl(this._self, this._then);

  final RenameLayerCommand _self;
  final $Res Function(RenameLayerCommand) _then;

/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? artboardId = null,Object? layerId = null,Object? name = null,}) {
  return _then(RenameLayerCommand(
artboardId: null == artboardId ? _self.artboardId : artboardId // ignore: cast_nullable_to_non_nullable
as String,layerId: null == layerId ? _self.layerId : layerId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class SetLayerMetadataCommand extends DocumentCommand {
  const SetLayerMetadataCommand({required this.artboardId, required this.layerId, required this.key, this.value, final  String? $type}): $type = $type ?? 'setLayerMetadata',super._();
  factory SetLayerMetadataCommand.fromJson(Map<String, dynamic> json) => _$SetLayerMetadataCommandFromJson(json);

 final  String artboardId;
 final  String layerId;
 final  String key;
 final  Object? value;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetLayerMetadataCommandCopyWith<SetLayerMetadataCommand> get copyWith => _$SetLayerMetadataCommandCopyWithImpl<SetLayerMetadataCommand>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SetLayerMetadataCommandToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetLayerMetadataCommand&&(identical(other.artboardId, artboardId) || other.artboardId == artboardId)&&(identical(other.layerId, layerId) || other.layerId == layerId)&&(identical(other.key, key) || other.key == key)&&const DeepCollectionEquality().equals(other.value, value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,artboardId,layerId,key,const DeepCollectionEquality().hash(value));

@override
String toString() {
  return 'DocumentCommand.setLayerMetadata(artboardId: $artboardId, layerId: $layerId, key: $key, value: $value)';
}


}

/// @nodoc
abstract mixin class $SetLayerMetadataCommandCopyWith<$Res> implements $DocumentCommandCopyWith<$Res> {
  factory $SetLayerMetadataCommandCopyWith(SetLayerMetadataCommand value, $Res Function(SetLayerMetadataCommand) _then) = _$SetLayerMetadataCommandCopyWithImpl;
@useResult
$Res call({
 String artboardId, String layerId, String key, Object? value
});




}
/// @nodoc
class _$SetLayerMetadataCommandCopyWithImpl<$Res>
    implements $SetLayerMetadataCommandCopyWith<$Res> {
  _$SetLayerMetadataCommandCopyWithImpl(this._self, this._then);

  final SetLayerMetadataCommand _self;
  final $Res Function(SetLayerMetadataCommand) _then;

/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? artboardId = null,Object? layerId = null,Object? key = null,Object? value = freezed,}) {
  return _then(SetLayerMetadataCommand(
artboardId: null == artboardId ? _self.artboardId : artboardId // ignore: cast_nullable_to_non_nullable
as String,layerId: null == layerId ? _self.layerId : layerId // ignore: cast_nullable_to_non_nullable
as String,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,value: freezed == value ? _self.value : value ,
  ));
}


}

/// @nodoc
@JsonSerializable()

class ImportAssetCommand extends DocumentCommand {
  const ImportAssetCommand({required this.asset, final  String? $type}): $type = $type ?? 'importAsset',super._();
  factory ImportAssetCommand.fromJson(Map<String, dynamic> json) => _$ImportAssetCommandFromJson(json);

 final  AssetRecord asset;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImportAssetCommandCopyWith<ImportAssetCommand> get copyWith => _$ImportAssetCommandCopyWithImpl<ImportAssetCommand>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ImportAssetCommandToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImportAssetCommand&&(identical(other.asset, asset) || other.asset == asset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,asset);

@override
String toString() {
  return 'DocumentCommand.importAsset(asset: $asset)';
}


}

/// @nodoc
abstract mixin class $ImportAssetCommandCopyWith<$Res> implements $DocumentCommandCopyWith<$Res> {
  factory $ImportAssetCommandCopyWith(ImportAssetCommand value, $Res Function(ImportAssetCommand) _then) = _$ImportAssetCommandCopyWithImpl;
@useResult
$Res call({
 AssetRecord asset
});


$AssetRecordCopyWith<$Res> get asset;

}
/// @nodoc
class _$ImportAssetCommandCopyWithImpl<$Res>
    implements $ImportAssetCommandCopyWith<$Res> {
  _$ImportAssetCommandCopyWithImpl(this._self, this._then);

  final ImportAssetCommand _self;
  final $Res Function(ImportAssetCommand) _then;

/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? asset = null,}) {
  return _then(ImportAssetCommand(
asset: null == asset ? _self.asset : asset // ignore: cast_nullable_to_non_nullable
as AssetRecord,
  ));
}

/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssetRecordCopyWith<$Res> get asset {
  
  return $AssetRecordCopyWith<$Res>(_self.asset, (value) {
    return _then(_self.copyWith(asset: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class RemoveAssetCommand extends DocumentCommand {
  const RemoveAssetCommand({required this.assetId, final  String? $type}): $type = $type ?? 'removeAsset',super._();
  factory RemoveAssetCommand.fromJson(Map<String, dynamic> json) => _$RemoveAssetCommandFromJson(json);

 final  String assetId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoveAssetCommandCopyWith<RemoveAssetCommand> get copyWith => _$RemoveAssetCommandCopyWithImpl<RemoveAssetCommand>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RemoveAssetCommandToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoveAssetCommand&&(identical(other.assetId, assetId) || other.assetId == assetId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,assetId);

@override
String toString() {
  return 'DocumentCommand.removeAsset(assetId: $assetId)';
}


}

/// @nodoc
abstract mixin class $RemoveAssetCommandCopyWith<$Res> implements $DocumentCommandCopyWith<$Res> {
  factory $RemoveAssetCommandCopyWith(RemoveAssetCommand value, $Res Function(RemoveAssetCommand) _then) = _$RemoveAssetCommandCopyWithImpl;
@useResult
$Res call({
 String assetId
});




}
/// @nodoc
class _$RemoveAssetCommandCopyWithImpl<$Res>
    implements $RemoveAssetCommandCopyWith<$Res> {
  _$RemoveAssetCommandCopyWithImpl(this._self, this._then);

  final RemoveAssetCommand _self;
  final $Res Function(RemoveAssetCommand) _then;

/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? assetId = null,}) {
  return _then(RemoveAssetCommand(
assetId: null == assetId ? _self.assetId : assetId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class ApplyMaskCommand extends DocumentCommand {
  const ApplyMaskCommand({required this.targetId, required this.stack, final  String? $type}): $type = $type ?? 'applyMask',super._();
  factory ApplyMaskCommand.fromJson(Map<String, dynamic> json) => _$ApplyMaskCommandFromJson(json);

 final  String targetId;
 final  MaskStack stack;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplyMaskCommandCopyWith<ApplyMaskCommand> get copyWith => _$ApplyMaskCommandCopyWithImpl<ApplyMaskCommand>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApplyMaskCommandToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplyMaskCommand&&(identical(other.targetId, targetId) || other.targetId == targetId)&&(identical(other.stack, stack) || other.stack == stack));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,targetId,stack);

@override
String toString() {
  return 'DocumentCommand.applyMask(targetId: $targetId, stack: $stack)';
}


}

/// @nodoc
abstract mixin class $ApplyMaskCommandCopyWith<$Res> implements $DocumentCommandCopyWith<$Res> {
  factory $ApplyMaskCommandCopyWith(ApplyMaskCommand value, $Res Function(ApplyMaskCommand) _then) = _$ApplyMaskCommandCopyWithImpl;
@useResult
$Res call({
 String targetId, MaskStack stack
});


$MaskStackCopyWith<$Res> get stack;

}
/// @nodoc
class _$ApplyMaskCommandCopyWithImpl<$Res>
    implements $ApplyMaskCommandCopyWith<$Res> {
  _$ApplyMaskCommandCopyWithImpl(this._self, this._then);

  final ApplyMaskCommand _self;
  final $Res Function(ApplyMaskCommand) _then;

/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? targetId = null,Object? stack = null,}) {
  return _then(ApplyMaskCommand(
targetId: null == targetId ? _self.targetId : targetId // ignore: cast_nullable_to_non_nullable
as String,stack: null == stack ? _self.stack : stack // ignore: cast_nullable_to_non_nullable
as MaskStack,
  ));
}

/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MaskStackCopyWith<$Res> get stack {
  
  return $MaskStackCopyWith<$Res>(_self.stack, (value) {
    return _then(_self.copyWith(stack: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class RemoveMaskCommand extends DocumentCommand {
  const RemoveMaskCommand({required this.targetId, final  String? $type}): $type = $type ?? 'removeMask',super._();
  factory RemoveMaskCommand.fromJson(Map<String, dynamic> json) => _$RemoveMaskCommandFromJson(json);

 final  String targetId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoveMaskCommandCopyWith<RemoveMaskCommand> get copyWith => _$RemoveMaskCommandCopyWithImpl<RemoveMaskCommand>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RemoveMaskCommandToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoveMaskCommand&&(identical(other.targetId, targetId) || other.targetId == targetId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,targetId);

@override
String toString() {
  return 'DocumentCommand.removeMask(targetId: $targetId)';
}


}

/// @nodoc
abstract mixin class $RemoveMaskCommandCopyWith<$Res> implements $DocumentCommandCopyWith<$Res> {
  factory $RemoveMaskCommandCopyWith(RemoveMaskCommand value, $Res Function(RemoveMaskCommand) _then) = _$RemoveMaskCommandCopyWithImpl;
@useResult
$Res call({
 String targetId
});




}
/// @nodoc
class _$RemoveMaskCommandCopyWithImpl<$Res>
    implements $RemoveMaskCommandCopyWith<$Res> {
  _$RemoveMaskCommandCopyWithImpl(this._self, this._then);

  final RemoveMaskCommand _self;
  final $Res Function(RemoveMaskCommand) _then;

/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? targetId = null,}) {
  return _then(RemoveMaskCommand(
targetId: null == targetId ? _self.targetId : targetId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class UpdateMetadataCommand extends DocumentCommand {
  const UpdateMetadataCommand({required this.metadata, final  String? $type}): $type = $type ?? 'updateMetadata',super._();
  factory UpdateMetadataCommand.fromJson(Map<String, dynamic> json) => _$UpdateMetadataCommandFromJson(json);

 final  DocumentMetadata metadata;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateMetadataCommandCopyWith<UpdateMetadataCommand> get copyWith => _$UpdateMetadataCommandCopyWithImpl<UpdateMetadataCommand>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateMetadataCommandToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateMetadataCommand&&(identical(other.metadata, metadata) || other.metadata == metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,metadata);

@override
String toString() {
  return 'DocumentCommand.updateMetadata(metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $UpdateMetadataCommandCopyWith<$Res> implements $DocumentCommandCopyWith<$Res> {
  factory $UpdateMetadataCommandCopyWith(UpdateMetadataCommand value, $Res Function(UpdateMetadataCommand) _then) = _$UpdateMetadataCommandCopyWithImpl;
@useResult
$Res call({
 DocumentMetadata metadata
});


$DocumentMetadataCopyWith<$Res> get metadata;

}
/// @nodoc
class _$UpdateMetadataCommandCopyWithImpl<$Res>
    implements $UpdateMetadataCommandCopyWith<$Res> {
  _$UpdateMetadataCommandCopyWithImpl(this._self, this._then);

  final UpdateMetadataCommand _self;
  final $Res Function(UpdateMetadataCommand) _then;

/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? metadata = null,}) {
  return _then(UpdateMetadataCommand(
metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as DocumentMetadata,
  ));
}

/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentMetadataCopyWith<$Res> get metadata {
  
  return $DocumentMetadataCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class UpdateSettingsCommand extends DocumentCommand {
  const UpdateSettingsCommand({required this.settings, final  String? $type}): $type = $type ?? 'updateSettings',super._();
  factory UpdateSettingsCommand.fromJson(Map<String, dynamic> json) => _$UpdateSettingsCommandFromJson(json);

 final  DocumentSettings settings;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateSettingsCommandCopyWith<UpdateSettingsCommand> get copyWith => _$UpdateSettingsCommandCopyWithImpl<UpdateSettingsCommand>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateSettingsCommandToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateSettingsCommand&&(identical(other.settings, settings) || other.settings == settings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,settings);

@override
String toString() {
  return 'DocumentCommand.updateSettings(settings: $settings)';
}


}

/// @nodoc
abstract mixin class $UpdateSettingsCommandCopyWith<$Res> implements $DocumentCommandCopyWith<$Res> {
  factory $UpdateSettingsCommandCopyWith(UpdateSettingsCommand value, $Res Function(UpdateSettingsCommand) _then) = _$UpdateSettingsCommandCopyWithImpl;
@useResult
$Res call({
 DocumentSettings settings
});


$DocumentSettingsCopyWith<$Res> get settings;

}
/// @nodoc
class _$UpdateSettingsCommandCopyWithImpl<$Res>
    implements $UpdateSettingsCommandCopyWith<$Res> {
  _$UpdateSettingsCommandCopyWithImpl(this._self, this._then);

  final UpdateSettingsCommand _self;
  final $Res Function(UpdateSettingsCommand) _then;

/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? settings = null,}) {
  return _then(UpdateSettingsCommand(
settings: null == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as DocumentSettings,
  ));
}

/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentSettingsCopyWith<$Res> get settings {
  
  return $DocumentSettingsCopyWith<$Res>(_self.settings, (value) {
    return _then(_self.copyWith(settings: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class UpdateToolStateCommand extends DocumentCommand {
  const UpdateToolStateCommand({required this.state, final  String? $type}): $type = $type ?? 'updateToolState',super._();
  factory UpdateToolStateCommand.fromJson(Map<String, dynamic> json) => _$UpdateToolStateCommandFromJson(json);

 final  ToolStateExtension state;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateToolStateCommandCopyWith<UpdateToolStateCommand> get copyWith => _$UpdateToolStateCommandCopyWithImpl<UpdateToolStateCommand>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateToolStateCommandToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateToolStateCommand&&(identical(other.state, state) || other.state == state));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,state);

@override
String toString() {
  return 'DocumentCommand.updateToolState(state: $state)';
}


}

/// @nodoc
abstract mixin class $UpdateToolStateCommandCopyWith<$Res> implements $DocumentCommandCopyWith<$Res> {
  factory $UpdateToolStateCommandCopyWith(UpdateToolStateCommand value, $Res Function(UpdateToolStateCommand) _then) = _$UpdateToolStateCommandCopyWithImpl;
@useResult
$Res call({
 ToolStateExtension state
});


$ToolStateExtensionCopyWith<$Res> get state;

}
/// @nodoc
class _$UpdateToolStateCommandCopyWithImpl<$Res>
    implements $UpdateToolStateCommandCopyWith<$Res> {
  _$UpdateToolStateCommandCopyWithImpl(this._self, this._then);

  final UpdateToolStateCommand _self;
  final $Res Function(UpdateToolStateCommand) _then;

/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? state = null,}) {
  return _then(UpdateToolStateCommand(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as ToolStateExtension,
  ));
}

/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ToolStateExtensionCopyWith<$Res> get state {
  
  return $ToolStateExtensionCopyWith<$Res>(_self.state, (value) {
    return _then(_self.copyWith(state: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class UpdateViewportCommand extends DocumentCommand {
  const UpdateViewportCommand({required this.viewport, final  String? $type}): $type = $type ?? 'updateViewport',super._();
  factory UpdateViewportCommand.fromJson(Map<String, dynamic> json) => _$UpdateViewportCommandFromJson(json);

 final  WorkspaceViewportState viewport;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateViewportCommandCopyWith<UpdateViewportCommand> get copyWith => _$UpdateViewportCommandCopyWithImpl<UpdateViewportCommand>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateViewportCommandToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateViewportCommand&&(identical(other.viewport, viewport) || other.viewport == viewport));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,viewport);

@override
String toString() {
  return 'DocumentCommand.updateViewport(viewport: $viewport)';
}


}

/// @nodoc
abstract mixin class $UpdateViewportCommandCopyWith<$Res> implements $DocumentCommandCopyWith<$Res> {
  factory $UpdateViewportCommandCopyWith(UpdateViewportCommand value, $Res Function(UpdateViewportCommand) _then) = _$UpdateViewportCommandCopyWithImpl;
@useResult
$Res call({
 WorkspaceViewportState viewport
});


$WorkspaceViewportStateCopyWith<$Res> get viewport;

}
/// @nodoc
class _$UpdateViewportCommandCopyWithImpl<$Res>
    implements $UpdateViewportCommandCopyWith<$Res> {
  _$UpdateViewportCommandCopyWithImpl(this._self, this._then);

  final UpdateViewportCommand _self;
  final $Res Function(UpdateViewportCommand) _then;

/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? viewport = null,}) {
  return _then(UpdateViewportCommand(
viewport: null == viewport ? _self.viewport : viewport // ignore: cast_nullable_to_non_nullable
as WorkspaceViewportState,
  ));
}

/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkspaceViewportStateCopyWith<$Res> get viewport {
  
  return $WorkspaceViewportStateCopyWith<$Res>(_self.viewport, (value) {
    return _then(_self.copyWith(viewport: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class ChangeColourCommand extends DocumentCommand {
  const ChangeColourCommand({required this.artboardId, required this.layerId, @JsonKey(fromJson: _colourOpFromJson, toJson: _colourOpToJson) required this.operation, required this.colourHex, final  String? $type}): $type = $type ?? 'changeColour',super._();
  factory ChangeColourCommand.fromJson(Map<String, dynamic> json) => _$ChangeColourCommandFromJson(json);

 final  String artboardId;
 final  String layerId;
@JsonKey(fromJson: _colourOpFromJson, toJson: _colourOpToJson) final  ColourOperation operation;
 final  String colourHex;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeColourCommandCopyWith<ChangeColourCommand> get copyWith => _$ChangeColourCommandCopyWithImpl<ChangeColourCommand>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChangeColourCommandToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeColourCommand&&(identical(other.artboardId, artboardId) || other.artboardId == artboardId)&&(identical(other.layerId, layerId) || other.layerId == layerId)&&(identical(other.operation, operation) || other.operation == operation)&&(identical(other.colourHex, colourHex) || other.colourHex == colourHex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,artboardId,layerId,operation,colourHex);

@override
String toString() {
  return 'DocumentCommand.changeColour(artboardId: $artboardId, layerId: $layerId, operation: $operation, colourHex: $colourHex)';
}


}

/// @nodoc
abstract mixin class $ChangeColourCommandCopyWith<$Res> implements $DocumentCommandCopyWith<$Res> {
  factory $ChangeColourCommandCopyWith(ChangeColourCommand value, $Res Function(ChangeColourCommand) _then) = _$ChangeColourCommandCopyWithImpl;
@useResult
$Res call({
 String artboardId, String layerId,@JsonKey(fromJson: _colourOpFromJson, toJson: _colourOpToJson) ColourOperation operation, String colourHex
});




}
/// @nodoc
class _$ChangeColourCommandCopyWithImpl<$Res>
    implements $ChangeColourCommandCopyWith<$Res> {
  _$ChangeColourCommandCopyWithImpl(this._self, this._then);

  final ChangeColourCommand _self;
  final $Res Function(ChangeColourCommand) _then;

/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? artboardId = null,Object? layerId = null,Object? operation = null,Object? colourHex = null,}) {
  return _then(ChangeColourCommand(
artboardId: null == artboardId ? _self.artboardId : artboardId // ignore: cast_nullable_to_non_nullable
as String,layerId: null == layerId ? _self.layerId : layerId // ignore: cast_nullable_to_non_nullable
as String,operation: null == operation ? _self.operation : operation // ignore: cast_nullable_to_non_nullable
as ColourOperation,colourHex: null == colourHex ? _self.colourHex : colourHex // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class RepeatPatternCommand extends DocumentCommand {
  const RepeatPatternCommand({required this.artboardId, required this.layerId, @JsonKey(fromJson: _repeatFromJson, toJson: _repeatToJson) required this.repeat, final  Map<String, Object?> parameters = const <String, Object?>{}, final  String? $type}): _parameters = parameters,$type = $type ?? 'repeatPattern',super._();
  factory RepeatPatternCommand.fromJson(Map<String, dynamic> json) => _$RepeatPatternCommandFromJson(json);

 final  String artboardId;
 final  String layerId;
@JsonKey(fromJson: _repeatFromJson, toJson: _repeatToJson) final  RepeatType repeat;
 final  Map<String, Object?> _parameters;
@JsonKey() Map<String, Object?> get parameters {
  if (_parameters is EqualUnmodifiableMapView) return _parameters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_parameters);
}


@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RepeatPatternCommandCopyWith<RepeatPatternCommand> get copyWith => _$RepeatPatternCommandCopyWithImpl<RepeatPatternCommand>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RepeatPatternCommandToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RepeatPatternCommand&&(identical(other.artboardId, artboardId) || other.artboardId == artboardId)&&(identical(other.layerId, layerId) || other.layerId == layerId)&&(identical(other.repeat, repeat) || other.repeat == repeat)&&const DeepCollectionEquality().equals(other._parameters, _parameters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,artboardId,layerId,repeat,const DeepCollectionEquality().hash(_parameters));

@override
String toString() {
  return 'DocumentCommand.repeatPattern(artboardId: $artboardId, layerId: $layerId, repeat: $repeat, parameters: $parameters)';
}


}

/// @nodoc
abstract mixin class $RepeatPatternCommandCopyWith<$Res> implements $DocumentCommandCopyWith<$Res> {
  factory $RepeatPatternCommandCopyWith(RepeatPatternCommand value, $Res Function(RepeatPatternCommand) _then) = _$RepeatPatternCommandCopyWithImpl;
@useResult
$Res call({
 String artboardId, String layerId,@JsonKey(fromJson: _repeatFromJson, toJson: _repeatToJson) RepeatType repeat, Map<String, Object?> parameters
});




}
/// @nodoc
class _$RepeatPatternCommandCopyWithImpl<$Res>
    implements $RepeatPatternCommandCopyWith<$Res> {
  _$RepeatPatternCommandCopyWithImpl(this._self, this._then);

  final RepeatPatternCommand _self;
  final $Res Function(RepeatPatternCommand) _then;

/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? artboardId = null,Object? layerId = null,Object? repeat = null,Object? parameters = null,}) {
  return _then(RepeatPatternCommand(
artboardId: null == artboardId ? _self.artboardId : artboardId // ignore: cast_nullable_to_non_nullable
as String,layerId: null == layerId ? _self.layerId : layerId // ignore: cast_nullable_to_non_nullable
as String,repeat: null == repeat ? _self.repeat : repeat // ignore: cast_nullable_to_non_nullable
as RepeatType,parameters: null == parameters ? _self._parameters : parameters // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class SetLockCommand extends DocumentCommand {
  const SetLockCommand({required this.lock, final  String? $type}): $type = $type ?? 'setLock',super._();
  factory SetLockCommand.fromJson(Map<String, dynamic> json) => _$SetLockCommandFromJson(json);

 final  LockState lock;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetLockCommandCopyWith<SetLockCommand> get copyWith => _$SetLockCommandCopyWithImpl<SetLockCommand>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SetLockCommandToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetLockCommand&&(identical(other.lock, lock) || other.lock == lock));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lock);

@override
String toString() {
  return 'DocumentCommand.setLock(lock: $lock)';
}


}

/// @nodoc
abstract mixin class $SetLockCommandCopyWith<$Res> implements $DocumentCommandCopyWith<$Res> {
  factory $SetLockCommandCopyWith(SetLockCommand value, $Res Function(SetLockCommand) _then) = _$SetLockCommandCopyWithImpl;
@useResult
$Res call({
 LockState lock
});


$LockStateCopyWith<$Res> get lock;

}
/// @nodoc
class _$SetLockCommandCopyWithImpl<$Res>
    implements $SetLockCommandCopyWith<$Res> {
  _$SetLockCommandCopyWithImpl(this._self, this._then);

  final SetLockCommand _self;
  final $Res Function(SetLockCommand) _then;

/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? lock = null,}) {
  return _then(SetLockCommand(
lock: null == lock ? _self.lock : lock // ignore: cast_nullable_to_non_nullable
as LockState,
  ));
}

/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LockStateCopyWith<$Res> get lock {
  
  return $LockStateCopyWith<$Res>(_self.lock, (value) {
    return _then(_self.copyWith(lock: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class ReleaseLockCommand extends DocumentCommand {
  const ReleaseLockCommand({required this.scope, this.targetId, final  String? $type}): $type = $type ?? 'releaseLock',super._();
  factory ReleaseLockCommand.fromJson(Map<String, dynamic> json) => _$ReleaseLockCommandFromJson(json);

 final  LockScope scope;
 final  String? targetId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReleaseLockCommandCopyWith<ReleaseLockCommand> get copyWith => _$ReleaseLockCommandCopyWithImpl<ReleaseLockCommand>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReleaseLockCommandToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReleaseLockCommand&&(identical(other.scope, scope) || other.scope == scope)&&(identical(other.targetId, targetId) || other.targetId == targetId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,scope,targetId);

@override
String toString() {
  return 'DocumentCommand.releaseLock(scope: $scope, targetId: $targetId)';
}


}

/// @nodoc
abstract mixin class $ReleaseLockCommandCopyWith<$Res> implements $DocumentCommandCopyWith<$Res> {
  factory $ReleaseLockCommandCopyWith(ReleaseLockCommand value, $Res Function(ReleaseLockCommand) _then) = _$ReleaseLockCommandCopyWithImpl;
@useResult
$Res call({
 LockScope scope, String? targetId
});




}
/// @nodoc
class _$ReleaseLockCommandCopyWithImpl<$Res>
    implements $ReleaseLockCommandCopyWith<$Res> {
  _$ReleaseLockCommandCopyWithImpl(this._self, this._then);

  final ReleaseLockCommand _self;
  final $Res Function(ReleaseLockCommand) _then;

/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? scope = null,Object? targetId = freezed,}) {
  return _then(ReleaseLockCommand(
scope: null == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as LockScope,targetId: freezed == targetId ? _self.targetId : targetId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class UpdatePluginDataCommand extends DocumentCommand {
  const UpdatePluginDataCommand({required this.pluginId, required final  Map<String, Object?> data, final  String? $type}): _data = data,$type = $type ?? 'updatePluginData',super._();
  factory UpdatePluginDataCommand.fromJson(Map<String, dynamic> json) => _$UpdatePluginDataCommandFromJson(json);

 final  String pluginId;
 final  Map<String, Object?> _data;
 Map<String, Object?> get data {
  if (_data is EqualUnmodifiableMapView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_data);
}


@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdatePluginDataCommandCopyWith<UpdatePluginDataCommand> get copyWith => _$UpdatePluginDataCommandCopyWithImpl<UpdatePluginDataCommand>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdatePluginDataCommandToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdatePluginDataCommand&&(identical(other.pluginId, pluginId) || other.pluginId == pluginId)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pluginId,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'DocumentCommand.updatePluginData(pluginId: $pluginId, data: $data)';
}


}

/// @nodoc
abstract mixin class $UpdatePluginDataCommandCopyWith<$Res> implements $DocumentCommandCopyWith<$Res> {
  factory $UpdatePluginDataCommandCopyWith(UpdatePluginDataCommand value, $Res Function(UpdatePluginDataCommand) _then) = _$UpdatePluginDataCommandCopyWithImpl;
@useResult
$Res call({
 String pluginId, Map<String, Object?> data
});




}
/// @nodoc
class _$UpdatePluginDataCommandCopyWithImpl<$Res>
    implements $UpdatePluginDataCommandCopyWith<$Res> {
  _$UpdatePluginDataCommandCopyWithImpl(this._self, this._then);

  final UpdatePluginDataCommand _self;
  final $Res Function(UpdatePluginDataCommand) _then;

/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? pluginId = null,Object? data = null,}) {
  return _then(UpdatePluginDataCommand(
pluginId: null == pluginId ? _self.pluginId : pluginId // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class CustomCommand extends DocumentCommand {
  const CustomCommand({required this.namespace, required this.kind, final  Map<String, Object?> payload = const <String, Object?>{}, final  List<String> affectedIds = const <String>[], final  String? $type}): _payload = payload,_affectedIds = affectedIds,$type = $type ?? 'custom',super._();
  factory CustomCommand.fromJson(Map<String, dynamic> json) => _$CustomCommandFromJson(json);

 final  String namespace;
 final  String kind;
 final  Map<String, Object?> _payload;
@JsonKey() Map<String, Object?> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}

 final  List<String> _affectedIds;
@JsonKey() List<String> get affectedIds {
  if (_affectedIds is EqualUnmodifiableListView) return _affectedIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_affectedIds);
}


@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomCommandCopyWith<CustomCommand> get copyWith => _$CustomCommandCopyWithImpl<CustomCommand>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomCommandToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomCommand&&(identical(other.namespace, namespace) || other.namespace == namespace)&&(identical(other.kind, kind) || other.kind == kind)&&const DeepCollectionEquality().equals(other._payload, _payload)&&const DeepCollectionEquality().equals(other._affectedIds, _affectedIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,namespace,kind,const DeepCollectionEquality().hash(_payload),const DeepCollectionEquality().hash(_affectedIds));

@override
String toString() {
  return 'DocumentCommand.custom(namespace: $namespace, kind: $kind, payload: $payload, affectedIds: $affectedIds)';
}


}

/// @nodoc
abstract mixin class $CustomCommandCopyWith<$Res> implements $DocumentCommandCopyWith<$Res> {
  factory $CustomCommandCopyWith(CustomCommand value, $Res Function(CustomCommand) _then) = _$CustomCommandCopyWithImpl;
@useResult
$Res call({
 String namespace, String kind, Map<String, Object?> payload, List<String> affectedIds
});




}
/// @nodoc
class _$CustomCommandCopyWithImpl<$Res>
    implements $CustomCommandCopyWith<$Res> {
  _$CustomCommandCopyWithImpl(this._self, this._then);

  final CustomCommand _self;
  final $Res Function(CustomCommand) _then;

/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? namespace = null,Object? kind = null,Object? payload = null,Object? affectedIds = null,}) {
  return _then(CustomCommand(
namespace: null == namespace ? _self.namespace : namespace // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,affectedIds: null == affectedIds ? _self._affectedIds : affectedIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class CreateDesignNodeCommand extends DocumentCommand {
  const CreateDesignNodeCommand({required this.artboardId, this.parentNodeId, required this.node, this.index, final  String? $type}): $type = $type ?? 'createDesignNode',super._();
  factory CreateDesignNodeCommand.fromJson(Map<String, dynamic> json) => _$CreateDesignNodeCommandFromJson(json);

 final  String artboardId;
 final  String? parentNodeId;
 final  DesignNode node;
 final  int? index;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateDesignNodeCommandCopyWith<CreateDesignNodeCommand> get copyWith => _$CreateDesignNodeCommandCopyWithImpl<CreateDesignNodeCommand>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateDesignNodeCommandToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateDesignNodeCommand&&(identical(other.artboardId, artboardId) || other.artboardId == artboardId)&&(identical(other.parentNodeId, parentNodeId) || other.parentNodeId == parentNodeId)&&(identical(other.node, node) || other.node == node)&&(identical(other.index, index) || other.index == index));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,artboardId,parentNodeId,node,index);

@override
String toString() {
  return 'DocumentCommand.createDesignNode(artboardId: $artboardId, parentNodeId: $parentNodeId, node: $node, index: $index)';
}


}

/// @nodoc
abstract mixin class $CreateDesignNodeCommandCopyWith<$Res> implements $DocumentCommandCopyWith<$Res> {
  factory $CreateDesignNodeCommandCopyWith(CreateDesignNodeCommand value, $Res Function(CreateDesignNodeCommand) _then) = _$CreateDesignNodeCommandCopyWithImpl;
@useResult
$Res call({
 String artboardId, String? parentNodeId, DesignNode node, int? index
});


$DesignNodeCopyWith<$Res> get node;

}
/// @nodoc
class _$CreateDesignNodeCommandCopyWithImpl<$Res>
    implements $CreateDesignNodeCommandCopyWith<$Res> {
  _$CreateDesignNodeCommandCopyWithImpl(this._self, this._then);

  final CreateDesignNodeCommand _self;
  final $Res Function(CreateDesignNodeCommand) _then;

/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? artboardId = null,Object? parentNodeId = freezed,Object? node = null,Object? index = freezed,}) {
  return _then(CreateDesignNodeCommand(
artboardId: null == artboardId ? _self.artboardId : artboardId // ignore: cast_nullable_to_non_nullable
as String,parentNodeId: freezed == parentNodeId ? _self.parentNodeId : parentNodeId // ignore: cast_nullable_to_non_nullable
as String?,node: null == node ? _self.node : node // ignore: cast_nullable_to_non_nullable
as DesignNode,index: freezed == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DesignNodeCopyWith<$Res> get node {
  
  return $DesignNodeCopyWith<$Res>(_self.node, (value) {
    return _then(_self.copyWith(node: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class DeleteDesignNodeCommand extends DocumentCommand {
  const DeleteDesignNodeCommand({required this.artboardId, required this.nodeId, final  String? $type}): $type = $type ?? 'deleteDesignNode',super._();
  factory DeleteDesignNodeCommand.fromJson(Map<String, dynamic> json) => _$DeleteDesignNodeCommandFromJson(json);

 final  String artboardId;
 final  String nodeId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteDesignNodeCommandCopyWith<DeleteDesignNodeCommand> get copyWith => _$DeleteDesignNodeCommandCopyWithImpl<DeleteDesignNodeCommand>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeleteDesignNodeCommandToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteDesignNodeCommand&&(identical(other.artboardId, artboardId) || other.artboardId == artboardId)&&(identical(other.nodeId, nodeId) || other.nodeId == nodeId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,artboardId,nodeId);

@override
String toString() {
  return 'DocumentCommand.deleteDesignNode(artboardId: $artboardId, nodeId: $nodeId)';
}


}

/// @nodoc
abstract mixin class $DeleteDesignNodeCommandCopyWith<$Res> implements $DocumentCommandCopyWith<$Res> {
  factory $DeleteDesignNodeCommandCopyWith(DeleteDesignNodeCommand value, $Res Function(DeleteDesignNodeCommand) _then) = _$DeleteDesignNodeCommandCopyWithImpl;
@useResult
$Res call({
 String artboardId, String nodeId
});




}
/// @nodoc
class _$DeleteDesignNodeCommandCopyWithImpl<$Res>
    implements $DeleteDesignNodeCommandCopyWith<$Res> {
  _$DeleteDesignNodeCommandCopyWithImpl(this._self, this._then);

  final DeleteDesignNodeCommand _self;
  final $Res Function(DeleteDesignNodeCommand) _then;

/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? artboardId = null,Object? nodeId = null,}) {
  return _then(DeleteDesignNodeCommand(
artboardId: null == artboardId ? _self.artboardId : artboardId // ignore: cast_nullable_to_non_nullable
as String,nodeId: null == nodeId ? _self.nodeId : nodeId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class MoveDesignNodeCommand extends DocumentCommand {
  const MoveDesignNodeCommand({required this.artboardId, required this.nodeId, required this.newParentId, required this.index, final  String? $type}): $type = $type ?? 'moveDesignNode',super._();
  factory MoveDesignNodeCommand.fromJson(Map<String, dynamic> json) => _$MoveDesignNodeCommandFromJson(json);

 final  String artboardId;
 final  String nodeId;
 final  String newParentId;
 final  int index;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MoveDesignNodeCommandCopyWith<MoveDesignNodeCommand> get copyWith => _$MoveDesignNodeCommandCopyWithImpl<MoveDesignNodeCommand>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MoveDesignNodeCommandToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoveDesignNodeCommand&&(identical(other.artboardId, artboardId) || other.artboardId == artboardId)&&(identical(other.nodeId, nodeId) || other.nodeId == nodeId)&&(identical(other.newParentId, newParentId) || other.newParentId == newParentId)&&(identical(other.index, index) || other.index == index));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,artboardId,nodeId,newParentId,index);

@override
String toString() {
  return 'DocumentCommand.moveDesignNode(artboardId: $artboardId, nodeId: $nodeId, newParentId: $newParentId, index: $index)';
}


}

/// @nodoc
abstract mixin class $MoveDesignNodeCommandCopyWith<$Res> implements $DocumentCommandCopyWith<$Res> {
  factory $MoveDesignNodeCommandCopyWith(MoveDesignNodeCommand value, $Res Function(MoveDesignNodeCommand) _then) = _$MoveDesignNodeCommandCopyWithImpl;
@useResult
$Res call({
 String artboardId, String nodeId, String newParentId, int index
});




}
/// @nodoc
class _$MoveDesignNodeCommandCopyWithImpl<$Res>
    implements $MoveDesignNodeCommandCopyWith<$Res> {
  _$MoveDesignNodeCommandCopyWithImpl(this._self, this._then);

  final MoveDesignNodeCommand _self;
  final $Res Function(MoveDesignNodeCommand) _then;

/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? artboardId = null,Object? nodeId = null,Object? newParentId = null,Object? index = null,}) {
  return _then(MoveDesignNodeCommand(
artboardId: null == artboardId ? _self.artboardId : artboardId // ignore: cast_nullable_to_non_nullable
as String,nodeId: null == nodeId ? _self.nodeId : nodeId // ignore: cast_nullable_to_non_nullable
as String,newParentId: null == newParentId ? _self.newParentId : newParentId // ignore: cast_nullable_to_non_nullable
as String,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class RenameDesignNodeCommand extends DocumentCommand {
  const RenameDesignNodeCommand({required this.artboardId, required this.nodeId, required this.name, final  String? $type}): $type = $type ?? 'renameDesignNode',super._();
  factory RenameDesignNodeCommand.fromJson(Map<String, dynamic> json) => _$RenameDesignNodeCommandFromJson(json);

 final  String artboardId;
 final  String nodeId;
 final  String name;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RenameDesignNodeCommandCopyWith<RenameDesignNodeCommand> get copyWith => _$RenameDesignNodeCommandCopyWithImpl<RenameDesignNodeCommand>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RenameDesignNodeCommandToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RenameDesignNodeCommand&&(identical(other.artboardId, artboardId) || other.artboardId == artboardId)&&(identical(other.nodeId, nodeId) || other.nodeId == nodeId)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,artboardId,nodeId,name);

@override
String toString() {
  return 'DocumentCommand.renameDesignNode(artboardId: $artboardId, nodeId: $nodeId, name: $name)';
}


}

/// @nodoc
abstract mixin class $RenameDesignNodeCommandCopyWith<$Res> implements $DocumentCommandCopyWith<$Res> {
  factory $RenameDesignNodeCommandCopyWith(RenameDesignNodeCommand value, $Res Function(RenameDesignNodeCommand) _then) = _$RenameDesignNodeCommandCopyWithImpl;
@useResult
$Res call({
 String artboardId, String nodeId, String name
});




}
/// @nodoc
class _$RenameDesignNodeCommandCopyWithImpl<$Res>
    implements $RenameDesignNodeCommandCopyWith<$Res> {
  _$RenameDesignNodeCommandCopyWithImpl(this._self, this._then);

  final RenameDesignNodeCommand _self;
  final $Res Function(RenameDesignNodeCommand) _then;

/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? artboardId = null,Object? nodeId = null,Object? name = null,}) {
  return _then(RenameDesignNodeCommand(
artboardId: null == artboardId ? _self.artboardId : artboardId // ignore: cast_nullable_to_non_nullable
as String,nodeId: null == nodeId ? _self.nodeId : nodeId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class SetNodeVisibilityCommand extends DocumentCommand {
  const SetNodeVisibilityCommand({required this.artboardId, required this.nodeId, required this.visible, final  String? $type}): $type = $type ?? 'setNodeVisibility',super._();
  factory SetNodeVisibilityCommand.fromJson(Map<String, dynamic> json) => _$SetNodeVisibilityCommandFromJson(json);

 final  String artboardId;
 final  String nodeId;
 final  bool visible;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetNodeVisibilityCommandCopyWith<SetNodeVisibilityCommand> get copyWith => _$SetNodeVisibilityCommandCopyWithImpl<SetNodeVisibilityCommand>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SetNodeVisibilityCommandToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetNodeVisibilityCommand&&(identical(other.artboardId, artboardId) || other.artboardId == artboardId)&&(identical(other.nodeId, nodeId) || other.nodeId == nodeId)&&(identical(other.visible, visible) || other.visible == visible));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,artboardId,nodeId,visible);

@override
String toString() {
  return 'DocumentCommand.setNodeVisibility(artboardId: $artboardId, nodeId: $nodeId, visible: $visible)';
}


}

/// @nodoc
abstract mixin class $SetNodeVisibilityCommandCopyWith<$Res> implements $DocumentCommandCopyWith<$Res> {
  factory $SetNodeVisibilityCommandCopyWith(SetNodeVisibilityCommand value, $Res Function(SetNodeVisibilityCommand) _then) = _$SetNodeVisibilityCommandCopyWithImpl;
@useResult
$Res call({
 String artboardId, String nodeId, bool visible
});




}
/// @nodoc
class _$SetNodeVisibilityCommandCopyWithImpl<$Res>
    implements $SetNodeVisibilityCommandCopyWith<$Res> {
  _$SetNodeVisibilityCommandCopyWithImpl(this._self, this._then);

  final SetNodeVisibilityCommand _self;
  final $Res Function(SetNodeVisibilityCommand) _then;

/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? artboardId = null,Object? nodeId = null,Object? visible = null,}) {
  return _then(SetNodeVisibilityCommand(
artboardId: null == artboardId ? _self.artboardId : artboardId // ignore: cast_nullable_to_non_nullable
as String,nodeId: null == nodeId ? _self.nodeId : nodeId // ignore: cast_nullable_to_non_nullable
as String,visible: null == visible ? _self.visible : visible // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
@JsonSerializable()

class SetNodeLockedCommand extends DocumentCommand {
  const SetNodeLockedCommand({required this.artboardId, required this.nodeId, required this.locked, final  String? $type}): $type = $type ?? 'setNodeLocked',super._();
  factory SetNodeLockedCommand.fromJson(Map<String, dynamic> json) => _$SetNodeLockedCommandFromJson(json);

 final  String artboardId;
 final  String nodeId;
 final  bool locked;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetNodeLockedCommandCopyWith<SetNodeLockedCommand> get copyWith => _$SetNodeLockedCommandCopyWithImpl<SetNodeLockedCommand>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SetNodeLockedCommandToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetNodeLockedCommand&&(identical(other.artboardId, artboardId) || other.artboardId == artboardId)&&(identical(other.nodeId, nodeId) || other.nodeId == nodeId)&&(identical(other.locked, locked) || other.locked == locked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,artboardId,nodeId,locked);

@override
String toString() {
  return 'DocumentCommand.setNodeLocked(artboardId: $artboardId, nodeId: $nodeId, locked: $locked)';
}


}

/// @nodoc
abstract mixin class $SetNodeLockedCommandCopyWith<$Res> implements $DocumentCommandCopyWith<$Res> {
  factory $SetNodeLockedCommandCopyWith(SetNodeLockedCommand value, $Res Function(SetNodeLockedCommand) _then) = _$SetNodeLockedCommandCopyWithImpl;
@useResult
$Res call({
 String artboardId, String nodeId, bool locked
});




}
/// @nodoc
class _$SetNodeLockedCommandCopyWithImpl<$Res>
    implements $SetNodeLockedCommandCopyWith<$Res> {
  _$SetNodeLockedCommandCopyWithImpl(this._self, this._then);

  final SetNodeLockedCommand _self;
  final $Res Function(SetNodeLockedCommand) _then;

/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? artboardId = null,Object? nodeId = null,Object? locked = null,}) {
  return _then(SetNodeLockedCommand(
artboardId: null == artboardId ? _self.artboardId : artboardId // ignore: cast_nullable_to_non_nullable
as String,nodeId: null == nodeId ? _self.nodeId : nodeId // ignore: cast_nullable_to_non_nullable
as String,locked: null == locked ? _self.locked : locked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
@JsonSerializable()

class SetNodeMetadataCommand extends DocumentCommand {
  const SetNodeMetadataCommand({required this.artboardId, required this.nodeId, required this.key, this.value, final  String? $type}): $type = $type ?? 'setNodeMetadata',super._();
  factory SetNodeMetadataCommand.fromJson(Map<String, dynamic> json) => _$SetNodeMetadataCommandFromJson(json);

 final  String artboardId;
 final  String nodeId;
 final  String key;
 final  Object? value;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetNodeMetadataCommandCopyWith<SetNodeMetadataCommand> get copyWith => _$SetNodeMetadataCommandCopyWithImpl<SetNodeMetadataCommand>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SetNodeMetadataCommandToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetNodeMetadataCommand&&(identical(other.artboardId, artboardId) || other.artboardId == artboardId)&&(identical(other.nodeId, nodeId) || other.nodeId == nodeId)&&(identical(other.key, key) || other.key == key)&&const DeepCollectionEquality().equals(other.value, value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,artboardId,nodeId,key,const DeepCollectionEquality().hash(value));

@override
String toString() {
  return 'DocumentCommand.setNodeMetadata(artboardId: $artboardId, nodeId: $nodeId, key: $key, value: $value)';
}


}

/// @nodoc
abstract mixin class $SetNodeMetadataCommandCopyWith<$Res> implements $DocumentCommandCopyWith<$Res> {
  factory $SetNodeMetadataCommandCopyWith(SetNodeMetadataCommand value, $Res Function(SetNodeMetadataCommand) _then) = _$SetNodeMetadataCommandCopyWithImpl;
@useResult
$Res call({
 String artboardId, String nodeId, String key, Object? value
});




}
/// @nodoc
class _$SetNodeMetadataCommandCopyWithImpl<$Res>
    implements $SetNodeMetadataCommandCopyWith<$Res> {
  _$SetNodeMetadataCommandCopyWithImpl(this._self, this._then);

  final SetNodeMetadataCommand _self;
  final $Res Function(SetNodeMetadataCommand) _then;

/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? artboardId = null,Object? nodeId = null,Object? key = null,Object? value = freezed,}) {
  return _then(SetNodeMetadataCommand(
artboardId: null == artboardId ? _self.artboardId : artboardId // ignore: cast_nullable_to_non_nullable
as String,nodeId: null == nodeId ? _self.nodeId : nodeId // ignore: cast_nullable_to_non_nullable
as String,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,value: freezed == value ? _self.value : value ,
  ));
}


}

/// @nodoc
@JsonSerializable()

class DuplicateDesignNodeCommand extends DocumentCommand {
  const DuplicateDesignNodeCommand({required this.artboardId, required this.sourceNodeId, required this.duplicate, final  String? $type}): $type = $type ?? 'duplicateDesignNode',super._();
  factory DuplicateDesignNodeCommand.fromJson(Map<String, dynamic> json) => _$DuplicateDesignNodeCommandFromJson(json);

 final  String artboardId;
 final  String sourceNodeId;
 final  DesignNode duplicate;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DuplicateDesignNodeCommandCopyWith<DuplicateDesignNodeCommand> get copyWith => _$DuplicateDesignNodeCommandCopyWithImpl<DuplicateDesignNodeCommand>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DuplicateDesignNodeCommandToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DuplicateDesignNodeCommand&&(identical(other.artboardId, artboardId) || other.artboardId == artboardId)&&(identical(other.sourceNodeId, sourceNodeId) || other.sourceNodeId == sourceNodeId)&&(identical(other.duplicate, duplicate) || other.duplicate == duplicate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,artboardId,sourceNodeId,duplicate);

@override
String toString() {
  return 'DocumentCommand.duplicateDesignNode(artboardId: $artboardId, sourceNodeId: $sourceNodeId, duplicate: $duplicate)';
}


}

/// @nodoc
abstract mixin class $DuplicateDesignNodeCommandCopyWith<$Res> implements $DocumentCommandCopyWith<$Res> {
  factory $DuplicateDesignNodeCommandCopyWith(DuplicateDesignNodeCommand value, $Res Function(DuplicateDesignNodeCommand) _then) = _$DuplicateDesignNodeCommandCopyWithImpl;
@useResult
$Res call({
 String artboardId, String sourceNodeId, DesignNode duplicate
});


$DesignNodeCopyWith<$Res> get duplicate;

}
/// @nodoc
class _$DuplicateDesignNodeCommandCopyWithImpl<$Res>
    implements $DuplicateDesignNodeCommandCopyWith<$Res> {
  _$DuplicateDesignNodeCommandCopyWithImpl(this._self, this._then);

  final DuplicateDesignNodeCommand _self;
  final $Res Function(DuplicateDesignNodeCommand) _then;

/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? artboardId = null,Object? sourceNodeId = null,Object? duplicate = null,}) {
  return _then(DuplicateDesignNodeCommand(
artboardId: null == artboardId ? _self.artboardId : artboardId // ignore: cast_nullable_to_non_nullable
as String,sourceNodeId: null == sourceNodeId ? _self.sourceNodeId : sourceNodeId // ignore: cast_nullable_to_non_nullable
as String,duplicate: null == duplicate ? _self.duplicate : duplicate // ignore: cast_nullable_to_non_nullable
as DesignNode,
  ));
}

/// Create a copy of DocumentCommand
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DesignNodeCopyWith<$Res> get duplicate {
  
  return $DesignNodeCopyWith<$Res>(_self.duplicate, (value) {
    return _then(_self.copyWith(duplicate: value));
  });
}
}

// dart format on
