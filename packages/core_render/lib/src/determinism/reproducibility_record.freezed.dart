// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reproducibility_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReproducibilityRecord {

/// The document revision rendered (immutable, hash-pinnable).
 RevisionId get revision;/// The target rendered.
 RenderTarget get target;/// The backend identity that produced the frame.
 String get backendId;/// The backend's declared determinism level (wire name).
 String get determinismLevel;/// Output colour space (frozen `core_asset`).
@JsonKey(fromJson: _colourFromJson, toJson: _colourToJson) AssetColourSpace get colourSpace;
/// Create a copy of ReproducibilityRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReproducibilityRecordCopyWith<ReproducibilityRecord> get copyWith => _$ReproducibilityRecordCopyWithImpl<ReproducibilityRecord>(this as ReproducibilityRecord, _$identity);

  /// Serializes this ReproducibilityRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReproducibilityRecord&&(identical(other.revision, revision) || other.revision == revision)&&(identical(other.target, target) || other.target == target)&&(identical(other.backendId, backendId) || other.backendId == backendId)&&(identical(other.determinismLevel, determinismLevel) || other.determinismLevel == determinismLevel)&&(identical(other.colourSpace, colourSpace) || other.colourSpace == colourSpace));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,revision,target,backendId,determinismLevel,colourSpace);

@override
String toString() {
  return 'ReproducibilityRecord(revision: $revision, target: $target, backendId: $backendId, determinismLevel: $determinismLevel, colourSpace: $colourSpace)';
}


}

/// @nodoc
abstract mixin class $ReproducibilityRecordCopyWith<$Res>  {
  factory $ReproducibilityRecordCopyWith(ReproducibilityRecord value, $Res Function(ReproducibilityRecord) _then) = _$ReproducibilityRecordCopyWithImpl;
@useResult
$Res call({
 RevisionId revision, RenderTarget target, String backendId, String determinismLevel,@JsonKey(fromJson: _colourFromJson, toJson: _colourToJson) AssetColourSpace colourSpace
});


$RevisionIdCopyWith<$Res> get revision;$RenderTargetCopyWith<$Res> get target;

}
/// @nodoc
class _$ReproducibilityRecordCopyWithImpl<$Res>
    implements $ReproducibilityRecordCopyWith<$Res> {
  _$ReproducibilityRecordCopyWithImpl(this._self, this._then);

  final ReproducibilityRecord _self;
  final $Res Function(ReproducibilityRecord) _then;

/// Create a copy of ReproducibilityRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? revision = null,Object? target = null,Object? backendId = null,Object? determinismLevel = null,Object? colourSpace = null,}) {
  return _then(_self.copyWith(
revision: null == revision ? _self.revision : revision // ignore: cast_nullable_to_non_nullable
as RevisionId,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as RenderTarget,backendId: null == backendId ? _self.backendId : backendId // ignore: cast_nullable_to_non_nullable
as String,determinismLevel: null == determinismLevel ? _self.determinismLevel : determinismLevel // ignore: cast_nullable_to_non_nullable
as String,colourSpace: null == colourSpace ? _self.colourSpace : colourSpace // ignore: cast_nullable_to_non_nullable
as AssetColourSpace,
  ));
}
/// Create a copy of ReproducibilityRecord
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RevisionIdCopyWith<$Res> get revision {
  
  return $RevisionIdCopyWith<$Res>(_self.revision, (value) {
    return _then(_self.copyWith(revision: value));
  });
}/// Create a copy of ReproducibilityRecord
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RenderTargetCopyWith<$Res> get target {
  
  return $RenderTargetCopyWith<$Res>(_self.target, (value) {
    return _then(_self.copyWith(target: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReproducibilityRecord].
extension ReproducibilityRecordPatterns on ReproducibilityRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReproducibilityRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReproducibilityRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReproducibilityRecord value)  $default,){
final _that = this;
switch (_that) {
case _ReproducibilityRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReproducibilityRecord value)?  $default,){
final _that = this;
switch (_that) {
case _ReproducibilityRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RevisionId revision,  RenderTarget target,  String backendId,  String determinismLevel, @JsonKey(fromJson: _colourFromJson, toJson: _colourToJson)  AssetColourSpace colourSpace)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReproducibilityRecord() when $default != null:
return $default(_that.revision,_that.target,_that.backendId,_that.determinismLevel,_that.colourSpace);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RevisionId revision,  RenderTarget target,  String backendId,  String determinismLevel, @JsonKey(fromJson: _colourFromJson, toJson: _colourToJson)  AssetColourSpace colourSpace)  $default,) {final _that = this;
switch (_that) {
case _ReproducibilityRecord():
return $default(_that.revision,_that.target,_that.backendId,_that.determinismLevel,_that.colourSpace);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RevisionId revision,  RenderTarget target,  String backendId,  String determinismLevel, @JsonKey(fromJson: _colourFromJson, toJson: _colourToJson)  AssetColourSpace colourSpace)?  $default,) {final _that = this;
switch (_that) {
case _ReproducibilityRecord() when $default != null:
return $default(_that.revision,_that.target,_that.backendId,_that.determinismLevel,_that.colourSpace);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReproducibilityRecord implements ReproducibilityRecord {
  const _ReproducibilityRecord({required this.revision, required this.target, required this.backendId, required this.determinismLevel, @JsonKey(fromJson: _colourFromJson, toJson: _colourToJson) this.colourSpace = AssetColourSpace.cmyk});
  factory _ReproducibilityRecord.fromJson(Map<String, dynamic> json) => _$ReproducibilityRecordFromJson(json);

/// The document revision rendered (immutable, hash-pinnable).
@override final  RevisionId revision;
/// The target rendered.
@override final  RenderTarget target;
/// The backend identity that produced the frame.
@override final  String backendId;
/// The backend's declared determinism level (wire name).
@override final  String determinismLevel;
/// Output colour space (frozen `core_asset`).
@override@JsonKey(fromJson: _colourFromJson, toJson: _colourToJson) final  AssetColourSpace colourSpace;

/// Create a copy of ReproducibilityRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReproducibilityRecordCopyWith<_ReproducibilityRecord> get copyWith => __$ReproducibilityRecordCopyWithImpl<_ReproducibilityRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReproducibilityRecordToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReproducibilityRecord&&(identical(other.revision, revision) || other.revision == revision)&&(identical(other.target, target) || other.target == target)&&(identical(other.backendId, backendId) || other.backendId == backendId)&&(identical(other.determinismLevel, determinismLevel) || other.determinismLevel == determinismLevel)&&(identical(other.colourSpace, colourSpace) || other.colourSpace == colourSpace));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,revision,target,backendId,determinismLevel,colourSpace);

@override
String toString() {
  return 'ReproducibilityRecord(revision: $revision, target: $target, backendId: $backendId, determinismLevel: $determinismLevel, colourSpace: $colourSpace)';
}


}

/// @nodoc
abstract mixin class _$ReproducibilityRecordCopyWith<$Res> implements $ReproducibilityRecordCopyWith<$Res> {
  factory _$ReproducibilityRecordCopyWith(_ReproducibilityRecord value, $Res Function(_ReproducibilityRecord) _then) = __$ReproducibilityRecordCopyWithImpl;
@override @useResult
$Res call({
 RevisionId revision, RenderTarget target, String backendId, String determinismLevel,@JsonKey(fromJson: _colourFromJson, toJson: _colourToJson) AssetColourSpace colourSpace
});


@override $RevisionIdCopyWith<$Res> get revision;@override $RenderTargetCopyWith<$Res> get target;

}
/// @nodoc
class __$ReproducibilityRecordCopyWithImpl<$Res>
    implements _$ReproducibilityRecordCopyWith<$Res> {
  __$ReproducibilityRecordCopyWithImpl(this._self, this._then);

  final _ReproducibilityRecord _self;
  final $Res Function(_ReproducibilityRecord) _then;

/// Create a copy of ReproducibilityRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? revision = null,Object? target = null,Object? backendId = null,Object? determinismLevel = null,Object? colourSpace = null,}) {
  return _then(_ReproducibilityRecord(
revision: null == revision ? _self.revision : revision // ignore: cast_nullable_to_non_nullable
as RevisionId,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as RenderTarget,backendId: null == backendId ? _self.backendId : backendId // ignore: cast_nullable_to_non_nullable
as String,determinismLevel: null == determinismLevel ? _self.determinismLevel : determinismLevel // ignore: cast_nullable_to_non_nullable
as String,colourSpace: null == colourSpace ? _self.colourSpace : colourSpace // ignore: cast_nullable_to_non_nullable
as AssetColourSpace,
  ));
}

/// Create a copy of ReproducibilityRecord
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RevisionIdCopyWith<$Res> get revision {
  
  return $RevisionIdCopyWith<$Res>(_self.revision, (value) {
    return _then(_self.copyWith(revision: value));
  });
}/// Create a copy of ReproducibilityRecord
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RenderTargetCopyWith<$Res> get target {
  
  return $RenderTargetCopyWith<$Res>(_self.target, (value) {
    return _then(_self.copyWith(target: value));
  });
}
}

// dart format on
