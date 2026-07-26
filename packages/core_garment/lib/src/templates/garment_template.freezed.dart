// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'garment_template.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GarmentTemplate {

/// Stable template id — the registry key.
 String get id;/// The referenced [GarmentSchema] id (the approved Q1 ruling:
/// reference-only, a plain string id — never an embedded schema,
/// never an asset-engine identity).
 String get schemaRef;/// §2 "structure options" — open data (the frozen ADR-0002
/// escape-hatch doctrine); consumed by later slices (the swap
/// engine).
 Map<String, Object?> get structureOptions;/// The authored starting point (the approved Q4 ruling): an embedded
/// immutable [DesignNode] subtree owned by the template, carrying
/// authoring-time ids — the binder re-identifies every
/// instantiation through the frozen `cloneWithIds` seam (deep copy
/// by construction; §2 "instantiation deep-copies, never
/// live-links"). Null = the instance derives from the schema alone.
///
/// Any asset references inside starter content are metadata string
/// entries authored into the fragment (the frozen ADR-0016
/// reference-only doctrine) — data, not links.
 DesignNode? get starterDesign;/// §2 multi-axis taxonomy (the approved Q3 ruling): axis name →
/// tags, both injected content. The blueprint's axes —
/// region/tradition, tier, fabric/season line, trend (server-fed) —
/// are documented data; no axis name appears in code.
 Map<String, List<String>> get taxonomy;/// Authorship as data (the approved Q6 ruling — the save-back seam):
/// no origin vocabulary is frozen, no behaviour branches on it.
 Map<String, Object?> get authorship;/// §2 content version (the approved Q7 ruling: carried as data; the
/// registry is version-blind; comparison/update policy is a later
/// slice).
 int get contentVersion; Map<String, Object?> get metadata;
/// Create a copy of GarmentTemplate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GarmentTemplateCopyWith<GarmentTemplate> get copyWith => _$GarmentTemplateCopyWithImpl<GarmentTemplate>(this as GarmentTemplate, _$identity);

  /// Serializes this GarmentTemplate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GarmentTemplate&&(identical(other.id, id) || other.id == id)&&(identical(other.schemaRef, schemaRef) || other.schemaRef == schemaRef)&&const DeepCollectionEquality().equals(other.structureOptions, structureOptions)&&(identical(other.starterDesign, starterDesign) || other.starterDesign == starterDesign)&&const DeepCollectionEquality().equals(other.taxonomy, taxonomy)&&const DeepCollectionEquality().equals(other.authorship, authorship)&&(identical(other.contentVersion, contentVersion) || other.contentVersion == contentVersion)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,schemaRef,const DeepCollectionEquality().hash(structureOptions),starterDesign,const DeepCollectionEquality().hash(taxonomy),const DeepCollectionEquality().hash(authorship),contentVersion,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'GarmentTemplate(id: $id, schemaRef: $schemaRef, structureOptions: $structureOptions, starterDesign: $starterDesign, taxonomy: $taxonomy, authorship: $authorship, contentVersion: $contentVersion, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $GarmentTemplateCopyWith<$Res>  {
  factory $GarmentTemplateCopyWith(GarmentTemplate value, $Res Function(GarmentTemplate) _then) = _$GarmentTemplateCopyWithImpl;
@useResult
$Res call({
 String id, String schemaRef, Map<String, Object?> structureOptions, DesignNode? starterDesign, Map<String, List<String>> taxonomy, Map<String, Object?> authorship, int contentVersion, Map<String, Object?> metadata
});


$DesignNodeCopyWith<$Res>? get starterDesign;

}
/// @nodoc
class _$GarmentTemplateCopyWithImpl<$Res>
    implements $GarmentTemplateCopyWith<$Res> {
  _$GarmentTemplateCopyWithImpl(this._self, this._then);

  final GarmentTemplate _self;
  final $Res Function(GarmentTemplate) _then;

/// Create a copy of GarmentTemplate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? schemaRef = null,Object? structureOptions = null,Object? starterDesign = freezed,Object? taxonomy = null,Object? authorship = null,Object? contentVersion = null,Object? metadata = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,schemaRef: null == schemaRef ? _self.schemaRef : schemaRef // ignore: cast_nullable_to_non_nullable
as String,structureOptions: null == structureOptions ? _self.structureOptions : structureOptions // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,starterDesign: freezed == starterDesign ? _self.starterDesign : starterDesign // ignore: cast_nullable_to_non_nullable
as DesignNode?,taxonomy: null == taxonomy ? _self.taxonomy : taxonomy // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>,authorship: null == authorship ? _self.authorship : authorship // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,contentVersion: null == contentVersion ? _self.contentVersion : contentVersion // ignore: cast_nullable_to_non_nullable
as int,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}
/// Create a copy of GarmentTemplate
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DesignNodeCopyWith<$Res>? get starterDesign {
    if (_self.starterDesign == null) {
    return null;
  }

  return $DesignNodeCopyWith<$Res>(_self.starterDesign!, (value) {
    return _then(_self.copyWith(starterDesign: value));
  });
}
}


/// Adds pattern-matching-related methods to [GarmentTemplate].
extension GarmentTemplatePatterns on GarmentTemplate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GarmentTemplate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GarmentTemplate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GarmentTemplate value)  $default,){
final _that = this;
switch (_that) {
case _GarmentTemplate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GarmentTemplate value)?  $default,){
final _that = this;
switch (_that) {
case _GarmentTemplate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String schemaRef,  Map<String, Object?> structureOptions,  DesignNode? starterDesign,  Map<String, List<String>> taxonomy,  Map<String, Object?> authorship,  int contentVersion,  Map<String, Object?> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GarmentTemplate() when $default != null:
return $default(_that.id,_that.schemaRef,_that.structureOptions,_that.starterDesign,_that.taxonomy,_that.authorship,_that.contentVersion,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String schemaRef,  Map<String, Object?> structureOptions,  DesignNode? starterDesign,  Map<String, List<String>> taxonomy,  Map<String, Object?> authorship,  int contentVersion,  Map<String, Object?> metadata)  $default,) {final _that = this;
switch (_that) {
case _GarmentTemplate():
return $default(_that.id,_that.schemaRef,_that.structureOptions,_that.starterDesign,_that.taxonomy,_that.authorship,_that.contentVersion,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String schemaRef,  Map<String, Object?> structureOptions,  DesignNode? starterDesign,  Map<String, List<String>> taxonomy,  Map<String, Object?> authorship,  int contentVersion,  Map<String, Object?> metadata)?  $default,) {final _that = this;
switch (_that) {
case _GarmentTemplate() when $default != null:
return $default(_that.id,_that.schemaRef,_that.structureOptions,_that.starterDesign,_that.taxonomy,_that.authorship,_that.contentVersion,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GarmentTemplate implements GarmentTemplate {
  const _GarmentTemplate({required this.id, required this.schemaRef, final  Map<String, Object?> structureOptions = const <String, Object?>{}, this.starterDesign, final  Map<String, List<String>> taxonomy = const <String, List<String>>{}, final  Map<String, Object?> authorship = const <String, Object?>{}, this.contentVersion = 1, final  Map<String, Object?> metadata = const <String, Object?>{}}): assert(contentVersion >= 1, 'contentVersion must be at least 1'),_structureOptions = structureOptions,_taxonomy = taxonomy,_authorship = authorship,_metadata = metadata;
  factory _GarmentTemplate.fromJson(Map<String, dynamic> json) => _$GarmentTemplateFromJson(json);

/// Stable template id — the registry key.
@override final  String id;
/// The referenced [GarmentSchema] id (the approved Q1 ruling:
/// reference-only, a plain string id — never an embedded schema,
/// never an asset-engine identity).
@override final  String schemaRef;
/// §2 "structure options" — open data (the frozen ADR-0002
/// escape-hatch doctrine); consumed by later slices (the swap
/// engine).
 final  Map<String, Object?> _structureOptions;
/// §2 "structure options" — open data (the frozen ADR-0002
/// escape-hatch doctrine); consumed by later slices (the swap
/// engine).
@override@JsonKey() Map<String, Object?> get structureOptions {
  if (_structureOptions is EqualUnmodifiableMapView) return _structureOptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_structureOptions);
}

/// The authored starting point (the approved Q4 ruling): an embedded
/// immutable [DesignNode] subtree owned by the template, carrying
/// authoring-time ids — the binder re-identifies every
/// instantiation through the frozen `cloneWithIds` seam (deep copy
/// by construction; §2 "instantiation deep-copies, never
/// live-links"). Null = the instance derives from the schema alone.
///
/// Any asset references inside starter content are metadata string
/// entries authored into the fragment (the frozen ADR-0016
/// reference-only doctrine) — data, not links.
@override final  DesignNode? starterDesign;
/// §2 multi-axis taxonomy (the approved Q3 ruling): axis name →
/// tags, both injected content. The blueprint's axes —
/// region/tradition, tier, fabric/season line, trend (server-fed) —
/// are documented data; no axis name appears in code.
 final  Map<String, List<String>> _taxonomy;
/// §2 multi-axis taxonomy (the approved Q3 ruling): axis name →
/// tags, both injected content. The blueprint's axes —
/// region/tradition, tier, fabric/season line, trend (server-fed) —
/// are documented data; no axis name appears in code.
@override@JsonKey() Map<String, List<String>> get taxonomy {
  if (_taxonomy is EqualUnmodifiableMapView) return _taxonomy;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_taxonomy);
}

/// Authorship as data (the approved Q6 ruling — the save-back seam):
/// no origin vocabulary is frozen, no behaviour branches on it.
 final  Map<String, Object?> _authorship;
/// Authorship as data (the approved Q6 ruling — the save-back seam):
/// no origin vocabulary is frozen, no behaviour branches on it.
@override@JsonKey() Map<String, Object?> get authorship {
  if (_authorship is EqualUnmodifiableMapView) return _authorship;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_authorship);
}

/// §2 content version (the approved Q7 ruling: carried as data; the
/// registry is version-blind; comparison/update policy is a later
/// slice).
@override@JsonKey() final  int contentVersion;
 final  Map<String, Object?> _metadata;
@override@JsonKey() Map<String, Object?> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of GarmentTemplate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GarmentTemplateCopyWith<_GarmentTemplate> get copyWith => __$GarmentTemplateCopyWithImpl<_GarmentTemplate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GarmentTemplateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GarmentTemplate&&(identical(other.id, id) || other.id == id)&&(identical(other.schemaRef, schemaRef) || other.schemaRef == schemaRef)&&const DeepCollectionEquality().equals(other._structureOptions, _structureOptions)&&(identical(other.starterDesign, starterDesign) || other.starterDesign == starterDesign)&&const DeepCollectionEquality().equals(other._taxonomy, _taxonomy)&&const DeepCollectionEquality().equals(other._authorship, _authorship)&&(identical(other.contentVersion, contentVersion) || other.contentVersion == contentVersion)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,schemaRef,const DeepCollectionEquality().hash(_structureOptions),starterDesign,const DeepCollectionEquality().hash(_taxonomy),const DeepCollectionEquality().hash(_authorship),contentVersion,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'GarmentTemplate(id: $id, schemaRef: $schemaRef, structureOptions: $structureOptions, starterDesign: $starterDesign, taxonomy: $taxonomy, authorship: $authorship, contentVersion: $contentVersion, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$GarmentTemplateCopyWith<$Res> implements $GarmentTemplateCopyWith<$Res> {
  factory _$GarmentTemplateCopyWith(_GarmentTemplate value, $Res Function(_GarmentTemplate) _then) = __$GarmentTemplateCopyWithImpl;
@override @useResult
$Res call({
 String id, String schemaRef, Map<String, Object?> structureOptions, DesignNode? starterDesign, Map<String, List<String>> taxonomy, Map<String, Object?> authorship, int contentVersion, Map<String, Object?> metadata
});


@override $DesignNodeCopyWith<$Res>? get starterDesign;

}
/// @nodoc
class __$GarmentTemplateCopyWithImpl<$Res>
    implements _$GarmentTemplateCopyWith<$Res> {
  __$GarmentTemplateCopyWithImpl(this._self, this._then);

  final _GarmentTemplate _self;
  final $Res Function(_GarmentTemplate) _then;

/// Create a copy of GarmentTemplate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? schemaRef = null,Object? structureOptions = null,Object? starterDesign = freezed,Object? taxonomy = null,Object? authorship = null,Object? contentVersion = null,Object? metadata = null,}) {
  return _then(_GarmentTemplate(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,schemaRef: null == schemaRef ? _self.schemaRef : schemaRef // ignore: cast_nullable_to_non_nullable
as String,structureOptions: null == structureOptions ? _self._structureOptions : structureOptions // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,starterDesign: freezed == starterDesign ? _self.starterDesign : starterDesign // ignore: cast_nullable_to_non_nullable
as DesignNode?,taxonomy: null == taxonomy ? _self._taxonomy : taxonomy // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>,authorship: null == authorship ? _self._authorship : authorship // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,contentVersion: null == contentVersion ? _self.contentVersion : contentVersion // ignore: cast_nullable_to_non_nullable
as int,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

/// Create a copy of GarmentTemplate
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DesignNodeCopyWith<$Res>? get starterDesign {
    if (_self.starterDesign == null) {
    return null;
  }

  return $DesignNodeCopyWith<$Res>(_self.starterDesign!, (value) {
    return _then(_self.copyWith(starterDesign: value));
  });
}
}

// dart format on
