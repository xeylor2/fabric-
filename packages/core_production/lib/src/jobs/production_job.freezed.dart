// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'production_job.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductionJob {

/// Stable UUID of this job.
 String get id;/// The document being produced — id only.
 String get documentId;/// The artboards to produce — ids only (the renders-references-only
/// convention).
 List<String> get artboardIds;@JsonKey(fromJson: _deliverableFromJson, toJson: _deliverableToJson) ProductionDeliverable get deliverable;/// Exact physical output size (frozen geometry vocabulary).
 Size2D get physicalSize;/// Unit of [physicalSize] (frozen vocabulary; §12 physical-unit
/// mandate).
@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) MeasurementUnit get unit;/// Output resolution — always embedded (§12).
 double get dpi;/// Stages completed so far, in order.
@JsonKey(fromJson: _stagesFromJson, toJson: _stagesToJson) List<ProductionStage> get completed; Map<String, Object?> get metadata;
/// Create a copy of ProductionJob
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductionJobCopyWith<ProductionJob> get copyWith => _$ProductionJobCopyWithImpl<ProductionJob>(this as ProductionJob, _$identity);

  /// Serializes this ProductionJob to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductionJob&&(identical(other.id, id) || other.id == id)&&(identical(other.documentId, documentId) || other.documentId == documentId)&&const DeepCollectionEquality().equals(other.artboardIds, artboardIds)&&(identical(other.deliverable, deliverable) || other.deliverable == deliverable)&&(identical(other.physicalSize, physicalSize) || other.physicalSize == physicalSize)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.dpi, dpi) || other.dpi == dpi)&&const DeepCollectionEquality().equals(other.completed, completed)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,documentId,const DeepCollectionEquality().hash(artboardIds),deliverable,physicalSize,unit,dpi,const DeepCollectionEquality().hash(completed),const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'ProductionJob(id: $id, documentId: $documentId, artboardIds: $artboardIds, deliverable: $deliverable, physicalSize: $physicalSize, unit: $unit, dpi: $dpi, completed: $completed, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $ProductionJobCopyWith<$Res>  {
  factory $ProductionJobCopyWith(ProductionJob value, $Res Function(ProductionJob) _then) = _$ProductionJobCopyWithImpl;
@useResult
$Res call({
 String id, String documentId, List<String> artboardIds,@JsonKey(fromJson: _deliverableFromJson, toJson: _deliverableToJson) ProductionDeliverable deliverable, Size2D physicalSize,@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) MeasurementUnit unit, double dpi,@JsonKey(fromJson: _stagesFromJson, toJson: _stagesToJson) List<ProductionStage> completed, Map<String, Object?> metadata
});


$Size2DCopyWith<$Res> get physicalSize;

}
/// @nodoc
class _$ProductionJobCopyWithImpl<$Res>
    implements $ProductionJobCopyWith<$Res> {
  _$ProductionJobCopyWithImpl(this._self, this._then);

  final ProductionJob _self;
  final $Res Function(ProductionJob) _then;

/// Create a copy of ProductionJob
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? documentId = null,Object? artboardIds = null,Object? deliverable = null,Object? physicalSize = null,Object? unit = null,Object? dpi = null,Object? completed = null,Object? metadata = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,documentId: null == documentId ? _self.documentId : documentId // ignore: cast_nullable_to_non_nullable
as String,artboardIds: null == artboardIds ? _self.artboardIds : artboardIds // ignore: cast_nullable_to_non_nullable
as List<String>,deliverable: null == deliverable ? _self.deliverable : deliverable // ignore: cast_nullable_to_non_nullable
as ProductionDeliverable,physicalSize: null == physicalSize ? _self.physicalSize : physicalSize // ignore: cast_nullable_to_non_nullable
as Size2D,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as MeasurementUnit,dpi: null == dpi ? _self.dpi : dpi // ignore: cast_nullable_to_non_nullable
as double,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as List<ProductionStage>,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}
/// Create a copy of ProductionJob
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Size2DCopyWith<$Res> get physicalSize {
  
  return $Size2DCopyWith<$Res>(_self.physicalSize, (value) {
    return _then(_self.copyWith(physicalSize: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProductionJob].
extension ProductionJobPatterns on ProductionJob {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductionJob value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductionJob() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductionJob value)  $default,){
final _that = this;
switch (_that) {
case _ProductionJob():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductionJob value)?  $default,){
final _that = this;
switch (_that) {
case _ProductionJob() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String documentId,  List<String> artboardIds, @JsonKey(fromJson: _deliverableFromJson, toJson: _deliverableToJson)  ProductionDeliverable deliverable,  Size2D physicalSize, @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson)  MeasurementUnit unit,  double dpi, @JsonKey(fromJson: _stagesFromJson, toJson: _stagesToJson)  List<ProductionStage> completed,  Map<String, Object?> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductionJob() when $default != null:
return $default(_that.id,_that.documentId,_that.artboardIds,_that.deliverable,_that.physicalSize,_that.unit,_that.dpi,_that.completed,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String documentId,  List<String> artboardIds, @JsonKey(fromJson: _deliverableFromJson, toJson: _deliverableToJson)  ProductionDeliverable deliverable,  Size2D physicalSize, @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson)  MeasurementUnit unit,  double dpi, @JsonKey(fromJson: _stagesFromJson, toJson: _stagesToJson)  List<ProductionStage> completed,  Map<String, Object?> metadata)  $default,) {final _that = this;
switch (_that) {
case _ProductionJob():
return $default(_that.id,_that.documentId,_that.artboardIds,_that.deliverable,_that.physicalSize,_that.unit,_that.dpi,_that.completed,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String documentId,  List<String> artboardIds, @JsonKey(fromJson: _deliverableFromJson, toJson: _deliverableToJson)  ProductionDeliverable deliverable,  Size2D physicalSize, @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson)  MeasurementUnit unit,  double dpi, @JsonKey(fromJson: _stagesFromJson, toJson: _stagesToJson)  List<ProductionStage> completed,  Map<String, Object?> metadata)?  $default,) {final _that = this;
switch (_that) {
case _ProductionJob() when $default != null:
return $default(_that.id,_that.documentId,_that.artboardIds,_that.deliverable,_that.physicalSize,_that.unit,_that.dpi,_that.completed,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductionJob extends ProductionJob {
  const _ProductionJob({required this.id, required this.documentId, final  List<String> artboardIds = const <String>[], @JsonKey(fromJson: _deliverableFromJson, toJson: _deliverableToJson) required this.deliverable, required this.physicalSize, @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) this.unit = MeasurementUnit.centimetre, this.dpi = 300.0, @JsonKey(fromJson: _stagesFromJson, toJson: _stagesToJson) final  List<ProductionStage> completed = const <ProductionStage>[], final  Map<String, Object?> metadata = const <String, Object?>{}}): assert(dpi > 0, 'dpi must be positive'),_artboardIds = artboardIds,_completed = completed,_metadata = metadata,super._();
  factory _ProductionJob.fromJson(Map<String, dynamic> json) => _$ProductionJobFromJson(json);

/// Stable UUID of this job.
@override final  String id;
/// The document being produced — id only.
@override final  String documentId;
/// The artboards to produce — ids only (the renders-references-only
/// convention).
 final  List<String> _artboardIds;
/// The artboards to produce — ids only (the renders-references-only
/// convention).
@override@JsonKey() List<String> get artboardIds {
  if (_artboardIds is EqualUnmodifiableListView) return _artboardIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_artboardIds);
}

@override@JsonKey(fromJson: _deliverableFromJson, toJson: _deliverableToJson) final  ProductionDeliverable deliverable;
/// Exact physical output size (frozen geometry vocabulary).
@override final  Size2D physicalSize;
/// Unit of [physicalSize] (frozen vocabulary; §12 physical-unit
/// mandate).
@override@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) final  MeasurementUnit unit;
/// Output resolution — always embedded (§12).
@override@JsonKey() final  double dpi;
/// Stages completed so far, in order.
 final  List<ProductionStage> _completed;
/// Stages completed so far, in order.
@override@JsonKey(fromJson: _stagesFromJson, toJson: _stagesToJson) List<ProductionStage> get completed {
  if (_completed is EqualUnmodifiableListView) return _completed;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_completed);
}

 final  Map<String, Object?> _metadata;
@override@JsonKey() Map<String, Object?> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of ProductionJob
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductionJobCopyWith<_ProductionJob> get copyWith => __$ProductionJobCopyWithImpl<_ProductionJob>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductionJobToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductionJob&&(identical(other.id, id) || other.id == id)&&(identical(other.documentId, documentId) || other.documentId == documentId)&&const DeepCollectionEquality().equals(other._artboardIds, _artboardIds)&&(identical(other.deliverable, deliverable) || other.deliverable == deliverable)&&(identical(other.physicalSize, physicalSize) || other.physicalSize == physicalSize)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.dpi, dpi) || other.dpi == dpi)&&const DeepCollectionEquality().equals(other._completed, _completed)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,documentId,const DeepCollectionEquality().hash(_artboardIds),deliverable,physicalSize,unit,dpi,const DeepCollectionEquality().hash(_completed),const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'ProductionJob(id: $id, documentId: $documentId, artboardIds: $artboardIds, deliverable: $deliverable, physicalSize: $physicalSize, unit: $unit, dpi: $dpi, completed: $completed, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$ProductionJobCopyWith<$Res> implements $ProductionJobCopyWith<$Res> {
  factory _$ProductionJobCopyWith(_ProductionJob value, $Res Function(_ProductionJob) _then) = __$ProductionJobCopyWithImpl;
@override @useResult
$Res call({
 String id, String documentId, List<String> artboardIds,@JsonKey(fromJson: _deliverableFromJson, toJson: _deliverableToJson) ProductionDeliverable deliverable, Size2D physicalSize,@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) MeasurementUnit unit, double dpi,@JsonKey(fromJson: _stagesFromJson, toJson: _stagesToJson) List<ProductionStage> completed, Map<String, Object?> metadata
});


@override $Size2DCopyWith<$Res> get physicalSize;

}
/// @nodoc
class __$ProductionJobCopyWithImpl<$Res>
    implements _$ProductionJobCopyWith<$Res> {
  __$ProductionJobCopyWithImpl(this._self, this._then);

  final _ProductionJob _self;
  final $Res Function(_ProductionJob) _then;

/// Create a copy of ProductionJob
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? documentId = null,Object? artboardIds = null,Object? deliverable = null,Object? physicalSize = null,Object? unit = null,Object? dpi = null,Object? completed = null,Object? metadata = null,}) {
  return _then(_ProductionJob(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,documentId: null == documentId ? _self.documentId : documentId // ignore: cast_nullable_to_non_nullable
as String,artboardIds: null == artboardIds ? _self._artboardIds : artboardIds // ignore: cast_nullable_to_non_nullable
as List<String>,deliverable: null == deliverable ? _self.deliverable : deliverable // ignore: cast_nullable_to_non_nullable
as ProductionDeliverable,physicalSize: null == physicalSize ? _self.physicalSize : physicalSize // ignore: cast_nullable_to_non_nullable
as Size2D,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as MeasurementUnit,dpi: null == dpi ? _self.dpi : dpi // ignore: cast_nullable_to_non_nullable
as double,completed: null == completed ? _self._completed : completed // ignore: cast_nullable_to_non_nullable
as List<ProductionStage>,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

/// Create a copy of ProductionJob
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Size2DCopyWith<$Res> get physicalSize {
  
  return $Size2DCopyWith<$Res>(_self.physicalSize, (value) {
    return _then(_self.copyWith(physicalSize: value));
  });
}
}

// dart format on
