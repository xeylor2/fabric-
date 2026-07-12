// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'navigation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NavigationState {

 ViewportState get viewport; List<ViewportState> get history; int get maxHistory;
/// Create a copy of NavigationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigationStateCopyWith<NavigationState> get copyWith => _$NavigationStateCopyWithImpl<NavigationState>(this as NavigationState, _$identity);

  /// Serializes this NavigationState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NavigationState&&(identical(other.viewport, viewport) || other.viewport == viewport)&&const DeepCollectionEquality().equals(other.history, history)&&(identical(other.maxHistory, maxHistory) || other.maxHistory == maxHistory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,viewport,const DeepCollectionEquality().hash(history),maxHistory);

@override
String toString() {
  return 'NavigationState(viewport: $viewport, history: $history, maxHistory: $maxHistory)';
}


}

/// @nodoc
abstract mixin class $NavigationStateCopyWith<$Res>  {
  factory $NavigationStateCopyWith(NavigationState value, $Res Function(NavigationState) _then) = _$NavigationStateCopyWithImpl;
@useResult
$Res call({
 ViewportState viewport, List<ViewportState> history, int maxHistory
});


$ViewportStateCopyWith<$Res> get viewport;

}
/// @nodoc
class _$NavigationStateCopyWithImpl<$Res>
    implements $NavigationStateCopyWith<$Res> {
  _$NavigationStateCopyWithImpl(this._self, this._then);

  final NavigationState _self;
  final $Res Function(NavigationState) _then;

/// Create a copy of NavigationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? viewport = null,Object? history = null,Object? maxHistory = null,}) {
  return _then(_self.copyWith(
viewport: null == viewport ? _self.viewport : viewport // ignore: cast_nullable_to_non_nullable
as ViewportState,history: null == history ? _self.history : history // ignore: cast_nullable_to_non_nullable
as List<ViewportState>,maxHistory: null == maxHistory ? _self.maxHistory : maxHistory // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of NavigationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ViewportStateCopyWith<$Res> get viewport {
  
  return $ViewportStateCopyWith<$Res>(_self.viewport, (value) {
    return _then(_self.copyWith(viewport: value));
  });
}
}


/// Adds pattern-matching-related methods to [NavigationState].
extension NavigationStatePatterns on NavigationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NavigationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NavigationState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NavigationState value)  $default,){
final _that = this;
switch (_that) {
case _NavigationState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NavigationState value)?  $default,){
final _that = this;
switch (_that) {
case _NavigationState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ViewportState viewport,  List<ViewportState> history,  int maxHistory)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NavigationState() when $default != null:
return $default(_that.viewport,_that.history,_that.maxHistory);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ViewportState viewport,  List<ViewportState> history,  int maxHistory)  $default,) {final _that = this;
switch (_that) {
case _NavigationState():
return $default(_that.viewport,_that.history,_that.maxHistory);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ViewportState viewport,  List<ViewportState> history,  int maxHistory)?  $default,) {final _that = this;
switch (_that) {
case _NavigationState() when $default != null:
return $default(_that.viewport,_that.history,_that.maxHistory);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NavigationState extends NavigationState {
  const _NavigationState({required this.viewport, final  List<ViewportState> history = const <ViewportState>[], this.maxHistory = 32}): _history = history,super._();
  factory _NavigationState.fromJson(Map<String, dynamic> json) => _$NavigationStateFromJson(json);

@override final  ViewportState viewport;
 final  List<ViewportState> _history;
@override@JsonKey() List<ViewportState> get history {
  if (_history is EqualUnmodifiableListView) return _history;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_history);
}

@override@JsonKey() final  int maxHistory;

/// Create a copy of NavigationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NavigationStateCopyWith<_NavigationState> get copyWith => __$NavigationStateCopyWithImpl<_NavigationState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NavigationStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NavigationState&&(identical(other.viewport, viewport) || other.viewport == viewport)&&const DeepCollectionEquality().equals(other._history, _history)&&(identical(other.maxHistory, maxHistory) || other.maxHistory == maxHistory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,viewport,const DeepCollectionEquality().hash(_history),maxHistory);

@override
String toString() {
  return 'NavigationState(viewport: $viewport, history: $history, maxHistory: $maxHistory)';
}


}

/// @nodoc
abstract mixin class _$NavigationStateCopyWith<$Res> implements $NavigationStateCopyWith<$Res> {
  factory _$NavigationStateCopyWith(_NavigationState value, $Res Function(_NavigationState) _then) = __$NavigationStateCopyWithImpl;
@override @useResult
$Res call({
 ViewportState viewport, List<ViewportState> history, int maxHistory
});


@override $ViewportStateCopyWith<$Res> get viewport;

}
/// @nodoc
class __$NavigationStateCopyWithImpl<$Res>
    implements _$NavigationStateCopyWith<$Res> {
  __$NavigationStateCopyWithImpl(this._self, this._then);

  final _NavigationState _self;
  final $Res Function(_NavigationState) _then;

/// Create a copy of NavigationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? viewport = null,Object? history = null,Object? maxHistory = null,}) {
  return _then(_NavigationState(
viewport: null == viewport ? _self.viewport : viewport // ignore: cast_nullable_to_non_nullable
as ViewportState,history: null == history ? _self._history : history // ignore: cast_nullable_to_non_nullable
as List<ViewportState>,maxHistory: null == maxHistory ? _self.maxHistory : maxHistory // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of NavigationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ViewportStateCopyWith<$Res> get viewport {
  
  return $ViewportStateCopyWith<$Res>(_self.viewport, (value) {
    return _then(_self.copyWith(viewport: value));
  });
}
}

// dart format on
