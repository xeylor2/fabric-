// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'render_command.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RenderCommand {

@JsonKey(fromJson: _kindFromJson, toJson: _kindToJson) RenderCommandKind get kind;/// Draw: the render object's id (a reference — never owned data, R2).
 String? get objectId;/// Bind: the logical resource key (content-addressed).
 String? get resourceKey;/// Set-state: the blend mode wire name (frozen `FebricBlendMode`).
 String? get blend;/// Set-state: opacity in [0,1].
 double? get opacity;/// Begin-pass: the pass kind wire name (frozen `RenderPassKind`).
 String? get passKind;/// Begin-target: the target kind wire name (frozen `RenderTargetKind`).
 String? get targetKind;/// Begin-frame: the deterministic frame id.
 int? get frameId;
/// Create a copy of RenderCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RenderCommandCopyWith<RenderCommand> get copyWith => _$RenderCommandCopyWithImpl<RenderCommand>(this as RenderCommand, _$identity);

  /// Serializes this RenderCommand to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RenderCommand&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.objectId, objectId) || other.objectId == objectId)&&(identical(other.resourceKey, resourceKey) || other.resourceKey == resourceKey)&&(identical(other.blend, blend) || other.blend == blend)&&(identical(other.opacity, opacity) || other.opacity == opacity)&&(identical(other.passKind, passKind) || other.passKind == passKind)&&(identical(other.targetKind, targetKind) || other.targetKind == targetKind)&&(identical(other.frameId, frameId) || other.frameId == frameId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,objectId,resourceKey,blend,opacity,passKind,targetKind,frameId);

@override
String toString() {
  return 'RenderCommand(kind: $kind, objectId: $objectId, resourceKey: $resourceKey, blend: $blend, opacity: $opacity, passKind: $passKind, targetKind: $targetKind, frameId: $frameId)';
}


}

/// @nodoc
abstract mixin class $RenderCommandCopyWith<$Res>  {
  factory $RenderCommandCopyWith(RenderCommand value, $Res Function(RenderCommand) _then) = _$RenderCommandCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _kindFromJson, toJson: _kindToJson) RenderCommandKind kind, String? objectId, String? resourceKey, String? blend, double? opacity, String? passKind, String? targetKind, int? frameId
});




}
/// @nodoc
class _$RenderCommandCopyWithImpl<$Res>
    implements $RenderCommandCopyWith<$Res> {
  _$RenderCommandCopyWithImpl(this._self, this._then);

  final RenderCommand _self;
  final $Res Function(RenderCommand) _then;

/// Create a copy of RenderCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? objectId = freezed,Object? resourceKey = freezed,Object? blend = freezed,Object? opacity = freezed,Object? passKind = freezed,Object? targetKind = freezed,Object? frameId = freezed,}) {
  return _then(_self.copyWith(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as RenderCommandKind,objectId: freezed == objectId ? _self.objectId : objectId // ignore: cast_nullable_to_non_nullable
as String?,resourceKey: freezed == resourceKey ? _self.resourceKey : resourceKey // ignore: cast_nullable_to_non_nullable
as String?,blend: freezed == blend ? _self.blend : blend // ignore: cast_nullable_to_non_nullable
as String?,opacity: freezed == opacity ? _self.opacity : opacity // ignore: cast_nullable_to_non_nullable
as double?,passKind: freezed == passKind ? _self.passKind : passKind // ignore: cast_nullable_to_non_nullable
as String?,targetKind: freezed == targetKind ? _self.targetKind : targetKind // ignore: cast_nullable_to_non_nullable
as String?,frameId: freezed == frameId ? _self.frameId : frameId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [RenderCommand].
extension RenderCommandPatterns on RenderCommand {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RenderCommand value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RenderCommand() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RenderCommand value)  $default,){
final _that = this;
switch (_that) {
case _RenderCommand():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RenderCommand value)?  $default,){
final _that = this;
switch (_that) {
case _RenderCommand() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _kindFromJson, toJson: _kindToJson)  RenderCommandKind kind,  String? objectId,  String? resourceKey,  String? blend,  double? opacity,  String? passKind,  String? targetKind,  int? frameId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RenderCommand() when $default != null:
return $default(_that.kind,_that.objectId,_that.resourceKey,_that.blend,_that.opacity,_that.passKind,_that.targetKind,_that.frameId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _kindFromJson, toJson: _kindToJson)  RenderCommandKind kind,  String? objectId,  String? resourceKey,  String? blend,  double? opacity,  String? passKind,  String? targetKind,  int? frameId)  $default,) {final _that = this;
switch (_that) {
case _RenderCommand():
return $default(_that.kind,_that.objectId,_that.resourceKey,_that.blend,_that.opacity,_that.passKind,_that.targetKind,_that.frameId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _kindFromJson, toJson: _kindToJson)  RenderCommandKind kind,  String? objectId,  String? resourceKey,  String? blend,  double? opacity,  String? passKind,  String? targetKind,  int? frameId)?  $default,) {final _that = this;
switch (_that) {
case _RenderCommand() when $default != null:
return $default(_that.kind,_that.objectId,_that.resourceKey,_that.blend,_that.opacity,_that.passKind,_that.targetKind,_that.frameId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RenderCommand implements RenderCommand {
  const _RenderCommand({@JsonKey(fromJson: _kindFromJson, toJson: _kindToJson) required this.kind, this.objectId, this.resourceKey, this.blend, this.opacity, this.passKind, this.targetKind, this.frameId});
  factory _RenderCommand.fromJson(Map<String, dynamic> json) => _$RenderCommandFromJson(json);

@override@JsonKey(fromJson: _kindFromJson, toJson: _kindToJson) final  RenderCommandKind kind;
/// Draw: the render object's id (a reference — never owned data, R2).
@override final  String? objectId;
/// Bind: the logical resource key (content-addressed).
@override final  String? resourceKey;
/// Set-state: the blend mode wire name (frozen `FebricBlendMode`).
@override final  String? blend;
/// Set-state: opacity in [0,1].
@override final  double? opacity;
/// Begin-pass: the pass kind wire name (frozen `RenderPassKind`).
@override final  String? passKind;
/// Begin-target: the target kind wire name (frozen `RenderTargetKind`).
@override final  String? targetKind;
/// Begin-frame: the deterministic frame id.
@override final  int? frameId;

/// Create a copy of RenderCommand
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RenderCommandCopyWith<_RenderCommand> get copyWith => __$RenderCommandCopyWithImpl<_RenderCommand>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RenderCommandToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RenderCommand&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.objectId, objectId) || other.objectId == objectId)&&(identical(other.resourceKey, resourceKey) || other.resourceKey == resourceKey)&&(identical(other.blend, blend) || other.blend == blend)&&(identical(other.opacity, opacity) || other.opacity == opacity)&&(identical(other.passKind, passKind) || other.passKind == passKind)&&(identical(other.targetKind, targetKind) || other.targetKind == targetKind)&&(identical(other.frameId, frameId) || other.frameId == frameId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,objectId,resourceKey,blend,opacity,passKind,targetKind,frameId);

@override
String toString() {
  return 'RenderCommand(kind: $kind, objectId: $objectId, resourceKey: $resourceKey, blend: $blend, opacity: $opacity, passKind: $passKind, targetKind: $targetKind, frameId: $frameId)';
}


}

/// @nodoc
abstract mixin class _$RenderCommandCopyWith<$Res> implements $RenderCommandCopyWith<$Res> {
  factory _$RenderCommandCopyWith(_RenderCommand value, $Res Function(_RenderCommand) _then) = __$RenderCommandCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _kindFromJson, toJson: _kindToJson) RenderCommandKind kind, String? objectId, String? resourceKey, String? blend, double? opacity, String? passKind, String? targetKind, int? frameId
});




}
/// @nodoc
class __$RenderCommandCopyWithImpl<$Res>
    implements _$RenderCommandCopyWith<$Res> {
  __$RenderCommandCopyWithImpl(this._self, this._then);

  final _RenderCommand _self;
  final $Res Function(_RenderCommand) _then;

/// Create a copy of RenderCommand
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? objectId = freezed,Object? resourceKey = freezed,Object? blend = freezed,Object? opacity = freezed,Object? passKind = freezed,Object? targetKind = freezed,Object? frameId = freezed,}) {
  return _then(_RenderCommand(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as RenderCommandKind,objectId: freezed == objectId ? _self.objectId : objectId // ignore: cast_nullable_to_non_nullable
as String?,resourceKey: freezed == resourceKey ? _self.resourceKey : resourceKey // ignore: cast_nullable_to_non_nullable
as String?,blend: freezed == blend ? _self.blend : blend // ignore: cast_nullable_to_non_nullable
as String?,opacity: freezed == opacity ? _self.opacity : opacity // ignore: cast_nullable_to_non_nullable
as double?,passKind: freezed == passKind ? _self.passKind : passKind // ignore: cast_nullable_to_non_nullable
as String?,targetKind: freezed == targetKind ? _self.targetKind : targetKind // ignore: cast_nullable_to_non_nullable
as String?,frameId: freezed == frameId ? _self.frameId : frameId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$RenderStateSnapshot {

/// Blend mode wire name (frozen `FebricBlendMode`).
 String get blend; double get opacity;
/// Create a copy of RenderStateSnapshot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RenderStateSnapshotCopyWith<RenderStateSnapshot> get copyWith => _$RenderStateSnapshotCopyWithImpl<RenderStateSnapshot>(this as RenderStateSnapshot, _$identity);

  /// Serializes this RenderStateSnapshot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RenderStateSnapshot&&(identical(other.blend, blend) || other.blend == blend)&&(identical(other.opacity, opacity) || other.opacity == opacity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,blend,opacity);

@override
String toString() {
  return 'RenderStateSnapshot(blend: $blend, opacity: $opacity)';
}


}

/// @nodoc
abstract mixin class $RenderStateSnapshotCopyWith<$Res>  {
  factory $RenderStateSnapshotCopyWith(RenderStateSnapshot value, $Res Function(RenderStateSnapshot) _then) = _$RenderStateSnapshotCopyWithImpl;
@useResult
$Res call({
 String blend, double opacity
});




}
/// @nodoc
class _$RenderStateSnapshotCopyWithImpl<$Res>
    implements $RenderStateSnapshotCopyWith<$Res> {
  _$RenderStateSnapshotCopyWithImpl(this._self, this._then);

  final RenderStateSnapshot _self;
  final $Res Function(RenderStateSnapshot) _then;

/// Create a copy of RenderStateSnapshot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? blend = null,Object? opacity = null,}) {
  return _then(_self.copyWith(
blend: null == blend ? _self.blend : blend // ignore: cast_nullable_to_non_nullable
as String,opacity: null == opacity ? _self.opacity : opacity // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [RenderStateSnapshot].
extension RenderStateSnapshotPatterns on RenderStateSnapshot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RenderStateSnapshot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RenderStateSnapshot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RenderStateSnapshot value)  $default,){
final _that = this;
switch (_that) {
case _RenderStateSnapshot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RenderStateSnapshot value)?  $default,){
final _that = this;
switch (_that) {
case _RenderStateSnapshot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String blend,  double opacity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RenderStateSnapshot() when $default != null:
return $default(_that.blend,_that.opacity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String blend,  double opacity)  $default,) {final _that = this;
switch (_that) {
case _RenderStateSnapshot():
return $default(_that.blend,_that.opacity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String blend,  double opacity)?  $default,) {final _that = this;
switch (_that) {
case _RenderStateSnapshot() when $default != null:
return $default(_that.blend,_that.opacity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RenderStateSnapshot extends RenderStateSnapshot {
  const _RenderStateSnapshot({this.blend = 'normal', this.opacity = 1.0}): super._();
  factory _RenderStateSnapshot.fromJson(Map<String, dynamic> json) => _$RenderStateSnapshotFromJson(json);

/// Blend mode wire name (frozen `FebricBlendMode`).
@override@JsonKey() final  String blend;
@override@JsonKey() final  double opacity;

/// Create a copy of RenderStateSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RenderStateSnapshotCopyWith<_RenderStateSnapshot> get copyWith => __$RenderStateSnapshotCopyWithImpl<_RenderStateSnapshot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RenderStateSnapshotToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RenderStateSnapshot&&(identical(other.blend, blend) || other.blend == blend)&&(identical(other.opacity, opacity) || other.opacity == opacity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,blend,opacity);

@override
String toString() {
  return 'RenderStateSnapshot(blend: $blend, opacity: $opacity)';
}


}

/// @nodoc
abstract mixin class _$RenderStateSnapshotCopyWith<$Res> implements $RenderStateSnapshotCopyWith<$Res> {
  factory _$RenderStateSnapshotCopyWith(_RenderStateSnapshot value, $Res Function(_RenderStateSnapshot) _then) = __$RenderStateSnapshotCopyWithImpl;
@override @useResult
$Res call({
 String blend, double opacity
});




}
/// @nodoc
class __$RenderStateSnapshotCopyWithImpl<$Res>
    implements _$RenderStateSnapshotCopyWith<$Res> {
  __$RenderStateSnapshotCopyWithImpl(this._self, this._then);

  final _RenderStateSnapshot _self;
  final $Res Function(_RenderStateSnapshot) _then;

/// Create a copy of RenderStateSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? blend = null,Object? opacity = null,}) {
  return _then(_RenderStateSnapshot(
blend: null == blend ? _self.blend : blend // ignore: cast_nullable_to_non_nullable
as String,opacity: null == opacity ? _self.opacity : opacity // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
