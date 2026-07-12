// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selection_region.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SelectionRefinement {

 SelectionRefinementKind get kind; double get amount;
/// Create a copy of SelectionRefinement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectionRefinementCopyWith<SelectionRefinement> get copyWith => _$SelectionRefinementCopyWithImpl<SelectionRefinement>(this as SelectionRefinement, _$identity);

  /// Serializes this SelectionRefinement to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectionRefinement&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,amount);

@override
String toString() {
  return 'SelectionRefinement(kind: $kind, amount: $amount)';
}


}

/// @nodoc
abstract mixin class $SelectionRefinementCopyWith<$Res>  {
  factory $SelectionRefinementCopyWith(SelectionRefinement value, $Res Function(SelectionRefinement) _then) = _$SelectionRefinementCopyWithImpl;
@useResult
$Res call({
 SelectionRefinementKind kind, double amount
});




}
/// @nodoc
class _$SelectionRefinementCopyWithImpl<$Res>
    implements $SelectionRefinementCopyWith<$Res> {
  _$SelectionRefinementCopyWithImpl(this._self, this._then);

  final SelectionRefinement _self;
  final $Res Function(SelectionRefinement) _then;

/// Create a copy of SelectionRefinement
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? amount = null,}) {
  return _then(_self.copyWith(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as SelectionRefinementKind,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [SelectionRefinement].
extension SelectionRefinementPatterns on SelectionRefinement {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SelectionRefinement value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SelectionRefinement() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SelectionRefinement value)  $default,){
final _that = this;
switch (_that) {
case _SelectionRefinement():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SelectionRefinement value)?  $default,){
final _that = this;
switch (_that) {
case _SelectionRefinement() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SelectionRefinementKind kind,  double amount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SelectionRefinement() when $default != null:
return $default(_that.kind,_that.amount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SelectionRefinementKind kind,  double amount)  $default,) {final _that = this;
switch (_that) {
case _SelectionRefinement():
return $default(_that.kind,_that.amount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SelectionRefinementKind kind,  double amount)?  $default,) {final _that = this;
switch (_that) {
case _SelectionRefinement() when $default != null:
return $default(_that.kind,_that.amount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SelectionRefinement implements SelectionRefinement {
  const _SelectionRefinement({required this.kind, this.amount = 0.0});
  factory _SelectionRefinement.fromJson(Map<String, dynamic> json) => _$SelectionRefinementFromJson(json);

@override final  SelectionRefinementKind kind;
@override@JsonKey() final  double amount;

/// Create a copy of SelectionRefinement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectionRefinementCopyWith<_SelectionRefinement> get copyWith => __$SelectionRefinementCopyWithImpl<_SelectionRefinement>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SelectionRefinementToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectionRefinement&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,amount);

@override
String toString() {
  return 'SelectionRefinement(kind: $kind, amount: $amount)';
}


}

/// @nodoc
abstract mixin class _$SelectionRefinementCopyWith<$Res> implements $SelectionRefinementCopyWith<$Res> {
  factory _$SelectionRefinementCopyWith(_SelectionRefinement value, $Res Function(_SelectionRefinement) _then) = __$SelectionRefinementCopyWithImpl;
@override @useResult
$Res call({
 SelectionRefinementKind kind, double amount
});




}
/// @nodoc
class __$SelectionRefinementCopyWithImpl<$Res>
    implements _$SelectionRefinementCopyWith<$Res> {
  __$SelectionRefinementCopyWithImpl(this._self, this._then);

  final _SelectionRefinement _self;
  final $Res Function(_SelectionRefinement) _then;

/// Create a copy of SelectionRefinement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? amount = null,}) {
  return _then(_SelectionRefinement(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as SelectionRefinementKind,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$SelectionRegion {

/// Stable UUID.
 String get id; SelectionShapeKind get kind;/// Axis-aligned bounds (rectangle/ellipse geometry; envelope for the
/// other techniques).
 Rect2D get bounds;/// Vertices for polygon/lasso; stroke samples for brush.
 List<Point2D> get points;/// Colour tolerance (0..1) for magic wand / select colour / similar.
 double? get tolerance;/// Reference colour (#RRGGBB) for colour-driven techniques.
 String? get colourHex;/// Open metadata (AI prompts, provenance) until typed models land.
 Map<String, Object?> get metadata;
/// Create a copy of SelectionRegion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectionRegionCopyWith<SelectionRegion> get copyWith => _$SelectionRegionCopyWithImpl<SelectionRegion>(this as SelectionRegion, _$identity);

  /// Serializes this SelectionRegion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectionRegion&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.bounds, bounds) || other.bounds == bounds)&&const DeepCollectionEquality().equals(other.points, points)&&(identical(other.tolerance, tolerance) || other.tolerance == tolerance)&&(identical(other.colourHex, colourHex) || other.colourHex == colourHex)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,kind,bounds,const DeepCollectionEquality().hash(points),tolerance,colourHex,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'SelectionRegion(id: $id, kind: $kind, bounds: $bounds, points: $points, tolerance: $tolerance, colourHex: $colourHex, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $SelectionRegionCopyWith<$Res>  {
  factory $SelectionRegionCopyWith(SelectionRegion value, $Res Function(SelectionRegion) _then) = _$SelectionRegionCopyWithImpl;
@useResult
$Res call({
 String id, SelectionShapeKind kind, Rect2D bounds, List<Point2D> points, double? tolerance, String? colourHex, Map<String, Object?> metadata
});


$Rect2DCopyWith<$Res> get bounds;

}
/// @nodoc
class _$SelectionRegionCopyWithImpl<$Res>
    implements $SelectionRegionCopyWith<$Res> {
  _$SelectionRegionCopyWithImpl(this._self, this._then);

  final SelectionRegion _self;
  final $Res Function(SelectionRegion) _then;

/// Create a copy of SelectionRegion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? kind = null,Object? bounds = null,Object? points = null,Object? tolerance = freezed,Object? colourHex = freezed,Object? metadata = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as SelectionShapeKind,bounds: null == bounds ? _self.bounds : bounds // ignore: cast_nullable_to_non_nullable
as Rect2D,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as List<Point2D>,tolerance: freezed == tolerance ? _self.tolerance : tolerance // ignore: cast_nullable_to_non_nullable
as double?,colourHex: freezed == colourHex ? _self.colourHex : colourHex // ignore: cast_nullable_to_non_nullable
as String?,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}
/// Create a copy of SelectionRegion
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Rect2DCopyWith<$Res> get bounds {
  
  return $Rect2DCopyWith<$Res>(_self.bounds, (value) {
    return _then(_self.copyWith(bounds: value));
  });
}
}


/// Adds pattern-matching-related methods to [SelectionRegion].
extension SelectionRegionPatterns on SelectionRegion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SelectionRegion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SelectionRegion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SelectionRegion value)  $default,){
final _that = this;
switch (_that) {
case _SelectionRegion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SelectionRegion value)?  $default,){
final _that = this;
switch (_that) {
case _SelectionRegion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  SelectionShapeKind kind,  Rect2D bounds,  List<Point2D> points,  double? tolerance,  String? colourHex,  Map<String, Object?> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SelectionRegion() when $default != null:
return $default(_that.id,_that.kind,_that.bounds,_that.points,_that.tolerance,_that.colourHex,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  SelectionShapeKind kind,  Rect2D bounds,  List<Point2D> points,  double? tolerance,  String? colourHex,  Map<String, Object?> metadata)  $default,) {final _that = this;
switch (_that) {
case _SelectionRegion():
return $default(_that.id,_that.kind,_that.bounds,_that.points,_that.tolerance,_that.colourHex,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  SelectionShapeKind kind,  Rect2D bounds,  List<Point2D> points,  double? tolerance,  String? colourHex,  Map<String, Object?> metadata)?  $default,) {final _that = this;
switch (_that) {
case _SelectionRegion() when $default != null:
return $default(_that.id,_that.kind,_that.bounds,_that.points,_that.tolerance,_that.colourHex,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SelectionRegion implements SelectionRegion {
  const _SelectionRegion({required this.id, required this.kind, required this.bounds, final  List<Point2D> points = const <Point2D>[], this.tolerance, this.colourHex, final  Map<String, Object?> metadata = const <String, Object?>{}}): _points = points,_metadata = metadata;
  factory _SelectionRegion.fromJson(Map<String, dynamic> json) => _$SelectionRegionFromJson(json);

/// Stable UUID.
@override final  String id;
@override final  SelectionShapeKind kind;
/// Axis-aligned bounds (rectangle/ellipse geometry; envelope for the
/// other techniques).
@override final  Rect2D bounds;
/// Vertices for polygon/lasso; stroke samples for brush.
 final  List<Point2D> _points;
/// Vertices for polygon/lasso; stroke samples for brush.
@override@JsonKey() List<Point2D> get points {
  if (_points is EqualUnmodifiableListView) return _points;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_points);
}

/// Colour tolerance (0..1) for magic wand / select colour / similar.
@override final  double? tolerance;
/// Reference colour (#RRGGBB) for colour-driven techniques.
@override final  String? colourHex;
/// Open metadata (AI prompts, provenance) until typed models land.
 final  Map<String, Object?> _metadata;
/// Open metadata (AI prompts, provenance) until typed models land.
@override@JsonKey() Map<String, Object?> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of SelectionRegion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectionRegionCopyWith<_SelectionRegion> get copyWith => __$SelectionRegionCopyWithImpl<_SelectionRegion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SelectionRegionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectionRegion&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.bounds, bounds) || other.bounds == bounds)&&const DeepCollectionEquality().equals(other._points, _points)&&(identical(other.tolerance, tolerance) || other.tolerance == tolerance)&&(identical(other.colourHex, colourHex) || other.colourHex == colourHex)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,kind,bounds,const DeepCollectionEquality().hash(_points),tolerance,colourHex,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'SelectionRegion(id: $id, kind: $kind, bounds: $bounds, points: $points, tolerance: $tolerance, colourHex: $colourHex, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$SelectionRegionCopyWith<$Res> implements $SelectionRegionCopyWith<$Res> {
  factory _$SelectionRegionCopyWith(_SelectionRegion value, $Res Function(_SelectionRegion) _then) = __$SelectionRegionCopyWithImpl;
@override @useResult
$Res call({
 String id, SelectionShapeKind kind, Rect2D bounds, List<Point2D> points, double? tolerance, String? colourHex, Map<String, Object?> metadata
});


@override $Rect2DCopyWith<$Res> get bounds;

}
/// @nodoc
class __$SelectionRegionCopyWithImpl<$Res>
    implements _$SelectionRegionCopyWith<$Res> {
  __$SelectionRegionCopyWithImpl(this._self, this._then);

  final _SelectionRegion _self;
  final $Res Function(_SelectionRegion) _then;

/// Create a copy of SelectionRegion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? kind = null,Object? bounds = null,Object? points = null,Object? tolerance = freezed,Object? colourHex = freezed,Object? metadata = null,}) {
  return _then(_SelectionRegion(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as SelectionShapeKind,bounds: null == bounds ? _self.bounds : bounds // ignore: cast_nullable_to_non_nullable
as Rect2D,points: null == points ? _self._points : points // ignore: cast_nullable_to_non_nullable
as List<Point2D>,tolerance: freezed == tolerance ? _self.tolerance : tolerance // ignore: cast_nullable_to_non_nullable
as double?,colourHex: freezed == colourHex ? _self.colourHex : colourHex // ignore: cast_nullable_to_non_nullable
as String?,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

/// Create a copy of SelectionRegion
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Rect2DCopyWith<$Res> get bounds {
  
  return $Rect2DCopyWith<$Res>(_self.bounds, (value) {
    return _then(_self.copyWith(bounds: value));
  });
}
}


/// @nodoc
mixin _$SelectionSnapshot {

/// Stable UUID.
 String get id;/// Monotonic revision assigned by the owning history.
 int get revision; List<SelectionRegion> get regions;/// Refinements applied to the combined region, in order.
 List<SelectionRefinement> get refinements;/// Open metadata.
 Map<String, Object?> get metadata;
/// Create a copy of SelectionSnapshot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectionSnapshotCopyWith<SelectionSnapshot> get copyWith => _$SelectionSnapshotCopyWithImpl<SelectionSnapshot>(this as SelectionSnapshot, _$identity);

  /// Serializes this SelectionSnapshot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectionSnapshot&&(identical(other.id, id) || other.id == id)&&(identical(other.revision, revision) || other.revision == revision)&&const DeepCollectionEquality().equals(other.regions, regions)&&const DeepCollectionEquality().equals(other.refinements, refinements)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,revision,const DeepCollectionEquality().hash(regions),const DeepCollectionEquality().hash(refinements),const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'SelectionSnapshot(id: $id, revision: $revision, regions: $regions, refinements: $refinements, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $SelectionSnapshotCopyWith<$Res>  {
  factory $SelectionSnapshotCopyWith(SelectionSnapshot value, $Res Function(SelectionSnapshot) _then) = _$SelectionSnapshotCopyWithImpl;
@useResult
$Res call({
 String id, int revision, List<SelectionRegion> regions, List<SelectionRefinement> refinements, Map<String, Object?> metadata
});




}
/// @nodoc
class _$SelectionSnapshotCopyWithImpl<$Res>
    implements $SelectionSnapshotCopyWith<$Res> {
  _$SelectionSnapshotCopyWithImpl(this._self, this._then);

  final SelectionSnapshot _self;
  final $Res Function(SelectionSnapshot) _then;

/// Create a copy of SelectionSnapshot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? revision = null,Object? regions = null,Object? refinements = null,Object? metadata = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,revision: null == revision ? _self.revision : revision // ignore: cast_nullable_to_non_nullable
as int,regions: null == regions ? _self.regions : regions // ignore: cast_nullable_to_non_nullable
as List<SelectionRegion>,refinements: null == refinements ? _self.refinements : refinements // ignore: cast_nullable_to_non_nullable
as List<SelectionRefinement>,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

}


/// Adds pattern-matching-related methods to [SelectionSnapshot].
extension SelectionSnapshotPatterns on SelectionSnapshot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SelectionSnapshot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SelectionSnapshot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SelectionSnapshot value)  $default,){
final _that = this;
switch (_that) {
case _SelectionSnapshot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SelectionSnapshot value)?  $default,){
final _that = this;
switch (_that) {
case _SelectionSnapshot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int revision,  List<SelectionRegion> regions,  List<SelectionRefinement> refinements,  Map<String, Object?> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SelectionSnapshot() when $default != null:
return $default(_that.id,_that.revision,_that.regions,_that.refinements,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int revision,  List<SelectionRegion> regions,  List<SelectionRefinement> refinements,  Map<String, Object?> metadata)  $default,) {final _that = this;
switch (_that) {
case _SelectionSnapshot():
return $default(_that.id,_that.revision,_that.regions,_that.refinements,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int revision,  List<SelectionRegion> regions,  List<SelectionRefinement> refinements,  Map<String, Object?> metadata)?  $default,) {final _that = this;
switch (_that) {
case _SelectionSnapshot() when $default != null:
return $default(_that.id,_that.revision,_that.regions,_that.refinements,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SelectionSnapshot extends SelectionSnapshot {
  const _SelectionSnapshot({required this.id, required this.revision, final  List<SelectionRegion> regions = const <SelectionRegion>[], final  List<SelectionRefinement> refinements = const <SelectionRefinement>[], final  Map<String, Object?> metadata = const <String, Object?>{}}): _regions = regions,_refinements = refinements,_metadata = metadata,super._();
  factory _SelectionSnapshot.fromJson(Map<String, dynamic> json) => _$SelectionSnapshotFromJson(json);

/// Stable UUID.
@override final  String id;
/// Monotonic revision assigned by the owning history.
@override final  int revision;
 final  List<SelectionRegion> _regions;
@override@JsonKey() List<SelectionRegion> get regions {
  if (_regions is EqualUnmodifiableListView) return _regions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_regions);
}

/// Refinements applied to the combined region, in order.
 final  List<SelectionRefinement> _refinements;
/// Refinements applied to the combined region, in order.
@override@JsonKey() List<SelectionRefinement> get refinements {
  if (_refinements is EqualUnmodifiableListView) return _refinements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_refinements);
}

/// Open metadata.
 final  Map<String, Object?> _metadata;
/// Open metadata.
@override@JsonKey() Map<String, Object?> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of SelectionSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectionSnapshotCopyWith<_SelectionSnapshot> get copyWith => __$SelectionSnapshotCopyWithImpl<_SelectionSnapshot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SelectionSnapshotToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectionSnapshot&&(identical(other.id, id) || other.id == id)&&(identical(other.revision, revision) || other.revision == revision)&&const DeepCollectionEquality().equals(other._regions, _regions)&&const DeepCollectionEquality().equals(other._refinements, _refinements)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,revision,const DeepCollectionEquality().hash(_regions),const DeepCollectionEquality().hash(_refinements),const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'SelectionSnapshot(id: $id, revision: $revision, regions: $regions, refinements: $refinements, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$SelectionSnapshotCopyWith<$Res> implements $SelectionSnapshotCopyWith<$Res> {
  factory _$SelectionSnapshotCopyWith(_SelectionSnapshot value, $Res Function(_SelectionSnapshot) _then) = __$SelectionSnapshotCopyWithImpl;
@override @useResult
$Res call({
 String id, int revision, List<SelectionRegion> regions, List<SelectionRefinement> refinements, Map<String, Object?> metadata
});




}
/// @nodoc
class __$SelectionSnapshotCopyWithImpl<$Res>
    implements _$SelectionSnapshotCopyWith<$Res> {
  __$SelectionSnapshotCopyWithImpl(this._self, this._then);

  final _SelectionSnapshot _self;
  final $Res Function(_SelectionSnapshot) _then;

/// Create a copy of SelectionSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? revision = null,Object? regions = null,Object? refinements = null,Object? metadata = null,}) {
  return _then(_SelectionSnapshot(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,revision: null == revision ? _self.revision : revision // ignore: cast_nullable_to_non_nullable
as int,regions: null == regions ? _self._regions : regions // ignore: cast_nullable_to_non_nullable
as List<SelectionRegion>,refinements: null == refinements ? _self._refinements : refinements // ignore: cast_nullable_to_non_nullable
as List<SelectionRefinement>,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}


/// @nodoc
mixin _$SelectionHistory {

 List<SelectionSnapshot> get snapshots;/// Index of the active snapshot; -1 when empty.
 int get cursor; int get maxSnapshots;
/// Create a copy of SelectionHistory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectionHistoryCopyWith<SelectionHistory> get copyWith => _$SelectionHistoryCopyWithImpl<SelectionHistory>(this as SelectionHistory, _$identity);

  /// Serializes this SelectionHistory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectionHistory&&const DeepCollectionEquality().equals(other.snapshots, snapshots)&&(identical(other.cursor, cursor) || other.cursor == cursor)&&(identical(other.maxSnapshots, maxSnapshots) || other.maxSnapshots == maxSnapshots));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(snapshots),cursor,maxSnapshots);

@override
String toString() {
  return 'SelectionHistory(snapshots: $snapshots, cursor: $cursor, maxSnapshots: $maxSnapshots)';
}


}

/// @nodoc
abstract mixin class $SelectionHistoryCopyWith<$Res>  {
  factory $SelectionHistoryCopyWith(SelectionHistory value, $Res Function(SelectionHistory) _then) = _$SelectionHistoryCopyWithImpl;
@useResult
$Res call({
 List<SelectionSnapshot> snapshots, int cursor, int maxSnapshots
});




}
/// @nodoc
class _$SelectionHistoryCopyWithImpl<$Res>
    implements $SelectionHistoryCopyWith<$Res> {
  _$SelectionHistoryCopyWithImpl(this._self, this._then);

  final SelectionHistory _self;
  final $Res Function(SelectionHistory) _then;

/// Create a copy of SelectionHistory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? snapshots = null,Object? cursor = null,Object? maxSnapshots = null,}) {
  return _then(_self.copyWith(
snapshots: null == snapshots ? _self.snapshots : snapshots // ignore: cast_nullable_to_non_nullable
as List<SelectionSnapshot>,cursor: null == cursor ? _self.cursor : cursor // ignore: cast_nullable_to_non_nullable
as int,maxSnapshots: null == maxSnapshots ? _self.maxSnapshots : maxSnapshots // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SelectionHistory].
extension SelectionHistoryPatterns on SelectionHistory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SelectionHistory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SelectionHistory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SelectionHistory value)  $default,){
final _that = this;
switch (_that) {
case _SelectionHistory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SelectionHistory value)?  $default,){
final _that = this;
switch (_that) {
case _SelectionHistory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SelectionSnapshot> snapshots,  int cursor,  int maxSnapshots)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SelectionHistory() when $default != null:
return $default(_that.snapshots,_that.cursor,_that.maxSnapshots);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SelectionSnapshot> snapshots,  int cursor,  int maxSnapshots)  $default,) {final _that = this;
switch (_that) {
case _SelectionHistory():
return $default(_that.snapshots,_that.cursor,_that.maxSnapshots);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SelectionSnapshot> snapshots,  int cursor,  int maxSnapshots)?  $default,) {final _that = this;
switch (_that) {
case _SelectionHistory() when $default != null:
return $default(_that.snapshots,_that.cursor,_that.maxSnapshots);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SelectionHistory extends SelectionHistory {
  const _SelectionHistory({final  List<SelectionSnapshot> snapshots = const <SelectionSnapshot>[], this.cursor = -1, this.maxSnapshots = 64}): _snapshots = snapshots,super._();
  factory _SelectionHistory.fromJson(Map<String, dynamic> json) => _$SelectionHistoryFromJson(json);

 final  List<SelectionSnapshot> _snapshots;
@override@JsonKey() List<SelectionSnapshot> get snapshots {
  if (_snapshots is EqualUnmodifiableListView) return _snapshots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_snapshots);
}

/// Index of the active snapshot; -1 when empty.
@override@JsonKey() final  int cursor;
@override@JsonKey() final  int maxSnapshots;

/// Create a copy of SelectionHistory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectionHistoryCopyWith<_SelectionHistory> get copyWith => __$SelectionHistoryCopyWithImpl<_SelectionHistory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SelectionHistoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectionHistory&&const DeepCollectionEquality().equals(other._snapshots, _snapshots)&&(identical(other.cursor, cursor) || other.cursor == cursor)&&(identical(other.maxSnapshots, maxSnapshots) || other.maxSnapshots == maxSnapshots));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_snapshots),cursor,maxSnapshots);

@override
String toString() {
  return 'SelectionHistory(snapshots: $snapshots, cursor: $cursor, maxSnapshots: $maxSnapshots)';
}


}

/// @nodoc
abstract mixin class _$SelectionHistoryCopyWith<$Res> implements $SelectionHistoryCopyWith<$Res> {
  factory _$SelectionHistoryCopyWith(_SelectionHistory value, $Res Function(_SelectionHistory) _then) = __$SelectionHistoryCopyWithImpl;
@override @useResult
$Res call({
 List<SelectionSnapshot> snapshots, int cursor, int maxSnapshots
});




}
/// @nodoc
class __$SelectionHistoryCopyWithImpl<$Res>
    implements _$SelectionHistoryCopyWith<$Res> {
  __$SelectionHistoryCopyWithImpl(this._self, this._then);

  final _SelectionHistory _self;
  final $Res Function(_SelectionHistory) _then;

/// Create a copy of SelectionHistory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? snapshots = null,Object? cursor = null,Object? maxSnapshots = null,}) {
  return _then(_SelectionHistory(
snapshots: null == snapshots ? _self._snapshots : snapshots // ignore: cast_nullable_to_non_nullable
as List<SelectionSnapshot>,cursor: null == cursor ? _self.cursor : cursor // ignore: cast_nullable_to_non_nullable
as int,maxSnapshots: null == maxSnapshots ? _self.maxSnapshots : maxSnapshots // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
