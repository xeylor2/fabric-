// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hit_test.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HitTestQuery {

/// Pointer position in screen space.
 Point2D get screenPoint;/// Slop radius in screen pixels for near-miss targets (handles, guides).
 double get tolerance;
/// Create a copy of HitTestQuery
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HitTestQueryCopyWith<HitTestQuery> get copyWith => _$HitTestQueryCopyWithImpl<HitTestQuery>(this as HitTestQuery, _$identity);

  /// Serializes this HitTestQuery to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HitTestQuery&&(identical(other.screenPoint, screenPoint) || other.screenPoint == screenPoint)&&(identical(other.tolerance, tolerance) || other.tolerance == tolerance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,screenPoint,tolerance);

@override
String toString() {
  return 'HitTestQuery(screenPoint: $screenPoint, tolerance: $tolerance)';
}


}

/// @nodoc
abstract mixin class $HitTestQueryCopyWith<$Res>  {
  factory $HitTestQueryCopyWith(HitTestQuery value, $Res Function(HitTestQuery) _then) = _$HitTestQueryCopyWithImpl;
@useResult
$Res call({
 Point2D screenPoint, double tolerance
});


$Point2DCopyWith<$Res> get screenPoint;

}
/// @nodoc
class _$HitTestQueryCopyWithImpl<$Res>
    implements $HitTestQueryCopyWith<$Res> {
  _$HitTestQueryCopyWithImpl(this._self, this._then);

  final HitTestQuery _self;
  final $Res Function(HitTestQuery) _then;

/// Create a copy of HitTestQuery
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? screenPoint = null,Object? tolerance = null,}) {
  return _then(_self.copyWith(
screenPoint: null == screenPoint ? _self.screenPoint : screenPoint // ignore: cast_nullable_to_non_nullable
as Point2D,tolerance: null == tolerance ? _self.tolerance : tolerance // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of HitTestQuery
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Point2DCopyWith<$Res> get screenPoint {
  
  return $Point2DCopyWith<$Res>(_self.screenPoint, (value) {
    return _then(_self.copyWith(screenPoint: value));
  });
}
}


/// Adds pattern-matching-related methods to [HitTestQuery].
extension HitTestQueryPatterns on HitTestQuery {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HitTestQuery value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HitTestQuery() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HitTestQuery value)  $default,){
final _that = this;
switch (_that) {
case _HitTestQuery():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HitTestQuery value)?  $default,){
final _that = this;
switch (_that) {
case _HitTestQuery() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Point2D screenPoint,  double tolerance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HitTestQuery() when $default != null:
return $default(_that.screenPoint,_that.tolerance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Point2D screenPoint,  double tolerance)  $default,) {final _that = this;
switch (_that) {
case _HitTestQuery():
return $default(_that.screenPoint,_that.tolerance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Point2D screenPoint,  double tolerance)?  $default,) {final _that = this;
switch (_that) {
case _HitTestQuery() when $default != null:
return $default(_that.screenPoint,_that.tolerance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HitTestQuery implements HitTestQuery {
  const _HitTestQuery({required this.screenPoint, this.tolerance = 0.0});
  factory _HitTestQuery.fromJson(Map<String, dynamic> json) => _$HitTestQueryFromJson(json);

/// Pointer position in screen space.
@override final  Point2D screenPoint;
/// Slop radius in screen pixels for near-miss targets (handles, guides).
@override@JsonKey() final  double tolerance;

/// Create a copy of HitTestQuery
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HitTestQueryCopyWith<_HitTestQuery> get copyWith => __$HitTestQueryCopyWithImpl<_HitTestQuery>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HitTestQueryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HitTestQuery&&(identical(other.screenPoint, screenPoint) || other.screenPoint == screenPoint)&&(identical(other.tolerance, tolerance) || other.tolerance == tolerance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,screenPoint,tolerance);

@override
String toString() {
  return 'HitTestQuery(screenPoint: $screenPoint, tolerance: $tolerance)';
}


}

/// @nodoc
abstract mixin class _$HitTestQueryCopyWith<$Res> implements $HitTestQueryCopyWith<$Res> {
  factory _$HitTestQueryCopyWith(_HitTestQuery value, $Res Function(_HitTestQuery) _then) = __$HitTestQueryCopyWithImpl;
@override @useResult
$Res call({
 Point2D screenPoint, double tolerance
});


@override $Point2DCopyWith<$Res> get screenPoint;

}
/// @nodoc
class __$HitTestQueryCopyWithImpl<$Res>
    implements _$HitTestQueryCopyWith<$Res> {
  __$HitTestQueryCopyWithImpl(this._self, this._then);

  final _HitTestQuery _self;
  final $Res Function(_HitTestQuery) _then;

/// Create a copy of HitTestQuery
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? screenPoint = null,Object? tolerance = null,}) {
  return _then(_HitTestQuery(
screenPoint: null == screenPoint ? _self.screenPoint : screenPoint // ignore: cast_nullable_to_non_nullable
as Point2D,tolerance: null == tolerance ? _self.tolerance : tolerance // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of HitTestQuery
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Point2DCopyWith<$Res> get screenPoint {
  
  return $Point2DCopyWith<$Res>(_self.screenPoint, (value) {
    return _then(_self.copyWith(screenPoint: value));
  });
}
}


/// @nodoc
mixin _$HitTestResult {

 HitTargetKind get kind;/// The pointer position converted to document space.
 Point2D get documentPoint;/// The resolved Design Tree node id, when [kind] is
/// [HitTargetKind.node]. Null otherwise.
 String? get semanticNodeId;/// The resolved node's semantic type, when known — a convenience for
/// tools so they need not re-resolve the tree.
@JsonKey(fromJson: _typeFromJson, toJson: _typeToJson) DesignNodeType? get nodeType;
/// Create a copy of HitTestResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HitTestResultCopyWith<HitTestResult> get copyWith => _$HitTestResultCopyWithImpl<HitTestResult>(this as HitTestResult, _$identity);

  /// Serializes this HitTestResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HitTestResult&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.documentPoint, documentPoint) || other.documentPoint == documentPoint)&&(identical(other.semanticNodeId, semanticNodeId) || other.semanticNodeId == semanticNodeId)&&(identical(other.nodeType, nodeType) || other.nodeType == nodeType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,documentPoint,semanticNodeId,nodeType);

@override
String toString() {
  return 'HitTestResult(kind: $kind, documentPoint: $documentPoint, semanticNodeId: $semanticNodeId, nodeType: $nodeType)';
}


}

/// @nodoc
abstract mixin class $HitTestResultCopyWith<$Res>  {
  factory $HitTestResultCopyWith(HitTestResult value, $Res Function(HitTestResult) _then) = _$HitTestResultCopyWithImpl;
@useResult
$Res call({
 HitTargetKind kind, Point2D documentPoint, String? semanticNodeId,@JsonKey(fromJson: _typeFromJson, toJson: _typeToJson) DesignNodeType? nodeType
});


$Point2DCopyWith<$Res> get documentPoint;

}
/// @nodoc
class _$HitTestResultCopyWithImpl<$Res>
    implements $HitTestResultCopyWith<$Res> {
  _$HitTestResultCopyWithImpl(this._self, this._then);

  final HitTestResult _self;
  final $Res Function(HitTestResult) _then;

/// Create a copy of HitTestResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? documentPoint = null,Object? semanticNodeId = freezed,Object? nodeType = freezed,}) {
  return _then(_self.copyWith(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as HitTargetKind,documentPoint: null == documentPoint ? _self.documentPoint : documentPoint // ignore: cast_nullable_to_non_nullable
as Point2D,semanticNodeId: freezed == semanticNodeId ? _self.semanticNodeId : semanticNodeId // ignore: cast_nullable_to_non_nullable
as String?,nodeType: freezed == nodeType ? _self.nodeType : nodeType // ignore: cast_nullable_to_non_nullable
as DesignNodeType?,
  ));
}
/// Create a copy of HitTestResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Point2DCopyWith<$Res> get documentPoint {
  
  return $Point2DCopyWith<$Res>(_self.documentPoint, (value) {
    return _then(_self.copyWith(documentPoint: value));
  });
}
}


/// Adds pattern-matching-related methods to [HitTestResult].
extension HitTestResultPatterns on HitTestResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HitTestResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HitTestResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HitTestResult value)  $default,){
final _that = this;
switch (_that) {
case _HitTestResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HitTestResult value)?  $default,){
final _that = this;
switch (_that) {
case _HitTestResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( HitTargetKind kind,  Point2D documentPoint,  String? semanticNodeId, @JsonKey(fromJson: _typeFromJson, toJson: _typeToJson)  DesignNodeType? nodeType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HitTestResult() when $default != null:
return $default(_that.kind,_that.documentPoint,_that.semanticNodeId,_that.nodeType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( HitTargetKind kind,  Point2D documentPoint,  String? semanticNodeId, @JsonKey(fromJson: _typeFromJson, toJson: _typeToJson)  DesignNodeType? nodeType)  $default,) {final _that = this;
switch (_that) {
case _HitTestResult():
return $default(_that.kind,_that.documentPoint,_that.semanticNodeId,_that.nodeType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( HitTargetKind kind,  Point2D documentPoint,  String? semanticNodeId, @JsonKey(fromJson: _typeFromJson, toJson: _typeToJson)  DesignNodeType? nodeType)?  $default,) {final _that = this;
switch (_that) {
case _HitTestResult() when $default != null:
return $default(_that.kind,_that.documentPoint,_that.semanticNodeId,_that.nodeType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HitTestResult extends HitTestResult {
  const _HitTestResult({required this.kind, required this.documentPoint, this.semanticNodeId, @JsonKey(fromJson: _typeFromJson, toJson: _typeToJson) this.nodeType}): super._();
  factory _HitTestResult.fromJson(Map<String, dynamic> json) => _$HitTestResultFromJson(json);

@override final  HitTargetKind kind;
/// The pointer position converted to document space.
@override final  Point2D documentPoint;
/// The resolved Design Tree node id, when [kind] is
/// [HitTargetKind.node]. Null otherwise.
@override final  String? semanticNodeId;
/// The resolved node's semantic type, when known — a convenience for
/// tools so they need not re-resolve the tree.
@override@JsonKey(fromJson: _typeFromJson, toJson: _typeToJson) final  DesignNodeType? nodeType;

/// Create a copy of HitTestResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HitTestResultCopyWith<_HitTestResult> get copyWith => __$HitTestResultCopyWithImpl<_HitTestResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HitTestResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HitTestResult&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.documentPoint, documentPoint) || other.documentPoint == documentPoint)&&(identical(other.semanticNodeId, semanticNodeId) || other.semanticNodeId == semanticNodeId)&&(identical(other.nodeType, nodeType) || other.nodeType == nodeType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,documentPoint,semanticNodeId,nodeType);

@override
String toString() {
  return 'HitTestResult(kind: $kind, documentPoint: $documentPoint, semanticNodeId: $semanticNodeId, nodeType: $nodeType)';
}


}

/// @nodoc
abstract mixin class _$HitTestResultCopyWith<$Res> implements $HitTestResultCopyWith<$Res> {
  factory _$HitTestResultCopyWith(_HitTestResult value, $Res Function(_HitTestResult) _then) = __$HitTestResultCopyWithImpl;
@override @useResult
$Res call({
 HitTargetKind kind, Point2D documentPoint, String? semanticNodeId,@JsonKey(fromJson: _typeFromJson, toJson: _typeToJson) DesignNodeType? nodeType
});


@override $Point2DCopyWith<$Res> get documentPoint;

}
/// @nodoc
class __$HitTestResultCopyWithImpl<$Res>
    implements _$HitTestResultCopyWith<$Res> {
  __$HitTestResultCopyWithImpl(this._self, this._then);

  final _HitTestResult _self;
  final $Res Function(_HitTestResult) _then;

/// Create a copy of HitTestResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? documentPoint = null,Object? semanticNodeId = freezed,Object? nodeType = freezed,}) {
  return _then(_HitTestResult(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as HitTargetKind,documentPoint: null == documentPoint ? _self.documentPoint : documentPoint // ignore: cast_nullable_to_non_nullable
as Point2D,semanticNodeId: freezed == semanticNodeId ? _self.semanticNodeId : semanticNodeId // ignore: cast_nullable_to_non_nullable
as String?,nodeType: freezed == nodeType ? _self.nodeType : nodeType // ignore: cast_nullable_to_non_nullable
as DesignNodeType?,
  ));
}

/// Create a copy of HitTestResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Point2DCopyWith<$Res> get documentPoint {
  
  return $Point2DCopyWith<$Res>(_self.documentPoint, (value) {
    return _then(_self.copyWith(documentPoint: value));
  });
}
}

// dart format on
