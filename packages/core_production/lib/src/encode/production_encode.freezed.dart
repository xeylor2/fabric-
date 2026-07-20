// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'production_encode.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EncodeRequest {

/// Stable UUID of this request.
 String get id;/// What to encode — the coloured output references, ids only.
 List<String> get sourceReferences;/// The frozen target format (wire-name serialized).
@JsonKey(fromJson: _formatFromJson, toJson: _formatToJson) ExportFormat get format;/// The frozen `ExportProfile` this request realises — id only.
 String get exportProfileId;/// Exact physical output size (§12: always embedded).
 Size2D get physicalSize;/// Unit of [physicalSize] (frozen vocabulary).
@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) MeasurementUnit get unit;/// Output resolution (§12: always embedded).
 double get dpi; Map<String, Object?> get metadata;
/// Create a copy of EncodeRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EncodeRequestCopyWith<EncodeRequest> get copyWith => _$EncodeRequestCopyWithImpl<EncodeRequest>(this as EncodeRequest, _$identity);

  /// Serializes this EncodeRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EncodeRequest&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.sourceReferences, sourceReferences)&&(identical(other.format, format) || other.format == format)&&(identical(other.exportProfileId, exportProfileId) || other.exportProfileId == exportProfileId)&&(identical(other.physicalSize, physicalSize) || other.physicalSize == physicalSize)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.dpi, dpi) || other.dpi == dpi)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(sourceReferences),format,exportProfileId,physicalSize,unit,dpi,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'EncodeRequest(id: $id, sourceReferences: $sourceReferences, format: $format, exportProfileId: $exportProfileId, physicalSize: $physicalSize, unit: $unit, dpi: $dpi, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $EncodeRequestCopyWith<$Res>  {
  factory $EncodeRequestCopyWith(EncodeRequest value, $Res Function(EncodeRequest) _then) = _$EncodeRequestCopyWithImpl;
@useResult
$Res call({
 String id, List<String> sourceReferences,@JsonKey(fromJson: _formatFromJson, toJson: _formatToJson) ExportFormat format, String exportProfileId, Size2D physicalSize,@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) MeasurementUnit unit, double dpi, Map<String, Object?> metadata
});


$Size2DCopyWith<$Res> get physicalSize;

}
/// @nodoc
class _$EncodeRequestCopyWithImpl<$Res>
    implements $EncodeRequestCopyWith<$Res> {
  _$EncodeRequestCopyWithImpl(this._self, this._then);

  final EncodeRequest _self;
  final $Res Function(EncodeRequest) _then;

/// Create a copy of EncodeRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sourceReferences = null,Object? format = null,Object? exportProfileId = null,Object? physicalSize = null,Object? unit = null,Object? dpi = null,Object? metadata = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sourceReferences: null == sourceReferences ? _self.sourceReferences : sourceReferences // ignore: cast_nullable_to_non_nullable
as List<String>,format: null == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as ExportFormat,exportProfileId: null == exportProfileId ? _self.exportProfileId : exportProfileId // ignore: cast_nullable_to_non_nullable
as String,physicalSize: null == physicalSize ? _self.physicalSize : physicalSize // ignore: cast_nullable_to_non_nullable
as Size2D,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as MeasurementUnit,dpi: null == dpi ? _self.dpi : dpi // ignore: cast_nullable_to_non_nullable
as double,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}
/// Create a copy of EncodeRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Size2DCopyWith<$Res> get physicalSize {
  
  return $Size2DCopyWith<$Res>(_self.physicalSize, (value) {
    return _then(_self.copyWith(physicalSize: value));
  });
}
}


/// Adds pattern-matching-related methods to [EncodeRequest].
extension EncodeRequestPatterns on EncodeRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EncodeRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EncodeRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EncodeRequest value)  $default,){
final _that = this;
switch (_that) {
case _EncodeRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EncodeRequest value)?  $default,){
final _that = this;
switch (_that) {
case _EncodeRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  List<String> sourceReferences, @JsonKey(fromJson: _formatFromJson, toJson: _formatToJson)  ExportFormat format,  String exportProfileId,  Size2D physicalSize, @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson)  MeasurementUnit unit,  double dpi,  Map<String, Object?> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EncodeRequest() when $default != null:
return $default(_that.id,_that.sourceReferences,_that.format,_that.exportProfileId,_that.physicalSize,_that.unit,_that.dpi,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  List<String> sourceReferences, @JsonKey(fromJson: _formatFromJson, toJson: _formatToJson)  ExportFormat format,  String exportProfileId,  Size2D physicalSize, @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson)  MeasurementUnit unit,  double dpi,  Map<String, Object?> metadata)  $default,) {final _that = this;
switch (_that) {
case _EncodeRequest():
return $default(_that.id,_that.sourceReferences,_that.format,_that.exportProfileId,_that.physicalSize,_that.unit,_that.dpi,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  List<String> sourceReferences, @JsonKey(fromJson: _formatFromJson, toJson: _formatToJson)  ExportFormat format,  String exportProfileId,  Size2D physicalSize, @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson)  MeasurementUnit unit,  double dpi,  Map<String, Object?> metadata)?  $default,) {final _that = this;
switch (_that) {
case _EncodeRequest() when $default != null:
return $default(_that.id,_that.sourceReferences,_that.format,_that.exportProfileId,_that.physicalSize,_that.unit,_that.dpi,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EncodeRequest implements EncodeRequest {
  const _EncodeRequest({required this.id, final  List<String> sourceReferences = const <String>[], @JsonKey(fromJson: _formatFromJson, toJson: _formatToJson) required this.format, required this.exportProfileId, required this.physicalSize, @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) required this.unit, required this.dpi, final  Map<String, Object?> metadata = const <String, Object?>{}}): assert(dpi > 0, 'dpi must be positive'),_sourceReferences = sourceReferences,_metadata = metadata;
  factory _EncodeRequest.fromJson(Map<String, dynamic> json) => _$EncodeRequestFromJson(json);

/// Stable UUID of this request.
@override final  String id;
/// What to encode — the coloured output references, ids only.
 final  List<String> _sourceReferences;
/// What to encode — the coloured output references, ids only.
@override@JsonKey() List<String> get sourceReferences {
  if (_sourceReferences is EqualUnmodifiableListView) return _sourceReferences;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sourceReferences);
}

/// The frozen target format (wire-name serialized).
@override@JsonKey(fromJson: _formatFromJson, toJson: _formatToJson) final  ExportFormat format;
/// The frozen `ExportProfile` this request realises — id only.
@override final  String exportProfileId;
/// Exact physical output size (§12: always embedded).
@override final  Size2D physicalSize;
/// Unit of [physicalSize] (frozen vocabulary).
@override@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) final  MeasurementUnit unit;
/// Output resolution (§12: always embedded).
@override final  double dpi;
 final  Map<String, Object?> _metadata;
@override@JsonKey() Map<String, Object?> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of EncodeRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EncodeRequestCopyWith<_EncodeRequest> get copyWith => __$EncodeRequestCopyWithImpl<_EncodeRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EncodeRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EncodeRequest&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._sourceReferences, _sourceReferences)&&(identical(other.format, format) || other.format == format)&&(identical(other.exportProfileId, exportProfileId) || other.exportProfileId == exportProfileId)&&(identical(other.physicalSize, physicalSize) || other.physicalSize == physicalSize)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.dpi, dpi) || other.dpi == dpi)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_sourceReferences),format,exportProfileId,physicalSize,unit,dpi,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'EncodeRequest(id: $id, sourceReferences: $sourceReferences, format: $format, exportProfileId: $exportProfileId, physicalSize: $physicalSize, unit: $unit, dpi: $dpi, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$EncodeRequestCopyWith<$Res> implements $EncodeRequestCopyWith<$Res> {
  factory _$EncodeRequestCopyWith(_EncodeRequest value, $Res Function(_EncodeRequest) _then) = __$EncodeRequestCopyWithImpl;
@override @useResult
$Res call({
 String id, List<String> sourceReferences,@JsonKey(fromJson: _formatFromJson, toJson: _formatToJson) ExportFormat format, String exportProfileId, Size2D physicalSize,@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) MeasurementUnit unit, double dpi, Map<String, Object?> metadata
});


@override $Size2DCopyWith<$Res> get physicalSize;

}
/// @nodoc
class __$EncodeRequestCopyWithImpl<$Res>
    implements _$EncodeRequestCopyWith<$Res> {
  __$EncodeRequestCopyWithImpl(this._self, this._then);

  final _EncodeRequest _self;
  final $Res Function(_EncodeRequest) _then;

/// Create a copy of EncodeRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sourceReferences = null,Object? format = null,Object? exportProfileId = null,Object? physicalSize = null,Object? unit = null,Object? dpi = null,Object? metadata = null,}) {
  return _then(_EncodeRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sourceReferences: null == sourceReferences ? _self._sourceReferences : sourceReferences // ignore: cast_nullable_to_non_nullable
as List<String>,format: null == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as ExportFormat,exportProfileId: null == exportProfileId ? _self.exportProfileId : exportProfileId // ignore: cast_nullable_to_non_nullable
as String,physicalSize: null == physicalSize ? _self.physicalSize : physicalSize // ignore: cast_nullable_to_non_nullable
as Size2D,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as MeasurementUnit,dpi: null == dpi ? _self.dpi : dpi // ignore: cast_nullable_to_non_nullable
as double,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

/// Create a copy of EncodeRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Size2DCopyWith<$Res> get physicalSize {
  
  return $Size2DCopyWith<$Res>(_self.physicalSize, (value) {
    return _then(_self.copyWith(physicalSize: value));
  });
}
}

EncodeResult _$EncodeResultFromJson(
  Map<String, dynamic> json
) {
        switch (json['kind']) {
                  case 'encoded':
          return EncodeEncoded.fromJson(
            json
          );
                case 'unsupported':
          return EncodeUnsupported.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'kind',
  'EncodeResult',
  'Invalid union type "${json['kind']}"!'
);
        }
      
}

/// @nodoc
mixin _$EncodeResult {

 String get requestId;/// Version of the encoder that produced the artefacts (the frozen
/// provenance-versioning precedent).
 String get encoderVersion;
/// Create a copy of EncodeResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EncodeResultCopyWith<EncodeResult> get copyWith => _$EncodeResultCopyWithImpl<EncodeResult>(this as EncodeResult, _$identity);

  /// Serializes this EncodeResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EncodeResult&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.encoderVersion, encoderVersion) || other.encoderVersion == encoderVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId,encoderVersion);

@override
String toString() {
  return 'EncodeResult(requestId: $requestId, encoderVersion: $encoderVersion)';
}


}

/// @nodoc
abstract mixin class $EncodeResultCopyWith<$Res>  {
  factory $EncodeResultCopyWith(EncodeResult value, $Res Function(EncodeResult) _then) = _$EncodeResultCopyWithImpl;
@useResult
$Res call({
 String requestId, String encoderVersion
});




}
/// @nodoc
class _$EncodeResultCopyWithImpl<$Res>
    implements $EncodeResultCopyWith<$Res> {
  _$EncodeResultCopyWithImpl(this._self, this._then);

  final EncodeResult _self;
  final $Res Function(EncodeResult) _then;

/// Create a copy of EncodeResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requestId = null,Object? encoderVersion = null,}) {
  return _then(_self.copyWith(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,encoderVersion: null == encoderVersion ? _self.encoderVersion : encoderVersion // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [EncodeResult].
extension EncodeResultPatterns on EncodeResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( EncodeEncoded value)?  encoded,TResult Function( EncodeUnsupported value)?  unsupported,required TResult orElse(),}){
final _that = this;
switch (_that) {
case EncodeEncoded() when encoded != null:
return encoded(_that);case EncodeUnsupported() when unsupported != null:
return unsupported(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( EncodeEncoded value)  encoded,required TResult Function( EncodeUnsupported value)  unsupported,}){
final _that = this;
switch (_that) {
case EncodeEncoded():
return encoded(_that);case EncodeUnsupported():
return unsupported(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( EncodeEncoded value)?  encoded,TResult? Function( EncodeUnsupported value)?  unsupported,}){
final _that = this;
switch (_that) {
case EncodeEncoded() when encoded != null:
return encoded(_that);case EncodeUnsupported() when unsupported != null:
return unsupported(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String requestId,  List<String> outputReferences,  String encoderVersion)?  encoded,TResult Function( String requestId, @JsonKey(fromJson: _formatFromJson, toJson: _formatToJson)  ExportFormat format,  String encoderVersion,  String? detail)?  unsupported,required TResult orElse(),}) {final _that = this;
switch (_that) {
case EncodeEncoded() when encoded != null:
return encoded(_that.requestId,_that.outputReferences,_that.encoderVersion);case EncodeUnsupported() when unsupported != null:
return unsupported(_that.requestId,_that.format,_that.encoderVersion,_that.detail);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String requestId,  List<String> outputReferences,  String encoderVersion)  encoded,required TResult Function( String requestId, @JsonKey(fromJson: _formatFromJson, toJson: _formatToJson)  ExportFormat format,  String encoderVersion,  String? detail)  unsupported,}) {final _that = this;
switch (_that) {
case EncodeEncoded():
return encoded(_that.requestId,_that.outputReferences,_that.encoderVersion);case EncodeUnsupported():
return unsupported(_that.requestId,_that.format,_that.encoderVersion,_that.detail);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String requestId,  List<String> outputReferences,  String encoderVersion)?  encoded,TResult? Function( String requestId, @JsonKey(fromJson: _formatFromJson, toJson: _formatToJson)  ExportFormat format,  String encoderVersion,  String? detail)?  unsupported,}) {final _that = this;
switch (_that) {
case EncodeEncoded() when encoded != null:
return encoded(_that.requestId,_that.outputReferences,_that.encoderVersion);case EncodeUnsupported() when unsupported != null:
return unsupported(_that.requestId,_that.format,_that.encoderVersion,_that.detail);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class EncodeEncoded implements EncodeResult {
  const EncodeEncoded({required this.requestId, final  List<String> outputReferences = const <String>[], required this.encoderVersion, final  String? $type}): _outputReferences = outputReferences,$type = $type ?? 'encoded';
  factory EncodeEncoded.fromJson(Map<String, dynamic> json) => _$EncodeEncodedFromJson(json);

@override final  String requestId;
 final  List<String> _outputReferences;
@JsonKey() List<String> get outputReferences {
  if (_outputReferences is EqualUnmodifiableListView) return _outputReferences;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_outputReferences);
}

/// Version of the encoder that produced the artefacts (the frozen
/// provenance-versioning precedent).
@override final  String encoderVersion;

@JsonKey(name: 'kind')
final String $type;


/// Create a copy of EncodeResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EncodeEncodedCopyWith<EncodeEncoded> get copyWith => _$EncodeEncodedCopyWithImpl<EncodeEncoded>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EncodeEncodedToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EncodeEncoded&&(identical(other.requestId, requestId) || other.requestId == requestId)&&const DeepCollectionEquality().equals(other._outputReferences, _outputReferences)&&(identical(other.encoderVersion, encoderVersion) || other.encoderVersion == encoderVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId,const DeepCollectionEquality().hash(_outputReferences),encoderVersion);

@override
String toString() {
  return 'EncodeResult.encoded(requestId: $requestId, outputReferences: $outputReferences, encoderVersion: $encoderVersion)';
}


}

/// @nodoc
abstract mixin class $EncodeEncodedCopyWith<$Res> implements $EncodeResultCopyWith<$Res> {
  factory $EncodeEncodedCopyWith(EncodeEncoded value, $Res Function(EncodeEncoded) _then) = _$EncodeEncodedCopyWithImpl;
@override @useResult
$Res call({
 String requestId, List<String> outputReferences, String encoderVersion
});




}
/// @nodoc
class _$EncodeEncodedCopyWithImpl<$Res>
    implements $EncodeEncodedCopyWith<$Res> {
  _$EncodeEncodedCopyWithImpl(this._self, this._then);

  final EncodeEncoded _self;
  final $Res Function(EncodeEncoded) _then;

/// Create a copy of EncodeResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestId = null,Object? outputReferences = null,Object? encoderVersion = null,}) {
  return _then(EncodeEncoded(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,outputReferences: null == outputReferences ? _self._outputReferences : outputReferences // ignore: cast_nullable_to_non_nullable
as List<String>,encoderVersion: null == encoderVersion ? _self.encoderVersion : encoderVersion // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class EncodeUnsupported implements EncodeResult {
  const EncodeUnsupported({required this.requestId, @JsonKey(fromJson: _formatFromJson, toJson: _formatToJson) required this.format, required this.encoderVersion, this.detail, final  String? $type}): $type = $type ?? 'unsupported';
  factory EncodeUnsupported.fromJson(Map<String, dynamic> json) => _$EncodeUnsupportedFromJson(json);

@override final  String requestId;
@JsonKey(fromJson: _formatFromJson, toJson: _formatToJson) final  ExportFormat format;
@override final  String encoderVersion;
 final  String? detail;

@JsonKey(name: 'kind')
final String $type;


/// Create a copy of EncodeResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EncodeUnsupportedCopyWith<EncodeUnsupported> get copyWith => _$EncodeUnsupportedCopyWithImpl<EncodeUnsupported>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EncodeUnsupportedToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EncodeUnsupported&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.format, format) || other.format == format)&&(identical(other.encoderVersion, encoderVersion) || other.encoderVersion == encoderVersion)&&(identical(other.detail, detail) || other.detail == detail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId,format,encoderVersion,detail);

@override
String toString() {
  return 'EncodeResult.unsupported(requestId: $requestId, format: $format, encoderVersion: $encoderVersion, detail: $detail)';
}


}

/// @nodoc
abstract mixin class $EncodeUnsupportedCopyWith<$Res> implements $EncodeResultCopyWith<$Res> {
  factory $EncodeUnsupportedCopyWith(EncodeUnsupported value, $Res Function(EncodeUnsupported) _then) = _$EncodeUnsupportedCopyWithImpl;
@override @useResult
$Res call({
 String requestId,@JsonKey(fromJson: _formatFromJson, toJson: _formatToJson) ExportFormat format, String encoderVersion, String? detail
});




}
/// @nodoc
class _$EncodeUnsupportedCopyWithImpl<$Res>
    implements $EncodeUnsupportedCopyWith<$Res> {
  _$EncodeUnsupportedCopyWithImpl(this._self, this._then);

  final EncodeUnsupported _self;
  final $Res Function(EncodeUnsupported) _then;

/// Create a copy of EncodeResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestId = null,Object? format = null,Object? encoderVersion = null,Object? detail = freezed,}) {
  return _then(EncodeUnsupported(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,format: null == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as ExportFormat,encoderVersion: null == encoderVersion ? _self.encoderVersion : encoderVersion // ignore: cast_nullable_to_non_nullable
as String,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ProductionEncodePlan {

/// The job this plan encodes.
 String get jobId;/// One request per selected `ExportProfile`, in selection order.
 List<EncodeRequest> get requests; Map<String, Object?> get metadata;
/// Create a copy of ProductionEncodePlan
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductionEncodePlanCopyWith<ProductionEncodePlan> get copyWith => _$ProductionEncodePlanCopyWithImpl<ProductionEncodePlan>(this as ProductionEncodePlan, _$identity);

  /// Serializes this ProductionEncodePlan to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductionEncodePlan&&(identical(other.jobId, jobId) || other.jobId == jobId)&&const DeepCollectionEquality().equals(other.requests, requests)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,jobId,const DeepCollectionEquality().hash(requests),const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'ProductionEncodePlan(jobId: $jobId, requests: $requests, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $ProductionEncodePlanCopyWith<$Res>  {
  factory $ProductionEncodePlanCopyWith(ProductionEncodePlan value, $Res Function(ProductionEncodePlan) _then) = _$ProductionEncodePlanCopyWithImpl;
@useResult
$Res call({
 String jobId, List<EncodeRequest> requests, Map<String, Object?> metadata
});




}
/// @nodoc
class _$ProductionEncodePlanCopyWithImpl<$Res>
    implements $ProductionEncodePlanCopyWith<$Res> {
  _$ProductionEncodePlanCopyWithImpl(this._self, this._then);

  final ProductionEncodePlan _self;
  final $Res Function(ProductionEncodePlan) _then;

/// Create a copy of ProductionEncodePlan
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? jobId = null,Object? requests = null,Object? metadata = null,}) {
  return _then(_self.copyWith(
jobId: null == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as String,requests: null == requests ? _self.requests : requests // ignore: cast_nullable_to_non_nullable
as List<EncodeRequest>,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductionEncodePlan].
extension ProductionEncodePlanPatterns on ProductionEncodePlan {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductionEncodePlan value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductionEncodePlan() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductionEncodePlan value)  $default,){
final _that = this;
switch (_that) {
case _ProductionEncodePlan():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductionEncodePlan value)?  $default,){
final _that = this;
switch (_that) {
case _ProductionEncodePlan() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String jobId,  List<EncodeRequest> requests,  Map<String, Object?> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductionEncodePlan() when $default != null:
return $default(_that.jobId,_that.requests,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String jobId,  List<EncodeRequest> requests,  Map<String, Object?> metadata)  $default,) {final _that = this;
switch (_that) {
case _ProductionEncodePlan():
return $default(_that.jobId,_that.requests,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String jobId,  List<EncodeRequest> requests,  Map<String, Object?> metadata)?  $default,) {final _that = this;
switch (_that) {
case _ProductionEncodePlan() when $default != null:
return $default(_that.jobId,_that.requests,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductionEncodePlan implements ProductionEncodePlan {
  const _ProductionEncodePlan({required this.jobId, final  List<EncodeRequest> requests = const <EncodeRequest>[], final  Map<String, Object?> metadata = const <String, Object?>{}}): _requests = requests,_metadata = metadata;
  factory _ProductionEncodePlan.fromJson(Map<String, dynamic> json) => _$ProductionEncodePlanFromJson(json);

/// The job this plan encodes.
@override final  String jobId;
/// One request per selected `ExportProfile`, in selection order.
 final  List<EncodeRequest> _requests;
/// One request per selected `ExportProfile`, in selection order.
@override@JsonKey() List<EncodeRequest> get requests {
  if (_requests is EqualUnmodifiableListView) return _requests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_requests);
}

 final  Map<String, Object?> _metadata;
@override@JsonKey() Map<String, Object?> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of ProductionEncodePlan
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductionEncodePlanCopyWith<_ProductionEncodePlan> get copyWith => __$ProductionEncodePlanCopyWithImpl<_ProductionEncodePlan>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductionEncodePlanToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductionEncodePlan&&(identical(other.jobId, jobId) || other.jobId == jobId)&&const DeepCollectionEquality().equals(other._requests, _requests)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,jobId,const DeepCollectionEquality().hash(_requests),const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'ProductionEncodePlan(jobId: $jobId, requests: $requests, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$ProductionEncodePlanCopyWith<$Res> implements $ProductionEncodePlanCopyWith<$Res> {
  factory _$ProductionEncodePlanCopyWith(_ProductionEncodePlan value, $Res Function(_ProductionEncodePlan) _then) = __$ProductionEncodePlanCopyWithImpl;
@override @useResult
$Res call({
 String jobId, List<EncodeRequest> requests, Map<String, Object?> metadata
});




}
/// @nodoc
class __$ProductionEncodePlanCopyWithImpl<$Res>
    implements _$ProductionEncodePlanCopyWith<$Res> {
  __$ProductionEncodePlanCopyWithImpl(this._self, this._then);

  final _ProductionEncodePlan _self;
  final $Res Function(_ProductionEncodePlan) _then;

/// Create a copy of ProductionEncodePlan
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? jobId = null,Object? requests = null,Object? metadata = null,}) {
  return _then(_ProductionEncodePlan(
jobId: null == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as String,requests: null == requests ? _self._requests : requests // ignore: cast_nullable_to_non_nullable
as List<EncodeRequest>,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}

// dart format on
