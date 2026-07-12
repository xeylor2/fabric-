// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inertia.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InertiaSpec {

/// Release velocity in logical pixels per second.
 Point2D get initialVelocity;/// Decay rate λ per second — higher stops sooner.
 double get friction;/// Velocity magnitude (px/s) below which the fling is considered done.
 double get restVelocity;
/// Create a copy of InertiaSpec
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InertiaSpecCopyWith<InertiaSpec> get copyWith => _$InertiaSpecCopyWithImpl<InertiaSpec>(this as InertiaSpec, _$identity);

  /// Serializes this InertiaSpec to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InertiaSpec&&(identical(other.initialVelocity, initialVelocity) || other.initialVelocity == initialVelocity)&&(identical(other.friction, friction) || other.friction == friction)&&(identical(other.restVelocity, restVelocity) || other.restVelocity == restVelocity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,initialVelocity,friction,restVelocity);

@override
String toString() {
  return 'InertiaSpec(initialVelocity: $initialVelocity, friction: $friction, restVelocity: $restVelocity)';
}


}

/// @nodoc
abstract mixin class $InertiaSpecCopyWith<$Res>  {
  factory $InertiaSpecCopyWith(InertiaSpec value, $Res Function(InertiaSpec) _then) = _$InertiaSpecCopyWithImpl;
@useResult
$Res call({
 Point2D initialVelocity, double friction, double restVelocity
});


$Point2DCopyWith<$Res> get initialVelocity;

}
/// @nodoc
class _$InertiaSpecCopyWithImpl<$Res>
    implements $InertiaSpecCopyWith<$Res> {
  _$InertiaSpecCopyWithImpl(this._self, this._then);

  final InertiaSpec _self;
  final $Res Function(InertiaSpec) _then;

/// Create a copy of InertiaSpec
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? initialVelocity = null,Object? friction = null,Object? restVelocity = null,}) {
  return _then(_self.copyWith(
initialVelocity: null == initialVelocity ? _self.initialVelocity : initialVelocity // ignore: cast_nullable_to_non_nullable
as Point2D,friction: null == friction ? _self.friction : friction // ignore: cast_nullable_to_non_nullable
as double,restVelocity: null == restVelocity ? _self.restVelocity : restVelocity // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of InertiaSpec
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Point2DCopyWith<$Res> get initialVelocity {
  
  return $Point2DCopyWith<$Res>(_self.initialVelocity, (value) {
    return _then(_self.copyWith(initialVelocity: value));
  });
}
}


/// Adds pattern-matching-related methods to [InertiaSpec].
extension InertiaSpecPatterns on InertiaSpec {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InertiaSpec value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InertiaSpec() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InertiaSpec value)  $default,){
final _that = this;
switch (_that) {
case _InertiaSpec():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InertiaSpec value)?  $default,){
final _that = this;
switch (_that) {
case _InertiaSpec() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Point2D initialVelocity,  double friction,  double restVelocity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InertiaSpec() when $default != null:
return $default(_that.initialVelocity,_that.friction,_that.restVelocity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Point2D initialVelocity,  double friction,  double restVelocity)  $default,) {final _that = this;
switch (_that) {
case _InertiaSpec():
return $default(_that.initialVelocity,_that.friction,_that.restVelocity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Point2D initialVelocity,  double friction,  double restVelocity)?  $default,) {final _that = this;
switch (_that) {
case _InertiaSpec() when $default != null:
return $default(_that.initialVelocity,_that.friction,_that.restVelocity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InertiaSpec extends InertiaSpec {
  const _InertiaSpec({required this.initialVelocity, this.friction = 4.5, this.restVelocity = 20.0}): super._();
  factory _InertiaSpec.fromJson(Map<String, dynamic> json) => _$InertiaSpecFromJson(json);

/// Release velocity in logical pixels per second.
@override final  Point2D initialVelocity;
/// Decay rate λ per second — higher stops sooner.
@override@JsonKey() final  double friction;
/// Velocity magnitude (px/s) below which the fling is considered done.
@override@JsonKey() final  double restVelocity;

/// Create a copy of InertiaSpec
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InertiaSpecCopyWith<_InertiaSpec> get copyWith => __$InertiaSpecCopyWithImpl<_InertiaSpec>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InertiaSpecToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InertiaSpec&&(identical(other.initialVelocity, initialVelocity) || other.initialVelocity == initialVelocity)&&(identical(other.friction, friction) || other.friction == friction)&&(identical(other.restVelocity, restVelocity) || other.restVelocity == restVelocity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,initialVelocity,friction,restVelocity);

@override
String toString() {
  return 'InertiaSpec(initialVelocity: $initialVelocity, friction: $friction, restVelocity: $restVelocity)';
}


}

/// @nodoc
abstract mixin class _$InertiaSpecCopyWith<$Res> implements $InertiaSpecCopyWith<$Res> {
  factory _$InertiaSpecCopyWith(_InertiaSpec value, $Res Function(_InertiaSpec) _then) = __$InertiaSpecCopyWithImpl;
@override @useResult
$Res call({
 Point2D initialVelocity, double friction, double restVelocity
});


@override $Point2DCopyWith<$Res> get initialVelocity;

}
/// @nodoc
class __$InertiaSpecCopyWithImpl<$Res>
    implements _$InertiaSpecCopyWith<$Res> {
  __$InertiaSpecCopyWithImpl(this._self, this._then);

  final _InertiaSpec _self;
  final $Res Function(_InertiaSpec) _then;

/// Create a copy of InertiaSpec
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? initialVelocity = null,Object? friction = null,Object? restVelocity = null,}) {
  return _then(_InertiaSpec(
initialVelocity: null == initialVelocity ? _self.initialVelocity : initialVelocity // ignore: cast_nullable_to_non_nullable
as Point2D,friction: null == friction ? _self.friction : friction // ignore: cast_nullable_to_non_nullable
as double,restVelocity: null == restVelocity ? _self.restVelocity : restVelocity // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of InertiaSpec
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Point2DCopyWith<$Res> get initialVelocity {
  
  return $Point2DCopyWith<$Res>(_self.initialVelocity, (value) {
    return _then(_self.copyWith(initialVelocity: value));
  });
}
}

// dart format on
