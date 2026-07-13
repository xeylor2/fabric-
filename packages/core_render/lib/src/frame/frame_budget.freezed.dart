// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'frame_budget.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FrameBudget {

/// Update + cull allowance (graph recompile, damage, culling).
 int get updateMicros;/// Record + submit allowance (pass recording, backend submit).
 int get renderMicros;/// Composite + present allowance.
 int get presentMicros;/// The total frame envelope (16667 ≈ 60fps by default).
 int get frameMicros;@JsonKey(fromJson: _policyFromJson, toJson: _policyToJson) OverrunPolicy get updateOverrun;@JsonKey(fromJson: _policyFromJson, toJson: _policyToJson) OverrunPolicy get renderOverrun;@JsonKey(fromJson: _policyFromJson, toJson: _policyToJson) OverrunPolicy get presentOverrun;
/// Create a copy of FrameBudget
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FrameBudgetCopyWith<FrameBudget> get copyWith => _$FrameBudgetCopyWithImpl<FrameBudget>(this as FrameBudget, _$identity);

  /// Serializes this FrameBudget to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FrameBudget&&(identical(other.updateMicros, updateMicros) || other.updateMicros == updateMicros)&&(identical(other.renderMicros, renderMicros) || other.renderMicros == renderMicros)&&(identical(other.presentMicros, presentMicros) || other.presentMicros == presentMicros)&&(identical(other.frameMicros, frameMicros) || other.frameMicros == frameMicros)&&(identical(other.updateOverrun, updateOverrun) || other.updateOverrun == updateOverrun)&&(identical(other.renderOverrun, renderOverrun) || other.renderOverrun == renderOverrun)&&(identical(other.presentOverrun, presentOverrun) || other.presentOverrun == presentOverrun));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,updateMicros,renderMicros,presentMicros,frameMicros,updateOverrun,renderOverrun,presentOverrun);

@override
String toString() {
  return 'FrameBudget(updateMicros: $updateMicros, renderMicros: $renderMicros, presentMicros: $presentMicros, frameMicros: $frameMicros, updateOverrun: $updateOverrun, renderOverrun: $renderOverrun, presentOverrun: $presentOverrun)';
}


}

/// @nodoc
abstract mixin class $FrameBudgetCopyWith<$Res>  {
  factory $FrameBudgetCopyWith(FrameBudget value, $Res Function(FrameBudget) _then) = _$FrameBudgetCopyWithImpl;
@useResult
$Res call({
 int updateMicros, int renderMicros, int presentMicros, int frameMicros,@JsonKey(fromJson: _policyFromJson, toJson: _policyToJson) OverrunPolicy updateOverrun,@JsonKey(fromJson: _policyFromJson, toJson: _policyToJson) OverrunPolicy renderOverrun,@JsonKey(fromJson: _policyFromJson, toJson: _policyToJson) OverrunPolicy presentOverrun
});




}
/// @nodoc
class _$FrameBudgetCopyWithImpl<$Res>
    implements $FrameBudgetCopyWith<$Res> {
  _$FrameBudgetCopyWithImpl(this._self, this._then);

  final FrameBudget _self;
  final $Res Function(FrameBudget) _then;

/// Create a copy of FrameBudget
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? updateMicros = null,Object? renderMicros = null,Object? presentMicros = null,Object? frameMicros = null,Object? updateOverrun = null,Object? renderOverrun = null,Object? presentOverrun = null,}) {
  return _then(_self.copyWith(
updateMicros: null == updateMicros ? _self.updateMicros : updateMicros // ignore: cast_nullable_to_non_nullable
as int,renderMicros: null == renderMicros ? _self.renderMicros : renderMicros // ignore: cast_nullable_to_non_nullable
as int,presentMicros: null == presentMicros ? _self.presentMicros : presentMicros // ignore: cast_nullable_to_non_nullable
as int,frameMicros: null == frameMicros ? _self.frameMicros : frameMicros // ignore: cast_nullable_to_non_nullable
as int,updateOverrun: null == updateOverrun ? _self.updateOverrun : updateOverrun // ignore: cast_nullable_to_non_nullable
as OverrunPolicy,renderOverrun: null == renderOverrun ? _self.renderOverrun : renderOverrun // ignore: cast_nullable_to_non_nullable
as OverrunPolicy,presentOverrun: null == presentOverrun ? _self.presentOverrun : presentOverrun // ignore: cast_nullable_to_non_nullable
as OverrunPolicy,
  ));
}

}


/// Adds pattern-matching-related methods to [FrameBudget].
extension FrameBudgetPatterns on FrameBudget {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FrameBudget value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FrameBudget() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FrameBudget value)  $default,){
final _that = this;
switch (_that) {
case _FrameBudget():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FrameBudget value)?  $default,){
final _that = this;
switch (_that) {
case _FrameBudget() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int updateMicros,  int renderMicros,  int presentMicros,  int frameMicros, @JsonKey(fromJson: _policyFromJson, toJson: _policyToJson)  OverrunPolicy updateOverrun, @JsonKey(fromJson: _policyFromJson, toJson: _policyToJson)  OverrunPolicy renderOverrun, @JsonKey(fromJson: _policyFromJson, toJson: _policyToJson)  OverrunPolicy presentOverrun)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FrameBudget() when $default != null:
return $default(_that.updateMicros,_that.renderMicros,_that.presentMicros,_that.frameMicros,_that.updateOverrun,_that.renderOverrun,_that.presentOverrun);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int updateMicros,  int renderMicros,  int presentMicros,  int frameMicros, @JsonKey(fromJson: _policyFromJson, toJson: _policyToJson)  OverrunPolicy updateOverrun, @JsonKey(fromJson: _policyFromJson, toJson: _policyToJson)  OverrunPolicy renderOverrun, @JsonKey(fromJson: _policyFromJson, toJson: _policyToJson)  OverrunPolicy presentOverrun)  $default,) {final _that = this;
switch (_that) {
case _FrameBudget():
return $default(_that.updateMicros,_that.renderMicros,_that.presentMicros,_that.frameMicros,_that.updateOverrun,_that.renderOverrun,_that.presentOverrun);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int updateMicros,  int renderMicros,  int presentMicros,  int frameMicros, @JsonKey(fromJson: _policyFromJson, toJson: _policyToJson)  OverrunPolicy updateOverrun, @JsonKey(fromJson: _policyFromJson, toJson: _policyToJson)  OverrunPolicy renderOverrun, @JsonKey(fromJson: _policyFromJson, toJson: _policyToJson)  OverrunPolicy presentOverrun)?  $default,) {final _that = this;
switch (_that) {
case _FrameBudget() when $default != null:
return $default(_that.updateMicros,_that.renderMicros,_that.presentMicros,_that.frameMicros,_that.updateOverrun,_that.renderOverrun,_that.presentOverrun);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FrameBudget extends FrameBudget {
  const _FrameBudget({this.updateMicros = 4000, this.renderMicros = 8000, this.presentMicros = 4000, this.frameMicros = 16667, @JsonKey(fromJson: _policyFromJson, toJson: _policyToJson) this.updateOverrun = OverrunPolicy.defer, @JsonKey(fromJson: _policyFromJson, toJson: _policyToJson) this.renderOverrun = OverrunPolicy.degradeLod, @JsonKey(fromJson: _policyFromJson, toJson: _policyToJson) this.presentOverrun = OverrunPolicy.presentLast}): super._();
  factory _FrameBudget.fromJson(Map<String, dynamic> json) => _$FrameBudgetFromJson(json);

/// Update + cull allowance (graph recompile, damage, culling).
@override@JsonKey() final  int updateMicros;
/// Record + submit allowance (pass recording, backend submit).
@override@JsonKey() final  int renderMicros;
/// Composite + present allowance.
@override@JsonKey() final  int presentMicros;
/// The total frame envelope (16667 ≈ 60fps by default).
@override@JsonKey() final  int frameMicros;
@override@JsonKey(fromJson: _policyFromJson, toJson: _policyToJson) final  OverrunPolicy updateOverrun;
@override@JsonKey(fromJson: _policyFromJson, toJson: _policyToJson) final  OverrunPolicy renderOverrun;
@override@JsonKey(fromJson: _policyFromJson, toJson: _policyToJson) final  OverrunPolicy presentOverrun;

/// Create a copy of FrameBudget
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FrameBudgetCopyWith<_FrameBudget> get copyWith => __$FrameBudgetCopyWithImpl<_FrameBudget>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FrameBudgetToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FrameBudget&&(identical(other.updateMicros, updateMicros) || other.updateMicros == updateMicros)&&(identical(other.renderMicros, renderMicros) || other.renderMicros == renderMicros)&&(identical(other.presentMicros, presentMicros) || other.presentMicros == presentMicros)&&(identical(other.frameMicros, frameMicros) || other.frameMicros == frameMicros)&&(identical(other.updateOverrun, updateOverrun) || other.updateOverrun == updateOverrun)&&(identical(other.renderOverrun, renderOverrun) || other.renderOverrun == renderOverrun)&&(identical(other.presentOverrun, presentOverrun) || other.presentOverrun == presentOverrun));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,updateMicros,renderMicros,presentMicros,frameMicros,updateOverrun,renderOverrun,presentOverrun);

@override
String toString() {
  return 'FrameBudget(updateMicros: $updateMicros, renderMicros: $renderMicros, presentMicros: $presentMicros, frameMicros: $frameMicros, updateOverrun: $updateOverrun, renderOverrun: $renderOverrun, presentOverrun: $presentOverrun)';
}


}

/// @nodoc
abstract mixin class _$FrameBudgetCopyWith<$Res> implements $FrameBudgetCopyWith<$Res> {
  factory _$FrameBudgetCopyWith(_FrameBudget value, $Res Function(_FrameBudget) _then) = __$FrameBudgetCopyWithImpl;
@override @useResult
$Res call({
 int updateMicros, int renderMicros, int presentMicros, int frameMicros,@JsonKey(fromJson: _policyFromJson, toJson: _policyToJson) OverrunPolicy updateOverrun,@JsonKey(fromJson: _policyFromJson, toJson: _policyToJson) OverrunPolicy renderOverrun,@JsonKey(fromJson: _policyFromJson, toJson: _policyToJson) OverrunPolicy presentOverrun
});




}
/// @nodoc
class __$FrameBudgetCopyWithImpl<$Res>
    implements _$FrameBudgetCopyWith<$Res> {
  __$FrameBudgetCopyWithImpl(this._self, this._then);

  final _FrameBudget _self;
  final $Res Function(_FrameBudget) _then;

/// Create a copy of FrameBudget
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? updateMicros = null,Object? renderMicros = null,Object? presentMicros = null,Object? frameMicros = null,Object? updateOverrun = null,Object? renderOverrun = null,Object? presentOverrun = null,}) {
  return _then(_FrameBudget(
updateMicros: null == updateMicros ? _self.updateMicros : updateMicros // ignore: cast_nullable_to_non_nullable
as int,renderMicros: null == renderMicros ? _self.renderMicros : renderMicros // ignore: cast_nullable_to_non_nullable
as int,presentMicros: null == presentMicros ? _self.presentMicros : presentMicros // ignore: cast_nullable_to_non_nullable
as int,frameMicros: null == frameMicros ? _self.frameMicros : frameMicros // ignore: cast_nullable_to_non_nullable
as int,updateOverrun: null == updateOverrun ? _self.updateOverrun : updateOverrun // ignore: cast_nullable_to_non_nullable
as OverrunPolicy,renderOverrun: null == renderOverrun ? _self.renderOverrun : renderOverrun // ignore: cast_nullable_to_non_nullable
as OverrunPolicy,presentOverrun: null == presentOverrun ? _self.presentOverrun : presentOverrun // ignore: cast_nullable_to_non_nullable
as OverrunPolicy,
  ));
}


}

// dart format on
