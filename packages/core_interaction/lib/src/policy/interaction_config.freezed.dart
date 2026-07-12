// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'interaction_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InteractionConfig {

/// The zoom envelope applied to all viewport mutations.
 ZoomConstraints get constraints;/// When true (default, Figma-style), a bare wheel pans and
/// Ctrl/Cmd+wheel zooms; when false, a bare wheel zooms.
/// Either way "Mouse Wheel Zoom" is always available.
 bool get wheelZoomRequiresModifier;/// Exponential zoom sensitivity per wheel scroll unit.
 double get wheelZoomSensitivity;/// Friction (1/s) for pan inertia simulations.
 double get inertiaFriction;
/// Create a copy of InteractionConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InteractionConfigCopyWith<InteractionConfig> get copyWith => _$InteractionConfigCopyWithImpl<InteractionConfig>(this as InteractionConfig, _$identity);

  /// Serializes this InteractionConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InteractionConfig&&(identical(other.constraints, constraints) || other.constraints == constraints)&&(identical(other.wheelZoomRequiresModifier, wheelZoomRequiresModifier) || other.wheelZoomRequiresModifier == wheelZoomRequiresModifier)&&(identical(other.wheelZoomSensitivity, wheelZoomSensitivity) || other.wheelZoomSensitivity == wheelZoomSensitivity)&&(identical(other.inertiaFriction, inertiaFriction) || other.inertiaFriction == inertiaFriction));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,constraints,wheelZoomRequiresModifier,wheelZoomSensitivity,inertiaFriction);

@override
String toString() {
  return 'InteractionConfig(constraints: $constraints, wheelZoomRequiresModifier: $wheelZoomRequiresModifier, wheelZoomSensitivity: $wheelZoomSensitivity, inertiaFriction: $inertiaFriction)';
}


}

/// @nodoc
abstract mixin class $InteractionConfigCopyWith<$Res>  {
  factory $InteractionConfigCopyWith(InteractionConfig value, $Res Function(InteractionConfig) _then) = _$InteractionConfigCopyWithImpl;
@useResult
$Res call({
 ZoomConstraints constraints, bool wheelZoomRequiresModifier, double wheelZoomSensitivity, double inertiaFriction
});


$ZoomConstraintsCopyWith<$Res> get constraints;

}
/// @nodoc
class _$InteractionConfigCopyWithImpl<$Res>
    implements $InteractionConfigCopyWith<$Res> {
  _$InteractionConfigCopyWithImpl(this._self, this._then);

  final InteractionConfig _self;
  final $Res Function(InteractionConfig) _then;

/// Create a copy of InteractionConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? constraints = null,Object? wheelZoomRequiresModifier = null,Object? wheelZoomSensitivity = null,Object? inertiaFriction = null,}) {
  return _then(_self.copyWith(
constraints: null == constraints ? _self.constraints : constraints // ignore: cast_nullable_to_non_nullable
as ZoomConstraints,wheelZoomRequiresModifier: null == wheelZoomRequiresModifier ? _self.wheelZoomRequiresModifier : wheelZoomRequiresModifier // ignore: cast_nullable_to_non_nullable
as bool,wheelZoomSensitivity: null == wheelZoomSensitivity ? _self.wheelZoomSensitivity : wheelZoomSensitivity // ignore: cast_nullable_to_non_nullable
as double,inertiaFriction: null == inertiaFriction ? _self.inertiaFriction : inertiaFriction // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of InteractionConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ZoomConstraintsCopyWith<$Res> get constraints {
  
  return $ZoomConstraintsCopyWith<$Res>(_self.constraints, (value) {
    return _then(_self.copyWith(constraints: value));
  });
}
}


/// Adds pattern-matching-related methods to [InteractionConfig].
extension InteractionConfigPatterns on InteractionConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InteractionConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InteractionConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InteractionConfig value)  $default,){
final _that = this;
switch (_that) {
case _InteractionConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InteractionConfig value)?  $default,){
final _that = this;
switch (_that) {
case _InteractionConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ZoomConstraints constraints,  bool wheelZoomRequiresModifier,  double wheelZoomSensitivity,  double inertiaFriction)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InteractionConfig() when $default != null:
return $default(_that.constraints,_that.wheelZoomRequiresModifier,_that.wheelZoomSensitivity,_that.inertiaFriction);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ZoomConstraints constraints,  bool wheelZoomRequiresModifier,  double wheelZoomSensitivity,  double inertiaFriction)  $default,) {final _that = this;
switch (_that) {
case _InteractionConfig():
return $default(_that.constraints,_that.wheelZoomRequiresModifier,_that.wheelZoomSensitivity,_that.inertiaFriction);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ZoomConstraints constraints,  bool wheelZoomRequiresModifier,  double wheelZoomSensitivity,  double inertiaFriction)?  $default,) {final _that = this;
switch (_that) {
case _InteractionConfig() when $default != null:
return $default(_that.constraints,_that.wheelZoomRequiresModifier,_that.wheelZoomSensitivity,_that.inertiaFriction);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InteractionConfig extends InteractionConfig {
  const _InteractionConfig({this.constraints = ZoomConstraints.standard, this.wheelZoomRequiresModifier = true, this.wheelZoomSensitivity = 0.002, this.inertiaFriction = 4.0}): super._();
  factory _InteractionConfig.fromJson(Map<String, dynamic> json) => _$InteractionConfigFromJson(json);

/// The zoom envelope applied to all viewport mutations.
@override@JsonKey() final  ZoomConstraints constraints;
/// When true (default, Figma-style), a bare wheel pans and
/// Ctrl/Cmd+wheel zooms; when false, a bare wheel zooms.
/// Either way "Mouse Wheel Zoom" is always available.
@override@JsonKey() final  bool wheelZoomRequiresModifier;
/// Exponential zoom sensitivity per wheel scroll unit.
@override@JsonKey() final  double wheelZoomSensitivity;
/// Friction (1/s) for pan inertia simulations.
@override@JsonKey() final  double inertiaFriction;

/// Create a copy of InteractionConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InteractionConfigCopyWith<_InteractionConfig> get copyWith => __$InteractionConfigCopyWithImpl<_InteractionConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InteractionConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InteractionConfig&&(identical(other.constraints, constraints) || other.constraints == constraints)&&(identical(other.wheelZoomRequiresModifier, wheelZoomRequiresModifier) || other.wheelZoomRequiresModifier == wheelZoomRequiresModifier)&&(identical(other.wheelZoomSensitivity, wheelZoomSensitivity) || other.wheelZoomSensitivity == wheelZoomSensitivity)&&(identical(other.inertiaFriction, inertiaFriction) || other.inertiaFriction == inertiaFriction));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,constraints,wheelZoomRequiresModifier,wheelZoomSensitivity,inertiaFriction);

@override
String toString() {
  return 'InteractionConfig(constraints: $constraints, wheelZoomRequiresModifier: $wheelZoomRequiresModifier, wheelZoomSensitivity: $wheelZoomSensitivity, inertiaFriction: $inertiaFriction)';
}


}

/// @nodoc
abstract mixin class _$InteractionConfigCopyWith<$Res> implements $InteractionConfigCopyWith<$Res> {
  factory _$InteractionConfigCopyWith(_InteractionConfig value, $Res Function(_InteractionConfig) _then) = __$InteractionConfigCopyWithImpl;
@override @useResult
$Res call({
 ZoomConstraints constraints, bool wheelZoomRequiresModifier, double wheelZoomSensitivity, double inertiaFriction
});


@override $ZoomConstraintsCopyWith<$Res> get constraints;

}
/// @nodoc
class __$InteractionConfigCopyWithImpl<$Res>
    implements _$InteractionConfigCopyWith<$Res> {
  __$InteractionConfigCopyWithImpl(this._self, this._then);

  final _InteractionConfig _self;
  final $Res Function(_InteractionConfig) _then;

/// Create a copy of InteractionConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? constraints = null,Object? wheelZoomRequiresModifier = null,Object? wheelZoomSensitivity = null,Object? inertiaFriction = null,}) {
  return _then(_InteractionConfig(
constraints: null == constraints ? _self.constraints : constraints // ignore: cast_nullable_to_non_nullable
as ZoomConstraints,wheelZoomRequiresModifier: null == wheelZoomRequiresModifier ? _self.wheelZoomRequiresModifier : wheelZoomRequiresModifier // ignore: cast_nullable_to_non_nullable
as bool,wheelZoomSensitivity: null == wheelZoomSensitivity ? _self.wheelZoomSensitivity : wheelZoomSensitivity // ignore: cast_nullable_to_non_nullable
as double,inertiaFriction: null == inertiaFriction ? _self.inertiaFriction : inertiaFriction // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of InteractionConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ZoomConstraintsCopyWith<$Res> get constraints {
  
  return $ZoomConstraintsCopyWith<$Res>(_self.constraints, (value) {
    return _then(_self.copyWith(constraints: value));
  });
}
}

// dart format on
