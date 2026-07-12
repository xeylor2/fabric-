// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transform2d.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Transform2D {

 Point2D get translation; double get rotation; double get scale;
/// Create a copy of Transform2D
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Transform2DCopyWith<Transform2D> get copyWith => _$Transform2DCopyWithImpl<Transform2D>(this as Transform2D, _$identity);

  /// Serializes this Transform2D to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Transform2D&&(identical(other.translation, translation) || other.translation == translation)&&(identical(other.rotation, rotation) || other.rotation == rotation)&&(identical(other.scale, scale) || other.scale == scale));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,translation,rotation,scale);

@override
String toString() {
  return 'Transform2D(translation: $translation, rotation: $rotation, scale: $scale)';
}


}

/// @nodoc
abstract mixin class $Transform2DCopyWith<$Res>  {
  factory $Transform2DCopyWith(Transform2D value, $Res Function(Transform2D) _then) = _$Transform2DCopyWithImpl;
@useResult
$Res call({
 Point2D translation, double rotation, double scale
});


$Point2DCopyWith<$Res> get translation;

}
/// @nodoc
class _$Transform2DCopyWithImpl<$Res>
    implements $Transform2DCopyWith<$Res> {
  _$Transform2DCopyWithImpl(this._self, this._then);

  final Transform2D _self;
  final $Res Function(Transform2D) _then;

/// Create a copy of Transform2D
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? translation = null,Object? rotation = null,Object? scale = null,}) {
  return _then(_self.copyWith(
translation: null == translation ? _self.translation : translation // ignore: cast_nullable_to_non_nullable
as Point2D,rotation: null == rotation ? _self.rotation : rotation // ignore: cast_nullable_to_non_nullable
as double,scale: null == scale ? _self.scale : scale // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of Transform2D
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Point2DCopyWith<$Res> get translation {
  
  return $Point2DCopyWith<$Res>(_self.translation, (value) {
    return _then(_self.copyWith(translation: value));
  });
}
}


/// Adds pattern-matching-related methods to [Transform2D].
extension Transform2DPatterns on Transform2D {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Transform2D value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Transform2D() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Transform2D value)  $default,){
final _that = this;
switch (_that) {
case _Transform2D():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Transform2D value)?  $default,){
final _that = this;
switch (_that) {
case _Transform2D() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Point2D translation,  double rotation,  double scale)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Transform2D() when $default != null:
return $default(_that.translation,_that.rotation,_that.scale);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Point2D translation,  double rotation,  double scale)  $default,) {final _that = this;
switch (_that) {
case _Transform2D():
return $default(_that.translation,_that.rotation,_that.scale);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Point2D translation,  double rotation,  double scale)?  $default,) {final _that = this;
switch (_that) {
case _Transform2D() when $default != null:
return $default(_that.translation,_that.rotation,_that.scale);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Transform2D extends Transform2D {
  const _Transform2D({this.translation = Point2D.zero, this.rotation = 0.0, this.scale = 1.0}): super._();
  factory _Transform2D.fromJson(Map<String, dynamic> json) => _$Transform2DFromJson(json);

@override@JsonKey() final  Point2D translation;
@override@JsonKey() final  double rotation;
@override@JsonKey() final  double scale;

/// Create a copy of Transform2D
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Transform2DCopyWith<_Transform2D> get copyWith => __$Transform2DCopyWithImpl<_Transform2D>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$Transform2DToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Transform2D&&(identical(other.translation, translation) || other.translation == translation)&&(identical(other.rotation, rotation) || other.rotation == rotation)&&(identical(other.scale, scale) || other.scale == scale));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,translation,rotation,scale);

@override
String toString() {
  return 'Transform2D(translation: $translation, rotation: $rotation, scale: $scale)';
}


}

/// @nodoc
abstract mixin class _$Transform2DCopyWith<$Res> implements $Transform2DCopyWith<$Res> {
  factory _$Transform2DCopyWith(_Transform2D value, $Res Function(_Transform2D) _then) = __$Transform2DCopyWithImpl;
@override @useResult
$Res call({
 Point2D translation, double rotation, double scale
});


@override $Point2DCopyWith<$Res> get translation;

}
/// @nodoc
class __$Transform2DCopyWithImpl<$Res>
    implements _$Transform2DCopyWith<$Res> {
  __$Transform2DCopyWithImpl(this._self, this._then);

  final _Transform2D _self;
  final $Res Function(_Transform2D) _then;

/// Create a copy of Transform2D
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? translation = null,Object? rotation = null,Object? scale = null,}) {
  return _then(_Transform2D(
translation: null == translation ? _self.translation : translation // ignore: cast_nullable_to_non_nullable
as Point2D,rotation: null == rotation ? _self.rotation : rotation // ignore: cast_nullable_to_non_nullable
as double,scale: null == scale ? _self.scale : scale // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of Transform2D
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Point2DCopyWith<$Res> get translation {
  
  return $Point2DCopyWith<$Res>(_self.translation, (value) {
    return _then(_self.copyWith(translation: value));
  });
}
}

// dart format on
