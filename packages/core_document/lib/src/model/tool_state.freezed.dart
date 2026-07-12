// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tool_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ToolStateExtension {

/// `FebricTool.wireName` or plugin id — the registry key.
 String get toolId;/// Tool-owned schema version of [data] (tools migrate their own data).
 int get version;/// Tool-owned payload; opaque to the Document Engine.
 Map<String, Object?> get data;
/// Create a copy of ToolStateExtension
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToolStateExtensionCopyWith<ToolStateExtension> get copyWith => _$ToolStateExtensionCopyWithImpl<ToolStateExtension>(this as ToolStateExtension, _$identity);

  /// Serializes this ToolStateExtension to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToolStateExtension&&(identical(other.toolId, toolId) || other.toolId == toolId)&&(identical(other.version, version) || other.version == version)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,toolId,version,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'ToolStateExtension(toolId: $toolId, version: $version, data: $data)';
}


}

/// @nodoc
abstract mixin class $ToolStateExtensionCopyWith<$Res>  {
  factory $ToolStateExtensionCopyWith(ToolStateExtension value, $Res Function(ToolStateExtension) _then) = _$ToolStateExtensionCopyWithImpl;
@useResult
$Res call({
 String toolId, int version, Map<String, Object?> data
});




}
/// @nodoc
class _$ToolStateExtensionCopyWithImpl<$Res>
    implements $ToolStateExtensionCopyWith<$Res> {
  _$ToolStateExtensionCopyWithImpl(this._self, this._then);

  final ToolStateExtension _self;
  final $Res Function(ToolStateExtension) _then;

/// Create a copy of ToolStateExtension
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? toolId = null,Object? version = null,Object? data = null,}) {
  return _then(_self.copyWith(
toolId: null == toolId ? _self.toolId : toolId // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

}


/// Adds pattern-matching-related methods to [ToolStateExtension].
extension ToolStateExtensionPatterns on ToolStateExtension {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ToolStateExtension value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ToolStateExtension() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ToolStateExtension value)  $default,){
final _that = this;
switch (_that) {
case _ToolStateExtension():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ToolStateExtension value)?  $default,){
final _that = this;
switch (_that) {
case _ToolStateExtension() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String toolId,  int version,  Map<String, Object?> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ToolStateExtension() when $default != null:
return $default(_that.toolId,_that.version,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String toolId,  int version,  Map<String, Object?> data)  $default,) {final _that = this;
switch (_that) {
case _ToolStateExtension():
return $default(_that.toolId,_that.version,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String toolId,  int version,  Map<String, Object?> data)?  $default,) {final _that = this;
switch (_that) {
case _ToolStateExtension() when $default != null:
return $default(_that.toolId,_that.version,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ToolStateExtension implements ToolStateExtension {
  const _ToolStateExtension({required this.toolId, this.version = 1, final  Map<String, Object?> data = const <String, Object?>{}}): _data = data;
  factory _ToolStateExtension.fromJson(Map<String, dynamic> json) => _$ToolStateExtensionFromJson(json);

/// `FebricTool.wireName` or plugin id — the registry key.
@override final  String toolId;
/// Tool-owned schema version of [data] (tools migrate their own data).
@override@JsonKey() final  int version;
/// Tool-owned payload; opaque to the Document Engine.
 final  Map<String, Object?> _data;
/// Tool-owned payload; opaque to the Document Engine.
@override@JsonKey() Map<String, Object?> get data {
  if (_data is EqualUnmodifiableMapView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_data);
}


/// Create a copy of ToolStateExtension
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToolStateExtensionCopyWith<_ToolStateExtension> get copyWith => __$ToolStateExtensionCopyWithImpl<_ToolStateExtension>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ToolStateExtensionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToolStateExtension&&(identical(other.toolId, toolId) || other.toolId == toolId)&&(identical(other.version, version) || other.version == version)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,toolId,version,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'ToolStateExtension(toolId: $toolId, version: $version, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ToolStateExtensionCopyWith<$Res> implements $ToolStateExtensionCopyWith<$Res> {
  factory _$ToolStateExtensionCopyWith(_ToolStateExtension value, $Res Function(_ToolStateExtension) _then) = __$ToolStateExtensionCopyWithImpl;
@override @useResult
$Res call({
 String toolId, int version, Map<String, Object?> data
});




}
/// @nodoc
class __$ToolStateExtensionCopyWithImpl<$Res>
    implements _$ToolStateExtensionCopyWith<$Res> {
  __$ToolStateExtensionCopyWithImpl(this._self, this._then);

  final _ToolStateExtension _self;
  final $Res Function(_ToolStateExtension) _then;

/// Create a copy of ToolStateExtension
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? toolId = null,Object? version = null,Object? data = null,}) {
  return _then(_ToolStateExtension(
toolId: null == toolId ? _self.toolId : toolId // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}

// dart format on
