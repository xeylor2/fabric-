// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'production_render_bridge.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductionRenderPlan {

/// The job this plan renders.
 String get jobId;/// The job's declared artboard references — ids only.
 List<String> get artboardIds;/// The frozen production-export target (kind `production_export`,
/// full resolution, off-screen; all other fields frozen defaults).
 RenderTarget get target;/// The deterministic frozen render graph — the farm's work-list.
 RenderGraph get graph;/// The frozen export-provenance record.
 ReproducibilityRecord get record; Map<String, Object?> get metadata;
/// Create a copy of ProductionRenderPlan
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductionRenderPlanCopyWith<ProductionRenderPlan> get copyWith => _$ProductionRenderPlanCopyWithImpl<ProductionRenderPlan>(this as ProductionRenderPlan, _$identity);

  /// Serializes this ProductionRenderPlan to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductionRenderPlan&&(identical(other.jobId, jobId) || other.jobId == jobId)&&const DeepCollectionEquality().equals(other.artboardIds, artboardIds)&&(identical(other.target, target) || other.target == target)&&(identical(other.graph, graph) || other.graph == graph)&&(identical(other.record, record) || other.record == record)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,jobId,const DeepCollectionEquality().hash(artboardIds),target,graph,record,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'ProductionRenderPlan(jobId: $jobId, artboardIds: $artboardIds, target: $target, graph: $graph, record: $record, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $ProductionRenderPlanCopyWith<$Res>  {
  factory $ProductionRenderPlanCopyWith(ProductionRenderPlan value, $Res Function(ProductionRenderPlan) _then) = _$ProductionRenderPlanCopyWithImpl;
@useResult
$Res call({
 String jobId, List<String> artboardIds, RenderTarget target, RenderGraph graph, ReproducibilityRecord record, Map<String, Object?> metadata
});


$RenderTargetCopyWith<$Res> get target;$RenderGraphCopyWith<$Res> get graph;$ReproducibilityRecordCopyWith<$Res> get record;

}
/// @nodoc
class _$ProductionRenderPlanCopyWithImpl<$Res>
    implements $ProductionRenderPlanCopyWith<$Res> {
  _$ProductionRenderPlanCopyWithImpl(this._self, this._then);

  final ProductionRenderPlan _self;
  final $Res Function(ProductionRenderPlan) _then;

/// Create a copy of ProductionRenderPlan
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? jobId = null,Object? artboardIds = null,Object? target = null,Object? graph = null,Object? record = null,Object? metadata = null,}) {
  return _then(_self.copyWith(
jobId: null == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as String,artboardIds: null == artboardIds ? _self.artboardIds : artboardIds // ignore: cast_nullable_to_non_nullable
as List<String>,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as RenderTarget,graph: null == graph ? _self.graph : graph // ignore: cast_nullable_to_non_nullable
as RenderGraph,record: null == record ? _self.record : record // ignore: cast_nullable_to_non_nullable
as ReproducibilityRecord,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}
/// Create a copy of ProductionRenderPlan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RenderTargetCopyWith<$Res> get target {
  
  return $RenderTargetCopyWith<$Res>(_self.target, (value) {
    return _then(_self.copyWith(target: value));
  });
}/// Create a copy of ProductionRenderPlan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RenderGraphCopyWith<$Res> get graph {
  
  return $RenderGraphCopyWith<$Res>(_self.graph, (value) {
    return _then(_self.copyWith(graph: value));
  });
}/// Create a copy of ProductionRenderPlan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReproducibilityRecordCopyWith<$Res> get record {
  
  return $ReproducibilityRecordCopyWith<$Res>(_self.record, (value) {
    return _then(_self.copyWith(record: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProductionRenderPlan].
extension ProductionRenderPlanPatterns on ProductionRenderPlan {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductionRenderPlan value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductionRenderPlan() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductionRenderPlan value)  $default,){
final _that = this;
switch (_that) {
case _ProductionRenderPlan():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductionRenderPlan value)?  $default,){
final _that = this;
switch (_that) {
case _ProductionRenderPlan() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String jobId,  List<String> artboardIds,  RenderTarget target,  RenderGraph graph,  ReproducibilityRecord record,  Map<String, Object?> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductionRenderPlan() when $default != null:
return $default(_that.jobId,_that.artboardIds,_that.target,_that.graph,_that.record,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String jobId,  List<String> artboardIds,  RenderTarget target,  RenderGraph graph,  ReproducibilityRecord record,  Map<String, Object?> metadata)  $default,) {final _that = this;
switch (_that) {
case _ProductionRenderPlan():
return $default(_that.jobId,_that.artboardIds,_that.target,_that.graph,_that.record,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String jobId,  List<String> artboardIds,  RenderTarget target,  RenderGraph graph,  ReproducibilityRecord record,  Map<String, Object?> metadata)?  $default,) {final _that = this;
switch (_that) {
case _ProductionRenderPlan() when $default != null:
return $default(_that.jobId,_that.artboardIds,_that.target,_that.graph,_that.record,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductionRenderPlan implements ProductionRenderPlan {
  const _ProductionRenderPlan({required this.jobId, final  List<String> artboardIds = const <String>[], required this.target, required this.graph, required this.record, final  Map<String, Object?> metadata = const <String, Object?>{}}): _artboardIds = artboardIds,_metadata = metadata;
  factory _ProductionRenderPlan.fromJson(Map<String, dynamic> json) => _$ProductionRenderPlanFromJson(json);

/// The job this plan renders.
@override final  String jobId;
/// The job's declared artboard references — ids only.
 final  List<String> _artboardIds;
/// The job's declared artboard references — ids only.
@override@JsonKey() List<String> get artboardIds {
  if (_artboardIds is EqualUnmodifiableListView) return _artboardIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_artboardIds);
}

/// The frozen production-export target (kind `production_export`,
/// full resolution, off-screen; all other fields frozen defaults).
@override final  RenderTarget target;
/// The deterministic frozen render graph — the farm's work-list.
@override final  RenderGraph graph;
/// The frozen export-provenance record.
@override final  ReproducibilityRecord record;
 final  Map<String, Object?> _metadata;
@override@JsonKey() Map<String, Object?> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of ProductionRenderPlan
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductionRenderPlanCopyWith<_ProductionRenderPlan> get copyWith => __$ProductionRenderPlanCopyWithImpl<_ProductionRenderPlan>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductionRenderPlanToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductionRenderPlan&&(identical(other.jobId, jobId) || other.jobId == jobId)&&const DeepCollectionEquality().equals(other._artboardIds, _artboardIds)&&(identical(other.target, target) || other.target == target)&&(identical(other.graph, graph) || other.graph == graph)&&(identical(other.record, record) || other.record == record)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,jobId,const DeepCollectionEquality().hash(_artboardIds),target,graph,record,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'ProductionRenderPlan(jobId: $jobId, artboardIds: $artboardIds, target: $target, graph: $graph, record: $record, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$ProductionRenderPlanCopyWith<$Res> implements $ProductionRenderPlanCopyWith<$Res> {
  factory _$ProductionRenderPlanCopyWith(_ProductionRenderPlan value, $Res Function(_ProductionRenderPlan) _then) = __$ProductionRenderPlanCopyWithImpl;
@override @useResult
$Res call({
 String jobId, List<String> artboardIds, RenderTarget target, RenderGraph graph, ReproducibilityRecord record, Map<String, Object?> metadata
});


@override $RenderTargetCopyWith<$Res> get target;@override $RenderGraphCopyWith<$Res> get graph;@override $ReproducibilityRecordCopyWith<$Res> get record;

}
/// @nodoc
class __$ProductionRenderPlanCopyWithImpl<$Res>
    implements _$ProductionRenderPlanCopyWith<$Res> {
  __$ProductionRenderPlanCopyWithImpl(this._self, this._then);

  final _ProductionRenderPlan _self;
  final $Res Function(_ProductionRenderPlan) _then;

/// Create a copy of ProductionRenderPlan
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? jobId = null,Object? artboardIds = null,Object? target = null,Object? graph = null,Object? record = null,Object? metadata = null,}) {
  return _then(_ProductionRenderPlan(
jobId: null == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as String,artboardIds: null == artboardIds ? _self._artboardIds : artboardIds // ignore: cast_nullable_to_non_nullable
as List<String>,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as RenderTarget,graph: null == graph ? _self.graph : graph // ignore: cast_nullable_to_non_nullable
as RenderGraph,record: null == record ? _self.record : record // ignore: cast_nullable_to_non_nullable
as ReproducibilityRecord,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

/// Create a copy of ProductionRenderPlan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RenderTargetCopyWith<$Res> get target {
  
  return $RenderTargetCopyWith<$Res>(_self.target, (value) {
    return _then(_self.copyWith(target: value));
  });
}/// Create a copy of ProductionRenderPlan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RenderGraphCopyWith<$Res> get graph {
  
  return $RenderGraphCopyWith<$Res>(_self.graph, (value) {
    return _then(_self.copyWith(graph: value));
  });
}/// Create a copy of ProductionRenderPlan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReproducibilityRecordCopyWith<$Res> get record {
  
  return $ReproducibilityRecordCopyWith<$Res>(_self.record, (value) {
    return _then(_self.copyWith(record: value));
  });
}
}

// dart format on
