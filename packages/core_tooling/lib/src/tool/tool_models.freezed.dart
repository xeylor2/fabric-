// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tool_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ToolMetadata {

/// The frozen FEBRIC tool this instance implements.
@JsonKey(fromJson: _toolFromJson, toJson: _toolToJson) FebricTool get tool; String get version;/// Whether the tool invokes AI (staging, credits, provenance apply).
 bool get aiBacked; Map<String, Object?> get metadata;
/// Create a copy of ToolMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToolMetadataCopyWith<ToolMetadata> get copyWith => _$ToolMetadataCopyWithImpl<ToolMetadata>(this as ToolMetadata, _$identity);

  /// Serializes this ToolMetadata to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToolMetadata&&(identical(other.tool, tool) || other.tool == tool)&&(identical(other.version, version) || other.version == version)&&(identical(other.aiBacked, aiBacked) || other.aiBacked == aiBacked)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tool,version,aiBacked,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'ToolMetadata(tool: $tool, version: $version, aiBacked: $aiBacked, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $ToolMetadataCopyWith<$Res>  {
  factory $ToolMetadataCopyWith(ToolMetadata value, $Res Function(ToolMetadata) _then) = _$ToolMetadataCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _toolFromJson, toJson: _toolToJson) FebricTool tool, String version, bool aiBacked, Map<String, Object?> metadata
});




}
/// @nodoc
class _$ToolMetadataCopyWithImpl<$Res>
    implements $ToolMetadataCopyWith<$Res> {
  _$ToolMetadataCopyWithImpl(this._self, this._then);

  final ToolMetadata _self;
  final $Res Function(ToolMetadata) _then;

/// Create a copy of ToolMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tool = null,Object? version = null,Object? aiBacked = null,Object? metadata = null,}) {
  return _then(_self.copyWith(
tool: null == tool ? _self.tool : tool // ignore: cast_nullable_to_non_nullable
as FebricTool,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,aiBacked: null == aiBacked ? _self.aiBacked : aiBacked // ignore: cast_nullable_to_non_nullable
as bool,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

}


/// Adds pattern-matching-related methods to [ToolMetadata].
extension ToolMetadataPatterns on ToolMetadata {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ToolMetadata value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ToolMetadata() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ToolMetadata value)  $default,){
final _that = this;
switch (_that) {
case _ToolMetadata():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ToolMetadata value)?  $default,){
final _that = this;
switch (_that) {
case _ToolMetadata() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _toolFromJson, toJson: _toolToJson)  FebricTool tool,  String version,  bool aiBacked,  Map<String, Object?> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ToolMetadata() when $default != null:
return $default(_that.tool,_that.version,_that.aiBacked,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _toolFromJson, toJson: _toolToJson)  FebricTool tool,  String version,  bool aiBacked,  Map<String, Object?> metadata)  $default,) {final _that = this;
switch (_that) {
case _ToolMetadata():
return $default(_that.tool,_that.version,_that.aiBacked,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _toolFromJson, toJson: _toolToJson)  FebricTool tool,  String version,  bool aiBacked,  Map<String, Object?> metadata)?  $default,) {final _that = this;
switch (_that) {
case _ToolMetadata() when $default != null:
return $default(_that.tool,_that.version,_that.aiBacked,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ToolMetadata implements ToolMetadata {
  const _ToolMetadata({@JsonKey(fromJson: _toolFromJson, toJson: _toolToJson) required this.tool, required this.version, this.aiBacked = false, final  Map<String, Object?> metadata = const <String, Object?>{}}): _metadata = metadata;
  factory _ToolMetadata.fromJson(Map<String, dynamic> json) => _$ToolMetadataFromJson(json);

/// The frozen FEBRIC tool this instance implements.
@override@JsonKey(fromJson: _toolFromJson, toJson: _toolToJson) final  FebricTool tool;
@override final  String version;
/// Whether the tool invokes AI (staging, credits, provenance apply).
@override@JsonKey() final  bool aiBacked;
 final  Map<String, Object?> _metadata;
@override@JsonKey() Map<String, Object?> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of ToolMetadata
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToolMetadataCopyWith<_ToolMetadata> get copyWith => __$ToolMetadataCopyWithImpl<_ToolMetadata>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ToolMetadataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToolMetadata&&(identical(other.tool, tool) || other.tool == tool)&&(identical(other.version, version) || other.version == version)&&(identical(other.aiBacked, aiBacked) || other.aiBacked == aiBacked)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tool,version,aiBacked,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'ToolMetadata(tool: $tool, version: $version, aiBacked: $aiBacked, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$ToolMetadataCopyWith<$Res> implements $ToolMetadataCopyWith<$Res> {
  factory _$ToolMetadataCopyWith(_ToolMetadata value, $Res Function(_ToolMetadata) _then) = __$ToolMetadataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _toolFromJson, toJson: _toolToJson) FebricTool tool, String version, bool aiBacked, Map<String, Object?> metadata
});




}
/// @nodoc
class __$ToolMetadataCopyWithImpl<$Res>
    implements _$ToolMetadataCopyWith<$Res> {
  __$ToolMetadataCopyWithImpl(this._self, this._then);

  final _ToolMetadata _self;
  final $Res Function(_ToolMetadata) _then;

/// Create a copy of ToolMetadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tool = null,Object? version = null,Object? aiBacked = null,Object? metadata = null,}) {
  return _then(_ToolMetadata(
tool: null == tool ? _self.tool : tool // ignore: cast_nullable_to_non_nullable
as FebricTool,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,aiBacked: null == aiBacked ? _self.aiBacked : aiBacked // ignore: cast_nullable_to_non_nullable
as bool,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}


/// @nodoc
mixin _$ToolContext {

 ViewportState get viewport; SelectionState get selection; LockSet get locks; SelectionSnapshot? get regionSelection; Map<String, Object?> get config;
/// Create a copy of ToolContext
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToolContextCopyWith<ToolContext> get copyWith => _$ToolContextCopyWithImpl<ToolContext>(this as ToolContext, _$identity);

  /// Serializes this ToolContext to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToolContext&&(identical(other.viewport, viewport) || other.viewport == viewport)&&(identical(other.selection, selection) || other.selection == selection)&&(identical(other.locks, locks) || other.locks == locks)&&(identical(other.regionSelection, regionSelection) || other.regionSelection == regionSelection)&&const DeepCollectionEquality().equals(other.config, config));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,viewport,selection,locks,regionSelection,const DeepCollectionEquality().hash(config));

@override
String toString() {
  return 'ToolContext(viewport: $viewport, selection: $selection, locks: $locks, regionSelection: $regionSelection, config: $config)';
}


}

/// @nodoc
abstract mixin class $ToolContextCopyWith<$Res>  {
  factory $ToolContextCopyWith(ToolContext value, $Res Function(ToolContext) _then) = _$ToolContextCopyWithImpl;
@useResult
$Res call({
 ViewportState viewport, SelectionState selection, LockSet locks, SelectionSnapshot? regionSelection, Map<String, Object?> config
});


$ViewportStateCopyWith<$Res> get viewport;$SelectionStateCopyWith<$Res> get selection;$LockSetCopyWith<$Res> get locks;$SelectionSnapshotCopyWith<$Res>? get regionSelection;

}
/// @nodoc
class _$ToolContextCopyWithImpl<$Res>
    implements $ToolContextCopyWith<$Res> {
  _$ToolContextCopyWithImpl(this._self, this._then);

  final ToolContext _self;
  final $Res Function(ToolContext) _then;

/// Create a copy of ToolContext
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? viewport = null,Object? selection = null,Object? locks = null,Object? regionSelection = freezed,Object? config = null,}) {
  return _then(_self.copyWith(
viewport: null == viewport ? _self.viewport : viewport // ignore: cast_nullable_to_non_nullable
as ViewportState,selection: null == selection ? _self.selection : selection // ignore: cast_nullable_to_non_nullable
as SelectionState,locks: null == locks ? _self.locks : locks // ignore: cast_nullable_to_non_nullable
as LockSet,regionSelection: freezed == regionSelection ? _self.regionSelection : regionSelection // ignore: cast_nullable_to_non_nullable
as SelectionSnapshot?,config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}
/// Create a copy of ToolContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ViewportStateCopyWith<$Res> get viewport {
  
  return $ViewportStateCopyWith<$Res>(_self.viewport, (value) {
    return _then(_self.copyWith(viewport: value));
  });
}/// Create a copy of ToolContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SelectionStateCopyWith<$Res> get selection {
  
  return $SelectionStateCopyWith<$Res>(_self.selection, (value) {
    return _then(_self.copyWith(selection: value));
  });
}/// Create a copy of ToolContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LockSetCopyWith<$Res> get locks {
  
  return $LockSetCopyWith<$Res>(_self.locks, (value) {
    return _then(_self.copyWith(locks: value));
  });
}/// Create a copy of ToolContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SelectionSnapshotCopyWith<$Res>? get regionSelection {
    if (_self.regionSelection == null) {
    return null;
  }

  return $SelectionSnapshotCopyWith<$Res>(_self.regionSelection!, (value) {
    return _then(_self.copyWith(regionSelection: value));
  });
}
}


/// Adds pattern-matching-related methods to [ToolContext].
extension ToolContextPatterns on ToolContext {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ToolContext value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ToolContext() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ToolContext value)  $default,){
final _that = this;
switch (_that) {
case _ToolContext():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ToolContext value)?  $default,){
final _that = this;
switch (_that) {
case _ToolContext() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ViewportState viewport,  SelectionState selection,  LockSet locks,  SelectionSnapshot? regionSelection,  Map<String, Object?> config)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ToolContext() when $default != null:
return $default(_that.viewport,_that.selection,_that.locks,_that.regionSelection,_that.config);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ViewportState viewport,  SelectionState selection,  LockSet locks,  SelectionSnapshot? regionSelection,  Map<String, Object?> config)  $default,) {final _that = this;
switch (_that) {
case _ToolContext():
return $default(_that.viewport,_that.selection,_that.locks,_that.regionSelection,_that.config);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ViewportState viewport,  SelectionState selection,  LockSet locks,  SelectionSnapshot? regionSelection,  Map<String, Object?> config)?  $default,) {final _that = this;
switch (_that) {
case _ToolContext() when $default != null:
return $default(_that.viewport,_that.selection,_that.locks,_that.regionSelection,_that.config);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ToolContext implements ToolContext {
  const _ToolContext({required this.viewport, this.selection = SelectionState.empty, this.locks = LockSet.none, this.regionSelection, final  Map<String, Object?> config = const <String, Object?>{}}): _config = config;
  factory _ToolContext.fromJson(Map<String, dynamic> json) => _$ToolContextFromJson(json);

@override final  ViewportState viewport;
@override@JsonKey() final  SelectionState selection;
@override@JsonKey() final  LockSet locks;
@override final  SelectionSnapshot? regionSelection;
 final  Map<String, Object?> _config;
@override@JsonKey() Map<String, Object?> get config {
  if (_config is EqualUnmodifiableMapView) return _config;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_config);
}


/// Create a copy of ToolContext
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToolContextCopyWith<_ToolContext> get copyWith => __$ToolContextCopyWithImpl<_ToolContext>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ToolContextToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToolContext&&(identical(other.viewport, viewport) || other.viewport == viewport)&&(identical(other.selection, selection) || other.selection == selection)&&(identical(other.locks, locks) || other.locks == locks)&&(identical(other.regionSelection, regionSelection) || other.regionSelection == regionSelection)&&const DeepCollectionEquality().equals(other._config, _config));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,viewport,selection,locks,regionSelection,const DeepCollectionEquality().hash(_config));

@override
String toString() {
  return 'ToolContext(viewport: $viewport, selection: $selection, locks: $locks, regionSelection: $regionSelection, config: $config)';
}


}

/// @nodoc
abstract mixin class _$ToolContextCopyWith<$Res> implements $ToolContextCopyWith<$Res> {
  factory _$ToolContextCopyWith(_ToolContext value, $Res Function(_ToolContext) _then) = __$ToolContextCopyWithImpl;
@override @useResult
$Res call({
 ViewportState viewport, SelectionState selection, LockSet locks, SelectionSnapshot? regionSelection, Map<String, Object?> config
});


@override $ViewportStateCopyWith<$Res> get viewport;@override $SelectionStateCopyWith<$Res> get selection;@override $LockSetCopyWith<$Res> get locks;@override $SelectionSnapshotCopyWith<$Res>? get regionSelection;

}
/// @nodoc
class __$ToolContextCopyWithImpl<$Res>
    implements _$ToolContextCopyWith<$Res> {
  __$ToolContextCopyWithImpl(this._self, this._then);

  final _ToolContext _self;
  final $Res Function(_ToolContext) _then;

/// Create a copy of ToolContext
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? viewport = null,Object? selection = null,Object? locks = null,Object? regionSelection = freezed,Object? config = null,}) {
  return _then(_ToolContext(
viewport: null == viewport ? _self.viewport : viewport // ignore: cast_nullable_to_non_nullable
as ViewportState,selection: null == selection ? _self.selection : selection // ignore: cast_nullable_to_non_nullable
as SelectionState,locks: null == locks ? _self.locks : locks // ignore: cast_nullable_to_non_nullable
as LockSet,regionSelection: freezed == regionSelection ? _self.regionSelection : regionSelection // ignore: cast_nullable_to_non_nullable
as SelectionSnapshot?,config: null == config ? _self._config : config // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

/// Create a copy of ToolContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ViewportStateCopyWith<$Res> get viewport {
  
  return $ViewportStateCopyWith<$Res>(_self.viewport, (value) {
    return _then(_self.copyWith(viewport: value));
  });
}/// Create a copy of ToolContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SelectionStateCopyWith<$Res> get selection {
  
  return $SelectionStateCopyWith<$Res>(_self.selection, (value) {
    return _then(_self.copyWith(selection: value));
  });
}/// Create a copy of ToolContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LockSetCopyWith<$Res> get locks {
  
  return $LockSetCopyWith<$Res>(_self.locks, (value) {
    return _then(_self.copyWith(locks: value));
  });
}/// Create a copy of ToolContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SelectionSnapshotCopyWith<$Res>? get regionSelection {
    if (_self.regionSelection == null) {
    return null;
  }

  return $SelectionSnapshotCopyWith<$Res>(_self.regionSelection!, (value) {
    return _then(_self.copyWith(regionSelection: value));
  });
}
}


/// @nodoc
mixin _$ToolRequest {

/// Target node/layer ids the operation is scoped to.
 List<String> get targetIds;/// Optional region scope (canvas units).
 Rect2D? get region;/// Tool-specific parameters (typed per tool in its milestone).
 Map<String, Object?> get parameters;/// Reproducibility seed for AI-backed tools.
 int? get seed;
/// Create a copy of ToolRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToolRequestCopyWith<ToolRequest> get copyWith => _$ToolRequestCopyWithImpl<ToolRequest>(this as ToolRequest, _$identity);

  /// Serializes this ToolRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToolRequest&&const DeepCollectionEquality().equals(other.targetIds, targetIds)&&(identical(other.region, region) || other.region == region)&&const DeepCollectionEquality().equals(other.parameters, parameters)&&(identical(other.seed, seed) || other.seed == seed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(targetIds),region,const DeepCollectionEquality().hash(parameters),seed);

@override
String toString() {
  return 'ToolRequest(targetIds: $targetIds, region: $region, parameters: $parameters, seed: $seed)';
}


}

/// @nodoc
abstract mixin class $ToolRequestCopyWith<$Res>  {
  factory $ToolRequestCopyWith(ToolRequest value, $Res Function(ToolRequest) _then) = _$ToolRequestCopyWithImpl;
@useResult
$Res call({
 List<String> targetIds, Rect2D? region, Map<String, Object?> parameters, int? seed
});


$Rect2DCopyWith<$Res>? get region;

}
/// @nodoc
class _$ToolRequestCopyWithImpl<$Res>
    implements $ToolRequestCopyWith<$Res> {
  _$ToolRequestCopyWithImpl(this._self, this._then);

  final ToolRequest _self;
  final $Res Function(ToolRequest) _then;

/// Create a copy of ToolRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? targetIds = null,Object? region = freezed,Object? parameters = null,Object? seed = freezed,}) {
  return _then(_self.copyWith(
targetIds: null == targetIds ? _self.targetIds : targetIds // ignore: cast_nullable_to_non_nullable
as List<String>,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as Rect2D?,parameters: null == parameters ? _self.parameters : parameters // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,seed: freezed == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of ToolRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Rect2DCopyWith<$Res>? get region {
    if (_self.region == null) {
    return null;
  }

  return $Rect2DCopyWith<$Res>(_self.region!, (value) {
    return _then(_self.copyWith(region: value));
  });
}
}


/// Adds pattern-matching-related methods to [ToolRequest].
extension ToolRequestPatterns on ToolRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ToolRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ToolRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ToolRequest value)  $default,){
final _that = this;
switch (_that) {
case _ToolRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ToolRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ToolRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> targetIds,  Rect2D? region,  Map<String, Object?> parameters,  int? seed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ToolRequest() when $default != null:
return $default(_that.targetIds,_that.region,_that.parameters,_that.seed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> targetIds,  Rect2D? region,  Map<String, Object?> parameters,  int? seed)  $default,) {final _that = this;
switch (_that) {
case _ToolRequest():
return $default(_that.targetIds,_that.region,_that.parameters,_that.seed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> targetIds,  Rect2D? region,  Map<String, Object?> parameters,  int? seed)?  $default,) {final _that = this;
switch (_that) {
case _ToolRequest() when $default != null:
return $default(_that.targetIds,_that.region,_that.parameters,_that.seed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ToolRequest implements ToolRequest {
  const _ToolRequest({final  List<String> targetIds = const <String>[], this.region, final  Map<String, Object?> parameters = const <String, Object?>{}, this.seed}): _targetIds = targetIds,_parameters = parameters;
  factory _ToolRequest.fromJson(Map<String, dynamic> json) => _$ToolRequestFromJson(json);

/// Target node/layer ids the operation is scoped to.
 final  List<String> _targetIds;
/// Target node/layer ids the operation is scoped to.
@override@JsonKey() List<String> get targetIds {
  if (_targetIds is EqualUnmodifiableListView) return _targetIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_targetIds);
}

/// Optional region scope (canvas units).
@override final  Rect2D? region;
/// Tool-specific parameters (typed per tool in its milestone).
 final  Map<String, Object?> _parameters;
/// Tool-specific parameters (typed per tool in its milestone).
@override@JsonKey() Map<String, Object?> get parameters {
  if (_parameters is EqualUnmodifiableMapView) return _parameters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_parameters);
}

/// Reproducibility seed for AI-backed tools.
@override final  int? seed;

/// Create a copy of ToolRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToolRequestCopyWith<_ToolRequest> get copyWith => __$ToolRequestCopyWithImpl<_ToolRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ToolRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToolRequest&&const DeepCollectionEquality().equals(other._targetIds, _targetIds)&&(identical(other.region, region) || other.region == region)&&const DeepCollectionEquality().equals(other._parameters, _parameters)&&(identical(other.seed, seed) || other.seed == seed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_targetIds),region,const DeepCollectionEquality().hash(_parameters),seed);

@override
String toString() {
  return 'ToolRequest(targetIds: $targetIds, region: $region, parameters: $parameters, seed: $seed)';
}


}

/// @nodoc
abstract mixin class _$ToolRequestCopyWith<$Res> implements $ToolRequestCopyWith<$Res> {
  factory _$ToolRequestCopyWith(_ToolRequest value, $Res Function(_ToolRequest) _then) = __$ToolRequestCopyWithImpl;
@override @useResult
$Res call({
 List<String> targetIds, Rect2D? region, Map<String, Object?> parameters, int? seed
});


@override $Rect2DCopyWith<$Res>? get region;

}
/// @nodoc
class __$ToolRequestCopyWithImpl<$Res>
    implements _$ToolRequestCopyWith<$Res> {
  __$ToolRequestCopyWithImpl(this._self, this._then);

  final _ToolRequest _self;
  final $Res Function(_ToolRequest) _then;

/// Create a copy of ToolRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? targetIds = null,Object? region = freezed,Object? parameters = null,Object? seed = freezed,}) {
  return _then(_ToolRequest(
targetIds: null == targetIds ? _self._targetIds : targetIds // ignore: cast_nullable_to_non_nullable
as List<String>,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as Rect2D?,parameters: null == parameters ? _self._parameters : parameters // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,seed: freezed == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of ToolRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Rect2DCopyWith<$Res>? get region {
    if (_self.region == null) {
    return null;
  }

  return $Rect2DCopyWith<$Res>(_self.region!, (value) {
    return _then(_self.copyWith(region: value));
  });
}
}


/// @nodoc
mixin _$ToolPreview {

/// Stable UUID of the staged proposal.
 String get previewId;/// Human-readable description of the pending change.
 String get description; Map<String, Object?> get payload;
/// Create a copy of ToolPreview
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToolPreviewCopyWith<ToolPreview> get copyWith => _$ToolPreviewCopyWithImpl<ToolPreview>(this as ToolPreview, _$identity);

  /// Serializes this ToolPreview to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToolPreview&&(identical(other.previewId, previewId) || other.previewId == previewId)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.payload, payload));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,previewId,description,const DeepCollectionEquality().hash(payload));

@override
String toString() {
  return 'ToolPreview(previewId: $previewId, description: $description, payload: $payload)';
}


}

/// @nodoc
abstract mixin class $ToolPreviewCopyWith<$Res>  {
  factory $ToolPreviewCopyWith(ToolPreview value, $Res Function(ToolPreview) _then) = _$ToolPreviewCopyWithImpl;
@useResult
$Res call({
 String previewId, String description, Map<String, Object?> payload
});




}
/// @nodoc
class _$ToolPreviewCopyWithImpl<$Res>
    implements $ToolPreviewCopyWith<$Res> {
  _$ToolPreviewCopyWithImpl(this._self, this._then);

  final ToolPreview _self;
  final $Res Function(ToolPreview) _then;

/// Create a copy of ToolPreview
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? previewId = null,Object? description = null,Object? payload = null,}) {
  return _then(_self.copyWith(
previewId: null == previewId ? _self.previewId : previewId // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,payload: null == payload ? _self.payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

}


/// Adds pattern-matching-related methods to [ToolPreview].
extension ToolPreviewPatterns on ToolPreview {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ToolPreview value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ToolPreview() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ToolPreview value)  $default,){
final _that = this;
switch (_that) {
case _ToolPreview():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ToolPreview value)?  $default,){
final _that = this;
switch (_that) {
case _ToolPreview() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String previewId,  String description,  Map<String, Object?> payload)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ToolPreview() when $default != null:
return $default(_that.previewId,_that.description,_that.payload);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String previewId,  String description,  Map<String, Object?> payload)  $default,) {final _that = this;
switch (_that) {
case _ToolPreview():
return $default(_that.previewId,_that.description,_that.payload);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String previewId,  String description,  Map<String, Object?> payload)?  $default,) {final _that = this;
switch (_that) {
case _ToolPreview() when $default != null:
return $default(_that.previewId,_that.description,_that.payload);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ToolPreview implements ToolPreview {
  const _ToolPreview({required this.previewId, required this.description, final  Map<String, Object?> payload = const <String, Object?>{}}): _payload = payload;
  factory _ToolPreview.fromJson(Map<String, dynamic> json) => _$ToolPreviewFromJson(json);

/// Stable UUID of the staged proposal.
@override final  String previewId;
/// Human-readable description of the pending change.
@override final  String description;
 final  Map<String, Object?> _payload;
@override@JsonKey() Map<String, Object?> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of ToolPreview
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToolPreviewCopyWith<_ToolPreview> get copyWith => __$ToolPreviewCopyWithImpl<_ToolPreview>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ToolPreviewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToolPreview&&(identical(other.previewId, previewId) || other.previewId == previewId)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._payload, _payload));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,previewId,description,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'ToolPreview(previewId: $previewId, description: $description, payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$ToolPreviewCopyWith<$Res> implements $ToolPreviewCopyWith<$Res> {
  factory _$ToolPreviewCopyWith(_ToolPreview value, $Res Function(_ToolPreview) _then) = __$ToolPreviewCopyWithImpl;
@override @useResult
$Res call({
 String previewId, String description, Map<String, Object?> payload
});




}
/// @nodoc
class __$ToolPreviewCopyWithImpl<$Res>
    implements _$ToolPreviewCopyWith<$Res> {
  __$ToolPreviewCopyWithImpl(this._self, this._then);

  final _ToolPreview _self;
  final $Res Function(_ToolPreview) _then;

/// Create a copy of ToolPreview
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? previewId = null,Object? description = null,Object? payload = null,}) {
  return _then(_ToolPreview(
previewId: null == previewId ? _self.previewId : previewId // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}


/// @nodoc
mixin _$ToolResult {

 ToolResultStatus get status; String? get message;/// The staged proposal this result refers to, when applicable.
 String? get previewId; Map<String, Object?> get payload;
/// Create a copy of ToolResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToolResultCopyWith<ToolResult> get copyWith => _$ToolResultCopyWithImpl<ToolResult>(this as ToolResult, _$identity);

  /// Serializes this ToolResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToolResult&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.previewId, previewId) || other.previewId == previewId)&&const DeepCollectionEquality().equals(other.payload, payload));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,previewId,const DeepCollectionEquality().hash(payload));

@override
String toString() {
  return 'ToolResult(status: $status, message: $message, previewId: $previewId, payload: $payload)';
}


}

/// @nodoc
abstract mixin class $ToolResultCopyWith<$Res>  {
  factory $ToolResultCopyWith(ToolResult value, $Res Function(ToolResult) _then) = _$ToolResultCopyWithImpl;
@useResult
$Res call({
 ToolResultStatus status, String? message, String? previewId, Map<String, Object?> payload
});




}
/// @nodoc
class _$ToolResultCopyWithImpl<$Res>
    implements $ToolResultCopyWith<$Res> {
  _$ToolResultCopyWithImpl(this._self, this._then);

  final ToolResult _self;
  final $Res Function(ToolResult) _then;

/// Create a copy of ToolResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? message = freezed,Object? previewId = freezed,Object? payload = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ToolResultStatus,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,previewId: freezed == previewId ? _self.previewId : previewId // ignore: cast_nullable_to_non_nullable
as String?,payload: null == payload ? _self.payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

}


/// Adds pattern-matching-related methods to [ToolResult].
extension ToolResultPatterns on ToolResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ToolResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ToolResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ToolResult value)  $default,){
final _that = this;
switch (_that) {
case _ToolResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ToolResult value)?  $default,){
final _that = this;
switch (_that) {
case _ToolResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ToolResultStatus status,  String? message,  String? previewId,  Map<String, Object?> payload)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ToolResult() when $default != null:
return $default(_that.status,_that.message,_that.previewId,_that.payload);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ToolResultStatus status,  String? message,  String? previewId,  Map<String, Object?> payload)  $default,) {final _that = this;
switch (_that) {
case _ToolResult():
return $default(_that.status,_that.message,_that.previewId,_that.payload);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ToolResultStatus status,  String? message,  String? previewId,  Map<String, Object?> payload)?  $default,) {final _that = this;
switch (_that) {
case _ToolResult() when $default != null:
return $default(_that.status,_that.message,_that.previewId,_that.payload);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ToolResult extends ToolResult {
  const _ToolResult({required this.status, this.message, this.previewId, final  Map<String, Object?> payload = const <String, Object?>{}}): _payload = payload,super._();
  factory _ToolResult.fromJson(Map<String, dynamic> json) => _$ToolResultFromJson(json);

@override final  ToolResultStatus status;
@override final  String? message;
/// The staged proposal this result refers to, when applicable.
@override final  String? previewId;
 final  Map<String, Object?> _payload;
@override@JsonKey() Map<String, Object?> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of ToolResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToolResultCopyWith<_ToolResult> get copyWith => __$ToolResultCopyWithImpl<_ToolResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ToolResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToolResult&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.previewId, previewId) || other.previewId == previewId)&&const DeepCollectionEquality().equals(other._payload, _payload));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,previewId,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'ToolResult(status: $status, message: $message, previewId: $previewId, payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$ToolResultCopyWith<$Res> implements $ToolResultCopyWith<$Res> {
  factory _$ToolResultCopyWith(_ToolResult value, $Res Function(_ToolResult) _then) = __$ToolResultCopyWithImpl;
@override @useResult
$Res call({
 ToolResultStatus status, String? message, String? previewId, Map<String, Object?> payload
});




}
/// @nodoc
class __$ToolResultCopyWithImpl<$Res>
    implements _$ToolResultCopyWith<$Res> {
  __$ToolResultCopyWithImpl(this._self, this._then);

  final _ToolResult _self;
  final $Res Function(_ToolResult) _then;

/// Create a copy of ToolResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? message = freezed,Object? previewId = freezed,Object? payload = null,}) {
  return _then(_ToolResult(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ToolResultStatus,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,previewId: freezed == previewId ? _self.previewId : previewId // ignore: cast_nullable_to_non_nullable
as String?,payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}


/// @nodoc
mixin _$ToolHistoryEntry {

 String get id; String get description; Map<String, Object?> get metadata;
/// Create a copy of ToolHistoryEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToolHistoryEntryCopyWith<ToolHistoryEntry> get copyWith => _$ToolHistoryEntryCopyWithImpl<ToolHistoryEntry>(this as ToolHistoryEntry, _$identity);

  /// Serializes this ToolHistoryEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToolHistoryEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,description,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'ToolHistoryEntry(id: $id, description: $description, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $ToolHistoryEntryCopyWith<$Res>  {
  factory $ToolHistoryEntryCopyWith(ToolHistoryEntry value, $Res Function(ToolHistoryEntry) _then) = _$ToolHistoryEntryCopyWithImpl;
@useResult
$Res call({
 String id, String description, Map<String, Object?> metadata
});




}
/// @nodoc
class _$ToolHistoryEntryCopyWithImpl<$Res>
    implements $ToolHistoryEntryCopyWith<$Res> {
  _$ToolHistoryEntryCopyWithImpl(this._self, this._then);

  final ToolHistoryEntry _self;
  final $Res Function(ToolHistoryEntry) _then;

/// Create a copy of ToolHistoryEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? description = null,Object? metadata = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

}


/// Adds pattern-matching-related methods to [ToolHistoryEntry].
extension ToolHistoryEntryPatterns on ToolHistoryEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ToolHistoryEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ToolHistoryEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ToolHistoryEntry value)  $default,){
final _that = this;
switch (_that) {
case _ToolHistoryEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ToolHistoryEntry value)?  $default,){
final _that = this;
switch (_that) {
case _ToolHistoryEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String description,  Map<String, Object?> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ToolHistoryEntry() when $default != null:
return $default(_that.id,_that.description,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String description,  Map<String, Object?> metadata)  $default,) {final _that = this;
switch (_that) {
case _ToolHistoryEntry():
return $default(_that.id,_that.description,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String description,  Map<String, Object?> metadata)?  $default,) {final _that = this;
switch (_that) {
case _ToolHistoryEntry() when $default != null:
return $default(_that.id,_that.description,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ToolHistoryEntry implements ToolHistoryEntry {
  const _ToolHistoryEntry({required this.id, required this.description, final  Map<String, Object?> metadata = const <String, Object?>{}}): _metadata = metadata;
  factory _ToolHistoryEntry.fromJson(Map<String, dynamic> json) => _$ToolHistoryEntryFromJson(json);

@override final  String id;
@override final  String description;
 final  Map<String, Object?> _metadata;
@override@JsonKey() Map<String, Object?> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of ToolHistoryEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToolHistoryEntryCopyWith<_ToolHistoryEntry> get copyWith => __$ToolHistoryEntryCopyWithImpl<_ToolHistoryEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ToolHistoryEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToolHistoryEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,description,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'ToolHistoryEntry(id: $id, description: $description, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$ToolHistoryEntryCopyWith<$Res> implements $ToolHistoryEntryCopyWith<$Res> {
  factory _$ToolHistoryEntryCopyWith(_ToolHistoryEntry value, $Res Function(_ToolHistoryEntry) _then) = __$ToolHistoryEntryCopyWithImpl;
@override @useResult
$Res call({
 String id, String description, Map<String, Object?> metadata
});




}
/// @nodoc
class __$ToolHistoryEntryCopyWithImpl<$Res>
    implements _$ToolHistoryEntryCopyWith<$Res> {
  __$ToolHistoryEntryCopyWithImpl(this._self, this._then);

  final _ToolHistoryEntry _self;
  final $Res Function(_ToolHistoryEntry) _then;

/// Create a copy of ToolHistoryEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? description = null,Object? metadata = null,}) {
  return _then(_ToolHistoryEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}


/// @nodoc
mixin _$ToolHistory {

 List<ToolHistoryEntry> get entries; int get cursor;
/// Create a copy of ToolHistory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToolHistoryCopyWith<ToolHistory> get copyWith => _$ToolHistoryCopyWithImpl<ToolHistory>(this as ToolHistory, _$identity);

  /// Serializes this ToolHistory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToolHistory&&const DeepCollectionEquality().equals(other.entries, entries)&&(identical(other.cursor, cursor) || other.cursor == cursor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(entries),cursor);

@override
String toString() {
  return 'ToolHistory(entries: $entries, cursor: $cursor)';
}


}

/// @nodoc
abstract mixin class $ToolHistoryCopyWith<$Res>  {
  factory $ToolHistoryCopyWith(ToolHistory value, $Res Function(ToolHistory) _then) = _$ToolHistoryCopyWithImpl;
@useResult
$Res call({
 List<ToolHistoryEntry> entries, int cursor
});




}
/// @nodoc
class _$ToolHistoryCopyWithImpl<$Res>
    implements $ToolHistoryCopyWith<$Res> {
  _$ToolHistoryCopyWithImpl(this._self, this._then);

  final ToolHistory _self;
  final $Res Function(ToolHistory) _then;

/// Create a copy of ToolHistory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? entries = null,Object? cursor = null,}) {
  return _then(_self.copyWith(
entries: null == entries ? _self.entries : entries // ignore: cast_nullable_to_non_nullable
as List<ToolHistoryEntry>,cursor: null == cursor ? _self.cursor : cursor // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ToolHistory].
extension ToolHistoryPatterns on ToolHistory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ToolHistory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ToolHistory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ToolHistory value)  $default,){
final _that = this;
switch (_that) {
case _ToolHistory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ToolHistory value)?  $default,){
final _that = this;
switch (_that) {
case _ToolHistory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ToolHistoryEntry> entries,  int cursor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ToolHistory() when $default != null:
return $default(_that.entries,_that.cursor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ToolHistoryEntry> entries,  int cursor)  $default,) {final _that = this;
switch (_that) {
case _ToolHistory():
return $default(_that.entries,_that.cursor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ToolHistoryEntry> entries,  int cursor)?  $default,) {final _that = this;
switch (_that) {
case _ToolHistory() when $default != null:
return $default(_that.entries,_that.cursor);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ToolHistory extends ToolHistory {
  const _ToolHistory({final  List<ToolHistoryEntry> entries = const <ToolHistoryEntry>[], this.cursor = -1}): _entries = entries,super._();
  factory _ToolHistory.fromJson(Map<String, dynamic> json) => _$ToolHistoryFromJson(json);

 final  List<ToolHistoryEntry> _entries;
@override@JsonKey() List<ToolHistoryEntry> get entries {
  if (_entries is EqualUnmodifiableListView) return _entries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entries);
}

@override@JsonKey() final  int cursor;

/// Create a copy of ToolHistory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToolHistoryCopyWith<_ToolHistory> get copyWith => __$ToolHistoryCopyWithImpl<_ToolHistory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ToolHistoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToolHistory&&const DeepCollectionEquality().equals(other._entries, _entries)&&(identical(other.cursor, cursor) || other.cursor == cursor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_entries),cursor);

@override
String toString() {
  return 'ToolHistory(entries: $entries, cursor: $cursor)';
}


}

/// @nodoc
abstract mixin class _$ToolHistoryCopyWith<$Res> implements $ToolHistoryCopyWith<$Res> {
  factory _$ToolHistoryCopyWith(_ToolHistory value, $Res Function(_ToolHistory) _then) = __$ToolHistoryCopyWithImpl;
@override @useResult
$Res call({
 List<ToolHistoryEntry> entries, int cursor
});




}
/// @nodoc
class __$ToolHistoryCopyWithImpl<$Res>
    implements _$ToolHistoryCopyWith<$Res> {
  __$ToolHistoryCopyWithImpl(this._self, this._then);

  final _ToolHistory _self;
  final $Res Function(_ToolHistory) _then;

/// Create a copy of ToolHistory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? entries = null,Object? cursor = null,}) {
  return _then(_ToolHistory(
entries: null == entries ? _self._entries : entries // ignore: cast_nullable_to_non_nullable
as List<ToolHistoryEntry>,cursor: null == cursor ? _self.cursor : cursor // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
