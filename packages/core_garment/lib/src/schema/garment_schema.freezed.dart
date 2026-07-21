// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'garment_schema.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PartInsets {

 double get left; double get top; double get right; double get bottom;
/// Create a copy of PartInsets
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartInsetsCopyWith<PartInsets> get copyWith => _$PartInsetsCopyWithImpl<PartInsets>(this as PartInsets, _$identity);

  /// Serializes this PartInsets to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartInsets&&(identical(other.left, left) || other.left == left)&&(identical(other.top, top) || other.top == top)&&(identical(other.right, right) || other.right == right)&&(identical(other.bottom, bottom) || other.bottom == bottom));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,left,top,right,bottom);

@override
String toString() {
  return 'PartInsets(left: $left, top: $top, right: $right, bottom: $bottom)';
}


}

/// @nodoc
abstract mixin class $PartInsetsCopyWith<$Res>  {
  factory $PartInsetsCopyWith(PartInsets value, $Res Function(PartInsets) _then) = _$PartInsetsCopyWithImpl;
@useResult
$Res call({
 double left, double top, double right, double bottom
});




}
/// @nodoc
class _$PartInsetsCopyWithImpl<$Res>
    implements $PartInsetsCopyWith<$Res> {
  _$PartInsetsCopyWithImpl(this._self, this._then);

  final PartInsets _self;
  final $Res Function(PartInsets) _then;

/// Create a copy of PartInsets
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? left = null,Object? top = null,Object? right = null,Object? bottom = null,}) {
  return _then(_self.copyWith(
left: null == left ? _self.left : left // ignore: cast_nullable_to_non_nullable
as double,top: null == top ? _self.top : top // ignore: cast_nullable_to_non_nullable
as double,right: null == right ? _self.right : right // ignore: cast_nullable_to_non_nullable
as double,bottom: null == bottom ? _self.bottom : bottom // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [PartInsets].
extension PartInsetsPatterns on PartInsets {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PartInsets value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PartInsets() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PartInsets value)  $default,){
final _that = this;
switch (_that) {
case _PartInsets():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PartInsets value)?  $default,){
final _that = this;
switch (_that) {
case _PartInsets() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double left,  double top,  double right,  double bottom)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PartInsets() when $default != null:
return $default(_that.left,_that.top,_that.right,_that.bottom);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double left,  double top,  double right,  double bottom)  $default,) {final _that = this;
switch (_that) {
case _PartInsets():
return $default(_that.left,_that.top,_that.right,_that.bottom);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double left,  double top,  double right,  double bottom)?  $default,) {final _that = this;
switch (_that) {
case _PartInsets() when $default != null:
return $default(_that.left,_that.top,_that.right,_that.bottom);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PartInsets extends PartInsets {
  const _PartInsets({this.left = 0.0, this.top = 0.0, this.right = 0.0, this.bottom = 0.0}): assert(left >= 0 && top >= 0 && right >= 0 && bottom >= 0, 'insets must be non-negative'),super._();
  factory _PartInsets.fromJson(Map<String, dynamic> json) => _$PartInsetsFromJson(json);

@override@JsonKey() final  double left;
@override@JsonKey() final  double top;
@override@JsonKey() final  double right;
@override@JsonKey() final  double bottom;

/// Create a copy of PartInsets
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PartInsetsCopyWith<_PartInsets> get copyWith => __$PartInsetsCopyWithImpl<_PartInsets>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PartInsetsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PartInsets&&(identical(other.left, left) || other.left == left)&&(identical(other.top, top) || other.top == top)&&(identical(other.right, right) || other.right == right)&&(identical(other.bottom, bottom) || other.bottom == bottom));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,left,top,right,bottom);

@override
String toString() {
  return 'PartInsets(left: $left, top: $top, right: $right, bottom: $bottom)';
}


}

/// @nodoc
abstract mixin class _$PartInsetsCopyWith<$Res> implements $PartInsetsCopyWith<$Res> {
  factory _$PartInsetsCopyWith(_PartInsets value, $Res Function(_PartInsets) _then) = __$PartInsetsCopyWithImpl;
@override @useResult
$Res call({
 double left, double top, double right, double bottom
});




}
/// @nodoc
class __$PartInsetsCopyWithImpl<$Res>
    implements _$PartInsetsCopyWith<$Res> {
  __$PartInsetsCopyWithImpl(this._self, this._then);

  final _PartInsets _self;
  final $Res Function(_PartInsets) _then;

/// Create a copy of PartInsets
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? left = null,Object? top = null,Object? right = null,Object? bottom = null,}) {
  return _then(_PartInsets(
left: null == left ? _self.left : left // ignore: cast_nullable_to_non_nullable
as double,top: null == top ? _self.top : top // ignore: cast_nullable_to_non_nullable
as double,right: null == right ? _self.right : right // ignore: cast_nullable_to_non_nullable
as double,bottom: null == bottom ? _self.bottom : bottom // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$ZoneSlot {

/// Stable slot id (unique within its part definition).
 String get id; String get name;/// Accepted content hints — wire strings (e.g. frozen
/// `TextileObjectType` wire names); free-form, injected schema data.
 List<String> get accepts;
/// Create a copy of ZoneSlot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ZoneSlotCopyWith<ZoneSlot> get copyWith => _$ZoneSlotCopyWithImpl<ZoneSlot>(this as ZoneSlot, _$identity);

  /// Serializes this ZoneSlot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ZoneSlot&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.accepts, accepts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(accepts));

@override
String toString() {
  return 'ZoneSlot(id: $id, name: $name, accepts: $accepts)';
}


}

/// @nodoc
abstract mixin class $ZoneSlotCopyWith<$Res>  {
  factory $ZoneSlotCopyWith(ZoneSlot value, $Res Function(ZoneSlot) _then) = _$ZoneSlotCopyWithImpl;
@useResult
$Res call({
 String id, String name, List<String> accepts
});




}
/// @nodoc
class _$ZoneSlotCopyWithImpl<$Res>
    implements $ZoneSlotCopyWith<$Res> {
  _$ZoneSlotCopyWithImpl(this._self, this._then);

  final ZoneSlot _self;
  final $Res Function(ZoneSlot) _then;

/// Create a copy of ZoneSlot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? accepts = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,accepts: null == accepts ? _self.accepts : accepts // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ZoneSlot].
extension ZoneSlotPatterns on ZoneSlot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ZoneSlot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ZoneSlot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ZoneSlot value)  $default,){
final _that = this;
switch (_that) {
case _ZoneSlot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ZoneSlot value)?  $default,){
final _that = this;
switch (_that) {
case _ZoneSlot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  List<String> accepts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ZoneSlot() when $default != null:
return $default(_that.id,_that.name,_that.accepts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  List<String> accepts)  $default,) {final _that = this;
switch (_that) {
case _ZoneSlot():
return $default(_that.id,_that.name,_that.accepts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  List<String> accepts)?  $default,) {final _that = this;
switch (_that) {
case _ZoneSlot() when $default != null:
return $default(_that.id,_that.name,_that.accepts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ZoneSlot implements ZoneSlot {
  const _ZoneSlot({required this.id, required this.name, final  List<String> accepts = const <String>[]}): _accepts = accepts;
  factory _ZoneSlot.fromJson(Map<String, dynamic> json) => _$ZoneSlotFromJson(json);

/// Stable slot id (unique within its part definition).
@override final  String id;
@override final  String name;
/// Accepted content hints — wire strings (e.g. frozen
/// `TextileObjectType` wire names); free-form, injected schema data.
 final  List<String> _accepts;
/// Accepted content hints — wire strings (e.g. frozen
/// `TextileObjectType` wire names); free-form, injected schema data.
@override@JsonKey() List<String> get accepts {
  if (_accepts is EqualUnmodifiableListView) return _accepts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_accepts);
}


/// Create a copy of ZoneSlot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ZoneSlotCopyWith<_ZoneSlot> get copyWith => __$ZoneSlotCopyWithImpl<_ZoneSlot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ZoneSlotToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ZoneSlot&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._accepts, _accepts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_accepts));

@override
String toString() {
  return 'ZoneSlot(id: $id, name: $name, accepts: $accepts)';
}


}

/// @nodoc
abstract mixin class _$ZoneSlotCopyWith<$Res> implements $ZoneSlotCopyWith<$Res> {
  factory _$ZoneSlotCopyWith(_ZoneSlot value, $Res Function(_ZoneSlot) _then) = __$ZoneSlotCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, List<String> accepts
});




}
/// @nodoc
class __$ZoneSlotCopyWithImpl<$Res>
    implements _$ZoneSlotCopyWith<$Res> {
  __$ZoneSlotCopyWithImpl(this._self, this._then);

  final _ZoneSlot _self;
  final $Res Function(_ZoneSlot) _then;

/// Create a copy of ZoneSlot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? accepts = null,}) {
  return _then(_ZoneSlot(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,accepts: null == accepts ? _self._accepts : accepts // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$PartDefinition {

/// The frozen part vocabulary this definition types.
@JsonKey(fromJson: _partFromJson, toJson: _partToJson) GarmentPart get part;/// How many instances a garment carries (2 for mirrored pairs).
 int get cardinality;/// Flat-panel size (printable 2D region) in the schema's unit.
 Size2D get panelSize;/// Seam allowance insets, relative to the panel.
 PartInsets get seamAllowance;/// Bleed insets, relative to the panel.
 PartInsets get bleed;/// Declared content slots.
 List<ZoneSlot> get zoneSlots;/// Allowed style variants — wire strings (§3 "structure variants as
/// swaps"; the swap engine is a later slice). Injected schema data.
 List<String> get allowedVariants;/// Symmetry group name; parts sharing a group share content by
/// default (§3 "symmetry links"). Null = unlinked.
 String? get symmetryGroup;/// Open schema data (anchors ride `metadata['anchors']` until a
/// consuming slice freezes their type).
 Map<String, Object?> get metadata;
/// Create a copy of PartDefinition
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartDefinitionCopyWith<PartDefinition> get copyWith => _$PartDefinitionCopyWithImpl<PartDefinition>(this as PartDefinition, _$identity);

  /// Serializes this PartDefinition to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartDefinition&&(identical(other.part, part) || other.part == part)&&(identical(other.cardinality, cardinality) || other.cardinality == cardinality)&&(identical(other.panelSize, panelSize) || other.panelSize == panelSize)&&(identical(other.seamAllowance, seamAllowance) || other.seamAllowance == seamAllowance)&&(identical(other.bleed, bleed) || other.bleed == bleed)&&const DeepCollectionEquality().equals(other.zoneSlots, zoneSlots)&&const DeepCollectionEquality().equals(other.allowedVariants, allowedVariants)&&(identical(other.symmetryGroup, symmetryGroup) || other.symmetryGroup == symmetryGroup)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,part,cardinality,panelSize,seamAllowance,bleed,const DeepCollectionEquality().hash(zoneSlots),const DeepCollectionEquality().hash(allowedVariants),symmetryGroup,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'PartDefinition(part: $part, cardinality: $cardinality, panelSize: $panelSize, seamAllowance: $seamAllowance, bleed: $bleed, zoneSlots: $zoneSlots, allowedVariants: $allowedVariants, symmetryGroup: $symmetryGroup, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $PartDefinitionCopyWith<$Res>  {
  factory $PartDefinitionCopyWith(PartDefinition value, $Res Function(PartDefinition) _then) = _$PartDefinitionCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _partFromJson, toJson: _partToJson) GarmentPart part, int cardinality, Size2D panelSize, PartInsets seamAllowance, PartInsets bleed, List<ZoneSlot> zoneSlots, List<String> allowedVariants, String? symmetryGroup, Map<String, Object?> metadata
});


$Size2DCopyWith<$Res> get panelSize;$PartInsetsCopyWith<$Res> get seamAllowance;$PartInsetsCopyWith<$Res> get bleed;

}
/// @nodoc
class _$PartDefinitionCopyWithImpl<$Res>
    implements $PartDefinitionCopyWith<$Res> {
  _$PartDefinitionCopyWithImpl(this._self, this._then);

  final PartDefinition _self;
  final $Res Function(PartDefinition) _then;

/// Create a copy of PartDefinition
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? part = null,Object? cardinality = null,Object? panelSize = null,Object? seamAllowance = null,Object? bleed = null,Object? zoneSlots = null,Object? allowedVariants = null,Object? symmetryGroup = freezed,Object? metadata = null,}) {
  return _then(_self.copyWith(
part: null == part ? _self.part : part // ignore: cast_nullable_to_non_nullable
as GarmentPart,cardinality: null == cardinality ? _self.cardinality : cardinality // ignore: cast_nullable_to_non_nullable
as int,panelSize: null == panelSize ? _self.panelSize : panelSize // ignore: cast_nullable_to_non_nullable
as Size2D,seamAllowance: null == seamAllowance ? _self.seamAllowance : seamAllowance // ignore: cast_nullable_to_non_nullable
as PartInsets,bleed: null == bleed ? _self.bleed : bleed // ignore: cast_nullable_to_non_nullable
as PartInsets,zoneSlots: null == zoneSlots ? _self.zoneSlots : zoneSlots // ignore: cast_nullable_to_non_nullable
as List<ZoneSlot>,allowedVariants: null == allowedVariants ? _self.allowedVariants : allowedVariants // ignore: cast_nullable_to_non_nullable
as List<String>,symmetryGroup: freezed == symmetryGroup ? _self.symmetryGroup : symmetryGroup // ignore: cast_nullable_to_non_nullable
as String?,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}
/// Create a copy of PartDefinition
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Size2DCopyWith<$Res> get panelSize {
  
  return $Size2DCopyWith<$Res>(_self.panelSize, (value) {
    return _then(_self.copyWith(panelSize: value));
  });
}/// Create a copy of PartDefinition
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PartInsetsCopyWith<$Res> get seamAllowance {
  
  return $PartInsetsCopyWith<$Res>(_self.seamAllowance, (value) {
    return _then(_self.copyWith(seamAllowance: value));
  });
}/// Create a copy of PartDefinition
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PartInsetsCopyWith<$Res> get bleed {
  
  return $PartInsetsCopyWith<$Res>(_self.bleed, (value) {
    return _then(_self.copyWith(bleed: value));
  });
}
}


/// Adds pattern-matching-related methods to [PartDefinition].
extension PartDefinitionPatterns on PartDefinition {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PartDefinition value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PartDefinition() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PartDefinition value)  $default,){
final _that = this;
switch (_that) {
case _PartDefinition():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PartDefinition value)?  $default,){
final _that = this;
switch (_that) {
case _PartDefinition() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _partFromJson, toJson: _partToJson)  GarmentPart part,  int cardinality,  Size2D panelSize,  PartInsets seamAllowance,  PartInsets bleed,  List<ZoneSlot> zoneSlots,  List<String> allowedVariants,  String? symmetryGroup,  Map<String, Object?> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PartDefinition() when $default != null:
return $default(_that.part,_that.cardinality,_that.panelSize,_that.seamAllowance,_that.bleed,_that.zoneSlots,_that.allowedVariants,_that.symmetryGroup,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _partFromJson, toJson: _partToJson)  GarmentPart part,  int cardinality,  Size2D panelSize,  PartInsets seamAllowance,  PartInsets bleed,  List<ZoneSlot> zoneSlots,  List<String> allowedVariants,  String? symmetryGroup,  Map<String, Object?> metadata)  $default,) {final _that = this;
switch (_that) {
case _PartDefinition():
return $default(_that.part,_that.cardinality,_that.panelSize,_that.seamAllowance,_that.bleed,_that.zoneSlots,_that.allowedVariants,_that.symmetryGroup,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _partFromJson, toJson: _partToJson)  GarmentPart part,  int cardinality,  Size2D panelSize,  PartInsets seamAllowance,  PartInsets bleed,  List<ZoneSlot> zoneSlots,  List<String> allowedVariants,  String? symmetryGroup,  Map<String, Object?> metadata)?  $default,) {final _that = this;
switch (_that) {
case _PartDefinition() when $default != null:
return $default(_that.part,_that.cardinality,_that.panelSize,_that.seamAllowance,_that.bleed,_that.zoneSlots,_that.allowedVariants,_that.symmetryGroup,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PartDefinition implements PartDefinition {
  const _PartDefinition({@JsonKey(fromJson: _partFromJson, toJson: _partToJson) required this.part, this.cardinality = 1, required this.panelSize, this.seamAllowance = PartInsets.zero, this.bleed = PartInsets.zero, final  List<ZoneSlot> zoneSlots = const <ZoneSlot>[], final  List<String> allowedVariants = const <String>[], this.symmetryGroup, final  Map<String, Object?> metadata = const <String, Object?>{}}): assert(cardinality >= 1, 'cardinality must be at least 1'),_zoneSlots = zoneSlots,_allowedVariants = allowedVariants,_metadata = metadata;
  factory _PartDefinition.fromJson(Map<String, dynamic> json) => _$PartDefinitionFromJson(json);

/// The frozen part vocabulary this definition types.
@override@JsonKey(fromJson: _partFromJson, toJson: _partToJson) final  GarmentPart part;
/// How many instances a garment carries (2 for mirrored pairs).
@override@JsonKey() final  int cardinality;
/// Flat-panel size (printable 2D region) in the schema's unit.
@override final  Size2D panelSize;
/// Seam allowance insets, relative to the panel.
@override@JsonKey() final  PartInsets seamAllowance;
/// Bleed insets, relative to the panel.
@override@JsonKey() final  PartInsets bleed;
/// Declared content slots.
 final  List<ZoneSlot> _zoneSlots;
/// Declared content slots.
@override@JsonKey() List<ZoneSlot> get zoneSlots {
  if (_zoneSlots is EqualUnmodifiableListView) return _zoneSlots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_zoneSlots);
}

/// Allowed style variants — wire strings (§3 "structure variants as
/// swaps"; the swap engine is a later slice). Injected schema data.
 final  List<String> _allowedVariants;
/// Allowed style variants — wire strings (§3 "structure variants as
/// swaps"; the swap engine is a later slice). Injected schema data.
@override@JsonKey() List<String> get allowedVariants {
  if (_allowedVariants is EqualUnmodifiableListView) return _allowedVariants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allowedVariants);
}

/// Symmetry group name; parts sharing a group share content by
/// default (§3 "symmetry links"). Null = unlinked.
@override final  String? symmetryGroup;
/// Open schema data (anchors ride `metadata['anchors']` until a
/// consuming slice freezes their type).
 final  Map<String, Object?> _metadata;
/// Open schema data (anchors ride `metadata['anchors']` until a
/// consuming slice freezes their type).
@override@JsonKey() Map<String, Object?> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of PartDefinition
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PartDefinitionCopyWith<_PartDefinition> get copyWith => __$PartDefinitionCopyWithImpl<_PartDefinition>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PartDefinitionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PartDefinition&&(identical(other.part, part) || other.part == part)&&(identical(other.cardinality, cardinality) || other.cardinality == cardinality)&&(identical(other.panelSize, panelSize) || other.panelSize == panelSize)&&(identical(other.seamAllowance, seamAllowance) || other.seamAllowance == seamAllowance)&&(identical(other.bleed, bleed) || other.bleed == bleed)&&const DeepCollectionEquality().equals(other._zoneSlots, _zoneSlots)&&const DeepCollectionEquality().equals(other._allowedVariants, _allowedVariants)&&(identical(other.symmetryGroup, symmetryGroup) || other.symmetryGroup == symmetryGroup)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,part,cardinality,panelSize,seamAllowance,bleed,const DeepCollectionEquality().hash(_zoneSlots),const DeepCollectionEquality().hash(_allowedVariants),symmetryGroup,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'PartDefinition(part: $part, cardinality: $cardinality, panelSize: $panelSize, seamAllowance: $seamAllowance, bleed: $bleed, zoneSlots: $zoneSlots, allowedVariants: $allowedVariants, symmetryGroup: $symmetryGroup, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$PartDefinitionCopyWith<$Res> implements $PartDefinitionCopyWith<$Res> {
  factory _$PartDefinitionCopyWith(_PartDefinition value, $Res Function(_PartDefinition) _then) = __$PartDefinitionCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _partFromJson, toJson: _partToJson) GarmentPart part, int cardinality, Size2D panelSize, PartInsets seamAllowance, PartInsets bleed, List<ZoneSlot> zoneSlots, List<String> allowedVariants, String? symmetryGroup, Map<String, Object?> metadata
});


@override $Size2DCopyWith<$Res> get panelSize;@override $PartInsetsCopyWith<$Res> get seamAllowance;@override $PartInsetsCopyWith<$Res> get bleed;

}
/// @nodoc
class __$PartDefinitionCopyWithImpl<$Res>
    implements _$PartDefinitionCopyWith<$Res> {
  __$PartDefinitionCopyWithImpl(this._self, this._then);

  final _PartDefinition _self;
  final $Res Function(_PartDefinition) _then;

/// Create a copy of PartDefinition
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? part = null,Object? cardinality = null,Object? panelSize = null,Object? seamAllowance = null,Object? bleed = null,Object? zoneSlots = null,Object? allowedVariants = null,Object? symmetryGroup = freezed,Object? metadata = null,}) {
  return _then(_PartDefinition(
part: null == part ? _self.part : part // ignore: cast_nullable_to_non_nullable
as GarmentPart,cardinality: null == cardinality ? _self.cardinality : cardinality // ignore: cast_nullable_to_non_nullable
as int,panelSize: null == panelSize ? _self.panelSize : panelSize // ignore: cast_nullable_to_non_nullable
as Size2D,seamAllowance: null == seamAllowance ? _self.seamAllowance : seamAllowance // ignore: cast_nullable_to_non_nullable
as PartInsets,bleed: null == bleed ? _self.bleed : bleed // ignore: cast_nullable_to_non_nullable
as PartInsets,zoneSlots: null == zoneSlots ? _self._zoneSlots : zoneSlots // ignore: cast_nullable_to_non_nullable
as List<ZoneSlot>,allowedVariants: null == allowedVariants ? _self._allowedVariants : allowedVariants // ignore: cast_nullable_to_non_nullable
as List<String>,symmetryGroup: freezed == symmetryGroup ? _self.symmetryGroup : symmetryGroup // ignore: cast_nullable_to_non_nullable
as String?,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

/// Create a copy of PartDefinition
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Size2DCopyWith<$Res> get panelSize {
  
  return $Size2DCopyWith<$Res>(_self.panelSize, (value) {
    return _then(_self.copyWith(panelSize: value));
  });
}/// Create a copy of PartDefinition
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PartInsetsCopyWith<$Res> get seamAllowance {
  
  return $PartInsetsCopyWith<$Res>(_self.seamAllowance, (value) {
    return _then(_self.copyWith(seamAllowance: value));
  });
}/// Create a copy of PartDefinition
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PartInsetsCopyWith<$Res> get bleed {
  
  return $PartInsetsCopyWith<$Res>(_self.bleed, (value) {
    return _then(_self.copyWith(bleed: value));
  });
}
}


/// @nodoc
mixin _$GarmentSchema {

/// Stable schema id (e.g. a content-pack key).
 String get id;/// The frozen garment vocabulary this schema types.
@JsonKey(fromJson: _garmentFromJson, toJson: _garmentToJson) GarmentType get garment;/// Content version (§3 "schema versioning + migration"; migration
/// tooling is a later slice — the field is the seam).
 int get schemaVersion;/// The unit every physical value in this schema uses (§3
/// "physical-unit-first in cm").
@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) MeasurementUnit get unit;/// The part definitions, in presentation order.
 List<PartDefinition> get parts;/// Declared symmetry links across part instances.
 List<SymmetryLink> get symmetryLinks; Map<String, Object?> get metadata;
/// Create a copy of GarmentSchema
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GarmentSchemaCopyWith<GarmentSchema> get copyWith => _$GarmentSchemaCopyWithImpl<GarmentSchema>(this as GarmentSchema, _$identity);

  /// Serializes this GarmentSchema to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GarmentSchema&&(identical(other.id, id) || other.id == id)&&(identical(other.garment, garment) || other.garment == garment)&&(identical(other.schemaVersion, schemaVersion) || other.schemaVersion == schemaVersion)&&(identical(other.unit, unit) || other.unit == unit)&&const DeepCollectionEquality().equals(other.parts, parts)&&const DeepCollectionEquality().equals(other.symmetryLinks, symmetryLinks)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,garment,schemaVersion,unit,const DeepCollectionEquality().hash(parts),const DeepCollectionEquality().hash(symmetryLinks),const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'GarmentSchema(id: $id, garment: $garment, schemaVersion: $schemaVersion, unit: $unit, parts: $parts, symmetryLinks: $symmetryLinks, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $GarmentSchemaCopyWith<$Res>  {
  factory $GarmentSchemaCopyWith(GarmentSchema value, $Res Function(GarmentSchema) _then) = _$GarmentSchemaCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(fromJson: _garmentFromJson, toJson: _garmentToJson) GarmentType garment, int schemaVersion,@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) MeasurementUnit unit, List<PartDefinition> parts, List<SymmetryLink> symmetryLinks, Map<String, Object?> metadata
});




}
/// @nodoc
class _$GarmentSchemaCopyWithImpl<$Res>
    implements $GarmentSchemaCopyWith<$Res> {
  _$GarmentSchemaCopyWithImpl(this._self, this._then);

  final GarmentSchema _self;
  final $Res Function(GarmentSchema) _then;

/// Create a copy of GarmentSchema
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? garment = null,Object? schemaVersion = null,Object? unit = null,Object? parts = null,Object? symmetryLinks = null,Object? metadata = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,garment: null == garment ? _self.garment : garment // ignore: cast_nullable_to_non_nullable
as GarmentType,schemaVersion: null == schemaVersion ? _self.schemaVersion : schemaVersion // ignore: cast_nullable_to_non_nullable
as int,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as MeasurementUnit,parts: null == parts ? _self.parts : parts // ignore: cast_nullable_to_non_nullable
as List<PartDefinition>,symmetryLinks: null == symmetryLinks ? _self.symmetryLinks : symmetryLinks // ignore: cast_nullable_to_non_nullable
as List<SymmetryLink>,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

}


/// Adds pattern-matching-related methods to [GarmentSchema].
extension GarmentSchemaPatterns on GarmentSchema {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GarmentSchema value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GarmentSchema() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GarmentSchema value)  $default,){
final _that = this;
switch (_that) {
case _GarmentSchema():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GarmentSchema value)?  $default,){
final _that = this;
switch (_that) {
case _GarmentSchema() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(fromJson: _garmentFromJson, toJson: _garmentToJson)  GarmentType garment,  int schemaVersion, @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson)  MeasurementUnit unit,  List<PartDefinition> parts,  List<SymmetryLink> symmetryLinks,  Map<String, Object?> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GarmentSchema() when $default != null:
return $default(_that.id,_that.garment,_that.schemaVersion,_that.unit,_that.parts,_that.symmetryLinks,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(fromJson: _garmentFromJson, toJson: _garmentToJson)  GarmentType garment,  int schemaVersion, @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson)  MeasurementUnit unit,  List<PartDefinition> parts,  List<SymmetryLink> symmetryLinks,  Map<String, Object?> metadata)  $default,) {final _that = this;
switch (_that) {
case _GarmentSchema():
return $default(_that.id,_that.garment,_that.schemaVersion,_that.unit,_that.parts,_that.symmetryLinks,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(fromJson: _garmentFromJson, toJson: _garmentToJson)  GarmentType garment,  int schemaVersion, @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson)  MeasurementUnit unit,  List<PartDefinition> parts,  List<SymmetryLink> symmetryLinks,  Map<String, Object?> metadata)?  $default,) {final _that = this;
switch (_that) {
case _GarmentSchema() when $default != null:
return $default(_that.id,_that.garment,_that.schemaVersion,_that.unit,_that.parts,_that.symmetryLinks,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GarmentSchema implements GarmentSchema {
  const _GarmentSchema({required this.id, @JsonKey(fromJson: _garmentFromJson, toJson: _garmentToJson) required this.garment, this.schemaVersion = 1, @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) this.unit = MeasurementUnit.centimetre, final  List<PartDefinition> parts = const <PartDefinition>[], final  List<SymmetryLink> symmetryLinks = const <SymmetryLink>[], final  Map<String, Object?> metadata = const <String, Object?>{}}): assert(schemaVersion >= 1, 'schemaVersion must be at least 1'),_parts = parts,_symmetryLinks = symmetryLinks,_metadata = metadata;
  factory _GarmentSchema.fromJson(Map<String, dynamic> json) => _$GarmentSchemaFromJson(json);

/// Stable schema id (e.g. a content-pack key).
@override final  String id;
/// The frozen garment vocabulary this schema types.
@override@JsonKey(fromJson: _garmentFromJson, toJson: _garmentToJson) final  GarmentType garment;
/// Content version (§3 "schema versioning + migration"; migration
/// tooling is a later slice — the field is the seam).
@override@JsonKey() final  int schemaVersion;
/// The unit every physical value in this schema uses (§3
/// "physical-unit-first in cm").
@override@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) final  MeasurementUnit unit;
/// The part definitions, in presentation order.
 final  List<PartDefinition> _parts;
/// The part definitions, in presentation order.
@override@JsonKey() List<PartDefinition> get parts {
  if (_parts is EqualUnmodifiableListView) return _parts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_parts);
}

/// Declared symmetry links across part instances.
 final  List<SymmetryLink> _symmetryLinks;
/// Declared symmetry links across part instances.
@override@JsonKey() List<SymmetryLink> get symmetryLinks {
  if (_symmetryLinks is EqualUnmodifiableListView) return _symmetryLinks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_symmetryLinks);
}

 final  Map<String, Object?> _metadata;
@override@JsonKey() Map<String, Object?> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of GarmentSchema
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GarmentSchemaCopyWith<_GarmentSchema> get copyWith => __$GarmentSchemaCopyWithImpl<_GarmentSchema>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GarmentSchemaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GarmentSchema&&(identical(other.id, id) || other.id == id)&&(identical(other.garment, garment) || other.garment == garment)&&(identical(other.schemaVersion, schemaVersion) || other.schemaVersion == schemaVersion)&&(identical(other.unit, unit) || other.unit == unit)&&const DeepCollectionEquality().equals(other._parts, _parts)&&const DeepCollectionEquality().equals(other._symmetryLinks, _symmetryLinks)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,garment,schemaVersion,unit,const DeepCollectionEquality().hash(_parts),const DeepCollectionEquality().hash(_symmetryLinks),const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'GarmentSchema(id: $id, garment: $garment, schemaVersion: $schemaVersion, unit: $unit, parts: $parts, symmetryLinks: $symmetryLinks, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$GarmentSchemaCopyWith<$Res> implements $GarmentSchemaCopyWith<$Res> {
  factory _$GarmentSchemaCopyWith(_GarmentSchema value, $Res Function(_GarmentSchema) _then) = __$GarmentSchemaCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(fromJson: _garmentFromJson, toJson: _garmentToJson) GarmentType garment, int schemaVersion,@JsonKey(fromJson: _unitFromJson, toJson: _unitToJson) MeasurementUnit unit, List<PartDefinition> parts, List<SymmetryLink> symmetryLinks, Map<String, Object?> metadata
});




}
/// @nodoc
class __$GarmentSchemaCopyWithImpl<$Res>
    implements _$GarmentSchemaCopyWith<$Res> {
  __$GarmentSchemaCopyWithImpl(this._self, this._then);

  final _GarmentSchema _self;
  final $Res Function(_GarmentSchema) _then;

/// Create a copy of GarmentSchema
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? garment = null,Object? schemaVersion = null,Object? unit = null,Object? parts = null,Object? symmetryLinks = null,Object? metadata = null,}) {
  return _then(_GarmentSchema(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,garment: null == garment ? _self.garment : garment // ignore: cast_nullable_to_non_nullable
as GarmentType,schemaVersion: null == schemaVersion ? _self.schemaVersion : schemaVersion // ignore: cast_nullable_to_non_nullable
as int,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as MeasurementUnit,parts: null == parts ? _self._parts : parts // ignore: cast_nullable_to_non_nullable
as List<PartDefinition>,symmetryLinks: null == symmetryLinks ? _self._symmetryLinks : symmetryLinks // ignore: cast_nullable_to_non_nullable
as List<SymmetryLink>,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}

// dart format on
