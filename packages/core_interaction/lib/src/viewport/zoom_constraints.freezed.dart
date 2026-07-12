// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'zoom_constraints.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ZoomConstraints {

/// Smallest permitted zoom.
 double get minZoom;/// Largest permitted zoom.
 double get maxZoom;/// Multiplicative step used by Zoom In / Zoom Out and double-tap.
 double get stepFactor;/// Zoom applied by the Default Zoom command.
 double get defaultZoom;/// Fraction of the screen left as breathing room by fit operations.
 double get fitPadding;
/// Create a copy of ZoomConstraints
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ZoomConstraintsCopyWith<ZoomConstraints> get copyWith => _$ZoomConstraintsCopyWithImpl<ZoomConstraints>(this as ZoomConstraints, _$identity);

  /// Serializes this ZoomConstraints to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ZoomConstraints&&(identical(other.minZoom, minZoom) || other.minZoom == minZoom)&&(identical(other.maxZoom, maxZoom) || other.maxZoom == maxZoom)&&(identical(other.stepFactor, stepFactor) || other.stepFactor == stepFactor)&&(identical(other.defaultZoom, defaultZoom) || other.defaultZoom == defaultZoom)&&(identical(other.fitPadding, fitPadding) || other.fitPadding == fitPadding));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,minZoom,maxZoom,stepFactor,defaultZoom,fitPadding);

@override
String toString() {
  return 'ZoomConstraints(minZoom: $minZoom, maxZoom: $maxZoom, stepFactor: $stepFactor, defaultZoom: $defaultZoom, fitPadding: $fitPadding)';
}


}

/// @nodoc
abstract mixin class $ZoomConstraintsCopyWith<$Res>  {
  factory $ZoomConstraintsCopyWith(ZoomConstraints value, $Res Function(ZoomConstraints) _then) = _$ZoomConstraintsCopyWithImpl;
@useResult
$Res call({
 double minZoom, double maxZoom, double stepFactor, double defaultZoom, double fitPadding
});




}
/// @nodoc
class _$ZoomConstraintsCopyWithImpl<$Res>
    implements $ZoomConstraintsCopyWith<$Res> {
  _$ZoomConstraintsCopyWithImpl(this._self, this._then);

  final ZoomConstraints _self;
  final $Res Function(ZoomConstraints) _then;

/// Create a copy of ZoomConstraints
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? minZoom = null,Object? maxZoom = null,Object? stepFactor = null,Object? defaultZoom = null,Object? fitPadding = null,}) {
  return _then(_self.copyWith(
minZoom: null == minZoom ? _self.minZoom : minZoom // ignore: cast_nullable_to_non_nullable
as double,maxZoom: null == maxZoom ? _self.maxZoom : maxZoom // ignore: cast_nullable_to_non_nullable
as double,stepFactor: null == stepFactor ? _self.stepFactor : stepFactor // ignore: cast_nullable_to_non_nullable
as double,defaultZoom: null == defaultZoom ? _self.defaultZoom : defaultZoom // ignore: cast_nullable_to_non_nullable
as double,fitPadding: null == fitPadding ? _self.fitPadding : fitPadding // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ZoomConstraints].
extension ZoomConstraintsPatterns on ZoomConstraints {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ZoomConstraints value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ZoomConstraints() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ZoomConstraints value)  $default,){
final _that = this;
switch (_that) {
case _ZoomConstraints():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ZoomConstraints value)?  $default,){
final _that = this;
switch (_that) {
case _ZoomConstraints() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double minZoom,  double maxZoom,  double stepFactor,  double defaultZoom,  double fitPadding)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ZoomConstraints() when $default != null:
return $default(_that.minZoom,_that.maxZoom,_that.stepFactor,_that.defaultZoom,_that.fitPadding);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double minZoom,  double maxZoom,  double stepFactor,  double defaultZoom,  double fitPadding)  $default,) {final _that = this;
switch (_that) {
case _ZoomConstraints():
return $default(_that.minZoom,_that.maxZoom,_that.stepFactor,_that.defaultZoom,_that.fitPadding);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double minZoom,  double maxZoom,  double stepFactor,  double defaultZoom,  double fitPadding)?  $default,) {final _that = this;
switch (_that) {
case _ZoomConstraints() when $default != null:
return $default(_that.minZoom,_that.maxZoom,_that.stepFactor,_that.defaultZoom,_that.fitPadding);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ZoomConstraints extends ZoomConstraints {
  const _ZoomConstraints({this.minZoom = 0.02, this.maxZoom = 64.0, this.stepFactor = 1.25, this.defaultZoom = 1.0, this.fitPadding = 0.08}): super._();
  factory _ZoomConstraints.fromJson(Map<String, dynamic> json) => _$ZoomConstraintsFromJson(json);

/// Smallest permitted zoom.
@override@JsonKey() final  double minZoom;
/// Largest permitted zoom.
@override@JsonKey() final  double maxZoom;
/// Multiplicative step used by Zoom In / Zoom Out and double-tap.
@override@JsonKey() final  double stepFactor;
/// Zoom applied by the Default Zoom command.
@override@JsonKey() final  double defaultZoom;
/// Fraction of the screen left as breathing room by fit operations.
@override@JsonKey() final  double fitPadding;

/// Create a copy of ZoomConstraints
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ZoomConstraintsCopyWith<_ZoomConstraints> get copyWith => __$ZoomConstraintsCopyWithImpl<_ZoomConstraints>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ZoomConstraintsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ZoomConstraints&&(identical(other.minZoom, minZoom) || other.minZoom == minZoom)&&(identical(other.maxZoom, maxZoom) || other.maxZoom == maxZoom)&&(identical(other.stepFactor, stepFactor) || other.stepFactor == stepFactor)&&(identical(other.defaultZoom, defaultZoom) || other.defaultZoom == defaultZoom)&&(identical(other.fitPadding, fitPadding) || other.fitPadding == fitPadding));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,minZoom,maxZoom,stepFactor,defaultZoom,fitPadding);

@override
String toString() {
  return 'ZoomConstraints(minZoom: $minZoom, maxZoom: $maxZoom, stepFactor: $stepFactor, defaultZoom: $defaultZoom, fitPadding: $fitPadding)';
}


}

/// @nodoc
abstract mixin class _$ZoomConstraintsCopyWith<$Res> implements $ZoomConstraintsCopyWith<$Res> {
  factory _$ZoomConstraintsCopyWith(_ZoomConstraints value, $Res Function(_ZoomConstraints) _then) = __$ZoomConstraintsCopyWithImpl;
@override @useResult
$Res call({
 double minZoom, double maxZoom, double stepFactor, double defaultZoom, double fitPadding
});




}
/// @nodoc
class __$ZoomConstraintsCopyWithImpl<$Res>
    implements _$ZoomConstraintsCopyWith<$Res> {
  __$ZoomConstraintsCopyWithImpl(this._self, this._then);

  final _ZoomConstraints _self;
  final $Res Function(_ZoomConstraints) _then;

/// Create a copy of ZoomConstraints
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? minZoom = null,Object? maxZoom = null,Object? stepFactor = null,Object? defaultZoom = null,Object? fitPadding = null,}) {
  return _then(_ZoomConstraints(
minZoom: null == minZoom ? _self.minZoom : minZoom // ignore: cast_nullable_to_non_nullable
as double,maxZoom: null == maxZoom ? _self.maxZoom : maxZoom // ignore: cast_nullable_to_non_nullable
as double,stepFactor: null == stepFactor ? _self.stepFactor : stepFactor // ignore: cast_nullable_to_non_nullable
as double,defaultZoom: null == defaultZoom ? _self.defaultZoom : defaultZoom // ignore: cast_nullable_to_non_nullable
as double,fitPadding: null == fitPadding ? _self.fitPadding : fitPadding // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
