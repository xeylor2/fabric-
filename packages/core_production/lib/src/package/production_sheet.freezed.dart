// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'production_sheet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductionSheet {

/// The job this sheet documents.
 String get jobId; ProductionDeliverable get deliverable;/// Exact physical output size + unit + DPI (§12: always embedded).
 Size2D get physicalSize;@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) MeasurementUnit get unit; double get dpi;/// The produced document — id + revision (the provenance ledger is
/// document-owned and reachable through this pair).
 String get documentId; RevisionId get revision;/// The produced artboards — ids only.
 List<String> get artboardIds;/// The preflight verdict (embedded own-stage value).
 PreflightReport get preflight;/// Render provenance (embeds the target; pins the graph identity).
 ReproducibilityRecord get reproducibility;/// Colour outcome: profile references + the measured report.
 String get colourProfileId; String? get printProfileId; GamutReport get gamutReport;/// The encode work orders and their typed fates, in selection order.
 List<EncodeRequest> get encodeRequests; List<EncodeResult> get encodeResults;/// Version of the assembler that produced this sheet (the frozen
/// provenance-versioning precedent).
 String get sheetVersion; Map<String, Object?> get metadata;
/// Create a copy of ProductionSheet
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductionSheetCopyWith<ProductionSheet> get copyWith => _$ProductionSheetCopyWithImpl<ProductionSheet>(this as ProductionSheet, _$identity);

  /// Serializes this ProductionSheet to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductionSheet&&(identical(other.jobId, jobId) || other.jobId == jobId)&&(identical(other.deliverable, deliverable) || other.deliverable == deliverable)&&(identical(other.physicalSize, physicalSize) || other.physicalSize == physicalSize)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.dpi, dpi) || other.dpi == dpi)&&(identical(other.documentId, documentId) || other.documentId == documentId)&&(identical(other.revision, revision) || other.revision == revision)&&const DeepCollectionEquality().equals(other.artboardIds, artboardIds)&&(identical(other.preflight, preflight) || other.preflight == preflight)&&(identical(other.reproducibility, reproducibility) || other.reproducibility == reproducibility)&&(identical(other.colourProfileId, colourProfileId) || other.colourProfileId == colourProfileId)&&(identical(other.printProfileId, printProfileId) || other.printProfileId == printProfileId)&&(identical(other.gamutReport, gamutReport) || other.gamutReport == gamutReport)&&const DeepCollectionEquality().equals(other.encodeRequests, encodeRequests)&&const DeepCollectionEquality().equals(other.encodeResults, encodeResults)&&(identical(other.sheetVersion, sheetVersion) || other.sheetVersion == sheetVersion)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,jobId,deliverable,physicalSize,unit,dpi,documentId,revision,const DeepCollectionEquality().hash(artboardIds),preflight,reproducibility,colourProfileId,printProfileId,gamutReport,const DeepCollectionEquality().hash(encodeRequests),const DeepCollectionEquality().hash(encodeResults),sheetVersion,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'ProductionSheet(jobId: $jobId, deliverable: $deliverable, physicalSize: $physicalSize, unit: $unit, dpi: $dpi, documentId: $documentId, revision: $revision, artboardIds: $artboardIds, preflight: $preflight, reproducibility: $reproducibility, colourProfileId: $colourProfileId, printProfileId: $printProfileId, gamutReport: $gamutReport, encodeRequests: $encodeRequests, encodeResults: $encodeResults, sheetVersion: $sheetVersion, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $ProductionSheetCopyWith<$Res>  {
  factory $ProductionSheetCopyWith(ProductionSheet value, $Res Function(ProductionSheet) _then) = _$ProductionSheetCopyWithImpl;
@useResult
$Res call({
 String jobId, ProductionDeliverable deliverable, Size2D physicalSize,@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) MeasurementUnit unit, double dpi, String documentId, RevisionId revision, List<String> artboardIds, PreflightReport preflight, ReproducibilityRecord reproducibility, String colourProfileId, String? printProfileId, GamutReport gamutReport, List<EncodeRequest> encodeRequests, List<EncodeResult> encodeResults, String sheetVersion, Map<String, Object?> metadata
});


$Size2DCopyWith<$Res> get physicalSize;$RevisionIdCopyWith<$Res> get revision;$PreflightReportCopyWith<$Res> get preflight;$ReproducibilityRecordCopyWith<$Res> get reproducibility;$GamutReportCopyWith<$Res> get gamutReport;

}
/// @nodoc
class _$ProductionSheetCopyWithImpl<$Res>
    implements $ProductionSheetCopyWith<$Res> {
  _$ProductionSheetCopyWithImpl(this._self, this._then);

  final ProductionSheet _self;
  final $Res Function(ProductionSheet) _then;

/// Create a copy of ProductionSheet
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? jobId = null,Object? deliverable = null,Object? physicalSize = null,Object? unit = null,Object? dpi = null,Object? documentId = null,Object? revision = null,Object? artboardIds = null,Object? preflight = null,Object? reproducibility = null,Object? colourProfileId = null,Object? printProfileId = freezed,Object? gamutReport = null,Object? encodeRequests = null,Object? encodeResults = null,Object? sheetVersion = null,Object? metadata = null,}) {
  return _then(_self.copyWith(
jobId: null == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as String,deliverable: null == deliverable ? _self.deliverable : deliverable // ignore: cast_nullable_to_non_nullable
as ProductionDeliverable,physicalSize: null == physicalSize ? _self.physicalSize : physicalSize // ignore: cast_nullable_to_non_nullable
as Size2D,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as MeasurementUnit,dpi: null == dpi ? _self.dpi : dpi // ignore: cast_nullable_to_non_nullable
as double,documentId: null == documentId ? _self.documentId : documentId // ignore: cast_nullable_to_non_nullable
as String,revision: null == revision ? _self.revision : revision // ignore: cast_nullable_to_non_nullable
as RevisionId,artboardIds: null == artboardIds ? _self.artboardIds : artboardIds // ignore: cast_nullable_to_non_nullable
as List<String>,preflight: null == preflight ? _self.preflight : preflight // ignore: cast_nullable_to_non_nullable
as PreflightReport,reproducibility: null == reproducibility ? _self.reproducibility : reproducibility // ignore: cast_nullable_to_non_nullable
as ReproducibilityRecord,colourProfileId: null == colourProfileId ? _self.colourProfileId : colourProfileId // ignore: cast_nullable_to_non_nullable
as String,printProfileId: freezed == printProfileId ? _self.printProfileId : printProfileId // ignore: cast_nullable_to_non_nullable
as String?,gamutReport: null == gamutReport ? _self.gamutReport : gamutReport // ignore: cast_nullable_to_non_nullable
as GamutReport,encodeRequests: null == encodeRequests ? _self.encodeRequests : encodeRequests // ignore: cast_nullable_to_non_nullable
as List<EncodeRequest>,encodeResults: null == encodeResults ? _self.encodeResults : encodeResults // ignore: cast_nullable_to_non_nullable
as List<EncodeResult>,sheetVersion: null == sheetVersion ? _self.sheetVersion : sheetVersion // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}
/// Create a copy of ProductionSheet
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Size2DCopyWith<$Res> get physicalSize {
  
  return $Size2DCopyWith<$Res>(_self.physicalSize, (value) {
    return _then(_self.copyWith(physicalSize: value));
  });
}/// Create a copy of ProductionSheet
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RevisionIdCopyWith<$Res> get revision {
  
  return $RevisionIdCopyWith<$Res>(_self.revision, (value) {
    return _then(_self.copyWith(revision: value));
  });
}/// Create a copy of ProductionSheet
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PreflightReportCopyWith<$Res> get preflight {
  
  return $PreflightReportCopyWith<$Res>(_self.preflight, (value) {
    return _then(_self.copyWith(preflight: value));
  });
}/// Create a copy of ProductionSheet
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReproducibilityRecordCopyWith<$Res> get reproducibility {
  
  return $ReproducibilityRecordCopyWith<$Res>(_self.reproducibility, (value) {
    return _then(_self.copyWith(reproducibility: value));
  });
}/// Create a copy of ProductionSheet
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GamutReportCopyWith<$Res> get gamutReport {
  
  return $GamutReportCopyWith<$Res>(_self.gamutReport, (value) {
    return _then(_self.copyWith(gamutReport: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProductionSheet].
extension ProductionSheetPatterns on ProductionSheet {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductionSheet value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductionSheet() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductionSheet value)  $default,){
final _that = this;
switch (_that) {
case _ProductionSheet():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductionSheet value)?  $default,){
final _that = this;
switch (_that) {
case _ProductionSheet() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String jobId,  ProductionDeliverable deliverable,  Size2D physicalSize, @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson)  MeasurementUnit unit,  double dpi,  String documentId,  RevisionId revision,  List<String> artboardIds,  PreflightReport preflight,  ReproducibilityRecord reproducibility,  String colourProfileId,  String? printProfileId,  GamutReport gamutReport,  List<EncodeRequest> encodeRequests,  List<EncodeResult> encodeResults,  String sheetVersion,  Map<String, Object?> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductionSheet() when $default != null:
return $default(_that.jobId,_that.deliverable,_that.physicalSize,_that.unit,_that.dpi,_that.documentId,_that.revision,_that.artboardIds,_that.preflight,_that.reproducibility,_that.colourProfileId,_that.printProfileId,_that.gamutReport,_that.encodeRequests,_that.encodeResults,_that.sheetVersion,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String jobId,  ProductionDeliverable deliverable,  Size2D physicalSize, @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson)  MeasurementUnit unit,  double dpi,  String documentId,  RevisionId revision,  List<String> artboardIds,  PreflightReport preflight,  ReproducibilityRecord reproducibility,  String colourProfileId,  String? printProfileId,  GamutReport gamutReport,  List<EncodeRequest> encodeRequests,  List<EncodeResult> encodeResults,  String sheetVersion,  Map<String, Object?> metadata)  $default,) {final _that = this;
switch (_that) {
case _ProductionSheet():
return $default(_that.jobId,_that.deliverable,_that.physicalSize,_that.unit,_that.dpi,_that.documentId,_that.revision,_that.artboardIds,_that.preflight,_that.reproducibility,_that.colourProfileId,_that.printProfileId,_that.gamutReport,_that.encodeRequests,_that.encodeResults,_that.sheetVersion,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String jobId,  ProductionDeliverable deliverable,  Size2D physicalSize, @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson)  MeasurementUnit unit,  double dpi,  String documentId,  RevisionId revision,  List<String> artboardIds,  PreflightReport preflight,  ReproducibilityRecord reproducibility,  String colourProfileId,  String? printProfileId,  GamutReport gamutReport,  List<EncodeRequest> encodeRequests,  List<EncodeResult> encodeResults,  String sheetVersion,  Map<String, Object?> metadata)?  $default,) {final _that = this;
switch (_that) {
case _ProductionSheet() when $default != null:
return $default(_that.jobId,_that.deliverable,_that.physicalSize,_that.unit,_that.dpi,_that.documentId,_that.revision,_that.artboardIds,_that.preflight,_that.reproducibility,_that.colourProfileId,_that.printProfileId,_that.gamutReport,_that.encodeRequests,_that.encodeResults,_that.sheetVersion,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductionSheet extends ProductionSheet {
  const _ProductionSheet({required this.jobId, required this.deliverable, required this.physicalSize, @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) required this.unit, required this.dpi, required this.documentId, required this.revision, final  List<String> artboardIds = const <String>[], required this.preflight, required this.reproducibility, required this.colourProfileId, this.printProfileId, required this.gamutReport, final  List<EncodeRequest> encodeRequests = const <EncodeRequest>[], final  List<EncodeResult> encodeResults = const <EncodeResult>[], required this.sheetVersion, final  Map<String, Object?> metadata = const <String, Object?>{}}): _artboardIds = artboardIds,_encodeRequests = encodeRequests,_encodeResults = encodeResults,_metadata = metadata,super._();
  factory _ProductionSheet.fromJson(Map<String, dynamic> json) => _$ProductionSheetFromJson(json);

/// The job this sheet documents.
@override final  String jobId;
@override final  ProductionDeliverable deliverable;
/// Exact physical output size + unit + DPI (§12: always embedded).
@override final  Size2D physicalSize;
@override@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) final  MeasurementUnit unit;
@override final  double dpi;
/// The produced document — id + revision (the provenance ledger is
/// document-owned and reachable through this pair).
@override final  String documentId;
@override final  RevisionId revision;
/// The produced artboards — ids only.
 final  List<String> _artboardIds;
/// The produced artboards — ids only.
@override@JsonKey() List<String> get artboardIds {
  if (_artboardIds is EqualUnmodifiableListView) return _artboardIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_artboardIds);
}

/// The preflight verdict (embedded own-stage value).
@override final  PreflightReport preflight;
/// Render provenance (embeds the target; pins the graph identity).
@override final  ReproducibilityRecord reproducibility;
/// Colour outcome: profile references + the measured report.
@override final  String colourProfileId;
@override final  String? printProfileId;
@override final  GamutReport gamutReport;
/// The encode work orders and their typed fates, in selection order.
 final  List<EncodeRequest> _encodeRequests;
/// The encode work orders and their typed fates, in selection order.
@override@JsonKey() List<EncodeRequest> get encodeRequests {
  if (_encodeRequests is EqualUnmodifiableListView) return _encodeRequests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_encodeRequests);
}

 final  List<EncodeResult> _encodeResults;
@override@JsonKey() List<EncodeResult> get encodeResults {
  if (_encodeResults is EqualUnmodifiableListView) return _encodeResults;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_encodeResults);
}

/// Version of the assembler that produced this sheet (the frozen
/// provenance-versioning precedent).
@override final  String sheetVersion;
 final  Map<String, Object?> _metadata;
@override@JsonKey() Map<String, Object?> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of ProductionSheet
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductionSheetCopyWith<_ProductionSheet> get copyWith => __$ProductionSheetCopyWithImpl<_ProductionSheet>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductionSheetToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductionSheet&&(identical(other.jobId, jobId) || other.jobId == jobId)&&(identical(other.deliverable, deliverable) || other.deliverable == deliverable)&&(identical(other.physicalSize, physicalSize) || other.physicalSize == physicalSize)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.dpi, dpi) || other.dpi == dpi)&&(identical(other.documentId, documentId) || other.documentId == documentId)&&(identical(other.revision, revision) || other.revision == revision)&&const DeepCollectionEquality().equals(other._artboardIds, _artboardIds)&&(identical(other.preflight, preflight) || other.preflight == preflight)&&(identical(other.reproducibility, reproducibility) || other.reproducibility == reproducibility)&&(identical(other.colourProfileId, colourProfileId) || other.colourProfileId == colourProfileId)&&(identical(other.printProfileId, printProfileId) || other.printProfileId == printProfileId)&&(identical(other.gamutReport, gamutReport) || other.gamutReport == gamutReport)&&const DeepCollectionEquality().equals(other._encodeRequests, _encodeRequests)&&const DeepCollectionEquality().equals(other._encodeResults, _encodeResults)&&(identical(other.sheetVersion, sheetVersion) || other.sheetVersion == sheetVersion)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,jobId,deliverable,physicalSize,unit,dpi,documentId,revision,const DeepCollectionEquality().hash(_artboardIds),preflight,reproducibility,colourProfileId,printProfileId,gamutReport,const DeepCollectionEquality().hash(_encodeRequests),const DeepCollectionEquality().hash(_encodeResults),sheetVersion,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'ProductionSheet(jobId: $jobId, deliverable: $deliverable, physicalSize: $physicalSize, unit: $unit, dpi: $dpi, documentId: $documentId, revision: $revision, artboardIds: $artboardIds, preflight: $preflight, reproducibility: $reproducibility, colourProfileId: $colourProfileId, printProfileId: $printProfileId, gamutReport: $gamutReport, encodeRequests: $encodeRequests, encodeResults: $encodeResults, sheetVersion: $sheetVersion, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$ProductionSheetCopyWith<$Res> implements $ProductionSheetCopyWith<$Res> {
  factory _$ProductionSheetCopyWith(_ProductionSheet value, $Res Function(_ProductionSheet) _then) = __$ProductionSheetCopyWithImpl;
@override @useResult
$Res call({
 String jobId, ProductionDeliverable deliverable, Size2D physicalSize,@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) MeasurementUnit unit, double dpi, String documentId, RevisionId revision, List<String> artboardIds, PreflightReport preflight, ReproducibilityRecord reproducibility, String colourProfileId, String? printProfileId, GamutReport gamutReport, List<EncodeRequest> encodeRequests, List<EncodeResult> encodeResults, String sheetVersion, Map<String, Object?> metadata
});


@override $Size2DCopyWith<$Res> get physicalSize;@override $RevisionIdCopyWith<$Res> get revision;@override $PreflightReportCopyWith<$Res> get preflight;@override $ReproducibilityRecordCopyWith<$Res> get reproducibility;@override $GamutReportCopyWith<$Res> get gamutReport;

}
/// @nodoc
class __$ProductionSheetCopyWithImpl<$Res>
    implements _$ProductionSheetCopyWith<$Res> {
  __$ProductionSheetCopyWithImpl(this._self, this._then);

  final _ProductionSheet _self;
  final $Res Function(_ProductionSheet) _then;

/// Create a copy of ProductionSheet
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? jobId = null,Object? deliverable = null,Object? physicalSize = null,Object? unit = null,Object? dpi = null,Object? documentId = null,Object? revision = null,Object? artboardIds = null,Object? preflight = null,Object? reproducibility = null,Object? colourProfileId = null,Object? printProfileId = freezed,Object? gamutReport = null,Object? encodeRequests = null,Object? encodeResults = null,Object? sheetVersion = null,Object? metadata = null,}) {
  return _then(_ProductionSheet(
jobId: null == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as String,deliverable: null == deliverable ? _self.deliverable : deliverable // ignore: cast_nullable_to_non_nullable
as ProductionDeliverable,physicalSize: null == physicalSize ? _self.physicalSize : physicalSize // ignore: cast_nullable_to_non_nullable
as Size2D,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as MeasurementUnit,dpi: null == dpi ? _self.dpi : dpi // ignore: cast_nullable_to_non_nullable
as double,documentId: null == documentId ? _self.documentId : documentId // ignore: cast_nullable_to_non_nullable
as String,revision: null == revision ? _self.revision : revision // ignore: cast_nullable_to_non_nullable
as RevisionId,artboardIds: null == artboardIds ? _self._artboardIds : artboardIds // ignore: cast_nullable_to_non_nullable
as List<String>,preflight: null == preflight ? _self.preflight : preflight // ignore: cast_nullable_to_non_nullable
as PreflightReport,reproducibility: null == reproducibility ? _self.reproducibility : reproducibility // ignore: cast_nullable_to_non_nullable
as ReproducibilityRecord,colourProfileId: null == colourProfileId ? _self.colourProfileId : colourProfileId // ignore: cast_nullable_to_non_nullable
as String,printProfileId: freezed == printProfileId ? _self.printProfileId : printProfileId // ignore: cast_nullable_to_non_nullable
as String?,gamutReport: null == gamutReport ? _self.gamutReport : gamutReport // ignore: cast_nullable_to_non_nullable
as GamutReport,encodeRequests: null == encodeRequests ? _self._encodeRequests : encodeRequests // ignore: cast_nullable_to_non_nullable
as List<EncodeRequest>,encodeResults: null == encodeResults ? _self._encodeResults : encodeResults // ignore: cast_nullable_to_non_nullable
as List<EncodeResult>,sheetVersion: null == sheetVersion ? _self.sheetVersion : sheetVersion // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

/// Create a copy of ProductionSheet
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Size2DCopyWith<$Res> get physicalSize {
  
  return $Size2DCopyWith<$Res>(_self.physicalSize, (value) {
    return _then(_self.copyWith(physicalSize: value));
  });
}/// Create a copy of ProductionSheet
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RevisionIdCopyWith<$Res> get revision {
  
  return $RevisionIdCopyWith<$Res>(_self.revision, (value) {
    return _then(_self.copyWith(revision: value));
  });
}/// Create a copy of ProductionSheet
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PreflightReportCopyWith<$Res> get preflight {
  
  return $PreflightReportCopyWith<$Res>(_self.preflight, (value) {
    return _then(_self.copyWith(preflight: value));
  });
}/// Create a copy of ProductionSheet
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReproducibilityRecordCopyWith<$Res> get reproducibility {
  
  return $ReproducibilityRecordCopyWith<$Res>(_self.reproducibility, (value) {
    return _then(_self.copyWith(reproducibility: value));
  });
}/// Create a copy of ProductionSheet
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GamutReportCopyWith<$Res> get gamutReport {
  
  return $GamutReportCopyWith<$Res>(_self.gamutReport, (value) {
    return _then(_self.copyWith(gamutReport: value));
  });
}
}

// dart format on
