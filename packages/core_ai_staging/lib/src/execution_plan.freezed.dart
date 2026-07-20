// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'execution_plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
PlanStep _$PlanStepFromJson(
  Map<String, dynamic> json
) {
        switch (json['kind']) {
                  case 'job':
          return PlanJobStep.fromJson(
            json
          );
                case 'command':
          return PlanCommandStep.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'kind',
  'PlanStep',
  'Invalid union type "${json['kind']}"!'
);
        }
      
}

/// @nodoc
mixin _$PlanStep {



  /// Serializes this PlanStep to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlanStep);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlanStep()';
}


}

/// @nodoc
class $PlanStepCopyWith<$Res>  {
$PlanStepCopyWith(PlanStep _, $Res Function(PlanStep) __);
}


/// Adds pattern-matching-related methods to [PlanStep].
extension PlanStepPatterns on PlanStep {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PlanJobStep value)?  job,TResult Function( PlanCommandStep value)?  command,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PlanJobStep() when job != null:
return job(_that);case PlanCommandStep() when command != null:
return command(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PlanJobStep value)  job,required TResult Function( PlanCommandStep value)  command,}){
final _that = this;
switch (_that) {
case PlanJobStep():
return job(_that);case PlanCommandStep():
return command(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PlanJobStep value)?  job,TResult? Function( PlanCommandStep value)?  command,}){
final _that = this;
switch (_that) {
case PlanJobStep() when job != null:
return job(_that);case PlanCommandStep() when command != null:
return command(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( AiJob job,  CompiledPrompt prompt, @JsonKey(fromJson: _capabilityFromJson, toJson: _capabilityToJson)  NodeCapability? nodeCapability)?  job,TResult Function( DocumentCommand command,  String description)?  command,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PlanJobStep() when job != null:
return job(_that.job,_that.prompt,_that.nodeCapability);case PlanCommandStep() when command != null:
return command(_that.command,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( AiJob job,  CompiledPrompt prompt, @JsonKey(fromJson: _capabilityFromJson, toJson: _capabilityToJson)  NodeCapability? nodeCapability)  job,required TResult Function( DocumentCommand command,  String description)  command,}) {final _that = this;
switch (_that) {
case PlanJobStep():
return job(_that.job,_that.prompt,_that.nodeCapability);case PlanCommandStep():
return command(_that.command,_that.description);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( AiJob job,  CompiledPrompt prompt, @JsonKey(fromJson: _capabilityFromJson, toJson: _capabilityToJson)  NodeCapability? nodeCapability)?  job,TResult? Function( DocumentCommand command,  String description)?  command,}) {final _that = this;
switch (_that) {
case PlanJobStep() when job != null:
return job(_that.job,_that.prompt,_that.nodeCapability);case PlanCommandStep() when command != null:
return command(_that.command,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class PlanJobStep implements PlanStep {
  const PlanJobStep({required this.job, required this.prompt, @JsonKey(fromJson: _capabilityFromJson, toJson: _capabilityToJson) this.nodeCapability, final  String? $type}): $type = $type ?? 'job';
  factory PlanJobStep.fromJson(Map<String, dynamic> json) => _$PlanJobStepFromJson(json);

 final  AiJob job;
 final  CompiledPrompt prompt;
@JsonKey(fromJson: _capabilityFromJson, toJson: _capabilityToJson) final  NodeCapability? nodeCapability;

@JsonKey(name: 'kind')
final String $type;


/// Create a copy of PlanStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlanJobStepCopyWith<PlanJobStep> get copyWith => _$PlanJobStepCopyWithImpl<PlanJobStep>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlanJobStepToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlanJobStep&&(identical(other.job, job) || other.job == job)&&(identical(other.prompt, prompt) || other.prompt == prompt)&&(identical(other.nodeCapability, nodeCapability) || other.nodeCapability == nodeCapability));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,job,prompt,nodeCapability);

@override
String toString() {
  return 'PlanStep.job(job: $job, prompt: $prompt, nodeCapability: $nodeCapability)';
}


}

/// @nodoc
abstract mixin class $PlanJobStepCopyWith<$Res> implements $PlanStepCopyWith<$Res> {
  factory $PlanJobStepCopyWith(PlanJobStep value, $Res Function(PlanJobStep) _then) = _$PlanJobStepCopyWithImpl;
@useResult
$Res call({
 AiJob job, CompiledPrompt prompt,@JsonKey(fromJson: _capabilityFromJson, toJson: _capabilityToJson) NodeCapability? nodeCapability
});


$AiJobCopyWith<$Res> get job;$CompiledPromptCopyWith<$Res> get prompt;

}
/// @nodoc
class _$PlanJobStepCopyWithImpl<$Res>
    implements $PlanJobStepCopyWith<$Res> {
  _$PlanJobStepCopyWithImpl(this._self, this._then);

  final PlanJobStep _self;
  final $Res Function(PlanJobStep) _then;

/// Create a copy of PlanStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? job = null,Object? prompt = null,Object? nodeCapability = freezed,}) {
  return _then(PlanJobStep(
job: null == job ? _self.job : job // ignore: cast_nullable_to_non_nullable
as AiJob,prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as CompiledPrompt,nodeCapability: freezed == nodeCapability ? _self.nodeCapability : nodeCapability // ignore: cast_nullable_to_non_nullable
as NodeCapability?,
  ));
}

/// Create a copy of PlanStep
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AiJobCopyWith<$Res> get job {
  
  return $AiJobCopyWith<$Res>(_self.job, (value) {
    return _then(_self.copyWith(job: value));
  });
}/// Create a copy of PlanStep
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompiledPromptCopyWith<$Res> get prompt {
  
  return $CompiledPromptCopyWith<$Res>(_self.prompt, (value) {
    return _then(_self.copyWith(prompt: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class PlanCommandStep implements PlanStep {
  const PlanCommandStep({required this.command, required this.description, final  String? $type}): $type = $type ?? 'command';
  factory PlanCommandStep.fromJson(Map<String, dynamic> json) => _$PlanCommandStepFromJson(json);

 final  DocumentCommand command;
/// Human-readable summary for the staged proposal's review card.
 final  String description;

@JsonKey(name: 'kind')
final String $type;


/// Create a copy of PlanStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlanCommandStepCopyWith<PlanCommandStep> get copyWith => _$PlanCommandStepCopyWithImpl<PlanCommandStep>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlanCommandStepToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlanCommandStep&&(identical(other.command, command) || other.command == command)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,command,description);

@override
String toString() {
  return 'PlanStep.command(command: $command, description: $description)';
}


}

/// @nodoc
abstract mixin class $PlanCommandStepCopyWith<$Res> implements $PlanStepCopyWith<$Res> {
  factory $PlanCommandStepCopyWith(PlanCommandStep value, $Res Function(PlanCommandStep) _then) = _$PlanCommandStepCopyWithImpl;
@useResult
$Res call({
 DocumentCommand command, String description
});


$DocumentCommandCopyWith<$Res> get command;

}
/// @nodoc
class _$PlanCommandStepCopyWithImpl<$Res>
    implements $PlanCommandStepCopyWith<$Res> {
  _$PlanCommandStepCopyWithImpl(this._self, this._then);

  final PlanCommandStep _self;
  final $Res Function(PlanCommandStep) _then;

/// Create a copy of PlanStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? command = null,Object? description = null,}) {
  return _then(PlanCommandStep(
command: null == command ? _self.command : command // ignore: cast_nullable_to_non_nullable
as DocumentCommand,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of PlanStep
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentCommandCopyWith<$Res> get command {
  
  return $DocumentCommandCopyWith<$Res>(_self.command, (value) {
    return _then(_self.copyWith(command: value));
  });
}
}


/// @nodoc
mixin _$ExecutionPlan {

/// Stable UUID of this plan.
 String get id;/// The frozen textile operation this plan realises (invariant I6:
/// carried verbatim; see [wholeDesignRegeneration]).
@JsonKey(fromJson: _operationFromJson, toJson: _operationToJson) AiOperation get operation;/// Ordered steps (§6: the plan executes in order).
 List<PlanStep> get steps;/// Declared scope-mask ids (invariant I3) — ids only, never
/// resolved objects.
 List<String> get scopeMaskIds;/// Every node id this plan may affect — the step-7 superset each
/// job step's scope must stay inside (I3: scope ⊆ target).
 List<String> get affectedNodeIds;/// Credit estimates for the plan's job steps (the M12B seam;
/// estimation happens before compute, §6 step 6).
 List<CreditEstimate> get estimates;/// Invariant I6: a plan containing a `redesignTextilePrint` job must
/// carry this explicit label — the validator refuses unlabelled
/// whole-design work; nothing ever infers it.
 bool get wholeDesignRegeneration;/// Hash of the compiled planning prompt (the frozen
/// `AiProvenanceRecord.promptHash` linkage; no raw conversation).
 String get promptHash;/// The provider/model that proposed the plan (provenance
/// precursors, invariant I5).
@JsonKey(fromJson: _providerFromJson, toJson: _providerToJson) AiProviderId get provider; String get model;/// Versions of the guards that shaped the plan (the frozen
/// provenance-record versioning precedent).
 String get constraintVersion; String get toolVersion; Map<String, Object?> get metadata;
/// Create a copy of ExecutionPlan
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExecutionPlanCopyWith<ExecutionPlan> get copyWith => _$ExecutionPlanCopyWithImpl<ExecutionPlan>(this as ExecutionPlan, _$identity);

  /// Serializes this ExecutionPlan to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExecutionPlan&&(identical(other.id, id) || other.id == id)&&(identical(other.operation, operation) || other.operation == operation)&&const DeepCollectionEquality().equals(other.steps, steps)&&const DeepCollectionEquality().equals(other.scopeMaskIds, scopeMaskIds)&&const DeepCollectionEquality().equals(other.affectedNodeIds, affectedNodeIds)&&const DeepCollectionEquality().equals(other.estimates, estimates)&&(identical(other.wholeDesignRegeneration, wholeDesignRegeneration) || other.wholeDesignRegeneration == wholeDesignRegeneration)&&(identical(other.promptHash, promptHash) || other.promptHash == promptHash)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.model, model) || other.model == model)&&(identical(other.constraintVersion, constraintVersion) || other.constraintVersion == constraintVersion)&&(identical(other.toolVersion, toolVersion) || other.toolVersion == toolVersion)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,operation,const DeepCollectionEquality().hash(steps),const DeepCollectionEquality().hash(scopeMaskIds),const DeepCollectionEquality().hash(affectedNodeIds),const DeepCollectionEquality().hash(estimates),wholeDesignRegeneration,promptHash,provider,model,constraintVersion,toolVersion,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'ExecutionPlan(id: $id, operation: $operation, steps: $steps, scopeMaskIds: $scopeMaskIds, affectedNodeIds: $affectedNodeIds, estimates: $estimates, wholeDesignRegeneration: $wholeDesignRegeneration, promptHash: $promptHash, provider: $provider, model: $model, constraintVersion: $constraintVersion, toolVersion: $toolVersion, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $ExecutionPlanCopyWith<$Res>  {
  factory $ExecutionPlanCopyWith(ExecutionPlan value, $Res Function(ExecutionPlan) _then) = _$ExecutionPlanCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(fromJson: _operationFromJson, toJson: _operationToJson) AiOperation operation, List<PlanStep> steps, List<String> scopeMaskIds, List<String> affectedNodeIds, List<CreditEstimate> estimates, bool wholeDesignRegeneration, String promptHash,@JsonKey(fromJson: _providerFromJson, toJson: _providerToJson) AiProviderId provider, String model, String constraintVersion, String toolVersion, Map<String, Object?> metadata
});




}
/// @nodoc
class _$ExecutionPlanCopyWithImpl<$Res>
    implements $ExecutionPlanCopyWith<$Res> {
  _$ExecutionPlanCopyWithImpl(this._self, this._then);

  final ExecutionPlan _self;
  final $Res Function(ExecutionPlan) _then;

/// Create a copy of ExecutionPlan
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? operation = null,Object? steps = null,Object? scopeMaskIds = null,Object? affectedNodeIds = null,Object? estimates = null,Object? wholeDesignRegeneration = null,Object? promptHash = null,Object? provider = null,Object? model = null,Object? constraintVersion = null,Object? toolVersion = null,Object? metadata = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,operation: null == operation ? _self.operation : operation // ignore: cast_nullable_to_non_nullable
as AiOperation,steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as List<PlanStep>,scopeMaskIds: null == scopeMaskIds ? _self.scopeMaskIds : scopeMaskIds // ignore: cast_nullable_to_non_nullable
as List<String>,affectedNodeIds: null == affectedNodeIds ? _self.affectedNodeIds : affectedNodeIds // ignore: cast_nullable_to_non_nullable
as List<String>,estimates: null == estimates ? _self.estimates : estimates // ignore: cast_nullable_to_non_nullable
as List<CreditEstimate>,wholeDesignRegeneration: null == wholeDesignRegeneration ? _self.wholeDesignRegeneration : wholeDesignRegeneration // ignore: cast_nullable_to_non_nullable
as bool,promptHash: null == promptHash ? _self.promptHash : promptHash // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as AiProviderId,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,constraintVersion: null == constraintVersion ? _self.constraintVersion : constraintVersion // ignore: cast_nullable_to_non_nullable
as String,toolVersion: null == toolVersion ? _self.toolVersion : toolVersion // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

}


/// Adds pattern-matching-related methods to [ExecutionPlan].
extension ExecutionPlanPatterns on ExecutionPlan {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExecutionPlan value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExecutionPlan() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExecutionPlan value)  $default,){
final _that = this;
switch (_that) {
case _ExecutionPlan():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExecutionPlan value)?  $default,){
final _that = this;
switch (_that) {
case _ExecutionPlan() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(fromJson: _operationFromJson, toJson: _operationToJson)  AiOperation operation,  List<PlanStep> steps,  List<String> scopeMaskIds,  List<String> affectedNodeIds,  List<CreditEstimate> estimates,  bool wholeDesignRegeneration,  String promptHash, @JsonKey(fromJson: _providerFromJson, toJson: _providerToJson)  AiProviderId provider,  String model,  String constraintVersion,  String toolVersion,  Map<String, Object?> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExecutionPlan() when $default != null:
return $default(_that.id,_that.operation,_that.steps,_that.scopeMaskIds,_that.affectedNodeIds,_that.estimates,_that.wholeDesignRegeneration,_that.promptHash,_that.provider,_that.model,_that.constraintVersion,_that.toolVersion,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(fromJson: _operationFromJson, toJson: _operationToJson)  AiOperation operation,  List<PlanStep> steps,  List<String> scopeMaskIds,  List<String> affectedNodeIds,  List<CreditEstimate> estimates,  bool wholeDesignRegeneration,  String promptHash, @JsonKey(fromJson: _providerFromJson, toJson: _providerToJson)  AiProviderId provider,  String model,  String constraintVersion,  String toolVersion,  Map<String, Object?> metadata)  $default,) {final _that = this;
switch (_that) {
case _ExecutionPlan():
return $default(_that.id,_that.operation,_that.steps,_that.scopeMaskIds,_that.affectedNodeIds,_that.estimates,_that.wholeDesignRegeneration,_that.promptHash,_that.provider,_that.model,_that.constraintVersion,_that.toolVersion,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(fromJson: _operationFromJson, toJson: _operationToJson)  AiOperation operation,  List<PlanStep> steps,  List<String> scopeMaskIds,  List<String> affectedNodeIds,  List<CreditEstimate> estimates,  bool wholeDesignRegeneration,  String promptHash, @JsonKey(fromJson: _providerFromJson, toJson: _providerToJson)  AiProviderId provider,  String model,  String constraintVersion,  String toolVersion,  Map<String, Object?> metadata)?  $default,) {final _that = this;
switch (_that) {
case _ExecutionPlan() when $default != null:
return $default(_that.id,_that.operation,_that.steps,_that.scopeMaskIds,_that.affectedNodeIds,_that.estimates,_that.wholeDesignRegeneration,_that.promptHash,_that.provider,_that.model,_that.constraintVersion,_that.toolVersion,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExecutionPlan implements ExecutionPlan {
  const _ExecutionPlan({required this.id, @JsonKey(fromJson: _operationFromJson, toJson: _operationToJson) required this.operation, final  List<PlanStep> steps = const <PlanStep>[], final  List<String> scopeMaskIds = const <String>[], final  List<String> affectedNodeIds = const <String>[], final  List<CreditEstimate> estimates = const <CreditEstimate>[], this.wholeDesignRegeneration = false, required this.promptHash, @JsonKey(fromJson: _providerFromJson, toJson: _providerToJson) required this.provider, required this.model, required this.constraintVersion, required this.toolVersion, final  Map<String, Object?> metadata = const <String, Object?>{}}): _steps = steps,_scopeMaskIds = scopeMaskIds,_affectedNodeIds = affectedNodeIds,_estimates = estimates,_metadata = metadata;
  factory _ExecutionPlan.fromJson(Map<String, dynamic> json) => _$ExecutionPlanFromJson(json);

/// Stable UUID of this plan.
@override final  String id;
/// The frozen textile operation this plan realises (invariant I6:
/// carried verbatim; see [wholeDesignRegeneration]).
@override@JsonKey(fromJson: _operationFromJson, toJson: _operationToJson) final  AiOperation operation;
/// Ordered steps (§6: the plan executes in order).
 final  List<PlanStep> _steps;
/// Ordered steps (§6: the plan executes in order).
@override@JsonKey() List<PlanStep> get steps {
  if (_steps is EqualUnmodifiableListView) return _steps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_steps);
}

/// Declared scope-mask ids (invariant I3) — ids only, never
/// resolved objects.
 final  List<String> _scopeMaskIds;
/// Declared scope-mask ids (invariant I3) — ids only, never
/// resolved objects.
@override@JsonKey() List<String> get scopeMaskIds {
  if (_scopeMaskIds is EqualUnmodifiableListView) return _scopeMaskIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_scopeMaskIds);
}

/// Every node id this plan may affect — the step-7 superset each
/// job step's scope must stay inside (I3: scope ⊆ target).
 final  List<String> _affectedNodeIds;
/// Every node id this plan may affect — the step-7 superset each
/// job step's scope must stay inside (I3: scope ⊆ target).
@override@JsonKey() List<String> get affectedNodeIds {
  if (_affectedNodeIds is EqualUnmodifiableListView) return _affectedNodeIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_affectedNodeIds);
}

/// Credit estimates for the plan's job steps (the M12B seam;
/// estimation happens before compute, §6 step 6).
 final  List<CreditEstimate> _estimates;
/// Credit estimates for the plan's job steps (the M12B seam;
/// estimation happens before compute, §6 step 6).
@override@JsonKey() List<CreditEstimate> get estimates {
  if (_estimates is EqualUnmodifiableListView) return _estimates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_estimates);
}

/// Invariant I6: a plan containing a `redesignTextilePrint` job must
/// carry this explicit label — the validator refuses unlabelled
/// whole-design work; nothing ever infers it.
@override@JsonKey() final  bool wholeDesignRegeneration;
/// Hash of the compiled planning prompt (the frozen
/// `AiProvenanceRecord.promptHash` linkage; no raw conversation).
@override final  String promptHash;
/// The provider/model that proposed the plan (provenance
/// precursors, invariant I5).
@override@JsonKey(fromJson: _providerFromJson, toJson: _providerToJson) final  AiProviderId provider;
@override final  String model;
/// Versions of the guards that shaped the plan (the frozen
/// provenance-record versioning precedent).
@override final  String constraintVersion;
@override final  String toolVersion;
 final  Map<String, Object?> _metadata;
@override@JsonKey() Map<String, Object?> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of ExecutionPlan
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExecutionPlanCopyWith<_ExecutionPlan> get copyWith => __$ExecutionPlanCopyWithImpl<_ExecutionPlan>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExecutionPlanToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExecutionPlan&&(identical(other.id, id) || other.id == id)&&(identical(other.operation, operation) || other.operation == operation)&&const DeepCollectionEquality().equals(other._steps, _steps)&&const DeepCollectionEquality().equals(other._scopeMaskIds, _scopeMaskIds)&&const DeepCollectionEquality().equals(other._affectedNodeIds, _affectedNodeIds)&&const DeepCollectionEquality().equals(other._estimates, _estimates)&&(identical(other.wholeDesignRegeneration, wholeDesignRegeneration) || other.wholeDesignRegeneration == wholeDesignRegeneration)&&(identical(other.promptHash, promptHash) || other.promptHash == promptHash)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.model, model) || other.model == model)&&(identical(other.constraintVersion, constraintVersion) || other.constraintVersion == constraintVersion)&&(identical(other.toolVersion, toolVersion) || other.toolVersion == toolVersion)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,operation,const DeepCollectionEquality().hash(_steps),const DeepCollectionEquality().hash(_scopeMaskIds),const DeepCollectionEquality().hash(_affectedNodeIds),const DeepCollectionEquality().hash(_estimates),wholeDesignRegeneration,promptHash,provider,model,constraintVersion,toolVersion,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'ExecutionPlan(id: $id, operation: $operation, steps: $steps, scopeMaskIds: $scopeMaskIds, affectedNodeIds: $affectedNodeIds, estimates: $estimates, wholeDesignRegeneration: $wholeDesignRegeneration, promptHash: $promptHash, provider: $provider, model: $model, constraintVersion: $constraintVersion, toolVersion: $toolVersion, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$ExecutionPlanCopyWith<$Res> implements $ExecutionPlanCopyWith<$Res> {
  factory _$ExecutionPlanCopyWith(_ExecutionPlan value, $Res Function(_ExecutionPlan) _then) = __$ExecutionPlanCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(fromJson: _operationFromJson, toJson: _operationToJson) AiOperation operation, List<PlanStep> steps, List<String> scopeMaskIds, List<String> affectedNodeIds, List<CreditEstimate> estimates, bool wholeDesignRegeneration, String promptHash,@JsonKey(fromJson: _providerFromJson, toJson: _providerToJson) AiProviderId provider, String model, String constraintVersion, String toolVersion, Map<String, Object?> metadata
});




}
/// @nodoc
class __$ExecutionPlanCopyWithImpl<$Res>
    implements _$ExecutionPlanCopyWith<$Res> {
  __$ExecutionPlanCopyWithImpl(this._self, this._then);

  final _ExecutionPlan _self;
  final $Res Function(_ExecutionPlan) _then;

/// Create a copy of ExecutionPlan
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? operation = null,Object? steps = null,Object? scopeMaskIds = null,Object? affectedNodeIds = null,Object? estimates = null,Object? wholeDesignRegeneration = null,Object? promptHash = null,Object? provider = null,Object? model = null,Object? constraintVersion = null,Object? toolVersion = null,Object? metadata = null,}) {
  return _then(_ExecutionPlan(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,operation: null == operation ? _self.operation : operation // ignore: cast_nullable_to_non_nullable
as AiOperation,steps: null == steps ? _self._steps : steps // ignore: cast_nullable_to_non_nullable
as List<PlanStep>,scopeMaskIds: null == scopeMaskIds ? _self._scopeMaskIds : scopeMaskIds // ignore: cast_nullable_to_non_nullable
as List<String>,affectedNodeIds: null == affectedNodeIds ? _self._affectedNodeIds : affectedNodeIds // ignore: cast_nullable_to_non_nullable
as List<String>,estimates: null == estimates ? _self._estimates : estimates // ignore: cast_nullable_to_non_nullable
as List<CreditEstimate>,wholeDesignRegeneration: null == wholeDesignRegeneration ? _self.wholeDesignRegeneration : wholeDesignRegeneration // ignore: cast_nullable_to_non_nullable
as bool,promptHash: null == promptHash ? _self.promptHash : promptHash // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as AiProviderId,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,constraintVersion: null == constraintVersion ? _self.constraintVersion : constraintVersion // ignore: cast_nullable_to_non_nullable
as String,toolVersion: null == toolVersion ? _self.toolVersion : toolVersion // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}


/// @nodoc
mixin _$PlanViolation {

@JsonKey(fromJson: _violationKindFromJson, toJson: _violationKindToJson) PlanViolationKind get kind;/// 0-based index of the offending step, when step-specific.
 int? get stepIndex;/// The node/mask id that raised the violation, when target-specific.
 String? get targetId;/// Human-readable detail for UI/telemetry (e.g. the frozen
/// `LockState.reason`).
 String? get detail;
/// Create a copy of PlanViolation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlanViolationCopyWith<PlanViolation> get copyWith => _$PlanViolationCopyWithImpl<PlanViolation>(this as PlanViolation, _$identity);

  /// Serializes this PlanViolation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlanViolation&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.stepIndex, stepIndex) || other.stepIndex == stepIndex)&&(identical(other.targetId, targetId) || other.targetId == targetId)&&(identical(other.detail, detail) || other.detail == detail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,stepIndex,targetId,detail);

@override
String toString() {
  return 'PlanViolation(kind: $kind, stepIndex: $stepIndex, targetId: $targetId, detail: $detail)';
}


}

/// @nodoc
abstract mixin class $PlanViolationCopyWith<$Res>  {
  factory $PlanViolationCopyWith(PlanViolation value, $Res Function(PlanViolation) _then) = _$PlanViolationCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _violationKindFromJson, toJson: _violationKindToJson) PlanViolationKind kind, int? stepIndex, String? targetId, String? detail
});




}
/// @nodoc
class _$PlanViolationCopyWithImpl<$Res>
    implements $PlanViolationCopyWith<$Res> {
  _$PlanViolationCopyWithImpl(this._self, this._then);

  final PlanViolation _self;
  final $Res Function(PlanViolation) _then;

/// Create a copy of PlanViolation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? stepIndex = freezed,Object? targetId = freezed,Object? detail = freezed,}) {
  return _then(_self.copyWith(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as PlanViolationKind,stepIndex: freezed == stepIndex ? _self.stepIndex : stepIndex // ignore: cast_nullable_to_non_nullable
as int?,targetId: freezed == targetId ? _self.targetId : targetId // ignore: cast_nullable_to_non_nullable
as String?,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PlanViolation].
extension PlanViolationPatterns on PlanViolation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlanViolation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlanViolation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlanViolation value)  $default,){
final _that = this;
switch (_that) {
case _PlanViolation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlanViolation value)?  $default,){
final _that = this;
switch (_that) {
case _PlanViolation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _violationKindFromJson, toJson: _violationKindToJson)  PlanViolationKind kind,  int? stepIndex,  String? targetId,  String? detail)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlanViolation() when $default != null:
return $default(_that.kind,_that.stepIndex,_that.targetId,_that.detail);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _violationKindFromJson, toJson: _violationKindToJson)  PlanViolationKind kind,  int? stepIndex,  String? targetId,  String? detail)  $default,) {final _that = this;
switch (_that) {
case _PlanViolation():
return $default(_that.kind,_that.stepIndex,_that.targetId,_that.detail);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _violationKindFromJson, toJson: _violationKindToJson)  PlanViolationKind kind,  int? stepIndex,  String? targetId,  String? detail)?  $default,) {final _that = this;
switch (_that) {
case _PlanViolation() when $default != null:
return $default(_that.kind,_that.stepIndex,_that.targetId,_that.detail);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlanViolation implements PlanViolation {
  const _PlanViolation({@JsonKey(fromJson: _violationKindFromJson, toJson: _violationKindToJson) required this.kind, this.stepIndex, this.targetId, this.detail});
  factory _PlanViolation.fromJson(Map<String, dynamic> json) => _$PlanViolationFromJson(json);

@override@JsonKey(fromJson: _violationKindFromJson, toJson: _violationKindToJson) final  PlanViolationKind kind;
/// 0-based index of the offending step, when step-specific.
@override final  int? stepIndex;
/// The node/mask id that raised the violation, when target-specific.
@override final  String? targetId;
/// Human-readable detail for UI/telemetry (e.g. the frozen
/// `LockState.reason`).
@override final  String? detail;

/// Create a copy of PlanViolation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlanViolationCopyWith<_PlanViolation> get copyWith => __$PlanViolationCopyWithImpl<_PlanViolation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlanViolationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlanViolation&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.stepIndex, stepIndex) || other.stepIndex == stepIndex)&&(identical(other.targetId, targetId) || other.targetId == targetId)&&(identical(other.detail, detail) || other.detail == detail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,stepIndex,targetId,detail);

@override
String toString() {
  return 'PlanViolation(kind: $kind, stepIndex: $stepIndex, targetId: $targetId, detail: $detail)';
}


}

/// @nodoc
abstract mixin class _$PlanViolationCopyWith<$Res> implements $PlanViolationCopyWith<$Res> {
  factory _$PlanViolationCopyWith(_PlanViolation value, $Res Function(_PlanViolation) _then) = __$PlanViolationCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _violationKindFromJson, toJson: _violationKindToJson) PlanViolationKind kind, int? stepIndex, String? targetId, String? detail
});




}
/// @nodoc
class __$PlanViolationCopyWithImpl<$Res>
    implements _$PlanViolationCopyWith<$Res> {
  __$PlanViolationCopyWithImpl(this._self, this._then);

  final _PlanViolation _self;
  final $Res Function(_PlanViolation) _then;

/// Create a copy of PlanViolation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? stepIndex = freezed,Object? targetId = freezed,Object? detail = freezed,}) {
  return _then(_PlanViolation(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as PlanViolationKind,stepIndex: freezed == stepIndex ? _self.stepIndex : stepIndex // ignore: cast_nullable_to_non_nullable
as int?,targetId: freezed == targetId ? _self.targetId : targetId // ignore: cast_nullable_to_non_nullable
as String?,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PlanValidation {

 bool get valid; List<PlanViolation> get violations;
/// Create a copy of PlanValidation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlanValidationCopyWith<PlanValidation> get copyWith => _$PlanValidationCopyWithImpl<PlanValidation>(this as PlanValidation, _$identity);

  /// Serializes this PlanValidation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlanValidation&&(identical(other.valid, valid) || other.valid == valid)&&const DeepCollectionEquality().equals(other.violations, violations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,valid,const DeepCollectionEquality().hash(violations));

@override
String toString() {
  return 'PlanValidation(valid: $valid, violations: $violations)';
}


}

/// @nodoc
abstract mixin class $PlanValidationCopyWith<$Res>  {
  factory $PlanValidationCopyWith(PlanValidation value, $Res Function(PlanValidation) _then) = _$PlanValidationCopyWithImpl;
@useResult
$Res call({
 bool valid, List<PlanViolation> violations
});




}
/// @nodoc
class _$PlanValidationCopyWithImpl<$Res>
    implements $PlanValidationCopyWith<$Res> {
  _$PlanValidationCopyWithImpl(this._self, this._then);

  final PlanValidation _self;
  final $Res Function(PlanValidation) _then;

/// Create a copy of PlanValidation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? valid = null,Object? violations = null,}) {
  return _then(_self.copyWith(
valid: null == valid ? _self.valid : valid // ignore: cast_nullable_to_non_nullable
as bool,violations: null == violations ? _self.violations : violations // ignore: cast_nullable_to_non_nullable
as List<PlanViolation>,
  ));
}

}


/// Adds pattern-matching-related methods to [PlanValidation].
extension PlanValidationPatterns on PlanValidation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlanValidation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlanValidation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlanValidation value)  $default,){
final _that = this;
switch (_that) {
case _PlanValidation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlanValidation value)?  $default,){
final _that = this;
switch (_that) {
case _PlanValidation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool valid,  List<PlanViolation> violations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlanValidation() when $default != null:
return $default(_that.valid,_that.violations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool valid,  List<PlanViolation> violations)  $default,) {final _that = this;
switch (_that) {
case _PlanValidation():
return $default(_that.valid,_that.violations);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool valid,  List<PlanViolation> violations)?  $default,) {final _that = this;
switch (_that) {
case _PlanValidation() when $default != null:
return $default(_that.valid,_that.violations);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlanValidation extends PlanValidation {
  const _PlanValidation({required this.valid, final  List<PlanViolation> violations = const <PlanViolation>[]}): _violations = violations,super._();
  factory _PlanValidation.fromJson(Map<String, dynamic> json) => _$PlanValidationFromJson(json);

@override final  bool valid;
 final  List<PlanViolation> _violations;
@override@JsonKey() List<PlanViolation> get violations {
  if (_violations is EqualUnmodifiableListView) return _violations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_violations);
}


/// Create a copy of PlanValidation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlanValidationCopyWith<_PlanValidation> get copyWith => __$PlanValidationCopyWithImpl<_PlanValidation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlanValidationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlanValidation&&(identical(other.valid, valid) || other.valid == valid)&&const DeepCollectionEquality().equals(other._violations, _violations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,valid,const DeepCollectionEquality().hash(_violations));

@override
String toString() {
  return 'PlanValidation(valid: $valid, violations: $violations)';
}


}

/// @nodoc
abstract mixin class _$PlanValidationCopyWith<$Res> implements $PlanValidationCopyWith<$Res> {
  factory _$PlanValidationCopyWith(_PlanValidation value, $Res Function(_PlanValidation) _then) = __$PlanValidationCopyWithImpl;
@override @useResult
$Res call({
 bool valid, List<PlanViolation> violations
});




}
/// @nodoc
class __$PlanValidationCopyWithImpl<$Res>
    implements _$PlanValidationCopyWith<$Res> {
  __$PlanValidationCopyWithImpl(this._self, this._then);

  final _PlanValidation _self;
  final $Res Function(_PlanValidation) _then;

/// Create a copy of PlanValidation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? valid = null,Object? violations = null,}) {
  return _then(_PlanValidation(
valid: null == valid ? _self.valid : valid // ignore: cast_nullable_to_non_nullable
as bool,violations: null == violations ? _self._violations : violations // ignore: cast_nullable_to_non_nullable
as List<PlanViolation>,
  ));
}


}

// dart format on
