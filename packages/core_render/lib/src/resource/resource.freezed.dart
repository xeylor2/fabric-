// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resource.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResourceKey {

@JsonKey(fromJson: _kindFromJson, toJson: _kindToJson) ResourceKind get kind;/// The logical key: `sha256:…` for textures; a composite string for
/// tiles; a stable id for device resources.
 String get key;
/// Create a copy of ResourceKey
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResourceKeyCopyWith<ResourceKey> get copyWith => _$ResourceKeyCopyWithImpl<ResourceKey>(this as ResourceKey, _$identity);

  /// Serializes this ResourceKey to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResourceKey&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.key, key) || other.key == key));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,key);

@override
String toString() {
  return 'ResourceKey(kind: $kind, key: $key)';
}


}

/// @nodoc
abstract mixin class $ResourceKeyCopyWith<$Res>  {
  factory $ResourceKeyCopyWith(ResourceKey value, $Res Function(ResourceKey) _then) = _$ResourceKeyCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _kindFromJson, toJson: _kindToJson) ResourceKind kind, String key
});




}
/// @nodoc
class _$ResourceKeyCopyWithImpl<$Res>
    implements $ResourceKeyCopyWith<$Res> {
  _$ResourceKeyCopyWithImpl(this._self, this._then);

  final ResourceKey _self;
  final $Res Function(ResourceKey) _then;

/// Create a copy of ResourceKey
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? key = null,}) {
  return _then(_self.copyWith(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as ResourceKind,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ResourceKey].
extension ResourceKeyPatterns on ResourceKey {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResourceKey value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResourceKey() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResourceKey value)  $default,){
final _that = this;
switch (_that) {
case _ResourceKey():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResourceKey value)?  $default,){
final _that = this;
switch (_that) {
case _ResourceKey() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _kindFromJson, toJson: _kindToJson)  ResourceKind kind,  String key)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResourceKey() when $default != null:
return $default(_that.kind,_that.key);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _kindFromJson, toJson: _kindToJson)  ResourceKind kind,  String key)  $default,) {final _that = this;
switch (_that) {
case _ResourceKey():
return $default(_that.kind,_that.key);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _kindFromJson, toJson: _kindToJson)  ResourceKind kind,  String key)?  $default,) {final _that = this;
switch (_that) {
case _ResourceKey() when $default != null:
return $default(_that.kind,_that.key);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResourceKey implements ResourceKey {
  const _ResourceKey({@JsonKey(fromJson: _kindFromJson, toJson: _kindToJson) required this.kind, required this.key});
  factory _ResourceKey.fromJson(Map<String, dynamic> json) => _$ResourceKeyFromJson(json);

@override@JsonKey(fromJson: _kindFromJson, toJson: _kindToJson) final  ResourceKind kind;
/// The logical key: `sha256:…` for textures; a composite string for
/// tiles; a stable id for device resources.
@override final  String key;

/// Create a copy of ResourceKey
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResourceKeyCopyWith<_ResourceKey> get copyWith => __$ResourceKeyCopyWithImpl<_ResourceKey>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResourceKeyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResourceKey&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.key, key) || other.key == key));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,key);

@override
String toString() {
  return 'ResourceKey(kind: $kind, key: $key)';
}


}

/// @nodoc
abstract mixin class _$ResourceKeyCopyWith<$Res> implements $ResourceKeyCopyWith<$Res> {
  factory _$ResourceKeyCopyWith(_ResourceKey value, $Res Function(_ResourceKey) _then) = __$ResourceKeyCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _kindFromJson, toJson: _kindToJson) ResourceKind kind, String key
});




}
/// @nodoc
class __$ResourceKeyCopyWithImpl<$Res>
    implements _$ResourceKeyCopyWith<$Res> {
  __$ResourceKeyCopyWithImpl(this._self, this._then);

  final _ResourceKey _self;
  final $Res Function(_ResourceKey) _then;

/// Create a copy of ResourceKey
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? key = null,}) {
  return _then(_ResourceKey(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as ResourceKind,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ResourceHandle {

 ResourceKey get resourceKey;/// Backend-issued opaque reference (never a device object).
 String get handleId;/// Reference count across render objects (content-addressed dedup).
 int get refCount;
/// Create a copy of ResourceHandle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResourceHandleCopyWith<ResourceHandle> get copyWith => _$ResourceHandleCopyWithImpl<ResourceHandle>(this as ResourceHandle, _$identity);

  /// Serializes this ResourceHandle to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResourceHandle&&(identical(other.resourceKey, resourceKey) || other.resourceKey == resourceKey)&&(identical(other.handleId, handleId) || other.handleId == handleId)&&(identical(other.refCount, refCount) || other.refCount == refCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,resourceKey,handleId,refCount);

@override
String toString() {
  return 'ResourceHandle(resourceKey: $resourceKey, handleId: $handleId, refCount: $refCount)';
}


}

/// @nodoc
abstract mixin class $ResourceHandleCopyWith<$Res>  {
  factory $ResourceHandleCopyWith(ResourceHandle value, $Res Function(ResourceHandle) _then) = _$ResourceHandleCopyWithImpl;
@useResult
$Res call({
 ResourceKey resourceKey, String handleId, int refCount
});


$ResourceKeyCopyWith<$Res> get resourceKey;

}
/// @nodoc
class _$ResourceHandleCopyWithImpl<$Res>
    implements $ResourceHandleCopyWith<$Res> {
  _$ResourceHandleCopyWithImpl(this._self, this._then);

  final ResourceHandle _self;
  final $Res Function(ResourceHandle) _then;

/// Create a copy of ResourceHandle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? resourceKey = null,Object? handleId = null,Object? refCount = null,}) {
  return _then(_self.copyWith(
resourceKey: null == resourceKey ? _self.resourceKey : resourceKey // ignore: cast_nullable_to_non_nullable
as ResourceKey,handleId: null == handleId ? _self.handleId : handleId // ignore: cast_nullable_to_non_nullable
as String,refCount: null == refCount ? _self.refCount : refCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of ResourceHandle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResourceKeyCopyWith<$Res> get resourceKey {
  
  return $ResourceKeyCopyWith<$Res>(_self.resourceKey, (value) {
    return _then(_self.copyWith(resourceKey: value));
  });
}
}


/// Adds pattern-matching-related methods to [ResourceHandle].
extension ResourceHandlePatterns on ResourceHandle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResourceHandle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResourceHandle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResourceHandle value)  $default,){
final _that = this;
switch (_that) {
case _ResourceHandle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResourceHandle value)?  $default,){
final _that = this;
switch (_that) {
case _ResourceHandle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ResourceKey resourceKey,  String handleId,  int refCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResourceHandle() when $default != null:
return $default(_that.resourceKey,_that.handleId,_that.refCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ResourceKey resourceKey,  String handleId,  int refCount)  $default,) {final _that = this;
switch (_that) {
case _ResourceHandle():
return $default(_that.resourceKey,_that.handleId,_that.refCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ResourceKey resourceKey,  String handleId,  int refCount)?  $default,) {final _that = this;
switch (_that) {
case _ResourceHandle() when $default != null:
return $default(_that.resourceKey,_that.handleId,_that.refCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResourceHandle implements ResourceHandle {
  const _ResourceHandle({required this.resourceKey, required this.handleId, this.refCount = 1});
  factory _ResourceHandle.fromJson(Map<String, dynamic> json) => _$ResourceHandleFromJson(json);

@override final  ResourceKey resourceKey;
/// Backend-issued opaque reference (never a device object).
@override final  String handleId;
/// Reference count across render objects (content-addressed dedup).
@override@JsonKey() final  int refCount;

/// Create a copy of ResourceHandle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResourceHandleCopyWith<_ResourceHandle> get copyWith => __$ResourceHandleCopyWithImpl<_ResourceHandle>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResourceHandleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResourceHandle&&(identical(other.resourceKey, resourceKey) || other.resourceKey == resourceKey)&&(identical(other.handleId, handleId) || other.handleId == handleId)&&(identical(other.refCount, refCount) || other.refCount == refCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,resourceKey,handleId,refCount);

@override
String toString() {
  return 'ResourceHandle(resourceKey: $resourceKey, handleId: $handleId, refCount: $refCount)';
}


}

/// @nodoc
abstract mixin class _$ResourceHandleCopyWith<$Res> implements $ResourceHandleCopyWith<$Res> {
  factory _$ResourceHandleCopyWith(_ResourceHandle value, $Res Function(_ResourceHandle) _then) = __$ResourceHandleCopyWithImpl;
@override @useResult
$Res call({
 ResourceKey resourceKey, String handleId, int refCount
});


@override $ResourceKeyCopyWith<$Res> get resourceKey;

}
/// @nodoc
class __$ResourceHandleCopyWithImpl<$Res>
    implements _$ResourceHandleCopyWith<$Res> {
  __$ResourceHandleCopyWithImpl(this._self, this._then);

  final _ResourceHandle _self;
  final $Res Function(_ResourceHandle) _then;

/// Create a copy of ResourceHandle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? resourceKey = null,Object? handleId = null,Object? refCount = null,}) {
  return _then(_ResourceHandle(
resourceKey: null == resourceKey ? _self.resourceKey : resourceKey // ignore: cast_nullable_to_non_nullable
as ResourceKey,handleId: null == handleId ? _self.handleId : handleId // ignore: cast_nullable_to_non_nullable
as String,refCount: null == refCount ? _self.refCount : refCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of ResourceHandle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResourceKeyCopyWith<$Res> get resourceKey {
  
  return $ResourceKeyCopyWith<$Res>(_self.resourceKey, (value) {
    return _then(_self.copyWith(resourceKey: value));
  });
}
}

// dart format on
