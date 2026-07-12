// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'febric_asset.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FebricAsset {

/// Stable UUID — the single identity shared with every registry that
/// references this asset.
 String get id; String get name;@JsonKey(fromJson: _typeFromJson, toJson: _typeToJson) AssetType get type;@JsonKey(fromJson: _originFromJson, toJson: _originToJson) AssetOrigin get origin;/// IANA media type (`image/png`, `font/ttf`, …).
 String get mimeType;/// Current content hash (`sha256:<hex>`) — the address of the latest
/// version's bytes in the content store.
 String get hash;/// Pixel dimensions — required for raster types, absent otherwise.
 int? get width; int? get height;/// Native resolution (dots per inch) for print-fidelity checks.
 double? get dpi;@JsonKey(fromJson: _colourSpaceFromJson, toJson: _colourSpaceToJson) AssetColourSpace? get colourSpace; DateTime get createdAt; DateTime get modifiedAt;/// Current version number (== `versions.last.version`).
 int get version;/// Full immutable lineage, oldest first, INCLUDING the current
/// version. Never truncated, never rewritten.
 List<AssetVersionRecord> get versions; List<String> get tags;/// Open metadata for milestone-specific payloads (palette signatures,
/// embeddings pointers, plugin annotations).
 Map<String, Object?> get metadata;
/// Create a copy of FebricAsset
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FebricAssetCopyWith<FebricAsset> get copyWith => _$FebricAssetCopyWithImpl<FebricAsset>(this as FebricAsset, _$identity);

  /// Serializes this FebricAsset to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FebricAsset&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.dpi, dpi) || other.dpi == dpi)&&(identical(other.colourSpace, colourSpace) || other.colourSpace == colourSpace)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.modifiedAt, modifiedAt) || other.modifiedAt == modifiedAt)&&(identical(other.version, version) || other.version == version)&&const DeepCollectionEquality().equals(other.versions, versions)&&const DeepCollectionEquality().equals(other.tags, tags)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,origin,mimeType,hash,width,height,dpi,colourSpace,createdAt,modifiedAt,version,const DeepCollectionEquality().hash(versions),const DeepCollectionEquality().hash(tags),const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'FebricAsset(id: $id, name: $name, type: $type, origin: $origin, mimeType: $mimeType, hash: $hash, width: $width, height: $height, dpi: $dpi, colourSpace: $colourSpace, createdAt: $createdAt, modifiedAt: $modifiedAt, version: $version, versions: $versions, tags: $tags, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $FebricAssetCopyWith<$Res>  {
  factory $FebricAssetCopyWith(FebricAsset value, $Res Function(FebricAsset) _then) = _$FebricAssetCopyWithImpl;
@useResult
$Res call({
 String id, String name,@JsonKey(fromJson: _typeFromJson, toJson: _typeToJson) AssetType type,@JsonKey(fromJson: _originFromJson, toJson: _originToJson) AssetOrigin origin, String mimeType, String hash, int? width, int? height, double? dpi,@JsonKey(fromJson: _colourSpaceFromJson, toJson: _colourSpaceToJson) AssetColourSpace? colourSpace, DateTime createdAt, DateTime modifiedAt, int version, List<AssetVersionRecord> versions, List<String> tags, Map<String, Object?> metadata
});




}
/// @nodoc
class _$FebricAssetCopyWithImpl<$Res>
    implements $FebricAssetCopyWith<$Res> {
  _$FebricAssetCopyWithImpl(this._self, this._then);

  final FebricAsset _self;
  final $Res Function(FebricAsset) _then;

/// Create a copy of FebricAsset
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? type = null,Object? origin = null,Object? mimeType = null,Object? hash = null,Object? width = freezed,Object? height = freezed,Object? dpi = freezed,Object? colourSpace = freezed,Object? createdAt = null,Object? modifiedAt = null,Object? version = null,Object? versions = null,Object? tags = null,Object? metadata = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AssetType,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as AssetOrigin,mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,hash: null == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int?,dpi: freezed == dpi ? _self.dpi : dpi // ignore: cast_nullable_to_non_nullable
as double?,colourSpace: freezed == colourSpace ? _self.colourSpace : colourSpace // ignore: cast_nullable_to_non_nullable
as AssetColourSpace?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,modifiedAt: null == modifiedAt ? _self.modifiedAt : modifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,versions: null == versions ? _self.versions : versions // ignore: cast_nullable_to_non_nullable
as List<AssetVersionRecord>,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

}


/// Adds pattern-matching-related methods to [FebricAsset].
extension FebricAssetPatterns on FebricAsset {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FebricAsset value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FebricAsset() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FebricAsset value)  $default,){
final _that = this;
switch (_that) {
case _FebricAsset():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FebricAsset value)?  $default,){
final _that = this;
switch (_that) {
case _FebricAsset() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(fromJson: _typeFromJson, toJson: _typeToJson)  AssetType type, @JsonKey(fromJson: _originFromJson, toJson: _originToJson)  AssetOrigin origin,  String mimeType,  String hash,  int? width,  int? height,  double? dpi, @JsonKey(fromJson: _colourSpaceFromJson, toJson: _colourSpaceToJson)  AssetColourSpace? colourSpace,  DateTime createdAt,  DateTime modifiedAt,  int version,  List<AssetVersionRecord> versions,  List<String> tags,  Map<String, Object?> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FebricAsset() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.origin,_that.mimeType,_that.hash,_that.width,_that.height,_that.dpi,_that.colourSpace,_that.createdAt,_that.modifiedAt,_that.version,_that.versions,_that.tags,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(fromJson: _typeFromJson, toJson: _typeToJson)  AssetType type, @JsonKey(fromJson: _originFromJson, toJson: _originToJson)  AssetOrigin origin,  String mimeType,  String hash,  int? width,  int? height,  double? dpi, @JsonKey(fromJson: _colourSpaceFromJson, toJson: _colourSpaceToJson)  AssetColourSpace? colourSpace,  DateTime createdAt,  DateTime modifiedAt,  int version,  List<AssetVersionRecord> versions,  List<String> tags,  Map<String, Object?> metadata)  $default,) {final _that = this;
switch (_that) {
case _FebricAsset():
return $default(_that.id,_that.name,_that.type,_that.origin,_that.mimeType,_that.hash,_that.width,_that.height,_that.dpi,_that.colourSpace,_that.createdAt,_that.modifiedAt,_that.version,_that.versions,_that.tags,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name, @JsonKey(fromJson: _typeFromJson, toJson: _typeToJson)  AssetType type, @JsonKey(fromJson: _originFromJson, toJson: _originToJson)  AssetOrigin origin,  String mimeType,  String hash,  int? width,  int? height,  double? dpi, @JsonKey(fromJson: _colourSpaceFromJson, toJson: _colourSpaceToJson)  AssetColourSpace? colourSpace,  DateTime createdAt,  DateTime modifiedAt,  int version,  List<AssetVersionRecord> versions,  List<String> tags,  Map<String, Object?> metadata)?  $default,) {final _that = this;
switch (_that) {
case _FebricAsset() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.origin,_that.mimeType,_that.hash,_that.width,_that.height,_that.dpi,_that.colourSpace,_that.createdAt,_that.modifiedAt,_that.version,_that.versions,_that.tags,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FebricAsset extends FebricAsset {
  const _FebricAsset({required this.id, required this.name, @JsonKey(fromJson: _typeFromJson, toJson: _typeToJson) required this.type, @JsonKey(fromJson: _originFromJson, toJson: _originToJson) required this.origin, required this.mimeType, required this.hash, this.width, this.height, this.dpi, @JsonKey(fromJson: _colourSpaceFromJson, toJson: _colourSpaceToJson) this.colourSpace, required this.createdAt, required this.modifiedAt, this.version = 1, final  List<AssetVersionRecord> versions = const <AssetVersionRecord>[], final  List<String> tags = const <String>[], final  Map<String, Object?> metadata = const <String, Object?>{}}): _versions = versions,_tags = tags,_metadata = metadata,super._();
  factory _FebricAsset.fromJson(Map<String, dynamic> json) => _$FebricAssetFromJson(json);

/// Stable UUID — the single identity shared with every registry that
/// references this asset.
@override final  String id;
@override final  String name;
@override@JsonKey(fromJson: _typeFromJson, toJson: _typeToJson) final  AssetType type;
@override@JsonKey(fromJson: _originFromJson, toJson: _originToJson) final  AssetOrigin origin;
/// IANA media type (`image/png`, `font/ttf`, …).
@override final  String mimeType;
/// Current content hash (`sha256:<hex>`) — the address of the latest
/// version's bytes in the content store.
@override final  String hash;
/// Pixel dimensions — required for raster types, absent otherwise.
@override final  int? width;
@override final  int? height;
/// Native resolution (dots per inch) for print-fidelity checks.
@override final  double? dpi;
@override@JsonKey(fromJson: _colourSpaceFromJson, toJson: _colourSpaceToJson) final  AssetColourSpace? colourSpace;
@override final  DateTime createdAt;
@override final  DateTime modifiedAt;
/// Current version number (== `versions.last.version`).
@override@JsonKey() final  int version;
/// Full immutable lineage, oldest first, INCLUDING the current
/// version. Never truncated, never rewritten.
 final  List<AssetVersionRecord> _versions;
/// Full immutable lineage, oldest first, INCLUDING the current
/// version. Never truncated, never rewritten.
@override@JsonKey() List<AssetVersionRecord> get versions {
  if (_versions is EqualUnmodifiableListView) return _versions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_versions);
}

 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

/// Open metadata for milestone-specific payloads (palette signatures,
/// embeddings pointers, plugin annotations).
 final  Map<String, Object?> _metadata;
/// Open metadata for milestone-specific payloads (palette signatures,
/// embeddings pointers, plugin annotations).
@override@JsonKey() Map<String, Object?> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of FebricAsset
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FebricAssetCopyWith<_FebricAsset> get copyWith => __$FebricAssetCopyWithImpl<_FebricAsset>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FebricAssetToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FebricAsset&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.dpi, dpi) || other.dpi == dpi)&&(identical(other.colourSpace, colourSpace) || other.colourSpace == colourSpace)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.modifiedAt, modifiedAt) || other.modifiedAt == modifiedAt)&&(identical(other.version, version) || other.version == version)&&const DeepCollectionEquality().equals(other._versions, _versions)&&const DeepCollectionEquality().equals(other._tags, _tags)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,origin,mimeType,hash,width,height,dpi,colourSpace,createdAt,modifiedAt,version,const DeepCollectionEquality().hash(_versions),const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'FebricAsset(id: $id, name: $name, type: $type, origin: $origin, mimeType: $mimeType, hash: $hash, width: $width, height: $height, dpi: $dpi, colourSpace: $colourSpace, createdAt: $createdAt, modifiedAt: $modifiedAt, version: $version, versions: $versions, tags: $tags, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$FebricAssetCopyWith<$Res> implements $FebricAssetCopyWith<$Res> {
  factory _$FebricAssetCopyWith(_FebricAsset value, $Res Function(_FebricAsset) _then) = __$FebricAssetCopyWithImpl;
@override @useResult
$Res call({
 String id, String name,@JsonKey(fromJson: _typeFromJson, toJson: _typeToJson) AssetType type,@JsonKey(fromJson: _originFromJson, toJson: _originToJson) AssetOrigin origin, String mimeType, String hash, int? width, int? height, double? dpi,@JsonKey(fromJson: _colourSpaceFromJson, toJson: _colourSpaceToJson) AssetColourSpace? colourSpace, DateTime createdAt, DateTime modifiedAt, int version, List<AssetVersionRecord> versions, List<String> tags, Map<String, Object?> metadata
});




}
/// @nodoc
class __$FebricAssetCopyWithImpl<$Res>
    implements _$FebricAssetCopyWith<$Res> {
  __$FebricAssetCopyWithImpl(this._self, this._then);

  final _FebricAsset _self;
  final $Res Function(_FebricAsset) _then;

/// Create a copy of FebricAsset
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? type = null,Object? origin = null,Object? mimeType = null,Object? hash = null,Object? width = freezed,Object? height = freezed,Object? dpi = freezed,Object? colourSpace = freezed,Object? createdAt = null,Object? modifiedAt = null,Object? version = null,Object? versions = null,Object? tags = null,Object? metadata = null,}) {
  return _then(_FebricAsset(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AssetType,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as AssetOrigin,mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,hash: null == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int?,dpi: freezed == dpi ? _self.dpi : dpi // ignore: cast_nullable_to_non_nullable
as double?,colourSpace: freezed == colourSpace ? _self.colourSpace : colourSpace // ignore: cast_nullable_to_non_nullable
as AssetColourSpace?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,modifiedAt: null == modifiedAt ? _self.modifiedAt : modifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,versions: null == versions ? _self._versions : versions // ignore: cast_nullable_to_non_nullable
as List<AssetVersionRecord>,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}

// dart format on
