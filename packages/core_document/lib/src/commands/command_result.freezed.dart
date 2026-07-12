// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'command_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
CommandResult _$CommandResultFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'applied':
          return CommandApplied.fromJson(
            json
          );
                case 'rejected':
          return CommandRejected.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'CommandResult',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$CommandResult {



  /// Serializes this CommandResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommandResult);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CommandResult()';
}


}

/// @nodoc
class $CommandResultCopyWith<$Res>  {
$CommandResultCopyWith(CommandResult _, $Res Function(CommandResult) __);
}


/// Adds pattern-matching-related methods to [CommandResult].
extension CommandResultPatterns on CommandResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CommandApplied value)?  applied,TResult Function( CommandRejected value)?  rejected,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CommandApplied() when applied != null:
return applied(_that);case CommandRejected() when rejected != null:
return rejected(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CommandApplied value)  applied,required TResult Function( CommandRejected value)  rejected,}){
final _that = this;
switch (_that) {
case CommandApplied():
return applied(_that);case CommandRejected():
return rejected(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CommandApplied value)?  applied,TResult? Function( CommandRejected value)?  rejected,}){
final _that = this;
switch (_that) {
case CommandApplied() when applied != null:
return applied(_that);case CommandRejected() when rejected != null:
return rejected(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int revision,  List<String> affectedIds)?  applied,TResult Function( CommandRejectionReason reason,  LockState? blockedBy,  String? detail)?  rejected,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CommandApplied() when applied != null:
return applied(_that.revision,_that.affectedIds);case CommandRejected() when rejected != null:
return rejected(_that.reason,_that.blockedBy,_that.detail);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int revision,  List<String> affectedIds)  applied,required TResult Function( CommandRejectionReason reason,  LockState? blockedBy,  String? detail)  rejected,}) {final _that = this;
switch (_that) {
case CommandApplied():
return applied(_that.revision,_that.affectedIds);case CommandRejected():
return rejected(_that.reason,_that.blockedBy,_that.detail);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int revision,  List<String> affectedIds)?  applied,TResult? Function( CommandRejectionReason reason,  LockState? blockedBy,  String? detail)?  rejected,}) {final _that = this;
switch (_that) {
case CommandApplied() when applied != null:
return applied(_that.revision,_that.affectedIds);case CommandRejected() when rejected != null:
return rejected(_that.reason,_that.blockedBy,_that.detail);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class CommandApplied extends CommandResult {
  const CommandApplied({required this.revision, final  List<String> affectedIds = const <String>[], final  String? $type}): _affectedIds = affectedIds,$type = $type ?? 'applied',super._();
  factory CommandApplied.fromJson(Map<String, dynamic> json) => _$CommandAppliedFromJson(json);

 final  int revision;
 final  List<String> _affectedIds;
@JsonKey() List<String> get affectedIds {
  if (_affectedIds is EqualUnmodifiableListView) return _affectedIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_affectedIds);
}


@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of CommandResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommandAppliedCopyWith<CommandApplied> get copyWith => _$CommandAppliedCopyWithImpl<CommandApplied>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommandAppliedToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommandApplied&&(identical(other.revision, revision) || other.revision == revision)&&const DeepCollectionEquality().equals(other._affectedIds, _affectedIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,revision,const DeepCollectionEquality().hash(_affectedIds));

@override
String toString() {
  return 'CommandResult.applied(revision: $revision, affectedIds: $affectedIds)';
}


}

/// @nodoc
abstract mixin class $CommandAppliedCopyWith<$Res> implements $CommandResultCopyWith<$Res> {
  factory $CommandAppliedCopyWith(CommandApplied value, $Res Function(CommandApplied) _then) = _$CommandAppliedCopyWithImpl;
@useResult
$Res call({
 int revision, List<String> affectedIds
});




}
/// @nodoc
class _$CommandAppliedCopyWithImpl<$Res>
    implements $CommandAppliedCopyWith<$Res> {
  _$CommandAppliedCopyWithImpl(this._self, this._then);

  final CommandApplied _self;
  final $Res Function(CommandApplied) _then;

/// Create a copy of CommandResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? revision = null,Object? affectedIds = null,}) {
  return _then(CommandApplied(
revision: null == revision ? _self.revision : revision // ignore: cast_nullable_to_non_nullable
as int,affectedIds: null == affectedIds ? _self._affectedIds : affectedIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class CommandRejected extends CommandResult {
  const CommandRejected({required this.reason, this.blockedBy, this.detail, final  String? $type}): $type = $type ?? 'rejected',super._();
  factory CommandRejected.fromJson(Map<String, dynamic> json) => _$CommandRejectedFromJson(json);

 final  CommandRejectionReason reason;
/// The lock that blocked it, when [reason] is `locked`.
 final  LockState? blockedBy;
/// Human-readable detail for UI/telemetry.
 final  String? detail;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of CommandResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommandRejectedCopyWith<CommandRejected> get copyWith => _$CommandRejectedCopyWithImpl<CommandRejected>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommandRejectedToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommandRejected&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.blockedBy, blockedBy) || other.blockedBy == blockedBy)&&(identical(other.detail, detail) || other.detail == detail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reason,blockedBy,detail);

@override
String toString() {
  return 'CommandResult.rejected(reason: $reason, blockedBy: $blockedBy, detail: $detail)';
}


}

/// @nodoc
abstract mixin class $CommandRejectedCopyWith<$Res> implements $CommandResultCopyWith<$Res> {
  factory $CommandRejectedCopyWith(CommandRejected value, $Res Function(CommandRejected) _then) = _$CommandRejectedCopyWithImpl;
@useResult
$Res call({
 CommandRejectionReason reason, LockState? blockedBy, String? detail
});


$LockStateCopyWith<$Res>? get blockedBy;

}
/// @nodoc
class _$CommandRejectedCopyWithImpl<$Res>
    implements $CommandRejectedCopyWith<$Res> {
  _$CommandRejectedCopyWithImpl(this._self, this._then);

  final CommandRejected _self;
  final $Res Function(CommandRejected) _then;

/// Create a copy of CommandResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? reason = null,Object? blockedBy = freezed,Object? detail = freezed,}) {
  return _then(CommandRejected(
reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as CommandRejectionReason,blockedBy: freezed == blockedBy ? _self.blockedBy : blockedBy // ignore: cast_nullable_to_non_nullable
as LockState?,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of CommandResult
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
