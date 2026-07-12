// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asset_usage_graph.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AssetUsage {

 String get assetId; String get nodeId; String get artboardId; String get documentId;
/// Create a copy of AssetUsage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssetUsageCopyWith<AssetUsage> get copyWith => _$AssetUsageCopyWithImpl<AssetUsage>(this as AssetUsage, _$identity);

  /// Serializes this AssetUsage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssetUsage&&(identical(other.assetId, assetId) || other.assetId == assetId)&&(identical(other.nodeId, nodeId) || other.nodeId == nodeId)&&(identical(other.artboardId, artboardId) || other.artboardId == artboardId)&&(identical(other.documentId, documentId) || other.documentId == documentId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,assetId,nodeId,artboardId,documentId);

@override
String toString() {
  return 'AssetUsage(assetId: $assetId, nodeId: $nodeId, artboardId: $artboardId, documentId: $documentId)';
}


}

/// @nodoc
abstract mixin class $AssetUsageCopyWith<$Res>  {
  factory $AssetUsageCopyWith(AssetUsage value, $Res Function(AssetUsage) _then) = _$AssetUsageCopyWithImpl;
@useResult
$Res call({
 String assetId, String nodeId, String artboardId, String documentId
});




}
/// @nodoc
class _$AssetUsageCopyWithImpl<$Res>
    implements $AssetUsageCopyWith<$Res> {
  _$AssetUsageCopyWithImpl(this._self, this._then);

  final AssetUsage _self;
  final $Res Function(AssetUsage) _then;

/// Create a copy of AssetUsage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? assetId = null,Object? nodeId = null,Object? artboardId = null,Object? documentId = null,}) {
  return _then(_self.copyWith(
assetId: null == assetId ? _self.assetId : assetId // ignore: cast_nullable_to_non_nullable
as String,nodeId: null == nodeId ? _self.nodeId : nodeId // ignore: cast_nullable_to_non_nullable
as String,artboardId: null == artboardId ? _self.artboardId : artboardId // ignore: cast_nullable_to_non_nullable
as String,documentId: null == documentId ? _self.documentId : documentId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AssetUsage].
extension AssetUsagePatterns on AssetUsage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AssetUsage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AssetUsage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AssetUsage value)  $default,){
final _that = this;
switch (_that) {
case _AssetUsage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AssetUsage value)?  $default,){
final _that = this;
switch (_that) {
case _AssetUsage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String assetId,  String nodeId,  String artboardId,  String documentId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AssetUsage() when $default != null:
return $default(_that.assetId,_that.nodeId,_that.artboardId,_that.documentId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String assetId,  String nodeId,  String artboardId,  String documentId)  $default,) {final _that = this;
switch (_that) {
case _AssetUsage():
return $default(_that.assetId,_that.nodeId,_that.artboardId,_that.documentId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String assetId,  String nodeId,  String artboardId,  String documentId)?  $default,) {final _that = this;
switch (_that) {
case _AssetUsage() when $default != null:
return $default(_that.assetId,_that.nodeId,_that.artboardId,_that.documentId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AssetUsage implements AssetUsage {
  const _AssetUsage({required this.assetId, required this.nodeId, required this.artboardId, required this.documentId});
  factory _AssetUsage.fromJson(Map<String, dynamic> json) => _$AssetUsageFromJson(json);

@override final  String assetId;
@override final  String nodeId;
@override final  String artboardId;
@override final  String documentId;

/// Create a copy of AssetUsage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssetUsageCopyWith<_AssetUsage> get copyWith => __$AssetUsageCopyWithImpl<_AssetUsage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssetUsageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssetUsage&&(identical(other.assetId, assetId) || other.assetId == assetId)&&(identical(other.nodeId, nodeId) || other.nodeId == nodeId)&&(identical(other.artboardId, artboardId) || other.artboardId == artboardId)&&(identical(other.documentId, documentId) || other.documentId == documentId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,assetId,nodeId,artboardId,documentId);

@override
String toString() {
  return 'AssetUsage(assetId: $assetId, nodeId: $nodeId, artboardId: $artboardId, documentId: $documentId)';
}


}

/// @nodoc
abstract mixin class _$AssetUsageCopyWith<$Res> implements $AssetUsageCopyWith<$Res> {
  factory _$AssetUsageCopyWith(_AssetUsage value, $Res Function(_AssetUsage) _then) = __$AssetUsageCopyWithImpl;
@override @useResult
$Res call({
 String assetId, String nodeId, String artboardId, String documentId
});




}
/// @nodoc
class __$AssetUsageCopyWithImpl<$Res>
    implements _$AssetUsageCopyWith<$Res> {
  __$AssetUsageCopyWithImpl(this._self, this._then);

  final _AssetUsage _self;
  final $Res Function(_AssetUsage) _then;

/// Create a copy of AssetUsage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? assetId = null,Object? nodeId = null,Object? artboardId = null,Object? documentId = null,}) {
  return _then(_AssetUsage(
assetId: null == assetId ? _self.assetId : assetId // ignore: cast_nullable_to_non_nullable
as String,nodeId: null == nodeId ? _self.nodeId : nodeId // ignore: cast_nullable_to_non_nullable
as String,artboardId: null == artboardId ? _self.artboardId : artboardId // ignore: cast_nullable_to_non_nullable
as String,documentId: null == documentId ? _self.documentId : documentId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$AssetUsageGraph {

 List<AssetUsage> get usages;
/// Create a copy of AssetUsageGraph
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssetUsageGraphCopyWith<AssetUsageGraph> get copyWith => _$AssetUsageGraphCopyWithImpl<AssetUsageGraph>(this as AssetUsageGraph, _$identity);

  /// Serializes this AssetUsageGraph to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssetUsageGraph&&const DeepCollectionEquality().equals(other.usages, usages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(usages));

@override
String toString() {
  return 'AssetUsageGraph(usages: $usages)';
}


}

/// @nodoc
abstract mixin class $AssetUsageGraphCopyWith<$Res>  {
  factory $AssetUsageGraphCopyWith(AssetUsageGraph value, $Res Function(AssetUsageGraph) _then) = _$AssetUsageGraphCopyWithImpl;
@useResult
$Res call({
 List<AssetUsage> usages
});




}
/// @nodoc
class _$AssetUsageGraphCopyWithImpl<$Res>
    implements $AssetUsageGraphCopyWith<$Res> {
  _$AssetUsageGraphCopyWithImpl(this._self, this._then);

  final AssetUsageGraph _self;
  final $Res Function(AssetUsageGraph) _then;

/// Create a copy of AssetUsageGraph
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? usages = null,}) {
  return _then(_self.copyWith(
usages: null == usages ? _self.usages : usages // ignore: cast_nullable_to_non_nullable
as List<AssetUsage>,
  ));
}

}


/// Adds pattern-matching-related methods to [AssetUsageGraph].
extension AssetUsageGraphPatterns on AssetUsageGraph {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AssetUsageGraph value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AssetUsageGraph() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AssetUsageGraph value)  $default,){
final _that = this;
switch (_that) {
case _AssetUsageGraph():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AssetUsageGraph value)?  $default,){
final _that = this;
switch (_that) {
case _AssetUsageGraph() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<AssetUsage> usages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AssetUsageGraph() when $default != null:
return $default(_that.usages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<AssetUsage> usages)  $default,) {final _that = this;
switch (_that) {
case _AssetUsageGraph():
return $default(_that.usages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<AssetUsage> usages)?  $default,) {final _that = this;
switch (_that) {
case _AssetUsageGraph() when $default != null:
return $default(_that.usages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AssetUsageGraph extends AssetUsageGraph {
  const _AssetUsageGraph({final  List<AssetUsage> usages = const <AssetUsage>[]}): _usages = usages,super._();
  factory _AssetUsageGraph.fromJson(Map<String, dynamic> json) => _$AssetUsageGraphFromJson(json);

 final  List<AssetUsage> _usages;
@override@JsonKey() List<AssetUsage> get usages {
  if (_usages is EqualUnmodifiableListView) return _usages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_usages);
}


/// Create a copy of AssetUsageGraph
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssetUsageGraphCopyWith<_AssetUsageGraph> get copyWith => __$AssetUsageGraphCopyWithImpl<_AssetUsageGraph>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssetUsageGraphToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssetUsageGraph&&const DeepCollectionEquality().equals(other._usages, _usages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_usages));

@override
String toString() {
  return 'AssetUsageGraph(usages: $usages)';
}


}

/// @nodoc
abstract mixin class _$AssetUsageGraphCopyWith<$Res> implements $AssetUsageGraphCopyWith<$Res> {
  factory _$AssetUsageGraphCopyWith(_AssetUsageGraph value, $Res Function(_AssetUsageGraph) _then) = __$AssetUsageGraphCopyWithImpl;
@override @useResult
$Res call({
 List<AssetUsage> usages
});




}
/// @nodoc
class __$AssetUsageGraphCopyWithImpl<$Res>
    implements _$AssetUsageGraphCopyWith<$Res> {
  __$AssetUsageGraphCopyWithImpl(this._self, this._then);

  final _AssetUsageGraph _self;
  final $Res Function(_AssetUsageGraph) _then;

/// Create a copy of AssetUsageGraph
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? usages = null,}) {
  return _then(_AssetUsageGraph(
usages: null == usages ? _self._usages : usages // ignore: cast_nullable_to_non_nullable
as List<AssetUsage>,
  ));
}


}

// dart format on
