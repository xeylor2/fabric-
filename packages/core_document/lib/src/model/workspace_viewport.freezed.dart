// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workspace_viewport.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkspaceViewportState {

/// Workspace surface key (`WorkspaceCategory.wireName` or tool surface).
 String get workspaceId;/// Artboard this view targets.
 String get artboardId;/// The camera: zoom, pan offset, rotation, sizes (frozen ADR-0003).
 ViewportState get viewport;/// Selected object ids at last use.
 SelectionState get selection;/// Layer ids explicitly hidden in this workspace view.
 List<String> get hiddenLayerIds;/// Active tool at last use, if any.
@JsonKey(fromJson: _toolFromJson, toJson: _toolToJson) FebricTool? get activeTool;
/// Create a copy of WorkspaceViewportState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkspaceViewportStateCopyWith<WorkspaceViewportState> get copyWith => _$WorkspaceViewportStateCopyWithImpl<WorkspaceViewportState>(this as WorkspaceViewportState, _$identity);

  /// Serializes this WorkspaceViewportState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkspaceViewportState&&(identical(other.workspaceId, workspaceId) || other.workspaceId == workspaceId)&&(identical(other.artboardId, artboardId) || other.artboardId == artboardId)&&(identical(other.viewport, viewport) || other.viewport == viewport)&&(identical(other.selection, selection) || other.selection == selection)&&const DeepCollectionEquality().equals(other.hiddenLayerIds, hiddenLayerIds)&&(identical(other.activeTool, activeTool) || other.activeTool == activeTool));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,workspaceId,artboardId,viewport,selection,const DeepCollectionEquality().hash(hiddenLayerIds),activeTool);

@override
String toString() {
  return 'WorkspaceViewportState(workspaceId: $workspaceId, artboardId: $artboardId, viewport: $viewport, selection: $selection, hiddenLayerIds: $hiddenLayerIds, activeTool: $activeTool)';
}


}

/// @nodoc
abstract mixin class $WorkspaceViewportStateCopyWith<$Res>  {
  factory $WorkspaceViewportStateCopyWith(WorkspaceViewportState value, $Res Function(WorkspaceViewportState) _then) = _$WorkspaceViewportStateCopyWithImpl;
@useResult
$Res call({
 String workspaceId, String artboardId, ViewportState viewport, SelectionState selection, List<String> hiddenLayerIds,@JsonKey(fromJson: _toolFromJson, toJson: _toolToJson) FebricTool? activeTool
});


$ViewportStateCopyWith<$Res> get viewport;$SelectionStateCopyWith<$Res> get selection;

}
/// @nodoc
class _$WorkspaceViewportStateCopyWithImpl<$Res>
    implements $WorkspaceViewportStateCopyWith<$Res> {
  _$WorkspaceViewportStateCopyWithImpl(this._self, this._then);

  final WorkspaceViewportState _self;
  final $Res Function(WorkspaceViewportState) _then;

/// Create a copy of WorkspaceViewportState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? workspaceId = null,Object? artboardId = null,Object? viewport = null,Object? selection = null,Object? hiddenLayerIds = null,Object? activeTool = freezed,}) {
  return _then(_self.copyWith(
workspaceId: null == workspaceId ? _self.workspaceId : workspaceId // ignore: cast_nullable_to_non_nullable
as String,artboardId: null == artboardId ? _self.artboardId : artboardId // ignore: cast_nullable_to_non_nullable
as String,viewport: null == viewport ? _self.viewport : viewport // ignore: cast_nullable_to_non_nullable
as ViewportState,selection: null == selection ? _self.selection : selection // ignore: cast_nullable_to_non_nullable
as SelectionState,hiddenLayerIds: null == hiddenLayerIds ? _self.hiddenLayerIds : hiddenLayerIds // ignore: cast_nullable_to_non_nullable
as List<String>,activeTool: freezed == activeTool ? _self.activeTool : activeTool // ignore: cast_nullable_to_non_nullable
as FebricTool?,
  ));
}
/// Create a copy of WorkspaceViewportState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ViewportStateCopyWith<$Res> get viewport {
  
  return $ViewportStateCopyWith<$Res>(_self.viewport, (value) {
    return _then(_self.copyWith(viewport: value));
  });
}/// Create a copy of WorkspaceViewportState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SelectionStateCopyWith<$Res> get selection {
  
  return $SelectionStateCopyWith<$Res>(_self.selection, (value) {
    return _then(_self.copyWith(selection: value));
  });
}
}


/// Adds pattern-matching-related methods to [WorkspaceViewportState].
extension WorkspaceViewportStatePatterns on WorkspaceViewportState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkspaceViewportState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkspaceViewportState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkspaceViewportState value)  $default,){
final _that = this;
switch (_that) {
case _WorkspaceViewportState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkspaceViewportState value)?  $default,){
final _that = this;
switch (_that) {
case _WorkspaceViewportState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String workspaceId,  String artboardId,  ViewportState viewport,  SelectionState selection,  List<String> hiddenLayerIds, @JsonKey(fromJson: _toolFromJson, toJson: _toolToJson)  FebricTool? activeTool)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkspaceViewportState() when $default != null:
return $default(_that.workspaceId,_that.artboardId,_that.viewport,_that.selection,_that.hiddenLayerIds,_that.activeTool);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String workspaceId,  String artboardId,  ViewportState viewport,  SelectionState selection,  List<String> hiddenLayerIds, @JsonKey(fromJson: _toolFromJson, toJson: _toolToJson)  FebricTool? activeTool)  $default,) {final _that = this;
switch (_that) {
case _WorkspaceViewportState():
return $default(_that.workspaceId,_that.artboardId,_that.viewport,_that.selection,_that.hiddenLayerIds,_that.activeTool);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String workspaceId,  String artboardId,  ViewportState viewport,  SelectionState selection,  List<String> hiddenLayerIds, @JsonKey(fromJson: _toolFromJson, toJson: _toolToJson)  FebricTool? activeTool)?  $default,) {final _that = this;
switch (_that) {
case _WorkspaceViewportState() when $default != null:
return $default(_that.workspaceId,_that.artboardId,_that.viewport,_that.selection,_that.hiddenLayerIds,_that.activeTool);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WorkspaceViewportState implements WorkspaceViewportState {
  const _WorkspaceViewportState({required this.workspaceId, required this.artboardId, required this.viewport, this.selection = SelectionState.empty, final  List<String> hiddenLayerIds = const <String>[], @JsonKey(fromJson: _toolFromJson, toJson: _toolToJson) this.activeTool}): _hiddenLayerIds = hiddenLayerIds;
  factory _WorkspaceViewportState.fromJson(Map<String, dynamic> json) => _$WorkspaceViewportStateFromJson(json);

/// Workspace surface key (`WorkspaceCategory.wireName` or tool surface).
@override final  String workspaceId;
/// Artboard this view targets.
@override final  String artboardId;
/// The camera: zoom, pan offset, rotation, sizes (frozen ADR-0003).
@override final  ViewportState viewport;
/// Selected object ids at last use.
@override@JsonKey() final  SelectionState selection;
/// Layer ids explicitly hidden in this workspace view.
 final  List<String> _hiddenLayerIds;
/// Layer ids explicitly hidden in this workspace view.
@override@JsonKey() List<String> get hiddenLayerIds {
  if (_hiddenLayerIds is EqualUnmodifiableListView) return _hiddenLayerIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hiddenLayerIds);
}

/// Active tool at last use, if any.
@override@JsonKey(fromJson: _toolFromJson, toJson: _toolToJson) final  FebricTool? activeTool;

/// Create a copy of WorkspaceViewportState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkspaceViewportStateCopyWith<_WorkspaceViewportState> get copyWith => __$WorkspaceViewportStateCopyWithImpl<_WorkspaceViewportState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorkspaceViewportStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkspaceViewportState&&(identical(other.workspaceId, workspaceId) || other.workspaceId == workspaceId)&&(identical(other.artboardId, artboardId) || other.artboardId == artboardId)&&(identical(other.viewport, viewport) || other.viewport == viewport)&&(identical(other.selection, selection) || other.selection == selection)&&const DeepCollectionEquality().equals(other._hiddenLayerIds, _hiddenLayerIds)&&(identical(other.activeTool, activeTool) || other.activeTool == activeTool));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,workspaceId,artboardId,viewport,selection,const DeepCollectionEquality().hash(_hiddenLayerIds),activeTool);

@override
String toString() {
  return 'WorkspaceViewportState(workspaceId: $workspaceId, artboardId: $artboardId, viewport: $viewport, selection: $selection, hiddenLayerIds: $hiddenLayerIds, activeTool: $activeTool)';
}


}

/// @nodoc
abstract mixin class _$WorkspaceViewportStateCopyWith<$Res> implements $WorkspaceViewportStateCopyWith<$Res> {
  factory _$WorkspaceViewportStateCopyWith(_WorkspaceViewportState value, $Res Function(_WorkspaceViewportState) _then) = __$WorkspaceViewportStateCopyWithImpl;
@override @useResult
$Res call({
 String workspaceId, String artboardId, ViewportState viewport, SelectionState selection, List<String> hiddenLayerIds,@JsonKey(fromJson: _toolFromJson, toJson: _toolToJson) FebricTool? activeTool
});


@override $ViewportStateCopyWith<$Res> get viewport;@override $SelectionStateCopyWith<$Res> get selection;

}
/// @nodoc
class __$WorkspaceViewportStateCopyWithImpl<$Res>
    implements _$WorkspaceViewportStateCopyWith<$Res> {
  __$WorkspaceViewportStateCopyWithImpl(this._self, this._then);

  final _WorkspaceViewportState _self;
  final $Res Function(_WorkspaceViewportState) _then;

/// Create a copy of WorkspaceViewportState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? workspaceId = null,Object? artboardId = null,Object? viewport = null,Object? selection = null,Object? hiddenLayerIds = null,Object? activeTool = freezed,}) {
  return _then(_WorkspaceViewportState(
workspaceId: null == workspaceId ? _self.workspaceId : workspaceId // ignore: cast_nullable_to_non_nullable
as String,artboardId: null == artboardId ? _self.artboardId : artboardId // ignore: cast_nullable_to_non_nullable
as String,viewport: null == viewport ? _self.viewport : viewport // ignore: cast_nullable_to_non_nullable
as ViewportState,selection: null == selection ? _self.selection : selection // ignore: cast_nullable_to_non_nullable
as SelectionState,hiddenLayerIds: null == hiddenLayerIds ? _self._hiddenLayerIds : hiddenLayerIds // ignore: cast_nullable_to_non_nullable
as List<String>,activeTool: freezed == activeTool ? _self.activeTool : activeTool // ignore: cast_nullable_to_non_nullable
as FebricTool?,
  ));
}

/// Create a copy of WorkspaceViewportState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ViewportStateCopyWith<$Res> get viewport {
  
  return $ViewportStateCopyWith<$Res>(_self.viewport, (value) {
    return _then(_self.copyWith(viewport: value));
  });
}/// Create a copy of WorkspaceViewportState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SelectionStateCopyWith<$Res> get selection {
  
  return $SelectionStateCopyWith<$Res>(_self.selection, (value) {
    return _then(_self.copyWith(selection: value));
  });
}
}

// dart format on
