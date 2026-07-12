// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'document_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DocumentMetadata {

 String get title; String? get description; String? get author; DateTime get createdAt; DateTime get modifiedAt; List<String> get tags;
/// Create a copy of DocumentMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocumentMetadataCopyWith<DocumentMetadata> get copyWith => _$DocumentMetadataCopyWithImpl<DocumentMetadata>(this as DocumentMetadata, _$identity);

  /// Serializes this DocumentMetadata to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentMetadata&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.author, author) || other.author == author)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.modifiedAt, modifiedAt) || other.modifiedAt == modifiedAt)&&const DeepCollectionEquality().equals(other.tags, tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,author,createdAt,modifiedAt,const DeepCollectionEquality().hash(tags));

@override
String toString() {
  return 'DocumentMetadata(title: $title, description: $description, author: $author, createdAt: $createdAt, modifiedAt: $modifiedAt, tags: $tags)';
}


}

/// @nodoc
abstract mixin class $DocumentMetadataCopyWith<$Res>  {
  factory $DocumentMetadataCopyWith(DocumentMetadata value, $Res Function(DocumentMetadata) _then) = _$DocumentMetadataCopyWithImpl;
@useResult
$Res call({
 String title, String? description, String? author, DateTime createdAt, DateTime modifiedAt, List<String> tags
});




}
/// @nodoc
class _$DocumentMetadataCopyWithImpl<$Res>
    implements $DocumentMetadataCopyWith<$Res> {
  _$DocumentMetadataCopyWithImpl(this._self, this._then);

  final DocumentMetadata _self;
  final $Res Function(DocumentMetadata) _then;

/// Create a copy of DocumentMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? description = freezed,Object? author = freezed,Object? createdAt = null,Object? modifiedAt = null,Object? tags = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,modifiedAt: null == modifiedAt ? _self.modifiedAt : modifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [DocumentMetadata].
extension DocumentMetadataPatterns on DocumentMetadata {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DocumentMetadata value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DocumentMetadata() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DocumentMetadata value)  $default,){
final _that = this;
switch (_that) {
case _DocumentMetadata():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DocumentMetadata value)?  $default,){
final _that = this;
switch (_that) {
case _DocumentMetadata() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String? description,  String? author,  DateTime createdAt,  DateTime modifiedAt,  List<String> tags)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DocumentMetadata() when $default != null:
return $default(_that.title,_that.description,_that.author,_that.createdAt,_that.modifiedAt,_that.tags);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String? description,  String? author,  DateTime createdAt,  DateTime modifiedAt,  List<String> tags)  $default,) {final _that = this;
switch (_that) {
case _DocumentMetadata():
return $default(_that.title,_that.description,_that.author,_that.createdAt,_that.modifiedAt,_that.tags);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String? description,  String? author,  DateTime createdAt,  DateTime modifiedAt,  List<String> tags)?  $default,) {final _that = this;
switch (_that) {
case _DocumentMetadata() when $default != null:
return $default(_that.title,_that.description,_that.author,_that.createdAt,_that.modifiedAt,_that.tags);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DocumentMetadata implements DocumentMetadata {
  const _DocumentMetadata({required this.title, this.description, this.author, required this.createdAt, required this.modifiedAt, final  List<String> tags = const <String>[]}): _tags = tags;
  factory _DocumentMetadata.fromJson(Map<String, dynamic> json) => _$DocumentMetadataFromJson(json);

@override final  String title;
@override final  String? description;
@override final  String? author;
@override final  DateTime createdAt;
@override final  DateTime modifiedAt;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}


/// Create a copy of DocumentMetadata
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DocumentMetadataCopyWith<_DocumentMetadata> get copyWith => __$DocumentMetadataCopyWithImpl<_DocumentMetadata>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DocumentMetadataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DocumentMetadata&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.author, author) || other.author == author)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.modifiedAt, modifiedAt) || other.modifiedAt == modifiedAt)&&const DeepCollectionEquality().equals(other._tags, _tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,author,createdAt,modifiedAt,const DeepCollectionEquality().hash(_tags));

@override
String toString() {
  return 'DocumentMetadata(title: $title, description: $description, author: $author, createdAt: $createdAt, modifiedAt: $modifiedAt, tags: $tags)';
}


}

/// @nodoc
abstract mixin class _$DocumentMetadataCopyWith<$Res> implements $DocumentMetadataCopyWith<$Res> {
  factory _$DocumentMetadataCopyWith(_DocumentMetadata value, $Res Function(_DocumentMetadata) _then) = __$DocumentMetadataCopyWithImpl;
@override @useResult
$Res call({
 String title, String? description, String? author, DateTime createdAt, DateTime modifiedAt, List<String> tags
});




}
/// @nodoc
class __$DocumentMetadataCopyWithImpl<$Res>
    implements _$DocumentMetadataCopyWith<$Res> {
  __$DocumentMetadataCopyWithImpl(this._self, this._then);

  final _DocumentMetadata _self;
  final $Res Function(_DocumentMetadata) _then;

/// Create a copy of DocumentMetadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = freezed,Object? author = freezed,Object? createdAt = null,Object? modifiedAt = null,Object? tags = null,}) {
  return _then(_DocumentMetadata(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,modifiedAt: null == modifiedAt ? _self.modifiedAt : modifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$DocumentVersion {

/// Monotonic `.febric` schema version; migrations step through it.
 int get schema;/// FEBRIC application version that last wrote the document.
 String get generator;
/// Create a copy of DocumentVersion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocumentVersionCopyWith<DocumentVersion> get copyWith => _$DocumentVersionCopyWithImpl<DocumentVersion>(this as DocumentVersion, _$identity);

  /// Serializes this DocumentVersion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentVersion&&(identical(other.schema, schema) || other.schema == schema)&&(identical(other.generator, generator) || other.generator == generator));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schema,generator);

@override
String toString() {
  return 'DocumentVersion(schema: $schema, generator: $generator)';
}


}

/// @nodoc
abstract mixin class $DocumentVersionCopyWith<$Res>  {
  factory $DocumentVersionCopyWith(DocumentVersion value, $Res Function(DocumentVersion) _then) = _$DocumentVersionCopyWithImpl;
@useResult
$Res call({
 int schema, String generator
});




}
/// @nodoc
class _$DocumentVersionCopyWithImpl<$Res>
    implements $DocumentVersionCopyWith<$Res> {
  _$DocumentVersionCopyWithImpl(this._self, this._then);

  final DocumentVersion _self;
  final $Res Function(DocumentVersion) _then;

/// Create a copy of DocumentVersion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schema = null,Object? generator = null,}) {
  return _then(_self.copyWith(
schema: null == schema ? _self.schema : schema // ignore: cast_nullable_to_non_nullable
as int,generator: null == generator ? _self.generator : generator // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DocumentVersion].
extension DocumentVersionPatterns on DocumentVersion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DocumentVersion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DocumentVersion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DocumentVersion value)  $default,){
final _that = this;
switch (_that) {
case _DocumentVersion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DocumentVersion value)?  $default,){
final _that = this;
switch (_that) {
case _DocumentVersion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int schema,  String generator)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DocumentVersion() when $default != null:
return $default(_that.schema,_that.generator);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int schema,  String generator)  $default,) {final _that = this;
switch (_that) {
case _DocumentVersion():
return $default(_that.schema,_that.generator);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int schema,  String generator)?  $default,) {final _that = this;
switch (_that) {
case _DocumentVersion() when $default != null:
return $default(_that.schema,_that.generator);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DocumentVersion extends DocumentVersion {
  const _DocumentVersion({required this.schema, required this.generator}): super._();
  factory _DocumentVersion.fromJson(Map<String, dynamic> json) => _$DocumentVersionFromJson(json);

/// Monotonic `.febric` schema version; migrations step through it.
@override final  int schema;
/// FEBRIC application version that last wrote the document.
@override final  String generator;

/// Create a copy of DocumentVersion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DocumentVersionCopyWith<_DocumentVersion> get copyWith => __$DocumentVersionCopyWithImpl<_DocumentVersion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DocumentVersionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DocumentVersion&&(identical(other.schema, schema) || other.schema == schema)&&(identical(other.generator, generator) || other.generator == generator));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schema,generator);

@override
String toString() {
  return 'DocumentVersion(schema: $schema, generator: $generator)';
}


}

/// @nodoc
abstract mixin class _$DocumentVersionCopyWith<$Res> implements $DocumentVersionCopyWith<$Res> {
  factory _$DocumentVersionCopyWith(_DocumentVersion value, $Res Function(_DocumentVersion) _then) = __$DocumentVersionCopyWithImpl;
@override @useResult
$Res call({
 int schema, String generator
});




}
/// @nodoc
class __$DocumentVersionCopyWithImpl<$Res>
    implements _$DocumentVersionCopyWith<$Res> {
  __$DocumentVersionCopyWithImpl(this._self, this._then);

  final _DocumentVersion _self;
  final $Res Function(_DocumentVersion) _then;

/// Create a copy of DocumentVersion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schema = null,Object? generator = null,}) {
  return _then(_DocumentVersion(
schema: null == schema ? _self.schema : schema // ignore: cast_nullable_to_non_nullable
as int,generator: null == generator ? _self.generator : generator // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$DocumentManifest {

/// Frozen format name.
 String get format; DocumentVersion get version;
/// Create a copy of DocumentManifest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocumentManifestCopyWith<DocumentManifest> get copyWith => _$DocumentManifestCopyWithImpl<DocumentManifest>(this as DocumentManifest, _$identity);

  /// Serializes this DocumentManifest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentManifest&&(identical(other.format, format) || other.format == format)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,format,version);

@override
String toString() {
  return 'DocumentManifest(format: $format, version: $version)';
}


}

/// @nodoc
abstract mixin class $DocumentManifestCopyWith<$Res>  {
  factory $DocumentManifestCopyWith(DocumentManifest value, $Res Function(DocumentManifest) _then) = _$DocumentManifestCopyWithImpl;
@useResult
$Res call({
 String format, DocumentVersion version
});


$DocumentVersionCopyWith<$Res> get version;

}
/// @nodoc
class _$DocumentManifestCopyWithImpl<$Res>
    implements $DocumentManifestCopyWith<$Res> {
  _$DocumentManifestCopyWithImpl(this._self, this._then);

  final DocumentManifest _self;
  final $Res Function(DocumentManifest) _then;

/// Create a copy of DocumentManifest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? format = null,Object? version = null,}) {
  return _then(_self.copyWith(
format: null == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as DocumentVersion,
  ));
}
/// Create a copy of DocumentManifest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentVersionCopyWith<$Res> get version {
  
  return $DocumentVersionCopyWith<$Res>(_self.version, (value) {
    return _then(_self.copyWith(version: value));
  });
}
}


/// Adds pattern-matching-related methods to [DocumentManifest].
extension DocumentManifestPatterns on DocumentManifest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DocumentManifest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DocumentManifest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DocumentManifest value)  $default,){
final _that = this;
switch (_that) {
case _DocumentManifest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DocumentManifest value)?  $default,){
final _that = this;
switch (_that) {
case _DocumentManifest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String format,  DocumentVersion version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DocumentManifest() when $default != null:
return $default(_that.format,_that.version);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String format,  DocumentVersion version)  $default,) {final _that = this;
switch (_that) {
case _DocumentManifest():
return $default(_that.format,_that.version);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String format,  DocumentVersion version)?  $default,) {final _that = this;
switch (_that) {
case _DocumentManifest() when $default != null:
return $default(_that.format,_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DocumentManifest extends DocumentManifest {
  const _DocumentManifest({this.format = DocumentManifest.formatName, required this.version}): super._();
  factory _DocumentManifest.fromJson(Map<String, dynamic> json) => _$DocumentManifestFromJson(json);

/// Frozen format name.
@override@JsonKey() final  String format;
@override final  DocumentVersion version;

/// Create a copy of DocumentManifest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DocumentManifestCopyWith<_DocumentManifest> get copyWith => __$DocumentManifestCopyWithImpl<_DocumentManifest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DocumentManifestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DocumentManifest&&(identical(other.format, format) || other.format == format)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,format,version);

@override
String toString() {
  return 'DocumentManifest(format: $format, version: $version)';
}


}

/// @nodoc
abstract mixin class _$DocumentManifestCopyWith<$Res> implements $DocumentManifestCopyWith<$Res> {
  factory _$DocumentManifestCopyWith(_DocumentManifest value, $Res Function(_DocumentManifest) _then) = __$DocumentManifestCopyWithImpl;
@override @useResult
$Res call({
 String format, DocumentVersion version
});


@override $DocumentVersionCopyWith<$Res> get version;

}
/// @nodoc
class __$DocumentManifestCopyWithImpl<$Res>
    implements _$DocumentManifestCopyWith<$Res> {
  __$DocumentManifestCopyWithImpl(this._self, this._then);

  final _DocumentManifest _self;
  final $Res Function(_DocumentManifest) _then;

/// Create a copy of DocumentManifest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? format = null,Object? version = null,}) {
  return _then(_DocumentManifest(
format: null == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as DocumentVersion,
  ));
}

/// Create a copy of DocumentManifest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentVersionCopyWith<$Res> get version {
  
  return $DocumentVersionCopyWith<$Res>(_self.version, (value) {
    return _then(_self.copyWith(version: value));
  });
}
}


/// @nodoc
mixin _$DocumentSettings {

@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) MeasurementUnit get defaultUnit; double get defaultDpi; int get autosaveIntervalSeconds; int get maxHistoryEntries; String? get activeColourProfileId;
/// Create a copy of DocumentSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocumentSettingsCopyWith<DocumentSettings> get copyWith => _$DocumentSettingsCopyWithImpl<DocumentSettings>(this as DocumentSettings, _$identity);

  /// Serializes this DocumentSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentSettings&&(identical(other.defaultUnit, defaultUnit) || other.defaultUnit == defaultUnit)&&(identical(other.defaultDpi, defaultDpi) || other.defaultDpi == defaultDpi)&&(identical(other.autosaveIntervalSeconds, autosaveIntervalSeconds) || other.autosaveIntervalSeconds == autosaveIntervalSeconds)&&(identical(other.maxHistoryEntries, maxHistoryEntries) || other.maxHistoryEntries == maxHistoryEntries)&&(identical(other.activeColourProfileId, activeColourProfileId) || other.activeColourProfileId == activeColourProfileId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,defaultUnit,defaultDpi,autosaveIntervalSeconds,maxHistoryEntries,activeColourProfileId);

@override
String toString() {
  return 'DocumentSettings(defaultUnit: $defaultUnit, defaultDpi: $defaultDpi, autosaveIntervalSeconds: $autosaveIntervalSeconds, maxHistoryEntries: $maxHistoryEntries, activeColourProfileId: $activeColourProfileId)';
}


}

/// @nodoc
abstract mixin class $DocumentSettingsCopyWith<$Res>  {
  factory $DocumentSettingsCopyWith(DocumentSettings value, $Res Function(DocumentSettings) _then) = _$DocumentSettingsCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) MeasurementUnit defaultUnit, double defaultDpi, int autosaveIntervalSeconds, int maxHistoryEntries, String? activeColourProfileId
});




}
/// @nodoc
class _$DocumentSettingsCopyWithImpl<$Res>
    implements $DocumentSettingsCopyWith<$Res> {
  _$DocumentSettingsCopyWithImpl(this._self, this._then);

  final DocumentSettings _self;
  final $Res Function(DocumentSettings) _then;

/// Create a copy of DocumentSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? defaultUnit = null,Object? defaultDpi = null,Object? autosaveIntervalSeconds = null,Object? maxHistoryEntries = null,Object? activeColourProfileId = freezed,}) {
  return _then(_self.copyWith(
defaultUnit: null == defaultUnit ? _self.defaultUnit : defaultUnit // ignore: cast_nullable_to_non_nullable
as MeasurementUnit,defaultDpi: null == defaultDpi ? _self.defaultDpi : defaultDpi // ignore: cast_nullable_to_non_nullable
as double,autosaveIntervalSeconds: null == autosaveIntervalSeconds ? _self.autosaveIntervalSeconds : autosaveIntervalSeconds // ignore: cast_nullable_to_non_nullable
as int,maxHistoryEntries: null == maxHistoryEntries ? _self.maxHistoryEntries : maxHistoryEntries // ignore: cast_nullable_to_non_nullable
as int,activeColourProfileId: freezed == activeColourProfileId ? _self.activeColourProfileId : activeColourProfileId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DocumentSettings].
extension DocumentSettingsPatterns on DocumentSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DocumentSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DocumentSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DocumentSettings value)  $default,){
final _that = this;
switch (_that) {
case _DocumentSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DocumentSettings value)?  $default,){
final _that = this;
switch (_that) {
case _DocumentSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson)  MeasurementUnit defaultUnit,  double defaultDpi,  int autosaveIntervalSeconds,  int maxHistoryEntries,  String? activeColourProfileId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DocumentSettings() when $default != null:
return $default(_that.defaultUnit,_that.defaultDpi,_that.autosaveIntervalSeconds,_that.maxHistoryEntries,_that.activeColourProfileId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson)  MeasurementUnit defaultUnit,  double defaultDpi,  int autosaveIntervalSeconds,  int maxHistoryEntries,  String? activeColourProfileId)  $default,) {final _that = this;
switch (_that) {
case _DocumentSettings():
return $default(_that.defaultUnit,_that.defaultDpi,_that.autosaveIntervalSeconds,_that.maxHistoryEntries,_that.activeColourProfileId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson)  MeasurementUnit defaultUnit,  double defaultDpi,  int autosaveIntervalSeconds,  int maxHistoryEntries,  String? activeColourProfileId)?  $default,) {final _that = this;
switch (_that) {
case _DocumentSettings() when $default != null:
return $default(_that.defaultUnit,_that.defaultDpi,_that.autosaveIntervalSeconds,_that.maxHistoryEntries,_that.activeColourProfileId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DocumentSettings implements DocumentSettings {
  const _DocumentSettings({@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) this.defaultUnit = MeasurementUnit.millimetre, this.defaultDpi = 300.0, this.autosaveIntervalSeconds = 120, this.maxHistoryEntries = 200, this.activeColourProfileId});
  factory _DocumentSettings.fromJson(Map<String, dynamic> json) => _$DocumentSettingsFromJson(json);

@override@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) final  MeasurementUnit defaultUnit;
@override@JsonKey() final  double defaultDpi;
@override@JsonKey() final  int autosaveIntervalSeconds;
@override@JsonKey() final  int maxHistoryEntries;
@override final  String? activeColourProfileId;

/// Create a copy of DocumentSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DocumentSettingsCopyWith<_DocumentSettings> get copyWith => __$DocumentSettingsCopyWithImpl<_DocumentSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DocumentSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DocumentSettings&&(identical(other.defaultUnit, defaultUnit) || other.defaultUnit == defaultUnit)&&(identical(other.defaultDpi, defaultDpi) || other.defaultDpi == defaultDpi)&&(identical(other.autosaveIntervalSeconds, autosaveIntervalSeconds) || other.autosaveIntervalSeconds == autosaveIntervalSeconds)&&(identical(other.maxHistoryEntries, maxHistoryEntries) || other.maxHistoryEntries == maxHistoryEntries)&&(identical(other.activeColourProfileId, activeColourProfileId) || other.activeColourProfileId == activeColourProfileId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,defaultUnit,defaultDpi,autosaveIntervalSeconds,maxHistoryEntries,activeColourProfileId);

@override
String toString() {
  return 'DocumentSettings(defaultUnit: $defaultUnit, defaultDpi: $defaultDpi, autosaveIntervalSeconds: $autosaveIntervalSeconds, maxHistoryEntries: $maxHistoryEntries, activeColourProfileId: $activeColourProfileId)';
}


}

/// @nodoc
abstract mixin class _$DocumentSettingsCopyWith<$Res> implements $DocumentSettingsCopyWith<$Res> {
  factory _$DocumentSettingsCopyWith(_DocumentSettings value, $Res Function(_DocumentSettings) _then) = __$DocumentSettingsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) MeasurementUnit defaultUnit, double defaultDpi, int autosaveIntervalSeconds, int maxHistoryEntries, String? activeColourProfileId
});




}
/// @nodoc
class __$DocumentSettingsCopyWithImpl<$Res>
    implements _$DocumentSettingsCopyWith<$Res> {
  __$DocumentSettingsCopyWithImpl(this._self, this._then);

  final _DocumentSettings _self;
  final $Res Function(_DocumentSettings) _then;

/// Create a copy of DocumentSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? defaultUnit = null,Object? defaultDpi = null,Object? autosaveIntervalSeconds = null,Object? maxHistoryEntries = null,Object? activeColourProfileId = freezed,}) {
  return _then(_DocumentSettings(
defaultUnit: null == defaultUnit ? _self.defaultUnit : defaultUnit // ignore: cast_nullable_to_non_nullable
as MeasurementUnit,defaultDpi: null == defaultDpi ? _self.defaultDpi : defaultDpi // ignore: cast_nullable_to_non_nullable
as double,autosaveIntervalSeconds: null == autosaveIntervalSeconds ? _self.autosaveIntervalSeconds : autosaveIntervalSeconds // ignore: cast_nullable_to_non_nullable
as int,maxHistoryEntries: null == maxHistoryEntries ? _self.maxHistoryEntries : maxHistoryEntries // ignore: cast_nullable_to_non_nullable
as int,activeColourProfileId: freezed == activeColourProfileId ? _self.activeColourProfileId : activeColourProfileId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$DocumentPreferences {

 Map<String, Object?> get values;
/// Create a copy of DocumentPreferences
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocumentPreferencesCopyWith<DocumentPreferences> get copyWith => _$DocumentPreferencesCopyWithImpl<DocumentPreferences>(this as DocumentPreferences, _$identity);

  /// Serializes this DocumentPreferences to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentPreferences&&const DeepCollectionEquality().equals(other.values, values));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(values));

@override
String toString() {
  return 'DocumentPreferences(values: $values)';
}


}

/// @nodoc
abstract mixin class $DocumentPreferencesCopyWith<$Res>  {
  factory $DocumentPreferencesCopyWith(DocumentPreferences value, $Res Function(DocumentPreferences) _then) = _$DocumentPreferencesCopyWithImpl;
@useResult
$Res call({
 Map<String, Object?> values
});




}
/// @nodoc
class _$DocumentPreferencesCopyWithImpl<$Res>
    implements $DocumentPreferencesCopyWith<$Res> {
  _$DocumentPreferencesCopyWithImpl(this._self, this._then);

  final DocumentPreferences _self;
  final $Res Function(DocumentPreferences) _then;

/// Create a copy of DocumentPreferences
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? values = null,}) {
  return _then(_self.copyWith(
values: null == values ? _self.values : values // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

}


/// Adds pattern-matching-related methods to [DocumentPreferences].
extension DocumentPreferencesPatterns on DocumentPreferences {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DocumentPreferences value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DocumentPreferences() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DocumentPreferences value)  $default,){
final _that = this;
switch (_that) {
case _DocumentPreferences():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DocumentPreferences value)?  $default,){
final _that = this;
switch (_that) {
case _DocumentPreferences() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, Object?> values)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DocumentPreferences() when $default != null:
return $default(_that.values);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, Object?> values)  $default,) {final _that = this;
switch (_that) {
case _DocumentPreferences():
return $default(_that.values);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, Object?> values)?  $default,) {final _that = this;
switch (_that) {
case _DocumentPreferences() when $default != null:
return $default(_that.values);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DocumentPreferences implements DocumentPreferences {
  const _DocumentPreferences({final  Map<String, Object?> values = const <String, Object?>{}}): _values = values;
  factory _DocumentPreferences.fromJson(Map<String, dynamic> json) => _$DocumentPreferencesFromJson(json);

 final  Map<String, Object?> _values;
@override@JsonKey() Map<String, Object?> get values {
  if (_values is EqualUnmodifiableMapView) return _values;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_values);
}


/// Create a copy of DocumentPreferences
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DocumentPreferencesCopyWith<_DocumentPreferences> get copyWith => __$DocumentPreferencesCopyWithImpl<_DocumentPreferences>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DocumentPreferencesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DocumentPreferences&&const DeepCollectionEquality().equals(other._values, _values));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_values));

@override
String toString() {
  return 'DocumentPreferences(values: $values)';
}


}

/// @nodoc
abstract mixin class _$DocumentPreferencesCopyWith<$Res> implements $DocumentPreferencesCopyWith<$Res> {
  factory _$DocumentPreferencesCopyWith(_DocumentPreferences value, $Res Function(_DocumentPreferences) _then) = __$DocumentPreferencesCopyWithImpl;
@override @useResult
$Res call({
 Map<String, Object?> values
});




}
/// @nodoc
class __$DocumentPreferencesCopyWithImpl<$Res>
    implements _$DocumentPreferencesCopyWith<$Res> {
  __$DocumentPreferencesCopyWithImpl(this._self, this._then);

  final _DocumentPreferences _self;
  final $Res Function(_DocumentPreferences) _then;

/// Create a copy of DocumentPreferences
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? values = null,}) {
  return _then(_DocumentPreferences(
values: null == values ? _self._values : values // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}


/// @nodoc
mixin _$DocumentStatistics {

 int get artboards; int get layers; int get designNodes; int get assets; int get historyEntries; int get aiProvenanceRecords; RevisionIdValue get revision;
/// Create a copy of DocumentStatistics
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocumentStatisticsCopyWith<DocumentStatistics> get copyWith => _$DocumentStatisticsCopyWithImpl<DocumentStatistics>(this as DocumentStatistics, _$identity);

  /// Serializes this DocumentStatistics to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentStatistics&&(identical(other.artboards, artboards) || other.artboards == artboards)&&(identical(other.layers, layers) || other.layers == layers)&&(identical(other.designNodes, designNodes) || other.designNodes == designNodes)&&(identical(other.assets, assets) || other.assets == assets)&&(identical(other.historyEntries, historyEntries) || other.historyEntries == historyEntries)&&(identical(other.aiProvenanceRecords, aiProvenanceRecords) || other.aiProvenanceRecords == aiProvenanceRecords)&&(identical(other.revision, revision) || other.revision == revision));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,artboards,layers,designNodes,assets,historyEntries,aiProvenanceRecords,revision);

@override
String toString() {
  return 'DocumentStatistics(artboards: $artboards, layers: $layers, designNodes: $designNodes, assets: $assets, historyEntries: $historyEntries, aiProvenanceRecords: $aiProvenanceRecords, revision: $revision)';
}


}

/// @nodoc
abstract mixin class $DocumentStatisticsCopyWith<$Res>  {
  factory $DocumentStatisticsCopyWith(DocumentStatistics value, $Res Function(DocumentStatistics) _then) = _$DocumentStatisticsCopyWithImpl;
@useResult
$Res call({
 int artboards, int layers, int designNodes, int assets, int historyEntries, int aiProvenanceRecords, RevisionIdValue revision
});




}
/// @nodoc
class _$DocumentStatisticsCopyWithImpl<$Res>
    implements $DocumentStatisticsCopyWith<$Res> {
  _$DocumentStatisticsCopyWithImpl(this._self, this._then);

  final DocumentStatistics _self;
  final $Res Function(DocumentStatistics) _then;

/// Create a copy of DocumentStatistics
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? artboards = null,Object? layers = null,Object? designNodes = null,Object? assets = null,Object? historyEntries = null,Object? aiProvenanceRecords = null,Object? revision = null,}) {
  return _then(_self.copyWith(
artboards: null == artboards ? _self.artboards : artboards // ignore: cast_nullable_to_non_nullable
as int,layers: null == layers ? _self.layers : layers // ignore: cast_nullable_to_non_nullable
as int,designNodes: null == designNodes ? _self.designNodes : designNodes // ignore: cast_nullable_to_non_nullable
as int,assets: null == assets ? _self.assets : assets // ignore: cast_nullable_to_non_nullable
as int,historyEntries: null == historyEntries ? _self.historyEntries : historyEntries // ignore: cast_nullable_to_non_nullable
as int,aiProvenanceRecords: null == aiProvenanceRecords ? _self.aiProvenanceRecords : aiProvenanceRecords // ignore: cast_nullable_to_non_nullable
as int,revision: null == revision ? _self.revision : revision // ignore: cast_nullable_to_non_nullable
as RevisionIdValue,
  ));
}

}


/// Adds pattern-matching-related methods to [DocumentStatistics].
extension DocumentStatisticsPatterns on DocumentStatistics {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DocumentStatistics value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DocumentStatistics() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DocumentStatistics value)  $default,){
final _that = this;
switch (_that) {
case _DocumentStatistics():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DocumentStatistics value)?  $default,){
final _that = this;
switch (_that) {
case _DocumentStatistics() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int artboards,  int layers,  int designNodes,  int assets,  int historyEntries,  int aiProvenanceRecords,  RevisionIdValue revision)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DocumentStatistics() when $default != null:
return $default(_that.artboards,_that.layers,_that.designNodes,_that.assets,_that.historyEntries,_that.aiProvenanceRecords,_that.revision);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int artboards,  int layers,  int designNodes,  int assets,  int historyEntries,  int aiProvenanceRecords,  RevisionIdValue revision)  $default,) {final _that = this;
switch (_that) {
case _DocumentStatistics():
return $default(_that.artboards,_that.layers,_that.designNodes,_that.assets,_that.historyEntries,_that.aiProvenanceRecords,_that.revision);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int artboards,  int layers,  int designNodes,  int assets,  int historyEntries,  int aiProvenanceRecords,  RevisionIdValue revision)?  $default,) {final _that = this;
switch (_that) {
case _DocumentStatistics() when $default != null:
return $default(_that.artboards,_that.layers,_that.designNodes,_that.assets,_that.historyEntries,_that.aiProvenanceRecords,_that.revision);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DocumentStatistics implements DocumentStatistics {
  const _DocumentStatistics({required this.artboards, required this.layers, required this.designNodes, required this.assets, required this.historyEntries, required this.aiProvenanceRecords, required this.revision});
  factory _DocumentStatistics.fromJson(Map<String, dynamic> json) => _$DocumentStatisticsFromJson(json);

@override final  int artboards;
@override final  int layers;
@override final  int designNodes;
@override final  int assets;
@override final  int historyEntries;
@override final  int aiProvenanceRecords;
@override final  RevisionIdValue revision;

/// Create a copy of DocumentStatistics
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DocumentStatisticsCopyWith<_DocumentStatistics> get copyWith => __$DocumentStatisticsCopyWithImpl<_DocumentStatistics>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DocumentStatisticsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DocumentStatistics&&(identical(other.artboards, artboards) || other.artboards == artboards)&&(identical(other.layers, layers) || other.layers == layers)&&(identical(other.designNodes, designNodes) || other.designNodes == designNodes)&&(identical(other.assets, assets) || other.assets == assets)&&(identical(other.historyEntries, historyEntries) || other.historyEntries == historyEntries)&&(identical(other.aiProvenanceRecords, aiProvenanceRecords) || other.aiProvenanceRecords == aiProvenanceRecords)&&(identical(other.revision, revision) || other.revision == revision));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,artboards,layers,designNodes,assets,historyEntries,aiProvenanceRecords,revision);

@override
String toString() {
  return 'DocumentStatistics(artboards: $artboards, layers: $layers, designNodes: $designNodes, assets: $assets, historyEntries: $historyEntries, aiProvenanceRecords: $aiProvenanceRecords, revision: $revision)';
}


}

/// @nodoc
abstract mixin class _$DocumentStatisticsCopyWith<$Res> implements $DocumentStatisticsCopyWith<$Res> {
  factory _$DocumentStatisticsCopyWith(_DocumentStatistics value, $Res Function(_DocumentStatistics) _then) = __$DocumentStatisticsCopyWithImpl;
@override @useResult
$Res call({
 int artboards, int layers, int designNodes, int assets, int historyEntries, int aiProvenanceRecords, RevisionIdValue revision
});




}
/// @nodoc
class __$DocumentStatisticsCopyWithImpl<$Res>
    implements _$DocumentStatisticsCopyWith<$Res> {
  __$DocumentStatisticsCopyWithImpl(this._self, this._then);

  final _DocumentStatistics _self;
  final $Res Function(_DocumentStatistics) _then;

/// Create a copy of DocumentStatistics
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? artboards = null,Object? layers = null,Object? designNodes = null,Object? assets = null,Object? historyEntries = null,Object? aiProvenanceRecords = null,Object? revision = null,}) {
  return _then(_DocumentStatistics(
artboards: null == artboards ? _self.artboards : artboards // ignore: cast_nullable_to_non_nullable
as int,layers: null == layers ? _self.layers : layers // ignore: cast_nullable_to_non_nullable
as int,designNodes: null == designNodes ? _self.designNodes : designNodes // ignore: cast_nullable_to_non_nullable
as int,assets: null == assets ? _self.assets : assets // ignore: cast_nullable_to_non_nullable
as int,historyEntries: null == historyEntries ? _self.historyEntries : historyEntries // ignore: cast_nullable_to_non_nullable
as int,aiProvenanceRecords: null == aiProvenanceRecords ? _self.aiProvenanceRecords : aiProvenanceRecords // ignore: cast_nullable_to_non_nullable
as int,revision: null == revision ? _self.revision : revision // ignore: cast_nullable_to_non_nullable
as RevisionIdValue,
  ));
}


}

// dart format on
