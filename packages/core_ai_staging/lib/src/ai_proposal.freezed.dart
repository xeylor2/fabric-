// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_proposal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AiProposal {

/// Stable UUID of this proposal.
 String get id;/// The frozen textile operation being proposed (invariant I6:
/// `redesignTextilePrint` stays a distinct labelled operation — staging
/// contains no operation-specific branching).
@JsonKey(fromJson: _operationFromJson, toJson: _operationToJson) AiOperation get operation;/// The exact frozen commands acceptance will emit, in order.
 List<DocumentCommand> get commands;/// Declared scope (invariant I3) — semantic node ids only, never
/// resolved objects.
 List<String> get targetNodeIds;/// Hash of the producing `CompiledPrompt` — the same value the frozen
/// `AiProvenanceRecord.promptHash` stores.
 String get promptHash;/// Template the prompt compiler applied.
 String? get templateId;/// The serving provider (frozen vocabulary, ADR-0009).
@JsonKey(fromJson: _providerFromJson, toJson: _providerToJson) AiProviderId get provider;/// Serving model identifier ("every job records the serving
/// provider/model", invariant I5).
 String get model;/// Version of the constraint engine that guarded the execution
/// (provenance precursor).
 String get constraintVersion;/// Version of the tool that requested the execution (provenance
/// precursor).
 String get toolVersion;/// Execution parameters (seed, quality tier…) — flow into
/// `AiProvenanceRecord.parameters` on acceptance.
 Map<String, Object?> get parameters;/// Lifecycle state.
@JsonKey(fromJson: _statusFromJson, toJson: _statusToJson) AiProposalStatus get status;/// For re-rolls: the proposal this one supersedes. The staging runtime
/// overwrites this on `reroll` — lineage is the runtime's fact, not the
/// caller's claim.
 String? get predecessorId;/// Human-readable summary for review (mirrors the frozen
/// `ToolPreview.description`).
 String get description; Map<String, Object?> get metadata;
/// Create a copy of AiProposal
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AiProposalCopyWith<AiProposal> get copyWith => _$AiProposalCopyWithImpl<AiProposal>(this as AiProposal, _$identity);

  /// Serializes this AiProposal to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiProposal&&(identical(other.id, id) || other.id == id)&&(identical(other.operation, operation) || other.operation == operation)&&const DeepCollectionEquality().equals(other.commands, commands)&&const DeepCollectionEquality().equals(other.targetNodeIds, targetNodeIds)&&(identical(other.promptHash, promptHash) || other.promptHash == promptHash)&&(identical(other.templateId, templateId) || other.templateId == templateId)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.model, model) || other.model == model)&&(identical(other.constraintVersion, constraintVersion) || other.constraintVersion == constraintVersion)&&(identical(other.toolVersion, toolVersion) || other.toolVersion == toolVersion)&&const DeepCollectionEquality().equals(other.parameters, parameters)&&(identical(other.status, status) || other.status == status)&&(identical(other.predecessorId, predecessorId) || other.predecessorId == predecessorId)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,operation,const DeepCollectionEquality().hash(commands),const DeepCollectionEquality().hash(targetNodeIds),promptHash,templateId,provider,model,constraintVersion,toolVersion,const DeepCollectionEquality().hash(parameters),status,predecessorId,description,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'AiProposal(id: $id, operation: $operation, commands: $commands, targetNodeIds: $targetNodeIds, promptHash: $promptHash, templateId: $templateId, provider: $provider, model: $model, constraintVersion: $constraintVersion, toolVersion: $toolVersion, parameters: $parameters, status: $status, predecessorId: $predecessorId, description: $description, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $AiProposalCopyWith<$Res>  {
  factory $AiProposalCopyWith(AiProposal value, $Res Function(AiProposal) _then) = _$AiProposalCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(fromJson: _operationFromJson, toJson: _operationToJson) AiOperation operation, List<DocumentCommand> commands, List<String> targetNodeIds, String promptHash, String? templateId,@JsonKey(fromJson: _providerFromJson, toJson: _providerToJson) AiProviderId provider, String model, String constraintVersion, String toolVersion, Map<String, Object?> parameters,@JsonKey(fromJson: _statusFromJson, toJson: _statusToJson) AiProposalStatus status, String? predecessorId, String description, Map<String, Object?> metadata
});




}
/// @nodoc
class _$AiProposalCopyWithImpl<$Res>
    implements $AiProposalCopyWith<$Res> {
  _$AiProposalCopyWithImpl(this._self, this._then);

  final AiProposal _self;
  final $Res Function(AiProposal) _then;

/// Create a copy of AiProposal
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? operation = null,Object? commands = null,Object? targetNodeIds = null,Object? promptHash = null,Object? templateId = freezed,Object? provider = null,Object? model = null,Object? constraintVersion = null,Object? toolVersion = null,Object? parameters = null,Object? status = null,Object? predecessorId = freezed,Object? description = null,Object? metadata = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,operation: null == operation ? _self.operation : operation // ignore: cast_nullable_to_non_nullable
as AiOperation,commands: null == commands ? _self.commands : commands // ignore: cast_nullable_to_non_nullable
as List<DocumentCommand>,targetNodeIds: null == targetNodeIds ? _self.targetNodeIds : targetNodeIds // ignore: cast_nullable_to_non_nullable
as List<String>,promptHash: null == promptHash ? _self.promptHash : promptHash // ignore: cast_nullable_to_non_nullable
as String,templateId: freezed == templateId ? _self.templateId : templateId // ignore: cast_nullable_to_non_nullable
as String?,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as AiProviderId,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,constraintVersion: null == constraintVersion ? _self.constraintVersion : constraintVersion // ignore: cast_nullable_to_non_nullable
as String,toolVersion: null == toolVersion ? _self.toolVersion : toolVersion // ignore: cast_nullable_to_non_nullable
as String,parameters: null == parameters ? _self.parameters : parameters // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AiProposalStatus,predecessorId: freezed == predecessorId ? _self.predecessorId : predecessorId // ignore: cast_nullable_to_non_nullable
as String?,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

}


/// Adds pattern-matching-related methods to [AiProposal].
extension AiProposalPatterns on AiProposal {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AiProposal value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AiProposal() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AiProposal value)  $default,){
final _that = this;
switch (_that) {
case _AiProposal():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AiProposal value)?  $default,){
final _that = this;
switch (_that) {
case _AiProposal() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(fromJson: _operationFromJson, toJson: _operationToJson)  AiOperation operation,  List<DocumentCommand> commands,  List<String> targetNodeIds,  String promptHash,  String? templateId, @JsonKey(fromJson: _providerFromJson, toJson: _providerToJson)  AiProviderId provider,  String model,  String constraintVersion,  String toolVersion,  Map<String, Object?> parameters, @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)  AiProposalStatus status,  String? predecessorId,  String description,  Map<String, Object?> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AiProposal() when $default != null:
return $default(_that.id,_that.operation,_that.commands,_that.targetNodeIds,_that.promptHash,_that.templateId,_that.provider,_that.model,_that.constraintVersion,_that.toolVersion,_that.parameters,_that.status,_that.predecessorId,_that.description,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(fromJson: _operationFromJson, toJson: _operationToJson)  AiOperation operation,  List<DocumentCommand> commands,  List<String> targetNodeIds,  String promptHash,  String? templateId, @JsonKey(fromJson: _providerFromJson, toJson: _providerToJson)  AiProviderId provider,  String model,  String constraintVersion,  String toolVersion,  Map<String, Object?> parameters, @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)  AiProposalStatus status,  String? predecessorId,  String description,  Map<String, Object?> metadata)  $default,) {final _that = this;
switch (_that) {
case _AiProposal():
return $default(_that.id,_that.operation,_that.commands,_that.targetNodeIds,_that.promptHash,_that.templateId,_that.provider,_that.model,_that.constraintVersion,_that.toolVersion,_that.parameters,_that.status,_that.predecessorId,_that.description,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(fromJson: _operationFromJson, toJson: _operationToJson)  AiOperation operation,  List<DocumentCommand> commands,  List<String> targetNodeIds,  String promptHash,  String? templateId, @JsonKey(fromJson: _providerFromJson, toJson: _providerToJson)  AiProviderId provider,  String model,  String constraintVersion,  String toolVersion,  Map<String, Object?> parameters, @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)  AiProposalStatus status,  String? predecessorId,  String description,  Map<String, Object?> metadata)?  $default,) {final _that = this;
switch (_that) {
case _AiProposal() when $default != null:
return $default(_that.id,_that.operation,_that.commands,_that.targetNodeIds,_that.promptHash,_that.templateId,_that.provider,_that.model,_that.constraintVersion,_that.toolVersion,_that.parameters,_that.status,_that.predecessorId,_that.description,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AiProposal implements AiProposal {
  const _AiProposal({required this.id, @JsonKey(fromJson: _operationFromJson, toJson: _operationToJson) required this.operation, final  List<DocumentCommand> commands = const <DocumentCommand>[], final  List<String> targetNodeIds = const <String>[], required this.promptHash, this.templateId, @JsonKey(fromJson: _providerFromJson, toJson: _providerToJson) required this.provider, required this.model, required this.constraintVersion, required this.toolVersion, final  Map<String, Object?> parameters = const <String, Object?>{}, @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson) this.status = AiProposalStatus.staged, this.predecessorId, required this.description, final  Map<String, Object?> metadata = const <String, Object?>{}}): _commands = commands,_targetNodeIds = targetNodeIds,_parameters = parameters,_metadata = metadata;
  factory _AiProposal.fromJson(Map<String, dynamic> json) => _$AiProposalFromJson(json);

/// Stable UUID of this proposal.
@override final  String id;
/// The frozen textile operation being proposed (invariant I6:
/// `redesignTextilePrint` stays a distinct labelled operation — staging
/// contains no operation-specific branching).
@override@JsonKey(fromJson: _operationFromJson, toJson: _operationToJson) final  AiOperation operation;
/// The exact frozen commands acceptance will emit, in order.
 final  List<DocumentCommand> _commands;
/// The exact frozen commands acceptance will emit, in order.
@override@JsonKey() List<DocumentCommand> get commands {
  if (_commands is EqualUnmodifiableListView) return _commands;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_commands);
}

/// Declared scope (invariant I3) — semantic node ids only, never
/// resolved objects.
 final  List<String> _targetNodeIds;
/// Declared scope (invariant I3) — semantic node ids only, never
/// resolved objects.
@override@JsonKey() List<String> get targetNodeIds {
  if (_targetNodeIds is EqualUnmodifiableListView) return _targetNodeIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_targetNodeIds);
}

/// Hash of the producing `CompiledPrompt` — the same value the frozen
/// `AiProvenanceRecord.promptHash` stores.
@override final  String promptHash;
/// Template the prompt compiler applied.
@override final  String? templateId;
/// The serving provider (frozen vocabulary, ADR-0009).
@override@JsonKey(fromJson: _providerFromJson, toJson: _providerToJson) final  AiProviderId provider;
/// Serving model identifier ("every job records the serving
/// provider/model", invariant I5).
@override final  String model;
/// Version of the constraint engine that guarded the execution
/// (provenance precursor).
@override final  String constraintVersion;
/// Version of the tool that requested the execution (provenance
/// precursor).
@override final  String toolVersion;
/// Execution parameters (seed, quality tier…) — flow into
/// `AiProvenanceRecord.parameters` on acceptance.
 final  Map<String, Object?> _parameters;
/// Execution parameters (seed, quality tier…) — flow into
/// `AiProvenanceRecord.parameters` on acceptance.
@override@JsonKey() Map<String, Object?> get parameters {
  if (_parameters is EqualUnmodifiableMapView) return _parameters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_parameters);
}

/// Lifecycle state.
@override@JsonKey(fromJson: _statusFromJson, toJson: _statusToJson) final  AiProposalStatus status;
/// For re-rolls: the proposal this one supersedes. The staging runtime
/// overwrites this on `reroll` — lineage is the runtime's fact, not the
/// caller's claim.
@override final  String? predecessorId;
/// Human-readable summary for review (mirrors the frozen
/// `ToolPreview.description`).
@override final  String description;
 final  Map<String, Object?> _metadata;
@override@JsonKey() Map<String, Object?> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of AiProposal
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AiProposalCopyWith<_AiProposal> get copyWith => __$AiProposalCopyWithImpl<_AiProposal>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AiProposalToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AiProposal&&(identical(other.id, id) || other.id == id)&&(identical(other.operation, operation) || other.operation == operation)&&const DeepCollectionEquality().equals(other._commands, _commands)&&const DeepCollectionEquality().equals(other._targetNodeIds, _targetNodeIds)&&(identical(other.promptHash, promptHash) || other.promptHash == promptHash)&&(identical(other.templateId, templateId) || other.templateId == templateId)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.model, model) || other.model == model)&&(identical(other.constraintVersion, constraintVersion) || other.constraintVersion == constraintVersion)&&(identical(other.toolVersion, toolVersion) || other.toolVersion == toolVersion)&&const DeepCollectionEquality().equals(other._parameters, _parameters)&&(identical(other.status, status) || other.status == status)&&(identical(other.predecessorId, predecessorId) || other.predecessorId == predecessorId)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,operation,const DeepCollectionEquality().hash(_commands),const DeepCollectionEquality().hash(_targetNodeIds),promptHash,templateId,provider,model,constraintVersion,toolVersion,const DeepCollectionEquality().hash(_parameters),status,predecessorId,description,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'AiProposal(id: $id, operation: $operation, commands: $commands, targetNodeIds: $targetNodeIds, promptHash: $promptHash, templateId: $templateId, provider: $provider, model: $model, constraintVersion: $constraintVersion, toolVersion: $toolVersion, parameters: $parameters, status: $status, predecessorId: $predecessorId, description: $description, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$AiProposalCopyWith<$Res> implements $AiProposalCopyWith<$Res> {
  factory _$AiProposalCopyWith(_AiProposal value, $Res Function(_AiProposal) _then) = __$AiProposalCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(fromJson: _operationFromJson, toJson: _operationToJson) AiOperation operation, List<DocumentCommand> commands, List<String> targetNodeIds, String promptHash, String? templateId,@JsonKey(fromJson: _providerFromJson, toJson: _providerToJson) AiProviderId provider, String model, String constraintVersion, String toolVersion, Map<String, Object?> parameters,@JsonKey(fromJson: _statusFromJson, toJson: _statusToJson) AiProposalStatus status, String? predecessorId, String description, Map<String, Object?> metadata
});




}
/// @nodoc
class __$AiProposalCopyWithImpl<$Res>
    implements _$AiProposalCopyWith<$Res> {
  __$AiProposalCopyWithImpl(this._self, this._then);

  final _AiProposal _self;
  final $Res Function(_AiProposal) _then;

/// Create a copy of AiProposal
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? operation = null,Object? commands = null,Object? targetNodeIds = null,Object? promptHash = null,Object? templateId = freezed,Object? provider = null,Object? model = null,Object? constraintVersion = null,Object? toolVersion = null,Object? parameters = null,Object? status = null,Object? predecessorId = freezed,Object? description = null,Object? metadata = null,}) {
  return _then(_AiProposal(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,operation: null == operation ? _self.operation : operation // ignore: cast_nullable_to_non_nullable
as AiOperation,commands: null == commands ? _self._commands : commands // ignore: cast_nullable_to_non_nullable
as List<DocumentCommand>,targetNodeIds: null == targetNodeIds ? _self._targetNodeIds : targetNodeIds // ignore: cast_nullable_to_non_nullable
as List<String>,promptHash: null == promptHash ? _self.promptHash : promptHash // ignore: cast_nullable_to_non_nullable
as String,templateId: freezed == templateId ? _self.templateId : templateId // ignore: cast_nullable_to_non_nullable
as String?,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as AiProviderId,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,constraintVersion: null == constraintVersion ? _self.constraintVersion : constraintVersion // ignore: cast_nullable_to_non_nullable
as String,toolVersion: null == toolVersion ? _self.toolVersion : toolVersion // ignore: cast_nullable_to_non_nullable
as String,parameters: null == parameters ? _self._parameters : parameters // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AiProposalStatus,predecessorId: freezed == predecessorId ? _self.predecessorId : predecessorId // ignore: cast_nullable_to_non_nullable
as String?,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}

// dart format on
