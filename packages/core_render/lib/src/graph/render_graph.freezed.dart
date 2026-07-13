// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'render_graph.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RenderGraph {

/// The document revision this graph was compiled from (frozen
/// `core_document` identity — immutable, hash-pinnable).
 RevisionId get revision;/// The target this graph was compiled for.
 RenderTarget get target;/// Render objects in deterministic draw order (ascending
/// `RenderObject.order`, ties by `RenderObject.id`).
 List<RenderObject> get objects;
/// Create a copy of RenderGraph
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RenderGraphCopyWith<RenderGraph> get copyWith => _$RenderGraphCopyWithImpl<RenderGraph>(this as RenderGraph, _$identity);

  /// Serializes this RenderGraph to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RenderGraph&&(identical(other.revision, revision) || other.revision == revision)&&(identical(other.target, target) || other.target == target)&&const DeepCollectionEquality().equals(other.objects, objects));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,revision,target,const DeepCollectionEquality().hash(objects));

@override
String toString() {
  return 'RenderGraph(revision: $revision, target: $target, objects: $objects)';
}


}

/// @nodoc
abstract mixin class $RenderGraphCopyWith<$Res>  {
  factory $RenderGraphCopyWith(RenderGraph value, $Res Function(RenderGraph) _then) = _$RenderGraphCopyWithImpl;
@useResult
$Res call({
 RevisionId revision, RenderTarget target, List<RenderObject> objects
});


$RevisionIdCopyWith<$Res> get revision;$RenderTargetCopyWith<$Res> get target;

}
/// @nodoc
class _$RenderGraphCopyWithImpl<$Res>
    implements $RenderGraphCopyWith<$Res> {
  _$RenderGraphCopyWithImpl(this._self, this._then);

  final RenderGraph _self;
  final $Res Function(RenderGraph) _then;

/// Create a copy of RenderGraph
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? revision = null,Object? target = null,Object? objects = null,}) {
  return _then(_self.copyWith(
revision: null == revision ? _self.revision : revision // ignore: cast_nullable_to_non_nullable
as RevisionId,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as RenderTarget,objects: null == objects ? _self.objects : objects // ignore: cast_nullable_to_non_nullable
as List<RenderObject>,
  ));
}
/// Create a copy of RenderGraph
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RevisionIdCopyWith<$Res> get revision {
  
  return $RevisionIdCopyWith<$Res>(_self.revision, (value) {
    return _then(_self.copyWith(revision: value));
  });
}/// Create a copy of RenderGraph
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RenderTargetCopyWith<$Res> get target {
  
  return $RenderTargetCopyWith<$Res>(_self.target, (value) {
    return _then(_self.copyWith(target: value));
  });
}
}


/// Adds pattern-matching-related methods to [RenderGraph].
extension RenderGraphPatterns on RenderGraph {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RenderGraph value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RenderGraph() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RenderGraph value)  $default,){
final _that = this;
switch (_that) {
case _RenderGraph():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RenderGraph value)?  $default,){
final _that = this;
switch (_that) {
case _RenderGraph() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RevisionId revision,  RenderTarget target,  List<RenderObject> objects)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RenderGraph() when $default != null:
return $default(_that.revision,_that.target,_that.objects);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RevisionId revision,  RenderTarget target,  List<RenderObject> objects)  $default,) {final _that = this;
switch (_that) {
case _RenderGraph():
return $default(_that.revision,_that.target,_that.objects);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RevisionId revision,  RenderTarget target,  List<RenderObject> objects)?  $default,) {final _that = this;
switch (_that) {
case _RenderGraph() when $default != null:
return $default(_that.revision,_that.target,_that.objects);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RenderGraph extends RenderGraph {
  const _RenderGraph({required this.revision, required this.target, final  List<RenderObject> objects = const <RenderObject>[]}): _objects = objects,super._();
  factory _RenderGraph.fromJson(Map<String, dynamic> json) => _$RenderGraphFromJson(json);

/// The document revision this graph was compiled from (frozen
/// `core_document` identity — immutable, hash-pinnable).
@override final  RevisionId revision;
/// The target this graph was compiled for.
@override final  RenderTarget target;
/// Render objects in deterministic draw order (ascending
/// `RenderObject.order`, ties by `RenderObject.id`).
 final  List<RenderObject> _objects;
/// Render objects in deterministic draw order (ascending
/// `RenderObject.order`, ties by `RenderObject.id`).
@override@JsonKey() List<RenderObject> get objects {
  if (_objects is EqualUnmodifiableListView) return _objects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_objects);
}


/// Create a copy of RenderGraph
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RenderGraphCopyWith<_RenderGraph> get copyWith => __$RenderGraphCopyWithImpl<_RenderGraph>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RenderGraphToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RenderGraph&&(identical(other.revision, revision) || other.revision == revision)&&(identical(other.target, target) || other.target == target)&&const DeepCollectionEquality().equals(other._objects, _objects));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,revision,target,const DeepCollectionEquality().hash(_objects));

@override
String toString() {
  return 'RenderGraph(revision: $revision, target: $target, objects: $objects)';
}


}

/// @nodoc
abstract mixin class _$RenderGraphCopyWith<$Res> implements $RenderGraphCopyWith<$Res> {
  factory _$RenderGraphCopyWith(_RenderGraph value, $Res Function(_RenderGraph) _then) = __$RenderGraphCopyWithImpl;
@override @useResult
$Res call({
 RevisionId revision, RenderTarget target, List<RenderObject> objects
});


@override $RevisionIdCopyWith<$Res> get revision;@override $RenderTargetCopyWith<$Res> get target;

}
/// @nodoc
class __$RenderGraphCopyWithImpl<$Res>
    implements _$RenderGraphCopyWith<$Res> {
  __$RenderGraphCopyWithImpl(this._self, this._then);

  final _RenderGraph _self;
  final $Res Function(_RenderGraph) _then;

/// Create a copy of RenderGraph
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? revision = null,Object? target = null,Object? objects = null,}) {
  return _then(_RenderGraph(
revision: null == revision ? _self.revision : revision // ignore: cast_nullable_to_non_nullable
as RevisionId,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as RenderTarget,objects: null == objects ? _self._objects : objects // ignore: cast_nullable_to_non_nullable
as List<RenderObject>,
  ));
}

/// Create a copy of RenderGraph
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RevisionIdCopyWith<$Res> get revision {
  
  return $RevisionIdCopyWith<$Res>(_self.revision, (value) {
    return _then(_self.copyWith(revision: value));
  });
}/// Create a copy of RenderGraph
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RenderTargetCopyWith<$Res> get target {
  
  return $RenderTargetCopyWith<$Res>(_self.target, (value) {
    return _then(_self.copyWith(target: value));
  });
}
}

// dart format on
