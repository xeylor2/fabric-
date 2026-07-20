// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preflight.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PreflightFinding {

@JsonKey(fromJson: _ruleFromJson, toJson: _ruleToJson) PreflightRuleKind get rule;@JsonKey(fromJson: _severityFromJson, toJson: _severityToJson) PreflightSeverity get severity;/// Human-readable description of the finding.
 String get description;/// The artboard this finding concerns — id only, when specific.
 String? get artboardId;/// Referenced nodes/layers — ids only.
 List<String> get targetIds;/// Measured/expected values for UI and mill sheets (e.g.
/// effectiveDpi, requiredDpi, colourCount, maxColours).
 Map<String, Object?> get measurements;
/// Create a copy of PreflightFinding
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreflightFindingCopyWith<PreflightFinding> get copyWith => _$PreflightFindingCopyWithImpl<PreflightFinding>(this as PreflightFinding, _$identity);

  /// Serializes this PreflightFinding to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreflightFinding&&(identical(other.rule, rule) || other.rule == rule)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.description, description) || other.description == description)&&(identical(other.artboardId, artboardId) || other.artboardId == artboardId)&&const DeepCollectionEquality().equals(other.targetIds, targetIds)&&const DeepCollectionEquality().equals(other.measurements, measurements));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rule,severity,description,artboardId,const DeepCollectionEquality().hash(targetIds),const DeepCollectionEquality().hash(measurements));

@override
String toString() {
  return 'PreflightFinding(rule: $rule, severity: $severity, description: $description, artboardId: $artboardId, targetIds: $targetIds, measurements: $measurements)';
}


}

/// @nodoc
abstract mixin class $PreflightFindingCopyWith<$Res>  {
  factory $PreflightFindingCopyWith(PreflightFinding value, $Res Function(PreflightFinding) _then) = _$PreflightFindingCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _ruleFromJson, toJson: _ruleToJson) PreflightRuleKind rule,@JsonKey(fromJson: _severityFromJson, toJson: _severityToJson) PreflightSeverity severity, String description, String? artboardId, List<String> targetIds, Map<String, Object?> measurements
});




}
/// @nodoc
class _$PreflightFindingCopyWithImpl<$Res>
    implements $PreflightFindingCopyWith<$Res> {
  _$PreflightFindingCopyWithImpl(this._self, this._then);

  final PreflightFinding _self;
  final $Res Function(PreflightFinding) _then;

/// Create a copy of PreflightFinding
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rule = null,Object? severity = null,Object? description = null,Object? artboardId = freezed,Object? targetIds = null,Object? measurements = null,}) {
  return _then(_self.copyWith(
rule: null == rule ? _self.rule : rule // ignore: cast_nullable_to_non_nullable
as PreflightRuleKind,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as PreflightSeverity,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,artboardId: freezed == artboardId ? _self.artboardId : artboardId // ignore: cast_nullable_to_non_nullable
as String?,targetIds: null == targetIds ? _self.targetIds : targetIds // ignore: cast_nullable_to_non_nullable
as List<String>,measurements: null == measurements ? _self.measurements : measurements // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

}


/// Adds pattern-matching-related methods to [PreflightFinding].
extension PreflightFindingPatterns on PreflightFinding {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PreflightFinding value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PreflightFinding() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PreflightFinding value)  $default,){
final _that = this;
switch (_that) {
case _PreflightFinding():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PreflightFinding value)?  $default,){
final _that = this;
switch (_that) {
case _PreflightFinding() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _ruleFromJson, toJson: _ruleToJson)  PreflightRuleKind rule, @JsonKey(fromJson: _severityFromJson, toJson: _severityToJson)  PreflightSeverity severity,  String description,  String? artboardId,  List<String> targetIds,  Map<String, Object?> measurements)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PreflightFinding() when $default != null:
return $default(_that.rule,_that.severity,_that.description,_that.artboardId,_that.targetIds,_that.measurements);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _ruleFromJson, toJson: _ruleToJson)  PreflightRuleKind rule, @JsonKey(fromJson: _severityFromJson, toJson: _severityToJson)  PreflightSeverity severity,  String description,  String? artboardId,  List<String> targetIds,  Map<String, Object?> measurements)  $default,) {final _that = this;
switch (_that) {
case _PreflightFinding():
return $default(_that.rule,_that.severity,_that.description,_that.artboardId,_that.targetIds,_that.measurements);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _ruleFromJson, toJson: _ruleToJson)  PreflightRuleKind rule, @JsonKey(fromJson: _severityFromJson, toJson: _severityToJson)  PreflightSeverity severity,  String description,  String? artboardId,  List<String> targetIds,  Map<String, Object?> measurements)?  $default,) {final _that = this;
switch (_that) {
case _PreflightFinding() when $default != null:
return $default(_that.rule,_that.severity,_that.description,_that.artboardId,_that.targetIds,_that.measurements);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PreflightFinding implements PreflightFinding {
  const _PreflightFinding({@JsonKey(fromJson: _ruleFromJson, toJson: _ruleToJson) required this.rule, @JsonKey(fromJson: _severityFromJson, toJson: _severityToJson) required this.severity, required this.description, this.artboardId, final  List<String> targetIds = const <String>[], final  Map<String, Object?> measurements = const <String, Object?>{}}): _targetIds = targetIds,_measurements = measurements;
  factory _PreflightFinding.fromJson(Map<String, dynamic> json) => _$PreflightFindingFromJson(json);

@override@JsonKey(fromJson: _ruleFromJson, toJson: _ruleToJson) final  PreflightRuleKind rule;
@override@JsonKey(fromJson: _severityFromJson, toJson: _severityToJson) final  PreflightSeverity severity;
/// Human-readable description of the finding.
@override final  String description;
/// The artboard this finding concerns — id only, when specific.
@override final  String? artboardId;
/// Referenced nodes/layers — ids only.
 final  List<String> _targetIds;
/// Referenced nodes/layers — ids only.
@override@JsonKey() List<String> get targetIds {
  if (_targetIds is EqualUnmodifiableListView) return _targetIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_targetIds);
}

/// Measured/expected values for UI and mill sheets (e.g.
/// effectiveDpi, requiredDpi, colourCount, maxColours).
 final  Map<String, Object?> _measurements;
/// Measured/expected values for UI and mill sheets (e.g.
/// effectiveDpi, requiredDpi, colourCount, maxColours).
@override@JsonKey() Map<String, Object?> get measurements {
  if (_measurements is EqualUnmodifiableMapView) return _measurements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_measurements);
}


/// Create a copy of PreflightFinding
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreflightFindingCopyWith<_PreflightFinding> get copyWith => __$PreflightFindingCopyWithImpl<_PreflightFinding>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PreflightFindingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreflightFinding&&(identical(other.rule, rule) || other.rule == rule)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.description, description) || other.description == description)&&(identical(other.artboardId, artboardId) || other.artboardId == artboardId)&&const DeepCollectionEquality().equals(other._targetIds, _targetIds)&&const DeepCollectionEquality().equals(other._measurements, _measurements));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rule,severity,description,artboardId,const DeepCollectionEquality().hash(_targetIds),const DeepCollectionEquality().hash(_measurements));

@override
String toString() {
  return 'PreflightFinding(rule: $rule, severity: $severity, description: $description, artboardId: $artboardId, targetIds: $targetIds, measurements: $measurements)';
}


}

/// @nodoc
abstract mixin class _$PreflightFindingCopyWith<$Res> implements $PreflightFindingCopyWith<$Res> {
  factory _$PreflightFindingCopyWith(_PreflightFinding value, $Res Function(_PreflightFinding) _then) = __$PreflightFindingCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _ruleFromJson, toJson: _ruleToJson) PreflightRuleKind rule,@JsonKey(fromJson: _severityFromJson, toJson: _severityToJson) PreflightSeverity severity, String description, String? artboardId, List<String> targetIds, Map<String, Object?> measurements
});




}
/// @nodoc
class __$PreflightFindingCopyWithImpl<$Res>
    implements _$PreflightFindingCopyWith<$Res> {
  __$PreflightFindingCopyWithImpl(this._self, this._then);

  final _PreflightFinding _self;
  final $Res Function(_PreflightFinding) _then;

/// Create a copy of PreflightFinding
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rule = null,Object? severity = null,Object? description = null,Object? artboardId = freezed,Object? targetIds = null,Object? measurements = null,}) {
  return _then(_PreflightFinding(
rule: null == rule ? _self.rule : rule // ignore: cast_nullable_to_non_nullable
as PreflightRuleKind,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as PreflightSeverity,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,artboardId: freezed == artboardId ? _self.artboardId : artboardId // ignore: cast_nullable_to_non_nullable
as String?,targetIds: null == targetIds ? _self._targetIds : targetIds // ignore: cast_nullable_to_non_nullable
as List<String>,measurements: null == measurements ? _self._measurements : measurements // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}


/// @nodoc
mixin _$PreflightReport {

/// The job preflighted.
 String get jobId; List<PreflightFinding> get findings;/// Version of the engine that produced this report (the frozen
/// provenance versioning precedent — reports are reproducible facts).
 String get engineVersion; Map<String, Object?> get metadata;
/// Create a copy of PreflightReport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreflightReportCopyWith<PreflightReport> get copyWith => _$PreflightReportCopyWithImpl<PreflightReport>(this as PreflightReport, _$identity);

  /// Serializes this PreflightReport to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreflightReport&&(identical(other.jobId, jobId) || other.jobId == jobId)&&const DeepCollectionEquality().equals(other.findings, findings)&&(identical(other.engineVersion, engineVersion) || other.engineVersion == engineVersion)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,jobId,const DeepCollectionEquality().hash(findings),engineVersion,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'PreflightReport(jobId: $jobId, findings: $findings, engineVersion: $engineVersion, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $PreflightReportCopyWith<$Res>  {
  factory $PreflightReportCopyWith(PreflightReport value, $Res Function(PreflightReport) _then) = _$PreflightReportCopyWithImpl;
@useResult
$Res call({
 String jobId, List<PreflightFinding> findings, String engineVersion, Map<String, Object?> metadata
});




}
/// @nodoc
class _$PreflightReportCopyWithImpl<$Res>
    implements $PreflightReportCopyWith<$Res> {
  _$PreflightReportCopyWithImpl(this._self, this._then);

  final PreflightReport _self;
  final $Res Function(PreflightReport) _then;

/// Create a copy of PreflightReport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? jobId = null,Object? findings = null,Object? engineVersion = null,Object? metadata = null,}) {
  return _then(_self.copyWith(
jobId: null == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as String,findings: null == findings ? _self.findings : findings // ignore: cast_nullable_to_non_nullable
as List<PreflightFinding>,engineVersion: null == engineVersion ? _self.engineVersion : engineVersion // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

}


/// Adds pattern-matching-related methods to [PreflightReport].
extension PreflightReportPatterns on PreflightReport {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PreflightReport value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PreflightReport() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PreflightReport value)  $default,){
final _that = this;
switch (_that) {
case _PreflightReport():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PreflightReport value)?  $default,){
final _that = this;
switch (_that) {
case _PreflightReport() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String jobId,  List<PreflightFinding> findings,  String engineVersion,  Map<String, Object?> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PreflightReport() when $default != null:
return $default(_that.jobId,_that.findings,_that.engineVersion,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String jobId,  List<PreflightFinding> findings,  String engineVersion,  Map<String, Object?> metadata)  $default,) {final _that = this;
switch (_that) {
case _PreflightReport():
return $default(_that.jobId,_that.findings,_that.engineVersion,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String jobId,  List<PreflightFinding> findings,  String engineVersion,  Map<String, Object?> metadata)?  $default,) {final _that = this;
switch (_that) {
case _PreflightReport() when $default != null:
return $default(_that.jobId,_that.findings,_that.engineVersion,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PreflightReport extends PreflightReport {
  const _PreflightReport({required this.jobId, final  List<PreflightFinding> findings = const <PreflightFinding>[], required this.engineVersion, final  Map<String, Object?> metadata = const <String, Object?>{}}): _findings = findings,_metadata = metadata,super._();
  factory _PreflightReport.fromJson(Map<String, dynamic> json) => _$PreflightReportFromJson(json);

/// The job preflighted.
@override final  String jobId;
 final  List<PreflightFinding> _findings;
@override@JsonKey() List<PreflightFinding> get findings {
  if (_findings is EqualUnmodifiableListView) return _findings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_findings);
}

/// Version of the engine that produced this report (the frozen
/// provenance versioning precedent — reports are reproducible facts).
@override final  String engineVersion;
 final  Map<String, Object?> _metadata;
@override@JsonKey() Map<String, Object?> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of PreflightReport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreflightReportCopyWith<_PreflightReport> get copyWith => __$PreflightReportCopyWithImpl<_PreflightReport>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PreflightReportToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreflightReport&&(identical(other.jobId, jobId) || other.jobId == jobId)&&const DeepCollectionEquality().equals(other._findings, _findings)&&(identical(other.engineVersion, engineVersion) || other.engineVersion == engineVersion)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,jobId,const DeepCollectionEquality().hash(_findings),engineVersion,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'PreflightReport(jobId: $jobId, findings: $findings, engineVersion: $engineVersion, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$PreflightReportCopyWith<$Res> implements $PreflightReportCopyWith<$Res> {
  factory _$PreflightReportCopyWith(_PreflightReport value, $Res Function(_PreflightReport) _then) = __$PreflightReportCopyWithImpl;
@override @useResult
$Res call({
 String jobId, List<PreflightFinding> findings, String engineVersion, Map<String, Object?> metadata
});




}
/// @nodoc
class __$PreflightReportCopyWithImpl<$Res>
    implements _$PreflightReportCopyWith<$Res> {
  __$PreflightReportCopyWithImpl(this._self, this._then);

  final _PreflightReport _self;
  final $Res Function(_PreflightReport) _then;

/// Create a copy of PreflightReport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? jobId = null,Object? findings = null,Object? engineVersion = null,Object? metadata = null,}) {
  return _then(_PreflightReport(
jobId: null == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as String,findings: null == findings ? _self._findings : findings // ignore: cast_nullable_to_non_nullable
as List<PreflightFinding>,engineVersion: null == engineVersion ? _self.engineVersion : engineVersion // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}


/// @nodoc
mixin _$PreflightThresholds {

/// Minimum acceptable effective DPI at the job's physical size.
 double? get minEffectiveDpi;/// Maximum colours the technique supports (the frozen
/// `ProductionProfile.maxColours` seam is a caller-side source).
 int? get maxColours;/// Required bleed allowance in [bleedUnit] (checked structurally
/// against job metadata by later slices; presence-checked here).
 double? get minBleed;/// Unit of [minBleed].
@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) MeasurementUnit get bleedUnit;
/// Create a copy of PreflightThresholds
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreflightThresholdsCopyWith<PreflightThresholds> get copyWith => _$PreflightThresholdsCopyWithImpl<PreflightThresholds>(this as PreflightThresholds, _$identity);

  /// Serializes this PreflightThresholds to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreflightThresholds&&(identical(other.minEffectiveDpi, minEffectiveDpi) || other.minEffectiveDpi == minEffectiveDpi)&&(identical(other.maxColours, maxColours) || other.maxColours == maxColours)&&(identical(other.minBleed, minBleed) || other.minBleed == minBleed)&&(identical(other.bleedUnit, bleedUnit) || other.bleedUnit == bleedUnit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,minEffectiveDpi,maxColours,minBleed,bleedUnit);

@override
String toString() {
  return 'PreflightThresholds(minEffectiveDpi: $minEffectiveDpi, maxColours: $maxColours, minBleed: $minBleed, bleedUnit: $bleedUnit)';
}


}

/// @nodoc
abstract mixin class $PreflightThresholdsCopyWith<$Res>  {
  factory $PreflightThresholdsCopyWith(PreflightThresholds value, $Res Function(PreflightThresholds) _then) = _$PreflightThresholdsCopyWithImpl;
@useResult
$Res call({
 double? minEffectiveDpi, int? maxColours, double? minBleed,@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) MeasurementUnit bleedUnit
});




}
/// @nodoc
class _$PreflightThresholdsCopyWithImpl<$Res>
    implements $PreflightThresholdsCopyWith<$Res> {
  _$PreflightThresholdsCopyWithImpl(this._self, this._then);

  final PreflightThresholds _self;
  final $Res Function(PreflightThresholds) _then;

/// Create a copy of PreflightThresholds
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? minEffectiveDpi = freezed,Object? maxColours = freezed,Object? minBleed = freezed,Object? bleedUnit = null,}) {
  return _then(_self.copyWith(
minEffectiveDpi: freezed == minEffectiveDpi ? _self.minEffectiveDpi : minEffectiveDpi // ignore: cast_nullable_to_non_nullable
as double?,maxColours: freezed == maxColours ? _self.maxColours : maxColours // ignore: cast_nullable_to_non_nullable
as int?,minBleed: freezed == minBleed ? _self.minBleed : minBleed // ignore: cast_nullable_to_non_nullable
as double?,bleedUnit: null == bleedUnit ? _self.bleedUnit : bleedUnit // ignore: cast_nullable_to_non_nullable
as MeasurementUnit,
  ));
}

}


/// Adds pattern-matching-related methods to [PreflightThresholds].
extension PreflightThresholdsPatterns on PreflightThresholds {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PreflightThresholds value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PreflightThresholds() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PreflightThresholds value)  $default,){
final _that = this;
switch (_that) {
case _PreflightThresholds():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PreflightThresholds value)?  $default,){
final _that = this;
switch (_that) {
case _PreflightThresholds() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double? minEffectiveDpi,  int? maxColours,  double? minBleed, @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson)  MeasurementUnit bleedUnit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PreflightThresholds() when $default != null:
return $default(_that.minEffectiveDpi,_that.maxColours,_that.minBleed,_that.bleedUnit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double? minEffectiveDpi,  int? maxColours,  double? minBleed, @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson)  MeasurementUnit bleedUnit)  $default,) {final _that = this;
switch (_that) {
case _PreflightThresholds():
return $default(_that.minEffectiveDpi,_that.maxColours,_that.minBleed,_that.bleedUnit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double? minEffectiveDpi,  int? maxColours,  double? minBleed, @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson)  MeasurementUnit bleedUnit)?  $default,) {final _that = this;
switch (_that) {
case _PreflightThresholds() when $default != null:
return $default(_that.minEffectiveDpi,_that.maxColours,_that.minBleed,_that.bleedUnit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PreflightThresholds implements PreflightThresholds {
  const _PreflightThresholds({this.minEffectiveDpi, this.maxColours, this.minBleed, @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) this.bleedUnit = MeasurementUnit.millimetre});
  factory _PreflightThresholds.fromJson(Map<String, dynamic> json) => _$PreflightThresholdsFromJson(json);

/// Minimum acceptable effective DPI at the job's physical size.
@override final  double? minEffectiveDpi;
/// Maximum colours the technique supports (the frozen
/// `ProductionProfile.maxColours` seam is a caller-side source).
@override final  int? maxColours;
/// Required bleed allowance in [bleedUnit] (checked structurally
/// against job metadata by later slices; presence-checked here).
@override final  double? minBleed;
/// Unit of [minBleed].
@override@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) final  MeasurementUnit bleedUnit;

/// Create a copy of PreflightThresholds
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreflightThresholdsCopyWith<_PreflightThresholds> get copyWith => __$PreflightThresholdsCopyWithImpl<_PreflightThresholds>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PreflightThresholdsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreflightThresholds&&(identical(other.minEffectiveDpi, minEffectiveDpi) || other.minEffectiveDpi == minEffectiveDpi)&&(identical(other.maxColours, maxColours) || other.maxColours == maxColours)&&(identical(other.minBleed, minBleed) || other.minBleed == minBleed)&&(identical(other.bleedUnit, bleedUnit) || other.bleedUnit == bleedUnit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,minEffectiveDpi,maxColours,minBleed,bleedUnit);

@override
String toString() {
  return 'PreflightThresholds(minEffectiveDpi: $minEffectiveDpi, maxColours: $maxColours, minBleed: $minBleed, bleedUnit: $bleedUnit)';
}


}

/// @nodoc
abstract mixin class _$PreflightThresholdsCopyWith<$Res> implements $PreflightThresholdsCopyWith<$Res> {
  factory _$PreflightThresholdsCopyWith(_PreflightThresholds value, $Res Function(_PreflightThresholds) _then) = __$PreflightThresholdsCopyWithImpl;
@override @useResult
$Res call({
 double? minEffectiveDpi, int? maxColours, double? minBleed,@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) MeasurementUnit bleedUnit
});




}
/// @nodoc
class __$PreflightThresholdsCopyWithImpl<$Res>
    implements _$PreflightThresholdsCopyWith<$Res> {
  __$PreflightThresholdsCopyWithImpl(this._self, this._then);

  final _PreflightThresholds _self;
  final $Res Function(_PreflightThresholds) _then;

/// Create a copy of PreflightThresholds
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? minEffectiveDpi = freezed,Object? maxColours = freezed,Object? minBleed = freezed,Object? bleedUnit = null,}) {
  return _then(_PreflightThresholds(
minEffectiveDpi: freezed == minEffectiveDpi ? _self.minEffectiveDpi : minEffectiveDpi // ignore: cast_nullable_to_non_nullable
as double?,maxColours: freezed == maxColours ? _self.maxColours : maxColours // ignore: cast_nullable_to_non_nullable
as int?,minBleed: freezed == minBleed ? _self.minBleed : minBleed // ignore: cast_nullable_to_non_nullable
as double?,bleedUnit: null == bleedUnit ? _self.bleedUnit : bleedUnit // ignore: cast_nullable_to_non_nullable
as MeasurementUnit,
  ));
}


}

// dart format on
