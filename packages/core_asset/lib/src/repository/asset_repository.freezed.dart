// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asset_repository.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AssetEngineState {

 String get projectId; AssetCatalogue get catalogue; AssetUsageGraph get graph;
/// Create a copy of AssetEngineState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssetEngineStateCopyWith<AssetEngineState> get copyWith => _$AssetEngineStateCopyWithImpl<AssetEngineState>(this as AssetEngineState, _$identity);

  /// Serializes this AssetEngineState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssetEngineState&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.catalogue, catalogue) || other.catalogue == catalogue)&&(identical(other.graph, graph) || other.graph == graph));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,projectId,catalogue,graph);

@override
String toString() {
  return 'AssetEngineState(projectId: $projectId, catalogue: $catalogue, graph: $graph)';
}


}

/// @nodoc
abstract mixin class $AssetEngineStateCopyWith<$Res>  {
  factory $AssetEngineStateCopyWith(AssetEngineState value, $Res Function(AssetEngineState) _then) = _$AssetEngineStateCopyWithImpl;
@useResult
$Res call({
 String projectId, AssetCatalogue catalogue, AssetUsageGraph graph
});


$AssetCatalogueCopyWith<$Res> get catalogue;$AssetUsageGraphCopyWith<$Res> get graph;

}
/// @nodoc
class _$AssetEngineStateCopyWithImpl<$Res>
    implements $AssetEngineStateCopyWith<$Res> {
  _$AssetEngineStateCopyWithImpl(this._self, this._then);

  final AssetEngineState _self;
  final $Res Function(AssetEngineState) _then;

/// Create a copy of AssetEngineState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? projectId = null,Object? catalogue = null,Object? graph = null,}) {
  return _then(_self.copyWith(
projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,catalogue: null == catalogue ? _self.catalogue : catalogue // ignore: cast_nullable_to_non_nullable
as AssetCatalogue,graph: null == graph ? _self.graph : graph // ignore: cast_nullable_to_non_nullable
as AssetUsageGraph,
  ));
}
/// Create a copy of AssetEngineState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssetCatalogueCopyWith<$Res> get catalogue {
  
  return $AssetCatalogueCopyWith<$Res>(_self.catalogue, (value) {
    return _then(_self.copyWith(catalogue: value));
  });
}/// Create a copy of AssetEngineState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssetUsageGraphCopyWith<$Res> get graph {
  
  return $AssetUsageGraphCopyWith<$Res>(_self.graph, (value) {
    return _then(_self.copyWith(graph: value));
  });
}
}


/// Adds pattern-matching-related methods to [AssetEngineState].
extension AssetEngineStatePatterns on AssetEngineState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AssetEngineState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AssetEngineState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AssetEngineState value)  $default,){
final _that = this;
switch (_that) {
case _AssetEngineState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AssetEngineState value)?  $default,){
final _that = this;
switch (_that) {
case _AssetEngineState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String projectId,  AssetCatalogue catalogue,  AssetUsageGraph graph)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AssetEngineState() when $default != null:
return $default(_that.projectId,_that.catalogue,_that.graph);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String projectId,  AssetCatalogue catalogue,  AssetUsageGraph graph)  $default,) {final _that = this;
switch (_that) {
case _AssetEngineState():
return $default(_that.projectId,_that.catalogue,_that.graph);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String projectId,  AssetCatalogue catalogue,  AssetUsageGraph graph)?  $default,) {final _that = this;
switch (_that) {
case _AssetEngineState() when $default != null:
return $default(_that.projectId,_that.catalogue,_that.graph);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AssetEngineState implements AssetEngineState {
  const _AssetEngineState({required this.projectId, this.catalogue = AssetCatalogue.empty, this.graph = AssetUsageGraph.empty});
  factory _AssetEngineState.fromJson(Map<String, dynamic> json) => _$AssetEngineStateFromJson(json);

@override final  String projectId;
@override@JsonKey() final  AssetCatalogue catalogue;
@override@JsonKey() final  AssetUsageGraph graph;

/// Create a copy of AssetEngineState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssetEngineStateCopyWith<_AssetEngineState> get copyWith => __$AssetEngineStateCopyWithImpl<_AssetEngineState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssetEngineStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssetEngineState&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.catalogue, catalogue) || other.catalogue == catalogue)&&(identical(other.graph, graph) || other.graph == graph));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,projectId,catalogue,graph);

@override
String toString() {
  return 'AssetEngineState(projectId: $projectId, catalogue: $catalogue, graph: $graph)';
}


}

/// @nodoc
abstract mixin class _$AssetEngineStateCopyWith<$Res> implements $AssetEngineStateCopyWith<$Res> {
  factory _$AssetEngineStateCopyWith(_AssetEngineState value, $Res Function(_AssetEngineState) _then) = __$AssetEngineStateCopyWithImpl;
@override @useResult
$Res call({
 String projectId, AssetCatalogue catalogue, AssetUsageGraph graph
});


@override $AssetCatalogueCopyWith<$Res> get catalogue;@override $AssetUsageGraphCopyWith<$Res> get graph;

}
/// @nodoc
class __$AssetEngineStateCopyWithImpl<$Res>
    implements _$AssetEngineStateCopyWith<$Res> {
  __$AssetEngineStateCopyWithImpl(this._self, this._then);

  final _AssetEngineState _self;
  final $Res Function(_AssetEngineState) _then;

/// Create a copy of AssetEngineState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? projectId = null,Object? catalogue = null,Object? graph = null,}) {
  return _then(_AssetEngineState(
projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,catalogue: null == catalogue ? _self.catalogue : catalogue // ignore: cast_nullable_to_non_nullable
as AssetCatalogue,graph: null == graph ? _self.graph : graph // ignore: cast_nullable_to_non_nullable
as AssetUsageGraph,
  ));
}

/// Create a copy of AssetEngineState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssetCatalogueCopyWith<$Res> get catalogue {
  
  return $AssetCatalogueCopyWith<$Res>(_self.catalogue, (value) {
    return _then(_self.copyWith(catalogue: value));
  });
}/// Create a copy of AssetEngineState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssetUsageGraphCopyWith<$Res> get graph {
  
  return $AssetUsageGraphCopyWith<$Res>(_self.graph, (value) {
    return _then(_self.copyWith(graph: value));
  });
}
}

// dart format on
