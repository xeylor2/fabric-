// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'execution_outcome.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExecutionAttempt {

/// The `RoutedCandidate.profileId` attempted.
 String get profileId;/// The candidate's provider (frozen vocabulary).
@JsonKey(fromJson: _providerFromJson, toJson: _providerToJson) AiProviderId get provider;/// The candidate's model, when listed.
 String? get model;/// Whether this attempt produced a successful provider response.
 bool get succeeded;/// Why the attempt did not succeed (missing adapter, or the frozen
/// `ProviderResponse.error`).
 String? get error;
/// Create a copy of ExecutionAttempt
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExecutionAttemptCopyWith<ExecutionAttempt> get copyWith => _$ExecutionAttemptCopyWithImpl<ExecutionAttempt>(this as ExecutionAttempt, _$identity);

  /// Serializes this ExecutionAttempt to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExecutionAttempt&&(identical(other.profileId, profileId) || other.profileId == profileId)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.model, model) || other.model == model)&&(identical(other.succeeded, succeeded) || other.succeeded == succeeded)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,profileId,provider,model,succeeded,error);

@override
String toString() {
  return 'ExecutionAttempt(profileId: $profileId, provider: $provider, model: $model, succeeded: $succeeded, error: $error)';
}


}

/// @nodoc
abstract mixin class $ExecutionAttemptCopyWith<$Res>  {
  factory $ExecutionAttemptCopyWith(ExecutionAttempt value, $Res Function(ExecutionAttempt) _then) = _$ExecutionAttemptCopyWithImpl;
@useResult
$Res call({
 String profileId,@JsonKey(fromJson: _providerFromJson, toJson: _providerToJson) AiProviderId provider, String? model, bool succeeded, String? error
});




}
/// @nodoc
class _$ExecutionAttemptCopyWithImpl<$Res>
    implements $ExecutionAttemptCopyWith<$Res> {
  _$ExecutionAttemptCopyWithImpl(this._self, this._then);

  final ExecutionAttempt _self;
  final $Res Function(ExecutionAttempt) _then;

/// Create a copy of ExecutionAttempt
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? profileId = null,Object? provider = null,Object? model = freezed,Object? succeeded = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
profileId: null == profileId ? _self.profileId : profileId // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as AiProviderId,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,succeeded: null == succeeded ? _self.succeeded : succeeded // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ExecutionAttempt].
extension ExecutionAttemptPatterns on ExecutionAttempt {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExecutionAttempt value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExecutionAttempt() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExecutionAttempt value)  $default,){
final _that = this;
switch (_that) {
case _ExecutionAttempt():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExecutionAttempt value)?  $default,){
final _that = this;
switch (_that) {
case _ExecutionAttempt() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String profileId, @JsonKey(fromJson: _providerFromJson, toJson: _providerToJson)  AiProviderId provider,  String? model,  bool succeeded,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExecutionAttempt() when $default != null:
return $default(_that.profileId,_that.provider,_that.model,_that.succeeded,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String profileId, @JsonKey(fromJson: _providerFromJson, toJson: _providerToJson)  AiProviderId provider,  String? model,  bool succeeded,  String? error)  $default,) {final _that = this;
switch (_that) {
case _ExecutionAttempt():
return $default(_that.profileId,_that.provider,_that.model,_that.succeeded,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String profileId, @JsonKey(fromJson: _providerFromJson, toJson: _providerToJson)  AiProviderId provider,  String? model,  bool succeeded,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _ExecutionAttempt() when $default != null:
return $default(_that.profileId,_that.provider,_that.model,_that.succeeded,_that.error);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExecutionAttempt implements ExecutionAttempt {
  const _ExecutionAttempt({required this.profileId, @JsonKey(fromJson: _providerFromJson, toJson: _providerToJson) required this.provider, this.model, required this.succeeded, this.error});
  factory _ExecutionAttempt.fromJson(Map<String, dynamic> json) => _$ExecutionAttemptFromJson(json);

/// The `RoutedCandidate.profileId` attempted.
@override final  String profileId;
/// The candidate's provider (frozen vocabulary).
@override@JsonKey(fromJson: _providerFromJson, toJson: _providerToJson) final  AiProviderId provider;
/// The candidate's model, when listed.
@override final  String? model;
/// Whether this attempt produced a successful provider response.
@override final  bool succeeded;
/// Why the attempt did not succeed (missing adapter, or the frozen
/// `ProviderResponse.error`).
@override final  String? error;

/// Create a copy of ExecutionAttempt
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExecutionAttemptCopyWith<_ExecutionAttempt> get copyWith => __$ExecutionAttemptCopyWithImpl<_ExecutionAttempt>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExecutionAttemptToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExecutionAttempt&&(identical(other.profileId, profileId) || other.profileId == profileId)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.model, model) || other.model == model)&&(identical(other.succeeded, succeeded) || other.succeeded == succeeded)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,profileId,provider,model,succeeded,error);

@override
String toString() {
  return 'ExecutionAttempt(profileId: $profileId, provider: $provider, model: $model, succeeded: $succeeded, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ExecutionAttemptCopyWith<$Res> implements $ExecutionAttemptCopyWith<$Res> {
  factory _$ExecutionAttemptCopyWith(_ExecutionAttempt value, $Res Function(_ExecutionAttempt) _then) = __$ExecutionAttemptCopyWithImpl;
@override @useResult
$Res call({
 String profileId,@JsonKey(fromJson: _providerFromJson, toJson: _providerToJson) AiProviderId provider, String? model, bool succeeded, String? error
});




}
/// @nodoc
class __$ExecutionAttemptCopyWithImpl<$Res>
    implements _$ExecutionAttemptCopyWith<$Res> {
  __$ExecutionAttemptCopyWithImpl(this._self, this._then);

  final _ExecutionAttempt _self;
  final $Res Function(_ExecutionAttempt) _then;

/// Create a copy of ExecutionAttempt
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? profileId = null,Object? provider = null,Object? model = freezed,Object? succeeded = null,Object? error = freezed,}) {
  return _then(_ExecutionAttempt(
profileId: null == profileId ? _self.profileId : profileId // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as AiProviderId,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,succeeded: null == succeeded ? _self.succeeded : succeeded // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

ExecutionOutcome _$ExecutionOutcomeFromJson(
  Map<String, dynamic> json
) {
        switch (json['kind']) {
                  case 'executed':
          return ExecutionExecuted.fromJson(
            json
          );
                case 'failed':
          return ExecutionFailed.fromJson(
            json
          );
                case 'not_executed':
          return ExecutionNotExecuted.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'kind',
  'ExecutionOutcome',
  'Invalid union type "${json['kind']}"!'
);
        }
      
}

/// @nodoc
mixin _$ExecutionOutcome {

 AiJob get job; List<ExecutionAttempt> get attempts;
/// Create a copy of ExecutionOutcome
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExecutionOutcomeCopyWith<ExecutionOutcome> get copyWith => _$ExecutionOutcomeCopyWithImpl<ExecutionOutcome>(this as ExecutionOutcome, _$identity);

  /// Serializes this ExecutionOutcome to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExecutionOutcome&&(identical(other.job, job) || other.job == job)&&const DeepCollectionEquality().equals(other.attempts, attempts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,job,const DeepCollectionEquality().hash(attempts));

@override
String toString() {
  return 'ExecutionOutcome(job: $job, attempts: $attempts)';
}


}

/// @nodoc
abstract mixin class $ExecutionOutcomeCopyWith<$Res>  {
  factory $ExecutionOutcomeCopyWith(ExecutionOutcome value, $Res Function(ExecutionOutcome) _then) = _$ExecutionOutcomeCopyWithImpl;
@useResult
$Res call({
 AiJob job, List<ExecutionAttempt> attempts
});


$AiJobCopyWith<$Res> get job;

}
/// @nodoc
class _$ExecutionOutcomeCopyWithImpl<$Res>
    implements $ExecutionOutcomeCopyWith<$Res> {
  _$ExecutionOutcomeCopyWithImpl(this._self, this._then);

  final ExecutionOutcome _self;
  final $Res Function(ExecutionOutcome) _then;

/// Create a copy of ExecutionOutcome
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? job = null,Object? attempts = null,}) {
  return _then(_self.copyWith(
job: null == job ? _self.job : job // ignore: cast_nullable_to_non_nullable
as AiJob,attempts: null == attempts ? _self.attempts : attempts // ignore: cast_nullable_to_non_nullable
as List<ExecutionAttempt>,
  ));
}
/// Create a copy of ExecutionOutcome
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AiJobCopyWith<$Res> get job {
  
  return $AiJobCopyWith<$Res>(_self.job, (value) {
    return _then(_self.copyWith(job: value));
  });
}
}


/// Adds pattern-matching-related methods to [ExecutionOutcome].
extension ExecutionOutcomePatterns on ExecutionOutcome {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ExecutionExecuted value)?  executed,TResult Function( ExecutionFailed value)?  failed,TResult Function( ExecutionNotExecuted value)?  notExecuted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ExecutionExecuted() when executed != null:
return executed(_that);case ExecutionFailed() when failed != null:
return failed(_that);case ExecutionNotExecuted() when notExecuted != null:
return notExecuted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ExecutionExecuted value)  executed,required TResult Function( ExecutionFailed value)  failed,required TResult Function( ExecutionNotExecuted value)  notExecuted,}){
final _that = this;
switch (_that) {
case ExecutionExecuted():
return executed(_that);case ExecutionFailed():
return failed(_that);case ExecutionNotExecuted():
return notExecuted(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ExecutionExecuted value)?  executed,TResult? Function( ExecutionFailed value)?  failed,TResult? Function( ExecutionNotExecuted value)?  notExecuted,}){
final _that = this;
switch (_that) {
case ExecutionExecuted() when executed != null:
return executed(_that);case ExecutionFailed() when failed != null:
return failed(_that);case ExecutionNotExecuted() when notExecuted != null:
return notExecuted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( AiJob job,  String proposalId,  List<ExecutionAttempt> attempts)?  executed,TResult Function( AiJob job,  List<ExecutionAttempt> attempts)?  failed,TResult Function( AiJob job,  List<ExecutionAttempt> attempts,  String? detail)?  notExecuted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ExecutionExecuted() when executed != null:
return executed(_that.job,_that.proposalId,_that.attempts);case ExecutionFailed() when failed != null:
return failed(_that.job,_that.attempts);case ExecutionNotExecuted() when notExecuted != null:
return notExecuted(_that.job,_that.attempts,_that.detail);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( AiJob job,  String proposalId,  List<ExecutionAttempt> attempts)  executed,required TResult Function( AiJob job,  List<ExecutionAttempt> attempts)  failed,required TResult Function( AiJob job,  List<ExecutionAttempt> attempts,  String? detail)  notExecuted,}) {final _that = this;
switch (_that) {
case ExecutionExecuted():
return executed(_that.job,_that.proposalId,_that.attempts);case ExecutionFailed():
return failed(_that.job,_that.attempts);case ExecutionNotExecuted():
return notExecuted(_that.job,_that.attempts,_that.detail);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( AiJob job,  String proposalId,  List<ExecutionAttempt> attempts)?  executed,TResult? Function( AiJob job,  List<ExecutionAttempt> attempts)?  failed,TResult? Function( AiJob job,  List<ExecutionAttempt> attempts,  String? detail)?  notExecuted,}) {final _that = this;
switch (_that) {
case ExecutionExecuted() when executed != null:
return executed(_that.job,_that.proposalId,_that.attempts);case ExecutionFailed() when failed != null:
return failed(_that.job,_that.attempts);case ExecutionNotExecuted() when notExecuted != null:
return notExecuted(_that.job,_that.attempts,_that.detail);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class ExecutionExecuted implements ExecutionOutcome {
  const ExecutionExecuted({required this.job, required this.proposalId, final  List<ExecutionAttempt> attempts = const <ExecutionAttempt>[], final  String? $type}): _attempts = attempts,$type = $type ?? 'executed';
  factory ExecutionExecuted.fromJson(Map<String, dynamic> json) => _$ExecutionExecutedFromJson(json);

@override final  AiJob job;
 final  String proposalId;
 final  List<ExecutionAttempt> _attempts;
@override@JsonKey() List<ExecutionAttempt> get attempts {
  if (_attempts is EqualUnmodifiableListView) return _attempts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attempts);
}


@JsonKey(name: 'kind')
final String $type;


/// Create a copy of ExecutionOutcome
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExecutionExecutedCopyWith<ExecutionExecuted> get copyWith => _$ExecutionExecutedCopyWithImpl<ExecutionExecuted>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExecutionExecutedToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExecutionExecuted&&(identical(other.job, job) || other.job == job)&&(identical(other.proposalId, proposalId) || other.proposalId == proposalId)&&const DeepCollectionEquality().equals(other._attempts, _attempts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,job,proposalId,const DeepCollectionEquality().hash(_attempts));

@override
String toString() {
  return 'ExecutionOutcome.executed(job: $job, proposalId: $proposalId, attempts: $attempts)';
}


}

/// @nodoc
abstract mixin class $ExecutionExecutedCopyWith<$Res> implements $ExecutionOutcomeCopyWith<$Res> {
  factory $ExecutionExecutedCopyWith(ExecutionExecuted value, $Res Function(ExecutionExecuted) _then) = _$ExecutionExecutedCopyWithImpl;
@override @useResult
$Res call({
 AiJob job, String proposalId, List<ExecutionAttempt> attempts
});


@override $AiJobCopyWith<$Res> get job;

}
/// @nodoc
class _$ExecutionExecutedCopyWithImpl<$Res>
    implements $ExecutionExecutedCopyWith<$Res> {
  _$ExecutionExecutedCopyWithImpl(this._self, this._then);

  final ExecutionExecuted _self;
  final $Res Function(ExecutionExecuted) _then;

/// Create a copy of ExecutionOutcome
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? job = null,Object? proposalId = null,Object? attempts = null,}) {
  return _then(ExecutionExecuted(
job: null == job ? _self.job : job // ignore: cast_nullable_to_non_nullable
as AiJob,proposalId: null == proposalId ? _self.proposalId : proposalId // ignore: cast_nullable_to_non_nullable
as String,attempts: null == attempts ? _self._attempts : attempts // ignore: cast_nullable_to_non_nullable
as List<ExecutionAttempt>,
  ));
}

/// Create a copy of ExecutionOutcome
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AiJobCopyWith<$Res> get job {
  
  return $AiJobCopyWith<$Res>(_self.job, (value) {
    return _then(_self.copyWith(job: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class ExecutionFailed implements ExecutionOutcome {
  const ExecutionFailed({required this.job, final  List<ExecutionAttempt> attempts = const <ExecutionAttempt>[], final  String? $type}): _attempts = attempts,$type = $type ?? 'failed';
  factory ExecutionFailed.fromJson(Map<String, dynamic> json) => _$ExecutionFailedFromJson(json);

@override final  AiJob job;
 final  List<ExecutionAttempt> _attempts;
@override@JsonKey() List<ExecutionAttempt> get attempts {
  if (_attempts is EqualUnmodifiableListView) return _attempts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attempts);
}


@JsonKey(name: 'kind')
final String $type;


/// Create a copy of ExecutionOutcome
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExecutionFailedCopyWith<ExecutionFailed> get copyWith => _$ExecutionFailedCopyWithImpl<ExecutionFailed>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExecutionFailedToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExecutionFailed&&(identical(other.job, job) || other.job == job)&&const DeepCollectionEquality().equals(other._attempts, _attempts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,job,const DeepCollectionEquality().hash(_attempts));

@override
String toString() {
  return 'ExecutionOutcome.failed(job: $job, attempts: $attempts)';
}


}

/// @nodoc
abstract mixin class $ExecutionFailedCopyWith<$Res> implements $ExecutionOutcomeCopyWith<$Res> {
  factory $ExecutionFailedCopyWith(ExecutionFailed value, $Res Function(ExecutionFailed) _then) = _$ExecutionFailedCopyWithImpl;
@override @useResult
$Res call({
 AiJob job, List<ExecutionAttempt> attempts
});


@override $AiJobCopyWith<$Res> get job;

}
/// @nodoc
class _$ExecutionFailedCopyWithImpl<$Res>
    implements $ExecutionFailedCopyWith<$Res> {
  _$ExecutionFailedCopyWithImpl(this._self, this._then);

  final ExecutionFailed _self;
  final $Res Function(ExecutionFailed) _then;

/// Create a copy of ExecutionOutcome
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? job = null,Object? attempts = null,}) {
  return _then(ExecutionFailed(
job: null == job ? _self.job : job // ignore: cast_nullable_to_non_nullable
as AiJob,attempts: null == attempts ? _self._attempts : attempts // ignore: cast_nullable_to_non_nullable
as List<ExecutionAttempt>,
  ));
}

/// Create a copy of ExecutionOutcome
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AiJobCopyWith<$Res> get job {
  
  return $AiJobCopyWith<$Res>(_self.job, (value) {
    return _then(_self.copyWith(job: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class ExecutionNotExecuted implements ExecutionOutcome {
  const ExecutionNotExecuted({required this.job, final  List<ExecutionAttempt> attempts = const <ExecutionAttempt>[], this.detail, final  String? $type}): _attempts = attempts,$type = $type ?? 'not_executed';
  factory ExecutionNotExecuted.fromJson(Map<String, dynamic> json) => _$ExecutionNotExecutedFromJson(json);

@override final  AiJob job;
 final  List<ExecutionAttempt> _attempts;
@override@JsonKey() List<ExecutionAttempt> get attempts {
  if (_attempts is EqualUnmodifiableListView) return _attempts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attempts);
}

 final  String? detail;

@JsonKey(name: 'kind')
final String $type;


/// Create a copy of ExecutionOutcome
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExecutionNotExecutedCopyWith<ExecutionNotExecuted> get copyWith => _$ExecutionNotExecutedCopyWithImpl<ExecutionNotExecuted>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExecutionNotExecutedToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExecutionNotExecuted&&(identical(other.job, job) || other.job == job)&&const DeepCollectionEquality().equals(other._attempts, _attempts)&&(identical(other.detail, detail) || other.detail == detail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,job,const DeepCollectionEquality().hash(_attempts),detail);

@override
String toString() {
  return 'ExecutionOutcome.notExecuted(job: $job, attempts: $attempts, detail: $detail)';
}


}

/// @nodoc
abstract mixin class $ExecutionNotExecutedCopyWith<$Res> implements $ExecutionOutcomeCopyWith<$Res> {
  factory $ExecutionNotExecutedCopyWith(ExecutionNotExecuted value, $Res Function(ExecutionNotExecuted) _then) = _$ExecutionNotExecutedCopyWithImpl;
@override @useResult
$Res call({
 AiJob job, List<ExecutionAttempt> attempts, String? detail
});


@override $AiJobCopyWith<$Res> get job;

}
/// @nodoc
class _$ExecutionNotExecutedCopyWithImpl<$Res>
    implements $ExecutionNotExecutedCopyWith<$Res> {
  _$ExecutionNotExecutedCopyWithImpl(this._self, this._then);

  final ExecutionNotExecuted _self;
  final $Res Function(ExecutionNotExecuted) _then;

/// Create a copy of ExecutionOutcome
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? job = null,Object? attempts = null,Object? detail = freezed,}) {
  return _then(ExecutionNotExecuted(
job: null == job ? _self.job : job // ignore: cast_nullable_to_non_nullable
as AiJob,attempts: null == attempts ? _self._attempts : attempts // ignore: cast_nullable_to_non_nullable
as List<ExecutionAttempt>,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ExecutionOutcome
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AiJobCopyWith<$Res> get job {
  
  return $AiJobCopyWith<$Res>(_self.job, (value) {
    return _then(_self.copyWith(job: value));
  });
}
}

// dart format on
