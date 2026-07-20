// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'colour_transform.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GamutFinding {

/// The colour or region this finding measures — an id or #RRGGBB
/// reference (the established wire convention), never a resolved
/// object.
 String get reference;/// Measured colour difference (reported data — computed by the ICC
/// implementations behind the transform seam, never here).
 double get deltaE;/// Whether the referenced colour maps inside the target gamut.
 bool get inGamut; Map<String, Object?> get metadata;
/// Create a copy of GamutFinding
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GamutFindingCopyWith<GamutFinding> get copyWith => _$GamutFindingCopyWithImpl<GamutFinding>(this as GamutFinding, _$identity);

  /// Serializes this GamutFinding to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GamutFinding&&(identical(other.reference, reference) || other.reference == reference)&&(identical(other.deltaE, deltaE) || other.deltaE == deltaE)&&(identical(other.inGamut, inGamut) || other.inGamut == inGamut)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reference,deltaE,inGamut,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'GamutFinding(reference: $reference, deltaE: $deltaE, inGamut: $inGamut, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $GamutFindingCopyWith<$Res>  {
  factory $GamutFindingCopyWith(GamutFinding value, $Res Function(GamutFinding) _then) = _$GamutFindingCopyWithImpl;
@useResult
$Res call({
 String reference, double deltaE, bool inGamut, Map<String, Object?> metadata
});




}
/// @nodoc
class _$GamutFindingCopyWithImpl<$Res>
    implements $GamutFindingCopyWith<$Res> {
  _$GamutFindingCopyWithImpl(this._self, this._then);

  final GamutFinding _self;
  final $Res Function(GamutFinding) _then;

/// Create a copy of GamutFinding
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reference = null,Object? deltaE = null,Object? inGamut = null,Object? metadata = null,}) {
  return _then(_self.copyWith(
reference: null == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as String,deltaE: null == deltaE ? _self.deltaE : deltaE // ignore: cast_nullable_to_non_nullable
as double,inGamut: null == inGamut ? _self.inGamut : inGamut // ignore: cast_nullable_to_non_nullable
as bool,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

}


/// Adds pattern-matching-related methods to [GamutFinding].
extension GamutFindingPatterns on GamutFinding {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GamutFinding value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GamutFinding() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GamutFinding value)  $default,){
final _that = this;
switch (_that) {
case _GamutFinding():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GamutFinding value)?  $default,){
final _that = this;
switch (_that) {
case _GamutFinding() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String reference,  double deltaE,  bool inGamut,  Map<String, Object?> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GamutFinding() when $default != null:
return $default(_that.reference,_that.deltaE,_that.inGamut,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String reference,  double deltaE,  bool inGamut,  Map<String, Object?> metadata)  $default,) {final _that = this;
switch (_that) {
case _GamutFinding():
return $default(_that.reference,_that.deltaE,_that.inGamut,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String reference,  double deltaE,  bool inGamut,  Map<String, Object?> metadata)?  $default,) {final _that = this;
switch (_that) {
case _GamutFinding() when $default != null:
return $default(_that.reference,_that.deltaE,_that.inGamut,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GamutFinding implements GamutFinding {
  const _GamutFinding({required this.reference, required this.deltaE, required this.inGamut, final  Map<String, Object?> metadata = const <String, Object?>{}}): assert(deltaE >= 0, 'deltaE must be non-negative'),_metadata = metadata;
  factory _GamutFinding.fromJson(Map<String, dynamic> json) => _$GamutFindingFromJson(json);

/// The colour or region this finding measures — an id or #RRGGBB
/// reference (the established wire convention), never a resolved
/// object.
@override final  String reference;
/// Measured colour difference (reported data — computed by the ICC
/// implementations behind the transform seam, never here).
@override final  double deltaE;
/// Whether the referenced colour maps inside the target gamut.
@override final  bool inGamut;
 final  Map<String, Object?> _metadata;
@override@JsonKey() Map<String, Object?> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of GamutFinding
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GamutFindingCopyWith<_GamutFinding> get copyWith => __$GamutFindingCopyWithImpl<_GamutFinding>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GamutFindingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GamutFinding&&(identical(other.reference, reference) || other.reference == reference)&&(identical(other.deltaE, deltaE) || other.deltaE == deltaE)&&(identical(other.inGamut, inGamut) || other.inGamut == inGamut)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reference,deltaE,inGamut,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'GamutFinding(reference: $reference, deltaE: $deltaE, inGamut: $inGamut, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$GamutFindingCopyWith<$Res> implements $GamutFindingCopyWith<$Res> {
  factory _$GamutFindingCopyWith(_GamutFinding value, $Res Function(_GamutFinding) _then) = __$GamutFindingCopyWithImpl;
@override @useResult
$Res call({
 String reference, double deltaE, bool inGamut, Map<String, Object?> metadata
});




}
/// @nodoc
class __$GamutFindingCopyWithImpl<$Res>
    implements _$GamutFindingCopyWith<$Res> {
  __$GamutFindingCopyWithImpl(this._self, this._then);

  final _GamutFinding _self;
  final $Res Function(_GamutFinding) _then;

/// Create a copy of GamutFinding
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reference = null,Object? deltaE = null,Object? inGamut = null,Object? metadata = null,}) {
  return _then(_GamutFinding(
reference: null == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as String,deltaE: null == deltaE ? _self.deltaE : deltaE // ignore: cast_nullable_to_non_nullable
as double,inGamut: null == inGamut ? _self.inGamut : inGamut // ignore: cast_nullable_to_non_nullable
as bool,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}


/// @nodoc
mixin _$GamutReport {

/// The transform request this report measures.
 String get requestId;/// The colour profile the measurement ran against — id only (the
/// frozen `ColourProfile` reference convention).
 String get colourProfileId; List<GamutFinding> get findings; Map<String, Object?> get metadata;
/// Create a copy of GamutReport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GamutReportCopyWith<GamutReport> get copyWith => _$GamutReportCopyWithImpl<GamutReport>(this as GamutReport, _$identity);

  /// Serializes this GamutReport to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GamutReport&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.colourProfileId, colourProfileId) || other.colourProfileId == colourProfileId)&&const DeepCollectionEquality().equals(other.findings, findings)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId,colourProfileId,const DeepCollectionEquality().hash(findings),const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'GamutReport(requestId: $requestId, colourProfileId: $colourProfileId, findings: $findings, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $GamutReportCopyWith<$Res>  {
  factory $GamutReportCopyWith(GamutReport value, $Res Function(GamutReport) _then) = _$GamutReportCopyWithImpl;
@useResult
$Res call({
 String requestId, String colourProfileId, List<GamutFinding> findings, Map<String, Object?> metadata
});




}
/// @nodoc
class _$GamutReportCopyWithImpl<$Res>
    implements $GamutReportCopyWith<$Res> {
  _$GamutReportCopyWithImpl(this._self, this._then);

  final GamutReport _self;
  final $Res Function(GamutReport) _then;

/// Create a copy of GamutReport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requestId = null,Object? colourProfileId = null,Object? findings = null,Object? metadata = null,}) {
  return _then(_self.copyWith(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,colourProfileId: null == colourProfileId ? _self.colourProfileId : colourProfileId // ignore: cast_nullable_to_non_nullable
as String,findings: null == findings ? _self.findings : findings // ignore: cast_nullable_to_non_nullable
as List<GamutFinding>,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

}


/// Adds pattern-matching-related methods to [GamutReport].
extension GamutReportPatterns on GamutReport {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GamutReport value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GamutReport() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GamutReport value)  $default,){
final _that = this;
switch (_that) {
case _GamutReport():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GamutReport value)?  $default,){
final _that = this;
switch (_that) {
case _GamutReport() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String requestId,  String colourProfileId,  List<GamutFinding> findings,  Map<String, Object?> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GamutReport() when $default != null:
return $default(_that.requestId,_that.colourProfileId,_that.findings,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String requestId,  String colourProfileId,  List<GamutFinding> findings,  Map<String, Object?> metadata)  $default,) {final _that = this;
switch (_that) {
case _GamutReport():
return $default(_that.requestId,_that.colourProfileId,_that.findings,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String requestId,  String colourProfileId,  List<GamutFinding> findings,  Map<String, Object?> metadata)?  $default,) {final _that = this;
switch (_that) {
case _GamutReport() when $default != null:
return $default(_that.requestId,_that.colourProfileId,_that.findings,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GamutReport extends GamutReport {
  const _GamutReport({required this.requestId, required this.colourProfileId, final  List<GamutFinding> findings = const <GamutFinding>[], final  Map<String, Object?> metadata = const <String, Object?>{}}): _findings = findings,_metadata = metadata,super._();
  factory _GamutReport.fromJson(Map<String, dynamic> json) => _$GamutReportFromJson(json);

/// The transform request this report measures.
@override final  String requestId;
/// The colour profile the measurement ran against — id only (the
/// frozen `ColourProfile` reference convention).
@override final  String colourProfileId;
 final  List<GamutFinding> _findings;
@override@JsonKey() List<GamutFinding> get findings {
  if (_findings is EqualUnmodifiableListView) return _findings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_findings);
}

 final  Map<String, Object?> _metadata;
@override@JsonKey() Map<String, Object?> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of GamutReport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GamutReportCopyWith<_GamutReport> get copyWith => __$GamutReportCopyWithImpl<_GamutReport>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GamutReportToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GamutReport&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.colourProfileId, colourProfileId) || other.colourProfileId == colourProfileId)&&const DeepCollectionEquality().equals(other._findings, _findings)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId,colourProfileId,const DeepCollectionEquality().hash(_findings),const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'GamutReport(requestId: $requestId, colourProfileId: $colourProfileId, findings: $findings, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$GamutReportCopyWith<$Res> implements $GamutReportCopyWith<$Res> {
  factory _$GamutReportCopyWith(_GamutReport value, $Res Function(_GamutReport) _then) = __$GamutReportCopyWithImpl;
@override @useResult
$Res call({
 String requestId, String colourProfileId, List<GamutFinding> findings, Map<String, Object?> metadata
});




}
/// @nodoc
class __$GamutReportCopyWithImpl<$Res>
    implements _$GamutReportCopyWith<$Res> {
  __$GamutReportCopyWithImpl(this._self, this._then);

  final _GamutReport _self;
  final $Res Function(_GamutReport) _then;

/// Create a copy of GamutReport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestId = null,Object? colourProfileId = null,Object? findings = null,Object? metadata = null,}) {
  return _then(_GamutReport(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,colourProfileId: null == colourProfileId ? _self.colourProfileId : colourProfileId // ignore: cast_nullable_to_non_nullable
as String,findings: null == findings ? _self._findings : findings // ignore: cast_nullable_to_non_nullable
as List<GamutFinding>,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}


/// @nodoc
mixin _$ColourTransformRequest {

/// Stable UUID of this request.
 String get id;/// What to transform — render-object/tile/asset ids, never buffers.
 List<String> get sourceReferences;/// Working colour space of the sources (wire identifier, e.g.
/// `srgb` — the frozen `ColourProfile.space` convention).
 String get sourceSpace;/// Destination space (e.g. `cmyk_fogra39`).
 String get targetSpace;/// The frozen `ColourProfile` governing the conversion — id only
/// ("profile per mill" is document/injected data).
 String get colourProfileId; Map<String, Object?> get metadata;
/// Create a copy of ColourTransformRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ColourTransformRequestCopyWith<ColourTransformRequest> get copyWith => _$ColourTransformRequestCopyWithImpl<ColourTransformRequest>(this as ColourTransformRequest, _$identity);

  /// Serializes this ColourTransformRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ColourTransformRequest&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.sourceReferences, sourceReferences)&&(identical(other.sourceSpace, sourceSpace) || other.sourceSpace == sourceSpace)&&(identical(other.targetSpace, targetSpace) || other.targetSpace == targetSpace)&&(identical(other.colourProfileId, colourProfileId) || other.colourProfileId == colourProfileId)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(sourceReferences),sourceSpace,targetSpace,colourProfileId,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'ColourTransformRequest(id: $id, sourceReferences: $sourceReferences, sourceSpace: $sourceSpace, targetSpace: $targetSpace, colourProfileId: $colourProfileId, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $ColourTransformRequestCopyWith<$Res>  {
  factory $ColourTransformRequestCopyWith(ColourTransformRequest value, $Res Function(ColourTransformRequest) _then) = _$ColourTransformRequestCopyWithImpl;
@useResult
$Res call({
 String id, List<String> sourceReferences, String sourceSpace, String targetSpace, String colourProfileId, Map<String, Object?> metadata
});




}
/// @nodoc
class _$ColourTransformRequestCopyWithImpl<$Res>
    implements $ColourTransformRequestCopyWith<$Res> {
  _$ColourTransformRequestCopyWithImpl(this._self, this._then);

  final ColourTransformRequest _self;
  final $Res Function(ColourTransformRequest) _then;

/// Create a copy of ColourTransformRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sourceReferences = null,Object? sourceSpace = null,Object? targetSpace = null,Object? colourProfileId = null,Object? metadata = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sourceReferences: null == sourceReferences ? _self.sourceReferences : sourceReferences // ignore: cast_nullable_to_non_nullable
as List<String>,sourceSpace: null == sourceSpace ? _self.sourceSpace : sourceSpace // ignore: cast_nullable_to_non_nullable
as String,targetSpace: null == targetSpace ? _self.targetSpace : targetSpace // ignore: cast_nullable_to_non_nullable
as String,colourProfileId: null == colourProfileId ? _self.colourProfileId : colourProfileId // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

}


/// Adds pattern-matching-related methods to [ColourTransformRequest].
extension ColourTransformRequestPatterns on ColourTransformRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ColourTransformRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ColourTransformRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ColourTransformRequest value)  $default,){
final _that = this;
switch (_that) {
case _ColourTransformRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ColourTransformRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ColourTransformRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  List<String> sourceReferences,  String sourceSpace,  String targetSpace,  String colourProfileId,  Map<String, Object?> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ColourTransformRequest() when $default != null:
return $default(_that.id,_that.sourceReferences,_that.sourceSpace,_that.targetSpace,_that.colourProfileId,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  List<String> sourceReferences,  String sourceSpace,  String targetSpace,  String colourProfileId,  Map<String, Object?> metadata)  $default,) {final _that = this;
switch (_that) {
case _ColourTransformRequest():
return $default(_that.id,_that.sourceReferences,_that.sourceSpace,_that.targetSpace,_that.colourProfileId,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  List<String> sourceReferences,  String sourceSpace,  String targetSpace,  String colourProfileId,  Map<String, Object?> metadata)?  $default,) {final _that = this;
switch (_that) {
case _ColourTransformRequest() when $default != null:
return $default(_that.id,_that.sourceReferences,_that.sourceSpace,_that.targetSpace,_that.colourProfileId,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ColourTransformRequest implements ColourTransformRequest {
  const _ColourTransformRequest({required this.id, final  List<String> sourceReferences = const <String>[], required this.sourceSpace, required this.targetSpace, required this.colourProfileId, final  Map<String, Object?> metadata = const <String, Object?>{}}): _sourceReferences = sourceReferences,_metadata = metadata;
  factory _ColourTransformRequest.fromJson(Map<String, dynamic> json) => _$ColourTransformRequestFromJson(json);

/// Stable UUID of this request.
@override final  String id;
/// What to transform — render-object/tile/asset ids, never buffers.
 final  List<String> _sourceReferences;
/// What to transform — render-object/tile/asset ids, never buffers.
@override@JsonKey() List<String> get sourceReferences {
  if (_sourceReferences is EqualUnmodifiableListView) return _sourceReferences;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sourceReferences);
}

/// Working colour space of the sources (wire identifier, e.g.
/// `srgb` — the frozen `ColourProfile.space` convention).
@override final  String sourceSpace;
/// Destination space (e.g. `cmyk_fogra39`).
@override final  String targetSpace;
/// The frozen `ColourProfile` governing the conversion — id only
/// ("profile per mill" is document/injected data).
@override final  String colourProfileId;
 final  Map<String, Object?> _metadata;
@override@JsonKey() Map<String, Object?> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of ColourTransformRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ColourTransformRequestCopyWith<_ColourTransformRequest> get copyWith => __$ColourTransformRequestCopyWithImpl<_ColourTransformRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ColourTransformRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ColourTransformRequest&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._sourceReferences, _sourceReferences)&&(identical(other.sourceSpace, sourceSpace) || other.sourceSpace == sourceSpace)&&(identical(other.targetSpace, targetSpace) || other.targetSpace == targetSpace)&&(identical(other.colourProfileId, colourProfileId) || other.colourProfileId == colourProfileId)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_sourceReferences),sourceSpace,targetSpace,colourProfileId,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'ColourTransformRequest(id: $id, sourceReferences: $sourceReferences, sourceSpace: $sourceSpace, targetSpace: $targetSpace, colourProfileId: $colourProfileId, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$ColourTransformRequestCopyWith<$Res> implements $ColourTransformRequestCopyWith<$Res> {
  factory _$ColourTransformRequestCopyWith(_ColourTransformRequest value, $Res Function(_ColourTransformRequest) _then) = __$ColourTransformRequestCopyWithImpl;
@override @useResult
$Res call({
 String id, List<String> sourceReferences, String sourceSpace, String targetSpace, String colourProfileId, Map<String, Object?> metadata
});




}
/// @nodoc
class __$ColourTransformRequestCopyWithImpl<$Res>
    implements _$ColourTransformRequestCopyWith<$Res> {
  __$ColourTransformRequestCopyWithImpl(this._self, this._then);

  final _ColourTransformRequest _self;
  final $Res Function(_ColourTransformRequest) _then;

/// Create a copy of ColourTransformRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sourceReferences = null,Object? sourceSpace = null,Object? targetSpace = null,Object? colourProfileId = null,Object? metadata = null,}) {
  return _then(_ColourTransformRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sourceReferences: null == sourceReferences ? _self._sourceReferences : sourceReferences // ignore: cast_nullable_to_non_nullable
as List<String>,sourceSpace: null == sourceSpace ? _self.sourceSpace : sourceSpace // ignore: cast_nullable_to_non_nullable
as String,targetSpace: null == targetSpace ? _self.targetSpace : targetSpace // ignore: cast_nullable_to_non_nullable
as String,colourProfileId: null == colourProfileId ? _self.colourProfileId : colourProfileId // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}


/// @nodoc
mixin _$ColourTransformResult {

/// The request this result answers.
 String get requestId;/// The transformed artefacts — ids only.
 List<String> get outputReferences; GamutReport get gamutReport;/// Version of the transformer that produced this result.
 String get transformerVersion; Map<String, Object?> get metadata;
/// Create a copy of ColourTransformResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ColourTransformResultCopyWith<ColourTransformResult> get copyWith => _$ColourTransformResultCopyWithImpl<ColourTransformResult>(this as ColourTransformResult, _$identity);

  /// Serializes this ColourTransformResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ColourTransformResult&&(identical(other.requestId, requestId) || other.requestId == requestId)&&const DeepCollectionEquality().equals(other.outputReferences, outputReferences)&&(identical(other.gamutReport, gamutReport) || other.gamutReport == gamutReport)&&(identical(other.transformerVersion, transformerVersion) || other.transformerVersion == transformerVersion)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId,const DeepCollectionEquality().hash(outputReferences),gamutReport,transformerVersion,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'ColourTransformResult(requestId: $requestId, outputReferences: $outputReferences, gamutReport: $gamutReport, transformerVersion: $transformerVersion, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $ColourTransformResultCopyWith<$Res>  {
  factory $ColourTransformResultCopyWith(ColourTransformResult value, $Res Function(ColourTransformResult) _then) = _$ColourTransformResultCopyWithImpl;
@useResult
$Res call({
 String requestId, List<String> outputReferences, GamutReport gamutReport, String transformerVersion, Map<String, Object?> metadata
});


$GamutReportCopyWith<$Res> get gamutReport;

}
/// @nodoc
class _$ColourTransformResultCopyWithImpl<$Res>
    implements $ColourTransformResultCopyWith<$Res> {
  _$ColourTransformResultCopyWithImpl(this._self, this._then);

  final ColourTransformResult _self;
  final $Res Function(ColourTransformResult) _then;

/// Create a copy of ColourTransformResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requestId = null,Object? outputReferences = null,Object? gamutReport = null,Object? transformerVersion = null,Object? metadata = null,}) {
  return _then(_self.copyWith(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,outputReferences: null == outputReferences ? _self.outputReferences : outputReferences // ignore: cast_nullable_to_non_nullable
as List<String>,gamutReport: null == gamutReport ? _self.gamutReport : gamutReport // ignore: cast_nullable_to_non_nullable
as GamutReport,transformerVersion: null == transformerVersion ? _self.transformerVersion : transformerVersion // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}
/// Create a copy of ColourTransformResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GamutReportCopyWith<$Res> get gamutReport {
  
  return $GamutReportCopyWith<$Res>(_self.gamutReport, (value) {
    return _then(_self.copyWith(gamutReport: value));
  });
}
}


/// Adds pattern-matching-related methods to [ColourTransformResult].
extension ColourTransformResultPatterns on ColourTransformResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ColourTransformResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ColourTransformResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ColourTransformResult value)  $default,){
final _that = this;
switch (_that) {
case _ColourTransformResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ColourTransformResult value)?  $default,){
final _that = this;
switch (_that) {
case _ColourTransformResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String requestId,  List<String> outputReferences,  GamutReport gamutReport,  String transformerVersion,  Map<String, Object?> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ColourTransformResult() when $default != null:
return $default(_that.requestId,_that.outputReferences,_that.gamutReport,_that.transformerVersion,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String requestId,  List<String> outputReferences,  GamutReport gamutReport,  String transformerVersion,  Map<String, Object?> metadata)  $default,) {final _that = this;
switch (_that) {
case _ColourTransformResult():
return $default(_that.requestId,_that.outputReferences,_that.gamutReport,_that.transformerVersion,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String requestId,  List<String> outputReferences,  GamutReport gamutReport,  String transformerVersion,  Map<String, Object?> metadata)?  $default,) {final _that = this;
switch (_that) {
case _ColourTransformResult() when $default != null:
return $default(_that.requestId,_that.outputReferences,_that.gamutReport,_that.transformerVersion,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ColourTransformResult implements ColourTransformResult {
  const _ColourTransformResult({required this.requestId, final  List<String> outputReferences = const <String>[], required this.gamutReport, required this.transformerVersion, final  Map<String, Object?> metadata = const <String, Object?>{}}): _outputReferences = outputReferences,_metadata = metadata;
  factory _ColourTransformResult.fromJson(Map<String, dynamic> json) => _$ColourTransformResultFromJson(json);

/// The request this result answers.
@override final  String requestId;
/// The transformed artefacts — ids only.
 final  List<String> _outputReferences;
/// The transformed artefacts — ids only.
@override@JsonKey() List<String> get outputReferences {
  if (_outputReferences is EqualUnmodifiableListView) return _outputReferences;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_outputReferences);
}

@override final  GamutReport gamutReport;
/// Version of the transformer that produced this result.
@override final  String transformerVersion;
 final  Map<String, Object?> _metadata;
@override@JsonKey() Map<String, Object?> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of ColourTransformResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ColourTransformResultCopyWith<_ColourTransformResult> get copyWith => __$ColourTransformResultCopyWithImpl<_ColourTransformResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ColourTransformResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ColourTransformResult&&(identical(other.requestId, requestId) || other.requestId == requestId)&&const DeepCollectionEquality().equals(other._outputReferences, _outputReferences)&&(identical(other.gamutReport, gamutReport) || other.gamutReport == gamutReport)&&(identical(other.transformerVersion, transformerVersion) || other.transformerVersion == transformerVersion)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId,const DeepCollectionEquality().hash(_outputReferences),gamutReport,transformerVersion,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'ColourTransformResult(requestId: $requestId, outputReferences: $outputReferences, gamutReport: $gamutReport, transformerVersion: $transformerVersion, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$ColourTransformResultCopyWith<$Res> implements $ColourTransformResultCopyWith<$Res> {
  factory _$ColourTransformResultCopyWith(_ColourTransformResult value, $Res Function(_ColourTransformResult) _then) = __$ColourTransformResultCopyWithImpl;
@override @useResult
$Res call({
 String requestId, List<String> outputReferences, GamutReport gamutReport, String transformerVersion, Map<String, Object?> metadata
});


@override $GamutReportCopyWith<$Res> get gamutReport;

}
/// @nodoc
class __$ColourTransformResultCopyWithImpl<$Res>
    implements _$ColourTransformResultCopyWith<$Res> {
  __$ColourTransformResultCopyWithImpl(this._self, this._then);

  final _ColourTransformResult _self;
  final $Res Function(_ColourTransformResult) _then;

/// Create a copy of ColourTransformResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestId = null,Object? outputReferences = null,Object? gamutReport = null,Object? transformerVersion = null,Object? metadata = null,}) {
  return _then(_ColourTransformResult(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,outputReferences: null == outputReferences ? _self._outputReferences : outputReferences // ignore: cast_nullable_to_non_nullable
as List<String>,gamutReport: null == gamutReport ? _self.gamutReport : gamutReport // ignore: cast_nullable_to_non_nullable
as GamutReport,transformerVersion: null == transformerVersion ? _self.transformerVersion : transformerVersion // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

/// Create a copy of ColourTransformResult
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
