// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plan_dispatcher.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
PlanStepOutcome _$PlanStepOutcomeFromJson(
  Map<String, dynamic> json
) {
        switch (json['kind']) {
                  case 'job':
          return PlanJobOutcome.fromJson(
            json
          );
                case 'command':
          return PlanCommandOutcome.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'kind',
  'PlanStepOutcome',
  'Invalid union type "${json['kind']}"!'
);
        }
      
}

/// @nodoc
mixin _$PlanStepOutcome {

 int get stepIndex;
/// Create a copy of PlanStepOutcome
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlanStepOutcomeCopyWith<PlanStepOutcome> get copyWith => _$PlanStepOutcomeCopyWithImpl<PlanStepOutcome>(this as PlanStepOutcome, _$identity);

  /// Serializes this PlanStepOutcome to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlanStepOutcome&&(identical(other.stepIndex, stepIndex) || other.stepIndex == stepIndex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stepIndex);

@override
String toString() {
  return 'PlanStepOutcome(stepIndex: $stepIndex)';
}


}

/// @nodoc
abstract mixin class $PlanStepOutcomeCopyWith<$Res>  {
  factory $PlanStepOutcomeCopyWith(PlanStepOutcome value, $Res Function(PlanStepOutcome) _then) = _$PlanStepOutcomeCopyWithImpl;
@useResult
$Res call({
 int stepIndex
});




}
/// @nodoc
class _$PlanStepOutcomeCopyWithImpl<$Res>
    implements $PlanStepOutcomeCopyWith<$Res> {
  _$PlanStepOutcomeCopyWithImpl(this._self, this._then);

  final PlanStepOutcome _self;
  final $Res Function(PlanStepOutcome) _then;

/// Create a copy of PlanStepOutcome
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stepIndex = null,}) {
  return _then(_self.copyWith(
stepIndex: null == stepIndex ? _self.stepIndex : stepIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PlanStepOutcome].
extension PlanStepOutcomePatterns on PlanStepOutcome {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PlanJobOutcome value)?  job,TResult Function( PlanCommandOutcome value)?  command,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PlanJobOutcome() when job != null:
return job(_that);case PlanCommandOutcome() when command != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PlanJobOutcome value)  job,required TResult Function( PlanCommandOutcome value)  command,}){
final _that = this;
switch (_that) {
case PlanJobOutcome():
return job(_that);case PlanCommandOutcome():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PlanJobOutcome value)?  job,TResult? Function( PlanCommandOutcome value)?  command,}){
final _that = this;
switch (_that) {
case PlanJobOutcome() when job != null:
return job(_that);case PlanCommandOutcome() when command != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int stepIndex,  RoutingDecision routing,  ExecutionOutcome? execution)?  job,TResult Function( int stepIndex,  String proposalId)?  command,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PlanJobOutcome() when job != null:
return job(_that.stepIndex,_that.routing,_that.execution);case PlanCommandOutcome() when command != null:
return command(_that.stepIndex,_that.proposalId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int stepIndex,  RoutingDecision routing,  ExecutionOutcome? execution)  job,required TResult Function( int stepIndex,  String proposalId)  command,}) {final _that = this;
switch (_that) {
case PlanJobOutcome():
return job(_that.stepIndex,_that.routing,_that.execution);case PlanCommandOutcome():
return command(_that.stepIndex,_that.proposalId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int stepIndex,  RoutingDecision routing,  ExecutionOutcome? execution)?  job,TResult? Function( int stepIndex,  String proposalId)?  command,}) {final _that = this;
switch (_that) {
case PlanJobOutcome() when job != null:
return job(_that.stepIndex,_that.routing,_that.execution);case PlanCommandOutcome() when command != null:
return command(_that.stepIndex,_that.proposalId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class PlanJobOutcome implements PlanStepOutcome {
  const PlanJobOutcome({required this.stepIndex, required this.routing, this.execution, final  String? $type}): $type = $type ?? 'job';
  factory PlanJobOutcome.fromJson(Map<String, dynamic> json) => _$PlanJobOutcomeFromJson(json);

@override final  int stepIndex;
 final  RoutingDecision routing;
 final  ExecutionOutcome? execution;

@JsonKey(name: 'kind')
final String $type;


/// Create a copy of PlanStepOutcome
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlanJobOutcomeCopyWith<PlanJobOutcome> get copyWith => _$PlanJobOutcomeCopyWithImpl<PlanJobOutcome>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlanJobOutcomeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlanJobOutcome&&(identical(other.stepIndex, stepIndex) || other.stepIndex == stepIndex)&&(identical(other.routing, routing) || other.routing == routing)&&(identical(other.execution, execution) || other.execution == execution));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stepIndex,routing,execution);

@override
String toString() {
  return 'PlanStepOutcome.job(stepIndex: $stepIndex, routing: $routing, execution: $execution)';
}


}

/// @nodoc
abstract mixin class $PlanJobOutcomeCopyWith<$Res> implements $PlanStepOutcomeCopyWith<$Res> {
  factory $PlanJobOutcomeCopyWith(PlanJobOutcome value, $Res Function(PlanJobOutcome) _then) = _$PlanJobOutcomeCopyWithImpl;
@override @useResult
$Res call({
 int stepIndex, RoutingDecision routing, ExecutionOutcome? execution
});


$RoutingDecisionCopyWith<$Res> get routing;$ExecutionOutcomeCopyWith<$Res>? get execution;

}
/// @nodoc
class _$PlanJobOutcomeCopyWithImpl<$Res>
    implements $PlanJobOutcomeCopyWith<$Res> {
  _$PlanJobOutcomeCopyWithImpl(this._self, this._then);

  final PlanJobOutcome _self;
  final $Res Function(PlanJobOutcome) _then;

/// Create a copy of PlanStepOutcome
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stepIndex = null,Object? routing = null,Object? execution = freezed,}) {
  return _then(PlanJobOutcome(
stepIndex: null == stepIndex ? _self.stepIndex : stepIndex // ignore: cast_nullable_to_non_nullable
as int,routing: null == routing ? _self.routing : routing // ignore: cast_nullable_to_non_nullable
as RoutingDecision,execution: freezed == execution ? _self.execution : execution // ignore: cast_nullable_to_non_nullable
as ExecutionOutcome?,
  ));
}

/// Create a copy of PlanStepOutcome
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoutingDecisionCopyWith<$Res> get routing {
  
  return $RoutingDecisionCopyWith<$Res>(_self.routing, (value) {
    return _then(_self.copyWith(routing: value));
  });
}/// Create a copy of PlanStepOutcome
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExecutionOutcomeCopyWith<$Res>? get execution {
    if (_self.execution == null) {
    return null;
  }

  return $ExecutionOutcomeCopyWith<$Res>(_self.execution!, (value) {
    return _then(_self.copyWith(execution: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class PlanCommandOutcome implements PlanStepOutcome {
  const PlanCommandOutcome({required this.stepIndex, required this.proposalId, final  String? $type}): $type = $type ?? 'command';
  factory PlanCommandOutcome.fromJson(Map<String, dynamic> json) => _$PlanCommandOutcomeFromJson(json);

@override final  int stepIndex;
 final  String proposalId;

@JsonKey(name: 'kind')
final String $type;


/// Create a copy of PlanStepOutcome
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlanCommandOutcomeCopyWith<PlanCommandOutcome> get copyWith => _$PlanCommandOutcomeCopyWithImpl<PlanCommandOutcome>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlanCommandOutcomeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlanCommandOutcome&&(identical(other.stepIndex, stepIndex) || other.stepIndex == stepIndex)&&(identical(other.proposalId, proposalId) || other.proposalId == proposalId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stepIndex,proposalId);

@override
String toString() {
  return 'PlanStepOutcome.command(stepIndex: $stepIndex, proposalId: $proposalId)';
}


}

/// @nodoc
abstract mixin class $PlanCommandOutcomeCopyWith<$Res> implements $PlanStepOutcomeCopyWith<$Res> {
  factory $PlanCommandOutcomeCopyWith(PlanCommandOutcome value, $Res Function(PlanCommandOutcome) _then) = _$PlanCommandOutcomeCopyWithImpl;
@override @useResult
$Res call({
 int stepIndex, String proposalId
});




}
/// @nodoc
class _$PlanCommandOutcomeCopyWithImpl<$Res>
    implements $PlanCommandOutcomeCopyWith<$Res> {
  _$PlanCommandOutcomeCopyWithImpl(this._self, this._then);

  final PlanCommandOutcome _self;
  final $Res Function(PlanCommandOutcome) _then;

/// Create a copy of PlanStepOutcome
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stepIndex = null,Object? proposalId = null,}) {
  return _then(PlanCommandOutcome(
stepIndex: null == stepIndex ? _self.stepIndex : stepIndex // ignore: cast_nullable_to_non_nullable
as int,proposalId: null == proposalId ? _self.proposalId : proposalId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PlanDispatchResult {

/// The dispatched plan's id.
 String get planId;/// One outcome per dispatched step, in step order.
 List<PlanStepOutcome> get outcomes;
/// Create a copy of PlanDispatchResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlanDispatchResultCopyWith<PlanDispatchResult> get copyWith => _$PlanDispatchResultCopyWithImpl<PlanDispatchResult>(this as PlanDispatchResult, _$identity);

  /// Serializes this PlanDispatchResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlanDispatchResult&&(identical(other.planId, planId) || other.planId == planId)&&const DeepCollectionEquality().equals(other.outcomes, outcomes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,planId,const DeepCollectionEquality().hash(outcomes));

@override
String toString() {
  return 'PlanDispatchResult(planId: $planId, outcomes: $outcomes)';
}


}

/// @nodoc
abstract mixin class $PlanDispatchResultCopyWith<$Res>  {
  factory $PlanDispatchResultCopyWith(PlanDispatchResult value, $Res Function(PlanDispatchResult) _then) = _$PlanDispatchResultCopyWithImpl;
@useResult
$Res call({
 String planId, List<PlanStepOutcome> outcomes
});




}
/// @nodoc
class _$PlanDispatchResultCopyWithImpl<$Res>
    implements $PlanDispatchResultCopyWith<$Res> {
  _$PlanDispatchResultCopyWithImpl(this._self, this._then);

  final PlanDispatchResult _self;
  final $Res Function(PlanDispatchResult) _then;

/// Create a copy of PlanDispatchResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? planId = null,Object? outcomes = null,}) {
  return _then(_self.copyWith(
planId: null == planId ? _self.planId : planId // ignore: cast_nullable_to_non_nullable
as String,outcomes: null == outcomes ? _self.outcomes : outcomes // ignore: cast_nullable_to_non_nullable
as List<PlanStepOutcome>,
  ));
}

}


/// Adds pattern-matching-related methods to [PlanDispatchResult].
extension PlanDispatchResultPatterns on PlanDispatchResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlanDispatchResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlanDispatchResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlanDispatchResult value)  $default,){
final _that = this;
switch (_that) {
case _PlanDispatchResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlanDispatchResult value)?  $default,){
final _that = this;
switch (_that) {
case _PlanDispatchResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String planId,  List<PlanStepOutcome> outcomes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlanDispatchResult() when $default != null:
return $default(_that.planId,_that.outcomes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String planId,  List<PlanStepOutcome> outcomes)  $default,) {final _that = this;
switch (_that) {
case _PlanDispatchResult():
return $default(_that.planId,_that.outcomes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String planId,  List<PlanStepOutcome> outcomes)?  $default,) {final _that = this;
switch (_that) {
case _PlanDispatchResult() when $default != null:
return $default(_that.planId,_that.outcomes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlanDispatchResult implements PlanDispatchResult {
  const _PlanDispatchResult({required this.planId, final  List<PlanStepOutcome> outcomes = const <PlanStepOutcome>[]}): _outcomes = outcomes;
  factory _PlanDispatchResult.fromJson(Map<String, dynamic> json) => _$PlanDispatchResultFromJson(json);

/// The dispatched plan's id.
@override final  String planId;
/// One outcome per dispatched step, in step order.
 final  List<PlanStepOutcome> _outcomes;
/// One outcome per dispatched step, in step order.
@override@JsonKey() List<PlanStepOutcome> get outcomes {
  if (_outcomes is EqualUnmodifiableListView) return _outcomes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_outcomes);
}


/// Create a copy of PlanDispatchResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlanDispatchResultCopyWith<_PlanDispatchResult> get copyWith => __$PlanDispatchResultCopyWithImpl<_PlanDispatchResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlanDispatchResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlanDispatchResult&&(identical(other.planId, planId) || other.planId == planId)&&const DeepCollectionEquality().equals(other._outcomes, _outcomes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,planId,const DeepCollectionEquality().hash(_outcomes));

@override
String toString() {
  return 'PlanDispatchResult(planId: $planId, outcomes: $outcomes)';
}


}

/// @nodoc
abstract mixin class _$PlanDispatchResultCopyWith<$Res> implements $PlanDispatchResultCopyWith<$Res> {
  factory _$PlanDispatchResultCopyWith(_PlanDispatchResult value, $Res Function(_PlanDispatchResult) _then) = __$PlanDispatchResultCopyWithImpl;
@override @useResult
$Res call({
 String planId, List<PlanStepOutcome> outcomes
});




}
/// @nodoc
class __$PlanDispatchResultCopyWithImpl<$Res>
    implements _$PlanDispatchResultCopyWith<$Res> {
  __$PlanDispatchResultCopyWithImpl(this._self, this._then);

  final _PlanDispatchResult _self;
  final $Res Function(_PlanDispatchResult) _then;

/// Create a copy of PlanDispatchResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? planId = null,Object? outcomes = null,}) {
  return _then(_PlanDispatchResult(
planId: null == planId ? _self.planId : planId // ignore: cast_nullable_to_non_nullable
as String,outcomes: null == outcomes ? _self._outcomes : outcomes // ignore: cast_nullable_to_non_nullable
as List<PlanStepOutcome>,
  ));
}


}

// dart format on
