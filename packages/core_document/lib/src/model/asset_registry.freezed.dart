// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asset_registry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AssetRecord {

/// Stable UUID.
 String get id; String get name; AssetKind get kind; AssetSource get source;/// Content hash (integrity + dedup key into the asset store).
 String get hash; String? get mimeType; List<String> get tags;/// Ids of layers/nodes that reference this asset.
 List<String> get usageRefs; Map<String, Object?> get metadata;
/// Create a copy of AssetRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssetRecordCopyWith<AssetRecord> get copyWith => _$AssetRecordCopyWithImpl<AssetRecord>(this as AssetRecord, _$identity);

  /// Serializes this AssetRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssetRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.source, source) || other.source == source)&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&const DeepCollectionEquality().equals(other.tags, tags)&&const DeepCollectionEquality().equals(other.usageRefs, usageRefs)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,kind,source,hash,mimeType,const DeepCollectionEquality().hash(tags),const DeepCollectionEquality().hash(usageRefs),const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'AssetRecord(id: $id, name: $name, kind: $kind, source: $source, hash: $hash, mimeType: $mimeType, tags: $tags, usageRefs: $usageRefs, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $AssetRecordCopyWith<$Res>  {
  factory $AssetRecordCopyWith(AssetRecord value, $Res Function(AssetRecord) _then) = _$AssetRecordCopyWithImpl;
@useResult
$Res call({
 String id, String name, AssetKind kind, AssetSource source, String hash, String? mimeType, List<String> tags, List<String> usageRefs, Map<String, Object?> metadata
});




}
/// @nodoc
class _$AssetRecordCopyWithImpl<$Res>
    implements $AssetRecordCopyWith<$Res> {
  _$AssetRecordCopyWithImpl(this._self, this._then);

  final AssetRecord _self;
  final $Res Function(AssetRecord) _then;

/// Create a copy of AssetRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? kind = null,Object? source = null,Object? hash = null,Object? mimeType = freezed,Object? tags = null,Object? usageRefs = null,Object? metadata = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as AssetKind,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as AssetSource,hash: null == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String,mimeType: freezed == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String?,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,usageRefs: null == usageRefs ? _self.usageRefs : usageRefs // ignore: cast_nullable_to_non_nullable
as List<String>,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

}


/// Adds pattern-matching-related methods to [AssetRecord].
extension AssetRecordPatterns on AssetRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AssetRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AssetRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AssetRecord value)  $default,){
final _that = this;
switch (_that) {
case _AssetRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AssetRecord value)?  $default,){
final _that = this;
switch (_that) {
case _AssetRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  AssetKind kind,  AssetSource source,  String hash,  String? mimeType,  List<String> tags,  List<String> usageRefs,  Map<String, Object?> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AssetRecord() when $default != null:
return $default(_that.id,_that.name,_that.kind,_that.source,_that.hash,_that.mimeType,_that.tags,_that.usageRefs,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  AssetKind kind,  AssetSource source,  String hash,  String? mimeType,  List<String> tags,  List<String> usageRefs,  Map<String, Object?> metadata)  $default,) {final _that = this;
switch (_that) {
case _AssetRecord():
return $default(_that.id,_that.name,_that.kind,_that.source,_that.hash,_that.mimeType,_that.tags,_that.usageRefs,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  AssetKind kind,  AssetSource source,  String hash,  String? mimeType,  List<String> tags,  List<String> usageRefs,  Map<String, Object?> metadata)?  $default,) {final _that = this;
switch (_that) {
case _AssetRecord() when $default != null:
return $default(_that.id,_that.name,_that.kind,_that.source,_that.hash,_that.mimeType,_that.tags,_that.usageRefs,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AssetRecord implements AssetRecord {
  const _AssetRecord({required this.id, required this.name, required this.kind, required this.source, required this.hash, this.mimeType, final  List<String> tags = const <String>[], final  List<String> usageRefs = const <String>[], final  Map<String, Object?> metadata = const <String, Object?>{}}): _tags = tags,_usageRefs = usageRefs,_metadata = metadata;
  factory _AssetRecord.fromJson(Map<String, dynamic> json) => _$AssetRecordFromJson(json);

/// Stable UUID.
@override final  String id;
@override final  String name;
@override final  AssetKind kind;
@override final  AssetSource source;
/// Content hash (integrity + dedup key into the asset store).
@override final  String hash;
@override final  String? mimeType;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

/// Ids of layers/nodes that reference this asset.
 final  List<String> _usageRefs;
/// Ids of layers/nodes that reference this asset.
@override@JsonKey() List<String> get usageRefs {
  if (_usageRefs is EqualUnmodifiableListView) return _usageRefs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_usageRefs);
}

 final  Map<String, Object?> _metadata;
@override@JsonKey() Map<String, Object?> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of AssetRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssetRecordCopyWith<_AssetRecord> get copyWith => __$AssetRecordCopyWithImpl<_AssetRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssetRecordToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssetRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.source, source) || other.source == source)&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&const DeepCollectionEquality().equals(other._tags, _tags)&&const DeepCollectionEquality().equals(other._usageRefs, _usageRefs)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,kind,source,hash,mimeType,const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_usageRefs),const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'AssetRecord(id: $id, name: $name, kind: $kind, source: $source, hash: $hash, mimeType: $mimeType, tags: $tags, usageRefs: $usageRefs, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$AssetRecordCopyWith<$Res> implements $AssetRecordCopyWith<$Res> {
  factory _$AssetRecordCopyWith(_AssetRecord value, $Res Function(_AssetRecord) _then) = __$AssetRecordCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, AssetKind kind, AssetSource source, String hash, String? mimeType, List<String> tags, List<String> usageRefs, Map<String, Object?> metadata
});




}
/// @nodoc
class __$AssetRecordCopyWithImpl<$Res>
    implements _$AssetRecordCopyWith<$Res> {
  __$AssetRecordCopyWithImpl(this._self, this._then);

  final _AssetRecord _self;
  final $Res Function(_AssetRecord) _then;

/// Create a copy of AssetRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? kind = null,Object? source = null,Object? hash = null,Object? mimeType = freezed,Object? tags = null,Object? usageRefs = null,Object? metadata = null,}) {
  return _then(_AssetRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as AssetKind,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as AssetSource,hash: null == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String,mimeType: freezed == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String?,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,usageRefs: null == usageRefs ? _self._usageRefs : usageRefs // ignore: cast_nullable_to_non_nullable
as List<String>,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}


/// @nodoc
mixin _$AssetRegistry {

 Map<String, AssetRecord> get assets;
/// Create a copy of AssetRegistry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssetRegistryCopyWith<AssetRegistry> get copyWith => _$AssetRegistryCopyWithImpl<AssetRegistry>(this as AssetRegistry, _$identity);

  /// Serializes this AssetRegistry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssetRegistry&&const DeepCollectionEquality().equals(other.assets, assets));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(assets));

@override
String toString() {
  return 'AssetRegistry(assets: $assets)';
}


}

/// @nodoc
abstract mixin class $AssetRegistryCopyWith<$Res>  {
  factory $AssetRegistryCopyWith(AssetRegistry value, $Res Function(AssetRegistry) _then) = _$AssetRegistryCopyWithImpl;
@useResult
$Res call({
 Map<String, AssetRecord> assets
});




}
/// @nodoc
class _$AssetRegistryCopyWithImpl<$Res>
    implements $AssetRegistryCopyWith<$Res> {
  _$AssetRegistryCopyWithImpl(this._self, this._then);

  final AssetRegistry _self;
  final $Res Function(AssetRegistry) _then;

/// Create a copy of AssetRegistry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? assets = null,}) {
  return _then(_self.copyWith(
assets: null == assets ? _self.assets : assets // ignore: cast_nullable_to_non_nullable
as Map<String, AssetRecord>,
  ));
}

}


/// Adds pattern-matching-related methods to [AssetRegistry].
extension AssetRegistryPatterns on AssetRegistry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AssetRegistry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AssetRegistry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AssetRegistry value)  $default,){
final _that = this;
switch (_that) {
case _AssetRegistry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AssetRegistry value)?  $default,){
final _that = this;
switch (_that) {
case _AssetRegistry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, AssetRecord> assets)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AssetRegistry() when $default != null:
return $default(_that.assets);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, AssetRecord> assets)  $default,) {final _that = this;
switch (_that) {
case _AssetRegistry():
return $default(_that.assets);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, AssetRecord> assets)?  $default,) {final _that = this;
switch (_that) {
case _AssetRegistry() when $default != null:
return $default(_that.assets);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AssetRegistry extends AssetRegistry {
  const _AssetRegistry({final  Map<String, AssetRecord> assets = const <String, AssetRecord>{}}): _assets = assets,super._();
  factory _AssetRegistry.fromJson(Map<String, dynamic> json) => _$AssetRegistryFromJson(json);

 final  Map<String, AssetRecord> _assets;
@override@JsonKey() Map<String, AssetRecord> get assets {
  if (_assets is EqualUnmodifiableMapView) return _assets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_assets);
}


/// Create a copy of AssetRegistry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssetRegistryCopyWith<_AssetRegistry> get copyWith => __$AssetRegistryCopyWithImpl<_AssetRegistry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssetRegistryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssetRegistry&&const DeepCollectionEquality().equals(other._assets, _assets));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_assets));

@override
String toString() {
  return 'AssetRegistry(assets: $assets)';
}


}

/// @nodoc
abstract mixin class _$AssetRegistryCopyWith<$Res> implements $AssetRegistryCopyWith<$Res> {
  factory _$AssetRegistryCopyWith(_AssetRegistry value, $Res Function(_AssetRegistry) _then) = __$AssetRegistryCopyWithImpl;
@override @useResult
$Res call({
 Map<String, AssetRecord> assets
});




}
/// @nodoc
class __$AssetRegistryCopyWithImpl<$Res>
    implements _$AssetRegistryCopyWith<$Res> {
  __$AssetRegistryCopyWithImpl(this._self, this._then);

  final _AssetRegistry _self;
  final $Res Function(_AssetRegistry) _then;

/// Create a copy of AssetRegistry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? assets = null,}) {
  return _then(_AssetRegistry(
assets: null == assets ? _self._assets : assets // ignore: cast_nullable_to_non_nullable
as Map<String, AssetRecord>,
  ));
}


}

// dart format on
