// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_provenance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AiProvenanceRecord {

/// Stable UUID of this record.
 String get id;/// Hash of the [CompiledPrompt] that produced the change.
 String get promptHash;/// Template the prompt compiler applied.
 String? get templateId;@JsonKey(fromJson: _providerFromJson, toJson: _providerToJson) AiProviderId get provider;/// Provider model identifier (e.g. a model version string).
 String get model;/// Execution parameters (seed, quality tier…).
 Map<String, Object?> get parameters;/// Version of the constraint engine that guarded the execution.
 String get constraintVersion;/// Version of the tool that requested the execution.
 String get toolVersion; DateTime get timestamp;/// Document revision the change landed as.
 int get revision;/// Ids of the objects the change touched.
 List<String> get affectedIds;
/// Create a copy of AiProvenanceRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AiProvenanceRecordCopyWith<AiProvenanceRecord> get copyWith => _$AiProvenanceRecordCopyWithImpl<AiProvenanceRecord>(this as AiProvenanceRecord, _$identity);

  /// Serializes this AiProvenanceRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiProvenanceRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.promptHash, promptHash) || other.promptHash == promptHash)&&(identical(other.templateId, templateId) || other.templateId == templateId)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.model, model) || other.model == model)&&const DeepCollectionEquality().equals(other.parameters, parameters)&&(identical(other.constraintVersion, constraintVersion) || other.constraintVersion == constraintVersion)&&(identical(other.toolVersion, toolVersion) || other.toolVersion == toolVersion)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.revision, revision) || other.revision == revision)&&const DeepCollectionEquality().equals(other.affectedIds, affectedIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,promptHash,templateId,provider,model,const DeepCollectionEquality().hash(parameters),constraintVersion,toolVersion,timestamp,revision,const DeepCollectionEquality().hash(affectedIds));

@override
String toString() {
  return 'AiProvenanceRecord(id: $id, promptHash: $promptHash, templateId: $templateId, provider: $provider, model: $model, parameters: $parameters, constraintVersion: $constraintVersion, toolVersion: $toolVersion, timestamp: $timestamp, revision: $revision, affectedIds: $affectedIds)';
}


}

/// @nodoc
abstract mixin class $AiProvenanceRecordCopyWith<$Res>  {
  factory $AiProvenanceRecordCopyWith(AiProvenanceRecord value, $Res Function(AiProvenanceRecord) _then) = _$AiProvenanceRecordCopyWithImpl;
@useResult
$Res call({
 String id, String promptHash, String? templateId,@JsonKey(fromJson: _providerFromJson, toJson: _providerToJson) AiProviderId provider, String model, Map<String, Object?> parameters, String constraintVersion, String toolVersion, DateTime timestamp, int revision, List<String> affectedIds
});




}
/// @nodoc
class _$AiProvenanceRecordCopyWithImpl<$Res>
    implements $AiProvenanceRecordCopyWith<$Res> {
  _$AiProvenanceRecordCopyWithImpl(this._self, this._then);

  final AiProvenanceRecord _self;
  final $Res Function(AiProvenanceRecord) _then;

/// Create a copy of AiProvenanceRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? promptHash = null,Object? templateId = freezed,Object? provider = null,Object? model = null,Object? parameters = null,Object? constraintVersion = null,Object? toolVersion = null,Object? timestamp = null,Object? revision = null,Object? affectedIds = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,promptHash: null == promptHash ? _self.promptHash : promptHash // ignore: cast_nullable_to_non_nullable
as String,templateId: freezed == templateId ? _self.templateId : templateId // ignore: cast_nullable_to_non_nullable
as String?,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as AiProviderId,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,parameters: null == parameters ? _self.parameters : parameters // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,constraintVersion: null == constraintVersion ? _self.constraintVersion : constraintVersion // ignore: cast_nullable_to_non_nullable
as String,toolVersion: null == toolVersion ? _self.toolVersion : toolVersion // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,revision: null == revision ? _self.revision : revision // ignore: cast_nullable_to_non_nullable
as int,affectedIds: null == affectedIds ? _self.affectedIds : affectedIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [AiProvenanceRecord].
extension AiProvenanceRecordPatterns on AiProvenanceRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AiProvenanceRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AiProvenanceRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AiProvenanceRecord value)  $default,){
final _that = this;
switch (_that) {
case _AiProvenanceRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AiProvenanceRecord value)?  $default,){
final _that = this;
switch (_that) {
case _AiProvenanceRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String promptHash,  String? templateId, @JsonKey(fromJson: _providerFromJson, toJson: _providerToJson)  AiProviderId provider,  String model,  Map<String, Object?> parameters,  String constraintVersion,  String toolVersion,  DateTime timestamp,  int revision,  List<String> affectedIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AiProvenanceRecord() when $default != null:
return $default(_that.id,_that.promptHash,_that.templateId,_that.provider,_that.model,_that.parameters,_that.constraintVersion,_that.toolVersion,_that.timestamp,_that.revision,_that.affectedIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String promptHash,  String? templateId, @JsonKey(fromJson: _providerFromJson, toJson: _providerToJson)  AiProviderId provider,  String model,  Map<String, Object?> parameters,  String constraintVersion,  String toolVersion,  DateTime timestamp,  int revision,  List<String> affectedIds)  $default,) {final _that = this;
switch (_that) {
case _AiProvenanceRecord():
return $default(_that.id,_that.promptHash,_that.templateId,_that.provider,_that.model,_that.parameters,_that.constraintVersion,_that.toolVersion,_that.timestamp,_that.revision,_that.affectedIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String promptHash,  String? templateId, @JsonKey(fromJson: _providerFromJson, toJson: _providerToJson)  AiProviderId provider,  String model,  Map<String, Object?> parameters,  String constraintVersion,  String toolVersion,  DateTime timestamp,  int revision,  List<String> affectedIds)?  $default,) {final _that = this;
switch (_that) {
case _AiProvenanceRecord() when $default != null:
return $default(_that.id,_that.promptHash,_that.templateId,_that.provider,_that.model,_that.parameters,_that.constraintVersion,_that.toolVersion,_that.timestamp,_that.revision,_that.affectedIds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AiProvenanceRecord implements AiProvenanceRecord {
  const _AiProvenanceRecord({required this.id, required this.promptHash, this.templateId, @JsonKey(fromJson: _providerFromJson, toJson: _providerToJson) required this.provider, required this.model, final  Map<String, Object?> parameters = const <String, Object?>{}, required this.constraintVersion, required this.toolVersion, required this.timestamp, required this.revision, final  List<String> affectedIds = const <String>[]}): _parameters = parameters,_affectedIds = affectedIds;
  factory _AiProvenanceRecord.fromJson(Map<String, dynamic> json) => _$AiProvenanceRecordFromJson(json);

/// Stable UUID of this record.
@override final  String id;
/// Hash of the [CompiledPrompt] that produced the change.
@override final  String promptHash;
/// Template the prompt compiler applied.
@override final  String? templateId;
@override@JsonKey(fromJson: _providerFromJson, toJson: _providerToJson) final  AiProviderId provider;
/// Provider model identifier (e.g. a model version string).
@override final  String model;
/// Execution parameters (seed, quality tier…).
 final  Map<String, Object?> _parameters;
/// Execution parameters (seed, quality tier…).
@override@JsonKey() Map<String, Object?> get parameters {
  if (_parameters is EqualUnmodifiableMapView) return _parameters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_parameters);
}

/// Version of the constraint engine that guarded the execution.
@override final  String constraintVersion;
/// Version of the tool that requested the execution.
@override final  String toolVersion;
@override final  DateTime timestamp;
/// Document revision the change landed as.
@override final  int revision;
/// Ids of the objects the change touched.
 final  List<String> _affectedIds;
/// Ids of the objects the change touched.
@override@JsonKey() List<String> get affectedIds {
  if (_affectedIds is EqualUnmodifiableListView) return _affectedIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_affectedIds);
}


/// Create a copy of AiProvenanceRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AiProvenanceRecordCopyWith<_AiProvenanceRecord> get copyWith => __$AiProvenanceRecordCopyWithImpl<_AiProvenanceRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AiProvenanceRecordToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AiProvenanceRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.promptHash, promptHash) || other.promptHash == promptHash)&&(identical(other.templateId, templateId) || other.templateId == templateId)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.model, model) || other.model == model)&&const DeepCollectionEquality().equals(other._parameters, _parameters)&&(identical(other.constraintVersion, constraintVersion) || other.constraintVersion == constraintVersion)&&(identical(other.toolVersion, toolVersion) || other.toolVersion == toolVersion)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.revision, revision) || other.revision == revision)&&const DeepCollectionEquality().equals(other._affectedIds, _affectedIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,promptHash,templateId,provider,model,const DeepCollectionEquality().hash(_parameters),constraintVersion,toolVersion,timestamp,revision,const DeepCollectionEquality().hash(_affectedIds));

@override
String toString() {
  return 'AiProvenanceRecord(id: $id, promptHash: $promptHash, templateId: $templateId, provider: $provider, model: $model, parameters: $parameters, constraintVersion: $constraintVersion, toolVersion: $toolVersion, timestamp: $timestamp, revision: $revision, affectedIds: $affectedIds)';
}


}

/// @nodoc
abstract mixin class _$AiProvenanceRecordCopyWith<$Res> implements $AiProvenanceRecordCopyWith<$Res> {
  factory _$AiProvenanceRecordCopyWith(_AiProvenanceRecord value, $Res Function(_AiProvenanceRecord) _then) = __$AiProvenanceRecordCopyWithImpl;
@override @useResult
$Res call({
 String id, String promptHash, String? templateId,@JsonKey(fromJson: _providerFromJson, toJson: _providerToJson) AiProviderId provider, String model, Map<String, Object?> parameters, String constraintVersion, String toolVersion, DateTime timestamp, int revision, List<String> affectedIds
});




}
/// @nodoc
class __$AiProvenanceRecordCopyWithImpl<$Res>
    implements _$AiProvenanceRecordCopyWith<$Res> {
  __$AiProvenanceRecordCopyWithImpl(this._self, this._then);

  final _AiProvenanceRecord _self;
  final $Res Function(_AiProvenanceRecord) _then;

/// Create a copy of AiProvenanceRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? promptHash = null,Object? templateId = freezed,Object? provider = null,Object? model = null,Object? parameters = null,Object? constraintVersion = null,Object? toolVersion = null,Object? timestamp = null,Object? revision = null,Object? affectedIds = null,}) {
  return _then(_AiProvenanceRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,promptHash: null == promptHash ? _self.promptHash : promptHash // ignore: cast_nullable_to_non_nullable
as String,templateId: freezed == templateId ? _self.templateId : templateId // ignore: cast_nullable_to_non_nullable
as String?,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as AiProviderId,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,parameters: null == parameters ? _self._parameters : parameters // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,constraintVersion: null == constraintVersion ? _self.constraintVersion : constraintVersion // ignore: cast_nullable_to_non_nullable
as String,toolVersion: null == toolVersion ? _self.toolVersion : toolVersion // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,revision: null == revision ? _self.revision : revision // ignore: cast_nullable_to_non_nullable
as int,affectedIds: null == affectedIds ? _self._affectedIds : affectedIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
