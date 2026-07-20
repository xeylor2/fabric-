// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'production_colour_bridge.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductionColourPlan {

/// The job this plan colours.
 String get jobId;/// The frozen `ColourProfile` governing the conversion — id only.
 String get colourProfileId;/// The frozen `PrintProfile` (physical output intent) — id only,
/// when the mill target is declared.
 String? get printProfileId;/// The work order for the colour-science slices (synchronous seam;
/// the approved execution-shape determination).
 ColourTransformRequest get request;/// The measured report — null until a transformer runs (later
/// slices; "soft-proofing" and stage advancement follow it).
 GamutReport? get gamutReport; Map<String, Object?> get metadata;
/// Create a copy of ProductionColourPlan
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductionColourPlanCopyWith<ProductionColourPlan> get copyWith => _$ProductionColourPlanCopyWithImpl<ProductionColourPlan>(this as ProductionColourPlan, _$identity);

  /// Serializes this ProductionColourPlan to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductionColourPlan&&(identical(other.jobId, jobId) || other.jobId == jobId)&&(identical(other.colourProfileId, colourProfileId) || other.colourProfileId == colourProfileId)&&(identical(other.printProfileId, printProfileId) || other.printProfileId == printProfileId)&&(identical(other.request, request) || other.request == request)&&(identical(other.gamutReport, gamutReport) || other.gamutReport == gamutReport)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,jobId,colourProfileId,printProfileId,request,gamutReport,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'ProductionColourPlan(jobId: $jobId, colourProfileId: $colourProfileId, printProfileId: $printProfileId, request: $request, gamutReport: $gamutReport, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $ProductionColourPlanCopyWith<$Res>  {
  factory $ProductionColourPlanCopyWith(ProductionColourPlan value, $Res Function(ProductionColourPlan) _then) = _$ProductionColourPlanCopyWithImpl;
@useResult
$Res call({
 String jobId, String colourProfileId, String? printProfileId, ColourTransformRequest request, GamutReport? gamutReport, Map<String, Object?> metadata
});


$ColourTransformRequestCopyWith<$Res> get request;$GamutReportCopyWith<$Res>? get gamutReport;

}
/// @nodoc
class _$ProductionColourPlanCopyWithImpl<$Res>
    implements $ProductionColourPlanCopyWith<$Res> {
  _$ProductionColourPlanCopyWithImpl(this._self, this._then);

  final ProductionColourPlan _self;
  final $Res Function(ProductionColourPlan) _then;

/// Create a copy of ProductionColourPlan
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? jobId = null,Object? colourProfileId = null,Object? printProfileId = freezed,Object? request = null,Object? gamutReport = freezed,Object? metadata = null,}) {
  return _then(_self.copyWith(
jobId: null == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as String,colourProfileId: null == colourProfileId ? _self.colourProfileId : colourProfileId // ignore: cast_nullable_to_non_nullable
as String,printProfileId: freezed == printProfileId ? _self.printProfileId : printProfileId // ignore: cast_nullable_to_non_nullable
as String?,request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as ColourTransformRequest,gamutReport: freezed == gamutReport ? _self.gamutReport : gamutReport // ignore: cast_nullable_to_non_nullable
as GamutReport?,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}
/// Create a copy of ProductionColourPlan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ColourTransformRequestCopyWith<$Res> get request {
  
  return $ColourTransformRequestCopyWith<$Res>(_self.request, (value) {
    return _then(_self.copyWith(request: value));
  });
}/// Create a copy of ProductionColourPlan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GamutReportCopyWith<$Res>? get gamutReport {
    if (_self.gamutReport == null) {
    return null;
  }

  return $GamutReportCopyWith<$Res>(_self.gamutReport!, (value) {
    return _then(_self.copyWith(gamutReport: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProductionColourPlan].
extension ProductionColourPlanPatterns on ProductionColourPlan {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductionColourPlan value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductionColourPlan() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductionColourPlan value)  $default,){
final _that = this;
switch (_that) {
case _ProductionColourPlan():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductionColourPlan value)?  $default,){
final _that = this;
switch (_that) {
case _ProductionColourPlan() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String jobId,  String colourProfileId,  String? printProfileId,  ColourTransformRequest request,  GamutReport? gamutReport,  Map<String, Object?> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductionColourPlan() when $default != null:
return $default(_that.jobId,_that.colourProfileId,_that.printProfileId,_that.request,_that.gamutReport,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String jobId,  String colourProfileId,  String? printProfileId,  ColourTransformRequest request,  GamutReport? gamutReport,  Map<String, Object?> metadata)  $default,) {final _that = this;
switch (_that) {
case _ProductionColourPlan():
return $default(_that.jobId,_that.colourProfileId,_that.printProfileId,_that.request,_that.gamutReport,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String jobId,  String colourProfileId,  String? printProfileId,  ColourTransformRequest request,  GamutReport? gamutReport,  Map<String, Object?> metadata)?  $default,) {final _that = this;
switch (_that) {
case _ProductionColourPlan() when $default != null:
return $default(_that.jobId,_that.colourProfileId,_that.printProfileId,_that.request,_that.gamutReport,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductionColourPlan implements ProductionColourPlan {
  const _ProductionColourPlan({required this.jobId, required this.colourProfileId, this.printProfileId, required this.request, this.gamutReport, final  Map<String, Object?> metadata = const <String, Object?>{}}): _metadata = metadata;
  factory _ProductionColourPlan.fromJson(Map<String, dynamic> json) => _$ProductionColourPlanFromJson(json);

/// The job this plan colours.
@override final  String jobId;
/// The frozen `ColourProfile` governing the conversion — id only.
@override final  String colourProfileId;
/// The frozen `PrintProfile` (physical output intent) — id only,
/// when the mill target is declared.
@override final  String? printProfileId;
/// The work order for the colour-science slices (synchronous seam;
/// the approved execution-shape determination).
@override final  ColourTransformRequest request;
/// The measured report — null until a transformer runs (later
/// slices; "soft-proofing" and stage advancement follow it).
@override final  GamutReport? gamutReport;
 final  Map<String, Object?> _metadata;
@override@JsonKey() Map<String, Object?> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of ProductionColourPlan
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductionColourPlanCopyWith<_ProductionColourPlan> get copyWith => __$ProductionColourPlanCopyWithImpl<_ProductionColourPlan>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductionColourPlanToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductionColourPlan&&(identical(other.jobId, jobId) || other.jobId == jobId)&&(identical(other.colourProfileId, colourProfileId) || other.colourProfileId == colourProfileId)&&(identical(other.printProfileId, printProfileId) || other.printProfileId == printProfileId)&&(identical(other.request, request) || other.request == request)&&(identical(other.gamutReport, gamutReport) || other.gamutReport == gamutReport)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,jobId,colourProfileId,printProfileId,request,gamutReport,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'ProductionColourPlan(jobId: $jobId, colourProfileId: $colourProfileId, printProfileId: $printProfileId, request: $request, gamutReport: $gamutReport, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$ProductionColourPlanCopyWith<$Res> implements $ProductionColourPlanCopyWith<$Res> {
  factory _$ProductionColourPlanCopyWith(_ProductionColourPlan value, $Res Function(_ProductionColourPlan) _then) = __$ProductionColourPlanCopyWithImpl;
@override @useResult
$Res call({
 String jobId, String colourProfileId, String? printProfileId, ColourTransformRequest request, GamutReport? gamutReport, Map<String, Object?> metadata
});


@override $ColourTransformRequestCopyWith<$Res> get request;@override $GamutReportCopyWith<$Res>? get gamutReport;

}
/// @nodoc
class __$ProductionColourPlanCopyWithImpl<$Res>
    implements _$ProductionColourPlanCopyWith<$Res> {
  __$ProductionColourPlanCopyWithImpl(this._self, this._then);

  final _ProductionColourPlan _self;
  final $Res Function(_ProductionColourPlan) _then;

/// Create a copy of ProductionColourPlan
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? jobId = null,Object? colourProfileId = null,Object? printProfileId = freezed,Object? request = null,Object? gamutReport = freezed,Object? metadata = null,}) {
  return _then(_ProductionColourPlan(
jobId: null == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as String,colourProfileId: null == colourProfileId ? _self.colourProfileId : colourProfileId // ignore: cast_nullable_to_non_nullable
as String,printProfileId: freezed == printProfileId ? _self.printProfileId : printProfileId // ignore: cast_nullable_to_non_nullable
as String?,request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as ColourTransformRequest,gamutReport: freezed == gamutReport ? _self.gamutReport : gamutReport // ignore: cast_nullable_to_non_nullable
as GamutReport?,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

/// Create a copy of ProductionColourPlan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ColourTransformRequestCopyWith<$Res> get request {
  
  return $ColourTransformRequestCopyWith<$Res>(_self.request, (value) {
    return _then(_self.copyWith(request: value));
  });
}/// Create a copy of ProductionColourPlan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GamutReportCopyWith<$Res>? get gamutReport {
    if (_self.gamutReport == null) {
    return null;
  }

  return $GamutReportCopyWith<$Res>(_self.gamutReport!, (value) {
    return _then(_self.copyWith(gamutReport: value));
  });
}
}

// dart format on
