// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'viewport_animation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ViewportAnimation {

 ViewportState get from; ViewportState get to; Duration get duration; ViewportCurve get curve;
/// Create a copy of ViewportAnimation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ViewportAnimationCopyWith<ViewportAnimation> get copyWith => _$ViewportAnimationCopyWithImpl<ViewportAnimation>(this as ViewportAnimation, _$identity);

  /// Serializes this ViewportAnimation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ViewportAnimation&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.curve, curve) || other.curve == curve));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,from,to,duration,curve);

@override
String toString() {
  return 'ViewportAnimation(from: $from, to: $to, duration: $duration, curve: $curve)';
}


}

/// @nodoc
abstract mixin class $ViewportAnimationCopyWith<$Res>  {
  factory $ViewportAnimationCopyWith(ViewportAnimation value, $Res Function(ViewportAnimation) _then) = _$ViewportAnimationCopyWithImpl;
@useResult
$Res call({
 ViewportState from, ViewportState to, Duration duration, ViewportCurve curve
});


$ViewportStateCopyWith<$Res> get from;$ViewportStateCopyWith<$Res> get to;

}
/// @nodoc
class _$ViewportAnimationCopyWithImpl<$Res>
    implements $ViewportAnimationCopyWith<$Res> {
  _$ViewportAnimationCopyWithImpl(this._self, this._then);

  final ViewportAnimation _self;
  final $Res Function(ViewportAnimation) _then;

/// Create a copy of ViewportAnimation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? from = null,Object? to = null,Object? duration = null,Object? curve = null,}) {
  return _then(_self.copyWith(
from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as ViewportState,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as ViewportState,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,curve: null == curve ? _self.curve : curve // ignore: cast_nullable_to_non_nullable
as ViewportCurve,
  ));
}
/// Create a copy of ViewportAnimation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ViewportStateCopyWith<$Res> get from {
  
  return $ViewportStateCopyWith<$Res>(_self.from, (value) {
    return _then(_self.copyWith(from: value));
  });
}/// Create a copy of ViewportAnimation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ViewportStateCopyWith<$Res> get to {
  
  return $ViewportStateCopyWith<$Res>(_self.to, (value) {
    return _then(_self.copyWith(to: value));
  });
}
}


/// Adds pattern-matching-related methods to [ViewportAnimation].
extension ViewportAnimationPatterns on ViewportAnimation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ViewportAnimation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ViewportAnimation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ViewportAnimation value)  $default,){
final _that = this;
switch (_that) {
case _ViewportAnimation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ViewportAnimation value)?  $default,){
final _that = this;
switch (_that) {
case _ViewportAnimation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ViewportState from,  ViewportState to,  Duration duration,  ViewportCurve curve)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ViewportAnimation() when $default != null:
return $default(_that.from,_that.to,_that.duration,_that.curve);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ViewportState from,  ViewportState to,  Duration duration,  ViewportCurve curve)  $default,) {final _that = this;
switch (_that) {
case _ViewportAnimation():
return $default(_that.from,_that.to,_that.duration,_that.curve);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ViewportState from,  ViewportState to,  Duration duration,  ViewportCurve curve)?  $default,) {final _that = this;
switch (_that) {
case _ViewportAnimation() when $default != null:
return $default(_that.from,_that.to,_that.duration,_that.curve);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ViewportAnimation extends ViewportAnimation {
  const _ViewportAnimation({required this.from, required this.to, this.duration = const Duration(milliseconds: 240), this.curve = ViewportCurve.easeOut}): super._();
  factory _ViewportAnimation.fromJson(Map<String, dynamic> json) => _$ViewportAnimationFromJson(json);

@override final  ViewportState from;
@override final  ViewportState to;
@override@JsonKey() final  Duration duration;
@override@JsonKey() final  ViewportCurve curve;

/// Create a copy of ViewportAnimation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ViewportAnimationCopyWith<_ViewportAnimation> get copyWith => __$ViewportAnimationCopyWithImpl<_ViewportAnimation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ViewportAnimationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ViewportAnimation&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.curve, curve) || other.curve == curve));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,from,to,duration,curve);

@override
String toString() {
  return 'ViewportAnimation(from: $from, to: $to, duration: $duration, curve: $curve)';
}


}

/// @nodoc
abstract mixin class _$ViewportAnimationCopyWith<$Res> implements $ViewportAnimationCopyWith<$Res> {
  factory _$ViewportAnimationCopyWith(_ViewportAnimation value, $Res Function(_ViewportAnimation) _then) = __$ViewportAnimationCopyWithImpl;
@override @useResult
$Res call({
 ViewportState from, ViewportState to, Duration duration, ViewportCurve curve
});


@override $ViewportStateCopyWith<$Res> get from;@override $ViewportStateCopyWith<$Res> get to;

}
/// @nodoc
class __$ViewportAnimationCopyWithImpl<$Res>
    implements _$ViewportAnimationCopyWith<$Res> {
  __$ViewportAnimationCopyWithImpl(this._self, this._then);

  final _ViewportAnimation _self;
  final $Res Function(_ViewportAnimation) _then;

/// Create a copy of ViewportAnimation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? from = null,Object? to = null,Object? duration = null,Object? curve = null,}) {
  return _then(_ViewportAnimation(
from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as ViewportState,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as ViewportState,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,curve: null == curve ? _self.curve : curve // ignore: cast_nullable_to_non_nullable
as ViewportCurve,
  ));
}

/// Create a copy of ViewportAnimation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ViewportStateCopyWith<$Res> get from {
  
  return $ViewportStateCopyWith<$Res>(_self.from, (value) {
    return _then(_self.copyWith(from: value));
  });
}/// Create a copy of ViewportAnimation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ViewportStateCopyWith<$Res> get to {
  
  return $ViewportStateCopyWith<$Res>(_self.to, (value) {
    return _then(_self.copyWith(to: value));
  });
}
}

// dart format on
