// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'canvas_runtime_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CanvasRuntimeState {

/// The camera and its bounded view history. `camera.viewport` is THE one
/// shared viewport every tool uses.
 NavigationState get camera;/// Physical-unit coordinate system of the surface.
 CanvasCoordinateSystem get coordinateSystem; GridSpec get grid; List<GuideModel> get guides; RulerSpec get ruler; SnappingConfig get snapping;/// Canvas-owned overlays (tools contribute; canvas paints — outside M5A).
 OverlayStack get overlays;/// References the canvas visualises (ids only).
 List<CanvasReference> get references;/// Print-domain framing regions.
 PrintRegionSpec get printRegions;/// Performance strategy composing the frozen `core_performance` specs.
 CanvasPerformanceStrategy get performance;
/// Create a copy of CanvasRuntimeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CanvasRuntimeStateCopyWith<CanvasRuntimeState> get copyWith => _$CanvasRuntimeStateCopyWithImpl<CanvasRuntimeState>(this as CanvasRuntimeState, _$identity);

  /// Serializes this CanvasRuntimeState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CanvasRuntimeState&&(identical(other.camera, camera) || other.camera == camera)&&(identical(other.coordinateSystem, coordinateSystem) || other.coordinateSystem == coordinateSystem)&&(identical(other.grid, grid) || other.grid == grid)&&const DeepCollectionEquality().equals(other.guides, guides)&&(identical(other.ruler, ruler) || other.ruler == ruler)&&(identical(other.snapping, snapping) || other.snapping == snapping)&&(identical(other.overlays, overlays) || other.overlays == overlays)&&const DeepCollectionEquality().equals(other.references, references)&&(identical(other.printRegions, printRegions) || other.printRegions == printRegions)&&(identical(other.performance, performance) || other.performance == performance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,camera,coordinateSystem,grid,const DeepCollectionEquality().hash(guides),ruler,snapping,overlays,const DeepCollectionEquality().hash(references),printRegions,performance);

@override
String toString() {
  return 'CanvasRuntimeState(camera: $camera, coordinateSystem: $coordinateSystem, grid: $grid, guides: $guides, ruler: $ruler, snapping: $snapping, overlays: $overlays, references: $references, printRegions: $printRegions, performance: $performance)';
}


}

/// @nodoc
abstract mixin class $CanvasRuntimeStateCopyWith<$Res>  {
  factory $CanvasRuntimeStateCopyWith(CanvasRuntimeState value, $Res Function(CanvasRuntimeState) _then) = _$CanvasRuntimeStateCopyWithImpl;
@useResult
$Res call({
 NavigationState camera, CanvasCoordinateSystem coordinateSystem, GridSpec grid, List<GuideModel> guides, RulerSpec ruler, SnappingConfig snapping, OverlayStack overlays, List<CanvasReference> references, PrintRegionSpec printRegions, CanvasPerformanceStrategy performance
});


$NavigationStateCopyWith<$Res> get camera;$CanvasCoordinateSystemCopyWith<$Res> get coordinateSystem;$GridSpecCopyWith<$Res> get grid;$RulerSpecCopyWith<$Res> get ruler;$SnappingConfigCopyWith<$Res> get snapping;$OverlayStackCopyWith<$Res> get overlays;$PrintRegionSpecCopyWith<$Res> get printRegions;$CanvasPerformanceStrategyCopyWith<$Res> get performance;

}
/// @nodoc
class _$CanvasRuntimeStateCopyWithImpl<$Res>
    implements $CanvasRuntimeStateCopyWith<$Res> {
  _$CanvasRuntimeStateCopyWithImpl(this._self, this._then);

  final CanvasRuntimeState _self;
  final $Res Function(CanvasRuntimeState) _then;

/// Create a copy of CanvasRuntimeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? camera = null,Object? coordinateSystem = null,Object? grid = null,Object? guides = null,Object? ruler = null,Object? snapping = null,Object? overlays = null,Object? references = null,Object? printRegions = null,Object? performance = null,}) {
  return _then(_self.copyWith(
camera: null == camera ? _self.camera : camera // ignore: cast_nullable_to_non_nullable
as NavigationState,coordinateSystem: null == coordinateSystem ? _self.coordinateSystem : coordinateSystem // ignore: cast_nullable_to_non_nullable
as CanvasCoordinateSystem,grid: null == grid ? _self.grid : grid // ignore: cast_nullable_to_non_nullable
as GridSpec,guides: null == guides ? _self.guides : guides // ignore: cast_nullable_to_non_nullable
as List<GuideModel>,ruler: null == ruler ? _self.ruler : ruler // ignore: cast_nullable_to_non_nullable
as RulerSpec,snapping: null == snapping ? _self.snapping : snapping // ignore: cast_nullable_to_non_nullable
as SnappingConfig,overlays: null == overlays ? _self.overlays : overlays // ignore: cast_nullable_to_non_nullable
as OverlayStack,references: null == references ? _self.references : references // ignore: cast_nullable_to_non_nullable
as List<CanvasReference>,printRegions: null == printRegions ? _self.printRegions : printRegions // ignore: cast_nullable_to_non_nullable
as PrintRegionSpec,performance: null == performance ? _self.performance : performance // ignore: cast_nullable_to_non_nullable
as CanvasPerformanceStrategy,
  ));
}
/// Create a copy of CanvasRuntimeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NavigationStateCopyWith<$Res> get camera {
  
  return $NavigationStateCopyWith<$Res>(_self.camera, (value) {
    return _then(_self.copyWith(camera: value));
  });
}/// Create a copy of CanvasRuntimeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CanvasCoordinateSystemCopyWith<$Res> get coordinateSystem {
  
  return $CanvasCoordinateSystemCopyWith<$Res>(_self.coordinateSystem, (value) {
    return _then(_self.copyWith(coordinateSystem: value));
  });
}/// Create a copy of CanvasRuntimeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GridSpecCopyWith<$Res> get grid {
  
  return $GridSpecCopyWith<$Res>(_self.grid, (value) {
    return _then(_self.copyWith(grid: value));
  });
}/// Create a copy of CanvasRuntimeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RulerSpecCopyWith<$Res> get ruler {
  
  return $RulerSpecCopyWith<$Res>(_self.ruler, (value) {
    return _then(_self.copyWith(ruler: value));
  });
}/// Create a copy of CanvasRuntimeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SnappingConfigCopyWith<$Res> get snapping {
  
  return $SnappingConfigCopyWith<$Res>(_self.snapping, (value) {
    return _then(_self.copyWith(snapping: value));
  });
}/// Create a copy of CanvasRuntimeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OverlayStackCopyWith<$Res> get overlays {
  
  return $OverlayStackCopyWith<$Res>(_self.overlays, (value) {
    return _then(_self.copyWith(overlays: value));
  });
}/// Create a copy of CanvasRuntimeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PrintRegionSpecCopyWith<$Res> get printRegions {
  
  return $PrintRegionSpecCopyWith<$Res>(_self.printRegions, (value) {
    return _then(_self.copyWith(printRegions: value));
  });
}/// Create a copy of CanvasRuntimeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CanvasPerformanceStrategyCopyWith<$Res> get performance {
  
  return $CanvasPerformanceStrategyCopyWith<$Res>(_self.performance, (value) {
    return _then(_self.copyWith(performance: value));
  });
}
}


/// Adds pattern-matching-related methods to [CanvasRuntimeState].
extension CanvasRuntimeStatePatterns on CanvasRuntimeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CanvasRuntimeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CanvasRuntimeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CanvasRuntimeState value)  $default,){
final _that = this;
switch (_that) {
case _CanvasRuntimeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CanvasRuntimeState value)?  $default,){
final _that = this;
switch (_that) {
case _CanvasRuntimeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( NavigationState camera,  CanvasCoordinateSystem coordinateSystem,  GridSpec grid,  List<GuideModel> guides,  RulerSpec ruler,  SnappingConfig snapping,  OverlayStack overlays,  List<CanvasReference> references,  PrintRegionSpec printRegions,  CanvasPerformanceStrategy performance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CanvasRuntimeState() when $default != null:
return $default(_that.camera,_that.coordinateSystem,_that.grid,_that.guides,_that.ruler,_that.snapping,_that.overlays,_that.references,_that.printRegions,_that.performance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( NavigationState camera,  CanvasCoordinateSystem coordinateSystem,  GridSpec grid,  List<GuideModel> guides,  RulerSpec ruler,  SnappingConfig snapping,  OverlayStack overlays,  List<CanvasReference> references,  PrintRegionSpec printRegions,  CanvasPerformanceStrategy performance)  $default,) {final _that = this;
switch (_that) {
case _CanvasRuntimeState():
return $default(_that.camera,_that.coordinateSystem,_that.grid,_that.guides,_that.ruler,_that.snapping,_that.overlays,_that.references,_that.printRegions,_that.performance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( NavigationState camera,  CanvasCoordinateSystem coordinateSystem,  GridSpec grid,  List<GuideModel> guides,  RulerSpec ruler,  SnappingConfig snapping,  OverlayStack overlays,  List<CanvasReference> references,  PrintRegionSpec printRegions,  CanvasPerformanceStrategy performance)?  $default,) {final _that = this;
switch (_that) {
case _CanvasRuntimeState() when $default != null:
return $default(_that.camera,_that.coordinateSystem,_that.grid,_that.guides,_that.ruler,_that.snapping,_that.overlays,_that.references,_that.printRegions,_that.performance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CanvasRuntimeState extends CanvasRuntimeState {
  const _CanvasRuntimeState({required this.camera, this.coordinateSystem = CanvasCoordinateSystem.standard, this.grid = GridSpec.standard, final  List<GuideModel> guides = const <GuideModel>[], this.ruler = RulerSpec.standard, this.snapping = SnappingConfig.standard, this.overlays = OverlayStack.empty, final  List<CanvasReference> references = const <CanvasReference>[], this.printRegions = PrintRegionSpec.standard, this.performance = CanvasPerformanceStrategy.standard}): _guides = guides,_references = references,super._();
  factory _CanvasRuntimeState.fromJson(Map<String, dynamic> json) => _$CanvasRuntimeStateFromJson(json);

/// The camera and its bounded view history. `camera.viewport` is THE one
/// shared viewport every tool uses.
@override final  NavigationState camera;
/// Physical-unit coordinate system of the surface.
@override@JsonKey() final  CanvasCoordinateSystem coordinateSystem;
@override@JsonKey() final  GridSpec grid;
 final  List<GuideModel> _guides;
@override@JsonKey() List<GuideModel> get guides {
  if (_guides is EqualUnmodifiableListView) return _guides;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_guides);
}

@override@JsonKey() final  RulerSpec ruler;
@override@JsonKey() final  SnappingConfig snapping;
/// Canvas-owned overlays (tools contribute; canvas paints — outside M5A).
@override@JsonKey() final  OverlayStack overlays;
/// References the canvas visualises (ids only).
 final  List<CanvasReference> _references;
/// References the canvas visualises (ids only).
@override@JsonKey() List<CanvasReference> get references {
  if (_references is EqualUnmodifiableListView) return _references;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_references);
}

/// Print-domain framing regions.
@override@JsonKey() final  PrintRegionSpec printRegions;
/// Performance strategy composing the frozen `core_performance` specs.
@override@JsonKey() final  CanvasPerformanceStrategy performance;

/// Create a copy of CanvasRuntimeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CanvasRuntimeStateCopyWith<_CanvasRuntimeState> get copyWith => __$CanvasRuntimeStateCopyWithImpl<_CanvasRuntimeState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CanvasRuntimeStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CanvasRuntimeState&&(identical(other.camera, camera) || other.camera == camera)&&(identical(other.coordinateSystem, coordinateSystem) || other.coordinateSystem == coordinateSystem)&&(identical(other.grid, grid) || other.grid == grid)&&const DeepCollectionEquality().equals(other._guides, _guides)&&(identical(other.ruler, ruler) || other.ruler == ruler)&&(identical(other.snapping, snapping) || other.snapping == snapping)&&(identical(other.overlays, overlays) || other.overlays == overlays)&&const DeepCollectionEquality().equals(other._references, _references)&&(identical(other.printRegions, printRegions) || other.printRegions == printRegions)&&(identical(other.performance, performance) || other.performance == performance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,camera,coordinateSystem,grid,const DeepCollectionEquality().hash(_guides),ruler,snapping,overlays,const DeepCollectionEquality().hash(_references),printRegions,performance);

@override
String toString() {
  return 'CanvasRuntimeState(camera: $camera, coordinateSystem: $coordinateSystem, grid: $grid, guides: $guides, ruler: $ruler, snapping: $snapping, overlays: $overlays, references: $references, printRegions: $printRegions, performance: $performance)';
}


}

/// @nodoc
abstract mixin class _$CanvasRuntimeStateCopyWith<$Res> implements $CanvasRuntimeStateCopyWith<$Res> {
  factory _$CanvasRuntimeStateCopyWith(_CanvasRuntimeState value, $Res Function(_CanvasRuntimeState) _then) = __$CanvasRuntimeStateCopyWithImpl;
@override @useResult
$Res call({
 NavigationState camera, CanvasCoordinateSystem coordinateSystem, GridSpec grid, List<GuideModel> guides, RulerSpec ruler, SnappingConfig snapping, OverlayStack overlays, List<CanvasReference> references, PrintRegionSpec printRegions, CanvasPerformanceStrategy performance
});


@override $NavigationStateCopyWith<$Res> get camera;@override $CanvasCoordinateSystemCopyWith<$Res> get coordinateSystem;@override $GridSpecCopyWith<$Res> get grid;@override $RulerSpecCopyWith<$Res> get ruler;@override $SnappingConfigCopyWith<$Res> get snapping;@override $OverlayStackCopyWith<$Res> get overlays;@override $PrintRegionSpecCopyWith<$Res> get printRegions;@override $CanvasPerformanceStrategyCopyWith<$Res> get performance;

}
/// @nodoc
class __$CanvasRuntimeStateCopyWithImpl<$Res>
    implements _$CanvasRuntimeStateCopyWith<$Res> {
  __$CanvasRuntimeStateCopyWithImpl(this._self, this._then);

  final _CanvasRuntimeState _self;
  final $Res Function(_CanvasRuntimeState) _then;

/// Create a copy of CanvasRuntimeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? camera = null,Object? coordinateSystem = null,Object? grid = null,Object? guides = null,Object? ruler = null,Object? snapping = null,Object? overlays = null,Object? references = null,Object? printRegions = null,Object? performance = null,}) {
  return _then(_CanvasRuntimeState(
camera: null == camera ? _self.camera : camera // ignore: cast_nullable_to_non_nullable
as NavigationState,coordinateSystem: null == coordinateSystem ? _self.coordinateSystem : coordinateSystem // ignore: cast_nullable_to_non_nullable
as CanvasCoordinateSystem,grid: null == grid ? _self.grid : grid // ignore: cast_nullable_to_non_nullable
as GridSpec,guides: null == guides ? _self._guides : guides // ignore: cast_nullable_to_non_nullable
as List<GuideModel>,ruler: null == ruler ? _self.ruler : ruler // ignore: cast_nullable_to_non_nullable
as RulerSpec,snapping: null == snapping ? _self.snapping : snapping // ignore: cast_nullable_to_non_nullable
as SnappingConfig,overlays: null == overlays ? _self.overlays : overlays // ignore: cast_nullable_to_non_nullable
as OverlayStack,references: null == references ? _self._references : references // ignore: cast_nullable_to_non_nullable
as List<CanvasReference>,printRegions: null == printRegions ? _self.printRegions : printRegions // ignore: cast_nullable_to_non_nullable
as PrintRegionSpec,performance: null == performance ? _self.performance : performance // ignore: cast_nullable_to_non_nullable
as CanvasPerformanceStrategy,
  ));
}

/// Create a copy of CanvasRuntimeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NavigationStateCopyWith<$Res> get camera {
  
  return $NavigationStateCopyWith<$Res>(_self.camera, (value) {
    return _then(_self.copyWith(camera: value));
  });
}/// Create a copy of CanvasRuntimeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CanvasCoordinateSystemCopyWith<$Res> get coordinateSystem {
  
  return $CanvasCoordinateSystemCopyWith<$Res>(_self.coordinateSystem, (value) {
    return _then(_self.copyWith(coordinateSystem: value));
  });
}/// Create a copy of CanvasRuntimeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GridSpecCopyWith<$Res> get grid {
  
  return $GridSpecCopyWith<$Res>(_self.grid, (value) {
    return _then(_self.copyWith(grid: value));
  });
}/// Create a copy of CanvasRuntimeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RulerSpecCopyWith<$Res> get ruler {
  
  return $RulerSpecCopyWith<$Res>(_self.ruler, (value) {
    return _then(_self.copyWith(ruler: value));
  });
}/// Create a copy of CanvasRuntimeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SnappingConfigCopyWith<$Res> get snapping {
  
  return $SnappingConfigCopyWith<$Res>(_self.snapping, (value) {
    return _then(_self.copyWith(snapping: value));
  });
}/// Create a copy of CanvasRuntimeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OverlayStackCopyWith<$Res> get overlays {
  
  return $OverlayStackCopyWith<$Res>(_self.overlays, (value) {
    return _then(_self.copyWith(overlays: value));
  });
}/// Create a copy of CanvasRuntimeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PrintRegionSpecCopyWith<$Res> get printRegions {
  
  return $PrintRegionSpecCopyWith<$Res>(_self.printRegions, (value) {
    return _then(_self.copyWith(printRegions: value));
  });
}/// Create a copy of CanvasRuntimeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CanvasPerformanceStrategyCopyWith<$Res> get performance {
  
  return $CanvasPerformanceStrategyCopyWith<$Res>(_self.performance, (value) {
    return _then(_self.copyWith(performance: value));
  });
}
}

// dart format on
