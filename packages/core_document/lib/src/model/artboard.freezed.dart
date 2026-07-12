// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'artboard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Artboard {

/// Stable UUID.
 String get id; String get name;/// Canvas size in canvas units.
 Size2D get size;@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) MeasurementUnit get unit; double get dpi;/// Background colour (#RRGGBB); null = transparent.
 String? get backgroundColourHex;/// Compositing structure (frozen Layer Engine, ADR-0006).
 LayerModel get layerRoot;/// Semantic textile structure (frozen Design Tree vocabulary,
/// ADR-0002). The Design Tree *Engine* arrives in M3; the document
/// owns the root now.
 DesignNode get designTreeRoot;/// Last camera for this artboard, if any.
 ViewportState? get viewport;
/// Create a copy of Artboard
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArtboardCopyWith<Artboard> get copyWith => _$ArtboardCopyWithImpl<Artboard>(this as Artboard, _$identity);

  /// Serializes this Artboard to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Artboard&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.size, size) || other.size == size)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.dpi, dpi) || other.dpi == dpi)&&(identical(other.backgroundColourHex, backgroundColourHex) || other.backgroundColourHex == backgroundColourHex)&&(identical(other.layerRoot, layerRoot) || other.layerRoot == layerRoot)&&(identical(other.designTreeRoot, designTreeRoot) || other.designTreeRoot == designTreeRoot)&&(identical(other.viewport, viewport) || other.viewport == viewport));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,size,unit,dpi,backgroundColourHex,layerRoot,designTreeRoot,viewport);

@override
String toString() {
  return 'Artboard(id: $id, name: $name, size: $size, unit: $unit, dpi: $dpi, backgroundColourHex: $backgroundColourHex, layerRoot: $layerRoot, designTreeRoot: $designTreeRoot, viewport: $viewport)';
}


}

/// @nodoc
abstract mixin class $ArtboardCopyWith<$Res>  {
  factory $ArtboardCopyWith(Artboard value, $Res Function(Artboard) _then) = _$ArtboardCopyWithImpl;
@useResult
$Res call({
 String id, String name, Size2D size,@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) MeasurementUnit unit, double dpi, String? backgroundColourHex, LayerModel layerRoot, DesignNode designTreeRoot, ViewportState? viewport
});


$Size2DCopyWith<$Res> get size;$LayerModelCopyWith<$Res> get layerRoot;$DesignNodeCopyWith<$Res> get designTreeRoot;$ViewportStateCopyWith<$Res>? get viewport;

}
/// @nodoc
class _$ArtboardCopyWithImpl<$Res>
    implements $ArtboardCopyWith<$Res> {
  _$ArtboardCopyWithImpl(this._self, this._then);

  final Artboard _self;
  final $Res Function(Artboard) _then;

/// Create a copy of Artboard
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? size = null,Object? unit = null,Object? dpi = null,Object? backgroundColourHex = freezed,Object? layerRoot = null,Object? designTreeRoot = null,Object? viewport = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as Size2D,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as MeasurementUnit,dpi: null == dpi ? _self.dpi : dpi // ignore: cast_nullable_to_non_nullable
as double,backgroundColourHex: freezed == backgroundColourHex ? _self.backgroundColourHex : backgroundColourHex // ignore: cast_nullable_to_non_nullable
as String?,layerRoot: null == layerRoot ? _self.layerRoot : layerRoot // ignore: cast_nullable_to_non_nullable
as LayerModel,designTreeRoot: null == designTreeRoot ? _self.designTreeRoot : designTreeRoot // ignore: cast_nullable_to_non_nullable
as DesignNode,viewport: freezed == viewport ? _self.viewport : viewport // ignore: cast_nullable_to_non_nullable
as ViewportState?,
  ));
}
/// Create a copy of Artboard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Size2DCopyWith<$Res> get size {
  
  return $Size2DCopyWith<$Res>(_self.size, (value) {
    return _then(_self.copyWith(size: value));
  });
}/// Create a copy of Artboard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LayerModelCopyWith<$Res> get layerRoot {
  
  return $LayerModelCopyWith<$Res>(_self.layerRoot, (value) {
    return _then(_self.copyWith(layerRoot: value));
  });
}/// Create a copy of Artboard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DesignNodeCopyWith<$Res> get designTreeRoot {
  
  return $DesignNodeCopyWith<$Res>(_self.designTreeRoot, (value) {
    return _then(_self.copyWith(designTreeRoot: value));
  });
}/// Create a copy of Artboard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ViewportStateCopyWith<$Res>? get viewport {
    if (_self.viewport == null) {
    return null;
  }

  return $ViewportStateCopyWith<$Res>(_self.viewport!, (value) {
    return _then(_self.copyWith(viewport: value));
  });
}
}


/// Adds pattern-matching-related methods to [Artboard].
extension ArtboardPatterns on Artboard {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Artboard value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Artboard() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Artboard value)  $default,){
final _that = this;
switch (_that) {
case _Artboard():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Artboard value)?  $default,){
final _that = this;
switch (_that) {
case _Artboard() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  Size2D size, @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson)  MeasurementUnit unit,  double dpi,  String? backgroundColourHex,  LayerModel layerRoot,  DesignNode designTreeRoot,  ViewportState? viewport)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Artboard() when $default != null:
return $default(_that.id,_that.name,_that.size,_that.unit,_that.dpi,_that.backgroundColourHex,_that.layerRoot,_that.designTreeRoot,_that.viewport);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  Size2D size, @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson)  MeasurementUnit unit,  double dpi,  String? backgroundColourHex,  LayerModel layerRoot,  DesignNode designTreeRoot,  ViewportState? viewport)  $default,) {final _that = this;
switch (_that) {
case _Artboard():
return $default(_that.id,_that.name,_that.size,_that.unit,_that.dpi,_that.backgroundColourHex,_that.layerRoot,_that.designTreeRoot,_that.viewport);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  Size2D size, @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson)  MeasurementUnit unit,  double dpi,  String? backgroundColourHex,  LayerModel layerRoot,  DesignNode designTreeRoot,  ViewportState? viewport)?  $default,) {final _that = this;
switch (_that) {
case _Artboard() when $default != null:
return $default(_that.id,_that.name,_that.size,_that.unit,_that.dpi,_that.backgroundColourHex,_that.layerRoot,_that.designTreeRoot,_that.viewport);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Artboard implements Artboard {
  const _Artboard({required this.id, required this.name, required this.size, @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) this.unit = MeasurementUnit.millimetre, this.dpi = 300.0, this.backgroundColourHex, required this.layerRoot, required this.designTreeRoot, this.viewport});
  factory _Artboard.fromJson(Map<String, dynamic> json) => _$ArtboardFromJson(json);

/// Stable UUID.
@override final  String id;
@override final  String name;
/// Canvas size in canvas units.
@override final  Size2D size;
@override@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) final  MeasurementUnit unit;
@override@JsonKey() final  double dpi;
/// Background colour (#RRGGBB); null = transparent.
@override final  String? backgroundColourHex;
/// Compositing structure (frozen Layer Engine, ADR-0006).
@override final  LayerModel layerRoot;
/// Semantic textile structure (frozen Design Tree vocabulary,
/// ADR-0002). The Design Tree *Engine* arrives in M3; the document
/// owns the root now.
@override final  DesignNode designTreeRoot;
/// Last camera for this artboard, if any.
@override final  ViewportState? viewport;

/// Create a copy of Artboard
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ArtboardCopyWith<_Artboard> get copyWith => __$ArtboardCopyWithImpl<_Artboard>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ArtboardToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Artboard&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.size, size) || other.size == size)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.dpi, dpi) || other.dpi == dpi)&&(identical(other.backgroundColourHex, backgroundColourHex) || other.backgroundColourHex == backgroundColourHex)&&(identical(other.layerRoot, layerRoot) || other.layerRoot == layerRoot)&&(identical(other.designTreeRoot, designTreeRoot) || other.designTreeRoot == designTreeRoot)&&(identical(other.viewport, viewport) || other.viewport == viewport));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,size,unit,dpi,backgroundColourHex,layerRoot,designTreeRoot,viewport);

@override
String toString() {
  return 'Artboard(id: $id, name: $name, size: $size, unit: $unit, dpi: $dpi, backgroundColourHex: $backgroundColourHex, layerRoot: $layerRoot, designTreeRoot: $designTreeRoot, viewport: $viewport)';
}


}

/// @nodoc
abstract mixin class _$ArtboardCopyWith<$Res> implements $ArtboardCopyWith<$Res> {
  factory _$ArtboardCopyWith(_Artboard value, $Res Function(_Artboard) _then) = __$ArtboardCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, Size2D size,@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) MeasurementUnit unit, double dpi, String? backgroundColourHex, LayerModel layerRoot, DesignNode designTreeRoot, ViewportState? viewport
});


@override $Size2DCopyWith<$Res> get size;@override $LayerModelCopyWith<$Res> get layerRoot;@override $DesignNodeCopyWith<$Res> get designTreeRoot;@override $ViewportStateCopyWith<$Res>? get viewport;

}
/// @nodoc
class __$ArtboardCopyWithImpl<$Res>
    implements _$ArtboardCopyWith<$Res> {
  __$ArtboardCopyWithImpl(this._self, this._then);

  final _Artboard _self;
  final $Res Function(_Artboard) _then;

/// Create a copy of Artboard
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? size = null,Object? unit = null,Object? dpi = null,Object? backgroundColourHex = freezed,Object? layerRoot = null,Object? designTreeRoot = null,Object? viewport = freezed,}) {
  return _then(_Artboard(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as Size2D,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as MeasurementUnit,dpi: null == dpi ? _self.dpi : dpi // ignore: cast_nullable_to_non_nullable
as double,backgroundColourHex: freezed == backgroundColourHex ? _self.backgroundColourHex : backgroundColourHex // ignore: cast_nullable_to_non_nullable
as String?,layerRoot: null == layerRoot ? _self.layerRoot : layerRoot // ignore: cast_nullable_to_non_nullable
as LayerModel,designTreeRoot: null == designTreeRoot ? _self.designTreeRoot : designTreeRoot // ignore: cast_nullable_to_non_nullable
as DesignNode,viewport: freezed == viewport ? _self.viewport : viewport // ignore: cast_nullable_to_non_nullable
as ViewportState?,
  ));
}

/// Create a copy of Artboard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Size2DCopyWith<$Res> get size {
  
  return $Size2DCopyWith<$Res>(_self.size, (value) {
    return _then(_self.copyWith(size: value));
  });
}/// Create a copy of Artboard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LayerModelCopyWith<$Res> get layerRoot {
  
  return $LayerModelCopyWith<$Res>(_self.layerRoot, (value) {
    return _then(_self.copyWith(layerRoot: value));
  });
}/// Create a copy of Artboard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DesignNodeCopyWith<$Res> get designTreeRoot {
  
  return $DesignNodeCopyWith<$Res>(_self.designTreeRoot, (value) {
    return _then(_self.copyWith(designTreeRoot: value));
  });
}/// Create a copy of Artboard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ViewportStateCopyWith<$Res>? get viewport {
    if (_self.viewport == null) {
    return null;
  }

  return $ViewportStateCopyWith<$Res>(_self.viewport!, (value) {
    return _then(_self.copyWith(viewport: value));
  });
}
}

// dart format on
