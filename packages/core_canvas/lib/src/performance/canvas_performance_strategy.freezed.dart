// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'canvas_performance_strategy.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CanvasPerformanceStrategy {

/// Tiling parameters (frozen `core_performance.TileSpec`).
 TileSpec get tiles;/// Large-document thresholds (frozen `LargeDocumentPolicy`).
 LargeDocumentPolicy get largeDocument;/// Optional spatial-index configuration; null until the scene bounds are
/// known (frozen `QuadTreeConfig`).
 QuadTreeConfig? get spatialIndex;/// Canvas extends without fixed bounds (pan beyond the artboard).
 bool get infiniteCanvas;/// Only regions invalidated by a change are recomputed.
 bool get dirtyRegionTracking;/// Off-viewport objects are culled from processing (uses the spatial
/// index).
 bool get objectCulling;/// Rendered viewport results are cached between frames.
 bool get viewportCaching;/// Level-of-detail sampling by zoom (uses the tile mip pyramid).
 bool get levelOfDetail;
/// Create a copy of CanvasPerformanceStrategy
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CanvasPerformanceStrategyCopyWith<CanvasPerformanceStrategy> get copyWith => _$CanvasPerformanceStrategyCopyWithImpl<CanvasPerformanceStrategy>(this as CanvasPerformanceStrategy, _$identity);

  /// Serializes this CanvasPerformanceStrategy to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CanvasPerformanceStrategy&&(identical(other.tiles, tiles) || other.tiles == tiles)&&(identical(other.largeDocument, largeDocument) || other.largeDocument == largeDocument)&&(identical(other.spatialIndex, spatialIndex) || other.spatialIndex == spatialIndex)&&(identical(other.infiniteCanvas, infiniteCanvas) || other.infiniteCanvas == infiniteCanvas)&&(identical(other.dirtyRegionTracking, dirtyRegionTracking) || other.dirtyRegionTracking == dirtyRegionTracking)&&(identical(other.objectCulling, objectCulling) || other.objectCulling == objectCulling)&&(identical(other.viewportCaching, viewportCaching) || other.viewportCaching == viewportCaching)&&(identical(other.levelOfDetail, levelOfDetail) || other.levelOfDetail == levelOfDetail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tiles,largeDocument,spatialIndex,infiniteCanvas,dirtyRegionTracking,objectCulling,viewportCaching,levelOfDetail);

@override
String toString() {
  return 'CanvasPerformanceStrategy(tiles: $tiles, largeDocument: $largeDocument, spatialIndex: $spatialIndex, infiniteCanvas: $infiniteCanvas, dirtyRegionTracking: $dirtyRegionTracking, objectCulling: $objectCulling, viewportCaching: $viewportCaching, levelOfDetail: $levelOfDetail)';
}


}

/// @nodoc
abstract mixin class $CanvasPerformanceStrategyCopyWith<$Res>  {
  factory $CanvasPerformanceStrategyCopyWith(CanvasPerformanceStrategy value, $Res Function(CanvasPerformanceStrategy) _then) = _$CanvasPerformanceStrategyCopyWithImpl;
@useResult
$Res call({
 TileSpec tiles, LargeDocumentPolicy largeDocument, QuadTreeConfig? spatialIndex, bool infiniteCanvas, bool dirtyRegionTracking, bool objectCulling, bool viewportCaching, bool levelOfDetail
});


$TileSpecCopyWith<$Res> get tiles;$LargeDocumentPolicyCopyWith<$Res> get largeDocument;$QuadTreeConfigCopyWith<$Res>? get spatialIndex;

}
/// @nodoc
class _$CanvasPerformanceStrategyCopyWithImpl<$Res>
    implements $CanvasPerformanceStrategyCopyWith<$Res> {
  _$CanvasPerformanceStrategyCopyWithImpl(this._self, this._then);

  final CanvasPerformanceStrategy _self;
  final $Res Function(CanvasPerformanceStrategy) _then;

/// Create a copy of CanvasPerformanceStrategy
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tiles = null,Object? largeDocument = null,Object? spatialIndex = freezed,Object? infiniteCanvas = null,Object? dirtyRegionTracking = null,Object? objectCulling = null,Object? viewportCaching = null,Object? levelOfDetail = null,}) {
  return _then(_self.copyWith(
tiles: null == tiles ? _self.tiles : tiles // ignore: cast_nullable_to_non_nullable
as TileSpec,largeDocument: null == largeDocument ? _self.largeDocument : largeDocument // ignore: cast_nullable_to_non_nullable
as LargeDocumentPolicy,spatialIndex: freezed == spatialIndex ? _self.spatialIndex : spatialIndex // ignore: cast_nullable_to_non_nullable
as QuadTreeConfig?,infiniteCanvas: null == infiniteCanvas ? _self.infiniteCanvas : infiniteCanvas // ignore: cast_nullable_to_non_nullable
as bool,dirtyRegionTracking: null == dirtyRegionTracking ? _self.dirtyRegionTracking : dirtyRegionTracking // ignore: cast_nullable_to_non_nullable
as bool,objectCulling: null == objectCulling ? _self.objectCulling : objectCulling // ignore: cast_nullable_to_non_nullable
as bool,viewportCaching: null == viewportCaching ? _self.viewportCaching : viewportCaching // ignore: cast_nullable_to_non_nullable
as bool,levelOfDetail: null == levelOfDetail ? _self.levelOfDetail : levelOfDetail // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of CanvasPerformanceStrategy
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TileSpecCopyWith<$Res> get tiles {
  
  return $TileSpecCopyWith<$Res>(_self.tiles, (value) {
    return _then(_self.copyWith(tiles: value));
  });
}/// Create a copy of CanvasPerformanceStrategy
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LargeDocumentPolicyCopyWith<$Res> get largeDocument {
  
  return $LargeDocumentPolicyCopyWith<$Res>(_self.largeDocument, (value) {
    return _then(_self.copyWith(largeDocument: value));
  });
}/// Create a copy of CanvasPerformanceStrategy
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuadTreeConfigCopyWith<$Res>? get spatialIndex {
    if (_self.spatialIndex == null) {
    return null;
  }

  return $QuadTreeConfigCopyWith<$Res>(_self.spatialIndex!, (value) {
    return _then(_self.copyWith(spatialIndex: value));
  });
}
}


/// Adds pattern-matching-related methods to [CanvasPerformanceStrategy].
extension CanvasPerformanceStrategyPatterns on CanvasPerformanceStrategy {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CanvasPerformanceStrategy value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CanvasPerformanceStrategy() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CanvasPerformanceStrategy value)  $default,){
final _that = this;
switch (_that) {
case _CanvasPerformanceStrategy():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CanvasPerformanceStrategy value)?  $default,){
final _that = this;
switch (_that) {
case _CanvasPerformanceStrategy() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TileSpec tiles,  LargeDocumentPolicy largeDocument,  QuadTreeConfig? spatialIndex,  bool infiniteCanvas,  bool dirtyRegionTracking,  bool objectCulling,  bool viewportCaching,  bool levelOfDetail)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CanvasPerformanceStrategy() when $default != null:
return $default(_that.tiles,_that.largeDocument,_that.spatialIndex,_that.infiniteCanvas,_that.dirtyRegionTracking,_that.objectCulling,_that.viewportCaching,_that.levelOfDetail);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TileSpec tiles,  LargeDocumentPolicy largeDocument,  QuadTreeConfig? spatialIndex,  bool infiniteCanvas,  bool dirtyRegionTracking,  bool objectCulling,  bool viewportCaching,  bool levelOfDetail)  $default,) {final _that = this;
switch (_that) {
case _CanvasPerformanceStrategy():
return $default(_that.tiles,_that.largeDocument,_that.spatialIndex,_that.infiniteCanvas,_that.dirtyRegionTracking,_that.objectCulling,_that.viewportCaching,_that.levelOfDetail);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TileSpec tiles,  LargeDocumentPolicy largeDocument,  QuadTreeConfig? spatialIndex,  bool infiniteCanvas,  bool dirtyRegionTracking,  bool objectCulling,  bool viewportCaching,  bool levelOfDetail)?  $default,) {final _that = this;
switch (_that) {
case _CanvasPerformanceStrategy() when $default != null:
return $default(_that.tiles,_that.largeDocument,_that.spatialIndex,_that.infiniteCanvas,_that.dirtyRegionTracking,_that.objectCulling,_that.viewportCaching,_that.levelOfDetail);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CanvasPerformanceStrategy extends CanvasPerformanceStrategy {
  const _CanvasPerformanceStrategy({this.tiles = TileSpec.standard, this.largeDocument = LargeDocumentPolicy.standard, this.spatialIndex, this.infiniteCanvas = true, this.dirtyRegionTracking = true, this.objectCulling = true, this.viewportCaching = true, this.levelOfDetail = true}): super._();
  factory _CanvasPerformanceStrategy.fromJson(Map<String, dynamic> json) => _$CanvasPerformanceStrategyFromJson(json);

/// Tiling parameters (frozen `core_performance.TileSpec`).
@override@JsonKey() final  TileSpec tiles;
/// Large-document thresholds (frozen `LargeDocumentPolicy`).
@override@JsonKey() final  LargeDocumentPolicy largeDocument;
/// Optional spatial-index configuration; null until the scene bounds are
/// known (frozen `QuadTreeConfig`).
@override final  QuadTreeConfig? spatialIndex;
/// Canvas extends without fixed bounds (pan beyond the artboard).
@override@JsonKey() final  bool infiniteCanvas;
/// Only regions invalidated by a change are recomputed.
@override@JsonKey() final  bool dirtyRegionTracking;
/// Off-viewport objects are culled from processing (uses the spatial
/// index).
@override@JsonKey() final  bool objectCulling;
/// Rendered viewport results are cached between frames.
@override@JsonKey() final  bool viewportCaching;
/// Level-of-detail sampling by zoom (uses the tile mip pyramid).
@override@JsonKey() final  bool levelOfDetail;

/// Create a copy of CanvasPerformanceStrategy
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CanvasPerformanceStrategyCopyWith<_CanvasPerformanceStrategy> get copyWith => __$CanvasPerformanceStrategyCopyWithImpl<_CanvasPerformanceStrategy>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CanvasPerformanceStrategyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CanvasPerformanceStrategy&&(identical(other.tiles, tiles) || other.tiles == tiles)&&(identical(other.largeDocument, largeDocument) || other.largeDocument == largeDocument)&&(identical(other.spatialIndex, spatialIndex) || other.spatialIndex == spatialIndex)&&(identical(other.infiniteCanvas, infiniteCanvas) || other.infiniteCanvas == infiniteCanvas)&&(identical(other.dirtyRegionTracking, dirtyRegionTracking) || other.dirtyRegionTracking == dirtyRegionTracking)&&(identical(other.objectCulling, objectCulling) || other.objectCulling == objectCulling)&&(identical(other.viewportCaching, viewportCaching) || other.viewportCaching == viewportCaching)&&(identical(other.levelOfDetail, levelOfDetail) || other.levelOfDetail == levelOfDetail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tiles,largeDocument,spatialIndex,infiniteCanvas,dirtyRegionTracking,objectCulling,viewportCaching,levelOfDetail);

@override
String toString() {
  return 'CanvasPerformanceStrategy(tiles: $tiles, largeDocument: $largeDocument, spatialIndex: $spatialIndex, infiniteCanvas: $infiniteCanvas, dirtyRegionTracking: $dirtyRegionTracking, objectCulling: $objectCulling, viewportCaching: $viewportCaching, levelOfDetail: $levelOfDetail)';
}


}

/// @nodoc
abstract mixin class _$CanvasPerformanceStrategyCopyWith<$Res> implements $CanvasPerformanceStrategyCopyWith<$Res> {
  factory _$CanvasPerformanceStrategyCopyWith(_CanvasPerformanceStrategy value, $Res Function(_CanvasPerformanceStrategy) _then) = __$CanvasPerformanceStrategyCopyWithImpl;
@override @useResult
$Res call({
 TileSpec tiles, LargeDocumentPolicy largeDocument, QuadTreeConfig? spatialIndex, bool infiniteCanvas, bool dirtyRegionTracking, bool objectCulling, bool viewportCaching, bool levelOfDetail
});


@override $TileSpecCopyWith<$Res> get tiles;@override $LargeDocumentPolicyCopyWith<$Res> get largeDocument;@override $QuadTreeConfigCopyWith<$Res>? get spatialIndex;

}
/// @nodoc
class __$CanvasPerformanceStrategyCopyWithImpl<$Res>
    implements _$CanvasPerformanceStrategyCopyWith<$Res> {
  __$CanvasPerformanceStrategyCopyWithImpl(this._self, this._then);

  final _CanvasPerformanceStrategy _self;
  final $Res Function(_CanvasPerformanceStrategy) _then;

/// Create a copy of CanvasPerformanceStrategy
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tiles = null,Object? largeDocument = null,Object? spatialIndex = freezed,Object? infiniteCanvas = null,Object? dirtyRegionTracking = null,Object? objectCulling = null,Object? viewportCaching = null,Object? levelOfDetail = null,}) {
  return _then(_CanvasPerformanceStrategy(
tiles: null == tiles ? _self.tiles : tiles // ignore: cast_nullable_to_non_nullable
as TileSpec,largeDocument: null == largeDocument ? _self.largeDocument : largeDocument // ignore: cast_nullable_to_non_nullable
as LargeDocumentPolicy,spatialIndex: freezed == spatialIndex ? _self.spatialIndex : spatialIndex // ignore: cast_nullable_to_non_nullable
as QuadTreeConfig?,infiniteCanvas: null == infiniteCanvas ? _self.infiniteCanvas : infiniteCanvas // ignore: cast_nullable_to_non_nullable
as bool,dirtyRegionTracking: null == dirtyRegionTracking ? _self.dirtyRegionTracking : dirtyRegionTracking // ignore: cast_nullable_to_non_nullable
as bool,objectCulling: null == objectCulling ? _self.objectCulling : objectCulling // ignore: cast_nullable_to_non_nullable
as bool,viewportCaching: null == viewportCaching ? _self.viewportCaching : viewportCaching // ignore: cast_nullable_to_non_nullable
as bool,levelOfDetail: null == levelOfDetail ? _self.levelOfDetail : levelOfDetail // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of CanvasPerformanceStrategy
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TileSpecCopyWith<$Res> get tiles {
  
  return $TileSpecCopyWith<$Res>(_self.tiles, (value) {
    return _then(_self.copyWith(tiles: value));
  });
}/// Create a copy of CanvasPerformanceStrategy
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LargeDocumentPolicyCopyWith<$Res> get largeDocument {
  
  return $LargeDocumentPolicyCopyWith<$Res>(_self.largeDocument, (value) {
    return _then(_self.copyWith(largeDocument: value));
  });
}/// Create a copy of CanvasPerformanceStrategy
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuadTreeConfigCopyWith<$Res>? get spatialIndex {
    if (_self.spatialIndex == null) {
    return null;
  }

  return $QuadTreeConfigCopyWith<$Res>(_self.spatialIndex!, (value) {
    return _then(_self.copyWith(spatialIndex: value));
  });
}
}

// dart format on
