// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'render_work_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RenderWorkItem {

/// Coalescing key (later items with the same key supersede earlier ones).
 String get key;@JsonKey(fromJson: _kindFromJson, toJson: _kindToJson) RenderWorkItemKind get kind;@JsonKey(fromJson: _priorityFromJson, toJson: _priorityToJson) WorkerPriority get priority;/// Optional tile this item renders (frozen `TileCoordinate`).
 TileCoordinate? get tile;/// Optional pass this item executes (pass wire name).
 String? get passKind;
/// Create a copy of RenderWorkItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RenderWorkItemCopyWith<RenderWorkItem> get copyWith => _$RenderWorkItemCopyWithImpl<RenderWorkItem>(this as RenderWorkItem, _$identity);

  /// Serializes this RenderWorkItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RenderWorkItem&&(identical(other.key, key) || other.key == key)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.tile, tile) || other.tile == tile)&&(identical(other.passKind, passKind) || other.passKind == passKind));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,kind,priority,tile,passKind);

@override
String toString() {
  return 'RenderWorkItem(key: $key, kind: $kind, priority: $priority, tile: $tile, passKind: $passKind)';
}


}

/// @nodoc
abstract mixin class $RenderWorkItemCopyWith<$Res>  {
  factory $RenderWorkItemCopyWith(RenderWorkItem value, $Res Function(RenderWorkItem) _then) = _$RenderWorkItemCopyWithImpl;
@useResult
$Res call({
 String key,@JsonKey(fromJson: _kindFromJson, toJson: _kindToJson) RenderWorkItemKind kind,@JsonKey(fromJson: _priorityFromJson, toJson: _priorityToJson) WorkerPriority priority, TileCoordinate? tile, String? passKind
});


$TileCoordinateCopyWith<$Res>? get tile;

}
/// @nodoc
class _$RenderWorkItemCopyWithImpl<$Res>
    implements $RenderWorkItemCopyWith<$Res> {
  _$RenderWorkItemCopyWithImpl(this._self, this._then);

  final RenderWorkItem _self;
  final $Res Function(RenderWorkItem) _then;

/// Create a copy of RenderWorkItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? kind = null,Object? priority = null,Object? tile = freezed,Object? passKind = freezed,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as RenderWorkItemKind,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as WorkerPriority,tile: freezed == tile ? _self.tile : tile // ignore: cast_nullable_to_non_nullable
as TileCoordinate?,passKind: freezed == passKind ? _self.passKind : passKind // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of RenderWorkItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TileCoordinateCopyWith<$Res>? get tile {
    if (_self.tile == null) {
    return null;
  }

  return $TileCoordinateCopyWith<$Res>(_self.tile!, (value) {
    return _then(_self.copyWith(tile: value));
  });
}
}


/// Adds pattern-matching-related methods to [RenderWorkItem].
extension RenderWorkItemPatterns on RenderWorkItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RenderWorkItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RenderWorkItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RenderWorkItem value)  $default,){
final _that = this;
switch (_that) {
case _RenderWorkItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RenderWorkItem value)?  $default,){
final _that = this;
switch (_that) {
case _RenderWorkItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String key, @JsonKey(fromJson: _kindFromJson, toJson: _kindToJson)  RenderWorkItemKind kind, @JsonKey(fromJson: _priorityFromJson, toJson: _priorityToJson)  WorkerPriority priority,  TileCoordinate? tile,  String? passKind)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RenderWorkItem() when $default != null:
return $default(_that.key,_that.kind,_that.priority,_that.tile,_that.passKind);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String key, @JsonKey(fromJson: _kindFromJson, toJson: _kindToJson)  RenderWorkItemKind kind, @JsonKey(fromJson: _priorityFromJson, toJson: _priorityToJson)  WorkerPriority priority,  TileCoordinate? tile,  String? passKind)  $default,) {final _that = this;
switch (_that) {
case _RenderWorkItem():
return $default(_that.key,_that.kind,_that.priority,_that.tile,_that.passKind);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String key, @JsonKey(fromJson: _kindFromJson, toJson: _kindToJson)  RenderWorkItemKind kind, @JsonKey(fromJson: _priorityFromJson, toJson: _priorityToJson)  WorkerPriority priority,  TileCoordinate? tile,  String? passKind)?  $default,) {final _that = this;
switch (_that) {
case _RenderWorkItem() when $default != null:
return $default(_that.key,_that.kind,_that.priority,_that.tile,_that.passKind);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RenderWorkItem implements RenderWorkItem {
  const _RenderWorkItem({required this.key, @JsonKey(fromJson: _kindFromJson, toJson: _kindToJson) required this.kind, @JsonKey(fromJson: _priorityFromJson, toJson: _priorityToJson) this.priority = WorkerPriority.normal, this.tile, this.passKind});
  factory _RenderWorkItem.fromJson(Map<String, dynamic> json) => _$RenderWorkItemFromJson(json);

/// Coalescing key (later items with the same key supersede earlier ones).
@override final  String key;
@override@JsonKey(fromJson: _kindFromJson, toJson: _kindToJson) final  RenderWorkItemKind kind;
@override@JsonKey(fromJson: _priorityFromJson, toJson: _priorityToJson) final  WorkerPriority priority;
/// Optional tile this item renders (frozen `TileCoordinate`).
@override final  TileCoordinate? tile;
/// Optional pass this item executes (pass wire name).
@override final  String? passKind;

/// Create a copy of RenderWorkItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RenderWorkItemCopyWith<_RenderWorkItem> get copyWith => __$RenderWorkItemCopyWithImpl<_RenderWorkItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RenderWorkItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RenderWorkItem&&(identical(other.key, key) || other.key == key)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.tile, tile) || other.tile == tile)&&(identical(other.passKind, passKind) || other.passKind == passKind));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,kind,priority,tile,passKind);

@override
String toString() {
  return 'RenderWorkItem(key: $key, kind: $kind, priority: $priority, tile: $tile, passKind: $passKind)';
}


}

/// @nodoc
abstract mixin class _$RenderWorkItemCopyWith<$Res> implements $RenderWorkItemCopyWith<$Res> {
  factory _$RenderWorkItemCopyWith(_RenderWorkItem value, $Res Function(_RenderWorkItem) _then) = __$RenderWorkItemCopyWithImpl;
@override @useResult
$Res call({
 String key,@JsonKey(fromJson: _kindFromJson, toJson: _kindToJson) RenderWorkItemKind kind,@JsonKey(fromJson: _priorityFromJson, toJson: _priorityToJson) WorkerPriority priority, TileCoordinate? tile, String? passKind
});


@override $TileCoordinateCopyWith<$Res>? get tile;

}
/// @nodoc
class __$RenderWorkItemCopyWithImpl<$Res>
    implements _$RenderWorkItemCopyWith<$Res> {
  __$RenderWorkItemCopyWithImpl(this._self, this._then);

  final _RenderWorkItem _self;
  final $Res Function(_RenderWorkItem) _then;

/// Create a copy of RenderWorkItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? kind = null,Object? priority = null,Object? tile = freezed,Object? passKind = freezed,}) {
  return _then(_RenderWorkItem(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as RenderWorkItemKind,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as WorkerPriority,tile: freezed == tile ? _self.tile : tile // ignore: cast_nullable_to_non_nullable
as TileCoordinate?,passKind: freezed == passKind ? _self.passKind : passKind // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of RenderWorkItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TileCoordinateCopyWith<$Res>? get tile {
    if (_self.tile == null) {
    return null;
  }

  return $TileCoordinateCopyWith<$Res>(_self.tile!, (value) {
    return _then(_self.copyWith(tile: value));
  });
}
}

// dart format on
