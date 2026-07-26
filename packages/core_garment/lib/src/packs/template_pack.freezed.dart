// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'template_pack.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TemplatePack {

/// Stable pack id.
 String get id;/// Display name (injected content).
 String get name;/// Pack version — data only (the approved Q7 discipline: no
/// comparison or update policy lives here).
 int get packVersion;/// The templates this pack ships (own-stage immutable values — the
/// M13E embed rule).
 List<GarmentTemplate> get templates;/// The schemas this pack ships. §2: packs are how "new garments ship
/// as data" — a pack delivering a new garment carries its schema, or
/// the delivered templates' `schemaRef` would dangle offline ("cached
/// packs fully usable", §2). Defaults to empty: packs that only add
/// templates for already-registered schemas (the separate
/// `content/schemas/` channel, injected via `registerSchema`) carry
/// none.
 List<GarmentSchema> get schemas; Map<String, Object?> get metadata;
/// Create a copy of TemplatePack
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TemplatePackCopyWith<TemplatePack> get copyWith => _$TemplatePackCopyWithImpl<TemplatePack>(this as TemplatePack, _$identity);

  /// Serializes this TemplatePack to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TemplatePack&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.packVersion, packVersion) || other.packVersion == packVersion)&&const DeepCollectionEquality().equals(other.templates, templates)&&const DeepCollectionEquality().equals(other.schemas, schemas)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,packVersion,const DeepCollectionEquality().hash(templates),const DeepCollectionEquality().hash(schemas),const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'TemplatePack(id: $id, name: $name, packVersion: $packVersion, templates: $templates, schemas: $schemas, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $TemplatePackCopyWith<$Res>  {
  factory $TemplatePackCopyWith(TemplatePack value, $Res Function(TemplatePack) _then) = _$TemplatePackCopyWithImpl;
@useResult
$Res call({
 String id, String name, int packVersion, List<GarmentTemplate> templates, List<GarmentSchema> schemas, Map<String, Object?> metadata
});




}
/// @nodoc
class _$TemplatePackCopyWithImpl<$Res>
    implements $TemplatePackCopyWith<$Res> {
  _$TemplatePackCopyWithImpl(this._self, this._then);

  final TemplatePack _self;
  final $Res Function(TemplatePack) _then;

/// Create a copy of TemplatePack
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? packVersion = null,Object? templates = null,Object? schemas = null,Object? metadata = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,packVersion: null == packVersion ? _self.packVersion : packVersion // ignore: cast_nullable_to_non_nullable
as int,templates: null == templates ? _self.templates : templates // ignore: cast_nullable_to_non_nullable
as List<GarmentTemplate>,schemas: null == schemas ? _self.schemas : schemas // ignore: cast_nullable_to_non_nullable
as List<GarmentSchema>,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

}


/// Adds pattern-matching-related methods to [TemplatePack].
extension TemplatePackPatterns on TemplatePack {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TemplatePack value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TemplatePack() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TemplatePack value)  $default,){
final _that = this;
switch (_that) {
case _TemplatePack():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TemplatePack value)?  $default,){
final _that = this;
switch (_that) {
case _TemplatePack() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  int packVersion,  List<GarmentTemplate> templates,  List<GarmentSchema> schemas,  Map<String, Object?> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TemplatePack() when $default != null:
return $default(_that.id,_that.name,_that.packVersion,_that.templates,_that.schemas,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  int packVersion,  List<GarmentTemplate> templates,  List<GarmentSchema> schemas,  Map<String, Object?> metadata)  $default,) {final _that = this;
switch (_that) {
case _TemplatePack():
return $default(_that.id,_that.name,_that.packVersion,_that.templates,_that.schemas,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  int packVersion,  List<GarmentTemplate> templates,  List<GarmentSchema> schemas,  Map<String, Object?> metadata)?  $default,) {final _that = this;
switch (_that) {
case _TemplatePack() when $default != null:
return $default(_that.id,_that.name,_that.packVersion,_that.templates,_that.schemas,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TemplatePack implements TemplatePack {
  const _TemplatePack({required this.id, required this.name, this.packVersion = 1, final  List<GarmentTemplate> templates = const <GarmentTemplate>[], final  List<GarmentSchema> schemas = const <GarmentSchema>[], final  Map<String, Object?> metadata = const <String, Object?>{}}): assert(packVersion >= 1, 'packVersion must be at least 1'),_templates = templates,_schemas = schemas,_metadata = metadata;
  factory _TemplatePack.fromJson(Map<String, dynamic> json) => _$TemplatePackFromJson(json);

/// Stable pack id.
@override final  String id;
/// Display name (injected content).
@override final  String name;
/// Pack version — data only (the approved Q7 discipline: no
/// comparison or update policy lives here).
@override@JsonKey() final  int packVersion;
/// The templates this pack ships (own-stage immutable values — the
/// M13E embed rule).
 final  List<GarmentTemplate> _templates;
/// The templates this pack ships (own-stage immutable values — the
/// M13E embed rule).
@override@JsonKey() List<GarmentTemplate> get templates {
  if (_templates is EqualUnmodifiableListView) return _templates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_templates);
}

/// The schemas this pack ships. §2: packs are how "new garments ship
/// as data" — a pack delivering a new garment carries its schema, or
/// the delivered templates' `schemaRef` would dangle offline ("cached
/// packs fully usable", §2). Defaults to empty: packs that only add
/// templates for already-registered schemas (the separate
/// `content/schemas/` channel, injected via `registerSchema`) carry
/// none.
 final  List<GarmentSchema> _schemas;
/// The schemas this pack ships. §2: packs are how "new garments ship
/// as data" — a pack delivering a new garment carries its schema, or
/// the delivered templates' `schemaRef` would dangle offline ("cached
/// packs fully usable", §2). Defaults to empty: packs that only add
/// templates for already-registered schemas (the separate
/// `content/schemas/` channel, injected via `registerSchema`) carry
/// none.
@override@JsonKey() List<GarmentSchema> get schemas {
  if (_schemas is EqualUnmodifiableListView) return _schemas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_schemas);
}

 final  Map<String, Object?> _metadata;
@override@JsonKey() Map<String, Object?> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of TemplatePack
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TemplatePackCopyWith<_TemplatePack> get copyWith => __$TemplatePackCopyWithImpl<_TemplatePack>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TemplatePackToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TemplatePack&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.packVersion, packVersion) || other.packVersion == packVersion)&&const DeepCollectionEquality().equals(other._templates, _templates)&&const DeepCollectionEquality().equals(other._schemas, _schemas)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,packVersion,const DeepCollectionEquality().hash(_templates),const DeepCollectionEquality().hash(_schemas),const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'TemplatePack(id: $id, name: $name, packVersion: $packVersion, templates: $templates, schemas: $schemas, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$TemplatePackCopyWith<$Res> implements $TemplatePackCopyWith<$Res> {
  factory _$TemplatePackCopyWith(_TemplatePack value, $Res Function(_TemplatePack) _then) = __$TemplatePackCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, int packVersion, List<GarmentTemplate> templates, List<GarmentSchema> schemas, Map<String, Object?> metadata
});




}
/// @nodoc
class __$TemplatePackCopyWithImpl<$Res>
    implements _$TemplatePackCopyWith<$Res> {
  __$TemplatePackCopyWithImpl(this._self, this._then);

  final _TemplatePack _self;
  final $Res Function(_TemplatePack) _then;

/// Create a copy of TemplatePack
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? packVersion = null,Object? templates = null,Object? schemas = null,Object? metadata = null,}) {
  return _then(_TemplatePack(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,packVersion: null == packVersion ? _self.packVersion : packVersion // ignore: cast_nullable_to_non_nullable
as int,templates: null == templates ? _self._templates : templates // ignore: cast_nullable_to_non_nullable
as List<GarmentTemplate>,schemas: null == schemas ? _self._schemas : schemas // ignore: cast_nullable_to_non_nullable
as List<GarmentSchema>,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}

// dart format on
