// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'viewport_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ViewportState {

/// Size of the artwork being viewed, in canvas units.
 Size2D get canvasSize;/// Size of the hosting surface, in logical pixels.
 Size2D get screenSize;/// Scale factor: canvas units → logical pixels. 1.0 = 100%.
 double get zoom;/// Translation applied after scale/rotation, in logical pixels.
 Point2D get offset;/// View rotation in radians (counter-clockwise).
 double get rotation;/// Logical → physical pixel factor of the display.
 double get devicePixelRatio;
/// Create a copy of ViewportState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ViewportStateCopyWith<ViewportState> get copyWith => _$ViewportStateCopyWithImpl<ViewportState>(this as ViewportState, _$identity);

  /// Serializes this ViewportState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ViewportState&&(identical(other.canvasSize, canvasSize) || other.canvasSize == canvasSize)&&(identical(other.screenSize, screenSize) || other.screenSize == screenSize)&&(identical(other.zoom, zoom) || other.zoom == zoom)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.rotation, rotation) || other.rotation == rotation)&&(identical(other.devicePixelRatio, devicePixelRatio) || other.devicePixelRatio == devicePixelRatio));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,canvasSize,screenSize,zoom,offset,rotation,devicePixelRatio);

@override
String toString() {
  return 'ViewportState(canvasSize: $canvasSize, screenSize: $screenSize, zoom: $zoom, offset: $offset, rotation: $rotation, devicePixelRatio: $devicePixelRatio)';
}


}

/// @nodoc
abstract mixin class $ViewportStateCopyWith<$Res>  {
  factory $ViewportStateCopyWith(ViewportState value, $Res Function(ViewportState) _then) = _$ViewportStateCopyWithImpl;
@useResult
$Res call({
 Size2D canvasSize, Size2D screenSize, double zoom, Point2D offset, double rotation, double devicePixelRatio
});


$Size2DCopyWith<$Res> get canvasSize;$Size2DCopyWith<$Res> get screenSize;$Point2DCopyWith<$Res> get offset;

}
/// @nodoc
class _$ViewportStateCopyWithImpl<$Res>
    implements $ViewportStateCopyWith<$Res> {
  _$ViewportStateCopyWithImpl(this._self, this._then);

  final ViewportState _self;
  final $Res Function(ViewportState) _then;

/// Create a copy of ViewportState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? canvasSize = null,Object? screenSize = null,Object? zoom = null,Object? offset = null,Object? rotation = null,Object? devicePixelRatio = null,}) {
  return _then(_self.copyWith(
canvasSize: null == canvasSize ? _self.canvasSize : canvasSize // ignore: cast_nullable_to_non_nullable
as Size2D,screenSize: null == screenSize ? _self.screenSize : screenSize // ignore: cast_nullable_to_non_nullable
as Size2D,zoom: null == zoom ? _self.zoom : zoom // ignore: cast_nullable_to_non_nullable
as double,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as Point2D,rotation: null == rotation ? _self.rotation : rotation // ignore: cast_nullable_to_non_nullable
as double,devicePixelRatio: null == devicePixelRatio ? _self.devicePixelRatio : devicePixelRatio // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of ViewportState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Size2DCopyWith<$Res> get canvasSize {
  
  return $Size2DCopyWith<$Res>(_self.canvasSize, (value) {
    return _then(_self.copyWith(canvasSize: value));
  });
}/// Create a copy of ViewportState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Size2DCopyWith<$Res> get screenSize {
  
  return $Size2DCopyWith<$Res>(_self.screenSize, (value) {
    return _then(_self.copyWith(screenSize: value));
  });
}/// Create a copy of ViewportState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Point2DCopyWith<$Res> get offset {
  
  return $Point2DCopyWith<$Res>(_self.offset, (value) {
    return _then(_self.copyWith(offset: value));
  });
}
}


/// Adds pattern-matching-related methods to [ViewportState].
extension ViewportStatePatterns on ViewportState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ViewportState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ViewportState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ViewportState value)  $default,){
final _that = this;
switch (_that) {
case _ViewportState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ViewportState value)?  $default,){
final _that = this;
switch (_that) {
case _ViewportState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Size2D canvasSize,  Size2D screenSize,  double zoom,  Point2D offset,  double rotation,  double devicePixelRatio)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ViewportState() when $default != null:
return $default(_that.canvasSize,_that.screenSize,_that.zoom,_that.offset,_that.rotation,_that.devicePixelRatio);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Size2D canvasSize,  Size2D screenSize,  double zoom,  Point2D offset,  double rotation,  double devicePixelRatio)  $default,) {final _that = this;
switch (_that) {
case _ViewportState():
return $default(_that.canvasSize,_that.screenSize,_that.zoom,_that.offset,_that.rotation,_that.devicePixelRatio);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Size2D canvasSize,  Size2D screenSize,  double zoom,  Point2D offset,  double rotation,  double devicePixelRatio)?  $default,) {final _that = this;
switch (_that) {
case _ViewportState() when $default != null:
return $default(_that.canvasSize,_that.screenSize,_that.zoom,_that.offset,_that.rotation,_that.devicePixelRatio);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ViewportState extends ViewportState {
  const _ViewportState({required this.canvasSize, required this.screenSize, this.zoom = 1.0, this.offset = Point2D.zero, this.rotation = 0.0, this.devicePixelRatio = 1.0}): super._();
  factory _ViewportState.fromJson(Map<String, dynamic> json) => _$ViewportStateFromJson(json);

/// Size of the artwork being viewed, in canvas units.
@override final  Size2D canvasSize;
/// Size of the hosting surface, in logical pixels.
@override final  Size2D screenSize;
/// Scale factor: canvas units → logical pixels. 1.0 = 100%.
@override@JsonKey() final  double zoom;
/// Translation applied after scale/rotation, in logical pixels.
@override@JsonKey() final  Point2D offset;
/// View rotation in radians (counter-clockwise).
@override@JsonKey() final  double rotation;
/// Logical → physical pixel factor of the display.
@override@JsonKey() final  double devicePixelRatio;

/// Create a copy of ViewportState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ViewportStateCopyWith<_ViewportState> get copyWith => __$ViewportStateCopyWithImpl<_ViewportState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ViewportStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ViewportState&&(identical(other.canvasSize, canvasSize) || other.canvasSize == canvasSize)&&(identical(other.screenSize, screenSize) || other.screenSize == screenSize)&&(identical(other.zoom, zoom) || other.zoom == zoom)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.rotation, rotation) || other.rotation == rotation)&&(identical(other.devicePixelRatio, devicePixelRatio) || other.devicePixelRatio == devicePixelRatio));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,canvasSize,screenSize,zoom,offset,rotation,devicePixelRatio);

@override
String toString() {
  return 'ViewportState(canvasSize: $canvasSize, screenSize: $screenSize, zoom: $zoom, offset: $offset, rotation: $rotation, devicePixelRatio: $devicePixelRatio)';
}


}

/// @nodoc
abstract mixin class _$ViewportStateCopyWith<$Res> implements $ViewportStateCopyWith<$Res> {
  factory _$ViewportStateCopyWith(_ViewportState value, $Res Function(_ViewportState) _then) = __$ViewportStateCopyWithImpl;
@override @useResult
$Res call({
 Size2D canvasSize, Size2D screenSize, double zoom, Point2D offset, double rotation, double devicePixelRatio
});


@override $Size2DCopyWith<$Res> get canvasSize;@override $Size2DCopyWith<$Res> get screenSize;@override $Point2DCopyWith<$Res> get offset;

}
/// @nodoc
class __$ViewportStateCopyWithImpl<$Res>
    implements _$ViewportStateCopyWith<$Res> {
  __$ViewportStateCopyWithImpl(this._self, this._then);

  final _ViewportState _self;
  final $Res Function(_ViewportState) _then;

/// Create a copy of ViewportState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? canvasSize = null,Object? screenSize = null,Object? zoom = null,Object? offset = null,Object? rotation = null,Object? devicePixelRatio = null,}) {
  return _then(_ViewportState(
canvasSize: null == canvasSize ? _self.canvasSize : canvasSize // ignore: cast_nullable_to_non_nullable
as Size2D,screenSize: null == screenSize ? _self.screenSize : screenSize // ignore: cast_nullable_to_non_nullable
as Size2D,zoom: null == zoom ? _self.zoom : zoom // ignore: cast_nullable_to_non_nullable
as double,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as Point2D,rotation: null == rotation ? _self.rotation : rotation // ignore: cast_nullable_to_non_nullable
as double,devicePixelRatio: null == devicePixelRatio ? _self.devicePixelRatio : devicePixelRatio // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of ViewportState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Size2DCopyWith<$Res> get canvasSize {
  
  return $Size2DCopyWith<$Res>(_self.canvasSize, (value) {
    return _then(_self.copyWith(canvasSize: value));
  });
}/// Create a copy of ViewportState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Size2DCopyWith<$Res> get screenSize {
  
  return $Size2DCopyWith<$Res>(_self.screenSize, (value) {
    return _then(_self.copyWith(screenSize: value));
  });
}/// Create a copy of ViewportState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Point2DCopyWith<$Res> get offset {
  
  return $Point2DCopyWith<$Res>(_self.offset, (value) {
    return _then(_self.copyWith(offset: value));
  });
}
}

// dart format on
