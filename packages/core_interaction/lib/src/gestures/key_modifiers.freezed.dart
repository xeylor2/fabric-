// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'key_modifiers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$KeyModifiers {

 bool get control; bool get shift; bool get alt; bool get meta;
/// Create a copy of KeyModifiers
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KeyModifiersCopyWith<KeyModifiers> get copyWith => _$KeyModifiersCopyWithImpl<KeyModifiers>(this as KeyModifiers, _$identity);

  /// Serializes this KeyModifiers to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KeyModifiers&&(identical(other.control, control) || other.control == control)&&(identical(other.shift, shift) || other.shift == shift)&&(identical(other.alt, alt) || other.alt == alt)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,control,shift,alt,meta);

@override
String toString() {
  return 'KeyModifiers(control: $control, shift: $shift, alt: $alt, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $KeyModifiersCopyWith<$Res>  {
  factory $KeyModifiersCopyWith(KeyModifiers value, $Res Function(KeyModifiers) _then) = _$KeyModifiersCopyWithImpl;
@useResult
$Res call({
 bool control, bool shift, bool alt, bool meta
});




}
/// @nodoc
class _$KeyModifiersCopyWithImpl<$Res>
    implements $KeyModifiersCopyWith<$Res> {
  _$KeyModifiersCopyWithImpl(this._self, this._then);

  final KeyModifiers _self;
  final $Res Function(KeyModifiers) _then;

/// Create a copy of KeyModifiers
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? control = null,Object? shift = null,Object? alt = null,Object? meta = null,}) {
  return _then(_self.copyWith(
control: null == control ? _self.control : control // ignore: cast_nullable_to_non_nullable
as bool,shift: null == shift ? _self.shift : shift // ignore: cast_nullable_to_non_nullable
as bool,alt: null == alt ? _self.alt : alt // ignore: cast_nullable_to_non_nullable
as bool,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [KeyModifiers].
extension KeyModifiersPatterns on KeyModifiers {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KeyModifiers value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KeyModifiers() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KeyModifiers value)  $default,){
final _that = this;
switch (_that) {
case _KeyModifiers():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KeyModifiers value)?  $default,){
final _that = this;
switch (_that) {
case _KeyModifiers() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool control,  bool shift,  bool alt,  bool meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KeyModifiers() when $default != null:
return $default(_that.control,_that.shift,_that.alt,_that.meta);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool control,  bool shift,  bool alt,  bool meta)  $default,) {final _that = this;
switch (_that) {
case _KeyModifiers():
return $default(_that.control,_that.shift,_that.alt,_that.meta);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool control,  bool shift,  bool alt,  bool meta)?  $default,) {final _that = this;
switch (_that) {
case _KeyModifiers() when $default != null:
return $default(_that.control,_that.shift,_that.alt,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _KeyModifiers extends KeyModifiers {
  const _KeyModifiers({this.control = false, this.shift = false, this.alt = false, this.meta = false}): super._();
  factory _KeyModifiers.fromJson(Map<String, dynamic> json) => _$KeyModifiersFromJson(json);

@override@JsonKey() final  bool control;
@override@JsonKey() final  bool shift;
@override@JsonKey() final  bool alt;
@override@JsonKey() final  bool meta;

/// Create a copy of KeyModifiers
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KeyModifiersCopyWith<_KeyModifiers> get copyWith => __$KeyModifiersCopyWithImpl<_KeyModifiers>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$KeyModifiersToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KeyModifiers&&(identical(other.control, control) || other.control == control)&&(identical(other.shift, shift) || other.shift == shift)&&(identical(other.alt, alt) || other.alt == alt)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,control,shift,alt,meta);

@override
String toString() {
  return 'KeyModifiers(control: $control, shift: $shift, alt: $alt, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$KeyModifiersCopyWith<$Res> implements $KeyModifiersCopyWith<$Res> {
  factory _$KeyModifiersCopyWith(_KeyModifiers value, $Res Function(_KeyModifiers) _then) = __$KeyModifiersCopyWithImpl;
@override @useResult
$Res call({
 bool control, bool shift, bool alt, bool meta
});




}
/// @nodoc
class __$KeyModifiersCopyWithImpl<$Res>
    implements _$KeyModifiersCopyWith<$Res> {
  __$KeyModifiersCopyWithImpl(this._self, this._then);

  final _KeyModifiers _self;
  final $Res Function(_KeyModifiers) _then;

/// Create a copy of KeyModifiers
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? control = null,Object? shift = null,Object? alt = null,Object? meta = null,}) {
  return _then(_KeyModifiers(
control: null == control ? _self.control : control // ignore: cast_nullable_to_non_nullable
as bool,shift: null == shift ? _self.shift : shift // ignore: cast_nullable_to_non_nullable
as bool,alt: null == alt ? _self.alt : alt // ignore: cast_nullable_to_non_nullable
as bool,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
