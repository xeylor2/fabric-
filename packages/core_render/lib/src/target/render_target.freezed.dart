// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'render_target.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RenderTarget {

@JsonKey(fromJson: _kindFromJson, toJson: _kindToJson) RenderTargetKind get kind;/// Physical-unit coordinate system + DPI of this target (frozen
/// `core_tooling` contract — never redefined).
 CanvasCoordinateSystem get coordinateSystem;/// Output colour space (frozen `core_asset` vocabulary; CMYK for print).
@JsonKey(fromJson: _colourFromJson, toJson: _colourToJson) AssetColourSpace get colourSpace;/// The passes this target renders, in the constitution's order.
@JsonKey(fromJson: _passesFromJson, toJson: _passesToJson) List<RenderPassKind> get passes;/// The frame budget profile for this target.
 FrameBudget get budget;/// Whether this target presents on-screen (false → offscreen: thumbnail,
/// export encoder).
 bool get onScreen;/// Whether full-resolution rendering is forced (no LOD reduction) — true
/// for Production Export.
 bool get fullResolution;
/// Create a copy of RenderTarget
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RenderTargetCopyWith<RenderTarget> get copyWith => _$RenderTargetCopyWithImpl<RenderTarget>(this as RenderTarget, _$identity);

  /// Serializes this RenderTarget to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RenderTarget&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.coordinateSystem, coordinateSystem) || other.coordinateSystem == coordinateSystem)&&(identical(other.colourSpace, colourSpace) || other.colourSpace == colourSpace)&&const DeepCollectionEquality().equals(other.passes, passes)&&(identical(other.budget, budget) || other.budget == budget)&&(identical(other.onScreen, onScreen) || other.onScreen == onScreen)&&(identical(other.fullResolution, fullResolution) || other.fullResolution == fullResolution));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,coordinateSystem,colourSpace,const DeepCollectionEquality().hash(passes),budget,onScreen,fullResolution);

@override
String toString() {
  return 'RenderTarget(kind: $kind, coordinateSystem: $coordinateSystem, colourSpace: $colourSpace, passes: $passes, budget: $budget, onScreen: $onScreen, fullResolution: $fullResolution)';
}


}

/// @nodoc
abstract mixin class $RenderTargetCopyWith<$Res>  {
  factory $RenderTargetCopyWith(RenderTarget value, $Res Function(RenderTarget) _then) = _$RenderTargetCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _kindFromJson, toJson: _kindToJson) RenderTargetKind kind, CanvasCoordinateSystem coordinateSystem,@JsonKey(fromJson: _colourFromJson, toJson: _colourToJson) AssetColourSpace colourSpace,@JsonKey(fromJson: _passesFromJson, toJson: _passesToJson) List<RenderPassKind> passes, FrameBudget budget, bool onScreen, bool fullResolution
});


$CanvasCoordinateSystemCopyWith<$Res> get coordinateSystem;$FrameBudgetCopyWith<$Res> get budget;

}
/// @nodoc
class _$RenderTargetCopyWithImpl<$Res>
    implements $RenderTargetCopyWith<$Res> {
  _$RenderTargetCopyWithImpl(this._self, this._then);

  final RenderTarget _self;
  final $Res Function(RenderTarget) _then;

/// Create a copy of RenderTarget
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? coordinateSystem = null,Object? colourSpace = null,Object? passes = null,Object? budget = null,Object? onScreen = null,Object? fullResolution = null,}) {
  return _then(_self.copyWith(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as RenderTargetKind,coordinateSystem: null == coordinateSystem ? _self.coordinateSystem : coordinateSystem // ignore: cast_nullable_to_non_nullable
as CanvasCoordinateSystem,colourSpace: null == colourSpace ? _self.colourSpace : colourSpace // ignore: cast_nullable_to_non_nullable
as AssetColourSpace,passes: null == passes ? _self.passes : passes // ignore: cast_nullable_to_non_nullable
as List<RenderPassKind>,budget: null == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as FrameBudget,onScreen: null == onScreen ? _self.onScreen : onScreen // ignore: cast_nullable_to_non_nullable
as bool,fullResolution: null == fullResolution ? _self.fullResolution : fullResolution // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of RenderTarget
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CanvasCoordinateSystemCopyWith<$Res> get coordinateSystem {
  
  return $CanvasCoordinateSystemCopyWith<$Res>(_self.coordinateSystem, (value) {
    return _then(_self.copyWith(coordinateSystem: value));
  });
}/// Create a copy of RenderTarget
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FrameBudgetCopyWith<$Res> get budget {
  
  return $FrameBudgetCopyWith<$Res>(_self.budget, (value) {
    return _then(_self.copyWith(budget: value));
  });
}
}


/// Adds pattern-matching-related methods to [RenderTarget].
extension RenderTargetPatterns on RenderTarget {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RenderTarget value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RenderTarget() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RenderTarget value)  $default,){
final _that = this;
switch (_that) {
case _RenderTarget():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RenderTarget value)?  $default,){
final _that = this;
switch (_that) {
case _RenderTarget() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _kindFromJson, toJson: _kindToJson)  RenderTargetKind kind,  CanvasCoordinateSystem coordinateSystem, @JsonKey(fromJson: _colourFromJson, toJson: _colourToJson)  AssetColourSpace colourSpace, @JsonKey(fromJson: _passesFromJson, toJson: _passesToJson)  List<RenderPassKind> passes,  FrameBudget budget,  bool onScreen,  bool fullResolution)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RenderTarget() when $default != null:
return $default(_that.kind,_that.coordinateSystem,_that.colourSpace,_that.passes,_that.budget,_that.onScreen,_that.fullResolution);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _kindFromJson, toJson: _kindToJson)  RenderTargetKind kind,  CanvasCoordinateSystem coordinateSystem, @JsonKey(fromJson: _colourFromJson, toJson: _colourToJson)  AssetColourSpace colourSpace, @JsonKey(fromJson: _passesFromJson, toJson: _passesToJson)  List<RenderPassKind> passes,  FrameBudget budget,  bool onScreen,  bool fullResolution)  $default,) {final _that = this;
switch (_that) {
case _RenderTarget():
return $default(_that.kind,_that.coordinateSystem,_that.colourSpace,_that.passes,_that.budget,_that.onScreen,_that.fullResolution);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _kindFromJson, toJson: _kindToJson)  RenderTargetKind kind,  CanvasCoordinateSystem coordinateSystem, @JsonKey(fromJson: _colourFromJson, toJson: _colourToJson)  AssetColourSpace colourSpace, @JsonKey(fromJson: _passesFromJson, toJson: _passesToJson)  List<RenderPassKind> passes,  FrameBudget budget,  bool onScreen,  bool fullResolution)?  $default,) {final _that = this;
switch (_that) {
case _RenderTarget() when $default != null:
return $default(_that.kind,_that.coordinateSystem,_that.colourSpace,_that.passes,_that.budget,_that.onScreen,_that.fullResolution);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RenderTarget extends RenderTarget {
  const _RenderTarget({@JsonKey(fromJson: _kindFromJson, toJson: _kindToJson) required this.kind, this.coordinateSystem = CanvasCoordinateSystem.standard, @JsonKey(fromJson: _colourFromJson, toJson: _colourToJson) this.colourSpace = AssetColourSpace.srgb, @JsonKey(fromJson: _passesFromJson, toJson: _passesToJson) final  List<RenderPassKind> passes = const <RenderPassKind>[], this.budget = FrameBudget.interactive, this.onScreen = true, this.fullResolution = false}): _passes = passes,super._();
  factory _RenderTarget.fromJson(Map<String, dynamic> json) => _$RenderTargetFromJson(json);

@override@JsonKey(fromJson: _kindFromJson, toJson: _kindToJson) final  RenderTargetKind kind;
/// Physical-unit coordinate system + DPI of this target (frozen
/// `core_tooling` contract — never redefined).
@override@JsonKey() final  CanvasCoordinateSystem coordinateSystem;
/// Output colour space (frozen `core_asset` vocabulary; CMYK for print).
@override@JsonKey(fromJson: _colourFromJson, toJson: _colourToJson) final  AssetColourSpace colourSpace;
/// The passes this target renders, in the constitution's order.
 final  List<RenderPassKind> _passes;
/// The passes this target renders, in the constitution's order.
@override@JsonKey(fromJson: _passesFromJson, toJson: _passesToJson) List<RenderPassKind> get passes {
  if (_passes is EqualUnmodifiableListView) return _passes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_passes);
}

/// The frame budget profile for this target.
@override@JsonKey() final  FrameBudget budget;
/// Whether this target presents on-screen (false → offscreen: thumbnail,
/// export encoder).
@override@JsonKey() final  bool onScreen;
/// Whether full-resolution rendering is forced (no LOD reduction) — true
/// for Production Export.
@override@JsonKey() final  bool fullResolution;

/// Create a copy of RenderTarget
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RenderTargetCopyWith<_RenderTarget> get copyWith => __$RenderTargetCopyWithImpl<_RenderTarget>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RenderTargetToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RenderTarget&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.coordinateSystem, coordinateSystem) || other.coordinateSystem == coordinateSystem)&&(identical(other.colourSpace, colourSpace) || other.colourSpace == colourSpace)&&const DeepCollectionEquality().equals(other._passes, _passes)&&(identical(other.budget, budget) || other.budget == budget)&&(identical(other.onScreen, onScreen) || other.onScreen == onScreen)&&(identical(other.fullResolution, fullResolution) || other.fullResolution == fullResolution));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,coordinateSystem,colourSpace,const DeepCollectionEquality().hash(_passes),budget,onScreen,fullResolution);

@override
String toString() {
  return 'RenderTarget(kind: $kind, coordinateSystem: $coordinateSystem, colourSpace: $colourSpace, passes: $passes, budget: $budget, onScreen: $onScreen, fullResolution: $fullResolution)';
}


}

/// @nodoc
abstract mixin class _$RenderTargetCopyWith<$Res> implements $RenderTargetCopyWith<$Res> {
  factory _$RenderTargetCopyWith(_RenderTarget value, $Res Function(_RenderTarget) _then) = __$RenderTargetCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _kindFromJson, toJson: _kindToJson) RenderTargetKind kind, CanvasCoordinateSystem coordinateSystem,@JsonKey(fromJson: _colourFromJson, toJson: _colourToJson) AssetColourSpace colourSpace,@JsonKey(fromJson: _passesFromJson, toJson: _passesToJson) List<RenderPassKind> passes, FrameBudget budget, bool onScreen, bool fullResolution
});


@override $CanvasCoordinateSystemCopyWith<$Res> get coordinateSystem;@override $FrameBudgetCopyWith<$Res> get budget;

}
/// @nodoc
class __$RenderTargetCopyWithImpl<$Res>
    implements _$RenderTargetCopyWith<$Res> {
  __$RenderTargetCopyWithImpl(this._self, this._then);

  final _RenderTarget _self;
  final $Res Function(_RenderTarget) _then;

/// Create a copy of RenderTarget
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? coordinateSystem = null,Object? colourSpace = null,Object? passes = null,Object? budget = null,Object? onScreen = null,Object? fullResolution = null,}) {
  return _then(_RenderTarget(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as RenderTargetKind,coordinateSystem: null == coordinateSystem ? _self.coordinateSystem : coordinateSystem // ignore: cast_nullable_to_non_nullable
as CanvasCoordinateSystem,colourSpace: null == colourSpace ? _self.colourSpace : colourSpace // ignore: cast_nullable_to_non_nullable
as AssetColourSpace,passes: null == passes ? _self._passes : passes // ignore: cast_nullable_to_non_nullable
as List<RenderPassKind>,budget: null == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as FrameBudget,onScreen: null == onScreen ? _self.onScreen : onScreen // ignore: cast_nullable_to_non_nullable
as bool,fullResolution: null == fullResolution ? _self.fullResolution : fullResolution // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of RenderTarget
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CanvasCoordinateSystemCopyWith<$Res> get coordinateSystem {
  
  return $CanvasCoordinateSystemCopyWith<$Res>(_self.coordinateSystem, (value) {
    return _then(_self.copyWith(coordinateSystem: value));
  });
}/// Create a copy of RenderTarget
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FrameBudgetCopyWith<$Res> get budget {
  
  return $FrameBudgetCopyWith<$Res>(_self.budget, (value) {
    return _then(_self.copyWith(budget: value));
  });
}
}

// dart format on
