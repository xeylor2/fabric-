// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_router.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RoutedCandidate {

/// The [ProviderProfile.id] this candidate refers to.
 String get profileId;/// The candidate's provider (frozen vocabulary).
@JsonKey(fromJson: _providerFromJson, toJson: _providerToJson) AiProviderId get provider;/// The profile's first-preference model, or null when the profile
/// lists none (the orchestrator then picks concretely).
 String? get model;/// 0-based rank (0 = best).
 int get rank;
/// Create a copy of RoutedCandidate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoutedCandidateCopyWith<RoutedCandidate> get copyWith => _$RoutedCandidateCopyWithImpl<RoutedCandidate>(this as RoutedCandidate, _$identity);

  /// Serializes this RoutedCandidate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoutedCandidate&&(identical(other.profileId, profileId) || other.profileId == profileId)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.model, model) || other.model == model)&&(identical(other.rank, rank) || other.rank == rank));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,profileId,provider,model,rank);

@override
String toString() {
  return 'RoutedCandidate(profileId: $profileId, provider: $provider, model: $model, rank: $rank)';
}


}

/// @nodoc
abstract mixin class $RoutedCandidateCopyWith<$Res>  {
  factory $RoutedCandidateCopyWith(RoutedCandidate value, $Res Function(RoutedCandidate) _then) = _$RoutedCandidateCopyWithImpl;
@useResult
$Res call({
 String profileId,@JsonKey(fromJson: _providerFromJson, toJson: _providerToJson) AiProviderId provider, String? model, int rank
});




}
/// @nodoc
class _$RoutedCandidateCopyWithImpl<$Res>
    implements $RoutedCandidateCopyWith<$Res> {
  _$RoutedCandidateCopyWithImpl(this._self, this._then);

  final RoutedCandidate _self;
  final $Res Function(RoutedCandidate) _then;

/// Create a copy of RoutedCandidate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? profileId = null,Object? provider = null,Object? model = freezed,Object? rank = null,}) {
  return _then(_self.copyWith(
profileId: null == profileId ? _self.profileId : profileId // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as AiProviderId,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RoutedCandidate].
extension RoutedCandidatePatterns on RoutedCandidate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoutedCandidate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoutedCandidate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoutedCandidate value)  $default,){
final _that = this;
switch (_that) {
case _RoutedCandidate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoutedCandidate value)?  $default,){
final _that = this;
switch (_that) {
case _RoutedCandidate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String profileId, @JsonKey(fromJson: _providerFromJson, toJson: _providerToJson)  AiProviderId provider,  String? model,  int rank)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoutedCandidate() when $default != null:
return $default(_that.profileId,_that.provider,_that.model,_that.rank);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String profileId, @JsonKey(fromJson: _providerFromJson, toJson: _providerToJson)  AiProviderId provider,  String? model,  int rank)  $default,) {final _that = this;
switch (_that) {
case _RoutedCandidate():
return $default(_that.profileId,_that.provider,_that.model,_that.rank);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String profileId, @JsonKey(fromJson: _providerFromJson, toJson: _providerToJson)  AiProviderId provider,  String? model,  int rank)?  $default,) {final _that = this;
switch (_that) {
case _RoutedCandidate() when $default != null:
return $default(_that.profileId,_that.provider,_that.model,_that.rank);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoutedCandidate implements RoutedCandidate {
  const _RoutedCandidate({required this.profileId, @JsonKey(fromJson: _providerFromJson, toJson: _providerToJson) required this.provider, this.model, required this.rank});
  factory _RoutedCandidate.fromJson(Map<String, dynamic> json) => _$RoutedCandidateFromJson(json);

/// The [ProviderProfile.id] this candidate refers to.
@override final  String profileId;
/// The candidate's provider (frozen vocabulary).
@override@JsonKey(fromJson: _providerFromJson, toJson: _providerToJson) final  AiProviderId provider;
/// The profile's first-preference model, or null when the profile
/// lists none (the orchestrator then picks concretely).
@override final  String? model;
/// 0-based rank (0 = best).
@override final  int rank;

/// Create a copy of RoutedCandidate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoutedCandidateCopyWith<_RoutedCandidate> get copyWith => __$RoutedCandidateCopyWithImpl<_RoutedCandidate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoutedCandidateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoutedCandidate&&(identical(other.profileId, profileId) || other.profileId == profileId)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.model, model) || other.model == model)&&(identical(other.rank, rank) || other.rank == rank));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,profileId,provider,model,rank);

@override
String toString() {
  return 'RoutedCandidate(profileId: $profileId, provider: $provider, model: $model, rank: $rank)';
}


}

/// @nodoc
abstract mixin class _$RoutedCandidateCopyWith<$Res> implements $RoutedCandidateCopyWith<$Res> {
  factory _$RoutedCandidateCopyWith(_RoutedCandidate value, $Res Function(_RoutedCandidate) _then) = __$RoutedCandidateCopyWithImpl;
@override @useResult
$Res call({
 String profileId,@JsonKey(fromJson: _providerFromJson, toJson: _providerToJson) AiProviderId provider, String? model, int rank
});




}
/// @nodoc
class __$RoutedCandidateCopyWithImpl<$Res>
    implements _$RoutedCandidateCopyWith<$Res> {
  __$RoutedCandidateCopyWithImpl(this._self, this._then);

  final _RoutedCandidate _self;
  final $Res Function(_RoutedCandidate) _then;

/// Create a copy of RoutedCandidate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? profileId = null,Object? provider = null,Object? model = freezed,Object? rank = null,}) {
  return _then(_RoutedCandidate(
profileId: null == profileId ? _self.profileId : profileId // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as AiProviderId,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

RoutingDecision _$RoutingDecisionFromJson(
  Map<String, dynamic> json
) {
        switch (json['kind']) {
                  case 'routed':
          return RoutingRouted.fromJson(
            json
          );
                case 'noRoute':
          return RoutingNoRoute.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'kind',
  'RoutingDecision',
  'Invalid union type "${json['kind']}"!'
);
        }
      
}

/// @nodoc
mixin _$RoutingDecision {



  /// Serializes this RoutingDecision to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoutingDecision);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RoutingDecision()';
}


}

/// @nodoc
class $RoutingDecisionCopyWith<$Res>  {
$RoutingDecisionCopyWith(RoutingDecision _, $Res Function(RoutingDecision) __);
}


/// Adds pattern-matching-related methods to [RoutingDecision].
extension RoutingDecisionPatterns on RoutingDecision {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RoutingRouted value)?  routed,TResult Function( RoutingNoRoute value)?  noRoute,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RoutingRouted() when routed != null:
return routed(_that);case RoutingNoRoute() when noRoute != null:
return noRoute(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RoutingRouted value)  routed,required TResult Function( RoutingNoRoute value)  noRoute,}){
final _that = this;
switch (_that) {
case RoutingRouted():
return routed(_that);case RoutingNoRoute():
return noRoute(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RoutingRouted value)?  routed,TResult? Function( RoutingNoRoute value)?  noRoute,}){
final _that = this;
switch (_that) {
case RoutingRouted() when routed != null:
return routed(_that);case RoutingNoRoute() when noRoute != null:
return noRoute(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( AiJob job,  List<RoutedCandidate> candidates)?  routed,TResult Function(@JsonKey(fromJson: _reasonFromJson, toJson: _reasonToJson)  NoRouteReason reason,  String? detail)?  noRoute,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RoutingRouted() when routed != null:
return routed(_that.job,_that.candidates);case RoutingNoRoute() when noRoute != null:
return noRoute(_that.reason,_that.detail);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( AiJob job,  List<RoutedCandidate> candidates)  routed,required TResult Function(@JsonKey(fromJson: _reasonFromJson, toJson: _reasonToJson)  NoRouteReason reason,  String? detail)  noRoute,}) {final _that = this;
switch (_that) {
case RoutingRouted():
return routed(_that.job,_that.candidates);case RoutingNoRoute():
return noRoute(_that.reason,_that.detail);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( AiJob job,  List<RoutedCandidate> candidates)?  routed,TResult? Function(@JsonKey(fromJson: _reasonFromJson, toJson: _reasonToJson)  NoRouteReason reason,  String? detail)?  noRoute,}) {final _that = this;
switch (_that) {
case RoutingRouted() when routed != null:
return routed(_that.job,_that.candidates);case RoutingNoRoute() when noRoute != null:
return noRoute(_that.reason,_that.detail);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class RoutingRouted implements RoutingDecision {
  const RoutingRouted({required this.job, required final  List<RoutedCandidate> candidates, final  String? $type}): _candidates = candidates,$type = $type ?? 'routed';
  factory RoutingRouted.fromJson(Map<String, dynamic> json) => _$RoutingRoutedFromJson(json);

 final  AiJob job;
 final  List<RoutedCandidate> _candidates;
 List<RoutedCandidate> get candidates {
  if (_candidates is EqualUnmodifiableListView) return _candidates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_candidates);
}


@JsonKey(name: 'kind')
final String $type;


/// Create a copy of RoutingDecision
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoutingRoutedCopyWith<RoutingRouted> get copyWith => _$RoutingRoutedCopyWithImpl<RoutingRouted>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoutingRoutedToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoutingRouted&&(identical(other.job, job) || other.job == job)&&const DeepCollectionEquality().equals(other._candidates, _candidates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,job,const DeepCollectionEquality().hash(_candidates));

@override
String toString() {
  return 'RoutingDecision.routed(job: $job, candidates: $candidates)';
}


}

/// @nodoc
abstract mixin class $RoutingRoutedCopyWith<$Res> implements $RoutingDecisionCopyWith<$Res> {
  factory $RoutingRoutedCopyWith(RoutingRouted value, $Res Function(RoutingRouted) _then) = _$RoutingRoutedCopyWithImpl;
@useResult
$Res call({
 AiJob job, List<RoutedCandidate> candidates
});


$AiJobCopyWith<$Res> get job;

}
/// @nodoc
class _$RoutingRoutedCopyWithImpl<$Res>
    implements $RoutingRoutedCopyWith<$Res> {
  _$RoutingRoutedCopyWithImpl(this._self, this._then);

  final RoutingRouted _self;
  final $Res Function(RoutingRouted) _then;

/// Create a copy of RoutingDecision
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? job = null,Object? candidates = null,}) {
  return _then(RoutingRouted(
job: null == job ? _self.job : job // ignore: cast_nullable_to_non_nullable
as AiJob,candidates: null == candidates ? _self._candidates : candidates // ignore: cast_nullable_to_non_nullable
as List<RoutedCandidate>,
  ));
}

/// Create a copy of RoutingDecision
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

class RoutingNoRoute implements RoutingDecision {
  const RoutingNoRoute({@JsonKey(fromJson: _reasonFromJson, toJson: _reasonToJson) required this.reason, this.detail, final  String? $type}): $type = $type ?? 'noRoute';
  factory RoutingNoRoute.fromJson(Map<String, dynamic> json) => _$RoutingNoRouteFromJson(json);

@JsonKey(fromJson: _reasonFromJson, toJson: _reasonToJson) final  NoRouteReason reason;
/// Human-readable detail for UI/telemetry.
 final  String? detail;

@JsonKey(name: 'kind')
final String $type;


/// Create a copy of RoutingDecision
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoutingNoRouteCopyWith<RoutingNoRoute> get copyWith => _$RoutingNoRouteCopyWithImpl<RoutingNoRoute>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoutingNoRouteToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoutingNoRoute&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.detail, detail) || other.detail == detail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reason,detail);

@override
String toString() {
  return 'RoutingDecision.noRoute(reason: $reason, detail: $detail)';
}


}

/// @nodoc
abstract mixin class $RoutingNoRouteCopyWith<$Res> implements $RoutingDecisionCopyWith<$Res> {
  factory $RoutingNoRouteCopyWith(RoutingNoRoute value, $Res Function(RoutingNoRoute) _then) = _$RoutingNoRouteCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _reasonFromJson, toJson: _reasonToJson) NoRouteReason reason, String? detail
});




}
/// @nodoc
class _$RoutingNoRouteCopyWithImpl<$Res>
    implements $RoutingNoRouteCopyWith<$Res> {
  _$RoutingNoRouteCopyWithImpl(this._self, this._then);

  final RoutingNoRoute _self;
  final $Res Function(RoutingNoRoute) _then;

/// Create a copy of RoutingDecision
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? reason = null,Object? detail = freezed,}) {
  return _then(RoutingNoRoute(
reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as NoRouteReason,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
