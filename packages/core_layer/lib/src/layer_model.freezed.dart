// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'layer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LayerModel {

/// Stable UUID (assigned by the document engine).
 String get id;/// Human-readable, renamable name.
 String get name; LayerKind get kind;/// Ordered children (only meaningful for container kinds); order is
/// z-order, bottom to top.
 List<LayerModel> get children; FebricBlendMode get blendMode;/// 0.0 (transparent) … 1.0 (opaque).
 double get opacity;/// Hidden layers keep their place but render nowhere.
 bool get hidden;/// Convenience lock flag (see class docs).
 bool get locked;/// Pinned layers stay visible in panel shortlists.
 bool get pinned;/// User favourite flag.
 bool get favourite;/// Ids of masks applied to this layer (Mask Engine).
 List<String> get maskIds;/// Free-form organisational tags.
 List<String> get tags;/// Open metadata (provenance, tool payloads) until typed models land.
 Map<String, Object?> get metadata;
/// Create a copy of LayerModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LayerModelCopyWith<LayerModel> get copyWith => _$LayerModelCopyWithImpl<LayerModel>(this as LayerModel, _$identity);

  /// Serializes this LayerModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LayerModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.kind, kind) || other.kind == kind)&&const DeepCollectionEquality().equals(other.children, children)&&(identical(other.blendMode, blendMode) || other.blendMode == blendMode)&&(identical(other.opacity, opacity) || other.opacity == opacity)&&(identical(other.hidden, hidden) || other.hidden == hidden)&&(identical(other.locked, locked) || other.locked == locked)&&(identical(other.pinned, pinned) || other.pinned == pinned)&&(identical(other.favourite, favourite) || other.favourite == favourite)&&const DeepCollectionEquality().equals(other.maskIds, maskIds)&&const DeepCollectionEquality().equals(other.tags, tags)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,kind,const DeepCollectionEquality().hash(children),blendMode,opacity,hidden,locked,pinned,favourite,const DeepCollectionEquality().hash(maskIds),const DeepCollectionEquality().hash(tags),const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'LayerModel(id: $id, name: $name, kind: $kind, children: $children, blendMode: $blendMode, opacity: $opacity, hidden: $hidden, locked: $locked, pinned: $pinned, favourite: $favourite, maskIds: $maskIds, tags: $tags, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $LayerModelCopyWith<$Res>  {
  factory $LayerModelCopyWith(LayerModel value, $Res Function(LayerModel) _then) = _$LayerModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, LayerKind kind, List<LayerModel> children, FebricBlendMode blendMode, double opacity, bool hidden, bool locked, bool pinned, bool favourite, List<String> maskIds, List<String> tags, Map<String, Object?> metadata
});




}
/// @nodoc
class _$LayerModelCopyWithImpl<$Res>
    implements $LayerModelCopyWith<$Res> {
  _$LayerModelCopyWithImpl(this._self, this._then);

  final LayerModel _self;
  final $Res Function(LayerModel) _then;

/// Create a copy of LayerModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? kind = null,Object? children = null,Object? blendMode = null,Object? opacity = null,Object? hidden = null,Object? locked = null,Object? pinned = null,Object? favourite = null,Object? maskIds = null,Object? tags = null,Object? metadata = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as LayerKind,children: null == children ? _self.children : children // ignore: cast_nullable_to_non_nullable
as List<LayerModel>,blendMode: null == blendMode ? _self.blendMode : blendMode // ignore: cast_nullable_to_non_nullable
as FebricBlendMode,opacity: null == opacity ? _self.opacity : opacity // ignore: cast_nullable_to_non_nullable
as double,hidden: null == hidden ? _self.hidden : hidden // ignore: cast_nullable_to_non_nullable
as bool,locked: null == locked ? _self.locked : locked // ignore: cast_nullable_to_non_nullable
as bool,pinned: null == pinned ? _self.pinned : pinned // ignore: cast_nullable_to_non_nullable
as bool,favourite: null == favourite ? _self.favourite : favourite // ignore: cast_nullable_to_non_nullable
as bool,maskIds: null == maskIds ? _self.maskIds : maskIds // ignore: cast_nullable_to_non_nullable
as List<String>,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

}


/// Adds pattern-matching-related methods to [LayerModel].
extension LayerModelPatterns on LayerModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LayerModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LayerModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LayerModel value)  $default,){
final _that = this;
switch (_that) {
case _LayerModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LayerModel value)?  $default,){
final _that = this;
switch (_that) {
case _LayerModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  LayerKind kind,  List<LayerModel> children,  FebricBlendMode blendMode,  double opacity,  bool hidden,  bool locked,  bool pinned,  bool favourite,  List<String> maskIds,  List<String> tags,  Map<String, Object?> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LayerModel() when $default != null:
return $default(_that.id,_that.name,_that.kind,_that.children,_that.blendMode,_that.opacity,_that.hidden,_that.locked,_that.pinned,_that.favourite,_that.maskIds,_that.tags,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  LayerKind kind,  List<LayerModel> children,  FebricBlendMode blendMode,  double opacity,  bool hidden,  bool locked,  bool pinned,  bool favourite,  List<String> maskIds,  List<String> tags,  Map<String, Object?> metadata)  $default,) {final _that = this;
switch (_that) {
case _LayerModel():
return $default(_that.id,_that.name,_that.kind,_that.children,_that.blendMode,_that.opacity,_that.hidden,_that.locked,_that.pinned,_that.favourite,_that.maskIds,_that.tags,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  LayerKind kind,  List<LayerModel> children,  FebricBlendMode blendMode,  double opacity,  bool hidden,  bool locked,  bool pinned,  bool favourite,  List<String> maskIds,  List<String> tags,  Map<String, Object?> metadata)?  $default,) {final _that = this;
switch (_that) {
case _LayerModel() when $default != null:
return $default(_that.id,_that.name,_that.kind,_that.children,_that.blendMode,_that.opacity,_that.hidden,_that.locked,_that.pinned,_that.favourite,_that.maskIds,_that.tags,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LayerModel extends LayerModel {
  const _LayerModel({required this.id, required this.name, required this.kind, final  List<LayerModel> children = const <LayerModel>[], this.blendMode = FebricBlendMode.normal, this.opacity = 1.0, this.hidden = false, this.locked = false, this.pinned = false, this.favourite = false, final  List<String> maskIds = const <String>[], final  List<String> tags = const <String>[], final  Map<String, Object?> metadata = const <String, Object?>{}}): _children = children,_maskIds = maskIds,_tags = tags,_metadata = metadata,super._();
  factory _LayerModel.fromJson(Map<String, dynamic> json) => _$LayerModelFromJson(json);

/// Stable UUID (assigned by the document engine).
@override final  String id;
/// Human-readable, renamable name.
@override final  String name;
@override final  LayerKind kind;
/// Ordered children (only meaningful for container kinds); order is
/// z-order, bottom to top.
 final  List<LayerModel> _children;
/// Ordered children (only meaningful for container kinds); order is
/// z-order, bottom to top.
@override@JsonKey() List<LayerModel> get children {
  if (_children is EqualUnmodifiableListView) return _children;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_children);
}

@override@JsonKey() final  FebricBlendMode blendMode;
/// 0.0 (transparent) … 1.0 (opaque).
@override@JsonKey() final  double opacity;
/// Hidden layers keep their place but render nowhere.
@override@JsonKey() final  bool hidden;
/// Convenience lock flag (see class docs).
@override@JsonKey() final  bool locked;
/// Pinned layers stay visible in panel shortlists.
@override@JsonKey() final  bool pinned;
/// User favourite flag.
@override@JsonKey() final  bool favourite;
/// Ids of masks applied to this layer (Mask Engine).
 final  List<String> _maskIds;
/// Ids of masks applied to this layer (Mask Engine).
@override@JsonKey() List<String> get maskIds {
  if (_maskIds is EqualUnmodifiableListView) return _maskIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_maskIds);
}

/// Free-form organisational tags.
 final  List<String> _tags;
/// Free-form organisational tags.
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

/// Open metadata (provenance, tool payloads) until typed models land.
 final  Map<String, Object?> _metadata;
/// Open metadata (provenance, tool payloads) until typed models land.
@override@JsonKey() Map<String, Object?> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of LayerModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LayerModelCopyWith<_LayerModel> get copyWith => __$LayerModelCopyWithImpl<_LayerModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LayerModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LayerModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.kind, kind) || other.kind == kind)&&const DeepCollectionEquality().equals(other._children, _children)&&(identical(other.blendMode, blendMode) || other.blendMode == blendMode)&&(identical(other.opacity, opacity) || other.opacity == opacity)&&(identical(other.hidden, hidden) || other.hidden == hidden)&&(identical(other.locked, locked) || other.locked == locked)&&(identical(other.pinned, pinned) || other.pinned == pinned)&&(identical(other.favourite, favourite) || other.favourite == favourite)&&const DeepCollectionEquality().equals(other._maskIds, _maskIds)&&const DeepCollectionEquality().equals(other._tags, _tags)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,kind,const DeepCollectionEquality().hash(_children),blendMode,opacity,hidden,locked,pinned,favourite,const DeepCollectionEquality().hash(_maskIds),const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'LayerModel(id: $id, name: $name, kind: $kind, children: $children, blendMode: $blendMode, opacity: $opacity, hidden: $hidden, locked: $locked, pinned: $pinned, favourite: $favourite, maskIds: $maskIds, tags: $tags, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$LayerModelCopyWith<$Res> implements $LayerModelCopyWith<$Res> {
  factory _$LayerModelCopyWith(_LayerModel value, $Res Function(_LayerModel) _then) = __$LayerModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, LayerKind kind, List<LayerModel> children, FebricBlendMode blendMode, double opacity, bool hidden, bool locked, bool pinned, bool favourite, List<String> maskIds, List<String> tags, Map<String, Object?> metadata
});




}
/// @nodoc
class __$LayerModelCopyWithImpl<$Res>
    implements _$LayerModelCopyWith<$Res> {
  __$LayerModelCopyWithImpl(this._self, this._then);

  final _LayerModel _self;
  final $Res Function(_LayerModel) _then;

/// Create a copy of LayerModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? kind = null,Object? children = null,Object? blendMode = null,Object? opacity = null,Object? hidden = null,Object? locked = null,Object? pinned = null,Object? favourite = null,Object? maskIds = null,Object? tags = null,Object? metadata = null,}) {
  return _then(_LayerModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as LayerKind,children: null == children ? _self._children : children // ignore: cast_nullable_to_non_nullable
as List<LayerModel>,blendMode: null == blendMode ? _self.blendMode : blendMode // ignore: cast_nullable_to_non_nullable
as FebricBlendMode,opacity: null == opacity ? _self.opacity : opacity // ignore: cast_nullable_to_non_nullable
as double,hidden: null == hidden ? _self.hidden : hidden // ignore: cast_nullable_to_non_nullable
as bool,locked: null == locked ? _self.locked : locked // ignore: cast_nullable_to_non_nullable
as bool,pinned: null == pinned ? _self.pinned : pinned // ignore: cast_nullable_to_non_nullable
as bool,favourite: null == favourite ? _self.favourite : favourite // ignore: cast_nullable_to_non_nullable
as bool,maskIds: null == maskIds ? _self._maskIds : maskIds // ignore: cast_nullable_to_non_nullable
as List<String>,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}

// dart format on
