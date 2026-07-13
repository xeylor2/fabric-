// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'render_metrics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RenderMetrics {

/// The frame this snapshot describes (deterministic identity).
 int get frameId;/// Metric values keyed by wire name (`RenderMetricKind.wireName`).
 Map<String, num> get values;
/// Create a copy of RenderMetrics
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RenderMetricsCopyWith<RenderMetrics> get copyWith => _$RenderMetricsCopyWithImpl<RenderMetrics>(this as RenderMetrics, _$identity);

  /// Serializes this RenderMetrics to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RenderMetrics&&(identical(other.frameId, frameId) || other.frameId == frameId)&&const DeepCollectionEquality().equals(other.values, values));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,frameId,const DeepCollectionEquality().hash(values));

@override
String toString() {
  return 'RenderMetrics(frameId: $frameId, values: $values)';
}


}

/// @nodoc
abstract mixin class $RenderMetricsCopyWith<$Res>  {
  factory $RenderMetricsCopyWith(RenderMetrics value, $Res Function(RenderMetrics) _then) = _$RenderMetricsCopyWithImpl;
@useResult
$Res call({
 int frameId, Map<String, num> values
});




}
/// @nodoc
class _$RenderMetricsCopyWithImpl<$Res>
    implements $RenderMetricsCopyWith<$Res> {
  _$RenderMetricsCopyWithImpl(this._self, this._then);

  final RenderMetrics _self;
  final $Res Function(RenderMetrics) _then;

/// Create a copy of RenderMetrics
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? frameId = null,Object? values = null,}) {
  return _then(_self.copyWith(
frameId: null == frameId ? _self.frameId : frameId // ignore: cast_nullable_to_non_nullable
as int,values: null == values ? _self.values : values // ignore: cast_nullable_to_non_nullable
as Map<String, num>,
  ));
}

}


/// Adds pattern-matching-related methods to [RenderMetrics].
extension RenderMetricsPatterns on RenderMetrics {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RenderMetrics value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RenderMetrics() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RenderMetrics value)  $default,){
final _that = this;
switch (_that) {
case _RenderMetrics():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RenderMetrics value)?  $default,){
final _that = this;
switch (_that) {
case _RenderMetrics() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int frameId,  Map<String, num> values)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RenderMetrics() when $default != null:
return $default(_that.frameId,_that.values);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int frameId,  Map<String, num> values)  $default,) {final _that = this;
switch (_that) {
case _RenderMetrics():
return $default(_that.frameId,_that.values);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int frameId,  Map<String, num> values)?  $default,) {final _that = this;
switch (_that) {
case _RenderMetrics() when $default != null:
return $default(_that.frameId,_that.values);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RenderMetrics extends RenderMetrics {
  const _RenderMetrics({this.frameId = 0, final  Map<String, num> values = const <String, num>{}}): _values = values,super._();
  factory _RenderMetrics.fromJson(Map<String, dynamic> json) => _$RenderMetricsFromJson(json);

/// The frame this snapshot describes (deterministic identity).
@override@JsonKey() final  int frameId;
/// Metric values keyed by wire name (`RenderMetricKind.wireName`).
 final  Map<String, num> _values;
/// Metric values keyed by wire name (`RenderMetricKind.wireName`).
@override@JsonKey() Map<String, num> get values {
  if (_values is EqualUnmodifiableMapView) return _values;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_values);
}


/// Create a copy of RenderMetrics
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RenderMetricsCopyWith<_RenderMetrics> get copyWith => __$RenderMetricsCopyWithImpl<_RenderMetrics>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RenderMetricsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RenderMetrics&&(identical(other.frameId, frameId) || other.frameId == frameId)&&const DeepCollectionEquality().equals(other._values, _values));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,frameId,const DeepCollectionEquality().hash(_values));

@override
String toString() {
  return 'RenderMetrics(frameId: $frameId, values: $values)';
}


}

/// @nodoc
abstract mixin class _$RenderMetricsCopyWith<$Res> implements $RenderMetricsCopyWith<$Res> {
  factory _$RenderMetricsCopyWith(_RenderMetrics value, $Res Function(_RenderMetrics) _then) = __$RenderMetricsCopyWithImpl;
@override @useResult
$Res call({
 int frameId, Map<String, num> values
});




}
/// @nodoc
class __$RenderMetricsCopyWithImpl<$Res>
    implements _$RenderMetricsCopyWith<$Res> {
  __$RenderMetricsCopyWithImpl(this._self, this._then);

  final _RenderMetrics _self;
  final $Res Function(_RenderMetrics) _then;

/// Create a copy of RenderMetrics
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? frameId = null,Object? values = null,}) {
  return _then(_RenderMetrics(
frameId: null == frameId ? _self.frameId : frameId // ignore: cast_nullable_to_non_nullable
as int,values: null == values ? _self._values : values // ignore: cast_nullable_to_non_nullable
as Map<String, num>,
  ));
}


}

// dart format on
