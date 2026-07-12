// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profiles.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExportProfile {

 String get id; String get name; ExportFormat get format; double get dpi; double get scale; Map<String, Object?> get options;
/// Create a copy of ExportProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExportProfileCopyWith<ExportProfile> get copyWith => _$ExportProfileCopyWithImpl<ExportProfile>(this as ExportProfile, _$identity);

  /// Serializes this ExportProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExportProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.format, format) || other.format == format)&&(identical(other.dpi, dpi) || other.dpi == dpi)&&(identical(other.scale, scale) || other.scale == scale)&&const DeepCollectionEquality().equals(other.options, options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,format,dpi,scale,const DeepCollectionEquality().hash(options));

@override
String toString() {
  return 'ExportProfile(id: $id, name: $name, format: $format, dpi: $dpi, scale: $scale, options: $options)';
}


}

/// @nodoc
abstract mixin class $ExportProfileCopyWith<$Res>  {
  factory $ExportProfileCopyWith(ExportProfile value, $Res Function(ExportProfile) _then) = _$ExportProfileCopyWithImpl;
@useResult
$Res call({
 String id, String name, ExportFormat format, double dpi, double scale, Map<String, Object?> options
});




}
/// @nodoc
class _$ExportProfileCopyWithImpl<$Res>
    implements $ExportProfileCopyWith<$Res> {
  _$ExportProfileCopyWithImpl(this._self, this._then);

  final ExportProfile _self;
  final $Res Function(ExportProfile) _then;

/// Create a copy of ExportProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? format = null,Object? dpi = null,Object? scale = null,Object? options = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,format: null == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as ExportFormat,dpi: null == dpi ? _self.dpi : dpi // ignore: cast_nullable_to_non_nullable
as double,scale: null == scale ? _self.scale : scale // ignore: cast_nullable_to_non_nullable
as double,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

}


/// Adds pattern-matching-related methods to [ExportProfile].
extension ExportProfilePatterns on ExportProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExportProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExportProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExportProfile value)  $default,){
final _that = this;
switch (_that) {
case _ExportProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExportProfile value)?  $default,){
final _that = this;
switch (_that) {
case _ExportProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  ExportFormat format,  double dpi,  double scale,  Map<String, Object?> options)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExportProfile() when $default != null:
return $default(_that.id,_that.name,_that.format,_that.dpi,_that.scale,_that.options);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  ExportFormat format,  double dpi,  double scale,  Map<String, Object?> options)  $default,) {final _that = this;
switch (_that) {
case _ExportProfile():
return $default(_that.id,_that.name,_that.format,_that.dpi,_that.scale,_that.options);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  ExportFormat format,  double dpi,  double scale,  Map<String, Object?> options)?  $default,) {final _that = this;
switch (_that) {
case _ExportProfile() when $default != null:
return $default(_that.id,_that.name,_that.format,_that.dpi,_that.scale,_that.options);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExportProfile implements ExportProfile {
  const _ExportProfile({required this.id, required this.name, required this.format, this.dpi = 300.0, this.scale = 1.0, final  Map<String, Object?> options = const <String, Object?>{}}): _options = options;
  factory _ExportProfile.fromJson(Map<String, dynamic> json) => _$ExportProfileFromJson(json);

@override final  String id;
@override final  String name;
@override final  ExportFormat format;
@override@JsonKey() final  double dpi;
@override@JsonKey() final  double scale;
 final  Map<String, Object?> _options;
@override@JsonKey() Map<String, Object?> get options {
  if (_options is EqualUnmodifiableMapView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_options);
}


/// Create a copy of ExportProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExportProfileCopyWith<_ExportProfile> get copyWith => __$ExportProfileCopyWithImpl<_ExportProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExportProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExportProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.format, format) || other.format == format)&&(identical(other.dpi, dpi) || other.dpi == dpi)&&(identical(other.scale, scale) || other.scale == scale)&&const DeepCollectionEquality().equals(other._options, _options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,format,dpi,scale,const DeepCollectionEquality().hash(_options));

@override
String toString() {
  return 'ExportProfile(id: $id, name: $name, format: $format, dpi: $dpi, scale: $scale, options: $options)';
}


}

/// @nodoc
abstract mixin class _$ExportProfileCopyWith<$Res> implements $ExportProfileCopyWith<$Res> {
  factory _$ExportProfileCopyWith(_ExportProfile value, $Res Function(_ExportProfile) _then) = __$ExportProfileCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, ExportFormat format, double dpi, double scale, Map<String, Object?> options
});




}
/// @nodoc
class __$ExportProfileCopyWithImpl<$Res>
    implements _$ExportProfileCopyWith<$Res> {
  __$ExportProfileCopyWithImpl(this._self, this._then);

  final _ExportProfile _self;
  final $Res Function(_ExportProfile) _then;

/// Create a copy of ExportProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? format = null,Object? dpi = null,Object? scale = null,Object? options = null,}) {
  return _then(_ExportProfile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,format: null == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as ExportFormat,dpi: null == dpi ? _self.dpi : dpi // ignore: cast_nullable_to_non_nullable
as double,scale: null == scale ? _self.scale : scale // ignore: cast_nullable_to_non_nullable
as double,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}


/// @nodoc
mixin _$ProductionProfile {

 String get id; String get name; String? get printTechnique; int? get maxColours; Map<String, Object?> get options;
/// Create a copy of ProductionProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductionProfileCopyWith<ProductionProfile> get copyWith => _$ProductionProfileCopyWithImpl<ProductionProfile>(this as ProductionProfile, _$identity);

  /// Serializes this ProductionProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductionProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.printTechnique, printTechnique) || other.printTechnique == printTechnique)&&(identical(other.maxColours, maxColours) || other.maxColours == maxColours)&&const DeepCollectionEquality().equals(other.options, options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,printTechnique,maxColours,const DeepCollectionEquality().hash(options));

@override
String toString() {
  return 'ProductionProfile(id: $id, name: $name, printTechnique: $printTechnique, maxColours: $maxColours, options: $options)';
}


}

/// @nodoc
abstract mixin class $ProductionProfileCopyWith<$Res>  {
  factory $ProductionProfileCopyWith(ProductionProfile value, $Res Function(ProductionProfile) _then) = _$ProductionProfileCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? printTechnique, int? maxColours, Map<String, Object?> options
});




}
/// @nodoc
class _$ProductionProfileCopyWithImpl<$Res>
    implements $ProductionProfileCopyWith<$Res> {
  _$ProductionProfileCopyWithImpl(this._self, this._then);

  final ProductionProfile _self;
  final $Res Function(ProductionProfile) _then;

/// Create a copy of ProductionProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? printTechnique = freezed,Object? maxColours = freezed,Object? options = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,printTechnique: freezed == printTechnique ? _self.printTechnique : printTechnique // ignore: cast_nullable_to_non_nullable
as String?,maxColours: freezed == maxColours ? _self.maxColours : maxColours // ignore: cast_nullable_to_non_nullable
as int?,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductionProfile].
extension ProductionProfilePatterns on ProductionProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductionProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductionProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductionProfile value)  $default,){
final _that = this;
switch (_that) {
case _ProductionProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductionProfile value)?  $default,){
final _that = this;
switch (_that) {
case _ProductionProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? printTechnique,  int? maxColours,  Map<String, Object?> options)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductionProfile() when $default != null:
return $default(_that.id,_that.name,_that.printTechnique,_that.maxColours,_that.options);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? printTechnique,  int? maxColours,  Map<String, Object?> options)  $default,) {final _that = this;
switch (_that) {
case _ProductionProfile():
return $default(_that.id,_that.name,_that.printTechnique,_that.maxColours,_that.options);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? printTechnique,  int? maxColours,  Map<String, Object?> options)?  $default,) {final _that = this;
switch (_that) {
case _ProductionProfile() when $default != null:
return $default(_that.id,_that.name,_that.printTechnique,_that.maxColours,_that.options);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductionProfile implements ProductionProfile {
  const _ProductionProfile({required this.id, required this.name, this.printTechnique, this.maxColours, final  Map<String, Object?> options = const <String, Object?>{}}): _options = options;
  factory _ProductionProfile.fromJson(Map<String, dynamic> json) => _$ProductionProfileFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? printTechnique;
@override final  int? maxColours;
 final  Map<String, Object?> _options;
@override@JsonKey() Map<String, Object?> get options {
  if (_options is EqualUnmodifiableMapView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_options);
}


/// Create a copy of ProductionProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductionProfileCopyWith<_ProductionProfile> get copyWith => __$ProductionProfileCopyWithImpl<_ProductionProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductionProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductionProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.printTechnique, printTechnique) || other.printTechnique == printTechnique)&&(identical(other.maxColours, maxColours) || other.maxColours == maxColours)&&const DeepCollectionEquality().equals(other._options, _options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,printTechnique,maxColours,const DeepCollectionEquality().hash(_options));

@override
String toString() {
  return 'ProductionProfile(id: $id, name: $name, printTechnique: $printTechnique, maxColours: $maxColours, options: $options)';
}


}

/// @nodoc
abstract mixin class _$ProductionProfileCopyWith<$Res> implements $ProductionProfileCopyWith<$Res> {
  factory _$ProductionProfileCopyWith(_ProductionProfile value, $Res Function(_ProductionProfile) _then) = __$ProductionProfileCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? printTechnique, int? maxColours, Map<String, Object?> options
});




}
/// @nodoc
class __$ProductionProfileCopyWithImpl<$Res>
    implements _$ProductionProfileCopyWith<$Res> {
  __$ProductionProfileCopyWithImpl(this._self, this._then);

  final _ProductionProfile _self;
  final $Res Function(_ProductionProfile) _then;

/// Create a copy of ProductionProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? printTechnique = freezed,Object? maxColours = freezed,Object? options = null,}) {
  return _then(_ProductionProfile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,printTechnique: freezed == printTechnique ? _self.printTechnique : printTechnique // ignore: cast_nullable_to_non_nullable
as String?,maxColours: freezed == maxColours ? _self.maxColours : maxColours // ignore: cast_nullable_to_non_nullable
as int?,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}


/// @nodoc
mixin _$MeasurementProfile {

 String get id; String get name;@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) MeasurementUnit get unit; double get dpi;
/// Create a copy of MeasurementProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MeasurementProfileCopyWith<MeasurementProfile> get copyWith => _$MeasurementProfileCopyWithImpl<MeasurementProfile>(this as MeasurementProfile, _$identity);

  /// Serializes this MeasurementProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeasurementProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.dpi, dpi) || other.dpi == dpi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,unit,dpi);

@override
String toString() {
  return 'MeasurementProfile(id: $id, name: $name, unit: $unit, dpi: $dpi)';
}


}

/// @nodoc
abstract mixin class $MeasurementProfileCopyWith<$Res>  {
  factory $MeasurementProfileCopyWith(MeasurementProfile value, $Res Function(MeasurementProfile) _then) = _$MeasurementProfileCopyWithImpl;
@useResult
$Res call({
 String id, String name,@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) MeasurementUnit unit, double dpi
});




}
/// @nodoc
class _$MeasurementProfileCopyWithImpl<$Res>
    implements $MeasurementProfileCopyWith<$Res> {
  _$MeasurementProfileCopyWithImpl(this._self, this._then);

  final MeasurementProfile _self;
  final $Res Function(MeasurementProfile) _then;

/// Create a copy of MeasurementProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? unit = null,Object? dpi = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as MeasurementUnit,dpi: null == dpi ? _self.dpi : dpi // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [MeasurementProfile].
extension MeasurementProfilePatterns on MeasurementProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MeasurementProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MeasurementProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MeasurementProfile value)  $default,){
final _that = this;
switch (_that) {
case _MeasurementProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MeasurementProfile value)?  $default,){
final _that = this;
switch (_that) {
case _MeasurementProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson)  MeasurementUnit unit,  double dpi)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MeasurementProfile() when $default != null:
return $default(_that.id,_that.name,_that.unit,_that.dpi);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson)  MeasurementUnit unit,  double dpi)  $default,) {final _that = this;
switch (_that) {
case _MeasurementProfile():
return $default(_that.id,_that.name,_that.unit,_that.dpi);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name, @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson)  MeasurementUnit unit,  double dpi)?  $default,) {final _that = this;
switch (_that) {
case _MeasurementProfile() when $default != null:
return $default(_that.id,_that.name,_that.unit,_that.dpi);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MeasurementProfile implements MeasurementProfile {
  const _MeasurementProfile({required this.id, required this.name, @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) required this.unit, this.dpi = 300.0});
  factory _MeasurementProfile.fromJson(Map<String, dynamic> json) => _$MeasurementProfileFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) final  MeasurementUnit unit;
@override@JsonKey() final  double dpi;

/// Create a copy of MeasurementProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MeasurementProfileCopyWith<_MeasurementProfile> get copyWith => __$MeasurementProfileCopyWithImpl<_MeasurementProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MeasurementProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MeasurementProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.dpi, dpi) || other.dpi == dpi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,unit,dpi);

@override
String toString() {
  return 'MeasurementProfile(id: $id, name: $name, unit: $unit, dpi: $dpi)';
}


}

/// @nodoc
abstract mixin class _$MeasurementProfileCopyWith<$Res> implements $MeasurementProfileCopyWith<$Res> {
  factory _$MeasurementProfileCopyWith(_MeasurementProfile value, $Res Function(_MeasurementProfile) _then) = __$MeasurementProfileCopyWithImpl;
@override @useResult
$Res call({
 String id, String name,@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) MeasurementUnit unit, double dpi
});




}
/// @nodoc
class __$MeasurementProfileCopyWithImpl<$Res>
    implements _$MeasurementProfileCopyWith<$Res> {
  __$MeasurementProfileCopyWithImpl(this._self, this._then);

  final _MeasurementProfile _self;
  final $Res Function(_MeasurementProfile) _then;

/// Create a copy of MeasurementProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? unit = null,Object? dpi = null,}) {
  return _then(_MeasurementProfile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as MeasurementUnit,dpi: null == dpi ? _self.dpi : dpi // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$ColourProfile {

 String get id; String get name;/// Colour space identifier (e.g. `srgb`, `cmyk_fogra39`).
 String get space;/// Reference to an ICC profile in the asset store, when present.
 String? get iccAssetId;
/// Create a copy of ColourProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ColourProfileCopyWith<ColourProfile> get copyWith => _$ColourProfileCopyWithImpl<ColourProfile>(this as ColourProfile, _$identity);

  /// Serializes this ColourProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ColourProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.space, space) || other.space == space)&&(identical(other.iccAssetId, iccAssetId) || other.iccAssetId == iccAssetId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,space,iccAssetId);

@override
String toString() {
  return 'ColourProfile(id: $id, name: $name, space: $space, iccAssetId: $iccAssetId)';
}


}

/// @nodoc
abstract mixin class $ColourProfileCopyWith<$Res>  {
  factory $ColourProfileCopyWith(ColourProfile value, $Res Function(ColourProfile) _then) = _$ColourProfileCopyWithImpl;
@useResult
$Res call({
 String id, String name, String space, String? iccAssetId
});




}
/// @nodoc
class _$ColourProfileCopyWithImpl<$Res>
    implements $ColourProfileCopyWith<$Res> {
  _$ColourProfileCopyWithImpl(this._self, this._then);

  final ColourProfile _self;
  final $Res Function(ColourProfile) _then;

/// Create a copy of ColourProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? space = null,Object? iccAssetId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,space: null == space ? _self.space : space // ignore: cast_nullable_to_non_nullable
as String,iccAssetId: freezed == iccAssetId ? _self.iccAssetId : iccAssetId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ColourProfile].
extension ColourProfilePatterns on ColourProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ColourProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ColourProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ColourProfile value)  $default,){
final _that = this;
switch (_that) {
case _ColourProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ColourProfile value)?  $default,){
final _that = this;
switch (_that) {
case _ColourProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String space,  String? iccAssetId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ColourProfile() when $default != null:
return $default(_that.id,_that.name,_that.space,_that.iccAssetId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String space,  String? iccAssetId)  $default,) {final _that = this;
switch (_that) {
case _ColourProfile():
return $default(_that.id,_that.name,_that.space,_that.iccAssetId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String space,  String? iccAssetId)?  $default,) {final _that = this;
switch (_that) {
case _ColourProfile() when $default != null:
return $default(_that.id,_that.name,_that.space,_that.iccAssetId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ColourProfile implements ColourProfile {
  const _ColourProfile({required this.id, required this.name, required this.space, this.iccAssetId});
  factory _ColourProfile.fromJson(Map<String, dynamic> json) => _$ColourProfileFromJson(json);

@override final  String id;
@override final  String name;
/// Colour space identifier (e.g. `srgb`, `cmyk_fogra39`).
@override final  String space;
/// Reference to an ICC profile in the asset store, when present.
@override final  String? iccAssetId;

/// Create a copy of ColourProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ColourProfileCopyWith<_ColourProfile> get copyWith => __$ColourProfileCopyWithImpl<_ColourProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ColourProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ColourProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.space, space) || other.space == space)&&(identical(other.iccAssetId, iccAssetId) || other.iccAssetId == iccAssetId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,space,iccAssetId);

@override
String toString() {
  return 'ColourProfile(id: $id, name: $name, space: $space, iccAssetId: $iccAssetId)';
}


}

/// @nodoc
abstract mixin class _$ColourProfileCopyWith<$Res> implements $ColourProfileCopyWith<$Res> {
  factory _$ColourProfileCopyWith(_ColourProfile value, $Res Function(_ColourProfile) _then) = __$ColourProfileCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String space, String? iccAssetId
});




}
/// @nodoc
class __$ColourProfileCopyWithImpl<$Res>
    implements _$ColourProfileCopyWith<$Res> {
  __$ColourProfileCopyWithImpl(this._self, this._then);

  final _ColourProfile _self;
  final $Res Function(_ColourProfile) _then;

/// Create a copy of ColourProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? space = null,Object? iccAssetId = freezed,}) {
  return _then(_ColourProfile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,space: null == space ? _self.space : space // ignore: cast_nullable_to_non_nullable
as String,iccAssetId: freezed == iccAssetId ? _self.iccAssetId : iccAssetId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PrintProfile {

 String get id; String get name; double? get widthMm; double? get heightMm; String? get colourProfileId; Map<String, Object?> get options;
/// Create a copy of PrintProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrintProfileCopyWith<PrintProfile> get copyWith => _$PrintProfileCopyWithImpl<PrintProfile>(this as PrintProfile, _$identity);

  /// Serializes this PrintProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrintProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.widthMm, widthMm) || other.widthMm == widthMm)&&(identical(other.heightMm, heightMm) || other.heightMm == heightMm)&&(identical(other.colourProfileId, colourProfileId) || other.colourProfileId == colourProfileId)&&const DeepCollectionEquality().equals(other.options, options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,widthMm,heightMm,colourProfileId,const DeepCollectionEquality().hash(options));

@override
String toString() {
  return 'PrintProfile(id: $id, name: $name, widthMm: $widthMm, heightMm: $heightMm, colourProfileId: $colourProfileId, options: $options)';
}


}

/// @nodoc
abstract mixin class $PrintProfileCopyWith<$Res>  {
  factory $PrintProfileCopyWith(PrintProfile value, $Res Function(PrintProfile) _then) = _$PrintProfileCopyWithImpl;
@useResult
$Res call({
 String id, String name, double? widthMm, double? heightMm, String? colourProfileId, Map<String, Object?> options
});




}
/// @nodoc
class _$PrintProfileCopyWithImpl<$Res>
    implements $PrintProfileCopyWith<$Res> {
  _$PrintProfileCopyWithImpl(this._self, this._then);

  final PrintProfile _self;
  final $Res Function(PrintProfile) _then;

/// Create a copy of PrintProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? widthMm = freezed,Object? heightMm = freezed,Object? colourProfileId = freezed,Object? options = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,widthMm: freezed == widthMm ? _self.widthMm : widthMm // ignore: cast_nullable_to_non_nullable
as double?,heightMm: freezed == heightMm ? _self.heightMm : heightMm // ignore: cast_nullable_to_non_nullable
as double?,colourProfileId: freezed == colourProfileId ? _self.colourProfileId : colourProfileId // ignore: cast_nullable_to_non_nullable
as String?,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

}


/// Adds pattern-matching-related methods to [PrintProfile].
extension PrintProfilePatterns on PrintProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PrintProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PrintProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PrintProfile value)  $default,){
final _that = this;
switch (_that) {
case _PrintProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PrintProfile value)?  $default,){
final _that = this;
switch (_that) {
case _PrintProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  double? widthMm,  double? heightMm,  String? colourProfileId,  Map<String, Object?> options)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrintProfile() when $default != null:
return $default(_that.id,_that.name,_that.widthMm,_that.heightMm,_that.colourProfileId,_that.options);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  double? widthMm,  double? heightMm,  String? colourProfileId,  Map<String, Object?> options)  $default,) {final _that = this;
switch (_that) {
case _PrintProfile():
return $default(_that.id,_that.name,_that.widthMm,_that.heightMm,_that.colourProfileId,_that.options);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  double? widthMm,  double? heightMm,  String? colourProfileId,  Map<String, Object?> options)?  $default,) {final _that = this;
switch (_that) {
case _PrintProfile() when $default != null:
return $default(_that.id,_that.name,_that.widthMm,_that.heightMm,_that.colourProfileId,_that.options);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PrintProfile implements PrintProfile {
  const _PrintProfile({required this.id, required this.name, this.widthMm, this.heightMm, this.colourProfileId, final  Map<String, Object?> options = const <String, Object?>{}}): _options = options;
  factory _PrintProfile.fromJson(Map<String, dynamic> json) => _$PrintProfileFromJson(json);

@override final  String id;
@override final  String name;
@override final  double? widthMm;
@override final  double? heightMm;
@override final  String? colourProfileId;
 final  Map<String, Object?> _options;
@override@JsonKey() Map<String, Object?> get options {
  if (_options is EqualUnmodifiableMapView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_options);
}


/// Create a copy of PrintProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrintProfileCopyWith<_PrintProfile> get copyWith => __$PrintProfileCopyWithImpl<_PrintProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PrintProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrintProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.widthMm, widthMm) || other.widthMm == widthMm)&&(identical(other.heightMm, heightMm) || other.heightMm == heightMm)&&(identical(other.colourProfileId, colourProfileId) || other.colourProfileId == colourProfileId)&&const DeepCollectionEquality().equals(other._options, _options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,widthMm,heightMm,colourProfileId,const DeepCollectionEquality().hash(_options));

@override
String toString() {
  return 'PrintProfile(id: $id, name: $name, widthMm: $widthMm, heightMm: $heightMm, colourProfileId: $colourProfileId, options: $options)';
}


}

/// @nodoc
abstract mixin class _$PrintProfileCopyWith<$Res> implements $PrintProfileCopyWith<$Res> {
  factory _$PrintProfileCopyWith(_PrintProfile value, $Res Function(_PrintProfile) _then) = __$PrintProfileCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, double? widthMm, double? heightMm, String? colourProfileId, Map<String, Object?> options
});




}
/// @nodoc
class __$PrintProfileCopyWithImpl<$Res>
    implements _$PrintProfileCopyWith<$Res> {
  __$PrintProfileCopyWithImpl(this._self, this._then);

  final _PrintProfile _self;
  final $Res Function(_PrintProfile) _then;

/// Create a copy of PrintProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? widthMm = freezed,Object? heightMm = freezed,Object? colourProfileId = freezed,Object? options = null,}) {
  return _then(_PrintProfile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,widthMm: freezed == widthMm ? _self.widthMm : widthMm // ignore: cast_nullable_to_non_nullable
as double?,heightMm: freezed == heightMm ? _self.heightMm : heightMm // ignore: cast_nullable_to_non_nullable
as double?,colourProfileId: freezed == colourProfileId ? _self.colourProfileId : colourProfileId // ignore: cast_nullable_to_non_nullable
as String?,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}

// dart format on
