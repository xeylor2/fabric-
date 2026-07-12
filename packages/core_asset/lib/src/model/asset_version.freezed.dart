// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asset_version.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AssetVersionRecord {

/// Monotonic version number, starting at 1.
 int get version;/// Content hash of this version (`sha256:<hex>`).
 String get hash; DateTime get createdAt; String get author;/// What produced this version (e.g. `import`, `colour_shift`,
/// `ai_enhance`) — a label, not an enum: tools name their own edits.
 String? get operation;/// Id of the `AiProvenanceRecord` when the edit was AI-produced
/// (invariant I5 — referenced, never duplicated).
 String? get provenanceId; String? get comment;/// Tool/operation parameters that produced this version.
 Map<String, Object?> get parameters;
/// Create a copy of AssetVersionRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssetVersionRecordCopyWith<AssetVersionRecord> get copyWith => _$AssetVersionRecordCopyWithImpl<AssetVersionRecord>(this as AssetVersionRecord, _$identity);

  /// Serializes this AssetVersionRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssetVersionRecord&&(identical(other.version, version) || other.version == version)&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.author, author) || other.author == author)&&(identical(other.operation, operation) || other.operation == operation)&&(identical(other.provenanceId, provenanceId) || other.provenanceId == provenanceId)&&(identical(other.comment, comment) || other.comment == comment)&&const DeepCollectionEquality().equals(other.parameters, parameters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,version,hash,createdAt,author,operation,provenanceId,comment,const DeepCollectionEquality().hash(parameters));

@override
String toString() {
  return 'AssetVersionRecord(version: $version, hash: $hash, createdAt: $createdAt, author: $author, operation: $operation, provenanceId: $provenanceId, comment: $comment, parameters: $parameters)';
}


}

/// @nodoc
abstract mixin class $AssetVersionRecordCopyWith<$Res>  {
  factory $AssetVersionRecordCopyWith(AssetVersionRecord value, $Res Function(AssetVersionRecord) _then) = _$AssetVersionRecordCopyWithImpl;
@useResult
$Res call({
 int version, String hash, DateTime createdAt, String author, String? operation, String? provenanceId, String? comment, Map<String, Object?> parameters
});




}
/// @nodoc
class _$AssetVersionRecordCopyWithImpl<$Res>
    implements $AssetVersionRecordCopyWith<$Res> {
  _$AssetVersionRecordCopyWithImpl(this._self, this._then);

  final AssetVersionRecord _self;
  final $Res Function(AssetVersionRecord) _then;

/// Create a copy of AssetVersionRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? version = null,Object? hash = null,Object? createdAt = null,Object? author = null,Object? operation = freezed,Object? provenanceId = freezed,Object? comment = freezed,Object? parameters = null,}) {
  return _then(_self.copyWith(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,hash: null == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,operation: freezed == operation ? _self.operation : operation // ignore: cast_nullable_to_non_nullable
as String?,provenanceId: freezed == provenanceId ? _self.provenanceId : provenanceId // ignore: cast_nullable_to_non_nullable
as String?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,parameters: null == parameters ? _self.parameters : parameters // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

}


/// Adds pattern-matching-related methods to [AssetVersionRecord].
extension AssetVersionRecordPatterns on AssetVersionRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AssetVersionRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AssetVersionRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AssetVersionRecord value)  $default,){
final _that = this;
switch (_that) {
case _AssetVersionRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AssetVersionRecord value)?  $default,){
final _that = this;
switch (_that) {
case _AssetVersionRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int version,  String hash,  DateTime createdAt,  String author,  String? operation,  String? provenanceId,  String? comment,  Map<String, Object?> parameters)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AssetVersionRecord() when $default != null:
return $default(_that.version,_that.hash,_that.createdAt,_that.author,_that.operation,_that.provenanceId,_that.comment,_that.parameters);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int version,  String hash,  DateTime createdAt,  String author,  String? operation,  String? provenanceId,  String? comment,  Map<String, Object?> parameters)  $default,) {final _that = this;
switch (_that) {
case _AssetVersionRecord():
return $default(_that.version,_that.hash,_that.createdAt,_that.author,_that.operation,_that.provenanceId,_that.comment,_that.parameters);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int version,  String hash,  DateTime createdAt,  String author,  String? operation,  String? provenanceId,  String? comment,  Map<String, Object?> parameters)?  $default,) {final _that = this;
switch (_that) {
case _AssetVersionRecord() when $default != null:
return $default(_that.version,_that.hash,_that.createdAt,_that.author,_that.operation,_that.provenanceId,_that.comment,_that.parameters);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AssetVersionRecord implements AssetVersionRecord {
  const _AssetVersionRecord({required this.version, required this.hash, required this.createdAt, this.author = 'local', this.operation, this.provenanceId, this.comment, final  Map<String, Object?> parameters = const <String, Object?>{}}): _parameters = parameters;
  factory _AssetVersionRecord.fromJson(Map<String, dynamic> json) => _$AssetVersionRecordFromJson(json);

/// Monotonic version number, starting at 1.
@override final  int version;
/// Content hash of this version (`sha256:<hex>`).
@override final  String hash;
@override final  DateTime createdAt;
@override@JsonKey() final  String author;
/// What produced this version (e.g. `import`, `colour_shift`,
/// `ai_enhance`) — a label, not an enum: tools name their own edits.
@override final  String? operation;
/// Id of the `AiProvenanceRecord` when the edit was AI-produced
/// (invariant I5 — referenced, never duplicated).
@override final  String? provenanceId;
@override final  String? comment;
/// Tool/operation parameters that produced this version.
 final  Map<String, Object?> _parameters;
/// Tool/operation parameters that produced this version.
@override@JsonKey() Map<String, Object?> get parameters {
  if (_parameters is EqualUnmodifiableMapView) return _parameters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_parameters);
}


/// Create a copy of AssetVersionRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssetVersionRecordCopyWith<_AssetVersionRecord> get copyWith => __$AssetVersionRecordCopyWithImpl<_AssetVersionRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssetVersionRecordToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssetVersionRecord&&(identical(other.version, version) || other.version == version)&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.author, author) || other.author == author)&&(identical(other.operation, operation) || other.operation == operation)&&(identical(other.provenanceId, provenanceId) || other.provenanceId == provenanceId)&&(identical(other.comment, comment) || other.comment == comment)&&const DeepCollectionEquality().equals(other._parameters, _parameters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,version,hash,createdAt,author,operation,provenanceId,comment,const DeepCollectionEquality().hash(_parameters));

@override
String toString() {
  return 'AssetVersionRecord(version: $version, hash: $hash, createdAt: $createdAt, author: $author, operation: $operation, provenanceId: $provenanceId, comment: $comment, parameters: $parameters)';
}


}

/// @nodoc
abstract mixin class _$AssetVersionRecordCopyWith<$Res> implements $AssetVersionRecordCopyWith<$Res> {
  factory _$AssetVersionRecordCopyWith(_AssetVersionRecord value, $Res Function(_AssetVersionRecord) _then) = __$AssetVersionRecordCopyWithImpl;
@override @useResult
$Res call({
 int version, String hash, DateTime createdAt, String author, String? operation, String? provenanceId, String? comment, Map<String, Object?> parameters
});




}
/// @nodoc
class __$AssetVersionRecordCopyWithImpl<$Res>
    implements _$AssetVersionRecordCopyWith<$Res> {
  __$AssetVersionRecordCopyWithImpl(this._self, this._then);

  final _AssetVersionRecord _self;
  final $Res Function(_AssetVersionRecord) _then;

/// Create a copy of AssetVersionRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? version = null,Object? hash = null,Object? createdAt = null,Object? author = null,Object? operation = freezed,Object? provenanceId = freezed,Object? comment = freezed,Object? parameters = null,}) {
  return _then(_AssetVersionRecord(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,hash: null == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,operation: freezed == operation ? _self.operation : operation // ignore: cast_nullable_to_non_nullable
as String?,provenanceId: freezed == provenanceId ? _self.provenanceId : provenanceId // ignore: cast_nullable_to_non_nullable
as String?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,parameters: null == parameters ? _self._parameters : parameters // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}

// dart format on
