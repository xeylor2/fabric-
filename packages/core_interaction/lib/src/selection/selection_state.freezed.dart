// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selection_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SelectionState {

 Set<String> get selectedIds;
/// Create a copy of SelectionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectionStateCopyWith<SelectionState> get copyWith => _$SelectionStateCopyWithImpl<SelectionState>(this as SelectionState, _$identity);

  /// Serializes this SelectionState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectionState&&const DeepCollectionEquality().equals(other.selectedIds, selectedIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(selectedIds));

@override
String toString() {
  return 'SelectionState(selectedIds: $selectedIds)';
}


}

/// @nodoc
abstract mixin class $SelectionStateCopyWith<$Res>  {
  factory $SelectionStateCopyWith(SelectionState value, $Res Function(SelectionState) _then) = _$SelectionStateCopyWithImpl;
@useResult
$Res call({
 Set<String> selectedIds
});




}
/// @nodoc
class _$SelectionStateCopyWithImpl<$Res>
    implements $SelectionStateCopyWith<$Res> {
  _$SelectionStateCopyWithImpl(this._self, this._then);

  final SelectionState _self;
  final $Res Function(SelectionState) _then;

/// Create a copy of SelectionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedIds = null,}) {
  return _then(_self.copyWith(
selectedIds: null == selectedIds ? _self.selectedIds : selectedIds // ignore: cast_nullable_to_non_nullable
as Set<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [SelectionState].
extension SelectionStatePatterns on SelectionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SelectionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SelectionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SelectionState value)  $default,){
final _that = this;
switch (_that) {
case _SelectionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SelectionState value)?  $default,){
final _that = this;
switch (_that) {
case _SelectionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Set<String> selectedIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SelectionState() when $default != null:
return $default(_that.selectedIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Set<String> selectedIds)  $default,) {final _that = this;
switch (_that) {
case _SelectionState():
return $default(_that.selectedIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Set<String> selectedIds)?  $default,) {final _that = this;
switch (_that) {
case _SelectionState() when $default != null:
return $default(_that.selectedIds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SelectionState extends SelectionState {
  const _SelectionState({final  Set<String> selectedIds = const <String>{}}): _selectedIds = selectedIds,super._();
  factory _SelectionState.fromJson(Map<String, dynamic> json) => _$SelectionStateFromJson(json);

 final  Set<String> _selectedIds;
@override@JsonKey() Set<String> get selectedIds {
  if (_selectedIds is EqualUnmodifiableSetView) return _selectedIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_selectedIds);
}


/// Create a copy of SelectionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectionStateCopyWith<_SelectionState> get copyWith => __$SelectionStateCopyWithImpl<_SelectionState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SelectionStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectionState&&const DeepCollectionEquality().equals(other._selectedIds, _selectedIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_selectedIds));

@override
String toString() {
  return 'SelectionState(selectedIds: $selectedIds)';
}


}

/// @nodoc
abstract mixin class _$SelectionStateCopyWith<$Res> implements $SelectionStateCopyWith<$Res> {
  factory _$SelectionStateCopyWith(_SelectionState value, $Res Function(_SelectionState) _then) = __$SelectionStateCopyWithImpl;
@override @useResult
$Res call({
 Set<String> selectedIds
});




}
/// @nodoc
class __$SelectionStateCopyWithImpl<$Res>
    implements _$SelectionStateCopyWith<$Res> {
  __$SelectionStateCopyWithImpl(this._self, this._then);

  final _SelectionState _self;
  final $Res Function(_SelectionState) _then;

/// Create a copy of SelectionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedIds = null,}) {
  return _then(_SelectionState(
selectedIds: null == selectedIds ? _self._selectedIds : selectedIds // ignore: cast_nullable_to_non_nullable
as Set<String>,
  ));
}


}

// dart format on
