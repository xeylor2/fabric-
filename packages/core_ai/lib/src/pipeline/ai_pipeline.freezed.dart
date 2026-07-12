// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_pipeline.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AiPipelineRun {

/// Stable UUID of this run.
 String get id;/// Stages completed so far, in order.
 List<AiPipelineStage> get completed; Map<String, Object?> get metadata;
/// Create a copy of AiPipelineRun
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AiPipelineRunCopyWith<AiPipelineRun> get copyWith => _$AiPipelineRunCopyWithImpl<AiPipelineRun>(this as AiPipelineRun, _$identity);

  /// Serializes this AiPipelineRun to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiPipelineRun&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.completed, completed)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(completed),const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'AiPipelineRun(id: $id, completed: $completed, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $AiPipelineRunCopyWith<$Res>  {
  factory $AiPipelineRunCopyWith(AiPipelineRun value, $Res Function(AiPipelineRun) _then) = _$AiPipelineRunCopyWithImpl;
@useResult
$Res call({
 String id, List<AiPipelineStage> completed, Map<String, Object?> metadata
});




}
/// @nodoc
class _$AiPipelineRunCopyWithImpl<$Res>
    implements $AiPipelineRunCopyWith<$Res> {
  _$AiPipelineRunCopyWithImpl(this._self, this._then);

  final AiPipelineRun _self;
  final $Res Function(AiPipelineRun) _then;

/// Create a copy of AiPipelineRun
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? completed = null,Object? metadata = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as List<AiPipelineStage>,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

}


/// Adds pattern-matching-related methods to [AiPipelineRun].
extension AiPipelineRunPatterns on AiPipelineRun {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AiPipelineRun value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AiPipelineRun() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AiPipelineRun value)  $default,){
final _that = this;
switch (_that) {
case _AiPipelineRun():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AiPipelineRun value)?  $default,){
final _that = this;
switch (_that) {
case _AiPipelineRun() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  List<AiPipelineStage> completed,  Map<String, Object?> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AiPipelineRun() when $default != null:
return $default(_that.id,_that.completed,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  List<AiPipelineStage> completed,  Map<String, Object?> metadata)  $default,) {final _that = this;
switch (_that) {
case _AiPipelineRun():
return $default(_that.id,_that.completed,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  List<AiPipelineStage> completed,  Map<String, Object?> metadata)?  $default,) {final _that = this;
switch (_that) {
case _AiPipelineRun() when $default != null:
return $default(_that.id,_that.completed,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AiPipelineRun extends AiPipelineRun {
  const _AiPipelineRun({required this.id, final  List<AiPipelineStage> completed = const <AiPipelineStage>[], final  Map<String, Object?> metadata = const <String, Object?>{}}): _completed = completed,_metadata = metadata,super._();
  factory _AiPipelineRun.fromJson(Map<String, dynamic> json) => _$AiPipelineRunFromJson(json);

/// Stable UUID of this run.
@override final  String id;
/// Stages completed so far, in order.
 final  List<AiPipelineStage> _completed;
/// Stages completed so far, in order.
@override@JsonKey() List<AiPipelineStage> get completed {
  if (_completed is EqualUnmodifiableListView) return _completed;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_completed);
}

 final  Map<String, Object?> _metadata;
@override@JsonKey() Map<String, Object?> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of AiPipelineRun
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AiPipelineRunCopyWith<_AiPipelineRun> get copyWith => __$AiPipelineRunCopyWithImpl<_AiPipelineRun>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AiPipelineRunToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AiPipelineRun&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._completed, _completed)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_completed),const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'AiPipelineRun(id: $id, completed: $completed, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$AiPipelineRunCopyWith<$Res> implements $AiPipelineRunCopyWith<$Res> {
  factory _$AiPipelineRunCopyWith(_AiPipelineRun value, $Res Function(_AiPipelineRun) _then) = __$AiPipelineRunCopyWithImpl;
@override @useResult
$Res call({
 String id, List<AiPipelineStage> completed, Map<String, Object?> metadata
});




}
/// @nodoc
class __$AiPipelineRunCopyWithImpl<$Res>
    implements _$AiPipelineRunCopyWith<$Res> {
  __$AiPipelineRunCopyWithImpl(this._self, this._then);

  final _AiPipelineRun _self;
  final $Res Function(_AiPipelineRun) _then;

/// Create a copy of AiPipelineRun
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? completed = null,Object? metadata = null,}) {
  return _then(_AiPipelineRun(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,completed: null == completed ? _self._completed : completed // ignore: cast_nullable_to_non_nullable
as List<AiPipelineStage>,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}

// dart format on
