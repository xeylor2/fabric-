// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'command_buffer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CommandBuffer {

 int get frameId; List<RenderCommand> get commands;
/// Create a copy of CommandBuffer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommandBufferCopyWith<CommandBuffer> get copyWith => _$CommandBufferCopyWithImpl<CommandBuffer>(this as CommandBuffer, _$identity);

  /// Serializes this CommandBuffer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommandBuffer&&(identical(other.frameId, frameId) || other.frameId == frameId)&&const DeepCollectionEquality().equals(other.commands, commands));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,frameId,const DeepCollectionEquality().hash(commands));

@override
String toString() {
  return 'CommandBuffer(frameId: $frameId, commands: $commands)';
}


}

/// @nodoc
abstract mixin class $CommandBufferCopyWith<$Res>  {
  factory $CommandBufferCopyWith(CommandBuffer value, $Res Function(CommandBuffer) _then) = _$CommandBufferCopyWithImpl;
@useResult
$Res call({
 int frameId, List<RenderCommand> commands
});




}
/// @nodoc
class _$CommandBufferCopyWithImpl<$Res>
    implements $CommandBufferCopyWith<$Res> {
  _$CommandBufferCopyWithImpl(this._self, this._then);

  final CommandBuffer _self;
  final $Res Function(CommandBuffer) _then;

/// Create a copy of CommandBuffer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? frameId = null,Object? commands = null,}) {
  return _then(_self.copyWith(
frameId: null == frameId ? _self.frameId : frameId // ignore: cast_nullable_to_non_nullable
as int,commands: null == commands ? _self.commands : commands // ignore: cast_nullable_to_non_nullable
as List<RenderCommand>,
  ));
}

}


/// Adds pattern-matching-related methods to [CommandBuffer].
extension CommandBufferPatterns on CommandBuffer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommandBuffer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommandBuffer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommandBuffer value)  $default,){
final _that = this;
switch (_that) {
case _CommandBuffer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommandBuffer value)?  $default,){
final _that = this;
switch (_that) {
case _CommandBuffer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int frameId,  List<RenderCommand> commands)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommandBuffer() when $default != null:
return $default(_that.frameId,_that.commands);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int frameId,  List<RenderCommand> commands)  $default,) {final _that = this;
switch (_that) {
case _CommandBuffer():
return $default(_that.frameId,_that.commands);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int frameId,  List<RenderCommand> commands)?  $default,) {final _that = this;
switch (_that) {
case _CommandBuffer() when $default != null:
return $default(_that.frameId,_that.commands);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CommandBuffer extends CommandBuffer {
  const _CommandBuffer({required this.frameId, final  List<RenderCommand> commands = const <RenderCommand>[]}): _commands = commands,super._();
  factory _CommandBuffer.fromJson(Map<String, dynamic> json) => _$CommandBufferFromJson(json);

@override final  int frameId;
 final  List<RenderCommand> _commands;
@override@JsonKey() List<RenderCommand> get commands {
  if (_commands is EqualUnmodifiableListView) return _commands;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_commands);
}


/// Create a copy of CommandBuffer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommandBufferCopyWith<_CommandBuffer> get copyWith => __$CommandBufferCopyWithImpl<_CommandBuffer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommandBufferToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommandBuffer&&(identical(other.frameId, frameId) || other.frameId == frameId)&&const DeepCollectionEquality().equals(other._commands, _commands));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,frameId,const DeepCollectionEquality().hash(_commands));

@override
String toString() {
  return 'CommandBuffer(frameId: $frameId, commands: $commands)';
}


}

/// @nodoc
abstract mixin class _$CommandBufferCopyWith<$Res> implements $CommandBufferCopyWith<$Res> {
  factory _$CommandBufferCopyWith(_CommandBuffer value, $Res Function(_CommandBuffer) _then) = __$CommandBufferCopyWithImpl;
@override @useResult
$Res call({
 int frameId, List<RenderCommand> commands
});




}
/// @nodoc
class __$CommandBufferCopyWithImpl<$Res>
    implements _$CommandBufferCopyWith<$Res> {
  __$CommandBufferCopyWithImpl(this._self, this._then);

  final _CommandBuffer _self;
  final $Res Function(_CommandBuffer) _then;

/// Create a copy of CommandBuffer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? frameId = null,Object? commands = null,}) {
  return _then(_CommandBuffer(
frameId: null == frameId ? _self.frameId : frameId // ignore: cast_nullable_to_non_nullable
as int,commands: null == commands ? _self._commands : commands // ignore: cast_nullable_to_non_nullable
as List<RenderCommand>,
  ));
}


}

// dart format on
