// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inspection_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InspectionRegion {

/// Stable UUID of this finding.
 String get id; InspectionRegionKind get kind;/// Referenced tree nodes (existing or proposed) — ids only.
 List<String> get targetNodeIds;/// Referenced masks (existing or proposed; `ai_mask` destination) —
/// ids only.
 List<String> get maskIds;/// Per-finding confidence 0..1 (§7).
 double get confidence; Map<String, Object?> get metadata;
/// Create a copy of InspectionRegion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InspectionRegionCopyWith<InspectionRegion> get copyWith => _$InspectionRegionCopyWithImpl<InspectionRegion>(this as InspectionRegion, _$identity);

  /// Serializes this InspectionRegion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InspectionRegion&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&const DeepCollectionEquality().equals(other.targetNodeIds, targetNodeIds)&&const DeepCollectionEquality().equals(other.maskIds, maskIds)&&(identical(other.confidence, confidence) || other.confidence == confidence)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,kind,const DeepCollectionEquality().hash(targetNodeIds),const DeepCollectionEquality().hash(maskIds),confidence,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'InspectionRegion(id: $id, kind: $kind, targetNodeIds: $targetNodeIds, maskIds: $maskIds, confidence: $confidence, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $InspectionRegionCopyWith<$Res>  {
  factory $InspectionRegionCopyWith(InspectionRegion value, $Res Function(InspectionRegion) _then) = _$InspectionRegionCopyWithImpl;
@useResult
$Res call({
 String id, InspectionRegionKind kind, List<String> targetNodeIds, List<String> maskIds, double confidence, Map<String, Object?> metadata
});




}
/// @nodoc
class _$InspectionRegionCopyWithImpl<$Res>
    implements $InspectionRegionCopyWith<$Res> {
  _$InspectionRegionCopyWithImpl(this._self, this._then);

  final InspectionRegion _self;
  final $Res Function(InspectionRegion) _then;

/// Create a copy of InspectionRegion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? kind = null,Object? targetNodeIds = null,Object? maskIds = null,Object? confidence = null,Object? metadata = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as InspectionRegionKind,targetNodeIds: null == targetNodeIds ? _self.targetNodeIds : targetNodeIds // ignore: cast_nullable_to_non_nullable
as List<String>,maskIds: null == maskIds ? _self.maskIds : maskIds // ignore: cast_nullable_to_non_nullable
as List<String>,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

}


/// Adds pattern-matching-related methods to [InspectionRegion].
extension InspectionRegionPatterns on InspectionRegion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InspectionRegion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InspectionRegion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InspectionRegion value)  $default,){
final _that = this;
switch (_that) {
case _InspectionRegion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InspectionRegion value)?  $default,){
final _that = this;
switch (_that) {
case _InspectionRegion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  InspectionRegionKind kind,  List<String> targetNodeIds,  List<String> maskIds,  double confidence,  Map<String, Object?> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InspectionRegion() when $default != null:
return $default(_that.id,_that.kind,_that.targetNodeIds,_that.maskIds,_that.confidence,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  InspectionRegionKind kind,  List<String> targetNodeIds,  List<String> maskIds,  double confidence,  Map<String, Object?> metadata)  $default,) {final _that = this;
switch (_that) {
case _InspectionRegion():
return $default(_that.id,_that.kind,_that.targetNodeIds,_that.maskIds,_that.confidence,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  InspectionRegionKind kind,  List<String> targetNodeIds,  List<String> maskIds,  double confidence,  Map<String, Object?> metadata)?  $default,) {final _that = this;
switch (_that) {
case _InspectionRegion() when $default != null:
return $default(_that.id,_that.kind,_that.targetNodeIds,_that.maskIds,_that.confidence,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InspectionRegion implements InspectionRegion {
  const _InspectionRegion({required this.id, required this.kind, final  List<String> targetNodeIds = const <String>[], final  List<String> maskIds = const <String>[], this.confidence = 1.0, final  Map<String, Object?> metadata = const <String, Object?>{}}): assert(confidence >= 0.0 && confidence <= 1.0, 'confidence must be within 0..1'),_targetNodeIds = targetNodeIds,_maskIds = maskIds,_metadata = metadata;
  factory _InspectionRegion.fromJson(Map<String, dynamic> json) => _$InspectionRegionFromJson(json);

/// Stable UUID of this finding.
@override final  String id;
@override final  InspectionRegionKind kind;
/// Referenced tree nodes (existing or proposed) — ids only.
 final  List<String> _targetNodeIds;
/// Referenced tree nodes (existing or proposed) — ids only.
@override@JsonKey() List<String> get targetNodeIds {
  if (_targetNodeIds is EqualUnmodifiableListView) return _targetNodeIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_targetNodeIds);
}

/// Referenced masks (existing or proposed; `ai_mask` destination) —
/// ids only.
 final  List<String> _maskIds;
/// Referenced masks (existing or proposed; `ai_mask` destination) —
/// ids only.
@override@JsonKey() List<String> get maskIds {
  if (_maskIds is EqualUnmodifiableListView) return _maskIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_maskIds);
}

/// Per-finding confidence 0..1 (§7).
@override@JsonKey() final  double confidence;
 final  Map<String, Object?> _metadata;
@override@JsonKey() Map<String, Object?> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of InspectionRegion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InspectionRegionCopyWith<_InspectionRegion> get copyWith => __$InspectionRegionCopyWithImpl<_InspectionRegion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InspectionRegionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InspectionRegion&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&const DeepCollectionEquality().equals(other._targetNodeIds, _targetNodeIds)&&const DeepCollectionEquality().equals(other._maskIds, _maskIds)&&(identical(other.confidence, confidence) || other.confidence == confidence)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,kind,const DeepCollectionEquality().hash(_targetNodeIds),const DeepCollectionEquality().hash(_maskIds),confidence,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'InspectionRegion(id: $id, kind: $kind, targetNodeIds: $targetNodeIds, maskIds: $maskIds, confidence: $confidence, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$InspectionRegionCopyWith<$Res> implements $InspectionRegionCopyWith<$Res> {
  factory _$InspectionRegionCopyWith(_InspectionRegion value, $Res Function(_InspectionRegion) _then) = __$InspectionRegionCopyWithImpl;
@override @useResult
$Res call({
 String id, InspectionRegionKind kind, List<String> targetNodeIds, List<String> maskIds, double confidence, Map<String, Object?> metadata
});




}
/// @nodoc
class __$InspectionRegionCopyWithImpl<$Res>
    implements _$InspectionRegionCopyWith<$Res> {
  __$InspectionRegionCopyWithImpl(this._self, this._then);

  final _InspectionRegion _self;
  final $Res Function(_InspectionRegion) _then;

/// Create a copy of InspectionRegion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? kind = null,Object? targetNodeIds = null,Object? maskIds = null,Object? confidence = null,Object? metadata = null,}) {
  return _then(_InspectionRegion(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as InspectionRegionKind,targetNodeIds: null == targetNodeIds ? _self._targetNodeIds : targetNodeIds // ignore: cast_nullable_to_non_nullable
as List<String>,maskIds: null == maskIds ? _self._maskIds : maskIds // ignore: cast_nullable_to_non_nullable
as List<String>,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}


/// @nodoc
mixin _$StructureFinding {

@JsonKey(fromJson: _partFromJson, toJson: _partToJson) GarmentPart get part;/// The proposed tree node representing this part, when present in the
/// tree proposal — id only.
 String? get nodeId; double get confidence; Map<String, Object?> get metadata;
/// Create a copy of StructureFinding
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StructureFindingCopyWith<StructureFinding> get copyWith => _$StructureFindingCopyWithImpl<StructureFinding>(this as StructureFinding, _$identity);

  /// Serializes this StructureFinding to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StructureFinding&&(identical(other.part, part) || other.part == part)&&(identical(other.nodeId, nodeId) || other.nodeId == nodeId)&&(identical(other.confidence, confidence) || other.confidence == confidence)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,part,nodeId,confidence,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'StructureFinding(part: $part, nodeId: $nodeId, confidence: $confidence, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $StructureFindingCopyWith<$Res>  {
  factory $StructureFindingCopyWith(StructureFinding value, $Res Function(StructureFinding) _then) = _$StructureFindingCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _partFromJson, toJson: _partToJson) GarmentPart part, String? nodeId, double confidence, Map<String, Object?> metadata
});




}
/// @nodoc
class _$StructureFindingCopyWithImpl<$Res>
    implements $StructureFindingCopyWith<$Res> {
  _$StructureFindingCopyWithImpl(this._self, this._then);

  final StructureFinding _self;
  final $Res Function(StructureFinding) _then;

/// Create a copy of StructureFinding
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? part = null,Object? nodeId = freezed,Object? confidence = null,Object? metadata = null,}) {
  return _then(_self.copyWith(
part: null == part ? _self.part : part // ignore: cast_nullable_to_non_nullable
as GarmentPart,nodeId: freezed == nodeId ? _self.nodeId : nodeId // ignore: cast_nullable_to_non_nullable
as String?,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

}


/// Adds pattern-matching-related methods to [StructureFinding].
extension StructureFindingPatterns on StructureFinding {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StructureFinding value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StructureFinding() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StructureFinding value)  $default,){
final _that = this;
switch (_that) {
case _StructureFinding():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StructureFinding value)?  $default,){
final _that = this;
switch (_that) {
case _StructureFinding() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _partFromJson, toJson: _partToJson)  GarmentPart part,  String? nodeId,  double confidence,  Map<String, Object?> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StructureFinding() when $default != null:
return $default(_that.part,_that.nodeId,_that.confidence,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _partFromJson, toJson: _partToJson)  GarmentPart part,  String? nodeId,  double confidence,  Map<String, Object?> metadata)  $default,) {final _that = this;
switch (_that) {
case _StructureFinding():
return $default(_that.part,_that.nodeId,_that.confidence,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _partFromJson, toJson: _partToJson)  GarmentPart part,  String? nodeId,  double confidence,  Map<String, Object?> metadata)?  $default,) {final _that = this;
switch (_that) {
case _StructureFinding() when $default != null:
return $default(_that.part,_that.nodeId,_that.confidence,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StructureFinding implements StructureFinding {
  const _StructureFinding({@JsonKey(fromJson: _partFromJson, toJson: _partToJson) required this.part, this.nodeId, this.confidence = 1.0, final  Map<String, Object?> metadata = const <String, Object?>{}}): assert(confidence >= 0.0 && confidence <= 1.0, 'confidence must be within 0..1'),_metadata = metadata;
  factory _StructureFinding.fromJson(Map<String, dynamic> json) => _$StructureFindingFromJson(json);

@override@JsonKey(fromJson: _partFromJson, toJson: _partToJson) final  GarmentPart part;
/// The proposed tree node representing this part, when present in the
/// tree proposal — id only.
@override final  String? nodeId;
@override@JsonKey() final  double confidence;
 final  Map<String, Object?> _metadata;
@override@JsonKey() Map<String, Object?> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of StructureFinding
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StructureFindingCopyWith<_StructureFinding> get copyWith => __$StructureFindingCopyWithImpl<_StructureFinding>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StructureFindingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StructureFinding&&(identical(other.part, part) || other.part == part)&&(identical(other.nodeId, nodeId) || other.nodeId == nodeId)&&(identical(other.confidence, confidence) || other.confidence == confidence)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,part,nodeId,confidence,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'StructureFinding(part: $part, nodeId: $nodeId, confidence: $confidence, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$StructureFindingCopyWith<$Res> implements $StructureFindingCopyWith<$Res> {
  factory _$StructureFindingCopyWith(_StructureFinding value, $Res Function(_StructureFinding) _then) = __$StructureFindingCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _partFromJson, toJson: _partToJson) GarmentPart part, String? nodeId, double confidence, Map<String, Object?> metadata
});




}
/// @nodoc
class __$StructureFindingCopyWithImpl<$Res>
    implements _$StructureFindingCopyWith<$Res> {
  __$StructureFindingCopyWithImpl(this._self, this._then);

  final _StructureFinding _self;
  final $Res Function(_StructureFinding) _then;

/// Create a copy of StructureFinding
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? part = null,Object? nodeId = freezed,Object? confidence = null,Object? metadata = null,}) {
  return _then(_StructureFinding(
part: null == part ? _self.part : part // ignore: cast_nullable_to_non_nullable
as GarmentPart,nodeId: freezed == nodeId ? _self.nodeId : nodeId // ignore: cast_nullable_to_non_nullable
as String?,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}


/// @nodoc
mixin _$MotifFinding {

/// Stable UUID of this finding.
 String get id; MotifRole get role;/// The proposed tree node carrying this motif — id only.
 String? get nodeId;/// Referenced segmentation masks (`ai_mask` destination) — ids only.
 List<String> get maskIds; double get confidence; Map<String, Object?> get metadata;
/// Create a copy of MotifFinding
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MotifFindingCopyWith<MotifFinding> get copyWith => _$MotifFindingCopyWithImpl<MotifFinding>(this as MotifFinding, _$identity);

  /// Serializes this MotifFinding to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MotifFinding&&(identical(other.id, id) || other.id == id)&&(identical(other.role, role) || other.role == role)&&(identical(other.nodeId, nodeId) || other.nodeId == nodeId)&&const DeepCollectionEquality().equals(other.maskIds, maskIds)&&(identical(other.confidence, confidence) || other.confidence == confidence)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,role,nodeId,const DeepCollectionEquality().hash(maskIds),confidence,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'MotifFinding(id: $id, role: $role, nodeId: $nodeId, maskIds: $maskIds, confidence: $confidence, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $MotifFindingCopyWith<$Res>  {
  factory $MotifFindingCopyWith(MotifFinding value, $Res Function(MotifFinding) _then) = _$MotifFindingCopyWithImpl;
@useResult
$Res call({
 String id, MotifRole role, String? nodeId, List<String> maskIds, double confidence, Map<String, Object?> metadata
});




}
/// @nodoc
class _$MotifFindingCopyWithImpl<$Res>
    implements $MotifFindingCopyWith<$Res> {
  _$MotifFindingCopyWithImpl(this._self, this._then);

  final MotifFinding _self;
  final $Res Function(MotifFinding) _then;

/// Create a copy of MotifFinding
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? role = null,Object? nodeId = freezed,Object? maskIds = null,Object? confidence = null,Object? metadata = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as MotifRole,nodeId: freezed == nodeId ? _self.nodeId : nodeId // ignore: cast_nullable_to_non_nullable
as String?,maskIds: null == maskIds ? _self.maskIds : maskIds // ignore: cast_nullable_to_non_nullable
as List<String>,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

}


/// Adds pattern-matching-related methods to [MotifFinding].
extension MotifFindingPatterns on MotifFinding {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MotifFinding value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MotifFinding() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MotifFinding value)  $default,){
final _that = this;
switch (_that) {
case _MotifFinding():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MotifFinding value)?  $default,){
final _that = this;
switch (_that) {
case _MotifFinding() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  MotifRole role,  String? nodeId,  List<String> maskIds,  double confidence,  Map<String, Object?> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MotifFinding() when $default != null:
return $default(_that.id,_that.role,_that.nodeId,_that.maskIds,_that.confidence,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  MotifRole role,  String? nodeId,  List<String> maskIds,  double confidence,  Map<String, Object?> metadata)  $default,) {final _that = this;
switch (_that) {
case _MotifFinding():
return $default(_that.id,_that.role,_that.nodeId,_that.maskIds,_that.confidence,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  MotifRole role,  String? nodeId,  List<String> maskIds,  double confidence,  Map<String, Object?> metadata)?  $default,) {final _that = this;
switch (_that) {
case _MotifFinding() when $default != null:
return $default(_that.id,_that.role,_that.nodeId,_that.maskIds,_that.confidence,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MotifFinding implements MotifFinding {
  const _MotifFinding({required this.id, required this.role, this.nodeId, final  List<String> maskIds = const <String>[], this.confidence = 1.0, final  Map<String, Object?> metadata = const <String, Object?>{}}): assert(confidence >= 0.0 && confidence <= 1.0, 'confidence must be within 0..1'),_maskIds = maskIds,_metadata = metadata;
  factory _MotifFinding.fromJson(Map<String, dynamic> json) => _$MotifFindingFromJson(json);

/// Stable UUID of this finding.
@override final  String id;
@override final  MotifRole role;
/// The proposed tree node carrying this motif — id only.
@override final  String? nodeId;
/// Referenced segmentation masks (`ai_mask` destination) — ids only.
 final  List<String> _maskIds;
/// Referenced segmentation masks (`ai_mask` destination) — ids only.
@override@JsonKey() List<String> get maskIds {
  if (_maskIds is EqualUnmodifiableListView) return _maskIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_maskIds);
}

@override@JsonKey() final  double confidence;
 final  Map<String, Object?> _metadata;
@override@JsonKey() Map<String, Object?> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of MotifFinding
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MotifFindingCopyWith<_MotifFinding> get copyWith => __$MotifFindingCopyWithImpl<_MotifFinding>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MotifFindingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MotifFinding&&(identical(other.id, id) || other.id == id)&&(identical(other.role, role) || other.role == role)&&(identical(other.nodeId, nodeId) || other.nodeId == nodeId)&&const DeepCollectionEquality().equals(other._maskIds, _maskIds)&&(identical(other.confidence, confidence) || other.confidence == confidence)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,role,nodeId,const DeepCollectionEquality().hash(_maskIds),confidence,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'MotifFinding(id: $id, role: $role, nodeId: $nodeId, maskIds: $maskIds, confidence: $confidence, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$MotifFindingCopyWith<$Res> implements $MotifFindingCopyWith<$Res> {
  factory _$MotifFindingCopyWith(_MotifFinding value, $Res Function(_MotifFinding) _then) = __$MotifFindingCopyWithImpl;
@override @useResult
$Res call({
 String id, MotifRole role, String? nodeId, List<String> maskIds, double confidence, Map<String, Object?> metadata
});




}
/// @nodoc
class __$MotifFindingCopyWithImpl<$Res>
    implements _$MotifFindingCopyWith<$Res> {
  __$MotifFindingCopyWithImpl(this._self, this._then);

  final _MotifFinding _self;
  final $Res Function(_MotifFinding) _then;

/// Create a copy of MotifFinding
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? role = null,Object? nodeId = freezed,Object? maskIds = null,Object? confidence = null,Object? metadata = null,}) {
  return _then(_MotifFinding(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as MotifRole,nodeId: freezed == nodeId ? _self.nodeId : nodeId // ignore: cast_nullable_to_non_nullable
as String?,maskIds: null == maskIds ? _self._maskIds : maskIds // ignore: cast_nullable_to_non_nullable
as List<String>,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}


/// @nodoc
mixin _$BorderFinding {

/// Stable UUID of this finding.
 String get id;/// The proposed tree node carrying this border — id only.
 String? get nodeId;/// Referenced masks — ids only.
 List<String> get maskIds; double get confidence; Map<String, Object?> get metadata;
/// Create a copy of BorderFinding
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BorderFindingCopyWith<BorderFinding> get copyWith => _$BorderFindingCopyWithImpl<BorderFinding>(this as BorderFinding, _$identity);

  /// Serializes this BorderFinding to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BorderFinding&&(identical(other.id, id) || other.id == id)&&(identical(other.nodeId, nodeId) || other.nodeId == nodeId)&&const DeepCollectionEquality().equals(other.maskIds, maskIds)&&(identical(other.confidence, confidence) || other.confidence == confidence)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nodeId,const DeepCollectionEquality().hash(maskIds),confidence,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'BorderFinding(id: $id, nodeId: $nodeId, maskIds: $maskIds, confidence: $confidence, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $BorderFindingCopyWith<$Res>  {
  factory $BorderFindingCopyWith(BorderFinding value, $Res Function(BorderFinding) _then) = _$BorderFindingCopyWithImpl;
@useResult
$Res call({
 String id, String? nodeId, List<String> maskIds, double confidence, Map<String, Object?> metadata
});




}
/// @nodoc
class _$BorderFindingCopyWithImpl<$Res>
    implements $BorderFindingCopyWith<$Res> {
  _$BorderFindingCopyWithImpl(this._self, this._then);

  final BorderFinding _self;
  final $Res Function(BorderFinding) _then;

/// Create a copy of BorderFinding
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? nodeId = freezed,Object? maskIds = null,Object? confidence = null,Object? metadata = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nodeId: freezed == nodeId ? _self.nodeId : nodeId // ignore: cast_nullable_to_non_nullable
as String?,maskIds: null == maskIds ? _self.maskIds : maskIds // ignore: cast_nullable_to_non_nullable
as List<String>,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

}


/// Adds pattern-matching-related methods to [BorderFinding].
extension BorderFindingPatterns on BorderFinding {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BorderFinding value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BorderFinding() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BorderFinding value)  $default,){
final _that = this;
switch (_that) {
case _BorderFinding():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BorderFinding value)?  $default,){
final _that = this;
switch (_that) {
case _BorderFinding() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? nodeId,  List<String> maskIds,  double confidence,  Map<String, Object?> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BorderFinding() when $default != null:
return $default(_that.id,_that.nodeId,_that.maskIds,_that.confidence,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? nodeId,  List<String> maskIds,  double confidence,  Map<String, Object?> metadata)  $default,) {final _that = this;
switch (_that) {
case _BorderFinding():
return $default(_that.id,_that.nodeId,_that.maskIds,_that.confidence,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? nodeId,  List<String> maskIds,  double confidence,  Map<String, Object?> metadata)?  $default,) {final _that = this;
switch (_that) {
case _BorderFinding() when $default != null:
return $default(_that.id,_that.nodeId,_that.maskIds,_that.confidence,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BorderFinding implements BorderFinding {
  const _BorderFinding({required this.id, this.nodeId, final  List<String> maskIds = const <String>[], this.confidence = 1.0, final  Map<String, Object?> metadata = const <String, Object?>{}}): assert(confidence >= 0.0 && confidence <= 1.0, 'confidence must be within 0..1'),_maskIds = maskIds,_metadata = metadata;
  factory _BorderFinding.fromJson(Map<String, dynamic> json) => _$BorderFindingFromJson(json);

/// Stable UUID of this finding.
@override final  String id;
/// The proposed tree node carrying this border — id only.
@override final  String? nodeId;
/// Referenced masks — ids only.
 final  List<String> _maskIds;
/// Referenced masks — ids only.
@override@JsonKey() List<String> get maskIds {
  if (_maskIds is EqualUnmodifiableListView) return _maskIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_maskIds);
}

@override@JsonKey() final  double confidence;
 final  Map<String, Object?> _metadata;
@override@JsonKey() Map<String, Object?> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of BorderFinding
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BorderFindingCopyWith<_BorderFinding> get copyWith => __$BorderFindingCopyWithImpl<_BorderFinding>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BorderFindingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BorderFinding&&(identical(other.id, id) || other.id == id)&&(identical(other.nodeId, nodeId) || other.nodeId == nodeId)&&const DeepCollectionEquality().equals(other._maskIds, _maskIds)&&(identical(other.confidence, confidence) || other.confidence == confidence)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nodeId,const DeepCollectionEquality().hash(_maskIds),confidence,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'BorderFinding(id: $id, nodeId: $nodeId, maskIds: $maskIds, confidence: $confidence, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$BorderFindingCopyWith<$Res> implements $BorderFindingCopyWith<$Res> {
  factory _$BorderFindingCopyWith(_BorderFinding value, $Res Function(_BorderFinding) _then) = __$BorderFindingCopyWithImpl;
@override @useResult
$Res call({
 String id, String? nodeId, List<String> maskIds, double confidence, Map<String, Object?> metadata
});




}
/// @nodoc
class __$BorderFindingCopyWithImpl<$Res>
    implements _$BorderFindingCopyWith<$Res> {
  __$BorderFindingCopyWithImpl(this._self, this._then);

  final _BorderFinding _self;
  final $Res Function(_BorderFinding) _then;

/// Create a copy of BorderFinding
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nodeId = freezed,Object? maskIds = null,Object? confidence = null,Object? metadata = null,}) {
  return _then(_BorderFinding(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nodeId: freezed == nodeId ? _self.nodeId : nodeId // ignore: cast_nullable_to_non_nullable
as String?,maskIds: null == maskIds ? _self._maskIds : maskIds // ignore: cast_nullable_to_non_nullable
as List<String>,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}


/// @nodoc
mixin _$InspectionReport {

/// Stable UUID of this report.
 String get id;/// The frozen textile operation the producing analysis ran under
/// (the M12A `AiProposal`/M12E `ExecutionPlan` precedent: the
/// operation travels with the provenance precursors; invariant I6 —
/// carried verbatim, never derived).
@JsonKey(fromJson: _operationFromJson, toJson: _operationToJson) AiOperation get operation;/// Classified garment (frozen vocabulary), null when undetermined.
@JsonKey(fromJson: _garmentFromJson, toJson: _garmentToJson) GarmentType? get garment;/// Confidence of the garment classification (§7).
 double get garmentConfidence;/// Free-text fabric guess (no fabric vocabulary is frozen; a frozen
/// enum would invent vocabulary this slice must not).
 String? get fabricGuess;/// Structure detection findings.
 List<StructureFinding> get structure;/// Pattern/repeat analysis result (frozen vocabulary), null when
/// undetermined.
@JsonKey(fromJson: _repeatFromJson, toJson: _repeatToJson) RepeatType? get pattern;/// Motif segmentation + role classification findings.
 List<MotifFinding> get motifs;/// Border extraction findings.
 List<BorderFinding> get borders;/// Extracted working palette (#RRGGBB — the frozen
/// `PromptContext.paletteHex` convention).
 List<String> get palette;/// Printable/editable region findings — identifier references only.
 List<InspectionRegion> get regions;/// The proposed frozen [DesignNode] subtree ("staged tree
/// population"), null when the analysis proposes no structure.
 DesignNode? get treeProposal;/// Provenance precursors of the producing analysis (invariant I5).
 String get promptHash; String? get templateId;@JsonKey(fromJson: _providerFromJson, toJson: _providerToJson) AiProviderId get provider; String get model; String get constraintVersion; String get toolVersion; Map<String, Object?> get metadata;
/// Create a copy of InspectionReport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InspectionReportCopyWith<InspectionReport> get copyWith => _$InspectionReportCopyWithImpl<InspectionReport>(this as InspectionReport, _$identity);

  /// Serializes this InspectionReport to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InspectionReport&&(identical(other.id, id) || other.id == id)&&(identical(other.operation, operation) || other.operation == operation)&&(identical(other.garment, garment) || other.garment == garment)&&(identical(other.garmentConfidence, garmentConfidence) || other.garmentConfidence == garmentConfidence)&&(identical(other.fabricGuess, fabricGuess) || other.fabricGuess == fabricGuess)&&const DeepCollectionEquality().equals(other.structure, structure)&&(identical(other.pattern, pattern) || other.pattern == pattern)&&const DeepCollectionEquality().equals(other.motifs, motifs)&&const DeepCollectionEquality().equals(other.borders, borders)&&const DeepCollectionEquality().equals(other.palette, palette)&&const DeepCollectionEquality().equals(other.regions, regions)&&(identical(other.treeProposal, treeProposal) || other.treeProposal == treeProposal)&&(identical(other.promptHash, promptHash) || other.promptHash == promptHash)&&(identical(other.templateId, templateId) || other.templateId == templateId)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.model, model) || other.model == model)&&(identical(other.constraintVersion, constraintVersion) || other.constraintVersion == constraintVersion)&&(identical(other.toolVersion, toolVersion) || other.toolVersion == toolVersion)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,operation,garment,garmentConfidence,fabricGuess,const DeepCollectionEquality().hash(structure),pattern,const DeepCollectionEquality().hash(motifs),const DeepCollectionEquality().hash(borders),const DeepCollectionEquality().hash(palette),const DeepCollectionEquality().hash(regions),treeProposal,promptHash,templateId,provider,model,constraintVersion,toolVersion,const DeepCollectionEquality().hash(metadata)]);

@override
String toString() {
  return 'InspectionReport(id: $id, operation: $operation, garment: $garment, garmentConfidence: $garmentConfidence, fabricGuess: $fabricGuess, structure: $structure, pattern: $pattern, motifs: $motifs, borders: $borders, palette: $palette, regions: $regions, treeProposal: $treeProposal, promptHash: $promptHash, templateId: $templateId, provider: $provider, model: $model, constraintVersion: $constraintVersion, toolVersion: $toolVersion, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $InspectionReportCopyWith<$Res>  {
  factory $InspectionReportCopyWith(InspectionReport value, $Res Function(InspectionReport) _then) = _$InspectionReportCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(fromJson: _operationFromJson, toJson: _operationToJson) AiOperation operation,@JsonKey(fromJson: _garmentFromJson, toJson: _garmentToJson) GarmentType? garment, double garmentConfidence, String? fabricGuess, List<StructureFinding> structure,@JsonKey(fromJson: _repeatFromJson, toJson: _repeatToJson) RepeatType? pattern, List<MotifFinding> motifs, List<BorderFinding> borders, List<String> palette, List<InspectionRegion> regions, DesignNode? treeProposal, String promptHash, String? templateId,@JsonKey(fromJson: _providerFromJson, toJson: _providerToJson) AiProviderId provider, String model, String constraintVersion, String toolVersion, Map<String, Object?> metadata
});


$DesignNodeCopyWith<$Res>? get treeProposal;

}
/// @nodoc
class _$InspectionReportCopyWithImpl<$Res>
    implements $InspectionReportCopyWith<$Res> {
  _$InspectionReportCopyWithImpl(this._self, this._then);

  final InspectionReport _self;
  final $Res Function(InspectionReport) _then;

/// Create a copy of InspectionReport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? operation = null,Object? garment = freezed,Object? garmentConfidence = null,Object? fabricGuess = freezed,Object? structure = null,Object? pattern = freezed,Object? motifs = null,Object? borders = null,Object? palette = null,Object? regions = null,Object? treeProposal = freezed,Object? promptHash = null,Object? templateId = freezed,Object? provider = null,Object? model = null,Object? constraintVersion = null,Object? toolVersion = null,Object? metadata = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,operation: null == operation ? _self.operation : operation // ignore: cast_nullable_to_non_nullable
as AiOperation,garment: freezed == garment ? _self.garment : garment // ignore: cast_nullable_to_non_nullable
as GarmentType?,garmentConfidence: null == garmentConfidence ? _self.garmentConfidence : garmentConfidence // ignore: cast_nullable_to_non_nullable
as double,fabricGuess: freezed == fabricGuess ? _self.fabricGuess : fabricGuess // ignore: cast_nullable_to_non_nullable
as String?,structure: null == structure ? _self.structure : structure // ignore: cast_nullable_to_non_nullable
as List<StructureFinding>,pattern: freezed == pattern ? _self.pattern : pattern // ignore: cast_nullable_to_non_nullable
as RepeatType?,motifs: null == motifs ? _self.motifs : motifs // ignore: cast_nullable_to_non_nullable
as List<MotifFinding>,borders: null == borders ? _self.borders : borders // ignore: cast_nullable_to_non_nullable
as List<BorderFinding>,palette: null == palette ? _self.palette : palette // ignore: cast_nullable_to_non_nullable
as List<String>,regions: null == regions ? _self.regions : regions // ignore: cast_nullable_to_non_nullable
as List<InspectionRegion>,treeProposal: freezed == treeProposal ? _self.treeProposal : treeProposal // ignore: cast_nullable_to_non_nullable
as DesignNode?,promptHash: null == promptHash ? _self.promptHash : promptHash // ignore: cast_nullable_to_non_nullable
as String,templateId: freezed == templateId ? _self.templateId : templateId // ignore: cast_nullable_to_non_nullable
as String?,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as AiProviderId,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,constraintVersion: null == constraintVersion ? _self.constraintVersion : constraintVersion // ignore: cast_nullable_to_non_nullable
as String,toolVersion: null == toolVersion ? _self.toolVersion : toolVersion // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}
/// Create a copy of InspectionReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DesignNodeCopyWith<$Res>? get treeProposal {
    if (_self.treeProposal == null) {
    return null;
  }

  return $DesignNodeCopyWith<$Res>(_self.treeProposal!, (value) {
    return _then(_self.copyWith(treeProposal: value));
  });
}
}


/// Adds pattern-matching-related methods to [InspectionReport].
extension InspectionReportPatterns on InspectionReport {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InspectionReport value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InspectionReport() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InspectionReport value)  $default,){
final _that = this;
switch (_that) {
case _InspectionReport():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InspectionReport value)?  $default,){
final _that = this;
switch (_that) {
case _InspectionReport() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(fromJson: _operationFromJson, toJson: _operationToJson)  AiOperation operation, @JsonKey(fromJson: _garmentFromJson, toJson: _garmentToJson)  GarmentType? garment,  double garmentConfidence,  String? fabricGuess,  List<StructureFinding> structure, @JsonKey(fromJson: _repeatFromJson, toJson: _repeatToJson)  RepeatType? pattern,  List<MotifFinding> motifs,  List<BorderFinding> borders,  List<String> palette,  List<InspectionRegion> regions,  DesignNode? treeProposal,  String promptHash,  String? templateId, @JsonKey(fromJson: _providerFromJson, toJson: _providerToJson)  AiProviderId provider,  String model,  String constraintVersion,  String toolVersion,  Map<String, Object?> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InspectionReport() when $default != null:
return $default(_that.id,_that.operation,_that.garment,_that.garmentConfidence,_that.fabricGuess,_that.structure,_that.pattern,_that.motifs,_that.borders,_that.palette,_that.regions,_that.treeProposal,_that.promptHash,_that.templateId,_that.provider,_that.model,_that.constraintVersion,_that.toolVersion,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(fromJson: _operationFromJson, toJson: _operationToJson)  AiOperation operation, @JsonKey(fromJson: _garmentFromJson, toJson: _garmentToJson)  GarmentType? garment,  double garmentConfidence,  String? fabricGuess,  List<StructureFinding> structure, @JsonKey(fromJson: _repeatFromJson, toJson: _repeatToJson)  RepeatType? pattern,  List<MotifFinding> motifs,  List<BorderFinding> borders,  List<String> palette,  List<InspectionRegion> regions,  DesignNode? treeProposal,  String promptHash,  String? templateId, @JsonKey(fromJson: _providerFromJson, toJson: _providerToJson)  AiProviderId provider,  String model,  String constraintVersion,  String toolVersion,  Map<String, Object?> metadata)  $default,) {final _that = this;
switch (_that) {
case _InspectionReport():
return $default(_that.id,_that.operation,_that.garment,_that.garmentConfidence,_that.fabricGuess,_that.structure,_that.pattern,_that.motifs,_that.borders,_that.palette,_that.regions,_that.treeProposal,_that.promptHash,_that.templateId,_that.provider,_that.model,_that.constraintVersion,_that.toolVersion,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(fromJson: _operationFromJson, toJson: _operationToJson)  AiOperation operation, @JsonKey(fromJson: _garmentFromJson, toJson: _garmentToJson)  GarmentType? garment,  double garmentConfidence,  String? fabricGuess,  List<StructureFinding> structure, @JsonKey(fromJson: _repeatFromJson, toJson: _repeatToJson)  RepeatType? pattern,  List<MotifFinding> motifs,  List<BorderFinding> borders,  List<String> palette,  List<InspectionRegion> regions,  DesignNode? treeProposal,  String promptHash,  String? templateId, @JsonKey(fromJson: _providerFromJson, toJson: _providerToJson)  AiProviderId provider,  String model,  String constraintVersion,  String toolVersion,  Map<String, Object?> metadata)?  $default,) {final _that = this;
switch (_that) {
case _InspectionReport() when $default != null:
return $default(_that.id,_that.operation,_that.garment,_that.garmentConfidence,_that.fabricGuess,_that.structure,_that.pattern,_that.motifs,_that.borders,_that.palette,_that.regions,_that.treeProposal,_that.promptHash,_that.templateId,_that.provider,_that.model,_that.constraintVersion,_that.toolVersion,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InspectionReport implements InspectionReport {
  const _InspectionReport({required this.id, @JsonKey(fromJson: _operationFromJson, toJson: _operationToJson) required this.operation, @JsonKey(fromJson: _garmentFromJson, toJson: _garmentToJson) this.garment, this.garmentConfidence = 1.0, this.fabricGuess, final  List<StructureFinding> structure = const <StructureFinding>[], @JsonKey(fromJson: _repeatFromJson, toJson: _repeatToJson) this.pattern, final  List<MotifFinding> motifs = const <MotifFinding>[], final  List<BorderFinding> borders = const <BorderFinding>[], final  List<String> palette = const <String>[], final  List<InspectionRegion> regions = const <InspectionRegion>[], this.treeProposal, required this.promptHash, this.templateId, @JsonKey(fromJson: _providerFromJson, toJson: _providerToJson) required this.provider, required this.model, required this.constraintVersion, required this.toolVersion, final  Map<String, Object?> metadata = const <String, Object?>{}}): assert(garmentConfidence >= 0.0 && garmentConfidence <= 1.0, 'garmentConfidence must be within 0..1'),_structure = structure,_motifs = motifs,_borders = borders,_palette = palette,_regions = regions,_metadata = metadata;
  factory _InspectionReport.fromJson(Map<String, dynamic> json) => _$InspectionReportFromJson(json);

/// Stable UUID of this report.
@override final  String id;
/// The frozen textile operation the producing analysis ran under
/// (the M12A `AiProposal`/M12E `ExecutionPlan` precedent: the
/// operation travels with the provenance precursors; invariant I6 —
/// carried verbatim, never derived).
@override@JsonKey(fromJson: _operationFromJson, toJson: _operationToJson) final  AiOperation operation;
/// Classified garment (frozen vocabulary), null when undetermined.
@override@JsonKey(fromJson: _garmentFromJson, toJson: _garmentToJson) final  GarmentType? garment;
/// Confidence of the garment classification (§7).
@override@JsonKey() final  double garmentConfidence;
/// Free-text fabric guess (no fabric vocabulary is frozen; a frozen
/// enum would invent vocabulary this slice must not).
@override final  String? fabricGuess;
/// Structure detection findings.
 final  List<StructureFinding> _structure;
/// Structure detection findings.
@override@JsonKey() List<StructureFinding> get structure {
  if (_structure is EqualUnmodifiableListView) return _structure;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_structure);
}

/// Pattern/repeat analysis result (frozen vocabulary), null when
/// undetermined.
@override@JsonKey(fromJson: _repeatFromJson, toJson: _repeatToJson) final  RepeatType? pattern;
/// Motif segmentation + role classification findings.
 final  List<MotifFinding> _motifs;
/// Motif segmentation + role classification findings.
@override@JsonKey() List<MotifFinding> get motifs {
  if (_motifs is EqualUnmodifiableListView) return _motifs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_motifs);
}

/// Border extraction findings.
 final  List<BorderFinding> _borders;
/// Border extraction findings.
@override@JsonKey() List<BorderFinding> get borders {
  if (_borders is EqualUnmodifiableListView) return _borders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_borders);
}

/// Extracted working palette (#RRGGBB — the frozen
/// `PromptContext.paletteHex` convention).
 final  List<String> _palette;
/// Extracted working palette (#RRGGBB — the frozen
/// `PromptContext.paletteHex` convention).
@override@JsonKey() List<String> get palette {
  if (_palette is EqualUnmodifiableListView) return _palette;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_palette);
}

/// Printable/editable region findings — identifier references only.
 final  List<InspectionRegion> _regions;
/// Printable/editable region findings — identifier references only.
@override@JsonKey() List<InspectionRegion> get regions {
  if (_regions is EqualUnmodifiableListView) return _regions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_regions);
}

/// The proposed frozen [DesignNode] subtree ("staged tree
/// population"), null when the analysis proposes no structure.
@override final  DesignNode? treeProposal;
/// Provenance precursors of the producing analysis (invariant I5).
@override final  String promptHash;
@override final  String? templateId;
@override@JsonKey(fromJson: _providerFromJson, toJson: _providerToJson) final  AiProviderId provider;
@override final  String model;
@override final  String constraintVersion;
@override final  String toolVersion;
 final  Map<String, Object?> _metadata;
@override@JsonKey() Map<String, Object?> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of InspectionReport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InspectionReportCopyWith<_InspectionReport> get copyWith => __$InspectionReportCopyWithImpl<_InspectionReport>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InspectionReportToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InspectionReport&&(identical(other.id, id) || other.id == id)&&(identical(other.operation, operation) || other.operation == operation)&&(identical(other.garment, garment) || other.garment == garment)&&(identical(other.garmentConfidence, garmentConfidence) || other.garmentConfidence == garmentConfidence)&&(identical(other.fabricGuess, fabricGuess) || other.fabricGuess == fabricGuess)&&const DeepCollectionEquality().equals(other._structure, _structure)&&(identical(other.pattern, pattern) || other.pattern == pattern)&&const DeepCollectionEquality().equals(other._motifs, _motifs)&&const DeepCollectionEquality().equals(other._borders, _borders)&&const DeepCollectionEquality().equals(other._palette, _palette)&&const DeepCollectionEquality().equals(other._regions, _regions)&&(identical(other.treeProposal, treeProposal) || other.treeProposal == treeProposal)&&(identical(other.promptHash, promptHash) || other.promptHash == promptHash)&&(identical(other.templateId, templateId) || other.templateId == templateId)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.model, model) || other.model == model)&&(identical(other.constraintVersion, constraintVersion) || other.constraintVersion == constraintVersion)&&(identical(other.toolVersion, toolVersion) || other.toolVersion == toolVersion)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,operation,garment,garmentConfidence,fabricGuess,const DeepCollectionEquality().hash(_structure),pattern,const DeepCollectionEquality().hash(_motifs),const DeepCollectionEquality().hash(_borders),const DeepCollectionEquality().hash(_palette),const DeepCollectionEquality().hash(_regions),treeProposal,promptHash,templateId,provider,model,constraintVersion,toolVersion,const DeepCollectionEquality().hash(_metadata)]);

@override
String toString() {
  return 'InspectionReport(id: $id, operation: $operation, garment: $garment, garmentConfidence: $garmentConfidence, fabricGuess: $fabricGuess, structure: $structure, pattern: $pattern, motifs: $motifs, borders: $borders, palette: $palette, regions: $regions, treeProposal: $treeProposal, promptHash: $promptHash, templateId: $templateId, provider: $provider, model: $model, constraintVersion: $constraintVersion, toolVersion: $toolVersion, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$InspectionReportCopyWith<$Res> implements $InspectionReportCopyWith<$Res> {
  factory _$InspectionReportCopyWith(_InspectionReport value, $Res Function(_InspectionReport) _then) = __$InspectionReportCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(fromJson: _operationFromJson, toJson: _operationToJson) AiOperation operation,@JsonKey(fromJson: _garmentFromJson, toJson: _garmentToJson) GarmentType? garment, double garmentConfidence, String? fabricGuess, List<StructureFinding> structure,@JsonKey(fromJson: _repeatFromJson, toJson: _repeatToJson) RepeatType? pattern, List<MotifFinding> motifs, List<BorderFinding> borders, List<String> palette, List<InspectionRegion> regions, DesignNode? treeProposal, String promptHash, String? templateId,@JsonKey(fromJson: _providerFromJson, toJson: _providerToJson) AiProviderId provider, String model, String constraintVersion, String toolVersion, Map<String, Object?> metadata
});


@override $DesignNodeCopyWith<$Res>? get treeProposal;

}
/// @nodoc
class __$InspectionReportCopyWithImpl<$Res>
    implements _$InspectionReportCopyWith<$Res> {
  __$InspectionReportCopyWithImpl(this._self, this._then);

  final _InspectionReport _self;
  final $Res Function(_InspectionReport) _then;

/// Create a copy of InspectionReport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? operation = null,Object? garment = freezed,Object? garmentConfidence = null,Object? fabricGuess = freezed,Object? structure = null,Object? pattern = freezed,Object? motifs = null,Object? borders = null,Object? palette = null,Object? regions = null,Object? treeProposal = freezed,Object? promptHash = null,Object? templateId = freezed,Object? provider = null,Object? model = null,Object? constraintVersion = null,Object? toolVersion = null,Object? metadata = null,}) {
  return _then(_InspectionReport(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,operation: null == operation ? _self.operation : operation // ignore: cast_nullable_to_non_nullable
as AiOperation,garment: freezed == garment ? _self.garment : garment // ignore: cast_nullable_to_non_nullable
as GarmentType?,garmentConfidence: null == garmentConfidence ? _self.garmentConfidence : garmentConfidence // ignore: cast_nullable_to_non_nullable
as double,fabricGuess: freezed == fabricGuess ? _self.fabricGuess : fabricGuess // ignore: cast_nullable_to_non_nullable
as String?,structure: null == structure ? _self._structure : structure // ignore: cast_nullable_to_non_nullable
as List<StructureFinding>,pattern: freezed == pattern ? _self.pattern : pattern // ignore: cast_nullable_to_non_nullable
as RepeatType?,motifs: null == motifs ? _self._motifs : motifs // ignore: cast_nullable_to_non_nullable
as List<MotifFinding>,borders: null == borders ? _self._borders : borders // ignore: cast_nullable_to_non_nullable
as List<BorderFinding>,palette: null == palette ? _self._palette : palette // ignore: cast_nullable_to_non_nullable
as List<String>,regions: null == regions ? _self._regions : regions // ignore: cast_nullable_to_non_nullable
as List<InspectionRegion>,treeProposal: freezed == treeProposal ? _self.treeProposal : treeProposal // ignore: cast_nullable_to_non_nullable
as DesignNode?,promptHash: null == promptHash ? _self.promptHash : promptHash // ignore: cast_nullable_to_non_nullable
as String,templateId: freezed == templateId ? _self.templateId : templateId // ignore: cast_nullable_to_non_nullable
as String?,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as AiProviderId,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,constraintVersion: null == constraintVersion ? _self.constraintVersion : constraintVersion // ignore: cast_nullable_to_non_nullable
as String,toolVersion: null == toolVersion ? _self.toolVersion : toolVersion // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

/// Create a copy of InspectionReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DesignNodeCopyWith<$Res>? get treeProposal {
    if (_self.treeProposal == null) {
    return null;
  }

  return $DesignNodeCopyWith<$Res>(_self.treeProposal!, (value) {
    return _then(_self.copyWith(treeProposal: value));
  });
}
}

// dart format on
