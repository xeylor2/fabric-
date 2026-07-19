// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'credit_estimate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreditEstimate {

/// The job priced.
 String get jobId;/// Whole-credit estimate (credits are counted units — the frozen
/// `core_plugin` permission `use_ai_credits`).
 int get credits;/// Named components summing to [credits] — the §6 plan surface shows
/// the user *why*.
 Map<String, int> get breakdown;/// Version of the estimator that produced this estimate.
 String get estimatorVersion; Map<String, Object?> get metadata;
/// Create a copy of CreditEstimate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreditEstimateCopyWith<CreditEstimate> get copyWith => _$CreditEstimateCopyWithImpl<CreditEstimate>(this as CreditEstimate, _$identity);

  /// Serializes this CreditEstimate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreditEstimate&&(identical(other.jobId, jobId) || other.jobId == jobId)&&(identical(other.credits, credits) || other.credits == credits)&&const DeepCollectionEquality().equals(other.breakdown, breakdown)&&(identical(other.estimatorVersion, estimatorVersion) || other.estimatorVersion == estimatorVersion)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,jobId,credits,const DeepCollectionEquality().hash(breakdown),estimatorVersion,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'CreditEstimate(jobId: $jobId, credits: $credits, breakdown: $breakdown, estimatorVersion: $estimatorVersion, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $CreditEstimateCopyWith<$Res>  {
  factory $CreditEstimateCopyWith(CreditEstimate value, $Res Function(CreditEstimate) _then) = _$CreditEstimateCopyWithImpl;
@useResult
$Res call({
 String jobId, int credits, Map<String, int> breakdown, String estimatorVersion, Map<String, Object?> metadata
});




}
/// @nodoc
class _$CreditEstimateCopyWithImpl<$Res>
    implements $CreditEstimateCopyWith<$Res> {
  _$CreditEstimateCopyWithImpl(this._self, this._then);

  final CreditEstimate _self;
  final $Res Function(CreditEstimate) _then;

/// Create a copy of CreditEstimate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? jobId = null,Object? credits = null,Object? breakdown = null,Object? estimatorVersion = null,Object? metadata = null,}) {
  return _then(_self.copyWith(
jobId: null == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as String,credits: null == credits ? _self.credits : credits // ignore: cast_nullable_to_non_nullable
as int,breakdown: null == breakdown ? _self.breakdown : breakdown // ignore: cast_nullable_to_non_nullable
as Map<String, int>,estimatorVersion: null == estimatorVersion ? _self.estimatorVersion : estimatorVersion // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

}


/// Adds pattern-matching-related methods to [CreditEstimate].
extension CreditEstimatePatterns on CreditEstimate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreditEstimate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreditEstimate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreditEstimate value)  $default,){
final _that = this;
switch (_that) {
case _CreditEstimate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreditEstimate value)?  $default,){
final _that = this;
switch (_that) {
case _CreditEstimate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String jobId,  int credits,  Map<String, int> breakdown,  String estimatorVersion,  Map<String, Object?> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreditEstimate() when $default != null:
return $default(_that.jobId,_that.credits,_that.breakdown,_that.estimatorVersion,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String jobId,  int credits,  Map<String, int> breakdown,  String estimatorVersion,  Map<String, Object?> metadata)  $default,) {final _that = this;
switch (_that) {
case _CreditEstimate():
return $default(_that.jobId,_that.credits,_that.breakdown,_that.estimatorVersion,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String jobId,  int credits,  Map<String, int> breakdown,  String estimatorVersion,  Map<String, Object?> metadata)?  $default,) {final _that = this;
switch (_that) {
case _CreditEstimate() when $default != null:
return $default(_that.jobId,_that.credits,_that.breakdown,_that.estimatorVersion,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreditEstimate implements CreditEstimate {
   _CreditEstimate({required this.jobId, required this.credits, final  Map<String, int> breakdown = const <String, int>{}, required this.estimatorVersion, final  Map<String, Object?> metadata = const <String, Object?>{}}): assert(credits >= 0, 'credits must be non-negative'),assert(breakdown.isEmpty || breakdown.values.fold(0, (int a, int b) => a + b) == credits, 'a non-empty breakdown must sum to credits'),_breakdown = breakdown,_metadata = metadata;
  factory _CreditEstimate.fromJson(Map<String, dynamic> json) => _$CreditEstimateFromJson(json);

/// The job priced.
@override final  String jobId;
/// Whole-credit estimate (credits are counted units — the frozen
/// `core_plugin` permission `use_ai_credits`).
@override final  int credits;
/// Named components summing to [credits] — the §6 plan surface shows
/// the user *why*.
 final  Map<String, int> _breakdown;
/// Named components summing to [credits] — the §6 plan surface shows
/// the user *why*.
@override@JsonKey() Map<String, int> get breakdown {
  if (_breakdown is EqualUnmodifiableMapView) return _breakdown;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_breakdown);
}

/// Version of the estimator that produced this estimate.
@override final  String estimatorVersion;
 final  Map<String, Object?> _metadata;
@override@JsonKey() Map<String, Object?> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of CreditEstimate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreditEstimateCopyWith<_CreditEstimate> get copyWith => __$CreditEstimateCopyWithImpl<_CreditEstimate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreditEstimateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreditEstimate&&(identical(other.jobId, jobId) || other.jobId == jobId)&&(identical(other.credits, credits) || other.credits == credits)&&const DeepCollectionEquality().equals(other._breakdown, _breakdown)&&(identical(other.estimatorVersion, estimatorVersion) || other.estimatorVersion == estimatorVersion)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,jobId,credits,const DeepCollectionEquality().hash(_breakdown),estimatorVersion,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'CreditEstimate(jobId: $jobId, credits: $credits, breakdown: $breakdown, estimatorVersion: $estimatorVersion, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$CreditEstimateCopyWith<$Res> implements $CreditEstimateCopyWith<$Res> {
  factory _$CreditEstimateCopyWith(_CreditEstimate value, $Res Function(_CreditEstimate) _then) = __$CreditEstimateCopyWithImpl;
@override @useResult
$Res call({
 String jobId, int credits, Map<String, int> breakdown, String estimatorVersion, Map<String, Object?> metadata
});




}
/// @nodoc
class __$CreditEstimateCopyWithImpl<$Res>
    implements _$CreditEstimateCopyWith<$Res> {
  __$CreditEstimateCopyWithImpl(this._self, this._then);

  final _CreditEstimate _self;
  final $Res Function(_CreditEstimate) _then;

/// Create a copy of CreditEstimate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? jobId = null,Object? credits = null,Object? breakdown = null,Object? estimatorVersion = null,Object? metadata = null,}) {
  return _then(_CreditEstimate(
jobId: null == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as String,credits: null == credits ? _self.credits : credits // ignore: cast_nullable_to_non_nullable
as int,breakdown: null == breakdown ? _self._breakdown : breakdown // ignore: cast_nullable_to_non_nullable
as Map<String, int>,estimatorVersion: null == estimatorVersion ? _self.estimatorVersion : estimatorVersion // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}

// dart format on
