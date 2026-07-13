// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'backend_capabilities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BackendCapabilities {

/// Feature flags the backend supports.
@JsonKey(fromJson: _featuresFromJson, toJson: _featuresToJson) Set<BackendCapabilityKind> get features;/// Blend modes implemented natively (subset of the frozen 16).
@JsonKey(fromJson: _blendsFromJson, toJson: _blendsToJson) Set<FebricBlendMode> get blendModes;/// Declared determinism level of this backend.
@JsonKey(fromJson: _levelFromJson, toJson: _levelToJson) RenderDeterminismLevel get determinism; int get maxTextureSize; int get maxTileSize; int get maxTexturesInFlight; int get maxDrawCallsPerFrame;
/// Create a copy of BackendCapabilities
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BackendCapabilitiesCopyWith<BackendCapabilities> get copyWith => _$BackendCapabilitiesCopyWithImpl<BackendCapabilities>(this as BackendCapabilities, _$identity);

  /// Serializes this BackendCapabilities to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BackendCapabilities&&const DeepCollectionEquality().equals(other.features, features)&&const DeepCollectionEquality().equals(other.blendModes, blendModes)&&(identical(other.determinism, determinism) || other.determinism == determinism)&&(identical(other.maxTextureSize, maxTextureSize) || other.maxTextureSize == maxTextureSize)&&(identical(other.maxTileSize, maxTileSize) || other.maxTileSize == maxTileSize)&&(identical(other.maxTexturesInFlight, maxTexturesInFlight) || other.maxTexturesInFlight == maxTexturesInFlight)&&(identical(other.maxDrawCallsPerFrame, maxDrawCallsPerFrame) || other.maxDrawCallsPerFrame == maxDrawCallsPerFrame));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(features),const DeepCollectionEquality().hash(blendModes),determinism,maxTextureSize,maxTileSize,maxTexturesInFlight,maxDrawCallsPerFrame);

@override
String toString() {
  return 'BackendCapabilities(features: $features, blendModes: $blendModes, determinism: $determinism, maxTextureSize: $maxTextureSize, maxTileSize: $maxTileSize, maxTexturesInFlight: $maxTexturesInFlight, maxDrawCallsPerFrame: $maxDrawCallsPerFrame)';
}


}

/// @nodoc
abstract mixin class $BackendCapabilitiesCopyWith<$Res>  {
  factory $BackendCapabilitiesCopyWith(BackendCapabilities value, $Res Function(BackendCapabilities) _then) = _$BackendCapabilitiesCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _featuresFromJson, toJson: _featuresToJson) Set<BackendCapabilityKind> features,@JsonKey(fromJson: _blendsFromJson, toJson: _blendsToJson) Set<FebricBlendMode> blendModes,@JsonKey(fromJson: _levelFromJson, toJson: _levelToJson) RenderDeterminismLevel determinism, int maxTextureSize, int maxTileSize, int maxTexturesInFlight, int maxDrawCallsPerFrame
});




}
/// @nodoc
class _$BackendCapabilitiesCopyWithImpl<$Res>
    implements $BackendCapabilitiesCopyWith<$Res> {
  _$BackendCapabilitiesCopyWithImpl(this._self, this._then);

  final BackendCapabilities _self;
  final $Res Function(BackendCapabilities) _then;

/// Create a copy of BackendCapabilities
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? features = null,Object? blendModes = null,Object? determinism = null,Object? maxTextureSize = null,Object? maxTileSize = null,Object? maxTexturesInFlight = null,Object? maxDrawCallsPerFrame = null,}) {
  return _then(_self.copyWith(
features: null == features ? _self.features : features // ignore: cast_nullable_to_non_nullable
as Set<BackendCapabilityKind>,blendModes: null == blendModes ? _self.blendModes : blendModes // ignore: cast_nullable_to_non_nullable
as Set<FebricBlendMode>,determinism: null == determinism ? _self.determinism : determinism // ignore: cast_nullable_to_non_nullable
as RenderDeterminismLevel,maxTextureSize: null == maxTextureSize ? _self.maxTextureSize : maxTextureSize // ignore: cast_nullable_to_non_nullable
as int,maxTileSize: null == maxTileSize ? _self.maxTileSize : maxTileSize // ignore: cast_nullable_to_non_nullable
as int,maxTexturesInFlight: null == maxTexturesInFlight ? _self.maxTexturesInFlight : maxTexturesInFlight // ignore: cast_nullable_to_non_nullable
as int,maxDrawCallsPerFrame: null == maxDrawCallsPerFrame ? _self.maxDrawCallsPerFrame : maxDrawCallsPerFrame // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BackendCapabilities].
extension BackendCapabilitiesPatterns on BackendCapabilities {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BackendCapabilities value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BackendCapabilities() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BackendCapabilities value)  $default,){
final _that = this;
switch (_that) {
case _BackendCapabilities():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BackendCapabilities value)?  $default,){
final _that = this;
switch (_that) {
case _BackendCapabilities() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _featuresFromJson, toJson: _featuresToJson)  Set<BackendCapabilityKind> features, @JsonKey(fromJson: _blendsFromJson, toJson: _blendsToJson)  Set<FebricBlendMode> blendModes, @JsonKey(fromJson: _levelFromJson, toJson: _levelToJson)  RenderDeterminismLevel determinism,  int maxTextureSize,  int maxTileSize,  int maxTexturesInFlight,  int maxDrawCallsPerFrame)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BackendCapabilities() when $default != null:
return $default(_that.features,_that.blendModes,_that.determinism,_that.maxTextureSize,_that.maxTileSize,_that.maxTexturesInFlight,_that.maxDrawCallsPerFrame);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _featuresFromJson, toJson: _featuresToJson)  Set<BackendCapabilityKind> features, @JsonKey(fromJson: _blendsFromJson, toJson: _blendsToJson)  Set<FebricBlendMode> blendModes, @JsonKey(fromJson: _levelFromJson, toJson: _levelToJson)  RenderDeterminismLevel determinism,  int maxTextureSize,  int maxTileSize,  int maxTexturesInFlight,  int maxDrawCallsPerFrame)  $default,) {final _that = this;
switch (_that) {
case _BackendCapabilities():
return $default(_that.features,_that.blendModes,_that.determinism,_that.maxTextureSize,_that.maxTileSize,_that.maxTexturesInFlight,_that.maxDrawCallsPerFrame);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _featuresFromJson, toJson: _featuresToJson)  Set<BackendCapabilityKind> features, @JsonKey(fromJson: _blendsFromJson, toJson: _blendsToJson)  Set<FebricBlendMode> blendModes, @JsonKey(fromJson: _levelFromJson, toJson: _levelToJson)  RenderDeterminismLevel determinism,  int maxTextureSize,  int maxTileSize,  int maxTexturesInFlight,  int maxDrawCallsPerFrame)?  $default,) {final _that = this;
switch (_that) {
case _BackendCapabilities() when $default != null:
return $default(_that.features,_that.blendModes,_that.determinism,_that.maxTextureSize,_that.maxTileSize,_that.maxTexturesInFlight,_that.maxDrawCallsPerFrame);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BackendCapabilities extends BackendCapabilities {
  const _BackendCapabilities({@JsonKey(fromJson: _featuresFromJson, toJson: _featuresToJson) final  Set<BackendCapabilityKind> features = const <BackendCapabilityKind>{}, @JsonKey(fromJson: _blendsFromJson, toJson: _blendsToJson) final  Set<FebricBlendMode> blendModes = const <FebricBlendMode>{}, @JsonKey(fromJson: _levelFromJson, toJson: _levelToJson) this.determinism = RenderDeterminismLevel.backendExact, this.maxTextureSize = 4096, this.maxTileSize = 256, this.maxTexturesInFlight = 64, this.maxDrawCallsPerFrame = 0}): _features = features,_blendModes = blendModes,super._();
  factory _BackendCapabilities.fromJson(Map<String, dynamic> json) => _$BackendCapabilitiesFromJson(json);

/// Feature flags the backend supports.
 final  Set<BackendCapabilityKind> _features;
/// Feature flags the backend supports.
@override@JsonKey(fromJson: _featuresFromJson, toJson: _featuresToJson) Set<BackendCapabilityKind> get features {
  if (_features is EqualUnmodifiableSetView) return _features;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_features);
}

/// Blend modes implemented natively (subset of the frozen 16).
 final  Set<FebricBlendMode> _blendModes;
/// Blend modes implemented natively (subset of the frozen 16).
@override@JsonKey(fromJson: _blendsFromJson, toJson: _blendsToJson) Set<FebricBlendMode> get blendModes {
  if (_blendModes is EqualUnmodifiableSetView) return _blendModes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_blendModes);
}

/// Declared determinism level of this backend.
@override@JsonKey(fromJson: _levelFromJson, toJson: _levelToJson) final  RenderDeterminismLevel determinism;
@override@JsonKey() final  int maxTextureSize;
@override@JsonKey() final  int maxTileSize;
@override@JsonKey() final  int maxTexturesInFlight;
@override@JsonKey() final  int maxDrawCallsPerFrame;

/// Create a copy of BackendCapabilities
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BackendCapabilitiesCopyWith<_BackendCapabilities> get copyWith => __$BackendCapabilitiesCopyWithImpl<_BackendCapabilities>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BackendCapabilitiesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BackendCapabilities&&const DeepCollectionEquality().equals(other._features, _features)&&const DeepCollectionEquality().equals(other._blendModes, _blendModes)&&(identical(other.determinism, determinism) || other.determinism == determinism)&&(identical(other.maxTextureSize, maxTextureSize) || other.maxTextureSize == maxTextureSize)&&(identical(other.maxTileSize, maxTileSize) || other.maxTileSize == maxTileSize)&&(identical(other.maxTexturesInFlight, maxTexturesInFlight) || other.maxTexturesInFlight == maxTexturesInFlight)&&(identical(other.maxDrawCallsPerFrame, maxDrawCallsPerFrame) || other.maxDrawCallsPerFrame == maxDrawCallsPerFrame));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_features),const DeepCollectionEquality().hash(_blendModes),determinism,maxTextureSize,maxTileSize,maxTexturesInFlight,maxDrawCallsPerFrame);

@override
String toString() {
  return 'BackendCapabilities(features: $features, blendModes: $blendModes, determinism: $determinism, maxTextureSize: $maxTextureSize, maxTileSize: $maxTileSize, maxTexturesInFlight: $maxTexturesInFlight, maxDrawCallsPerFrame: $maxDrawCallsPerFrame)';
}


}

/// @nodoc
abstract mixin class _$BackendCapabilitiesCopyWith<$Res> implements $BackendCapabilitiesCopyWith<$Res> {
  factory _$BackendCapabilitiesCopyWith(_BackendCapabilities value, $Res Function(_BackendCapabilities) _then) = __$BackendCapabilitiesCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _featuresFromJson, toJson: _featuresToJson) Set<BackendCapabilityKind> features,@JsonKey(fromJson: _blendsFromJson, toJson: _blendsToJson) Set<FebricBlendMode> blendModes,@JsonKey(fromJson: _levelFromJson, toJson: _levelToJson) RenderDeterminismLevel determinism, int maxTextureSize, int maxTileSize, int maxTexturesInFlight, int maxDrawCallsPerFrame
});




}
/// @nodoc
class __$BackendCapabilitiesCopyWithImpl<$Res>
    implements _$BackendCapabilitiesCopyWith<$Res> {
  __$BackendCapabilitiesCopyWithImpl(this._self, this._then);

  final _BackendCapabilities _self;
  final $Res Function(_BackendCapabilities) _then;

/// Create a copy of BackendCapabilities
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? features = null,Object? blendModes = null,Object? determinism = null,Object? maxTextureSize = null,Object? maxTileSize = null,Object? maxTexturesInFlight = null,Object? maxDrawCallsPerFrame = null,}) {
  return _then(_BackendCapabilities(
features: null == features ? _self._features : features // ignore: cast_nullable_to_non_nullable
as Set<BackendCapabilityKind>,blendModes: null == blendModes ? _self._blendModes : blendModes // ignore: cast_nullable_to_non_nullable
as Set<FebricBlendMode>,determinism: null == determinism ? _self.determinism : determinism // ignore: cast_nullable_to_non_nullable
as RenderDeterminismLevel,maxTextureSize: null == maxTextureSize ? _self.maxTextureSize : maxTextureSize // ignore: cast_nullable_to_non_nullable
as int,maxTileSize: null == maxTileSize ? _self.maxTileSize : maxTileSize // ignore: cast_nullable_to_non_nullable
as int,maxTexturesInFlight: null == maxTexturesInFlight ? _self.maxTexturesInFlight : maxTexturesInFlight // ignore: cast_nullable_to_non_nullable
as int,maxDrawCallsPerFrame: null == maxDrawCallsPerFrame ? _self.maxDrawCallsPerFrame : maxDrawCallsPerFrame // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
