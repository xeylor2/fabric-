// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asset_catalogue.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AssetCatalogue {

 Map<String, FebricAsset> get assets;
/// Create a copy of AssetCatalogue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssetCatalogueCopyWith<AssetCatalogue> get copyWith => _$AssetCatalogueCopyWithImpl<AssetCatalogue>(this as AssetCatalogue, _$identity);

  /// Serializes this AssetCatalogue to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssetCatalogue&&const DeepCollectionEquality().equals(other.assets, assets));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(assets));

@override
String toString() {
  return 'AssetCatalogue(assets: $assets)';
}


}

/// @nodoc
abstract mixin class $AssetCatalogueCopyWith<$Res>  {
  factory $AssetCatalogueCopyWith(AssetCatalogue value, $Res Function(AssetCatalogue) _then) = _$AssetCatalogueCopyWithImpl;
@useResult
$Res call({
 Map<String, FebricAsset> assets
});




}
/// @nodoc
class _$AssetCatalogueCopyWithImpl<$Res>
    implements $AssetCatalogueCopyWith<$Res> {
  _$AssetCatalogueCopyWithImpl(this._self, this._then);

  final AssetCatalogue _self;
  final $Res Function(AssetCatalogue) _then;

/// Create a copy of AssetCatalogue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? assets = null,}) {
  return _then(_self.copyWith(
assets: null == assets ? _self.assets : assets // ignore: cast_nullable_to_non_nullable
as Map<String, FebricAsset>,
  ));
}

}


/// Adds pattern-matching-related methods to [AssetCatalogue].
extension AssetCataloguePatterns on AssetCatalogue {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AssetCatalogue value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AssetCatalogue() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AssetCatalogue value)  $default,){
final _that = this;
switch (_that) {
case _AssetCatalogue():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AssetCatalogue value)?  $default,){
final _that = this;
switch (_that) {
case _AssetCatalogue() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, FebricAsset> assets)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AssetCatalogue() when $default != null:
return $default(_that.assets);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, FebricAsset> assets)  $default,) {final _that = this;
switch (_that) {
case _AssetCatalogue():
return $default(_that.assets);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, FebricAsset> assets)?  $default,) {final _that = this;
switch (_that) {
case _AssetCatalogue() when $default != null:
return $default(_that.assets);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AssetCatalogue extends AssetCatalogue {
  const _AssetCatalogue({final  Map<String, FebricAsset> assets = const <String, FebricAsset>{}}): _assets = assets,super._();
  factory _AssetCatalogue.fromJson(Map<String, dynamic> json) => _$AssetCatalogueFromJson(json);

 final  Map<String, FebricAsset> _assets;
@override@JsonKey() Map<String, FebricAsset> get assets {
  if (_assets is EqualUnmodifiableMapView) return _assets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_assets);
}


/// Create a copy of AssetCatalogue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssetCatalogueCopyWith<_AssetCatalogue> get copyWith => __$AssetCatalogueCopyWithImpl<_AssetCatalogue>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssetCatalogueToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssetCatalogue&&const DeepCollectionEquality().equals(other._assets, _assets));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_assets));

@override
String toString() {
  return 'AssetCatalogue(assets: $assets)';
}


}

/// @nodoc
abstract mixin class _$AssetCatalogueCopyWith<$Res> implements $AssetCatalogueCopyWith<$Res> {
  factory _$AssetCatalogueCopyWith(_AssetCatalogue value, $Res Function(_AssetCatalogue) _then) = __$AssetCatalogueCopyWithImpl;
@override @useResult
$Res call({
 Map<String, FebricAsset> assets
});




}
/// @nodoc
class __$AssetCatalogueCopyWithImpl<$Res>
    implements _$AssetCatalogueCopyWith<$Res> {
  __$AssetCatalogueCopyWithImpl(this._self, this._then);

  final _AssetCatalogue _self;
  final $Res Function(_AssetCatalogue) _then;

/// Create a copy of AssetCatalogue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? assets = null,}) {
  return _then(_AssetCatalogue(
assets: null == assets ? _self._assets : assets // ignore: cast_nullable_to_non_nullable
as Map<String, FebricAsset>,
  ));
}


}

// dart format on
