// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'overlay.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OverlayModel {

 String get id; OverlayKind get kind;/// Draw order within the overlay stack (higher paints later/on top).
 int get order; bool get visible;/// Ids this overlay refers to (e.g. selected node ids). References only.
 List<String> get references;/// Optional bounding region in document space.
 Rect2D? get bounds;/// Open, tool-specific metadata (kept out of the frozen schema).
 Map<String, Object?> get metadata;
/// Create a copy of OverlayModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OverlayModelCopyWith<OverlayModel> get copyWith => _$OverlayModelCopyWithImpl<OverlayModel>(this as OverlayModel, _$identity);

  /// Serializes this OverlayModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OverlayModel&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.order, order) || other.order == order)&&(identical(other.visible, visible) || other.visible == visible)&&const DeepCollectionEquality().equals(other.references, references)&&(identical(other.bounds, bounds) || other.bounds == bounds)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,kind,order,visible,const DeepCollectionEquality().hash(references),bounds,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'OverlayModel(id: $id, kind: $kind, order: $order, visible: $visible, references: $references, bounds: $bounds, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $OverlayModelCopyWith<$Res>  {
  factory $OverlayModelCopyWith(OverlayModel value, $Res Function(OverlayModel) _then) = _$OverlayModelCopyWithImpl;
@useResult
$Res call({
 String id, OverlayKind kind, int order, bool visible, List<String> references, Rect2D? bounds, Map<String, Object?> metadata
});


$Rect2DCopyWith<$Res>? get bounds;

}
/// @nodoc
class _$OverlayModelCopyWithImpl<$Res>
    implements $OverlayModelCopyWith<$Res> {
  _$OverlayModelCopyWithImpl(this._self, this._then);

  final OverlayModel _self;
  final $Res Function(OverlayModel) _then;

/// Create a copy of OverlayModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? kind = null,Object? order = null,Object? visible = null,Object? references = null,Object? bounds = freezed,Object? metadata = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as OverlayKind,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,visible: null == visible ? _self.visible : visible // ignore: cast_nullable_to_non_nullable
as bool,references: null == references ? _self.references : references // ignore: cast_nullable_to_non_nullable
as List<String>,bounds: freezed == bounds ? _self.bounds : bounds // ignore: cast_nullable_to_non_nullable
as Rect2D?,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}
/// Create a copy of OverlayModel
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


/// Adds pattern-matching-related methods to [OverlayModel].
extension OverlayModelPatterns on OverlayModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OverlayModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OverlayModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OverlayModel value)  $default,){
final _that = this;
switch (_that) {
case _OverlayModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OverlayModel value)?  $default,){
final _that = this;
switch (_that) {
case _OverlayModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  OverlayKind kind,  int order,  bool visible,  List<String> references,  Rect2D? bounds,  Map<String, Object?> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OverlayModel() when $default != null:
return $default(_that.id,_that.kind,_that.order,_that.visible,_that.references,_that.bounds,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  OverlayKind kind,  int order,  bool visible,  List<String> references,  Rect2D? bounds,  Map<String, Object?> metadata)  $default,) {final _that = this;
switch (_that) {
case _OverlayModel():
return $default(_that.id,_that.kind,_that.order,_that.visible,_that.references,_that.bounds,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  OverlayKind kind,  int order,  bool visible,  List<String> references,  Rect2D? bounds,  Map<String, Object?> metadata)?  $default,) {final _that = this;
switch (_that) {
case _OverlayModel() when $default != null:
return $default(_that.id,_that.kind,_that.order,_that.visible,_that.references,_that.bounds,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OverlayModel implements OverlayModel {
  const _OverlayModel({required this.id, required this.kind, this.order = 0, this.visible = true, final  List<String> references = const <String>[], this.bounds, final  Map<String, Object?> metadata = const <String, Object?>{}}): _references = references,_metadata = metadata;
  factory _OverlayModel.fromJson(Map<String, dynamic> json) => _$OverlayModelFromJson(json);

@override final  String id;
@override final  OverlayKind kind;
/// Draw order within the overlay stack (higher paints later/on top).
@override@JsonKey() final  int order;
@override@JsonKey() final  bool visible;
/// Ids this overlay refers to (e.g. selected node ids). References only.
 final  List<String> _references;
/// Ids this overlay refers to (e.g. selected node ids). References only.
@override@JsonKey() List<String> get references {
  if (_references is EqualUnmodifiableListView) return _references;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_references);
}

/// Optional bounding region in document space.
@override final  Rect2D? bounds;
/// Open, tool-specific metadata (kept out of the frozen schema).
 final  Map<String, Object?> _metadata;
/// Open, tool-specific metadata (kept out of the frozen schema).
@override@JsonKey() Map<String, Object?> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of OverlayModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OverlayModelCopyWith<_OverlayModel> get copyWith => __$OverlayModelCopyWithImpl<_OverlayModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OverlayModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OverlayModel&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.order, order) || other.order == order)&&(identical(other.visible, visible) || other.visible == visible)&&const DeepCollectionEquality().equals(other._references, _references)&&(identical(other.bounds, bounds) || other.bounds == bounds)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,kind,order,visible,const DeepCollectionEquality().hash(_references),bounds,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'OverlayModel(id: $id, kind: $kind, order: $order, visible: $visible, references: $references, bounds: $bounds, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$OverlayModelCopyWith<$Res> implements $OverlayModelCopyWith<$Res> {
  factory _$OverlayModelCopyWith(_OverlayModel value, $Res Function(_OverlayModel) _then) = __$OverlayModelCopyWithImpl;
@override @useResult
$Res call({
 String id, OverlayKind kind, int order, bool visible, List<String> references, Rect2D? bounds, Map<String, Object?> metadata
});


@override $Rect2DCopyWith<$Res>? get bounds;

}
/// @nodoc
class __$OverlayModelCopyWithImpl<$Res>
    implements _$OverlayModelCopyWith<$Res> {
  __$OverlayModelCopyWithImpl(this._self, this._then);

  final _OverlayModel _self;
  final $Res Function(_OverlayModel) _then;

/// Create a copy of OverlayModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? kind = null,Object? order = null,Object? visible = null,Object? references = null,Object? bounds = freezed,Object? metadata = null,}) {
  return _then(_OverlayModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as OverlayKind,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,visible: null == visible ? _self.visible : visible // ignore: cast_nullable_to_non_nullable
as bool,references: null == references ? _self._references : references // ignore: cast_nullable_to_non_nullable
as List<String>,bounds: freezed == bounds ? _self.bounds : bounds // ignore: cast_nullable_to_non_nullable
as Rect2D?,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

/// Create a copy of OverlayModel
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
mixin _$OverlayStack {

 List<OverlayModel> get entries;
/// Create a copy of OverlayStack
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OverlayStackCopyWith<OverlayStack> get copyWith => _$OverlayStackCopyWithImpl<OverlayStack>(this as OverlayStack, _$identity);

  /// Serializes this OverlayStack to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OverlayStack&&const DeepCollectionEquality().equals(other.entries, entries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(entries));

@override
String toString() {
  return 'OverlayStack(entries: $entries)';
}


}

/// @nodoc
abstract mixin class $OverlayStackCopyWith<$Res>  {
  factory $OverlayStackCopyWith(OverlayStack value, $Res Function(OverlayStack) _then) = _$OverlayStackCopyWithImpl;
@useResult
$Res call({
 List<OverlayModel> entries
});




}
/// @nodoc
class _$OverlayStackCopyWithImpl<$Res>
    implements $OverlayStackCopyWith<$Res> {
  _$OverlayStackCopyWithImpl(this._self, this._then);

  final OverlayStack _self;
  final $Res Function(OverlayStack) _then;

/// Create a copy of OverlayStack
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? entries = null,}) {
  return _then(_self.copyWith(
entries: null == entries ? _self.entries : entries // ignore: cast_nullable_to_non_nullable
as List<OverlayModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [OverlayStack].
extension OverlayStackPatterns on OverlayStack {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OverlayStack value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OverlayStack() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OverlayStack value)  $default,){
final _that = this;
switch (_that) {
case _OverlayStack():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OverlayStack value)?  $default,){
final _that = this;
switch (_that) {
case _OverlayStack() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<OverlayModel> entries)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OverlayStack() when $default != null:
return $default(_that.entries);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<OverlayModel> entries)  $default,) {final _that = this;
switch (_that) {
case _OverlayStack():
return $default(_that.entries);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<OverlayModel> entries)?  $default,) {final _that = this;
switch (_that) {
case _OverlayStack() when $default != null:
return $default(_that.entries);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OverlayStack extends OverlayStack {
  const _OverlayStack({final  List<OverlayModel> entries = const <OverlayModel>[]}): _entries = entries,super._();
  factory _OverlayStack.fromJson(Map<String, dynamic> json) => _$OverlayStackFromJson(json);

 final  List<OverlayModel> _entries;
@override@JsonKey() List<OverlayModel> get entries {
  if (_entries is EqualUnmodifiableListView) return _entries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entries);
}


/// Create a copy of OverlayStack
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OverlayStackCopyWith<_OverlayStack> get copyWith => __$OverlayStackCopyWithImpl<_OverlayStack>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OverlayStackToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OverlayStack&&const DeepCollectionEquality().equals(other._entries, _entries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_entries));

@override
String toString() {
  return 'OverlayStack(entries: $entries)';
}


}

/// @nodoc
abstract mixin class _$OverlayStackCopyWith<$Res> implements $OverlayStackCopyWith<$Res> {
  factory _$OverlayStackCopyWith(_OverlayStack value, $Res Function(_OverlayStack) _then) = __$OverlayStackCopyWithImpl;
@override @useResult
$Res call({
 List<OverlayModel> entries
});




}
/// @nodoc
class __$OverlayStackCopyWithImpl<$Res>
    implements _$OverlayStackCopyWith<$Res> {
  __$OverlayStackCopyWithImpl(this._self, this._then);

  final _OverlayStack _self;
  final $Res Function(_OverlayStack) _then;

/// Create a copy of OverlayStack
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? entries = null,}) {
  return _then(_OverlayStack(
entries: null == entries ? _self._entries : entries // ignore: cast_nullable_to_non_nullable
as List<OverlayModel>,
  ));
}


}

// dart format on
