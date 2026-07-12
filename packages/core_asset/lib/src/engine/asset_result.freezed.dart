// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asset_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AssetResult {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssetResult);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AssetResult()';
}


}

/// @nodoc
class $AssetResultCopyWith<$Res>  {
$AssetResultCopyWith(AssetResult _, $Res Function(AssetResult) __);
}


/// Adds pattern-matching-related methods to [AssetResult].
extension AssetResultPatterns on AssetResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AssetApplied value)?  applied,TResult Function( AssetRejected value)?  rejected,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AssetApplied() when applied != null:
return applied(_that);case AssetRejected() when rejected != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AssetApplied value)  applied,required TResult Function( AssetRejected value)  rejected,}){
final _that = this;
switch (_that) {
case AssetApplied():
return applied(_that);case AssetRejected():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AssetApplied value)?  applied,TResult? Function( AssetRejected value)?  rejected,}){
final _that = this;
switch (_that) {
case AssetApplied() when applied != null:
return applied(_that);case AssetRejected() when rejected != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( FebricAsset? asset)?  applied,TResult Function( AssetRejectionReason reason,  String? detail,  LockState? blockedBy)?  rejected,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AssetApplied() when applied != null:
return applied(_that.asset);case AssetRejected() when rejected != null:
return rejected(_that.reason,_that.detail,_that.blockedBy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( FebricAsset? asset)  applied,required TResult Function( AssetRejectionReason reason,  String? detail,  LockState? blockedBy)  rejected,}) {final _that = this;
switch (_that) {
case AssetApplied():
return applied(_that.asset);case AssetRejected():
return rejected(_that.reason,_that.detail,_that.blockedBy);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( FebricAsset? asset)?  applied,TResult? Function( AssetRejectionReason reason,  String? detail,  LockState? blockedBy)?  rejected,}) {final _that = this;
switch (_that) {
case AssetApplied() when applied != null:
return applied(_that.asset);case AssetRejected() when rejected != null:
return rejected(_that.reason,_that.detail,_that.blockedBy);case _:
  return null;

}
}

}

/// @nodoc


class AssetApplied implements AssetResult {
  const AssetApplied({this.asset});
  

 final  FebricAsset? asset;

/// Create a copy of AssetResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssetAppliedCopyWith<AssetApplied> get copyWith => _$AssetAppliedCopyWithImpl<AssetApplied>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssetApplied&&(identical(other.asset, asset) || other.asset == asset));
}


@override
int get hashCode => Object.hash(runtimeType,asset);

@override
String toString() {
  return 'AssetResult.applied(asset: $asset)';
}


}

/// @nodoc
abstract mixin class $AssetAppliedCopyWith<$Res> implements $AssetResultCopyWith<$Res> {
  factory $AssetAppliedCopyWith(AssetApplied value, $Res Function(AssetApplied) _then) = _$AssetAppliedCopyWithImpl;
@useResult
$Res call({
 FebricAsset? asset
});


$FebricAssetCopyWith<$Res>? get asset;

}
/// @nodoc
class _$AssetAppliedCopyWithImpl<$Res>
    implements $AssetAppliedCopyWith<$Res> {
  _$AssetAppliedCopyWithImpl(this._self, this._then);

  final AssetApplied _self;
  final $Res Function(AssetApplied) _then;

/// Create a copy of AssetResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? asset = freezed,}) {
  return _then(AssetApplied(
asset: freezed == asset ? _self.asset : asset // ignore: cast_nullable_to_non_nullable
as FebricAsset?,
  ));
}

/// Create a copy of AssetResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FebricAssetCopyWith<$Res>? get asset {
    if (_self.asset == null) {
    return null;
  }

  return $FebricAssetCopyWith<$Res>(_self.asset!, (value) {
    return _then(_self.copyWith(asset: value));
  });
}
}

/// @nodoc


class AssetRejected implements AssetResult {
  const AssetRejected({required this.reason, this.detail, this.blockedBy});
  

 final  AssetRejectionReason reason;
 final  String? detail;
 final  LockState? blockedBy;

/// Create a copy of AssetResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssetRejectedCopyWith<AssetRejected> get copyWith => _$AssetRejectedCopyWithImpl<AssetRejected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssetRejected&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.blockedBy, blockedBy) || other.blockedBy == blockedBy));
}


@override
int get hashCode => Object.hash(runtimeType,reason,detail,blockedBy);

@override
String toString() {
  return 'AssetResult.rejected(reason: $reason, detail: $detail, blockedBy: $blockedBy)';
}


}

/// @nodoc
abstract mixin class $AssetRejectedCopyWith<$Res> implements $AssetResultCopyWith<$Res> {
  factory $AssetRejectedCopyWith(AssetRejected value, $Res Function(AssetRejected) _then) = _$AssetRejectedCopyWithImpl;
@useResult
$Res call({
 AssetRejectionReason reason, String? detail, LockState? blockedBy
});


$LockStateCopyWith<$Res>? get blockedBy;

}
/// @nodoc
class _$AssetRejectedCopyWithImpl<$Res>
    implements $AssetRejectedCopyWith<$Res> {
  _$AssetRejectedCopyWithImpl(this._self, this._then);

  final AssetRejected _self;
  final $Res Function(AssetRejected) _then;

/// Create a copy of AssetResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? reason = null,Object? detail = freezed,Object? blockedBy = freezed,}) {
  return _then(AssetRejected(
reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as AssetRejectionReason,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String?,blockedBy: freezed == blockedBy ? _self.blockedBy : blockedBy // ignore: cast_nullable_to_non_nullable
as LockState?,
  ));
}

/// Create a copy of AssetResult
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
