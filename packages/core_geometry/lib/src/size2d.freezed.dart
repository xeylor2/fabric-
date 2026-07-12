// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'size2d.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Size2D {

 double get width; double get height;
/// Create a copy of Size2D
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Size2DCopyWith<Size2D> get copyWith => _$Size2DCopyWithImpl<Size2D>(this as Size2D, _$identity);

  /// Serializes this Size2D to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Size2D&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,width,height);

@override
String toString() {
  return 'Size2D(width: $width, height: $height)';
}


}

/// @nodoc
abstract mixin class $Size2DCopyWith<$Res>  {
  factory $Size2DCopyWith(Size2D value, $Res Function(Size2D) _then) = _$Size2DCopyWithImpl;
@useResult
$Res call({
 double width, double height
});




}
/// @nodoc
class _$Size2DCopyWithImpl<$Res>
    implements $Size2DCopyWith<$Res> {
  _$Size2DCopyWithImpl(this._self, this._then);

  final Size2D _self;
  final $Res Function(Size2D) _then;

/// Create a copy of Size2D
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? width = null,Object? height = null,}) {
  return _then(_self.copyWith(
width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [Size2D].
extension Size2DPatterns on Size2D {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Size2D value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Size2D() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Size2D value)  $default,){
final _that = this;
switch (_that) {
case _Size2D():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Size2D value)?  $default,){
final _that = this;
switch (_that) {
case _Size2D() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double width,  double height)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Size2D() when $default != null:
return $default(_that.width,_that.height);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double width,  double height)  $default,) {final _that = this;
switch (_that) {
case _Size2D():
return $default(_that.width,_that.height);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double width,  double height)?  $default,) {final _that = this;
switch (_that) {
case _Size2D() when $default != null:
return $default(_that.width,_that.height);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Size2D extends Size2D {
  const _Size2D({required this.width, required this.height}): super._();
  factory _Size2D.fromJson(Map<String, dynamic> json) => _$Size2DFromJson(json);

@override final  double width;
@override final  double height;

/// Create a copy of Size2D
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Size2DCopyWith<_Size2D> get copyWith => __$Size2DCopyWithImpl<_Size2D>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$Size2DToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Size2D&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,width,height);

@override
String toString() {
  return 'Size2D(width: $width, height: $height)';
}


}

/// @nodoc
abstract mixin class _$Size2DCopyWith<$Res> implements $Size2DCopyWith<$Res> {
  factory _$Size2DCopyWith(_Size2D value, $Res Function(_Size2D) _then) = __$Size2DCopyWithImpl;
@override @useResult
$Res call({
 double width, double height
});




}
/// @nodoc
class __$Size2DCopyWithImpl<$Res>
    implements _$Size2DCopyWith<$Res> {
  __$Size2DCopyWithImpl(this._self, this._then);

  final _Size2D _self;
  final $Res Function(_Size2D) _then;

/// Create a copy of Size2D
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? width = null,Object? height = null,}) {
  return _then(_Size2D(
width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
