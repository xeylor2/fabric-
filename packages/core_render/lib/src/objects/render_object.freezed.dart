// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'render_object.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RenderObject {

/// Stable identity of this render object within a graph.
 String get id;@JsonKey(fromJson: _kindFromJson, toJson: _kindToJson) RenderObjectKind get kind;/// The source this object visualises (id/hash only — never owned data).
 CanvasReference get source;/// Resolved local→world transform (frozen `core_geometry` primitive).
 Transform2D get transform;/// Axis-aligned bounds in document space (culling + spatial index).
 Rect2D get bounds;@JsonKey(fromJson: _blendFromJson, toJson: _blendToJson) FebricBlendMode get blend; double get opacity;/// Draw order within the graph (ascending; ties broken by [id]).
 int get order;/// Optional clip/mask reference id (mask model frozen in `core_mask`;
/// rasterization happens in the backend, not here).
 String? get maskId;/// Tile coordinates this object touches (populated by the compiler).
 List<String> get tileKeys;
/// Create a copy of RenderObject
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RenderObjectCopyWith<RenderObject> get copyWith => _$RenderObjectCopyWithImpl<RenderObject>(this as RenderObject, _$identity);

  /// Serializes this RenderObject to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RenderObject&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.source, source) || other.source == source)&&(identical(other.transform, transform) || other.transform == transform)&&(identical(other.bounds, bounds) || other.bounds == bounds)&&(identical(other.blend, blend) || other.blend == blend)&&(identical(other.opacity, opacity) || other.opacity == opacity)&&(identical(other.order, order) || other.order == order)&&(identical(other.maskId, maskId) || other.maskId == maskId)&&const DeepCollectionEquality().equals(other.tileKeys, tileKeys));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,kind,source,transform,bounds,blend,opacity,order,maskId,const DeepCollectionEquality().hash(tileKeys));

@override
String toString() {
  return 'RenderObject(id: $id, kind: $kind, source: $source, transform: $transform, bounds: $bounds, blend: $blend, opacity: $opacity, order: $order, maskId: $maskId, tileKeys: $tileKeys)';
}


}

/// @nodoc
abstract mixin class $RenderObjectCopyWith<$Res>  {
  factory $RenderObjectCopyWith(RenderObject value, $Res Function(RenderObject) _then) = _$RenderObjectCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(fromJson: _kindFromJson, toJson: _kindToJson) RenderObjectKind kind, CanvasReference source, Transform2D transform, Rect2D bounds,@JsonKey(fromJson: _blendFromJson, toJson: _blendToJson) FebricBlendMode blend, double opacity, int order, String? maskId, List<String> tileKeys
});


$CanvasReferenceCopyWith<$Res> get source;$Transform2DCopyWith<$Res> get transform;$Rect2DCopyWith<$Res> get bounds;

}
/// @nodoc
class _$RenderObjectCopyWithImpl<$Res>
    implements $RenderObjectCopyWith<$Res> {
  _$RenderObjectCopyWithImpl(this._self, this._then);

  final RenderObject _self;
  final $Res Function(RenderObject) _then;

/// Create a copy of RenderObject
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? kind = null,Object? source = null,Object? transform = null,Object? bounds = null,Object? blend = null,Object? opacity = null,Object? order = null,Object? maskId = freezed,Object? tileKeys = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as RenderObjectKind,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as CanvasReference,transform: null == transform ? _self.transform : transform // ignore: cast_nullable_to_non_nullable
as Transform2D,bounds: null == bounds ? _self.bounds : bounds // ignore: cast_nullable_to_non_nullable
as Rect2D,blend: null == blend ? _self.blend : blend // ignore: cast_nullable_to_non_nullable
as FebricBlendMode,opacity: null == opacity ? _self.opacity : opacity // ignore: cast_nullable_to_non_nullable
as double,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,maskId: freezed == maskId ? _self.maskId : maskId // ignore: cast_nullable_to_non_nullable
as String?,tileKeys: null == tileKeys ? _self.tileKeys : tileKeys // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}
/// Create a copy of RenderObject
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CanvasReferenceCopyWith<$Res> get source {
  
  return $CanvasReferenceCopyWith<$Res>(_self.source, (value) {
    return _then(_self.copyWith(source: value));
  });
}/// Create a copy of RenderObject
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Transform2DCopyWith<$Res> get transform {
  
  return $Transform2DCopyWith<$Res>(_self.transform, (value) {
    return _then(_self.copyWith(transform: value));
  });
}/// Create a copy of RenderObject
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Rect2DCopyWith<$Res> get bounds {
  
  return $Rect2DCopyWith<$Res>(_self.bounds, (value) {
    return _then(_self.copyWith(bounds: value));
  });
}
}


/// Adds pattern-matching-related methods to [RenderObject].
extension RenderObjectPatterns on RenderObject {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RenderObject value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RenderObject() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RenderObject value)  $default,){
final _that = this;
switch (_that) {
case _RenderObject():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RenderObject value)?  $default,){
final _that = this;
switch (_that) {
case _RenderObject() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(fromJson: _kindFromJson, toJson: _kindToJson)  RenderObjectKind kind,  CanvasReference source,  Transform2D transform,  Rect2D bounds, @JsonKey(fromJson: _blendFromJson, toJson: _blendToJson)  FebricBlendMode blend,  double opacity,  int order,  String? maskId,  List<String> tileKeys)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RenderObject() when $default != null:
return $default(_that.id,_that.kind,_that.source,_that.transform,_that.bounds,_that.blend,_that.opacity,_that.order,_that.maskId,_that.tileKeys);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(fromJson: _kindFromJson, toJson: _kindToJson)  RenderObjectKind kind,  CanvasReference source,  Transform2D transform,  Rect2D bounds, @JsonKey(fromJson: _blendFromJson, toJson: _blendToJson)  FebricBlendMode blend,  double opacity,  int order,  String? maskId,  List<String> tileKeys)  $default,) {final _that = this;
switch (_that) {
case _RenderObject():
return $default(_that.id,_that.kind,_that.source,_that.transform,_that.bounds,_that.blend,_that.opacity,_that.order,_that.maskId,_that.tileKeys);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(fromJson: _kindFromJson, toJson: _kindToJson)  RenderObjectKind kind,  CanvasReference source,  Transform2D transform,  Rect2D bounds, @JsonKey(fromJson: _blendFromJson, toJson: _blendToJson)  FebricBlendMode blend,  double opacity,  int order,  String? maskId,  List<String> tileKeys)?  $default,) {final _that = this;
switch (_that) {
case _RenderObject() when $default != null:
return $default(_that.id,_that.kind,_that.source,_that.transform,_that.bounds,_that.blend,_that.opacity,_that.order,_that.maskId,_that.tileKeys);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RenderObject extends RenderObject {
  const _RenderObject({required this.id, @JsonKey(fromJson: _kindFromJson, toJson: _kindToJson) required this.kind, required this.source, this.transform = Transform2D.identity, required this.bounds, @JsonKey(fromJson: _blendFromJson, toJson: _blendToJson) this.blend = FebricBlendMode.normal, this.opacity = 1.0, this.order = 0, this.maskId, final  List<String> tileKeys = const <String>[]}): _tileKeys = tileKeys,super._();
  factory _RenderObject.fromJson(Map<String, dynamic> json) => _$RenderObjectFromJson(json);

/// Stable identity of this render object within a graph.
@override final  String id;
@override@JsonKey(fromJson: _kindFromJson, toJson: _kindToJson) final  RenderObjectKind kind;
/// The source this object visualises (id/hash only — never owned data).
@override final  CanvasReference source;
/// Resolved local→world transform (frozen `core_geometry` primitive).
@override@JsonKey() final  Transform2D transform;
/// Axis-aligned bounds in document space (culling + spatial index).
@override final  Rect2D bounds;
@override@JsonKey(fromJson: _blendFromJson, toJson: _blendToJson) final  FebricBlendMode blend;
@override@JsonKey() final  double opacity;
/// Draw order within the graph (ascending; ties broken by [id]).
@override@JsonKey() final  int order;
/// Optional clip/mask reference id (mask model frozen in `core_mask`;
/// rasterization happens in the backend, not here).
@override final  String? maskId;
/// Tile coordinates this object touches (populated by the compiler).
 final  List<String> _tileKeys;
/// Tile coordinates this object touches (populated by the compiler).
@override@JsonKey() List<String> get tileKeys {
  if (_tileKeys is EqualUnmodifiableListView) return _tileKeys;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tileKeys);
}


/// Create a copy of RenderObject
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RenderObjectCopyWith<_RenderObject> get copyWith => __$RenderObjectCopyWithImpl<_RenderObject>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RenderObjectToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RenderObject&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.source, source) || other.source == source)&&(identical(other.transform, transform) || other.transform == transform)&&(identical(other.bounds, bounds) || other.bounds == bounds)&&(identical(other.blend, blend) || other.blend == blend)&&(identical(other.opacity, opacity) || other.opacity == opacity)&&(identical(other.order, order) || other.order == order)&&(identical(other.maskId, maskId) || other.maskId == maskId)&&const DeepCollectionEquality().equals(other._tileKeys, _tileKeys));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,kind,source,transform,bounds,blend,opacity,order,maskId,const DeepCollectionEquality().hash(_tileKeys));

@override
String toString() {
  return 'RenderObject(id: $id, kind: $kind, source: $source, transform: $transform, bounds: $bounds, blend: $blend, opacity: $opacity, order: $order, maskId: $maskId, tileKeys: $tileKeys)';
}


}

/// @nodoc
abstract mixin class _$RenderObjectCopyWith<$Res> implements $RenderObjectCopyWith<$Res> {
  factory _$RenderObjectCopyWith(_RenderObject value, $Res Function(_RenderObject) _then) = __$RenderObjectCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(fromJson: _kindFromJson, toJson: _kindToJson) RenderObjectKind kind, CanvasReference source, Transform2D transform, Rect2D bounds,@JsonKey(fromJson: _blendFromJson, toJson: _blendToJson) FebricBlendMode blend, double opacity, int order, String? maskId, List<String> tileKeys
});


@override $CanvasReferenceCopyWith<$Res> get source;@override $Transform2DCopyWith<$Res> get transform;@override $Rect2DCopyWith<$Res> get bounds;

}
/// @nodoc
class __$RenderObjectCopyWithImpl<$Res>
    implements _$RenderObjectCopyWith<$Res> {
  __$RenderObjectCopyWithImpl(this._self, this._then);

  final _RenderObject _self;
  final $Res Function(_RenderObject) _then;

/// Create a copy of RenderObject
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? kind = null,Object? source = null,Object? transform = null,Object? bounds = null,Object? blend = null,Object? opacity = null,Object? order = null,Object? maskId = freezed,Object? tileKeys = null,}) {
  return _then(_RenderObject(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as RenderObjectKind,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as CanvasReference,transform: null == transform ? _self.transform : transform // ignore: cast_nullable_to_non_nullable
as Transform2D,bounds: null == bounds ? _self.bounds : bounds // ignore: cast_nullable_to_non_nullable
as Rect2D,blend: null == blend ? _self.blend : blend // ignore: cast_nullable_to_non_nullable
as FebricBlendMode,opacity: null == opacity ? _self.opacity : opacity // ignore: cast_nullable_to_non_nullable
as double,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,maskId: freezed == maskId ? _self.maskId : maskId // ignore: cast_nullable_to_non_nullable
as String?,tileKeys: null == tileKeys ? _self._tileKeys : tileKeys // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

/// Create a copy of RenderObject
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CanvasReferenceCopyWith<$Res> get source {
  
  return $CanvasReferenceCopyWith<$Res>(_self.source, (value) {
    return _then(_self.copyWith(source: value));
  });
}/// Create a copy of RenderObject
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Transform2DCopyWith<$Res> get transform {
  
  return $Transform2DCopyWith<$Res>(_self.transform, (value) {
    return _then(_self.copyWith(transform: value));
  });
}/// Create a copy of RenderObject
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Rect2DCopyWith<$Res> get bounds {
  
  return $Rect2DCopyWith<$Res>(_self.bounds, (value) {
    return _then(_self.copyWith(bounds: value));
  });
}
}

// dart format on
