// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'performance_contracts.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TileCoordinate {

 int get level; int get x; int get y;
/// Create a copy of TileCoordinate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TileCoordinateCopyWith<TileCoordinate> get copyWith => _$TileCoordinateCopyWithImpl<TileCoordinate>(this as TileCoordinate, _$identity);

  /// Serializes this TileCoordinate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TileCoordinate&&(identical(other.level, level) || other.level == level)&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,level,x,y);

@override
String toString() {
  return 'TileCoordinate(level: $level, x: $x, y: $y)';
}


}

/// @nodoc
abstract mixin class $TileCoordinateCopyWith<$Res>  {
  factory $TileCoordinateCopyWith(TileCoordinate value, $Res Function(TileCoordinate) _then) = _$TileCoordinateCopyWithImpl;
@useResult
$Res call({
 int level, int x, int y
});




}
/// @nodoc
class _$TileCoordinateCopyWithImpl<$Res>
    implements $TileCoordinateCopyWith<$Res> {
  _$TileCoordinateCopyWithImpl(this._self, this._then);

  final TileCoordinate _self;
  final $Res Function(TileCoordinate) _then;

/// Create a copy of TileCoordinate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? level = null,Object? x = null,Object? y = null,}) {
  return _then(_self.copyWith(
level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as int,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TileCoordinate].
extension TileCoordinatePatterns on TileCoordinate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TileCoordinate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TileCoordinate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TileCoordinate value)  $default,){
final _that = this;
switch (_that) {
case _TileCoordinate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TileCoordinate value)?  $default,){
final _that = this;
switch (_that) {
case _TileCoordinate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int level,  int x,  int y)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TileCoordinate() when $default != null:
return $default(_that.level,_that.x,_that.y);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int level,  int x,  int y)  $default,) {final _that = this;
switch (_that) {
case _TileCoordinate():
return $default(_that.level,_that.x,_that.y);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int level,  int x,  int y)?  $default,) {final _that = this;
switch (_that) {
case _TileCoordinate() when $default != null:
return $default(_that.level,_that.x,_that.y);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TileCoordinate implements TileCoordinate {
  const _TileCoordinate({required this.level, required this.x, required this.y});
  factory _TileCoordinate.fromJson(Map<String, dynamic> json) => _$TileCoordinateFromJson(json);

@override final  int level;
@override final  int x;
@override final  int y;

/// Create a copy of TileCoordinate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TileCoordinateCopyWith<_TileCoordinate> get copyWith => __$TileCoordinateCopyWithImpl<_TileCoordinate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TileCoordinateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TileCoordinate&&(identical(other.level, level) || other.level == level)&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,level,x,y);

@override
String toString() {
  return 'TileCoordinate(level: $level, x: $x, y: $y)';
}


}

/// @nodoc
abstract mixin class _$TileCoordinateCopyWith<$Res> implements $TileCoordinateCopyWith<$Res> {
  factory _$TileCoordinateCopyWith(_TileCoordinate value, $Res Function(_TileCoordinate) _then) = __$TileCoordinateCopyWithImpl;
@override @useResult
$Res call({
 int level, int x, int y
});




}
/// @nodoc
class __$TileCoordinateCopyWithImpl<$Res>
    implements _$TileCoordinateCopyWith<$Res> {
  __$TileCoordinateCopyWithImpl(this._self, this._then);

  final _TileCoordinate _self;
  final $Res Function(_TileCoordinate) _then;

/// Create a copy of TileCoordinate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? level = null,Object? x = null,Object? y = null,}) {
  return _then(_TileCoordinate(
level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as int,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$TileSpec {

/// Tile edge in physical pixels (power of two).
 int get tileSize;/// Overlap bleed between adjacent tiles (filtering artefact guard).
 int get overlap;/// Number of LOD levels in the pyramid.
 int get levels;
/// Create a copy of TileSpec
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TileSpecCopyWith<TileSpec> get copyWith => _$TileSpecCopyWithImpl<TileSpec>(this as TileSpec, _$identity);

  /// Serializes this TileSpec to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TileSpec&&(identical(other.tileSize, tileSize) || other.tileSize == tileSize)&&(identical(other.overlap, overlap) || other.overlap == overlap)&&(identical(other.levels, levels) || other.levels == levels));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tileSize,overlap,levels);

@override
String toString() {
  return 'TileSpec(tileSize: $tileSize, overlap: $overlap, levels: $levels)';
}


}

/// @nodoc
abstract mixin class $TileSpecCopyWith<$Res>  {
  factory $TileSpecCopyWith(TileSpec value, $Res Function(TileSpec) _then) = _$TileSpecCopyWithImpl;
@useResult
$Res call({
 int tileSize, int overlap, int levels
});




}
/// @nodoc
class _$TileSpecCopyWithImpl<$Res>
    implements $TileSpecCopyWith<$Res> {
  _$TileSpecCopyWithImpl(this._self, this._then);

  final TileSpec _self;
  final $Res Function(TileSpec) _then;

/// Create a copy of TileSpec
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tileSize = null,Object? overlap = null,Object? levels = null,}) {
  return _then(_self.copyWith(
tileSize: null == tileSize ? _self.tileSize : tileSize // ignore: cast_nullable_to_non_nullable
as int,overlap: null == overlap ? _self.overlap : overlap // ignore: cast_nullable_to_non_nullable
as int,levels: null == levels ? _self.levels : levels // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TileSpec].
extension TileSpecPatterns on TileSpec {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TileSpec value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TileSpec() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TileSpec value)  $default,){
final _that = this;
switch (_that) {
case _TileSpec():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TileSpec value)?  $default,){
final _that = this;
switch (_that) {
case _TileSpec() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int tileSize,  int overlap,  int levels)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TileSpec() when $default != null:
return $default(_that.tileSize,_that.overlap,_that.levels);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int tileSize,  int overlap,  int levels)  $default,) {final _that = this;
switch (_that) {
case _TileSpec():
return $default(_that.tileSize,_that.overlap,_that.levels);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int tileSize,  int overlap,  int levels)?  $default,) {final _that = this;
switch (_that) {
case _TileSpec() when $default != null:
return $default(_that.tileSize,_that.overlap,_that.levels);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TileSpec extends TileSpec {
  const _TileSpec({this.tileSize = 256, this.overlap = 2, this.levels = 6}): super._();
  factory _TileSpec.fromJson(Map<String, dynamic> json) => _$TileSpecFromJson(json);

/// Tile edge in physical pixels (power of two).
@override@JsonKey() final  int tileSize;
/// Overlap bleed between adjacent tiles (filtering artefact guard).
@override@JsonKey() final  int overlap;
/// Number of LOD levels in the pyramid.
@override@JsonKey() final  int levels;

/// Create a copy of TileSpec
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TileSpecCopyWith<_TileSpec> get copyWith => __$TileSpecCopyWithImpl<_TileSpec>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TileSpecToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TileSpec&&(identical(other.tileSize, tileSize) || other.tileSize == tileSize)&&(identical(other.overlap, overlap) || other.overlap == overlap)&&(identical(other.levels, levels) || other.levels == levels));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tileSize,overlap,levels);

@override
String toString() {
  return 'TileSpec(tileSize: $tileSize, overlap: $overlap, levels: $levels)';
}


}

/// @nodoc
abstract mixin class _$TileSpecCopyWith<$Res> implements $TileSpecCopyWith<$Res> {
  factory _$TileSpecCopyWith(_TileSpec value, $Res Function(_TileSpec) _then) = __$TileSpecCopyWithImpl;
@override @useResult
$Res call({
 int tileSize, int overlap, int levels
});




}
/// @nodoc
class __$TileSpecCopyWithImpl<$Res>
    implements _$TileSpecCopyWith<$Res> {
  __$TileSpecCopyWithImpl(this._self, this._then);

  final _TileSpec _self;
  final $Res Function(_TileSpec) _then;

/// Create a copy of TileSpec
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tileSize = null,Object? overlap = null,Object? levels = null,}) {
  return _then(_TileSpec(
tileSize: null == tileSize ? _self.tileSize : tileSize // ignore: cast_nullable_to_non_nullable
as int,overlap: null == overlap ? _self.overlap : overlap // ignore: cast_nullable_to_non_nullable
as int,levels: null == levels ? _self.levels : levels // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$QuadTreeConfig {

 Rect2D get bounds; int get maxDepth; int get maxItemsPerNode;
/// Create a copy of QuadTreeConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuadTreeConfigCopyWith<QuadTreeConfig> get copyWith => _$QuadTreeConfigCopyWithImpl<QuadTreeConfig>(this as QuadTreeConfig, _$identity);

  /// Serializes this QuadTreeConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuadTreeConfig&&(identical(other.bounds, bounds) || other.bounds == bounds)&&(identical(other.maxDepth, maxDepth) || other.maxDepth == maxDepth)&&(identical(other.maxItemsPerNode, maxItemsPerNode) || other.maxItemsPerNode == maxItemsPerNode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bounds,maxDepth,maxItemsPerNode);

@override
String toString() {
  return 'QuadTreeConfig(bounds: $bounds, maxDepth: $maxDepth, maxItemsPerNode: $maxItemsPerNode)';
}


}

/// @nodoc
abstract mixin class $QuadTreeConfigCopyWith<$Res>  {
  factory $QuadTreeConfigCopyWith(QuadTreeConfig value, $Res Function(QuadTreeConfig) _then) = _$QuadTreeConfigCopyWithImpl;
@useResult
$Res call({
 Rect2D bounds, int maxDepth, int maxItemsPerNode
});


$Rect2DCopyWith<$Res> get bounds;

}
/// @nodoc
class _$QuadTreeConfigCopyWithImpl<$Res>
    implements $QuadTreeConfigCopyWith<$Res> {
  _$QuadTreeConfigCopyWithImpl(this._self, this._then);

  final QuadTreeConfig _self;
  final $Res Function(QuadTreeConfig) _then;

/// Create a copy of QuadTreeConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bounds = null,Object? maxDepth = null,Object? maxItemsPerNode = null,}) {
  return _then(_self.copyWith(
bounds: null == bounds ? _self.bounds : bounds // ignore: cast_nullable_to_non_nullable
as Rect2D,maxDepth: null == maxDepth ? _self.maxDepth : maxDepth // ignore: cast_nullable_to_non_nullable
as int,maxItemsPerNode: null == maxItemsPerNode ? _self.maxItemsPerNode : maxItemsPerNode // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of QuadTreeConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Rect2DCopyWith<$Res> get bounds {
  
  return $Rect2DCopyWith<$Res>(_self.bounds, (value) {
    return _then(_self.copyWith(bounds: value));
  });
}
}


/// Adds pattern-matching-related methods to [QuadTreeConfig].
extension QuadTreeConfigPatterns on QuadTreeConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuadTreeConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuadTreeConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuadTreeConfig value)  $default,){
final _that = this;
switch (_that) {
case _QuadTreeConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuadTreeConfig value)?  $default,){
final _that = this;
switch (_that) {
case _QuadTreeConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Rect2D bounds,  int maxDepth,  int maxItemsPerNode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuadTreeConfig() when $default != null:
return $default(_that.bounds,_that.maxDepth,_that.maxItemsPerNode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Rect2D bounds,  int maxDepth,  int maxItemsPerNode)  $default,) {final _that = this;
switch (_that) {
case _QuadTreeConfig():
return $default(_that.bounds,_that.maxDepth,_that.maxItemsPerNode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Rect2D bounds,  int maxDepth,  int maxItemsPerNode)?  $default,) {final _that = this;
switch (_that) {
case _QuadTreeConfig() when $default != null:
return $default(_that.bounds,_that.maxDepth,_that.maxItemsPerNode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuadTreeConfig implements QuadTreeConfig {
  const _QuadTreeConfig({required this.bounds, this.maxDepth = 8, this.maxItemsPerNode = 16});
  factory _QuadTreeConfig.fromJson(Map<String, dynamic> json) => _$QuadTreeConfigFromJson(json);

@override final  Rect2D bounds;
@override@JsonKey() final  int maxDepth;
@override@JsonKey() final  int maxItemsPerNode;

/// Create a copy of QuadTreeConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuadTreeConfigCopyWith<_QuadTreeConfig> get copyWith => __$QuadTreeConfigCopyWithImpl<_QuadTreeConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuadTreeConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuadTreeConfig&&(identical(other.bounds, bounds) || other.bounds == bounds)&&(identical(other.maxDepth, maxDepth) || other.maxDepth == maxDepth)&&(identical(other.maxItemsPerNode, maxItemsPerNode) || other.maxItemsPerNode == maxItemsPerNode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bounds,maxDepth,maxItemsPerNode);

@override
String toString() {
  return 'QuadTreeConfig(bounds: $bounds, maxDepth: $maxDepth, maxItemsPerNode: $maxItemsPerNode)';
}


}

/// @nodoc
abstract mixin class _$QuadTreeConfigCopyWith<$Res> implements $QuadTreeConfigCopyWith<$Res> {
  factory _$QuadTreeConfigCopyWith(_QuadTreeConfig value, $Res Function(_QuadTreeConfig) _then) = __$QuadTreeConfigCopyWithImpl;
@override @useResult
$Res call({
 Rect2D bounds, int maxDepth, int maxItemsPerNode
});


@override $Rect2DCopyWith<$Res> get bounds;

}
/// @nodoc
class __$QuadTreeConfigCopyWithImpl<$Res>
    implements _$QuadTreeConfigCopyWith<$Res> {
  __$QuadTreeConfigCopyWithImpl(this._self, this._then);

  final _QuadTreeConfig _self;
  final $Res Function(_QuadTreeConfig) _then;

/// Create a copy of QuadTreeConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bounds = null,Object? maxDepth = null,Object? maxItemsPerNode = null,}) {
  return _then(_QuadTreeConfig(
bounds: null == bounds ? _self.bounds : bounds // ignore: cast_nullable_to_non_nullable
as Rect2D,maxDepth: null == maxDepth ? _self.maxDepth : maxDepth // ignore: cast_nullable_to_non_nullable
as int,maxItemsPerNode: null == maxItemsPerNode ? _self.maxItemsPerNode : maxItemsPerNode // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of QuadTreeConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Rect2DCopyWith<$Res> get bounds {
  
  return $Rect2DCopyWith<$Res>(_self.bounds, (value) {
    return _then(_self.copyWith(bounds: value));
  });
}
}


/// @nodoc
mixin _$CacheBudget {

 CacheTier get tier; int get maxBytes; int get maxEntries;
/// Create a copy of CacheBudget
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CacheBudgetCopyWith<CacheBudget> get copyWith => _$CacheBudgetCopyWithImpl<CacheBudget>(this as CacheBudget, _$identity);

  /// Serializes this CacheBudget to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CacheBudget&&(identical(other.tier, tier) || other.tier == tier)&&(identical(other.maxBytes, maxBytes) || other.maxBytes == maxBytes)&&(identical(other.maxEntries, maxEntries) || other.maxEntries == maxEntries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tier,maxBytes,maxEntries);

@override
String toString() {
  return 'CacheBudget(tier: $tier, maxBytes: $maxBytes, maxEntries: $maxEntries)';
}


}

/// @nodoc
abstract mixin class $CacheBudgetCopyWith<$Res>  {
  factory $CacheBudgetCopyWith(CacheBudget value, $Res Function(CacheBudget) _then) = _$CacheBudgetCopyWithImpl;
@useResult
$Res call({
 CacheTier tier, int maxBytes, int maxEntries
});




}
/// @nodoc
class _$CacheBudgetCopyWithImpl<$Res>
    implements $CacheBudgetCopyWith<$Res> {
  _$CacheBudgetCopyWithImpl(this._self, this._then);

  final CacheBudget _self;
  final $Res Function(CacheBudget) _then;

/// Create a copy of CacheBudget
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tier = null,Object? maxBytes = null,Object? maxEntries = null,}) {
  return _then(_self.copyWith(
tier: null == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as CacheTier,maxBytes: null == maxBytes ? _self.maxBytes : maxBytes // ignore: cast_nullable_to_non_nullable
as int,maxEntries: null == maxEntries ? _self.maxEntries : maxEntries // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CacheBudget].
extension CacheBudgetPatterns on CacheBudget {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CacheBudget value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CacheBudget() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CacheBudget value)  $default,){
final _that = this;
switch (_that) {
case _CacheBudget():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CacheBudget value)?  $default,){
final _that = this;
switch (_that) {
case _CacheBudget() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CacheTier tier,  int maxBytes,  int maxEntries)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CacheBudget() when $default != null:
return $default(_that.tier,_that.maxBytes,_that.maxEntries);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CacheTier tier,  int maxBytes,  int maxEntries)  $default,) {final _that = this;
switch (_that) {
case _CacheBudget():
return $default(_that.tier,_that.maxBytes,_that.maxEntries);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CacheTier tier,  int maxBytes,  int maxEntries)?  $default,) {final _that = this;
switch (_that) {
case _CacheBudget() when $default != null:
return $default(_that.tier,_that.maxBytes,_that.maxEntries);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CacheBudget implements CacheBudget {
  const _CacheBudget({required this.tier, required this.maxBytes, this.maxEntries = 0});
  factory _CacheBudget.fromJson(Map<String, dynamic> json) => _$CacheBudgetFromJson(json);

@override final  CacheTier tier;
@override final  int maxBytes;
@override@JsonKey() final  int maxEntries;

/// Create a copy of CacheBudget
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CacheBudgetCopyWith<_CacheBudget> get copyWith => __$CacheBudgetCopyWithImpl<_CacheBudget>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CacheBudgetToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CacheBudget&&(identical(other.tier, tier) || other.tier == tier)&&(identical(other.maxBytes, maxBytes) || other.maxBytes == maxBytes)&&(identical(other.maxEntries, maxEntries) || other.maxEntries == maxEntries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tier,maxBytes,maxEntries);

@override
String toString() {
  return 'CacheBudget(tier: $tier, maxBytes: $maxBytes, maxEntries: $maxEntries)';
}


}

/// @nodoc
abstract mixin class _$CacheBudgetCopyWith<$Res> implements $CacheBudgetCopyWith<$Res> {
  factory _$CacheBudgetCopyWith(_CacheBudget value, $Res Function(_CacheBudget) _then) = __$CacheBudgetCopyWithImpl;
@override @useResult
$Res call({
 CacheTier tier, int maxBytes, int maxEntries
});




}
/// @nodoc
class __$CacheBudgetCopyWithImpl<$Res>
    implements _$CacheBudgetCopyWith<$Res> {
  __$CacheBudgetCopyWithImpl(this._self, this._then);

  final _CacheBudget _self;
  final $Res Function(_CacheBudget) _then;

/// Create a copy of CacheBudget
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tier = null,Object? maxBytes = null,Object? maxEntries = null,}) {
  return _then(_CacheBudget(
tier: null == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as CacheTier,maxBytes: null == maxBytes ? _self.maxBytes : maxBytes // ignore: cast_nullable_to_non_nullable
as int,maxEntries: null == maxEntries ? _self.maxEntries : maxEntries // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$HistoryCompressionPolicy {

/// A full snapshot is stored every N entries; deltas in between.
 int get snapshotInterval;/// Delta-encode entries between snapshots.
 bool get deltaEncoding;/// Full snapshots retained before archival compaction.
 int get maxRetainedSnapshots;
/// Create a copy of HistoryCompressionPolicy
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryCompressionPolicyCopyWith<HistoryCompressionPolicy> get copyWith => _$HistoryCompressionPolicyCopyWithImpl<HistoryCompressionPolicy>(this as HistoryCompressionPolicy, _$identity);

  /// Serializes this HistoryCompressionPolicy to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryCompressionPolicy&&(identical(other.snapshotInterval, snapshotInterval) || other.snapshotInterval == snapshotInterval)&&(identical(other.deltaEncoding, deltaEncoding) || other.deltaEncoding == deltaEncoding)&&(identical(other.maxRetainedSnapshots, maxRetainedSnapshots) || other.maxRetainedSnapshots == maxRetainedSnapshots));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,snapshotInterval,deltaEncoding,maxRetainedSnapshots);

@override
String toString() {
  return 'HistoryCompressionPolicy(snapshotInterval: $snapshotInterval, deltaEncoding: $deltaEncoding, maxRetainedSnapshots: $maxRetainedSnapshots)';
}


}

/// @nodoc
abstract mixin class $HistoryCompressionPolicyCopyWith<$Res>  {
  factory $HistoryCompressionPolicyCopyWith(HistoryCompressionPolicy value, $Res Function(HistoryCompressionPolicy) _then) = _$HistoryCompressionPolicyCopyWithImpl;
@useResult
$Res call({
 int snapshotInterval, bool deltaEncoding, int maxRetainedSnapshots
});




}
/// @nodoc
class _$HistoryCompressionPolicyCopyWithImpl<$Res>
    implements $HistoryCompressionPolicyCopyWith<$Res> {
  _$HistoryCompressionPolicyCopyWithImpl(this._self, this._then);

  final HistoryCompressionPolicy _self;
  final $Res Function(HistoryCompressionPolicy) _then;

/// Create a copy of HistoryCompressionPolicy
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? snapshotInterval = null,Object? deltaEncoding = null,Object? maxRetainedSnapshots = null,}) {
  return _then(_self.copyWith(
snapshotInterval: null == snapshotInterval ? _self.snapshotInterval : snapshotInterval // ignore: cast_nullable_to_non_nullable
as int,deltaEncoding: null == deltaEncoding ? _self.deltaEncoding : deltaEncoding // ignore: cast_nullable_to_non_nullable
as bool,maxRetainedSnapshots: null == maxRetainedSnapshots ? _self.maxRetainedSnapshots : maxRetainedSnapshots // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [HistoryCompressionPolicy].
extension HistoryCompressionPolicyPatterns on HistoryCompressionPolicy {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryCompressionPolicy value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryCompressionPolicy() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryCompressionPolicy value)  $default,){
final _that = this;
switch (_that) {
case _HistoryCompressionPolicy():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryCompressionPolicy value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryCompressionPolicy() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int snapshotInterval,  bool deltaEncoding,  int maxRetainedSnapshots)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryCompressionPolicy() when $default != null:
return $default(_that.snapshotInterval,_that.deltaEncoding,_that.maxRetainedSnapshots);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int snapshotInterval,  bool deltaEncoding,  int maxRetainedSnapshots)  $default,) {final _that = this;
switch (_that) {
case _HistoryCompressionPolicy():
return $default(_that.snapshotInterval,_that.deltaEncoding,_that.maxRetainedSnapshots);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int snapshotInterval,  bool deltaEncoding,  int maxRetainedSnapshots)?  $default,) {final _that = this;
switch (_that) {
case _HistoryCompressionPolicy() when $default != null:
return $default(_that.snapshotInterval,_that.deltaEncoding,_that.maxRetainedSnapshots);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HistoryCompressionPolicy extends HistoryCompressionPolicy {
  const _HistoryCompressionPolicy({this.snapshotInterval = 32, this.deltaEncoding = true, this.maxRetainedSnapshots = 16}): super._();
  factory _HistoryCompressionPolicy.fromJson(Map<String, dynamic> json) => _$HistoryCompressionPolicyFromJson(json);

/// A full snapshot is stored every N entries; deltas in between.
@override@JsonKey() final  int snapshotInterval;
/// Delta-encode entries between snapshots.
@override@JsonKey() final  bool deltaEncoding;
/// Full snapshots retained before archival compaction.
@override@JsonKey() final  int maxRetainedSnapshots;

/// Create a copy of HistoryCompressionPolicy
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryCompressionPolicyCopyWith<_HistoryCompressionPolicy> get copyWith => __$HistoryCompressionPolicyCopyWithImpl<_HistoryCompressionPolicy>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HistoryCompressionPolicyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryCompressionPolicy&&(identical(other.snapshotInterval, snapshotInterval) || other.snapshotInterval == snapshotInterval)&&(identical(other.deltaEncoding, deltaEncoding) || other.deltaEncoding == deltaEncoding)&&(identical(other.maxRetainedSnapshots, maxRetainedSnapshots) || other.maxRetainedSnapshots == maxRetainedSnapshots));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,snapshotInterval,deltaEncoding,maxRetainedSnapshots);

@override
String toString() {
  return 'HistoryCompressionPolicy(snapshotInterval: $snapshotInterval, deltaEncoding: $deltaEncoding, maxRetainedSnapshots: $maxRetainedSnapshots)';
}


}

/// @nodoc
abstract mixin class _$HistoryCompressionPolicyCopyWith<$Res> implements $HistoryCompressionPolicyCopyWith<$Res> {
  factory _$HistoryCompressionPolicyCopyWith(_HistoryCompressionPolicy value, $Res Function(_HistoryCompressionPolicy) _then) = __$HistoryCompressionPolicyCopyWithImpl;
@override @useResult
$Res call({
 int snapshotInterval, bool deltaEncoding, int maxRetainedSnapshots
});




}
/// @nodoc
class __$HistoryCompressionPolicyCopyWithImpl<$Res>
    implements _$HistoryCompressionPolicyCopyWith<$Res> {
  __$HistoryCompressionPolicyCopyWithImpl(this._self, this._then);

  final _HistoryCompressionPolicy _self;
  final $Res Function(_HistoryCompressionPolicy) _then;

/// Create a copy of HistoryCompressionPolicy
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? snapshotInterval = null,Object? deltaEncoding = null,Object? maxRetainedSnapshots = null,}) {
  return _then(_HistoryCompressionPolicy(
snapshotInterval: null == snapshotInterval ? _self.snapshotInterval : snapshotInterval // ignore: cast_nullable_to_non_nullable
as int,deltaEncoding: null == deltaEncoding ? _self.deltaEncoding : deltaEncoding // ignore: cast_nullable_to_non_nullable
as bool,maxRetainedSnapshots: null == maxRetainedSnapshots ? _self.maxRetainedSnapshots : maxRetainedSnapshots // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$LargeDocumentPolicy {

/// Virtualize panels/lists above this node count.
 int get virtualizeAboveNodes;/// Tile rasters above this edge length (physical pixels).
 int get tileAboveDimension;/// Stream (never fully load) documents above this byte size.
 int get streamAboveBytes;
/// Create a copy of LargeDocumentPolicy
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LargeDocumentPolicyCopyWith<LargeDocumentPolicy> get copyWith => _$LargeDocumentPolicyCopyWithImpl<LargeDocumentPolicy>(this as LargeDocumentPolicy, _$identity);

  /// Serializes this LargeDocumentPolicy to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LargeDocumentPolicy&&(identical(other.virtualizeAboveNodes, virtualizeAboveNodes) || other.virtualizeAboveNodes == virtualizeAboveNodes)&&(identical(other.tileAboveDimension, tileAboveDimension) || other.tileAboveDimension == tileAboveDimension)&&(identical(other.streamAboveBytes, streamAboveBytes) || other.streamAboveBytes == streamAboveBytes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,virtualizeAboveNodes,tileAboveDimension,streamAboveBytes);

@override
String toString() {
  return 'LargeDocumentPolicy(virtualizeAboveNodes: $virtualizeAboveNodes, tileAboveDimension: $tileAboveDimension, streamAboveBytes: $streamAboveBytes)';
}


}

/// @nodoc
abstract mixin class $LargeDocumentPolicyCopyWith<$Res>  {
  factory $LargeDocumentPolicyCopyWith(LargeDocumentPolicy value, $Res Function(LargeDocumentPolicy) _then) = _$LargeDocumentPolicyCopyWithImpl;
@useResult
$Res call({
 int virtualizeAboveNodes, int tileAboveDimension, int streamAboveBytes
});




}
/// @nodoc
class _$LargeDocumentPolicyCopyWithImpl<$Res>
    implements $LargeDocumentPolicyCopyWith<$Res> {
  _$LargeDocumentPolicyCopyWithImpl(this._self, this._then);

  final LargeDocumentPolicy _self;
  final $Res Function(LargeDocumentPolicy) _then;

/// Create a copy of LargeDocumentPolicy
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? virtualizeAboveNodes = null,Object? tileAboveDimension = null,Object? streamAboveBytes = null,}) {
  return _then(_self.copyWith(
virtualizeAboveNodes: null == virtualizeAboveNodes ? _self.virtualizeAboveNodes : virtualizeAboveNodes // ignore: cast_nullable_to_non_nullable
as int,tileAboveDimension: null == tileAboveDimension ? _self.tileAboveDimension : tileAboveDimension // ignore: cast_nullable_to_non_nullable
as int,streamAboveBytes: null == streamAboveBytes ? _self.streamAboveBytes : streamAboveBytes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [LargeDocumentPolicy].
extension LargeDocumentPolicyPatterns on LargeDocumentPolicy {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LargeDocumentPolicy value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LargeDocumentPolicy() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LargeDocumentPolicy value)  $default,){
final _that = this;
switch (_that) {
case _LargeDocumentPolicy():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LargeDocumentPolicy value)?  $default,){
final _that = this;
switch (_that) {
case _LargeDocumentPolicy() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int virtualizeAboveNodes,  int tileAboveDimension,  int streamAboveBytes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LargeDocumentPolicy() when $default != null:
return $default(_that.virtualizeAboveNodes,_that.tileAboveDimension,_that.streamAboveBytes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int virtualizeAboveNodes,  int tileAboveDimension,  int streamAboveBytes)  $default,) {final _that = this;
switch (_that) {
case _LargeDocumentPolicy():
return $default(_that.virtualizeAboveNodes,_that.tileAboveDimension,_that.streamAboveBytes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int virtualizeAboveNodes,  int tileAboveDimension,  int streamAboveBytes)?  $default,) {final _that = this;
switch (_that) {
case _LargeDocumentPolicy() when $default != null:
return $default(_that.virtualizeAboveNodes,_that.tileAboveDimension,_that.streamAboveBytes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LargeDocumentPolicy extends LargeDocumentPolicy {
  const _LargeDocumentPolicy({this.virtualizeAboveNodes = 500, this.tileAboveDimension = 4096, this.streamAboveBytes = 268435456}): super._();
  factory _LargeDocumentPolicy.fromJson(Map<String, dynamic> json) => _$LargeDocumentPolicyFromJson(json);

/// Virtualize panels/lists above this node count.
@override@JsonKey() final  int virtualizeAboveNodes;
/// Tile rasters above this edge length (physical pixels).
@override@JsonKey() final  int tileAboveDimension;
/// Stream (never fully load) documents above this byte size.
@override@JsonKey() final  int streamAboveBytes;

/// Create a copy of LargeDocumentPolicy
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LargeDocumentPolicyCopyWith<_LargeDocumentPolicy> get copyWith => __$LargeDocumentPolicyCopyWithImpl<_LargeDocumentPolicy>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LargeDocumentPolicyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LargeDocumentPolicy&&(identical(other.virtualizeAboveNodes, virtualizeAboveNodes) || other.virtualizeAboveNodes == virtualizeAboveNodes)&&(identical(other.tileAboveDimension, tileAboveDimension) || other.tileAboveDimension == tileAboveDimension)&&(identical(other.streamAboveBytes, streamAboveBytes) || other.streamAboveBytes == streamAboveBytes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,virtualizeAboveNodes,tileAboveDimension,streamAboveBytes);

@override
String toString() {
  return 'LargeDocumentPolicy(virtualizeAboveNodes: $virtualizeAboveNodes, tileAboveDimension: $tileAboveDimension, streamAboveBytes: $streamAboveBytes)';
}


}

/// @nodoc
abstract mixin class _$LargeDocumentPolicyCopyWith<$Res> implements $LargeDocumentPolicyCopyWith<$Res> {
  factory _$LargeDocumentPolicyCopyWith(_LargeDocumentPolicy value, $Res Function(_LargeDocumentPolicy) _then) = __$LargeDocumentPolicyCopyWithImpl;
@override @useResult
$Res call({
 int virtualizeAboveNodes, int tileAboveDimension, int streamAboveBytes
});




}
/// @nodoc
class __$LargeDocumentPolicyCopyWithImpl<$Res>
    implements _$LargeDocumentPolicyCopyWith<$Res> {
  __$LargeDocumentPolicyCopyWithImpl(this._self, this._then);

  final _LargeDocumentPolicy _self;
  final $Res Function(_LargeDocumentPolicy) _then;

/// Create a copy of LargeDocumentPolicy
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? virtualizeAboveNodes = null,Object? tileAboveDimension = null,Object? streamAboveBytes = null,}) {
  return _then(_LargeDocumentPolicy(
virtualizeAboveNodes: null == virtualizeAboveNodes ? _self.virtualizeAboveNodes : virtualizeAboveNodes // ignore: cast_nullable_to_non_nullable
as int,tileAboveDimension: null == tileAboveDimension ? _self.tileAboveDimension : tileAboveDimension // ignore: cast_nullable_to_non_nullable
as int,streamAboveBytes: null == streamAboveBytes ? _self.streamAboveBytes : streamAboveBytes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
