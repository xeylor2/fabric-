// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'canvas_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CanvasCoordinateSystem {

/// The unit canvas coordinates are authored in.
@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) MeasurementUnit get unit;/// Raster resolution binding physical units to pixels.
 double get dotsPerInch;
/// Create a copy of CanvasCoordinateSystem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CanvasCoordinateSystemCopyWith<CanvasCoordinateSystem> get copyWith => _$CanvasCoordinateSystemCopyWithImpl<CanvasCoordinateSystem>(this as CanvasCoordinateSystem, _$identity);

  /// Serializes this CanvasCoordinateSystem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CanvasCoordinateSystem&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.dotsPerInch, dotsPerInch) || other.dotsPerInch == dotsPerInch));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,unit,dotsPerInch);

@override
String toString() {
  return 'CanvasCoordinateSystem(unit: $unit, dotsPerInch: $dotsPerInch)';
}


}

/// @nodoc
abstract mixin class $CanvasCoordinateSystemCopyWith<$Res>  {
  factory $CanvasCoordinateSystemCopyWith(CanvasCoordinateSystem value, $Res Function(CanvasCoordinateSystem) _then) = _$CanvasCoordinateSystemCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) MeasurementUnit unit, double dotsPerInch
});




}
/// @nodoc
class _$CanvasCoordinateSystemCopyWithImpl<$Res>
    implements $CanvasCoordinateSystemCopyWith<$Res> {
  _$CanvasCoordinateSystemCopyWithImpl(this._self, this._then);

  final CanvasCoordinateSystem _self;
  final $Res Function(CanvasCoordinateSystem) _then;

/// Create a copy of CanvasCoordinateSystem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? unit = null,Object? dotsPerInch = null,}) {
  return _then(_self.copyWith(
unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as MeasurementUnit,dotsPerInch: null == dotsPerInch ? _self.dotsPerInch : dotsPerInch // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [CanvasCoordinateSystem].
extension CanvasCoordinateSystemPatterns on CanvasCoordinateSystem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CanvasCoordinateSystem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CanvasCoordinateSystem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CanvasCoordinateSystem value)  $default,){
final _that = this;
switch (_that) {
case _CanvasCoordinateSystem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CanvasCoordinateSystem value)?  $default,){
final _that = this;
switch (_that) {
case _CanvasCoordinateSystem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson)  MeasurementUnit unit,  double dotsPerInch)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CanvasCoordinateSystem() when $default != null:
return $default(_that.unit,_that.dotsPerInch);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson)  MeasurementUnit unit,  double dotsPerInch)  $default,) {final _that = this;
switch (_that) {
case _CanvasCoordinateSystem():
return $default(_that.unit,_that.dotsPerInch);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson)  MeasurementUnit unit,  double dotsPerInch)?  $default,) {final _that = this;
switch (_that) {
case _CanvasCoordinateSystem() when $default != null:
return $default(_that.unit,_that.dotsPerInch);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CanvasCoordinateSystem extends CanvasCoordinateSystem {
  const _CanvasCoordinateSystem({@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) this.unit = MeasurementUnit.millimetre, this.dotsPerInch = 300.0}): super._();
  factory _CanvasCoordinateSystem.fromJson(Map<String, dynamic> json) => _$CanvasCoordinateSystemFromJson(json);

/// The unit canvas coordinates are authored in.
@override@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) final  MeasurementUnit unit;
/// Raster resolution binding physical units to pixels.
@override@JsonKey() final  double dotsPerInch;

/// Create a copy of CanvasCoordinateSystem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CanvasCoordinateSystemCopyWith<_CanvasCoordinateSystem> get copyWith => __$CanvasCoordinateSystemCopyWithImpl<_CanvasCoordinateSystem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CanvasCoordinateSystemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CanvasCoordinateSystem&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.dotsPerInch, dotsPerInch) || other.dotsPerInch == dotsPerInch));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,unit,dotsPerInch);

@override
String toString() {
  return 'CanvasCoordinateSystem(unit: $unit, dotsPerInch: $dotsPerInch)';
}


}

/// @nodoc
abstract mixin class _$CanvasCoordinateSystemCopyWith<$Res> implements $CanvasCoordinateSystemCopyWith<$Res> {
  factory _$CanvasCoordinateSystemCopyWith(_CanvasCoordinateSystem value, $Res Function(_CanvasCoordinateSystem) _then) = __$CanvasCoordinateSystemCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) MeasurementUnit unit, double dotsPerInch
});




}
/// @nodoc
class __$CanvasCoordinateSystemCopyWithImpl<$Res>
    implements _$CanvasCoordinateSystemCopyWith<$Res> {
  __$CanvasCoordinateSystemCopyWithImpl(this._self, this._then);

  final _CanvasCoordinateSystem _self;
  final $Res Function(_CanvasCoordinateSystem) _then;

/// Create a copy of CanvasCoordinateSystem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? unit = null,Object? dotsPerInch = null,}) {
  return _then(_CanvasCoordinateSystem(
unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as MeasurementUnit,dotsPerInch: null == dotsPerInch ? _self.dotsPerInch : dotsPerInch // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$SnappingConfig {

 bool get enabled;/// Magnet distance in logical pixels.
 double get threshold; bool get snapToGrid; bool get snapToGuides; bool get snapToObjects;
/// Create a copy of SnappingConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SnappingConfigCopyWith<SnappingConfig> get copyWith => _$SnappingConfigCopyWithImpl<SnappingConfig>(this as SnappingConfig, _$identity);

  /// Serializes this SnappingConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SnappingConfig&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.threshold, threshold) || other.threshold == threshold)&&(identical(other.snapToGrid, snapToGrid) || other.snapToGrid == snapToGrid)&&(identical(other.snapToGuides, snapToGuides) || other.snapToGuides == snapToGuides)&&(identical(other.snapToObjects, snapToObjects) || other.snapToObjects == snapToObjects));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enabled,threshold,snapToGrid,snapToGuides,snapToObjects);

@override
String toString() {
  return 'SnappingConfig(enabled: $enabled, threshold: $threshold, snapToGrid: $snapToGrid, snapToGuides: $snapToGuides, snapToObjects: $snapToObjects)';
}


}

/// @nodoc
abstract mixin class $SnappingConfigCopyWith<$Res>  {
  factory $SnappingConfigCopyWith(SnappingConfig value, $Res Function(SnappingConfig) _then) = _$SnappingConfigCopyWithImpl;
@useResult
$Res call({
 bool enabled, double threshold, bool snapToGrid, bool snapToGuides, bool snapToObjects
});




}
/// @nodoc
class _$SnappingConfigCopyWithImpl<$Res>
    implements $SnappingConfigCopyWith<$Res> {
  _$SnappingConfigCopyWithImpl(this._self, this._then);

  final SnappingConfig _self;
  final $Res Function(SnappingConfig) _then;

/// Create a copy of SnappingConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enabled = null,Object? threshold = null,Object? snapToGrid = null,Object? snapToGuides = null,Object? snapToObjects = null,}) {
  return _then(_self.copyWith(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,threshold: null == threshold ? _self.threshold : threshold // ignore: cast_nullable_to_non_nullable
as double,snapToGrid: null == snapToGrid ? _self.snapToGrid : snapToGrid // ignore: cast_nullable_to_non_nullable
as bool,snapToGuides: null == snapToGuides ? _self.snapToGuides : snapToGuides // ignore: cast_nullable_to_non_nullable
as bool,snapToObjects: null == snapToObjects ? _self.snapToObjects : snapToObjects // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SnappingConfig].
extension SnappingConfigPatterns on SnappingConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SnappingConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SnappingConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SnappingConfig value)  $default,){
final _that = this;
switch (_that) {
case _SnappingConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SnappingConfig value)?  $default,){
final _that = this;
switch (_that) {
case _SnappingConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool enabled,  double threshold,  bool snapToGrid,  bool snapToGuides,  bool snapToObjects)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SnappingConfig() when $default != null:
return $default(_that.enabled,_that.threshold,_that.snapToGrid,_that.snapToGuides,_that.snapToObjects);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool enabled,  double threshold,  bool snapToGrid,  bool snapToGuides,  bool snapToObjects)  $default,) {final _that = this;
switch (_that) {
case _SnappingConfig():
return $default(_that.enabled,_that.threshold,_that.snapToGrid,_that.snapToGuides,_that.snapToObjects);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool enabled,  double threshold,  bool snapToGrid,  bool snapToGuides,  bool snapToObjects)?  $default,) {final _that = this;
switch (_that) {
case _SnappingConfig() when $default != null:
return $default(_that.enabled,_that.threshold,_that.snapToGrid,_that.snapToGuides,_that.snapToObjects);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SnappingConfig extends SnappingConfig {
  const _SnappingConfig({this.enabled = true, this.threshold = 6.0, this.snapToGrid = true, this.snapToGuides = true, this.snapToObjects = true}): super._();
  factory _SnappingConfig.fromJson(Map<String, dynamic> json) => _$SnappingConfigFromJson(json);

@override@JsonKey() final  bool enabled;
/// Magnet distance in logical pixels.
@override@JsonKey() final  double threshold;
@override@JsonKey() final  bool snapToGrid;
@override@JsonKey() final  bool snapToGuides;
@override@JsonKey() final  bool snapToObjects;

/// Create a copy of SnappingConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SnappingConfigCopyWith<_SnappingConfig> get copyWith => __$SnappingConfigCopyWithImpl<_SnappingConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SnappingConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SnappingConfig&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.threshold, threshold) || other.threshold == threshold)&&(identical(other.snapToGrid, snapToGrid) || other.snapToGrid == snapToGrid)&&(identical(other.snapToGuides, snapToGuides) || other.snapToGuides == snapToGuides)&&(identical(other.snapToObjects, snapToObjects) || other.snapToObjects == snapToObjects));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enabled,threshold,snapToGrid,snapToGuides,snapToObjects);

@override
String toString() {
  return 'SnappingConfig(enabled: $enabled, threshold: $threshold, snapToGrid: $snapToGrid, snapToGuides: $snapToGuides, snapToObjects: $snapToObjects)';
}


}

/// @nodoc
abstract mixin class _$SnappingConfigCopyWith<$Res> implements $SnappingConfigCopyWith<$Res> {
  factory _$SnappingConfigCopyWith(_SnappingConfig value, $Res Function(_SnappingConfig) _then) = __$SnappingConfigCopyWithImpl;
@override @useResult
$Res call({
 bool enabled, double threshold, bool snapToGrid, bool snapToGuides, bool snapToObjects
});




}
/// @nodoc
class __$SnappingConfigCopyWithImpl<$Res>
    implements _$SnappingConfigCopyWith<$Res> {
  __$SnappingConfigCopyWithImpl(this._self, this._then);

  final _SnappingConfig _self;
  final $Res Function(_SnappingConfig) _then;

/// Create a copy of SnappingConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enabled = null,Object? threshold = null,Object? snapToGrid = null,Object? snapToGuides = null,Object? snapToObjects = null,}) {
  return _then(_SnappingConfig(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,threshold: null == threshold ? _self.threshold : threshold // ignore: cast_nullable_to_non_nullable
as double,snapToGrid: null == snapToGrid ? _self.snapToGrid : snapToGrid // ignore: cast_nullable_to_non_nullable
as bool,snapToGuides: null == snapToGuides ? _self.snapToGuides : snapToGuides // ignore: cast_nullable_to_non_nullable
as bool,snapToObjects: null == snapToObjects ? _self.snapToObjects : snapToObjects // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$GuideModel {

 String get id; GuideOrientation get orientation;/// Position along the perpendicular axis, in canvas units.
 double get position; bool get locked;
/// Create a copy of GuideModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GuideModelCopyWith<GuideModel> get copyWith => _$GuideModelCopyWithImpl<GuideModel>(this as GuideModel, _$identity);

  /// Serializes this GuideModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GuideModel&&(identical(other.id, id) || other.id == id)&&(identical(other.orientation, orientation) || other.orientation == orientation)&&(identical(other.position, position) || other.position == position)&&(identical(other.locked, locked) || other.locked == locked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orientation,position,locked);

@override
String toString() {
  return 'GuideModel(id: $id, orientation: $orientation, position: $position, locked: $locked)';
}


}

/// @nodoc
abstract mixin class $GuideModelCopyWith<$Res>  {
  factory $GuideModelCopyWith(GuideModel value, $Res Function(GuideModel) _then) = _$GuideModelCopyWithImpl;
@useResult
$Res call({
 String id, GuideOrientation orientation, double position, bool locked
});




}
/// @nodoc
class _$GuideModelCopyWithImpl<$Res>
    implements $GuideModelCopyWith<$Res> {
  _$GuideModelCopyWithImpl(this._self, this._then);

  final GuideModel _self;
  final $Res Function(GuideModel) _then;

/// Create a copy of GuideModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? orientation = null,Object? position = null,Object? locked = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orientation: null == orientation ? _self.orientation : orientation // ignore: cast_nullable_to_non_nullable
as GuideOrientation,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as double,locked: null == locked ? _self.locked : locked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [GuideModel].
extension GuideModelPatterns on GuideModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GuideModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GuideModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GuideModel value)  $default,){
final _that = this;
switch (_that) {
case _GuideModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GuideModel value)?  $default,){
final _that = this;
switch (_that) {
case _GuideModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  GuideOrientation orientation,  double position,  bool locked)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GuideModel() when $default != null:
return $default(_that.id,_that.orientation,_that.position,_that.locked);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  GuideOrientation orientation,  double position,  bool locked)  $default,) {final _that = this;
switch (_that) {
case _GuideModel():
return $default(_that.id,_that.orientation,_that.position,_that.locked);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  GuideOrientation orientation,  double position,  bool locked)?  $default,) {final _that = this;
switch (_that) {
case _GuideModel() when $default != null:
return $default(_that.id,_that.orientation,_that.position,_that.locked);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GuideModel implements GuideModel {
  const _GuideModel({required this.id, required this.orientation, required this.position, this.locked = false});
  factory _GuideModel.fromJson(Map<String, dynamic> json) => _$GuideModelFromJson(json);

@override final  String id;
@override final  GuideOrientation orientation;
/// Position along the perpendicular axis, in canvas units.
@override final  double position;
@override@JsonKey() final  bool locked;

/// Create a copy of GuideModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GuideModelCopyWith<_GuideModel> get copyWith => __$GuideModelCopyWithImpl<_GuideModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GuideModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GuideModel&&(identical(other.id, id) || other.id == id)&&(identical(other.orientation, orientation) || other.orientation == orientation)&&(identical(other.position, position) || other.position == position)&&(identical(other.locked, locked) || other.locked == locked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orientation,position,locked);

@override
String toString() {
  return 'GuideModel(id: $id, orientation: $orientation, position: $position, locked: $locked)';
}


}

/// @nodoc
abstract mixin class _$GuideModelCopyWith<$Res> implements $GuideModelCopyWith<$Res> {
  factory _$GuideModelCopyWith(_GuideModel value, $Res Function(_GuideModel) _then) = __$GuideModelCopyWithImpl;
@override @useResult
$Res call({
 String id, GuideOrientation orientation, double position, bool locked
});




}
/// @nodoc
class __$GuideModelCopyWithImpl<$Res>
    implements _$GuideModelCopyWith<$Res> {
  __$GuideModelCopyWithImpl(this._self, this._then);

  final _GuideModel _self;
  final $Res Function(_GuideModel) _then;

/// Create a copy of GuideModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? orientation = null,Object? position = null,Object? locked = null,}) {
  return _then(_GuideModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orientation: null == orientation ? _self.orientation : orientation // ignore: cast_nullable_to_non_nullable
as GuideOrientation,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as double,locked: null == locked ? _self.locked : locked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$GridSpec {

 bool get visible;/// Major grid spacing in canvas units.
 double get spacing;/// Subdivisions per major cell.
 int get subdivisions;
/// Create a copy of GridSpec
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GridSpecCopyWith<GridSpec> get copyWith => _$GridSpecCopyWithImpl<GridSpec>(this as GridSpec, _$identity);

  /// Serializes this GridSpec to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GridSpec&&(identical(other.visible, visible) || other.visible == visible)&&(identical(other.spacing, spacing) || other.spacing == spacing)&&(identical(other.subdivisions, subdivisions) || other.subdivisions == subdivisions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,visible,spacing,subdivisions);

@override
String toString() {
  return 'GridSpec(visible: $visible, spacing: $spacing, subdivisions: $subdivisions)';
}


}

/// @nodoc
abstract mixin class $GridSpecCopyWith<$Res>  {
  factory $GridSpecCopyWith(GridSpec value, $Res Function(GridSpec) _then) = _$GridSpecCopyWithImpl;
@useResult
$Res call({
 bool visible, double spacing, int subdivisions
});




}
/// @nodoc
class _$GridSpecCopyWithImpl<$Res>
    implements $GridSpecCopyWith<$Res> {
  _$GridSpecCopyWithImpl(this._self, this._then);

  final GridSpec _self;
  final $Res Function(GridSpec) _then;

/// Create a copy of GridSpec
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? visible = null,Object? spacing = null,Object? subdivisions = null,}) {
  return _then(_self.copyWith(
visible: null == visible ? _self.visible : visible // ignore: cast_nullable_to_non_nullable
as bool,spacing: null == spacing ? _self.spacing : spacing // ignore: cast_nullable_to_non_nullable
as double,subdivisions: null == subdivisions ? _self.subdivisions : subdivisions // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [GridSpec].
extension GridSpecPatterns on GridSpec {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GridSpec value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GridSpec() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GridSpec value)  $default,){
final _that = this;
switch (_that) {
case _GridSpec():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GridSpec value)?  $default,){
final _that = this;
switch (_that) {
case _GridSpec() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool visible,  double spacing,  int subdivisions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GridSpec() when $default != null:
return $default(_that.visible,_that.spacing,_that.subdivisions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool visible,  double spacing,  int subdivisions)  $default,) {final _that = this;
switch (_that) {
case _GridSpec():
return $default(_that.visible,_that.spacing,_that.subdivisions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool visible,  double spacing,  int subdivisions)?  $default,) {final _that = this;
switch (_that) {
case _GridSpec() when $default != null:
return $default(_that.visible,_that.spacing,_that.subdivisions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GridSpec extends GridSpec {
  const _GridSpec({this.visible = false, this.spacing = 10.0, this.subdivisions = 4}): super._();
  factory _GridSpec.fromJson(Map<String, dynamic> json) => _$GridSpecFromJson(json);

@override@JsonKey() final  bool visible;
/// Major grid spacing in canvas units.
@override@JsonKey() final  double spacing;
/// Subdivisions per major cell.
@override@JsonKey() final  int subdivisions;

/// Create a copy of GridSpec
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GridSpecCopyWith<_GridSpec> get copyWith => __$GridSpecCopyWithImpl<_GridSpec>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GridSpecToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GridSpec&&(identical(other.visible, visible) || other.visible == visible)&&(identical(other.spacing, spacing) || other.spacing == spacing)&&(identical(other.subdivisions, subdivisions) || other.subdivisions == subdivisions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,visible,spacing,subdivisions);

@override
String toString() {
  return 'GridSpec(visible: $visible, spacing: $spacing, subdivisions: $subdivisions)';
}


}

/// @nodoc
abstract mixin class _$GridSpecCopyWith<$Res> implements $GridSpecCopyWith<$Res> {
  factory _$GridSpecCopyWith(_GridSpec value, $Res Function(_GridSpec) _then) = __$GridSpecCopyWithImpl;
@override @useResult
$Res call({
 bool visible, double spacing, int subdivisions
});




}
/// @nodoc
class __$GridSpecCopyWithImpl<$Res>
    implements _$GridSpecCopyWith<$Res> {
  __$GridSpecCopyWithImpl(this._self, this._then);

  final _GridSpec _self;
  final $Res Function(_GridSpec) _then;

/// Create a copy of GridSpec
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? visible = null,Object? spacing = null,Object? subdivisions = null,}) {
  return _then(_GridSpec(
visible: null == visible ? _self.visible : visible // ignore: cast_nullable_to_non_nullable
as bool,spacing: null == spacing ? _self.spacing : spacing // ignore: cast_nullable_to_non_nullable
as double,subdivisions: null == subdivisions ? _self.subdivisions : subdivisions // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$Measurement {

 Point2D get from; Point2D get to;@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) MeasurementUnit get unit;
/// Create a copy of Measurement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MeasurementCopyWith<Measurement> get copyWith => _$MeasurementCopyWithImpl<Measurement>(this as Measurement, _$identity);

  /// Serializes this Measurement to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Measurement&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to)&&(identical(other.unit, unit) || other.unit == unit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,from,to,unit);

@override
String toString() {
  return 'Measurement(from: $from, to: $to, unit: $unit)';
}


}

/// @nodoc
abstract mixin class $MeasurementCopyWith<$Res>  {
  factory $MeasurementCopyWith(Measurement value, $Res Function(Measurement) _then) = _$MeasurementCopyWithImpl;
@useResult
$Res call({
 Point2D from, Point2D to,@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) MeasurementUnit unit
});


$Point2DCopyWith<$Res> get from;$Point2DCopyWith<$Res> get to;

}
/// @nodoc
class _$MeasurementCopyWithImpl<$Res>
    implements $MeasurementCopyWith<$Res> {
  _$MeasurementCopyWithImpl(this._self, this._then);

  final Measurement _self;
  final $Res Function(Measurement) _then;

/// Create a copy of Measurement
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? from = null,Object? to = null,Object? unit = null,}) {
  return _then(_self.copyWith(
from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as Point2D,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as Point2D,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as MeasurementUnit,
  ));
}
/// Create a copy of Measurement
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Point2DCopyWith<$Res> get from {
  
  return $Point2DCopyWith<$Res>(_self.from, (value) {
    return _then(_self.copyWith(from: value));
  });
}/// Create a copy of Measurement
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Point2DCopyWith<$Res> get to {
  
  return $Point2DCopyWith<$Res>(_self.to, (value) {
    return _then(_self.copyWith(to: value));
  });
}
}


/// Adds pattern-matching-related methods to [Measurement].
extension MeasurementPatterns on Measurement {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Measurement value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Measurement() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Measurement value)  $default,){
final _that = this;
switch (_that) {
case _Measurement():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Measurement value)?  $default,){
final _that = this;
switch (_that) {
case _Measurement() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Point2D from,  Point2D to, @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson)  MeasurementUnit unit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Measurement() when $default != null:
return $default(_that.from,_that.to,_that.unit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Point2D from,  Point2D to, @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson)  MeasurementUnit unit)  $default,) {final _that = this;
switch (_that) {
case _Measurement():
return $default(_that.from,_that.to,_that.unit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Point2D from,  Point2D to, @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson)  MeasurementUnit unit)?  $default,) {final _that = this;
switch (_that) {
case _Measurement() when $default != null:
return $default(_that.from,_that.to,_that.unit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Measurement extends Measurement {
  const _Measurement({required this.from, required this.to, @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) this.unit = MeasurementUnit.millimetre}): super._();
  factory _Measurement.fromJson(Map<String, dynamic> json) => _$MeasurementFromJson(json);

@override final  Point2D from;
@override final  Point2D to;
@override@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) final  MeasurementUnit unit;

/// Create a copy of Measurement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MeasurementCopyWith<_Measurement> get copyWith => __$MeasurementCopyWithImpl<_Measurement>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MeasurementToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Measurement&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to)&&(identical(other.unit, unit) || other.unit == unit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,from,to,unit);

@override
String toString() {
  return 'Measurement(from: $from, to: $to, unit: $unit)';
}


}

/// @nodoc
abstract mixin class _$MeasurementCopyWith<$Res> implements $MeasurementCopyWith<$Res> {
  factory _$MeasurementCopyWith(_Measurement value, $Res Function(_Measurement) _then) = __$MeasurementCopyWithImpl;
@override @useResult
$Res call({
 Point2D from, Point2D to,@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) MeasurementUnit unit
});


@override $Point2DCopyWith<$Res> get from;@override $Point2DCopyWith<$Res> get to;

}
/// @nodoc
class __$MeasurementCopyWithImpl<$Res>
    implements _$MeasurementCopyWith<$Res> {
  __$MeasurementCopyWithImpl(this._self, this._then);

  final _Measurement _self;
  final $Res Function(_Measurement) _then;

/// Create a copy of Measurement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? from = null,Object? to = null,Object? unit = null,}) {
  return _then(_Measurement(
from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as Point2D,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as Point2D,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as MeasurementUnit,
  ));
}

/// Create a copy of Measurement
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Point2DCopyWith<$Res> get from {
  
  return $Point2DCopyWith<$Res>(_self.from, (value) {
    return _then(_self.copyWith(from: value));
  });
}/// Create a copy of Measurement
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Point2DCopyWith<$Res> get to {
  
  return $Point2DCopyWith<$Res>(_self.to, (value) {
    return _then(_self.copyWith(to: value));
  });
}
}

// dart format on
