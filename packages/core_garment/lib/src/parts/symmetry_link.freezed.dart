// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'symmetry_link.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SymmetryLink {

/// The symmetry group this link realises.
 String get group;/// The linked instance qualifiers (e.g. `left`, `right`).
 List<String> get instances;/// Whether content is currently shared (default per §3).
 bool get linked;
/// Create a copy of SymmetryLink
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SymmetryLinkCopyWith<SymmetryLink> get copyWith => _$SymmetryLinkCopyWithImpl<SymmetryLink>(this as SymmetryLink, _$identity);

  /// Serializes this SymmetryLink to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SymmetryLink&&(identical(other.group, group) || other.group == group)&&const DeepCollectionEquality().equals(other.instances, instances)&&(identical(other.linked, linked) || other.linked == linked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,group,const DeepCollectionEquality().hash(instances),linked);

@override
String toString() {
  return 'SymmetryLink(group: $group, instances: $instances, linked: $linked)';
}


}

/// @nodoc
abstract mixin class $SymmetryLinkCopyWith<$Res>  {
  factory $SymmetryLinkCopyWith(SymmetryLink value, $Res Function(SymmetryLink) _then) = _$SymmetryLinkCopyWithImpl;
@useResult
$Res call({
 String group, List<String> instances, bool linked
});




}
/// @nodoc
class _$SymmetryLinkCopyWithImpl<$Res>
    implements $SymmetryLinkCopyWith<$Res> {
  _$SymmetryLinkCopyWithImpl(this._self, this._then);

  final SymmetryLink _self;
  final $Res Function(SymmetryLink) _then;

/// Create a copy of SymmetryLink
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? group = null,Object? instances = null,Object? linked = null,}) {
  return _then(_self.copyWith(
group: null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String,instances: null == instances ? _self.instances : instances // ignore: cast_nullable_to_non_nullable
as List<String>,linked: null == linked ? _self.linked : linked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SymmetryLink].
extension SymmetryLinkPatterns on SymmetryLink {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SymmetryLink value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SymmetryLink() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SymmetryLink value)  $default,){
final _that = this;
switch (_that) {
case _SymmetryLink():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SymmetryLink value)?  $default,){
final _that = this;
switch (_that) {
case _SymmetryLink() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String group,  List<String> instances,  bool linked)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SymmetryLink() when $default != null:
return $default(_that.group,_that.instances,_that.linked);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String group,  List<String> instances,  bool linked)  $default,) {final _that = this;
switch (_that) {
case _SymmetryLink():
return $default(_that.group,_that.instances,_that.linked);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String group,  List<String> instances,  bool linked)?  $default,) {final _that = this;
switch (_that) {
case _SymmetryLink() when $default != null:
return $default(_that.group,_that.instances,_that.linked);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SymmetryLink implements SymmetryLink {
  const _SymmetryLink({required this.group, final  List<String> instances = const <String>[], this.linked = true}): _instances = instances;
  factory _SymmetryLink.fromJson(Map<String, dynamic> json) => _$SymmetryLinkFromJson(json);

/// The symmetry group this link realises.
@override final  String group;
/// The linked instance qualifiers (e.g. `left`, `right`).
 final  List<String> _instances;
/// The linked instance qualifiers (e.g. `left`, `right`).
@override@JsonKey() List<String> get instances {
  if (_instances is EqualUnmodifiableListView) return _instances;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_instances);
}

/// Whether content is currently shared (default per §3).
@override@JsonKey() final  bool linked;

/// Create a copy of SymmetryLink
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SymmetryLinkCopyWith<_SymmetryLink> get copyWith => __$SymmetryLinkCopyWithImpl<_SymmetryLink>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SymmetryLinkToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SymmetryLink&&(identical(other.group, group) || other.group == group)&&const DeepCollectionEquality().equals(other._instances, _instances)&&(identical(other.linked, linked) || other.linked == linked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,group,const DeepCollectionEquality().hash(_instances),linked);

@override
String toString() {
  return 'SymmetryLink(group: $group, instances: $instances, linked: $linked)';
}


}

/// @nodoc
abstract mixin class _$SymmetryLinkCopyWith<$Res> implements $SymmetryLinkCopyWith<$Res> {
  factory _$SymmetryLinkCopyWith(_SymmetryLink value, $Res Function(_SymmetryLink) _then) = __$SymmetryLinkCopyWithImpl;
@override @useResult
$Res call({
 String group, List<String> instances, bool linked
});




}
/// @nodoc
class __$SymmetryLinkCopyWithImpl<$Res>
    implements _$SymmetryLinkCopyWith<$Res> {
  __$SymmetryLinkCopyWithImpl(this._self, this._then);

  final _SymmetryLink _self;
  final $Res Function(_SymmetryLink) _then;

/// Create a copy of SymmetryLink
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? group = null,Object? instances = null,Object? linked = null,}) {
  return _then(_SymmetryLink(
group: null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String,instances: null == instances ? _self._instances : instances // ignore: cast_nullable_to_non_nullable
as List<String>,linked: null == linked ? _self.linked : linked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
