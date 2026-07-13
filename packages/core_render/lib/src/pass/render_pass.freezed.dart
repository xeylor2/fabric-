// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'render_pass.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RenderPass {

@JsonKey(fromJson: _kindFromJson, toJson: _kindToJson) RenderPassKind get kind;/// Ordering slot; lower runs earlier.
 int get slot;/// Object kinds this pass draws (empty = all).
@JsonKey(fromJson: _filterFromJson, toJson: _filterToJson) List<RenderObjectKind> get objectFilter; bool get enabled;
/// Create a copy of RenderPass
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RenderPassCopyWith<RenderPass> get copyWith => _$RenderPassCopyWithImpl<RenderPass>(this as RenderPass, _$identity);

  /// Serializes this RenderPass to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RenderPass&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.slot, slot) || other.slot == slot)&&const DeepCollectionEquality().equals(other.objectFilter, objectFilter)&&(identical(other.enabled, enabled) || other.enabled == enabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,slot,const DeepCollectionEquality().hash(objectFilter),enabled);

@override
String toString() {
  return 'RenderPass(kind: $kind, slot: $slot, objectFilter: $objectFilter, enabled: $enabled)';
}


}

/// @nodoc
abstract mixin class $RenderPassCopyWith<$Res>  {
  factory $RenderPassCopyWith(RenderPass value, $Res Function(RenderPass) _then) = _$RenderPassCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _kindFromJson, toJson: _kindToJson) RenderPassKind kind, int slot,@JsonKey(fromJson: _filterFromJson, toJson: _filterToJson) List<RenderObjectKind> objectFilter, bool enabled
});




}
/// @nodoc
class _$RenderPassCopyWithImpl<$Res>
    implements $RenderPassCopyWith<$Res> {
  _$RenderPassCopyWithImpl(this._self, this._then);

  final RenderPass _self;
  final $Res Function(RenderPass) _then;

/// Create a copy of RenderPass
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? slot = null,Object? objectFilter = null,Object? enabled = null,}) {
  return _then(_self.copyWith(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as RenderPassKind,slot: null == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as int,objectFilter: null == objectFilter ? _self.objectFilter : objectFilter // ignore: cast_nullable_to_non_nullable
as List<RenderObjectKind>,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [RenderPass].
extension RenderPassPatterns on RenderPass {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RenderPass value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RenderPass() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RenderPass value)  $default,){
final _that = this;
switch (_that) {
case _RenderPass():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RenderPass value)?  $default,){
final _that = this;
switch (_that) {
case _RenderPass() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _kindFromJson, toJson: _kindToJson)  RenderPassKind kind,  int slot, @JsonKey(fromJson: _filterFromJson, toJson: _filterToJson)  List<RenderObjectKind> objectFilter,  bool enabled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RenderPass() when $default != null:
return $default(_that.kind,_that.slot,_that.objectFilter,_that.enabled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _kindFromJson, toJson: _kindToJson)  RenderPassKind kind,  int slot, @JsonKey(fromJson: _filterFromJson, toJson: _filterToJson)  List<RenderObjectKind> objectFilter,  bool enabled)  $default,) {final _that = this;
switch (_that) {
case _RenderPass():
return $default(_that.kind,_that.slot,_that.objectFilter,_that.enabled);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _kindFromJson, toJson: _kindToJson)  RenderPassKind kind,  int slot, @JsonKey(fromJson: _filterFromJson, toJson: _filterToJson)  List<RenderObjectKind> objectFilter,  bool enabled)?  $default,) {final _that = this;
switch (_that) {
case _RenderPass() when $default != null:
return $default(_that.kind,_that.slot,_that.objectFilter,_that.enabled);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RenderPass implements RenderPass {
  const _RenderPass({@JsonKey(fromJson: _kindFromJson, toJson: _kindToJson) required this.kind, this.slot = 0, @JsonKey(fromJson: _filterFromJson, toJson: _filterToJson) final  List<RenderObjectKind> objectFilter = const <RenderObjectKind>[], this.enabled = true}): _objectFilter = objectFilter;
  factory _RenderPass.fromJson(Map<String, dynamic> json) => _$RenderPassFromJson(json);

@override@JsonKey(fromJson: _kindFromJson, toJson: _kindToJson) final  RenderPassKind kind;
/// Ordering slot; lower runs earlier.
@override@JsonKey() final  int slot;
/// Object kinds this pass draws (empty = all).
 final  List<RenderObjectKind> _objectFilter;
/// Object kinds this pass draws (empty = all).
@override@JsonKey(fromJson: _filterFromJson, toJson: _filterToJson) List<RenderObjectKind> get objectFilter {
  if (_objectFilter is EqualUnmodifiableListView) return _objectFilter;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_objectFilter);
}

@override@JsonKey() final  bool enabled;

/// Create a copy of RenderPass
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RenderPassCopyWith<_RenderPass> get copyWith => __$RenderPassCopyWithImpl<_RenderPass>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RenderPassToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RenderPass&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.slot, slot) || other.slot == slot)&&const DeepCollectionEquality().equals(other._objectFilter, _objectFilter)&&(identical(other.enabled, enabled) || other.enabled == enabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,slot,const DeepCollectionEquality().hash(_objectFilter),enabled);

@override
String toString() {
  return 'RenderPass(kind: $kind, slot: $slot, objectFilter: $objectFilter, enabled: $enabled)';
}


}

/// @nodoc
abstract mixin class _$RenderPassCopyWith<$Res> implements $RenderPassCopyWith<$Res> {
  factory _$RenderPassCopyWith(_RenderPass value, $Res Function(_RenderPass) _then) = __$RenderPassCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _kindFromJson, toJson: _kindToJson) RenderPassKind kind, int slot,@JsonKey(fromJson: _filterFromJson, toJson: _filterToJson) List<RenderObjectKind> objectFilter, bool enabled
});




}
/// @nodoc
class __$RenderPassCopyWithImpl<$Res>
    implements _$RenderPassCopyWith<$Res> {
  __$RenderPassCopyWithImpl(this._self, this._then);

  final _RenderPass _self;
  final $Res Function(_RenderPass) _then;

/// Create a copy of RenderPass
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? slot = null,Object? objectFilter = null,Object? enabled = null,}) {
  return _then(_RenderPass(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as RenderPassKind,slot: null == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as int,objectFilter: null == objectFilter ? _self._objectFilter : objectFilter // ignore: cast_nullable_to_non_nullable
as List<RenderObjectKind>,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
