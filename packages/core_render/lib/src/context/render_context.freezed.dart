// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'render_context.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RenderContext {

/// The camera transform for this frame (frozen `core_interaction`). The
/// single shared viewport (R4) — the renderer never creates its own.
 ViewportState get viewport;/// Physical-unit system + DPI (frozen `core_tooling`).
 CanvasCoordinateSystem get coordinateSystem;/// Tiling parameters for this frame (frozen `core_performance`).
 TileSpec get tiles;/// Cache budget for this frame's tier (frozen `core_performance`).
 CacheBudget? get cacheBudget;/// Level-of-detail level chosen from zoom (0 = full resolution).
 int get lodLevel;/// Output colour space (frozen `core_asset`).
@JsonKey(fromJson: _colourFromJson, toJson: _colourToJson) AssetColourSpace get colourSpace;/// Deterministic frame identity (injected, never wall-clock).
 int get frameId;
/// Create a copy of RenderContext
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RenderContextCopyWith<RenderContext> get copyWith => _$RenderContextCopyWithImpl<RenderContext>(this as RenderContext, _$identity);

  /// Serializes this RenderContext to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RenderContext&&(identical(other.viewport, viewport) || other.viewport == viewport)&&(identical(other.coordinateSystem, coordinateSystem) || other.coordinateSystem == coordinateSystem)&&(identical(other.tiles, tiles) || other.tiles == tiles)&&(identical(other.cacheBudget, cacheBudget) || other.cacheBudget == cacheBudget)&&(identical(other.lodLevel, lodLevel) || other.lodLevel == lodLevel)&&(identical(other.colourSpace, colourSpace) || other.colourSpace == colourSpace)&&(identical(other.frameId, frameId) || other.frameId == frameId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,viewport,coordinateSystem,tiles,cacheBudget,lodLevel,colourSpace,frameId);

@override
String toString() {
  return 'RenderContext(viewport: $viewport, coordinateSystem: $coordinateSystem, tiles: $tiles, cacheBudget: $cacheBudget, lodLevel: $lodLevel, colourSpace: $colourSpace, frameId: $frameId)';
}


}

/// @nodoc
abstract mixin class $RenderContextCopyWith<$Res>  {
  factory $RenderContextCopyWith(RenderContext value, $Res Function(RenderContext) _then) = _$RenderContextCopyWithImpl;
@useResult
$Res call({
 ViewportState viewport, CanvasCoordinateSystem coordinateSystem, TileSpec tiles, CacheBudget? cacheBudget, int lodLevel,@JsonKey(fromJson: _colourFromJson, toJson: _colourToJson) AssetColourSpace colourSpace, int frameId
});


$ViewportStateCopyWith<$Res> get viewport;$CanvasCoordinateSystemCopyWith<$Res> get coordinateSystem;$TileSpecCopyWith<$Res> get tiles;$CacheBudgetCopyWith<$Res>? get cacheBudget;

}
/// @nodoc
class _$RenderContextCopyWithImpl<$Res>
    implements $RenderContextCopyWith<$Res> {
  _$RenderContextCopyWithImpl(this._self, this._then);

  final RenderContext _self;
  final $Res Function(RenderContext) _then;

/// Create a copy of RenderContext
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? viewport = null,Object? coordinateSystem = null,Object? tiles = null,Object? cacheBudget = freezed,Object? lodLevel = null,Object? colourSpace = null,Object? frameId = null,}) {
  return _then(_self.copyWith(
viewport: null == viewport ? _self.viewport : viewport // ignore: cast_nullable_to_non_nullable
as ViewportState,coordinateSystem: null == coordinateSystem ? _self.coordinateSystem : coordinateSystem // ignore: cast_nullable_to_non_nullable
as CanvasCoordinateSystem,tiles: null == tiles ? _self.tiles : tiles // ignore: cast_nullable_to_non_nullable
as TileSpec,cacheBudget: freezed == cacheBudget ? _self.cacheBudget : cacheBudget // ignore: cast_nullable_to_non_nullable
as CacheBudget?,lodLevel: null == lodLevel ? _self.lodLevel : lodLevel // ignore: cast_nullable_to_non_nullable
as int,colourSpace: null == colourSpace ? _self.colourSpace : colourSpace // ignore: cast_nullable_to_non_nullable
as AssetColourSpace,frameId: null == frameId ? _self.frameId : frameId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of RenderContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ViewportStateCopyWith<$Res> get viewport {
  
  return $ViewportStateCopyWith<$Res>(_self.viewport, (value) {
    return _then(_self.copyWith(viewport: value));
  });
}/// Create a copy of RenderContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CanvasCoordinateSystemCopyWith<$Res> get coordinateSystem {
  
  return $CanvasCoordinateSystemCopyWith<$Res>(_self.coordinateSystem, (value) {
    return _then(_self.copyWith(coordinateSystem: value));
  });
}/// Create a copy of RenderContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TileSpecCopyWith<$Res> get tiles {
  
  return $TileSpecCopyWith<$Res>(_self.tiles, (value) {
    return _then(_self.copyWith(tiles: value));
  });
}/// Create a copy of RenderContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CacheBudgetCopyWith<$Res>? get cacheBudget {
    if (_self.cacheBudget == null) {
    return null;
  }

  return $CacheBudgetCopyWith<$Res>(_self.cacheBudget!, (value) {
    return _then(_self.copyWith(cacheBudget: value));
  });
}
}


/// Adds pattern-matching-related methods to [RenderContext].
extension RenderContextPatterns on RenderContext {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RenderContext value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RenderContext() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RenderContext value)  $default,){
final _that = this;
switch (_that) {
case _RenderContext():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RenderContext value)?  $default,){
final _that = this;
switch (_that) {
case _RenderContext() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ViewportState viewport,  CanvasCoordinateSystem coordinateSystem,  TileSpec tiles,  CacheBudget? cacheBudget,  int lodLevel, @JsonKey(fromJson: _colourFromJson, toJson: _colourToJson)  AssetColourSpace colourSpace,  int frameId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RenderContext() when $default != null:
return $default(_that.viewport,_that.coordinateSystem,_that.tiles,_that.cacheBudget,_that.lodLevel,_that.colourSpace,_that.frameId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ViewportState viewport,  CanvasCoordinateSystem coordinateSystem,  TileSpec tiles,  CacheBudget? cacheBudget,  int lodLevel, @JsonKey(fromJson: _colourFromJson, toJson: _colourToJson)  AssetColourSpace colourSpace,  int frameId)  $default,) {final _that = this;
switch (_that) {
case _RenderContext():
return $default(_that.viewport,_that.coordinateSystem,_that.tiles,_that.cacheBudget,_that.lodLevel,_that.colourSpace,_that.frameId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ViewportState viewport,  CanvasCoordinateSystem coordinateSystem,  TileSpec tiles,  CacheBudget? cacheBudget,  int lodLevel, @JsonKey(fromJson: _colourFromJson, toJson: _colourToJson)  AssetColourSpace colourSpace,  int frameId)?  $default,) {final _that = this;
switch (_that) {
case _RenderContext() when $default != null:
return $default(_that.viewport,_that.coordinateSystem,_that.tiles,_that.cacheBudget,_that.lodLevel,_that.colourSpace,_that.frameId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RenderContext implements RenderContext {
  const _RenderContext({required this.viewport, this.coordinateSystem = CanvasCoordinateSystem.standard, this.tiles = TileSpec.standard, this.cacheBudget, this.lodLevel = 0, @JsonKey(fromJson: _colourFromJson, toJson: _colourToJson) this.colourSpace = AssetColourSpace.srgb, this.frameId = 0});
  factory _RenderContext.fromJson(Map<String, dynamic> json) => _$RenderContextFromJson(json);

/// The camera transform for this frame (frozen `core_interaction`). The
/// single shared viewport (R4) — the renderer never creates its own.
@override final  ViewportState viewport;
/// Physical-unit system + DPI (frozen `core_tooling`).
@override@JsonKey() final  CanvasCoordinateSystem coordinateSystem;
/// Tiling parameters for this frame (frozen `core_performance`).
@override@JsonKey() final  TileSpec tiles;
/// Cache budget for this frame's tier (frozen `core_performance`).
@override final  CacheBudget? cacheBudget;
/// Level-of-detail level chosen from zoom (0 = full resolution).
@override@JsonKey() final  int lodLevel;
/// Output colour space (frozen `core_asset`).
@override@JsonKey(fromJson: _colourFromJson, toJson: _colourToJson) final  AssetColourSpace colourSpace;
/// Deterministic frame identity (injected, never wall-clock).
@override@JsonKey() final  int frameId;

/// Create a copy of RenderContext
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RenderContextCopyWith<_RenderContext> get copyWith => __$RenderContextCopyWithImpl<_RenderContext>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RenderContextToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RenderContext&&(identical(other.viewport, viewport) || other.viewport == viewport)&&(identical(other.coordinateSystem, coordinateSystem) || other.coordinateSystem == coordinateSystem)&&(identical(other.tiles, tiles) || other.tiles == tiles)&&(identical(other.cacheBudget, cacheBudget) || other.cacheBudget == cacheBudget)&&(identical(other.lodLevel, lodLevel) || other.lodLevel == lodLevel)&&(identical(other.colourSpace, colourSpace) || other.colourSpace == colourSpace)&&(identical(other.frameId, frameId) || other.frameId == frameId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,viewport,coordinateSystem,tiles,cacheBudget,lodLevel,colourSpace,frameId);

@override
String toString() {
  return 'RenderContext(viewport: $viewport, coordinateSystem: $coordinateSystem, tiles: $tiles, cacheBudget: $cacheBudget, lodLevel: $lodLevel, colourSpace: $colourSpace, frameId: $frameId)';
}


}

/// @nodoc
abstract mixin class _$RenderContextCopyWith<$Res> implements $RenderContextCopyWith<$Res> {
  factory _$RenderContextCopyWith(_RenderContext value, $Res Function(_RenderContext) _then) = __$RenderContextCopyWithImpl;
@override @useResult
$Res call({
 ViewportState viewport, CanvasCoordinateSystem coordinateSystem, TileSpec tiles, CacheBudget? cacheBudget, int lodLevel,@JsonKey(fromJson: _colourFromJson, toJson: _colourToJson) AssetColourSpace colourSpace, int frameId
});


@override $ViewportStateCopyWith<$Res> get viewport;@override $CanvasCoordinateSystemCopyWith<$Res> get coordinateSystem;@override $TileSpecCopyWith<$Res> get tiles;@override $CacheBudgetCopyWith<$Res>? get cacheBudget;

}
/// @nodoc
class __$RenderContextCopyWithImpl<$Res>
    implements _$RenderContextCopyWith<$Res> {
  __$RenderContextCopyWithImpl(this._self, this._then);

  final _RenderContext _self;
  final $Res Function(_RenderContext) _then;

/// Create a copy of RenderContext
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? viewport = null,Object? coordinateSystem = null,Object? tiles = null,Object? cacheBudget = freezed,Object? lodLevel = null,Object? colourSpace = null,Object? frameId = null,}) {
  return _then(_RenderContext(
viewport: null == viewport ? _self.viewport : viewport // ignore: cast_nullable_to_non_nullable
as ViewportState,coordinateSystem: null == coordinateSystem ? _self.coordinateSystem : coordinateSystem // ignore: cast_nullable_to_non_nullable
as CanvasCoordinateSystem,tiles: null == tiles ? _self.tiles : tiles // ignore: cast_nullable_to_non_nullable
as TileSpec,cacheBudget: freezed == cacheBudget ? _self.cacheBudget : cacheBudget // ignore: cast_nullable_to_non_nullable
as CacheBudget?,lodLevel: null == lodLevel ? _self.lodLevel : lodLevel // ignore: cast_nullable_to_non_nullable
as int,colourSpace: null == colourSpace ? _self.colourSpace : colourSpace // ignore: cast_nullable_to_non_nullable
as AssetColourSpace,frameId: null == frameId ? _self.frameId : frameId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of RenderContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ViewportStateCopyWith<$Res> get viewport {
  
  return $ViewportStateCopyWith<$Res>(_self.viewport, (value) {
    return _then(_self.copyWith(viewport: value));
  });
}/// Create a copy of RenderContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CanvasCoordinateSystemCopyWith<$Res> get coordinateSystem {
  
  return $CanvasCoordinateSystemCopyWith<$Res>(_self.coordinateSystem, (value) {
    return _then(_self.copyWith(coordinateSystem: value));
  });
}/// Create a copy of RenderContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TileSpecCopyWith<$Res> get tiles {
  
  return $TileSpecCopyWith<$Res>(_self.tiles, (value) {
    return _then(_self.copyWith(tiles: value));
  });
}/// Create a copy of RenderContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CacheBudgetCopyWith<$Res>? get cacheBudget {
    if (_self.cacheBudget == null) {
    return null;
  }

  return $CacheBudgetCopyWith<$Res>(_self.cacheBudget!, (value) {
    return _then(_self.copyWith(cacheBudget: value));
  });
}
}

// dart format on
