// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_job.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AiJob {

/// Stable UUID of this job.
 String get id;/// The frozen textile operation being executed (invariant I6).
@JsonKey(fromJson: _operationFromJson, toJson: _operationToJson) AiOperation get operation;/// Declared scope: semantic-node ids (invariant I3).
 List<String> get scopeNodeIds;/// Declared scope: mask ids (§6 "scope masks"; invariant I3).
 List<String> get scopeMaskIds;/// Hash of the producing `CompiledPrompt` — the same linkage the
/// frozen `AiProvenanceRecord.promptHash` and `AiProposal.promptHash`
/// use. No raw conversation is ever held.
 String get promptHash;/// Template the prompt compiler applied.
 String? get templateId;/// Capability classes this job requires — the API Manager's future
/// routing input (§10). Declared here, routed later.
@JsonKey(fromJson: _capabilitiesFromJson, toJson: _capabilitiesToJson) Set<AiCapability> get requiredCapabilities;/// Lifecycle state.
@JsonKey(fromJson: _statusFromJson, toJson: _statusToJson) AiJobStatus get status;/// The serving provider (invariant I5) — null until routed.
@JsonKey(fromJson: _providerFromJson, toJson: _providerToJson) AiProviderId? get provider;/// The serving model (invariant I5) — null until routed.
 String? get model;/// Reproducibility seed (mirrors `CompiledPrompt.seed`).
 int? get seed;/// Execution parameters (quality tier etc. — kept as data).
 Map<String, Object?> get parameters;/// Populated only with [AiJobStatus.failed] (mirrors
/// `ProviderResponse.error`).
 String? get failureReason; Map<String, Object?> get metadata;
/// Create a copy of AiJob
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AiJobCopyWith<AiJob> get copyWith => _$AiJobCopyWithImpl<AiJob>(this as AiJob, _$identity);

  /// Serializes this AiJob to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiJob&&(identical(other.id, id) || other.id == id)&&(identical(other.operation, operation) || other.operation == operation)&&const DeepCollectionEquality().equals(other.scopeNodeIds, scopeNodeIds)&&const DeepCollectionEquality().equals(other.scopeMaskIds, scopeMaskIds)&&(identical(other.promptHash, promptHash) || other.promptHash == promptHash)&&(identical(other.templateId, templateId) || other.templateId == templateId)&&const DeepCollectionEquality().equals(other.requiredCapabilities, requiredCapabilities)&&(identical(other.status, status) || other.status == status)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.model, model) || other.model == model)&&(identical(other.seed, seed) || other.seed == seed)&&const DeepCollectionEquality().equals(other.parameters, parameters)&&(identical(other.failureReason, failureReason) || other.failureReason == failureReason)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,operation,const DeepCollectionEquality().hash(scopeNodeIds),const DeepCollectionEquality().hash(scopeMaskIds),promptHash,templateId,const DeepCollectionEquality().hash(requiredCapabilities),status,provider,model,seed,const DeepCollectionEquality().hash(parameters),failureReason,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'AiJob(id: $id, operation: $operation, scopeNodeIds: $scopeNodeIds, scopeMaskIds: $scopeMaskIds, promptHash: $promptHash, templateId: $templateId, requiredCapabilities: $requiredCapabilities, status: $status, provider: $provider, model: $model, seed: $seed, parameters: $parameters, failureReason: $failureReason, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $AiJobCopyWith<$Res>  {
  factory $AiJobCopyWith(AiJob value, $Res Function(AiJob) _then) = _$AiJobCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(fromJson: _operationFromJson, toJson: _operationToJson) AiOperation operation, List<String> scopeNodeIds, List<String> scopeMaskIds, String promptHash, String? templateId,@JsonKey(fromJson: _capabilitiesFromJson, toJson: _capabilitiesToJson) Set<AiCapability> requiredCapabilities,@JsonKey(fromJson: _statusFromJson, toJson: _statusToJson) AiJobStatus status,@JsonKey(fromJson: _providerFromJson, toJson: _providerToJson) AiProviderId? provider, String? model, int? seed, Map<String, Object?> parameters, String? failureReason, Map<String, Object?> metadata
});




}
/// @nodoc
class _$AiJobCopyWithImpl<$Res>
    implements $AiJobCopyWith<$Res> {
  _$AiJobCopyWithImpl(this._self, this._then);

  final AiJob _self;
  final $Res Function(AiJob) _then;

/// Create a copy of AiJob
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? operation = null,Object? scopeNodeIds = null,Object? scopeMaskIds = null,Object? promptHash = null,Object? templateId = freezed,Object? requiredCapabilities = null,Object? status = null,Object? provider = freezed,Object? model = freezed,Object? seed = freezed,Object? parameters = null,Object? failureReason = freezed,Object? metadata = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,operation: null == operation ? _self.operation : operation // ignore: cast_nullable_to_non_nullable
as AiOperation,scopeNodeIds: null == scopeNodeIds ? _self.scopeNodeIds : scopeNodeIds // ignore: cast_nullable_to_non_nullable
as List<String>,scopeMaskIds: null == scopeMaskIds ? _self.scopeMaskIds : scopeMaskIds // ignore: cast_nullable_to_non_nullable
as List<String>,promptHash: null == promptHash ? _self.promptHash : promptHash // ignore: cast_nullable_to_non_nullable
as String,templateId: freezed == templateId ? _self.templateId : templateId // ignore: cast_nullable_to_non_nullable
as String?,requiredCapabilities: null == requiredCapabilities ? _self.requiredCapabilities : requiredCapabilities // ignore: cast_nullable_to_non_nullable
as Set<AiCapability>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AiJobStatus,provider: freezed == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as AiProviderId?,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,seed: freezed == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
as int?,parameters: null == parameters ? _self.parameters : parameters // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,failureReason: freezed == failureReason ? _self.failureReason : failureReason // ignore: cast_nullable_to_non_nullable
as String?,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

}


/// Adds pattern-matching-related methods to [AiJob].
extension AiJobPatterns on AiJob {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AiJob value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AiJob() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AiJob value)  $default,){
final _that = this;
switch (_that) {
case _AiJob():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AiJob value)?  $default,){
final _that = this;
switch (_that) {
case _AiJob() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(fromJson: _operationFromJson, toJson: _operationToJson)  AiOperation operation,  List<String> scopeNodeIds,  List<String> scopeMaskIds,  String promptHash,  String? templateId, @JsonKey(fromJson: _capabilitiesFromJson, toJson: _capabilitiesToJson)  Set<AiCapability> requiredCapabilities, @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)  AiJobStatus status, @JsonKey(fromJson: _providerFromJson, toJson: _providerToJson)  AiProviderId? provider,  String? model,  int? seed,  Map<String, Object?> parameters,  String? failureReason,  Map<String, Object?> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AiJob() when $default != null:
return $default(_that.id,_that.operation,_that.scopeNodeIds,_that.scopeMaskIds,_that.promptHash,_that.templateId,_that.requiredCapabilities,_that.status,_that.provider,_that.model,_that.seed,_that.parameters,_that.failureReason,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(fromJson: _operationFromJson, toJson: _operationToJson)  AiOperation operation,  List<String> scopeNodeIds,  List<String> scopeMaskIds,  String promptHash,  String? templateId, @JsonKey(fromJson: _capabilitiesFromJson, toJson: _capabilitiesToJson)  Set<AiCapability> requiredCapabilities, @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)  AiJobStatus status, @JsonKey(fromJson: _providerFromJson, toJson: _providerToJson)  AiProviderId? provider,  String? model,  int? seed,  Map<String, Object?> parameters,  String? failureReason,  Map<String, Object?> metadata)  $default,) {final _that = this;
switch (_that) {
case _AiJob():
return $default(_that.id,_that.operation,_that.scopeNodeIds,_that.scopeMaskIds,_that.promptHash,_that.templateId,_that.requiredCapabilities,_that.status,_that.provider,_that.model,_that.seed,_that.parameters,_that.failureReason,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(fromJson: _operationFromJson, toJson: _operationToJson)  AiOperation operation,  List<String> scopeNodeIds,  List<String> scopeMaskIds,  String promptHash,  String? templateId, @JsonKey(fromJson: _capabilitiesFromJson, toJson: _capabilitiesToJson)  Set<AiCapability> requiredCapabilities, @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)  AiJobStatus status, @JsonKey(fromJson: _providerFromJson, toJson: _providerToJson)  AiProviderId? provider,  String? model,  int? seed,  Map<String, Object?> parameters,  String? failureReason,  Map<String, Object?> metadata)?  $default,) {final _that = this;
switch (_that) {
case _AiJob() when $default != null:
return $default(_that.id,_that.operation,_that.scopeNodeIds,_that.scopeMaskIds,_that.promptHash,_that.templateId,_that.requiredCapabilities,_that.status,_that.provider,_that.model,_that.seed,_that.parameters,_that.failureReason,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AiJob extends AiJob {
  const _AiJob({required this.id, @JsonKey(fromJson: _operationFromJson, toJson: _operationToJson) required this.operation, final  List<String> scopeNodeIds = const <String>[], final  List<String> scopeMaskIds = const <String>[], required this.promptHash, this.templateId, @JsonKey(fromJson: _capabilitiesFromJson, toJson: _capabilitiesToJson) final  Set<AiCapability> requiredCapabilities = const <AiCapability>{}, @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson) this.status = AiJobStatus.planned, @JsonKey(fromJson: _providerFromJson, toJson: _providerToJson) this.provider, this.model, this.seed, final  Map<String, Object?> parameters = const <String, Object?>{}, this.failureReason, final  Map<String, Object?> metadata = const <String, Object?>{}}): assert(failureReason == null || status == AiJobStatus.failed, 'failureReason is populated only when status is failed'),_scopeNodeIds = scopeNodeIds,_scopeMaskIds = scopeMaskIds,_requiredCapabilities = requiredCapabilities,_parameters = parameters,_metadata = metadata,super._();
  factory _AiJob.fromJson(Map<String, dynamic> json) => _$AiJobFromJson(json);

/// Stable UUID of this job.
@override final  String id;
/// The frozen textile operation being executed (invariant I6).
@override@JsonKey(fromJson: _operationFromJson, toJson: _operationToJson) final  AiOperation operation;
/// Declared scope: semantic-node ids (invariant I3).
 final  List<String> _scopeNodeIds;
/// Declared scope: semantic-node ids (invariant I3).
@override@JsonKey() List<String> get scopeNodeIds {
  if (_scopeNodeIds is EqualUnmodifiableListView) return _scopeNodeIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_scopeNodeIds);
}

/// Declared scope: mask ids (§6 "scope masks"; invariant I3).
 final  List<String> _scopeMaskIds;
/// Declared scope: mask ids (§6 "scope masks"; invariant I3).
@override@JsonKey() List<String> get scopeMaskIds {
  if (_scopeMaskIds is EqualUnmodifiableListView) return _scopeMaskIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_scopeMaskIds);
}

/// Hash of the producing `CompiledPrompt` — the same linkage the
/// frozen `AiProvenanceRecord.promptHash` and `AiProposal.promptHash`
/// use. No raw conversation is ever held.
@override final  String promptHash;
/// Template the prompt compiler applied.
@override final  String? templateId;
/// Capability classes this job requires — the API Manager's future
/// routing input (§10). Declared here, routed later.
 final  Set<AiCapability> _requiredCapabilities;
/// Capability classes this job requires — the API Manager's future
/// routing input (§10). Declared here, routed later.
@override@JsonKey(fromJson: _capabilitiesFromJson, toJson: _capabilitiesToJson) Set<AiCapability> get requiredCapabilities {
  if (_requiredCapabilities is EqualUnmodifiableSetView) return _requiredCapabilities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_requiredCapabilities);
}

/// Lifecycle state.
@override@JsonKey(fromJson: _statusFromJson, toJson: _statusToJson) final  AiJobStatus status;
/// The serving provider (invariant I5) — null until routed.
@override@JsonKey(fromJson: _providerFromJson, toJson: _providerToJson) final  AiProviderId? provider;
/// The serving model (invariant I5) — null until routed.
@override final  String? model;
/// Reproducibility seed (mirrors `CompiledPrompt.seed`).
@override final  int? seed;
/// Execution parameters (quality tier etc. — kept as data).
 final  Map<String, Object?> _parameters;
/// Execution parameters (quality tier etc. — kept as data).
@override@JsonKey() Map<String, Object?> get parameters {
  if (_parameters is EqualUnmodifiableMapView) return _parameters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_parameters);
}

/// Populated only with [AiJobStatus.failed] (mirrors
/// `ProviderResponse.error`).
@override final  String? failureReason;
 final  Map<String, Object?> _metadata;
@override@JsonKey() Map<String, Object?> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of AiJob
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AiJobCopyWith<_AiJob> get copyWith => __$AiJobCopyWithImpl<_AiJob>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AiJobToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AiJob&&(identical(other.id, id) || other.id == id)&&(identical(other.operation, operation) || other.operation == operation)&&const DeepCollectionEquality().equals(other._scopeNodeIds, _scopeNodeIds)&&const DeepCollectionEquality().equals(other._scopeMaskIds, _scopeMaskIds)&&(identical(other.promptHash, promptHash) || other.promptHash == promptHash)&&(identical(other.templateId, templateId) || other.templateId == templateId)&&const DeepCollectionEquality().equals(other._requiredCapabilities, _requiredCapabilities)&&(identical(other.status, status) || other.status == status)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.model, model) || other.model == model)&&(identical(other.seed, seed) || other.seed == seed)&&const DeepCollectionEquality().equals(other._parameters, _parameters)&&(identical(other.failureReason, failureReason) || other.failureReason == failureReason)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,operation,const DeepCollectionEquality().hash(_scopeNodeIds),const DeepCollectionEquality().hash(_scopeMaskIds),promptHash,templateId,const DeepCollectionEquality().hash(_requiredCapabilities),status,provider,model,seed,const DeepCollectionEquality().hash(_parameters),failureReason,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'AiJob(id: $id, operation: $operation, scopeNodeIds: $scopeNodeIds, scopeMaskIds: $scopeMaskIds, promptHash: $promptHash, templateId: $templateId, requiredCapabilities: $requiredCapabilities, status: $status, provider: $provider, model: $model, seed: $seed, parameters: $parameters, failureReason: $failureReason, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$AiJobCopyWith<$Res> implements $AiJobCopyWith<$Res> {
  factory _$AiJobCopyWith(_AiJob value, $Res Function(_AiJob) _then) = __$AiJobCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(fromJson: _operationFromJson, toJson: _operationToJson) AiOperation operation, List<String> scopeNodeIds, List<String> scopeMaskIds, String promptHash, String? templateId,@JsonKey(fromJson: _capabilitiesFromJson, toJson: _capabilitiesToJson) Set<AiCapability> requiredCapabilities,@JsonKey(fromJson: _statusFromJson, toJson: _statusToJson) AiJobStatus status,@JsonKey(fromJson: _providerFromJson, toJson: _providerToJson) AiProviderId? provider, String? model, int? seed, Map<String, Object?> parameters, String? failureReason, Map<String, Object?> metadata
});




}
/// @nodoc
class __$AiJobCopyWithImpl<$Res>
    implements _$AiJobCopyWith<$Res> {
  __$AiJobCopyWithImpl(this._self, this._then);

  final _AiJob _self;
  final $Res Function(_AiJob) _then;

/// Create a copy of AiJob
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? operation = null,Object? scopeNodeIds = null,Object? scopeMaskIds = null,Object? promptHash = null,Object? templateId = freezed,Object? requiredCapabilities = null,Object? status = null,Object? provider = freezed,Object? model = freezed,Object? seed = freezed,Object? parameters = null,Object? failureReason = freezed,Object? metadata = null,}) {
  return _then(_AiJob(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,operation: null == operation ? _self.operation : operation // ignore: cast_nullable_to_non_nullable
as AiOperation,scopeNodeIds: null == scopeNodeIds ? _self._scopeNodeIds : scopeNodeIds // ignore: cast_nullable_to_non_nullable
as List<String>,scopeMaskIds: null == scopeMaskIds ? _self._scopeMaskIds : scopeMaskIds // ignore: cast_nullable_to_non_nullable
as List<String>,promptHash: null == promptHash ? _self.promptHash : promptHash // ignore: cast_nullable_to_non_nullable
as String,templateId: freezed == templateId ? _self.templateId : templateId // ignore: cast_nullable_to_non_nullable
as String?,requiredCapabilities: null == requiredCapabilities ? _self._requiredCapabilities : requiredCapabilities // ignore: cast_nullable_to_non_nullable
as Set<AiCapability>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AiJobStatus,provider: freezed == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as AiProviderId?,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,seed: freezed == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
as int?,parameters: null == parameters ? _self._parameters : parameters // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,failureReason: freezed == failureReason ? _self.failureReason : failureReason // ignore: cast_nullable_to_non_nullable
as String?,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}

// dart format on
