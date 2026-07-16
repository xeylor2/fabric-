// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rendered_frame.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RenderedFrame {

/// The deterministic frame id (mirrors `CommandBuffer.frameId`).
 int get frameId;/// The platform whose adapter produced this frame.
@JsonKey(fromJson: _platformFromJson, toJson: _platformToJson) RenderPlatform get platform;/// The target this frame rendered to.
@JsonKey(fromJson: _targetFromJson, toJson: _targetToJson) RenderTargetKind get target;/// Total commands executed.
 int get commandsExecuted;/// Draw commands executed (one per visible object).
 int get drawCount;/// Distinct resources bound during the frame.
 int get bindCount;/// Render-state changes applied.
 int get stateChanges;/// Whether the frame reached composite.
 bool get composited;/// Whether the frame was presented to a surface.
 bool get presented;/// The executed command kinds, in order (wire names) — the deterministic
/// fingerprint that must match across platforms.
 List<String> get commandOrder;
/// Create a copy of RenderedFrame
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RenderedFrameCopyWith<RenderedFrame> get copyWith => _$RenderedFrameCopyWithImpl<RenderedFrame>(this as RenderedFrame, _$identity);

  /// Serializes this RenderedFrame to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RenderedFrame&&(identical(other.frameId, frameId) || other.frameId == frameId)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.target, target) || other.target == target)&&(identical(other.commandsExecuted, commandsExecuted) || other.commandsExecuted == commandsExecuted)&&(identical(other.drawCount, drawCount) || other.drawCount == drawCount)&&(identical(other.bindCount, bindCount) || other.bindCount == bindCount)&&(identical(other.stateChanges, stateChanges) || other.stateChanges == stateChanges)&&(identical(other.composited, composited) || other.composited == composited)&&(identical(other.presented, presented) || other.presented == presented)&&const DeepCollectionEquality().equals(other.commandOrder, commandOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,frameId,platform,target,commandsExecuted,drawCount,bindCount,stateChanges,composited,presented,const DeepCollectionEquality().hash(commandOrder));

@override
String toString() {
  return 'RenderedFrame(frameId: $frameId, platform: $platform, target: $target, commandsExecuted: $commandsExecuted, drawCount: $drawCount, bindCount: $bindCount, stateChanges: $stateChanges, composited: $composited, presented: $presented, commandOrder: $commandOrder)';
}


}

/// @nodoc
abstract mixin class $RenderedFrameCopyWith<$Res>  {
  factory $RenderedFrameCopyWith(RenderedFrame value, $Res Function(RenderedFrame) _then) = _$RenderedFrameCopyWithImpl;
@useResult
$Res call({
 int frameId,@JsonKey(fromJson: _platformFromJson, toJson: _platformToJson) RenderPlatform platform,@JsonKey(fromJson: _targetFromJson, toJson: _targetToJson) RenderTargetKind target, int commandsExecuted, int drawCount, int bindCount, int stateChanges, bool composited, bool presented, List<String> commandOrder
});




}
/// @nodoc
class _$RenderedFrameCopyWithImpl<$Res>
    implements $RenderedFrameCopyWith<$Res> {
  _$RenderedFrameCopyWithImpl(this._self, this._then);

  final RenderedFrame _self;
  final $Res Function(RenderedFrame) _then;

/// Create a copy of RenderedFrame
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? frameId = null,Object? platform = null,Object? target = null,Object? commandsExecuted = null,Object? drawCount = null,Object? bindCount = null,Object? stateChanges = null,Object? composited = null,Object? presented = null,Object? commandOrder = null,}) {
  return _then(_self.copyWith(
frameId: null == frameId ? _self.frameId : frameId // ignore: cast_nullable_to_non_nullable
as int,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as RenderPlatform,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as RenderTargetKind,commandsExecuted: null == commandsExecuted ? _self.commandsExecuted : commandsExecuted // ignore: cast_nullable_to_non_nullable
as int,drawCount: null == drawCount ? _self.drawCount : drawCount // ignore: cast_nullable_to_non_nullable
as int,bindCount: null == bindCount ? _self.bindCount : bindCount // ignore: cast_nullable_to_non_nullable
as int,stateChanges: null == stateChanges ? _self.stateChanges : stateChanges // ignore: cast_nullable_to_non_nullable
as int,composited: null == composited ? _self.composited : composited // ignore: cast_nullable_to_non_nullable
as bool,presented: null == presented ? _self.presented : presented // ignore: cast_nullable_to_non_nullable
as bool,commandOrder: null == commandOrder ? _self.commandOrder : commandOrder // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [RenderedFrame].
extension RenderedFramePatterns on RenderedFrame {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RenderedFrame value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RenderedFrame() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RenderedFrame value)  $default,){
final _that = this;
switch (_that) {
case _RenderedFrame():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RenderedFrame value)?  $default,){
final _that = this;
switch (_that) {
case _RenderedFrame() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int frameId, @JsonKey(fromJson: _platformFromJson, toJson: _platformToJson)  RenderPlatform platform, @JsonKey(fromJson: _targetFromJson, toJson: _targetToJson)  RenderTargetKind target,  int commandsExecuted,  int drawCount,  int bindCount,  int stateChanges,  bool composited,  bool presented,  List<String> commandOrder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RenderedFrame() when $default != null:
return $default(_that.frameId,_that.platform,_that.target,_that.commandsExecuted,_that.drawCount,_that.bindCount,_that.stateChanges,_that.composited,_that.presented,_that.commandOrder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int frameId, @JsonKey(fromJson: _platformFromJson, toJson: _platformToJson)  RenderPlatform platform, @JsonKey(fromJson: _targetFromJson, toJson: _targetToJson)  RenderTargetKind target,  int commandsExecuted,  int drawCount,  int bindCount,  int stateChanges,  bool composited,  bool presented,  List<String> commandOrder)  $default,) {final _that = this;
switch (_that) {
case _RenderedFrame():
return $default(_that.frameId,_that.platform,_that.target,_that.commandsExecuted,_that.drawCount,_that.bindCount,_that.stateChanges,_that.composited,_that.presented,_that.commandOrder);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int frameId, @JsonKey(fromJson: _platformFromJson, toJson: _platformToJson)  RenderPlatform platform, @JsonKey(fromJson: _targetFromJson, toJson: _targetToJson)  RenderTargetKind target,  int commandsExecuted,  int drawCount,  int bindCount,  int stateChanges,  bool composited,  bool presented,  List<String> commandOrder)?  $default,) {final _that = this;
switch (_that) {
case _RenderedFrame() when $default != null:
return $default(_that.frameId,_that.platform,_that.target,_that.commandsExecuted,_that.drawCount,_that.bindCount,_that.stateChanges,_that.composited,_that.presented,_that.commandOrder);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RenderedFrame extends RenderedFrame {
  const _RenderedFrame({required this.frameId, @JsonKey(fromJson: _platformFromJson, toJson: _platformToJson) required this.platform, @JsonKey(fromJson: _targetFromJson, toJson: _targetToJson) required this.target, this.commandsExecuted = 0, this.drawCount = 0, this.bindCount = 0, this.stateChanges = 0, this.composited = false, this.presented = false, final  List<String> commandOrder = const <String>[]}): _commandOrder = commandOrder,super._();
  factory _RenderedFrame.fromJson(Map<String, dynamic> json) => _$RenderedFrameFromJson(json);

/// The deterministic frame id (mirrors `CommandBuffer.frameId`).
@override final  int frameId;
/// The platform whose adapter produced this frame.
@override@JsonKey(fromJson: _platformFromJson, toJson: _platformToJson) final  RenderPlatform platform;
/// The target this frame rendered to.
@override@JsonKey(fromJson: _targetFromJson, toJson: _targetToJson) final  RenderTargetKind target;
/// Total commands executed.
@override@JsonKey() final  int commandsExecuted;
/// Draw commands executed (one per visible object).
@override@JsonKey() final  int drawCount;
/// Distinct resources bound during the frame.
@override@JsonKey() final  int bindCount;
/// Render-state changes applied.
@override@JsonKey() final  int stateChanges;
/// Whether the frame reached composite.
@override@JsonKey() final  bool composited;
/// Whether the frame was presented to a surface.
@override@JsonKey() final  bool presented;
/// The executed command kinds, in order (wire names) — the deterministic
/// fingerprint that must match across platforms.
 final  List<String> _commandOrder;
/// The executed command kinds, in order (wire names) — the deterministic
/// fingerprint that must match across platforms.
@override@JsonKey() List<String> get commandOrder {
  if (_commandOrder is EqualUnmodifiableListView) return _commandOrder;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_commandOrder);
}


/// Create a copy of RenderedFrame
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RenderedFrameCopyWith<_RenderedFrame> get copyWith => __$RenderedFrameCopyWithImpl<_RenderedFrame>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RenderedFrameToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RenderedFrame&&(identical(other.frameId, frameId) || other.frameId == frameId)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.target, target) || other.target == target)&&(identical(other.commandsExecuted, commandsExecuted) || other.commandsExecuted == commandsExecuted)&&(identical(other.drawCount, drawCount) || other.drawCount == drawCount)&&(identical(other.bindCount, bindCount) || other.bindCount == bindCount)&&(identical(other.stateChanges, stateChanges) || other.stateChanges == stateChanges)&&(identical(other.composited, composited) || other.composited == composited)&&(identical(other.presented, presented) || other.presented == presented)&&const DeepCollectionEquality().equals(other._commandOrder, _commandOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,frameId,platform,target,commandsExecuted,drawCount,bindCount,stateChanges,composited,presented,const DeepCollectionEquality().hash(_commandOrder));

@override
String toString() {
  return 'RenderedFrame(frameId: $frameId, platform: $platform, target: $target, commandsExecuted: $commandsExecuted, drawCount: $drawCount, bindCount: $bindCount, stateChanges: $stateChanges, composited: $composited, presented: $presented, commandOrder: $commandOrder)';
}


}

/// @nodoc
abstract mixin class _$RenderedFrameCopyWith<$Res> implements $RenderedFrameCopyWith<$Res> {
  factory _$RenderedFrameCopyWith(_RenderedFrame value, $Res Function(_RenderedFrame) _then) = __$RenderedFrameCopyWithImpl;
@override @useResult
$Res call({
 int frameId,@JsonKey(fromJson: _platformFromJson, toJson: _platformToJson) RenderPlatform platform,@JsonKey(fromJson: _targetFromJson, toJson: _targetToJson) RenderTargetKind target, int commandsExecuted, int drawCount, int bindCount, int stateChanges, bool composited, bool presented, List<String> commandOrder
});




}
/// @nodoc
class __$RenderedFrameCopyWithImpl<$Res>
    implements _$RenderedFrameCopyWith<$Res> {
  __$RenderedFrameCopyWithImpl(this._self, this._then);

  final _RenderedFrame _self;
  final $Res Function(_RenderedFrame) _then;

/// Create a copy of RenderedFrame
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? frameId = null,Object? platform = null,Object? target = null,Object? commandsExecuted = null,Object? drawCount = null,Object? bindCount = null,Object? stateChanges = null,Object? composited = null,Object? presented = null,Object? commandOrder = null,}) {
  return _then(_RenderedFrame(
frameId: null == frameId ? _self.frameId : frameId // ignore: cast_nullable_to_non_nullable
as int,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as RenderPlatform,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as RenderTargetKind,commandsExecuted: null == commandsExecuted ? _self.commandsExecuted : commandsExecuted // ignore: cast_nullable_to_non_nullable
as int,drawCount: null == drawCount ? _self.drawCount : drawCount // ignore: cast_nullable_to_non_nullable
as int,bindCount: null == bindCount ? _self.bindCount : bindCount // ignore: cast_nullable_to_non_nullable
as int,stateChanges: null == stateChanges ? _self.stateChanges : stateChanges // ignore: cast_nullable_to_non_nullable
as int,composited: null == composited ? _self.composited : composited // ignore: cast_nullable_to_non_nullable
as bool,presented: null == presented ? _self.presented : presented // ignore: cast_nullable_to_non_nullable
as bool,commandOrder: null == commandOrder ? _self._commandOrder : commandOrder // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
