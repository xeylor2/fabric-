// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'print_regions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CanvasInsets {

 double get left; double get top; double get right; double get bottom;
/// Create a copy of CanvasInsets
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CanvasInsetsCopyWith<CanvasInsets> get copyWith => _$CanvasInsetsCopyWithImpl<CanvasInsets>(this as CanvasInsets, _$identity);

  /// Serializes this CanvasInsets to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CanvasInsets&&(identical(other.left, left) || other.left == left)&&(identical(other.top, top) || other.top == top)&&(identical(other.right, right) || other.right == right)&&(identical(other.bottom, bottom) || other.bottom == bottom));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,left,top,right,bottom);

@override
String toString() {
  return 'CanvasInsets(left: $left, top: $top, right: $right, bottom: $bottom)';
}


}

/// @nodoc
abstract mixin class $CanvasInsetsCopyWith<$Res>  {
  factory $CanvasInsetsCopyWith(CanvasInsets value, $Res Function(CanvasInsets) _then) = _$CanvasInsetsCopyWithImpl;
@useResult
$Res call({
 double left, double top, double right, double bottom
});




}
/// @nodoc
class _$CanvasInsetsCopyWithImpl<$Res>
    implements $CanvasInsetsCopyWith<$Res> {
  _$CanvasInsetsCopyWithImpl(this._self, this._then);

  final CanvasInsets _self;
  final $Res Function(CanvasInsets) _then;

/// Create a copy of CanvasInsets
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? left = null,Object? top = null,Object? right = null,Object? bottom = null,}) {
  return _then(_self.copyWith(
left: null == left ? _self.left : left // ignore: cast_nullable_to_non_nullable
as double,top: null == top ? _self.top : top // ignore: cast_nullable_to_non_nullable
as double,right: null == right ? _self.right : right // ignore: cast_nullable_to_non_nullable
as double,bottom: null == bottom ? _self.bottom : bottom // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [CanvasInsets].
extension CanvasInsetsPatterns on CanvasInsets {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CanvasInsets value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CanvasInsets() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CanvasInsets value)  $default,){
final _that = this;
switch (_that) {
case _CanvasInsets():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CanvasInsets value)?  $default,){
final _that = this;
switch (_that) {
case _CanvasInsets() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double left,  double top,  double right,  double bottom)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CanvasInsets() when $default != null:
return $default(_that.left,_that.top,_that.right,_that.bottom);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double left,  double top,  double right,  double bottom)  $default,) {final _that = this;
switch (_that) {
case _CanvasInsets():
return $default(_that.left,_that.top,_that.right,_that.bottom);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double left,  double top,  double right,  double bottom)?  $default,) {final _that = this;
switch (_that) {
case _CanvasInsets() when $default != null:
return $default(_that.left,_that.top,_that.right,_that.bottom);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CanvasInsets extends CanvasInsets {
  const _CanvasInsets({this.left = 0.0, this.top = 0.0, this.right = 0.0, this.bottom = 0.0}): super._();
  factory _CanvasInsets.fromJson(Map<String, dynamic> json) => _$CanvasInsetsFromJson(json);

@override@JsonKey() final  double left;
@override@JsonKey() final  double top;
@override@JsonKey() final  double right;
@override@JsonKey() final  double bottom;

/// Create a copy of CanvasInsets
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CanvasInsetsCopyWith<_CanvasInsets> get copyWith => __$CanvasInsetsCopyWithImpl<_CanvasInsets>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CanvasInsetsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CanvasInsets&&(identical(other.left, left) || other.left == left)&&(identical(other.top, top) || other.top == top)&&(identical(other.right, right) || other.right == right)&&(identical(other.bottom, bottom) || other.bottom == bottom));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,left,top,right,bottom);

@override
String toString() {
  return 'CanvasInsets(left: $left, top: $top, right: $right, bottom: $bottom)';
}


}

/// @nodoc
abstract mixin class _$CanvasInsetsCopyWith<$Res> implements $CanvasInsetsCopyWith<$Res> {
  factory _$CanvasInsetsCopyWith(_CanvasInsets value, $Res Function(_CanvasInsets) _then) = __$CanvasInsetsCopyWithImpl;
@override @useResult
$Res call({
 double left, double top, double right, double bottom
});




}
/// @nodoc
class __$CanvasInsetsCopyWithImpl<$Res>
    implements _$CanvasInsetsCopyWith<$Res> {
  __$CanvasInsetsCopyWithImpl(this._self, this._then);

  final _CanvasInsets _self;
  final $Res Function(_CanvasInsets) _then;

/// Create a copy of CanvasInsets
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? left = null,Object? top = null,Object? right = null,Object? bottom = null,}) {
  return _then(_CanvasInsets(
left: null == left ? _self.left : left // ignore: cast_nullable_to_non_nullable
as double,top: null == top ? _self.top : top // ignore: cast_nullable_to_non_nullable
as double,right: null == right ? _self.right : right // ignore: cast_nullable_to_non_nullable
as double,bottom: null == bottom ? _self.bottom : bottom // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$PrintRegionSpec {

 CanvasInsets get safeArea; CanvasInsets get bleed; CanvasInsets get printMargin;@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) MeasurementUnit get unit;
/// Create a copy of PrintRegionSpec
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrintRegionSpecCopyWith<PrintRegionSpec> get copyWith => _$PrintRegionSpecCopyWithImpl<PrintRegionSpec>(this as PrintRegionSpec, _$identity);

  /// Serializes this PrintRegionSpec to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrintRegionSpec&&(identical(other.safeArea, safeArea) || other.safeArea == safeArea)&&(identical(other.bleed, bleed) || other.bleed == bleed)&&(identical(other.printMargin, printMargin) || other.printMargin == printMargin)&&(identical(other.unit, unit) || other.unit == unit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,safeArea,bleed,printMargin,unit);

@override
String toString() {
  return 'PrintRegionSpec(safeArea: $safeArea, bleed: $bleed, printMargin: $printMargin, unit: $unit)';
}


}

/// @nodoc
abstract mixin class $PrintRegionSpecCopyWith<$Res>  {
  factory $PrintRegionSpecCopyWith(PrintRegionSpec value, $Res Function(PrintRegionSpec) _then) = _$PrintRegionSpecCopyWithImpl;
@useResult
$Res call({
 CanvasInsets safeArea, CanvasInsets bleed, CanvasInsets printMargin,@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) MeasurementUnit unit
});


$CanvasInsetsCopyWith<$Res> get safeArea;$CanvasInsetsCopyWith<$Res> get bleed;$CanvasInsetsCopyWith<$Res> get printMargin;

}
/// @nodoc
class _$PrintRegionSpecCopyWithImpl<$Res>
    implements $PrintRegionSpecCopyWith<$Res> {
  _$PrintRegionSpecCopyWithImpl(this._self, this._then);

  final PrintRegionSpec _self;
  final $Res Function(PrintRegionSpec) _then;

/// Create a copy of PrintRegionSpec
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? safeArea = null,Object? bleed = null,Object? printMargin = null,Object? unit = null,}) {
  return _then(_self.copyWith(
safeArea: null == safeArea ? _self.safeArea : safeArea // ignore: cast_nullable_to_non_nullable
as CanvasInsets,bleed: null == bleed ? _self.bleed : bleed // ignore: cast_nullable_to_non_nullable
as CanvasInsets,printMargin: null == printMargin ? _self.printMargin : printMargin // ignore: cast_nullable_to_non_nullable
as CanvasInsets,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as MeasurementUnit,
  ));
}
/// Create a copy of PrintRegionSpec
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CanvasInsetsCopyWith<$Res> get safeArea {
  
  return $CanvasInsetsCopyWith<$Res>(_self.safeArea, (value) {
    return _then(_self.copyWith(safeArea: value));
  });
}/// Create a copy of PrintRegionSpec
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CanvasInsetsCopyWith<$Res> get bleed {
  
  return $CanvasInsetsCopyWith<$Res>(_self.bleed, (value) {
    return _then(_self.copyWith(bleed: value));
  });
}/// Create a copy of PrintRegionSpec
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CanvasInsetsCopyWith<$Res> get printMargin {
  
  return $CanvasInsetsCopyWith<$Res>(_self.printMargin, (value) {
    return _then(_self.copyWith(printMargin: value));
  });
}
}


/// Adds pattern-matching-related methods to [PrintRegionSpec].
extension PrintRegionSpecPatterns on PrintRegionSpec {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PrintRegionSpec value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PrintRegionSpec() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PrintRegionSpec value)  $default,){
final _that = this;
switch (_that) {
case _PrintRegionSpec():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PrintRegionSpec value)?  $default,){
final _that = this;
switch (_that) {
case _PrintRegionSpec() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CanvasInsets safeArea,  CanvasInsets bleed,  CanvasInsets printMargin, @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson)  MeasurementUnit unit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrintRegionSpec() when $default != null:
return $default(_that.safeArea,_that.bleed,_that.printMargin,_that.unit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CanvasInsets safeArea,  CanvasInsets bleed,  CanvasInsets printMargin, @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson)  MeasurementUnit unit)  $default,) {final _that = this;
switch (_that) {
case _PrintRegionSpec():
return $default(_that.safeArea,_that.bleed,_that.printMargin,_that.unit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CanvasInsets safeArea,  CanvasInsets bleed,  CanvasInsets printMargin, @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson)  MeasurementUnit unit)?  $default,) {final _that = this;
switch (_that) {
case _PrintRegionSpec() when $default != null:
return $default(_that.safeArea,_that.bleed,_that.printMargin,_that.unit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PrintRegionSpec extends PrintRegionSpec {
  const _PrintRegionSpec({this.safeArea = CanvasInsets.zero, this.bleed = CanvasInsets.zero, this.printMargin = CanvasInsets.zero, @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) this.unit = MeasurementUnit.millimetre}): super._();
  factory _PrintRegionSpec.fromJson(Map<String, dynamic> json) => _$PrintRegionSpecFromJson(json);

@override@JsonKey() final  CanvasInsets safeArea;
@override@JsonKey() final  CanvasInsets bleed;
@override@JsonKey() final  CanvasInsets printMargin;
@override@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) final  MeasurementUnit unit;

/// Create a copy of PrintRegionSpec
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrintRegionSpecCopyWith<_PrintRegionSpec> get copyWith => __$PrintRegionSpecCopyWithImpl<_PrintRegionSpec>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PrintRegionSpecToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrintRegionSpec&&(identical(other.safeArea, safeArea) || other.safeArea == safeArea)&&(identical(other.bleed, bleed) || other.bleed == bleed)&&(identical(other.printMargin, printMargin) || other.printMargin == printMargin)&&(identical(other.unit, unit) || other.unit == unit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,safeArea,bleed,printMargin,unit);

@override
String toString() {
  return 'PrintRegionSpec(safeArea: $safeArea, bleed: $bleed, printMargin: $printMargin, unit: $unit)';
}


}

/// @nodoc
abstract mixin class _$PrintRegionSpecCopyWith<$Res> implements $PrintRegionSpecCopyWith<$Res> {
  factory _$PrintRegionSpecCopyWith(_PrintRegionSpec value, $Res Function(_PrintRegionSpec) _then) = __$PrintRegionSpecCopyWithImpl;
@override @useResult
$Res call({
 CanvasInsets safeArea, CanvasInsets bleed, CanvasInsets printMargin,@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) MeasurementUnit unit
});


@override $CanvasInsetsCopyWith<$Res> get safeArea;@override $CanvasInsetsCopyWith<$Res> get bleed;@override $CanvasInsetsCopyWith<$Res> get printMargin;

}
/// @nodoc
class __$PrintRegionSpecCopyWithImpl<$Res>
    implements _$PrintRegionSpecCopyWith<$Res> {
  __$PrintRegionSpecCopyWithImpl(this._self, this._then);

  final _PrintRegionSpec _self;
  final $Res Function(_PrintRegionSpec) _then;

/// Create a copy of PrintRegionSpec
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? safeArea = null,Object? bleed = null,Object? printMargin = null,Object? unit = null,}) {
  return _then(_PrintRegionSpec(
safeArea: null == safeArea ? _self.safeArea : safeArea // ignore: cast_nullable_to_non_nullable
as CanvasInsets,bleed: null == bleed ? _self.bleed : bleed // ignore: cast_nullable_to_non_nullable
as CanvasInsets,printMargin: null == printMargin ? _self.printMargin : printMargin // ignore: cast_nullable_to_non_nullable
as CanvasInsets,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as MeasurementUnit,
  ));
}

/// Create a copy of PrintRegionSpec
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CanvasInsetsCopyWith<$Res> get safeArea {
  
  return $CanvasInsetsCopyWith<$Res>(_self.safeArea, (value) {
    return _then(_self.copyWith(safeArea: value));
  });
}/// Create a copy of PrintRegionSpec
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CanvasInsetsCopyWith<$Res> get bleed {
  
  return $CanvasInsetsCopyWith<$Res>(_self.bleed, (value) {
    return _then(_self.copyWith(bleed: value));
  });
}/// Create a copy of PrintRegionSpec
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CanvasInsetsCopyWith<$Res> get printMargin {
  
  return $CanvasInsetsCopyWith<$Res>(_self.printMargin, (value) {
    return _then(_self.copyWith(printMargin: value));
  });
}
}

// dart format on
