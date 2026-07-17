// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cursor_runtime.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CursorState {

@JsonKey(fromJson: _kindFromJson, toJson: _kindToJson) CursorKind get kind;/// Last pointer position in screen space (device-independent logical
/// pixels), or null before the first pointer event.
 Point2D? get screenPosition;
/// Create a copy of CursorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CursorStateCopyWith<CursorState> get copyWith => _$CursorStateCopyWithImpl<CursorState>(this as CursorState, _$identity);

  /// Serializes this CursorState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CursorState&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.screenPosition, screenPosition) || other.screenPosition == screenPosition));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,screenPosition);

@override
String toString() {
  return 'CursorState(kind: $kind, screenPosition: $screenPosition)';
}


}

/// @nodoc
abstract mixin class $CursorStateCopyWith<$Res>  {
  factory $CursorStateCopyWith(CursorState value, $Res Function(CursorState) _then) = _$CursorStateCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _kindFromJson, toJson: _kindToJson) CursorKind kind, Point2D? screenPosition
});


$Point2DCopyWith<$Res>? get screenPosition;

}
/// @nodoc
class _$CursorStateCopyWithImpl<$Res>
    implements $CursorStateCopyWith<$Res> {
  _$CursorStateCopyWithImpl(this._self, this._then);

  final CursorState _self;
  final $Res Function(CursorState) _then;

/// Create a copy of CursorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? screenPosition = freezed,}) {
  return _then(_self.copyWith(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as CursorKind,screenPosition: freezed == screenPosition ? _self.screenPosition : screenPosition // ignore: cast_nullable_to_non_nullable
as Point2D?,
  ));
}
/// Create a copy of CursorState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Point2DCopyWith<$Res>? get screenPosition {
    if (_self.screenPosition == null) {
    return null;
  }

  return $Point2DCopyWith<$Res>(_self.screenPosition!, (value) {
    return _then(_self.copyWith(screenPosition: value));
  });
}
}


/// Adds pattern-matching-related methods to [CursorState].
extension CursorStatePatterns on CursorState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CursorState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CursorState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CursorState value)  $default,){
final _that = this;
switch (_that) {
case _CursorState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CursorState value)?  $default,){
final _that = this;
switch (_that) {
case _CursorState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _kindFromJson, toJson: _kindToJson)  CursorKind kind,  Point2D? screenPosition)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CursorState() when $default != null:
return $default(_that.kind,_that.screenPosition);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _kindFromJson, toJson: _kindToJson)  CursorKind kind,  Point2D? screenPosition)  $default,) {final _that = this;
switch (_that) {
case _CursorState():
return $default(_that.kind,_that.screenPosition);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _kindFromJson, toJson: _kindToJson)  CursorKind kind,  Point2D? screenPosition)?  $default,) {final _that = this;
switch (_that) {
case _CursorState() when $default != null:
return $default(_that.kind,_that.screenPosition);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CursorState extends CursorState {
  const _CursorState({@JsonKey(fromJson: _kindFromJson, toJson: _kindToJson) this.kind = CursorKind.arrow, this.screenPosition}): super._();
  factory _CursorState.fromJson(Map<String, dynamic> json) => _$CursorStateFromJson(json);

@override@JsonKey(fromJson: _kindFromJson, toJson: _kindToJson) final  CursorKind kind;
/// Last pointer position in screen space (device-independent logical
/// pixels), or null before the first pointer event.
@override final  Point2D? screenPosition;

/// Create a copy of CursorState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CursorStateCopyWith<_CursorState> get copyWith => __$CursorStateCopyWithImpl<_CursorState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CursorStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CursorState&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.screenPosition, screenPosition) || other.screenPosition == screenPosition));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,screenPosition);

@override
String toString() {
  return 'CursorState(kind: $kind, screenPosition: $screenPosition)';
}


}

/// @nodoc
abstract mixin class _$CursorStateCopyWith<$Res> implements $CursorStateCopyWith<$Res> {
  factory _$CursorStateCopyWith(_CursorState value, $Res Function(_CursorState) _then) = __$CursorStateCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _kindFromJson, toJson: _kindToJson) CursorKind kind, Point2D? screenPosition
});


@override $Point2DCopyWith<$Res>? get screenPosition;

}
/// @nodoc
class __$CursorStateCopyWithImpl<$Res>
    implements _$CursorStateCopyWith<$Res> {
  __$CursorStateCopyWithImpl(this._self, this._then);

  final _CursorState _self;
  final $Res Function(_CursorState) _then;

/// Create a copy of CursorState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? screenPosition = freezed,}) {
  return _then(_CursorState(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as CursorKind,screenPosition: freezed == screenPosition ? _self.screenPosition : screenPosition // ignore: cast_nullable_to_non_nullable
as Point2D?,
  ));
}

/// Create a copy of CursorState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Point2DCopyWith<$Res>? get screenPosition {
    if (_self.screenPosition == null) {
    return null;
  }

  return $Point2DCopyWith<$Res>(_self.screenPosition!, (value) {
    return _then(_self.copyWith(screenPosition: value));
  });
}
}

// dart format on
