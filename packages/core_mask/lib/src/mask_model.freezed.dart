// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mask_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MaskRefinement {

 MaskRefinementKind get kind; double get amount;
/// Create a copy of MaskRefinement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaskRefinementCopyWith<MaskRefinement> get copyWith => _$MaskRefinementCopyWithImpl<MaskRefinement>(this as MaskRefinement, _$identity);

  /// Serializes this MaskRefinement to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaskRefinement&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,amount);

@override
String toString() {
  return 'MaskRefinement(kind: $kind, amount: $amount)';
}


}

/// @nodoc
abstract mixin class $MaskRefinementCopyWith<$Res>  {
  factory $MaskRefinementCopyWith(MaskRefinement value, $Res Function(MaskRefinement) _then) = _$MaskRefinementCopyWithImpl;
@useResult
$Res call({
 MaskRefinementKind kind, double amount
});




}
/// @nodoc
class _$MaskRefinementCopyWithImpl<$Res>
    implements $MaskRefinementCopyWith<$Res> {
  _$MaskRefinementCopyWithImpl(this._self, this._then);

  final MaskRefinement _self;
  final $Res Function(MaskRefinement) _then;

/// Create a copy of MaskRefinement
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? amount = null,}) {
  return _then(_self.copyWith(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as MaskRefinementKind,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [MaskRefinement].
extension MaskRefinementPatterns on MaskRefinement {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MaskRefinement value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MaskRefinement() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MaskRefinement value)  $default,){
final _that = this;
switch (_that) {
case _MaskRefinement():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MaskRefinement value)?  $default,){
final _that = this;
switch (_that) {
case _MaskRefinement() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MaskRefinementKind kind,  double amount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MaskRefinement() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MaskRefinementKind kind,  double amount)  $default,) {final _that = this;
switch (_that) {
case _MaskRefinement():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MaskRefinementKind kind,  double amount)?  $default,) {final _that = this;
switch (_that) {
case _MaskRefinement() when $default != null:
return $default(_that.kind,_that.amount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MaskRefinement implements MaskRefinement {
  const _MaskRefinement({required this.kind, required this.amount});
  factory _MaskRefinement.fromJson(Map<String, dynamic> json) => _$MaskRefinementFromJson(json);

@override final  MaskRefinementKind kind;
@override final  double amount;

/// Create a copy of MaskRefinement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MaskRefinementCopyWith<_MaskRefinement> get copyWith => __$MaskRefinementCopyWithImpl<_MaskRefinement>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MaskRefinementToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MaskRefinement&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,amount);

@override
String toString() {
  return 'MaskRefinement(kind: $kind, amount: $amount)';
}


}

/// @nodoc
abstract mixin class _$MaskRefinementCopyWith<$Res> implements $MaskRefinementCopyWith<$Res> {
  factory _$MaskRefinementCopyWith(_MaskRefinement value, $Res Function(_MaskRefinement) _then) = __$MaskRefinementCopyWithImpl;
@override @useResult
$Res call({
 MaskRefinementKind kind, double amount
});




}
/// @nodoc
class __$MaskRefinementCopyWithImpl<$Res>
    implements _$MaskRefinementCopyWith<$Res> {
  __$MaskRefinementCopyWithImpl(this._self, this._then);

  final _MaskRefinement _self;
  final $Res Function(_MaskRefinement) _then;

/// Create a copy of MaskRefinement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? amount = null,}) {
  return _then(_MaskRefinement(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as MaskRefinementKind,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$MaskModel {

/// Stable UUID.
 String get id; String get name; MaskKind get kind;/// Disabled masks are kept but not applied.
 bool get enabled;/// Inverts the mask's coverage.
 bool get inverted;/// Mask density: 1.0 fully masks, lower values partially reveal.
 double get density;/// Non-destructive refinement pipeline, applied in order.
 List<MaskRefinement> get refinements;/// Canvas-space bounds of the mask content, when known.
 Rect2D? get bounds;/// Open metadata (payloads, AI provenance) until typed models land.
 Map<String, Object?> get metadata;
/// Create a copy of MaskModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaskModelCopyWith<MaskModel> get copyWith => _$MaskModelCopyWithImpl<MaskModel>(this as MaskModel, _$identity);

  /// Serializes this MaskModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaskModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.inverted, inverted) || other.inverted == inverted)&&(identical(other.density, density) || other.density == density)&&const DeepCollectionEquality().equals(other.refinements, refinements)&&(identical(other.bounds, bounds) || other.bounds == bounds)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,kind,enabled,inverted,density,const DeepCollectionEquality().hash(refinements),bounds,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'MaskModel(id: $id, name: $name, kind: $kind, enabled: $enabled, inverted: $inverted, density: $density, refinements: $refinements, bounds: $bounds, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $MaskModelCopyWith<$Res>  {
  factory $MaskModelCopyWith(MaskModel value, $Res Function(MaskModel) _then) = _$MaskModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, MaskKind kind, bool enabled, bool inverted, double density, List<MaskRefinement> refinements, Rect2D? bounds, Map<String, Object?> metadata
});


$Rect2DCopyWith<$Res>? get bounds;

}
/// @nodoc
class _$MaskModelCopyWithImpl<$Res>
    implements $MaskModelCopyWith<$Res> {
  _$MaskModelCopyWithImpl(this._self, this._then);

  final MaskModel _self;
  final $Res Function(MaskModel) _then;

/// Create a copy of MaskModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? kind = null,Object? enabled = null,Object? inverted = null,Object? density = null,Object? refinements = null,Object? bounds = freezed,Object? metadata = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as MaskKind,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,inverted: null == inverted ? _self.inverted : inverted // ignore: cast_nullable_to_non_nullable
as bool,density: null == density ? _self.density : density // ignore: cast_nullable_to_non_nullable
as double,refinements: null == refinements ? _self.refinements : refinements // ignore: cast_nullable_to_non_nullable
as List<MaskRefinement>,bounds: freezed == bounds ? _self.bounds : bounds // ignore: cast_nullable_to_non_nullable
as Rect2D?,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}
/// Create a copy of MaskModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Rect2DCopyWith<$Res>? get bounds {
    if (_self.bounds == null) {
    return null;
  }

  return $Rect2DCopyWith<$Res>(_self.bounds!, (value) {
    return _then(_self.copyWith(bounds: value));
  });
}
}


/// Adds pattern-matching-related methods to [MaskModel].
extension MaskModelPatterns on MaskModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MaskModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MaskModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MaskModel value)  $default,){
final _that = this;
switch (_that) {
case _MaskModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MaskModel value)?  $default,){
final _that = this;
switch (_that) {
case _MaskModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  MaskKind kind,  bool enabled,  bool inverted,  double density,  List<MaskRefinement> refinements,  Rect2D? bounds,  Map<String, Object?> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MaskModel() when $default != null:
return $default(_that.id,_that.name,_that.kind,_that.enabled,_that.inverted,_that.density,_that.refinements,_that.bounds,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  MaskKind kind,  bool enabled,  bool inverted,  double density,  List<MaskRefinement> refinements,  Rect2D? bounds,  Map<String, Object?> metadata)  $default,) {final _that = this;
switch (_that) {
case _MaskModel():
return $default(_that.id,_that.name,_that.kind,_that.enabled,_that.inverted,_that.density,_that.refinements,_that.bounds,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  MaskKind kind,  bool enabled,  bool inverted,  double density,  List<MaskRefinement> refinements,  Rect2D? bounds,  Map<String, Object?> metadata)?  $default,) {final _that = this;
switch (_that) {
case _MaskModel() when $default != null:
return $default(_that.id,_that.name,_that.kind,_that.enabled,_that.inverted,_that.density,_that.refinements,_that.bounds,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MaskModel implements MaskModel {
  const _MaskModel({required this.id, required this.name, required this.kind, this.enabled = true, this.inverted = false, this.density = 1.0, final  List<MaskRefinement> refinements = const <MaskRefinement>[], this.bounds, final  Map<String, Object?> metadata = const <String, Object?>{}}): _refinements = refinements,_metadata = metadata;
  factory _MaskModel.fromJson(Map<String, dynamic> json) => _$MaskModelFromJson(json);

/// Stable UUID.
@override final  String id;
@override final  String name;
@override final  MaskKind kind;
/// Disabled masks are kept but not applied.
@override@JsonKey() final  bool enabled;
/// Inverts the mask's coverage.
@override@JsonKey() final  bool inverted;
/// Mask density: 1.0 fully masks, lower values partially reveal.
@override@JsonKey() final  double density;
/// Non-destructive refinement pipeline, applied in order.
 final  List<MaskRefinement> _refinements;
/// Non-destructive refinement pipeline, applied in order.
@override@JsonKey() List<MaskRefinement> get refinements {
  if (_refinements is EqualUnmodifiableListView) return _refinements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_refinements);
}

/// Canvas-space bounds of the mask content, when known.
@override final  Rect2D? bounds;
/// Open metadata (payloads, AI provenance) until typed models land.
 final  Map<String, Object?> _metadata;
/// Open metadata (payloads, AI provenance) until typed models land.
@override@JsonKey() Map<String, Object?> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of MaskModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MaskModelCopyWith<_MaskModel> get copyWith => __$MaskModelCopyWithImpl<_MaskModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MaskModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MaskModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.inverted, inverted) || other.inverted == inverted)&&(identical(other.density, density) || other.density == density)&&const DeepCollectionEquality().equals(other._refinements, _refinements)&&(identical(other.bounds, bounds) || other.bounds == bounds)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,kind,enabled,inverted,density,const DeepCollectionEquality().hash(_refinements),bounds,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'MaskModel(id: $id, name: $name, kind: $kind, enabled: $enabled, inverted: $inverted, density: $density, refinements: $refinements, bounds: $bounds, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$MaskModelCopyWith<$Res> implements $MaskModelCopyWith<$Res> {
  factory _$MaskModelCopyWith(_MaskModel value, $Res Function(_MaskModel) _then) = __$MaskModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, MaskKind kind, bool enabled, bool inverted, double density, List<MaskRefinement> refinements, Rect2D? bounds, Map<String, Object?> metadata
});


@override $Rect2DCopyWith<$Res>? get bounds;

}
/// @nodoc
class __$MaskModelCopyWithImpl<$Res>
    implements _$MaskModelCopyWith<$Res> {
  __$MaskModelCopyWithImpl(this._self, this._then);

  final _MaskModel _self;
  final $Res Function(_MaskModel) _then;

/// Create a copy of MaskModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? kind = null,Object? enabled = null,Object? inverted = null,Object? density = null,Object? refinements = null,Object? bounds = freezed,Object? metadata = null,}) {
  return _then(_MaskModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as MaskKind,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,inverted: null == inverted ? _self.inverted : inverted // ignore: cast_nullable_to_non_nullable
as bool,density: null == density ? _self.density : density // ignore: cast_nullable_to_non_nullable
as double,refinements: null == refinements ? _self._refinements : refinements // ignore: cast_nullable_to_non_nullable
as List<MaskRefinement>,bounds: freezed == bounds ? _self.bounds : bounds // ignore: cast_nullable_to_non_nullable
as Rect2D?,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

/// Create a copy of MaskModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Rect2DCopyWith<$Res>? get bounds {
    if (_self.bounds == null) {
    return null;
  }

  return $Rect2DCopyWith<$Res>(_self.bounds!, (value) {
    return _then(_self.copyWith(bounds: value));
  });
}
}


/// @nodoc
mixin _$MaskStackEntry {

 MaskModel get mask; MaskBooleanOp get op;
/// Create a copy of MaskStackEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaskStackEntryCopyWith<MaskStackEntry> get copyWith => _$MaskStackEntryCopyWithImpl<MaskStackEntry>(this as MaskStackEntry, _$identity);

  /// Serializes this MaskStackEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaskStackEntry&&(identical(other.mask, mask) || other.mask == mask)&&(identical(other.op, op) || other.op == op));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mask,op);

@override
String toString() {
  return 'MaskStackEntry(mask: $mask, op: $op)';
}


}

/// @nodoc
abstract mixin class $MaskStackEntryCopyWith<$Res>  {
  factory $MaskStackEntryCopyWith(MaskStackEntry value, $Res Function(MaskStackEntry) _then) = _$MaskStackEntryCopyWithImpl;
@useResult
$Res call({
 MaskModel mask, MaskBooleanOp op
});


$MaskModelCopyWith<$Res> get mask;

}
/// @nodoc
class _$MaskStackEntryCopyWithImpl<$Res>
    implements $MaskStackEntryCopyWith<$Res> {
  _$MaskStackEntryCopyWithImpl(this._self, this._then);

  final MaskStackEntry _self;
  final $Res Function(MaskStackEntry) _then;

/// Create a copy of MaskStackEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mask = null,Object? op = null,}) {
  return _then(_self.copyWith(
mask: null == mask ? _self.mask : mask // ignore: cast_nullable_to_non_nullable
as MaskModel,op: null == op ? _self.op : op // ignore: cast_nullable_to_non_nullable
as MaskBooleanOp,
  ));
}
/// Create a copy of MaskStackEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MaskModelCopyWith<$Res> get mask {
  
  return $MaskModelCopyWith<$Res>(_self.mask, (value) {
    return _then(_self.copyWith(mask: value));
  });
}
}


/// Adds pattern-matching-related methods to [MaskStackEntry].
extension MaskStackEntryPatterns on MaskStackEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MaskStackEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MaskStackEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MaskStackEntry value)  $default,){
final _that = this;
switch (_that) {
case _MaskStackEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MaskStackEntry value)?  $default,){
final _that = this;
switch (_that) {
case _MaskStackEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MaskModel mask,  MaskBooleanOp op)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MaskStackEntry() when $default != null:
return $default(_that.mask,_that.op);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MaskModel mask,  MaskBooleanOp op)  $default,) {final _that = this;
switch (_that) {
case _MaskStackEntry():
return $default(_that.mask,_that.op);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MaskModel mask,  MaskBooleanOp op)?  $default,) {final _that = this;
switch (_that) {
case _MaskStackEntry() when $default != null:
return $default(_that.mask,_that.op);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MaskStackEntry implements MaskStackEntry {
  const _MaskStackEntry({required this.mask, this.op = MaskBooleanOp.union});
  factory _MaskStackEntry.fromJson(Map<String, dynamic> json) => _$MaskStackEntryFromJson(json);

@override final  MaskModel mask;
@override@JsonKey() final  MaskBooleanOp op;

/// Create a copy of MaskStackEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MaskStackEntryCopyWith<_MaskStackEntry> get copyWith => __$MaskStackEntryCopyWithImpl<_MaskStackEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MaskStackEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MaskStackEntry&&(identical(other.mask, mask) || other.mask == mask)&&(identical(other.op, op) || other.op == op));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mask,op);

@override
String toString() {
  return 'MaskStackEntry(mask: $mask, op: $op)';
}


}

/// @nodoc
abstract mixin class _$MaskStackEntryCopyWith<$Res> implements $MaskStackEntryCopyWith<$Res> {
  factory _$MaskStackEntryCopyWith(_MaskStackEntry value, $Res Function(_MaskStackEntry) _then) = __$MaskStackEntryCopyWithImpl;
@override @useResult
$Res call({
 MaskModel mask, MaskBooleanOp op
});


@override $MaskModelCopyWith<$Res> get mask;

}
/// @nodoc
class __$MaskStackEntryCopyWithImpl<$Res>
    implements _$MaskStackEntryCopyWith<$Res> {
  __$MaskStackEntryCopyWithImpl(this._self, this._then);

  final _MaskStackEntry _self;
  final $Res Function(_MaskStackEntry) _then;

/// Create a copy of MaskStackEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mask = null,Object? op = null,}) {
  return _then(_MaskStackEntry(
mask: null == mask ? _self.mask : mask // ignore: cast_nullable_to_non_nullable
as MaskModel,op: null == op ? _self.op : op // ignore: cast_nullable_to_non_nullable
as MaskBooleanOp,
  ));
}

/// Create a copy of MaskStackEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MaskModelCopyWith<$Res> get mask {
  
  return $MaskModelCopyWith<$Res>(_self.mask, (value) {
    return _then(_self.copyWith(mask: value));
  });
}
}


/// @nodoc
mixin _$MaskStack {

/// The layer/object this stack applies to.
 String get targetId; List<MaskStackEntry> get entries;
/// Create a copy of MaskStack
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaskStackCopyWith<MaskStack> get copyWith => _$MaskStackCopyWithImpl<MaskStack>(this as MaskStack, _$identity);

  /// Serializes this MaskStack to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaskStack&&(identical(other.targetId, targetId) || other.targetId == targetId)&&const DeepCollectionEquality().equals(other.entries, entries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,targetId,const DeepCollectionEquality().hash(entries));

@override
String toString() {
  return 'MaskStack(targetId: $targetId, entries: $entries)';
}


}

/// @nodoc
abstract mixin class $MaskStackCopyWith<$Res>  {
  factory $MaskStackCopyWith(MaskStack value, $Res Function(MaskStack) _then) = _$MaskStackCopyWithImpl;
@useResult
$Res call({
 String targetId, List<MaskStackEntry> entries
});




}
/// @nodoc
class _$MaskStackCopyWithImpl<$Res>
    implements $MaskStackCopyWith<$Res> {
  _$MaskStackCopyWithImpl(this._self, this._then);

  final MaskStack _self;
  final $Res Function(MaskStack) _then;

/// Create a copy of MaskStack
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? targetId = null,Object? entries = null,}) {
  return _then(_self.copyWith(
targetId: null == targetId ? _self.targetId : targetId // ignore: cast_nullable_to_non_nullable
as String,entries: null == entries ? _self.entries : entries // ignore: cast_nullable_to_non_nullable
as List<MaskStackEntry>,
  ));
}

}


/// Adds pattern-matching-related methods to [MaskStack].
extension MaskStackPatterns on MaskStack {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MaskStack value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MaskStack() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MaskStack value)  $default,){
final _that = this;
switch (_that) {
case _MaskStack():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MaskStack value)?  $default,){
final _that = this;
switch (_that) {
case _MaskStack() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String targetId,  List<MaskStackEntry> entries)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MaskStack() when $default != null:
return $default(_that.targetId,_that.entries);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String targetId,  List<MaskStackEntry> entries)  $default,) {final _that = this;
switch (_that) {
case _MaskStack():
return $default(_that.targetId,_that.entries);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String targetId,  List<MaskStackEntry> entries)?  $default,) {final _that = this;
switch (_that) {
case _MaskStack() when $default != null:
return $default(_that.targetId,_that.entries);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MaskStack extends MaskStack {
  const _MaskStack({required this.targetId, final  List<MaskStackEntry> entries = const <MaskStackEntry>[]}): _entries = entries,super._();
  factory _MaskStack.fromJson(Map<String, dynamic> json) => _$MaskStackFromJson(json);

/// The layer/object this stack applies to.
@override final  String targetId;
 final  List<MaskStackEntry> _entries;
@override@JsonKey() List<MaskStackEntry> get entries {
  if (_entries is EqualUnmodifiableListView) return _entries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entries);
}


/// Create a copy of MaskStack
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MaskStackCopyWith<_MaskStack> get copyWith => __$MaskStackCopyWithImpl<_MaskStack>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MaskStackToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MaskStack&&(identical(other.targetId, targetId) || other.targetId == targetId)&&const DeepCollectionEquality().equals(other._entries, _entries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,targetId,const DeepCollectionEquality().hash(_entries));

@override
String toString() {
  return 'MaskStack(targetId: $targetId, entries: $entries)';
}


}

/// @nodoc
abstract mixin class _$MaskStackCopyWith<$Res> implements $MaskStackCopyWith<$Res> {
  factory _$MaskStackCopyWith(_MaskStack value, $Res Function(_MaskStack) _then) = __$MaskStackCopyWithImpl;
@override @useResult
$Res call({
 String targetId, List<MaskStackEntry> entries
});




}
/// @nodoc
class __$MaskStackCopyWithImpl<$Res>
    implements _$MaskStackCopyWith<$Res> {
  __$MaskStackCopyWithImpl(this._self, this._then);

  final _MaskStack _self;
  final $Res Function(_MaskStack) _then;

/// Create a copy of MaskStack
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? targetId = null,Object? entries = null,}) {
  return _then(_MaskStack(
targetId: null == targetId ? _self.targetId : targetId // ignore: cast_nullable_to_non_nullable
as String,entries: null == entries ? _self._entries : entries // ignore: cast_nullable_to_non_nullable
as List<MaskStackEntry>,
  ));
}


}

// dart format on
