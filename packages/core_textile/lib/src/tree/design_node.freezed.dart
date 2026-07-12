// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'design_node.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DesignNode {

/// Stable unique identifier (assigned by the document engine).
 String get id;/// Human-readable name shown in the Design Tree panel. Renamable.
 String get name;/// The node's frozen vocabulary type.
@JsonKey(fromJson: _typeFromJson, toJson: _typeToJson) DesignNodeType get type;/// Ordered children; order IS z-order within a zone (Architecture V2 §4).
 List<DesignNode> get children;/// Open metadata for milestone-specific payloads.
 Map<String, Object?> get metadata;/// Hidden nodes render nowhere but keep their place in the tree.
 bool get visible;/// Locked nodes reject every mutation, human or AI (invariant I4).
 bool get locked;/// Selection state (session-scoped; persisted for workspace restore).
 bool get selected;
/// Create a copy of DesignNode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DesignNodeCopyWith<DesignNode> get copyWith => _$DesignNodeCopyWithImpl<DesignNode>(this as DesignNode, _$identity);

  /// Serializes this DesignNode to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DesignNode&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.children, children)&&const DeepCollectionEquality().equals(other.metadata, metadata)&&(identical(other.visible, visible) || other.visible == visible)&&(identical(other.locked, locked) || other.locked == locked)&&(identical(other.selected, selected) || other.selected == selected));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,const DeepCollectionEquality().hash(children),const DeepCollectionEquality().hash(metadata),visible,locked,selected);

@override
String toString() {
  return 'DesignNode(id: $id, name: $name, type: $type, children: $children, metadata: $metadata, visible: $visible, locked: $locked, selected: $selected)';
}


}

/// @nodoc
abstract mixin class $DesignNodeCopyWith<$Res>  {
  factory $DesignNodeCopyWith(DesignNode value, $Res Function(DesignNode) _then) = _$DesignNodeCopyWithImpl;
@useResult
$Res call({
 String id, String name,@JsonKey(fromJson: _typeFromJson, toJson: _typeToJson) DesignNodeType type, List<DesignNode> children, Map<String, Object?> metadata, bool visible, bool locked, bool selected
});




}
/// @nodoc
class _$DesignNodeCopyWithImpl<$Res>
    implements $DesignNodeCopyWith<$Res> {
  _$DesignNodeCopyWithImpl(this._self, this._then);

  final DesignNode _self;
  final $Res Function(DesignNode) _then;

/// Create a copy of DesignNode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? type = null,Object? children = null,Object? metadata = null,Object? visible = null,Object? locked = null,Object? selected = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DesignNodeType,children: null == children ? _self.children : children // ignore: cast_nullable_to_non_nullable
as List<DesignNode>,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,visible: null == visible ? _self.visible : visible // ignore: cast_nullable_to_non_nullable
as bool,locked: null == locked ? _self.locked : locked // ignore: cast_nullable_to_non_nullable
as bool,selected: null == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [DesignNode].
extension DesignNodePatterns on DesignNode {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DesignNode value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DesignNode() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DesignNode value)  $default,){
final _that = this;
switch (_that) {
case _DesignNode():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DesignNode value)?  $default,){
final _that = this;
switch (_that) {
case _DesignNode() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(fromJson: _typeFromJson, toJson: _typeToJson)  DesignNodeType type,  List<DesignNode> children,  Map<String, Object?> metadata,  bool visible,  bool locked,  bool selected)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DesignNode() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.children,_that.metadata,_that.visible,_that.locked,_that.selected);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(fromJson: _typeFromJson, toJson: _typeToJson)  DesignNodeType type,  List<DesignNode> children,  Map<String, Object?> metadata,  bool visible,  bool locked,  bool selected)  $default,) {final _that = this;
switch (_that) {
case _DesignNode():
return $default(_that.id,_that.name,_that.type,_that.children,_that.metadata,_that.visible,_that.locked,_that.selected);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name, @JsonKey(fromJson: _typeFromJson, toJson: _typeToJson)  DesignNodeType type,  List<DesignNode> children,  Map<String, Object?> metadata,  bool visible,  bool locked,  bool selected)?  $default,) {final _that = this;
switch (_that) {
case _DesignNode() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.children,_that.metadata,_that.visible,_that.locked,_that.selected);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DesignNode extends DesignNode {
  const _DesignNode({required this.id, required this.name, @JsonKey(fromJson: _typeFromJson, toJson: _typeToJson) required this.type, final  List<DesignNode> children = const <DesignNode>[], final  Map<String, Object?> metadata = const <String, Object?>{}, this.visible = true, this.locked = false, this.selected = false}): _children = children,_metadata = metadata,super._();
  factory _DesignNode.fromJson(Map<String, dynamic> json) => _$DesignNodeFromJson(json);

/// Stable unique identifier (assigned by the document engine).
@override final  String id;
/// Human-readable name shown in the Design Tree panel. Renamable.
@override final  String name;
/// The node's frozen vocabulary type.
@override@JsonKey(fromJson: _typeFromJson, toJson: _typeToJson) final  DesignNodeType type;
/// Ordered children; order IS z-order within a zone (Architecture V2 §4).
 final  List<DesignNode> _children;
/// Ordered children; order IS z-order within a zone (Architecture V2 §4).
@override@JsonKey() List<DesignNode> get children {
  if (_children is EqualUnmodifiableListView) return _children;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_children);
}

/// Open metadata for milestone-specific payloads.
 final  Map<String, Object?> _metadata;
/// Open metadata for milestone-specific payloads.
@override@JsonKey() Map<String, Object?> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}

/// Hidden nodes render nowhere but keep their place in the tree.
@override@JsonKey() final  bool visible;
/// Locked nodes reject every mutation, human or AI (invariant I4).
@override@JsonKey() final  bool locked;
/// Selection state (session-scoped; persisted for workspace restore).
@override@JsonKey() final  bool selected;

/// Create a copy of DesignNode
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DesignNodeCopyWith<_DesignNode> get copyWith => __$DesignNodeCopyWithImpl<_DesignNode>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DesignNodeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DesignNode&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._children, _children)&&const DeepCollectionEquality().equals(other._metadata, _metadata)&&(identical(other.visible, visible) || other.visible == visible)&&(identical(other.locked, locked) || other.locked == locked)&&(identical(other.selected, selected) || other.selected == selected));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,const DeepCollectionEquality().hash(_children),const DeepCollectionEquality().hash(_metadata),visible,locked,selected);

@override
String toString() {
  return 'DesignNode(id: $id, name: $name, type: $type, children: $children, metadata: $metadata, visible: $visible, locked: $locked, selected: $selected)';
}


}

/// @nodoc
abstract mixin class _$DesignNodeCopyWith<$Res> implements $DesignNodeCopyWith<$Res> {
  factory _$DesignNodeCopyWith(_DesignNode value, $Res Function(_DesignNode) _then) = __$DesignNodeCopyWithImpl;
@override @useResult
$Res call({
 String id, String name,@JsonKey(fromJson: _typeFromJson, toJson: _typeToJson) DesignNodeType type, List<DesignNode> children, Map<String, Object?> metadata, bool visible, bool locked, bool selected
});




}
/// @nodoc
class __$DesignNodeCopyWithImpl<$Res>
    implements _$DesignNodeCopyWith<$Res> {
  __$DesignNodeCopyWithImpl(this._self, this._then);

  final _DesignNode _self;
  final $Res Function(_DesignNode) _then;

/// Create a copy of DesignNode
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? type = null,Object? children = null,Object? metadata = null,Object? visible = null,Object? locked = null,Object? selected = null,}) {
  return _then(_DesignNode(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DesignNodeType,children: null == children ? _self._children : children // ignore: cast_nullable_to_non_nullable
as List<DesignNode>,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,visible: null == visible ? _self.visible : visible // ignore: cast_nullable_to_non_nullable
as bool,locked: null == locked ? _self.locked : locked // ignore: cast_nullable_to_non_nullable
as bool,selected: null == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
