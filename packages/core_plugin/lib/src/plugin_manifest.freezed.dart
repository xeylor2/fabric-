// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plugin_manifest.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SemVer {

 int get major; int get minor; int get patch;
/// Create a copy of SemVer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SemVerCopyWith<SemVer> get copyWith => _$SemVerCopyWithImpl<SemVer>(this as SemVer, _$identity);

  /// Serializes this SemVer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SemVer&&(identical(other.major, major) || other.major == major)&&(identical(other.minor, minor) || other.minor == minor)&&(identical(other.patch, patch) || other.patch == patch));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,major,minor,patch);



}

/// @nodoc
abstract mixin class $SemVerCopyWith<$Res>  {
  factory $SemVerCopyWith(SemVer value, $Res Function(SemVer) _then) = _$SemVerCopyWithImpl;
@useResult
$Res call({
 int major, int minor, int patch
});




}
/// @nodoc
class _$SemVerCopyWithImpl<$Res>
    implements $SemVerCopyWith<$Res> {
  _$SemVerCopyWithImpl(this._self, this._then);

  final SemVer _self;
  final $Res Function(SemVer) _then;

/// Create a copy of SemVer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? major = null,Object? minor = null,Object? patch = null,}) {
  return _then(_self.copyWith(
major: null == major ? _self.major : major // ignore: cast_nullable_to_non_nullable
as int,minor: null == minor ? _self.minor : minor // ignore: cast_nullable_to_non_nullable
as int,patch: null == patch ? _self.patch : patch // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SemVer].
extension SemVerPatterns on SemVer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SemVer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SemVer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SemVer value)  $default,){
final _that = this;
switch (_that) {
case _SemVer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SemVer value)?  $default,){
final _that = this;
switch (_that) {
case _SemVer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int major,  int minor,  int patch)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SemVer() when $default != null:
return $default(_that.major,_that.minor,_that.patch);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int major,  int minor,  int patch)  $default,) {final _that = this;
switch (_that) {
case _SemVer():
return $default(_that.major,_that.minor,_that.patch);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int major,  int minor,  int patch)?  $default,) {final _that = this;
switch (_that) {
case _SemVer() when $default != null:
return $default(_that.major,_that.minor,_that.patch);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SemVer extends SemVer {
  const _SemVer({required this.major, required this.minor, required this.patch}): super._();
  factory _SemVer.fromJson(Map<String, dynamic> json) => _$SemVerFromJson(json);

@override final  int major;
@override final  int minor;
@override final  int patch;

/// Create a copy of SemVer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SemVerCopyWith<_SemVer> get copyWith => __$SemVerCopyWithImpl<_SemVer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SemVerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SemVer&&(identical(other.major, major) || other.major == major)&&(identical(other.minor, minor) || other.minor == minor)&&(identical(other.patch, patch) || other.patch == patch));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,major,minor,patch);



}

/// @nodoc
abstract mixin class _$SemVerCopyWith<$Res> implements $SemVerCopyWith<$Res> {
  factory _$SemVerCopyWith(_SemVer value, $Res Function(_SemVer) _then) = __$SemVerCopyWithImpl;
@override @useResult
$Res call({
 int major, int minor, int patch
});




}
/// @nodoc
class __$SemVerCopyWithImpl<$Res>
    implements _$SemVerCopyWith<$Res> {
  __$SemVerCopyWithImpl(this._self, this._then);

  final _SemVer _self;
  final $Res Function(_SemVer) _then;

/// Create a copy of SemVer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? major = null,Object? minor = null,Object? patch = null,}) {
  return _then(_SemVer(
major: null == major ? _self.major : major // ignore: cast_nullable_to_non_nullable
as int,minor: null == minor ? _self.minor : minor // ignore: cast_nullable_to_non_nullable
as int,patch: null == patch ? _self.patch : patch // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$PluginManifest {

/// Reverse-domain unique id (e.g. `com.studio.motif-pack`).
 String get id; String get name; SemVer get version;/// Host plugin-API version this plugin targets.
 int get apiVersion;/// Minimum FEBRIC host version required.
 SemVer get minHostVersion;/// Requested permissions — the host grants nothing else.
 List<PluginPermission> get permissions; PluginSandbox get sandbox;/// Events the plugin subscribes to.
 List<PluginEventKind> get events; String? get description; String? get author; String? get homepage;/// Marketplace category slug.
 String? get category;
/// Create a copy of PluginManifest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PluginManifestCopyWith<PluginManifest> get copyWith => _$PluginManifestCopyWithImpl<PluginManifest>(this as PluginManifest, _$identity);

  /// Serializes this PluginManifest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PluginManifest&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.version, version) || other.version == version)&&(identical(other.apiVersion, apiVersion) || other.apiVersion == apiVersion)&&(identical(other.minHostVersion, minHostVersion) || other.minHostVersion == minHostVersion)&&const DeepCollectionEquality().equals(other.permissions, permissions)&&(identical(other.sandbox, sandbox) || other.sandbox == sandbox)&&const DeepCollectionEquality().equals(other.events, events)&&(identical(other.description, description) || other.description == description)&&(identical(other.author, author) || other.author == author)&&(identical(other.homepage, homepage) || other.homepage == homepage)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,version,apiVersion,minHostVersion,const DeepCollectionEquality().hash(permissions),sandbox,const DeepCollectionEquality().hash(events),description,author,homepage,category);

@override
String toString() {
  return 'PluginManifest(id: $id, name: $name, version: $version, apiVersion: $apiVersion, minHostVersion: $minHostVersion, permissions: $permissions, sandbox: $sandbox, events: $events, description: $description, author: $author, homepage: $homepage, category: $category)';
}


}

/// @nodoc
abstract mixin class $PluginManifestCopyWith<$Res>  {
  factory $PluginManifestCopyWith(PluginManifest value, $Res Function(PluginManifest) _then) = _$PluginManifestCopyWithImpl;
@useResult
$Res call({
 String id, String name, SemVer version, int apiVersion, SemVer minHostVersion, List<PluginPermission> permissions, PluginSandbox sandbox, List<PluginEventKind> events, String? description, String? author, String? homepage, String? category
});


$SemVerCopyWith<$Res> get version;$SemVerCopyWith<$Res> get minHostVersion;

}
/// @nodoc
class _$PluginManifestCopyWithImpl<$Res>
    implements $PluginManifestCopyWith<$Res> {
  _$PluginManifestCopyWithImpl(this._self, this._then);

  final PluginManifest _self;
  final $Res Function(PluginManifest) _then;

/// Create a copy of PluginManifest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? version = null,Object? apiVersion = null,Object? minHostVersion = null,Object? permissions = null,Object? sandbox = null,Object? events = null,Object? description = freezed,Object? author = freezed,Object? homepage = freezed,Object? category = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as SemVer,apiVersion: null == apiVersion ? _self.apiVersion : apiVersion // ignore: cast_nullable_to_non_nullable
as int,minHostVersion: null == minHostVersion ? _self.minHostVersion : minHostVersion // ignore: cast_nullable_to_non_nullable
as SemVer,permissions: null == permissions ? _self.permissions : permissions // ignore: cast_nullable_to_non_nullable
as List<PluginPermission>,sandbox: null == sandbox ? _self.sandbox : sandbox // ignore: cast_nullable_to_non_nullable
as PluginSandbox,events: null == events ? _self.events : events // ignore: cast_nullable_to_non_nullable
as List<PluginEventKind>,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String?,homepage: freezed == homepage ? _self.homepage : homepage // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of PluginManifest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SemVerCopyWith<$Res> get version {
  
  return $SemVerCopyWith<$Res>(_self.version, (value) {
    return _then(_self.copyWith(version: value));
  });
}/// Create a copy of PluginManifest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SemVerCopyWith<$Res> get minHostVersion {
  
  return $SemVerCopyWith<$Res>(_self.minHostVersion, (value) {
    return _then(_self.copyWith(minHostVersion: value));
  });
}
}


/// Adds pattern-matching-related methods to [PluginManifest].
extension PluginManifestPatterns on PluginManifest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PluginManifest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PluginManifest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PluginManifest value)  $default,){
final _that = this;
switch (_that) {
case _PluginManifest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PluginManifest value)?  $default,){
final _that = this;
switch (_that) {
case _PluginManifest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  SemVer version,  int apiVersion,  SemVer minHostVersion,  List<PluginPermission> permissions,  PluginSandbox sandbox,  List<PluginEventKind> events,  String? description,  String? author,  String? homepage,  String? category)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PluginManifest() when $default != null:
return $default(_that.id,_that.name,_that.version,_that.apiVersion,_that.minHostVersion,_that.permissions,_that.sandbox,_that.events,_that.description,_that.author,_that.homepage,_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  SemVer version,  int apiVersion,  SemVer minHostVersion,  List<PluginPermission> permissions,  PluginSandbox sandbox,  List<PluginEventKind> events,  String? description,  String? author,  String? homepage,  String? category)  $default,) {final _that = this;
switch (_that) {
case _PluginManifest():
return $default(_that.id,_that.name,_that.version,_that.apiVersion,_that.minHostVersion,_that.permissions,_that.sandbox,_that.events,_that.description,_that.author,_that.homepage,_that.category);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  SemVer version,  int apiVersion,  SemVer minHostVersion,  List<PluginPermission> permissions,  PluginSandbox sandbox,  List<PluginEventKind> events,  String? description,  String? author,  String? homepage,  String? category)?  $default,) {final _that = this;
switch (_that) {
case _PluginManifest() when $default != null:
return $default(_that.id,_that.name,_that.version,_that.apiVersion,_that.minHostVersion,_that.permissions,_that.sandbox,_that.events,_that.description,_that.author,_that.homepage,_that.category);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PluginManifest extends PluginManifest {
  const _PluginManifest({required this.id, required this.name, required this.version, required this.apiVersion, required this.minHostVersion, final  List<PluginPermission> permissions = const <PluginPermission>[], this.sandbox = PluginSandbox.isolateSandbox, final  List<PluginEventKind> events = const <PluginEventKind>[], this.description, this.author, this.homepage, this.category}): _permissions = permissions,_events = events,super._();
  factory _PluginManifest.fromJson(Map<String, dynamic> json) => _$PluginManifestFromJson(json);

/// Reverse-domain unique id (e.g. `com.studio.motif-pack`).
@override final  String id;
@override final  String name;
@override final  SemVer version;
/// Host plugin-API version this plugin targets.
@override final  int apiVersion;
/// Minimum FEBRIC host version required.
@override final  SemVer minHostVersion;
/// Requested permissions — the host grants nothing else.
 final  List<PluginPermission> _permissions;
/// Requested permissions — the host grants nothing else.
@override@JsonKey() List<PluginPermission> get permissions {
  if (_permissions is EqualUnmodifiableListView) return _permissions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_permissions);
}

@override@JsonKey() final  PluginSandbox sandbox;
/// Events the plugin subscribes to.
 final  List<PluginEventKind> _events;
/// Events the plugin subscribes to.
@override@JsonKey() List<PluginEventKind> get events {
  if (_events is EqualUnmodifiableListView) return _events;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_events);
}

@override final  String? description;
@override final  String? author;
@override final  String? homepage;
/// Marketplace category slug.
@override final  String? category;

/// Create a copy of PluginManifest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PluginManifestCopyWith<_PluginManifest> get copyWith => __$PluginManifestCopyWithImpl<_PluginManifest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PluginManifestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PluginManifest&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.version, version) || other.version == version)&&(identical(other.apiVersion, apiVersion) || other.apiVersion == apiVersion)&&(identical(other.minHostVersion, minHostVersion) || other.minHostVersion == minHostVersion)&&const DeepCollectionEquality().equals(other._permissions, _permissions)&&(identical(other.sandbox, sandbox) || other.sandbox == sandbox)&&const DeepCollectionEquality().equals(other._events, _events)&&(identical(other.description, description) || other.description == description)&&(identical(other.author, author) || other.author == author)&&(identical(other.homepage, homepage) || other.homepage == homepage)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,version,apiVersion,minHostVersion,const DeepCollectionEquality().hash(_permissions),sandbox,const DeepCollectionEquality().hash(_events),description,author,homepage,category);

@override
String toString() {
  return 'PluginManifest(id: $id, name: $name, version: $version, apiVersion: $apiVersion, minHostVersion: $minHostVersion, permissions: $permissions, sandbox: $sandbox, events: $events, description: $description, author: $author, homepage: $homepage, category: $category)';
}


}

/// @nodoc
abstract mixin class _$PluginManifestCopyWith<$Res> implements $PluginManifestCopyWith<$Res> {
  factory _$PluginManifestCopyWith(_PluginManifest value, $Res Function(_PluginManifest) _then) = __$PluginManifestCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, SemVer version, int apiVersion, SemVer minHostVersion, List<PluginPermission> permissions, PluginSandbox sandbox, List<PluginEventKind> events, String? description, String? author, String? homepage, String? category
});


@override $SemVerCopyWith<$Res> get version;@override $SemVerCopyWith<$Res> get minHostVersion;

}
/// @nodoc
class __$PluginManifestCopyWithImpl<$Res>
    implements _$PluginManifestCopyWith<$Res> {
  __$PluginManifestCopyWithImpl(this._self, this._then);

  final _PluginManifest _self;
  final $Res Function(_PluginManifest) _then;

/// Create a copy of PluginManifest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? version = null,Object? apiVersion = null,Object? minHostVersion = null,Object? permissions = null,Object? sandbox = null,Object? events = null,Object? description = freezed,Object? author = freezed,Object? homepage = freezed,Object? category = freezed,}) {
  return _then(_PluginManifest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as SemVer,apiVersion: null == apiVersion ? _self.apiVersion : apiVersion // ignore: cast_nullable_to_non_nullable
as int,minHostVersion: null == minHostVersion ? _self.minHostVersion : minHostVersion // ignore: cast_nullable_to_non_nullable
as SemVer,permissions: null == permissions ? _self._permissions : permissions // ignore: cast_nullable_to_non_nullable
as List<PluginPermission>,sandbox: null == sandbox ? _self.sandbox : sandbox // ignore: cast_nullable_to_non_nullable
as PluginSandbox,events: null == events ? _self._events : events // ignore: cast_nullable_to_non_nullable
as List<PluginEventKind>,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String?,homepage: freezed == homepage ? _self.homepage : homepage // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of PluginManifest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SemVerCopyWith<$Res> get version {
  
  return $SemVerCopyWith<$Res>(_self.version, (value) {
    return _then(_self.copyWith(version: value));
  });
}/// Create a copy of PluginManifest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SemVerCopyWith<$Res> get minHostVersion {
  
  return $SemVerCopyWith<$Res>(_self.minHostVersion, (value) {
    return _then(_self.copyWith(minHostVersion: value));
  });
}
}


/// @nodoc
mixin _$PluginCommand {

/// Unique within the plugin (`pluginId/commandId` globally).
 String get commandId; String get title;/// Workspace category wire name this command surfaces under.
 String? get category;
/// Create a copy of PluginCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PluginCommandCopyWith<PluginCommand> get copyWith => _$PluginCommandCopyWithImpl<PluginCommand>(this as PluginCommand, _$identity);

  /// Serializes this PluginCommand to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PluginCommand&&(identical(other.commandId, commandId) || other.commandId == commandId)&&(identical(other.title, title) || other.title == title)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,commandId,title,category);

@override
String toString() {
  return 'PluginCommand(commandId: $commandId, title: $title, category: $category)';
}


}

/// @nodoc
abstract mixin class $PluginCommandCopyWith<$Res>  {
  factory $PluginCommandCopyWith(PluginCommand value, $Res Function(PluginCommand) _then) = _$PluginCommandCopyWithImpl;
@useResult
$Res call({
 String commandId, String title, String? category
});




}
/// @nodoc
class _$PluginCommandCopyWithImpl<$Res>
    implements $PluginCommandCopyWith<$Res> {
  _$PluginCommandCopyWithImpl(this._self, this._then);

  final PluginCommand _self;
  final $Res Function(PluginCommand) _then;

/// Create a copy of PluginCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? commandId = null,Object? title = null,Object? category = freezed,}) {
  return _then(_self.copyWith(
commandId: null == commandId ? _self.commandId : commandId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PluginCommand].
extension PluginCommandPatterns on PluginCommand {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PluginCommand value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PluginCommand() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PluginCommand value)  $default,){
final _that = this;
switch (_that) {
case _PluginCommand():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PluginCommand value)?  $default,){
final _that = this;
switch (_that) {
case _PluginCommand() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String commandId,  String title,  String? category)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PluginCommand() when $default != null:
return $default(_that.commandId,_that.title,_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String commandId,  String title,  String? category)  $default,) {final _that = this;
switch (_that) {
case _PluginCommand():
return $default(_that.commandId,_that.title,_that.category);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String commandId,  String title,  String? category)?  $default,) {final _that = this;
switch (_that) {
case _PluginCommand() when $default != null:
return $default(_that.commandId,_that.title,_that.category);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PluginCommand implements PluginCommand {
  const _PluginCommand({required this.commandId, required this.title, this.category});
  factory _PluginCommand.fromJson(Map<String, dynamic> json) => _$PluginCommandFromJson(json);

/// Unique within the plugin (`pluginId/commandId` globally).
@override final  String commandId;
@override final  String title;
/// Workspace category wire name this command surfaces under.
@override final  String? category;

/// Create a copy of PluginCommand
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PluginCommandCopyWith<_PluginCommand> get copyWith => __$PluginCommandCopyWithImpl<_PluginCommand>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PluginCommandToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PluginCommand&&(identical(other.commandId, commandId) || other.commandId == commandId)&&(identical(other.title, title) || other.title == title)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,commandId,title,category);

@override
String toString() {
  return 'PluginCommand(commandId: $commandId, title: $title, category: $category)';
}


}

/// @nodoc
abstract mixin class _$PluginCommandCopyWith<$Res> implements $PluginCommandCopyWith<$Res> {
  factory _$PluginCommandCopyWith(_PluginCommand value, $Res Function(_PluginCommand) _then) = __$PluginCommandCopyWithImpl;
@override @useResult
$Res call({
 String commandId, String title, String? category
});




}
/// @nodoc
class __$PluginCommandCopyWithImpl<$Res>
    implements _$PluginCommandCopyWith<$Res> {
  __$PluginCommandCopyWithImpl(this._self, this._then);

  final _PluginCommand _self;
  final $Res Function(_PluginCommand) _then;

/// Create a copy of PluginCommand
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? commandId = null,Object? title = null,Object? category = freezed,}) {
  return _then(_PluginCommand(
commandId: null == commandId ? _self.commandId : commandId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
