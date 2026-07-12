// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ruler_spec.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RulerSpec {

 bool get visible;/// The unit the ruler is graduated in.
@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) MeasurementUnit get unit;/// The document-space point the ruler's zero mark sits at.
 Point2D get origin;/// Distance between labelled (major) ticks, in [unit].
 double get majorInterval;/// Minor ticks per major interval.
 int get minorSubdivisions;
/// Create a copy of RulerSpec
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RulerSpecCopyWith<RulerSpec> get copyWith => _$RulerSpecCopyWithImpl<RulerSpec>(this as RulerSpec, _$identity);

  /// Serializes this RulerSpec to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RulerSpec&&(identical(other.visible, visible) || other.visible == visible)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.majorInterval, majorInterval) || other.majorInterval == majorInterval)&&(identical(other.minorSubdivisions, minorSubdivisions) || other.minorSubdivisions == minorSubdivisions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,visible,unit,origin,majorInterval,minorSubdivisions);

@override
String toString() {
  return 'RulerSpec(visible: $visible, unit: $unit, origin: $origin, majorInterval: $majorInterval, minorSubdivisions: $minorSubdivisions)';
}


}

/// @nodoc
abstract mixin class $RulerSpecCopyWith<$Res>  {
  factory $RulerSpecCopyWith(RulerSpec value, $Res Function(RulerSpec) _then) = _$RulerSpecCopyWithImpl;
@useResult
$Res call({
 bool visible,@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) MeasurementUnit unit, Point2D origin, double majorInterval, int minorSubdivisions
});


$Point2DCopyWith<$Res> get origin;

}
/// @nodoc
class _$RulerSpecCopyWithImpl<$Res>
    implements $RulerSpecCopyWith<$Res> {
  _$RulerSpecCopyWithImpl(this._self, this._then);

  final RulerSpec _self;
  final $Res Function(RulerSpec) _then;

/// Create a copy of RulerSpec
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? visible = null,Object? unit = null,Object? origin = null,Object? majorInterval = null,Object? minorSubdivisions = null,}) {
  return _then(_self.copyWith(
visible: null == visible ? _self.visible : visible // ignore: cast_nullable_to_non_nullable
as bool,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as MeasurementUnit,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as Point2D,majorInterval: null == majorInterval ? _self.majorInterval : majorInterval // ignore: cast_nullable_to_non_nullable
as double,minorSubdivisions: null == minorSubdivisions ? _self.minorSubdivisions : minorSubdivisions // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of RulerSpec
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Point2DCopyWith<$Res> get origin {
  
  return $Point2DCopyWith<$Res>(_self.origin, (value) {
    return _then(_self.copyWith(origin: value));
  });
}
}


/// Adds pattern-matching-related methods to [RulerSpec].
extension RulerSpecPatterns on RulerSpec {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RulerSpec value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RulerSpec() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RulerSpec value)  $default,){
final _that = this;
switch (_that) {
case _RulerSpec():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RulerSpec value)?  $default,){
final _that = this;
switch (_that) {
case _RulerSpec() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool visible, @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson)  MeasurementUnit unit,  Point2D origin,  double majorInterval,  int minorSubdivisions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RulerSpec() when $default != null:
return $default(_that.visible,_that.unit,_that.origin,_that.majorInterval,_that.minorSubdivisions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool visible, @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson)  MeasurementUnit unit,  Point2D origin,  double majorInterval,  int minorSubdivisions)  $default,) {final _that = this;
switch (_that) {
case _RulerSpec():
return $default(_that.visible,_that.unit,_that.origin,_that.majorInterval,_that.minorSubdivisions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool visible, @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson)  MeasurementUnit unit,  Point2D origin,  double majorInterval,  int minorSubdivisions)?  $default,) {final _that = this;
switch (_that) {
case _RulerSpec() when $default != null:
return $default(_that.visible,_that.unit,_that.origin,_that.majorInterval,_that.minorSubdivisions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RulerSpec extends RulerSpec {
  const _RulerSpec({this.visible = false, @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) this.unit = MeasurementUnit.millimetre, this.origin = Point2D.zero, this.majorInterval = 10.0, this.minorSubdivisions = 10}): super._();
  factory _RulerSpec.fromJson(Map<String, dynamic> json) => _$RulerSpecFromJson(json);

@override@JsonKey() final  bool visible;
/// The unit the ruler is graduated in.
@override@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) final  MeasurementUnit unit;
/// The document-space point the ruler's zero mark sits at.
@override@JsonKey() final  Point2D origin;
/// Distance between labelled (major) ticks, in [unit].
@override@JsonKey() final  double majorInterval;
/// Minor ticks per major interval.
@override@JsonKey() final  int minorSubdivisions;

/// Create a copy of RulerSpec
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RulerSpecCopyWith<_RulerSpec> get copyWith => __$RulerSpecCopyWithImpl<_RulerSpec>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RulerSpecToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RulerSpec&&(identical(other.visible, visible) || other.visible == visible)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.majorInterval, majorInterval) || other.majorInterval == majorInterval)&&(identical(other.minorSubdivisions, minorSubdivisions) || other.minorSubdivisions == minorSubdivisions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,visible,unit,origin,majorInterval,minorSubdivisions);

@override
String toString() {
  return 'RulerSpec(visible: $visible, unit: $unit, origin: $origin, majorInterval: $majorInterval, minorSubdivisions: $minorSubdivisions)';
}


}

/// @nodoc
abstract mixin class _$RulerSpecCopyWith<$Res> implements $RulerSpecCopyWith<$Res> {
  factory _$RulerSpecCopyWith(_RulerSpec value, $Res Function(_RulerSpec) _then) = __$RulerSpecCopyWithImpl;
@override @useResult
$Res call({
 bool visible,@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) MeasurementUnit unit, Point2D origin, double majorInterval, int minorSubdivisions
});


@override $Point2DCopyWith<$Res> get origin;

}
/// @nodoc
class __$RulerSpecCopyWithImpl<$Res>
    implements _$RulerSpecCopyWith<$Res> {
  __$RulerSpecCopyWithImpl(this._self, this._then);

  final _RulerSpec _self;
  final $Res Function(_RulerSpec) _then;

/// Create a copy of RulerSpec
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? visible = null,Object? unit = null,Object? origin = null,Object? majorInterval = null,Object? minorSubdivisions = null,}) {
  return _then(_RulerSpec(
visible: null == visible ? _self.visible : visible // ignore: cast_nullable_to_non_nullable
as bool,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as MeasurementUnit,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as Point2D,majorInterval: null == majorInterval ? _self.majorInterval : majorInterval // ignore: cast_nullable_to_non_nullable
as double,minorSubdivisions: null == minorSubdivisions ? _self.minorSubdivisions : minorSubdivisions // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of RulerSpec
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Point2DCopyWith<$Res> get origin {
  
  return $Point2DCopyWith<$Res>(_self.origin, (value) {
    return _then(_self.copyWith(origin: value));
  });
}
}

// dart format on
