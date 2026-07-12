// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lock_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LockState {

 LockScope get scope;/// The locked entity id (layer/object/mask/tool id…); null locks the
/// entire scope.
 String? get targetId;/// Who placed the lock — release rules follow origin (a user cannot
/// release a policy lock; policy resolution is a later milestone).
 LockOrigin get origin;/// Human-readable reason surfaced by UI when a mutation is refused.
 String? get reason;
/// Create a copy of LockState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LockStateCopyWith<LockState> get copyWith => _$LockStateCopyWithImpl<LockState>(this as LockState, _$identity);

  /// Serializes this LockState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LockState&&(identical(other.scope, scope) || other.scope == scope)&&(identical(other.targetId, targetId) || other.targetId == targetId)&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,scope,targetId,origin,reason);

@override
String toString() {
  return 'LockState(scope: $scope, targetId: $targetId, origin: $origin, reason: $reason)';
}


}

/// @nodoc
abstract mixin class $LockStateCopyWith<$Res>  {
  factory $LockStateCopyWith(LockState value, $Res Function(LockState) _then) = _$LockStateCopyWithImpl;
@useResult
$Res call({
 LockScope scope, String? targetId, LockOrigin origin, String? reason
});




}
/// @nodoc
class _$LockStateCopyWithImpl<$Res>
    implements $LockStateCopyWith<$Res> {
  _$LockStateCopyWithImpl(this._self, this._then);

  final LockState _self;
  final $Res Function(LockState) _then;

/// Create a copy of LockState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? scope = null,Object? targetId = freezed,Object? origin = null,Object? reason = freezed,}) {
  return _then(_self.copyWith(
scope: null == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as LockScope,targetId: freezed == targetId ? _self.targetId : targetId // ignore: cast_nullable_to_non_nullable
as String?,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as LockOrigin,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LockState].
extension LockStatePatterns on LockState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LockState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LockState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LockState value)  $default,){
final _that = this;
switch (_that) {
case _LockState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LockState value)?  $default,){
final _that = this;
switch (_that) {
case _LockState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LockScope scope,  String? targetId,  LockOrigin origin,  String? reason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LockState() when $default != null:
return $default(_that.scope,_that.targetId,_that.origin,_that.reason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LockScope scope,  String? targetId,  LockOrigin origin,  String? reason)  $default,) {final _that = this;
switch (_that) {
case _LockState():
return $default(_that.scope,_that.targetId,_that.origin,_that.reason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LockScope scope,  String? targetId,  LockOrigin origin,  String? reason)?  $default,) {final _that = this;
switch (_that) {
case _LockState() when $default != null:
return $default(_that.scope,_that.targetId,_that.origin,_that.reason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LockState implements LockState {
  const _LockState({required this.scope, this.targetId, this.origin = LockOrigin.user, this.reason});
  factory _LockState.fromJson(Map<String, dynamic> json) => _$LockStateFromJson(json);

@override final  LockScope scope;
/// The locked entity id (layer/object/mask/tool id…); null locks the
/// entire scope.
@override final  String? targetId;
/// Who placed the lock — release rules follow origin (a user cannot
/// release a policy lock; policy resolution is a later milestone).
@override@JsonKey() final  LockOrigin origin;
/// Human-readable reason surfaced by UI when a mutation is refused.
@override final  String? reason;

/// Create a copy of LockState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LockStateCopyWith<_LockState> get copyWith => __$LockStateCopyWithImpl<_LockState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LockStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LockState&&(identical(other.scope, scope) || other.scope == scope)&&(identical(other.targetId, targetId) || other.targetId == targetId)&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,scope,targetId,origin,reason);

@override
String toString() {
  return 'LockState(scope: $scope, targetId: $targetId, origin: $origin, reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$LockStateCopyWith<$Res> implements $LockStateCopyWith<$Res> {
  factory _$LockStateCopyWith(_LockState value, $Res Function(_LockState) _then) = __$LockStateCopyWithImpl;
@override @useResult
$Res call({
 LockScope scope, String? targetId, LockOrigin origin, String? reason
});




}
/// @nodoc
class __$LockStateCopyWithImpl<$Res>
    implements _$LockStateCopyWith<$Res> {
  __$LockStateCopyWithImpl(this._self, this._then);

  final _LockState _self;
  final $Res Function(_LockState) _then;

/// Create a copy of LockState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? scope = null,Object? targetId = freezed,Object? origin = null,Object? reason = freezed,}) {
  return _then(_LockState(
scope: null == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as LockScope,targetId: freezed == targetId ? _self.targetId : targetId // ignore: cast_nullable_to_non_nullable
as String?,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as LockOrigin,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$LockSet {

 List<LockState> get locks;
/// Create a copy of LockSet
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LockSetCopyWith<LockSet> get copyWith => _$LockSetCopyWithImpl<LockSet>(this as LockSet, _$identity);

  /// Serializes this LockSet to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LockSet&&const DeepCollectionEquality().equals(other.locks, locks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(locks));

@override
String toString() {
  return 'LockSet(locks: $locks)';
}


}

/// @nodoc
abstract mixin class $LockSetCopyWith<$Res>  {
  factory $LockSetCopyWith(LockSet value, $Res Function(LockSet) _then) = _$LockSetCopyWithImpl;
@useResult
$Res call({
 List<LockState> locks
});




}
/// @nodoc
class _$LockSetCopyWithImpl<$Res>
    implements $LockSetCopyWith<$Res> {
  _$LockSetCopyWithImpl(this._self, this._then);

  final LockSet _self;
  final $Res Function(LockSet) _then;

/// Create a copy of LockSet
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? locks = null,}) {
  return _then(_self.copyWith(
locks: null == locks ? _self.locks : locks // ignore: cast_nullable_to_non_nullable
as List<LockState>,
  ));
}

}


/// Adds pattern-matching-related methods to [LockSet].
extension LockSetPatterns on LockSet {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LockSet value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LockSet() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LockSet value)  $default,){
final _that = this;
switch (_that) {
case _LockSet():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LockSet value)?  $default,){
final _that = this;
switch (_that) {
case _LockSet() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<LockState> locks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LockSet() when $default != null:
return $default(_that.locks);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<LockState> locks)  $default,) {final _that = this;
switch (_that) {
case _LockSet():
return $default(_that.locks);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<LockState> locks)?  $default,) {final _that = this;
switch (_that) {
case _LockSet() when $default != null:
return $default(_that.locks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LockSet extends LockSet {
  const _LockSet({final  List<LockState> locks = const <LockState>[]}): _locks = locks,super._();
  factory _LockSet.fromJson(Map<String, dynamic> json) => _$LockSetFromJson(json);

 final  List<LockState> _locks;
@override@JsonKey() List<LockState> get locks {
  if (_locks is EqualUnmodifiableListView) return _locks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_locks);
}


/// Create a copy of LockSet
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LockSetCopyWith<_LockSet> get copyWith => __$LockSetCopyWithImpl<_LockSet>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LockSetToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LockSet&&const DeepCollectionEquality().equals(other._locks, _locks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_locks));

@override
String toString() {
  return 'LockSet(locks: $locks)';
}


}

/// @nodoc
abstract mixin class _$LockSetCopyWith<$Res> implements $LockSetCopyWith<$Res> {
  factory _$LockSetCopyWith(_LockSet value, $Res Function(_LockSet) _then) = __$LockSetCopyWithImpl;
@override @useResult
$Res call({
 List<LockState> locks
});




}
/// @nodoc
class __$LockSetCopyWithImpl<$Res>
    implements _$LockSetCopyWith<$Res> {
  __$LockSetCopyWithImpl(this._self, this._then);

  final _LockSet _self;
  final $Res Function(_LockSet) _then;

/// Create a copy of LockSet
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? locks = null,}) {
  return _then(_LockSet(
locks: null == locks ? _self._locks : locks // ignore: cast_nullable_to_non_nullable
as List<LockState>,
  ));
}


}


/// @nodoc
mixin _$LockDecision {

 bool get allowed; LockState? get blockedBy;
/// Create a copy of LockDecision
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LockDecisionCopyWith<LockDecision> get copyWith => _$LockDecisionCopyWithImpl<LockDecision>(this as LockDecision, _$identity);

  /// Serializes this LockDecision to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LockDecision&&(identical(other.allowed, allowed) || other.allowed == allowed)&&(identical(other.blockedBy, blockedBy) || other.blockedBy == blockedBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,allowed,blockedBy);

@override
String toString() {
  return 'LockDecision(allowed: $allowed, blockedBy: $blockedBy)';
}


}

/// @nodoc
abstract mixin class $LockDecisionCopyWith<$Res>  {
  factory $LockDecisionCopyWith(LockDecision value, $Res Function(LockDecision) _then) = _$LockDecisionCopyWithImpl;
@useResult
$Res call({
 bool allowed, LockState? blockedBy
});


$LockStateCopyWith<$Res>? get blockedBy;

}
/// @nodoc
class _$LockDecisionCopyWithImpl<$Res>
    implements $LockDecisionCopyWith<$Res> {
  _$LockDecisionCopyWithImpl(this._self, this._then);

  final LockDecision _self;
  final $Res Function(LockDecision) _then;

/// Create a copy of LockDecision
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? allowed = null,Object? blockedBy = freezed,}) {
  return _then(_self.copyWith(
allowed: null == allowed ? _self.allowed : allowed // ignore: cast_nullable_to_non_nullable
as bool,blockedBy: freezed == blockedBy ? _self.blockedBy : blockedBy // ignore: cast_nullable_to_non_nullable
as LockState?,
  ));
}
/// Create a copy of LockDecision
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LockStateCopyWith<$Res>? get blockedBy {
    if (_self.blockedBy == null) {
    return null;
  }

  return $LockStateCopyWith<$Res>(_self.blockedBy!, (value) {
    return _then(_self.copyWith(blockedBy: value));
  });
}
}


/// Adds pattern-matching-related methods to [LockDecision].
extension LockDecisionPatterns on LockDecision {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LockDecision value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LockDecision() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LockDecision value)  $default,){
final _that = this;
switch (_that) {
case _LockDecision():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LockDecision value)?  $default,){
final _that = this;
switch (_that) {
case _LockDecision() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool allowed,  LockState? blockedBy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LockDecision() when $default != null:
return $default(_that.allowed,_that.blockedBy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool allowed,  LockState? blockedBy)  $default,) {final _that = this;
switch (_that) {
case _LockDecision():
return $default(_that.allowed,_that.blockedBy);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool allowed,  LockState? blockedBy)?  $default,) {final _that = this;
switch (_that) {
case _LockDecision() when $default != null:
return $default(_that.allowed,_that.blockedBy);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LockDecision extends LockDecision {
  const _LockDecision({required this.allowed, this.blockedBy}): super._();
  factory _LockDecision.fromJson(Map<String, dynamic> json) => _$LockDecisionFromJson(json);

@override final  bool allowed;
@override final  LockState? blockedBy;

/// Create a copy of LockDecision
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LockDecisionCopyWith<_LockDecision> get copyWith => __$LockDecisionCopyWithImpl<_LockDecision>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LockDecisionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LockDecision&&(identical(other.allowed, allowed) || other.allowed == allowed)&&(identical(other.blockedBy, blockedBy) || other.blockedBy == blockedBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,allowed,blockedBy);

@override
String toString() {
  return 'LockDecision(allowed: $allowed, blockedBy: $blockedBy)';
}


}

/// @nodoc
abstract mixin class _$LockDecisionCopyWith<$Res> implements $LockDecisionCopyWith<$Res> {
  factory _$LockDecisionCopyWith(_LockDecision value, $Res Function(_LockDecision) _then) = __$LockDecisionCopyWithImpl;
@override @useResult
$Res call({
 bool allowed, LockState? blockedBy
});


@override $LockStateCopyWith<$Res>? get blockedBy;

}
/// @nodoc
class __$LockDecisionCopyWithImpl<$Res>
    implements _$LockDecisionCopyWith<$Res> {
  __$LockDecisionCopyWithImpl(this._self, this._then);

  final _LockDecision _self;
  final $Res Function(_LockDecision) _then;

/// Create a copy of LockDecision
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? allowed = null,Object? blockedBy = freezed,}) {
  return _then(_LockDecision(
allowed: null == allowed ? _self.allowed : allowed // ignore: cast_nullable_to_non_nullable
as bool,blockedBy: freezed == blockedBy ? _self.blockedBy : blockedBy // ignore: cast_nullable_to_non_nullable
as LockState?,
  ));
}

/// Create a copy of LockDecision
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LockStateCopyWith<$Res>? get blockedBy {
    if (_self.blockedBy == null) {
    return null;
  }

  return $LockStateCopyWith<$Res>(_self.blockedBy!, (value) {
    return _then(_self.copyWith(blockedBy: value));
  });
}
}

// dart format on
