// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'canvas_reference.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CanvasReference {

 CanvasReferenceKind get kind;/// The owning engine's identifier for the referenced resource.
 String get refId;
/// Create a copy of CanvasReference
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CanvasReferenceCopyWith<CanvasReference> get copyWith => _$CanvasReferenceCopyWithImpl<CanvasReference>(this as CanvasReference, _$identity);

  /// Serializes this CanvasReference to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CanvasReference&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.refId, refId) || other.refId == refId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,refId);

@override
String toString() {
  return 'CanvasReference(kind: $kind, refId: $refId)';
}


}

/// @nodoc
abstract mixin class $CanvasReferenceCopyWith<$Res>  {
  factory $CanvasReferenceCopyWith(CanvasReference value, $Res Function(CanvasReference) _then) = _$CanvasReferenceCopyWithImpl;
@useResult
$Res call({
 CanvasReferenceKind kind, String refId
});




}
/// @nodoc
class _$CanvasReferenceCopyWithImpl<$Res>
    implements $CanvasReferenceCopyWith<$Res> {
  _$CanvasReferenceCopyWithImpl(this._self, this._then);

  final CanvasReference _self;
  final $Res Function(CanvasReference) _then;

/// Create a copy of CanvasReference
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? refId = null,}) {
  return _then(_self.copyWith(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as CanvasReferenceKind,refId: null == refId ? _self.refId : refId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CanvasReference].
extension CanvasReferencePatterns on CanvasReference {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CanvasReference value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CanvasReference() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CanvasReference value)  $default,){
final _that = this;
switch (_that) {
case _CanvasReference():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CanvasReference value)?  $default,){
final _that = this;
switch (_that) {
case _CanvasReference() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CanvasReferenceKind kind,  String refId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CanvasReference() when $default != null:
return $default(_that.kind,_that.refId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CanvasReferenceKind kind,  String refId)  $default,) {final _that = this;
switch (_that) {
case _CanvasReference():
return $default(_that.kind,_that.refId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CanvasReferenceKind kind,  String refId)?  $default,) {final _that = this;
switch (_that) {
case _CanvasReference() when $default != null:
return $default(_that.kind,_that.refId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CanvasReference implements CanvasReference {
  const _CanvasReference({required this.kind, required this.refId});
  factory _CanvasReference.fromJson(Map<String, dynamic> json) => _$CanvasReferenceFromJson(json);

@override final  CanvasReferenceKind kind;
/// The owning engine's identifier for the referenced resource.
@override final  String refId;

/// Create a copy of CanvasReference
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CanvasReferenceCopyWith<_CanvasReference> get copyWith => __$CanvasReferenceCopyWithImpl<_CanvasReference>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CanvasReferenceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CanvasReference&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.refId, refId) || other.refId == refId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,refId);

@override
String toString() {
  return 'CanvasReference(kind: $kind, refId: $refId)';
}


}

/// @nodoc
abstract mixin class _$CanvasReferenceCopyWith<$Res> implements $CanvasReferenceCopyWith<$Res> {
  factory _$CanvasReferenceCopyWith(_CanvasReference value, $Res Function(_CanvasReference) _then) = __$CanvasReferenceCopyWithImpl;
@override @useResult
$Res call({
 CanvasReferenceKind kind, String refId
});




}
/// @nodoc
class __$CanvasReferenceCopyWithImpl<$Res>
    implements _$CanvasReferenceCopyWith<$Res> {
  __$CanvasReferenceCopyWithImpl(this._self, this._then);

  final _CanvasReference _self;
  final $Res Function(_CanvasReference) _then;

/// Create a copy of CanvasReference
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? refId = null,}) {
  return _then(_CanvasReference(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as CanvasReferenceKind,refId: null == refId ? _self.refId : refId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
