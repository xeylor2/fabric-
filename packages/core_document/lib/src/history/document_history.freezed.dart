// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'document_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HistoryEntry {

/// Stable UUID of this entry.
 String get id; DocumentCommand get command;/// The exact inverse command (computed by the reducer at apply time,
/// capturing prior values).
 DocumentCommand get inverse; DateTime get timestamp;/// Who authored the change (user id / agent id).
 String get author;@JsonKey(fromJson: _sourceFromJson, toJson: _sourceToJson) CommandSource get source;/// Ids of the objects the command touched.
 List<String> get affectedIds;/// Document revision this entry produced.
 int get revision;
/// Create a copy of HistoryEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryEntryCopyWith<HistoryEntry> get copyWith => _$HistoryEntryCopyWithImpl<HistoryEntry>(this as HistoryEntry, _$identity);

  /// Serializes this HistoryEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.command, command) || other.command == command)&&(identical(other.inverse, inverse) || other.inverse == inverse)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.author, author) || other.author == author)&&(identical(other.source, source) || other.source == source)&&const DeepCollectionEquality().equals(other.affectedIds, affectedIds)&&(identical(other.revision, revision) || other.revision == revision));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,command,inverse,timestamp,author,source,const DeepCollectionEquality().hash(affectedIds),revision);

@override
String toString() {
  return 'HistoryEntry(id: $id, command: $command, inverse: $inverse, timestamp: $timestamp, author: $author, source: $source, affectedIds: $affectedIds, revision: $revision)';
}


}

/// @nodoc
abstract mixin class $HistoryEntryCopyWith<$Res>  {
  factory $HistoryEntryCopyWith(HistoryEntry value, $Res Function(HistoryEntry) _then) = _$HistoryEntryCopyWithImpl;
@useResult
$Res call({
 String id, DocumentCommand command, DocumentCommand inverse, DateTime timestamp, String author,@JsonKey(fromJson: _sourceFromJson, toJson: _sourceToJson) CommandSource source, List<String> affectedIds, int revision
});


$DocumentCommandCopyWith<$Res> get command;$DocumentCommandCopyWith<$Res> get inverse;

}
/// @nodoc
class _$HistoryEntryCopyWithImpl<$Res>
    implements $HistoryEntryCopyWith<$Res> {
  _$HistoryEntryCopyWithImpl(this._self, this._then);

  final HistoryEntry _self;
  final $Res Function(HistoryEntry) _then;

/// Create a copy of HistoryEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? command = null,Object? inverse = null,Object? timestamp = null,Object? author = null,Object? source = null,Object? affectedIds = null,Object? revision = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,command: null == command ? _self.command : command // ignore: cast_nullable_to_non_nullable
as DocumentCommand,inverse: null == inverse ? _self.inverse : inverse // ignore: cast_nullable_to_non_nullable
as DocumentCommand,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as CommandSource,affectedIds: null == affectedIds ? _self.affectedIds : affectedIds // ignore: cast_nullable_to_non_nullable
as List<String>,revision: null == revision ? _self.revision : revision // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of HistoryEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentCommandCopyWith<$Res> get command {
  
  return $DocumentCommandCopyWith<$Res>(_self.command, (value) {
    return _then(_self.copyWith(command: value));
  });
}/// Create a copy of HistoryEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentCommandCopyWith<$Res> get inverse {
  
  return $DocumentCommandCopyWith<$Res>(_self.inverse, (value) {
    return _then(_self.copyWith(inverse: value));
  });
}
}


/// Adds pattern-matching-related methods to [HistoryEntry].
extension HistoryEntryPatterns on HistoryEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryEntry value)  $default,){
final _that = this;
switch (_that) {
case _HistoryEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryEntry value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DocumentCommand command,  DocumentCommand inverse,  DateTime timestamp,  String author, @JsonKey(fromJson: _sourceFromJson, toJson: _sourceToJson)  CommandSource source,  List<String> affectedIds,  int revision)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryEntry() when $default != null:
return $default(_that.id,_that.command,_that.inverse,_that.timestamp,_that.author,_that.source,_that.affectedIds,_that.revision);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DocumentCommand command,  DocumentCommand inverse,  DateTime timestamp,  String author, @JsonKey(fromJson: _sourceFromJson, toJson: _sourceToJson)  CommandSource source,  List<String> affectedIds,  int revision)  $default,) {final _that = this;
switch (_that) {
case _HistoryEntry():
return $default(_that.id,_that.command,_that.inverse,_that.timestamp,_that.author,_that.source,_that.affectedIds,_that.revision);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DocumentCommand command,  DocumentCommand inverse,  DateTime timestamp,  String author, @JsonKey(fromJson: _sourceFromJson, toJson: _sourceToJson)  CommandSource source,  List<String> affectedIds,  int revision)?  $default,) {final _that = this;
switch (_that) {
case _HistoryEntry() when $default != null:
return $default(_that.id,_that.command,_that.inverse,_that.timestamp,_that.author,_that.source,_that.affectedIds,_that.revision);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HistoryEntry implements HistoryEntry {
  const _HistoryEntry({required this.id, required this.command, required this.inverse, required this.timestamp, required this.author, @JsonKey(fromJson: _sourceFromJson, toJson: _sourceToJson) required this.source, final  List<String> affectedIds = const <String>[], required this.revision}): _affectedIds = affectedIds;
  factory _HistoryEntry.fromJson(Map<String, dynamic> json) => _$HistoryEntryFromJson(json);

/// Stable UUID of this entry.
@override final  String id;
@override final  DocumentCommand command;
/// The exact inverse command (computed by the reducer at apply time,
/// capturing prior values).
@override final  DocumentCommand inverse;
@override final  DateTime timestamp;
/// Who authored the change (user id / agent id).
@override final  String author;
@override@JsonKey(fromJson: _sourceFromJson, toJson: _sourceToJson) final  CommandSource source;
/// Ids of the objects the command touched.
 final  List<String> _affectedIds;
/// Ids of the objects the command touched.
@override@JsonKey() List<String> get affectedIds {
  if (_affectedIds is EqualUnmodifiableListView) return _affectedIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_affectedIds);
}

/// Document revision this entry produced.
@override final  int revision;

/// Create a copy of HistoryEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryEntryCopyWith<_HistoryEntry> get copyWith => __$HistoryEntryCopyWithImpl<_HistoryEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HistoryEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.command, command) || other.command == command)&&(identical(other.inverse, inverse) || other.inverse == inverse)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.author, author) || other.author == author)&&(identical(other.source, source) || other.source == source)&&const DeepCollectionEquality().equals(other._affectedIds, _affectedIds)&&(identical(other.revision, revision) || other.revision == revision));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,command,inverse,timestamp,author,source,const DeepCollectionEquality().hash(_affectedIds),revision);

@override
String toString() {
  return 'HistoryEntry(id: $id, command: $command, inverse: $inverse, timestamp: $timestamp, author: $author, source: $source, affectedIds: $affectedIds, revision: $revision)';
}


}

/// @nodoc
abstract mixin class _$HistoryEntryCopyWith<$Res> implements $HistoryEntryCopyWith<$Res> {
  factory _$HistoryEntryCopyWith(_HistoryEntry value, $Res Function(_HistoryEntry) _then) = __$HistoryEntryCopyWithImpl;
@override @useResult
$Res call({
 String id, DocumentCommand command, DocumentCommand inverse, DateTime timestamp, String author,@JsonKey(fromJson: _sourceFromJson, toJson: _sourceToJson) CommandSource source, List<String> affectedIds, int revision
});


@override $DocumentCommandCopyWith<$Res> get command;@override $DocumentCommandCopyWith<$Res> get inverse;

}
/// @nodoc
class __$HistoryEntryCopyWithImpl<$Res>
    implements _$HistoryEntryCopyWith<$Res> {
  __$HistoryEntryCopyWithImpl(this._self, this._then);

  final _HistoryEntry _self;
  final $Res Function(_HistoryEntry) _then;

/// Create a copy of HistoryEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? command = null,Object? inverse = null,Object? timestamp = null,Object? author = null,Object? source = null,Object? affectedIds = null,Object? revision = null,}) {
  return _then(_HistoryEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,command: null == command ? _self.command : command // ignore: cast_nullable_to_non_nullable
as DocumentCommand,inverse: null == inverse ? _self.inverse : inverse // ignore: cast_nullable_to_non_nullable
as DocumentCommand,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as CommandSource,affectedIds: null == affectedIds ? _self._affectedIds : affectedIds // ignore: cast_nullable_to_non_nullable
as List<String>,revision: null == revision ? _self.revision : revision // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of HistoryEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentCommandCopyWith<$Res> get command {
  
  return $DocumentCommandCopyWith<$Res>(_self.command, (value) {
    return _then(_self.copyWith(command: value));
  });
}/// Create a copy of HistoryEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentCommandCopyWith<$Res> get inverse {
  
  return $DocumentCommandCopyWith<$Res>(_self.inverse, (value) {
    return _then(_self.copyWith(inverse: value));
  });
}
}


/// @nodoc
mixin _$DocumentHistory {

 List<HistoryEntry> get entries;/// Number of entries currently applied; entries[cursor - 1] is the
/// next undo candidate.
 int get cursor;
/// Create a copy of DocumentHistory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocumentHistoryCopyWith<DocumentHistory> get copyWith => _$DocumentHistoryCopyWithImpl<DocumentHistory>(this as DocumentHistory, _$identity);

  /// Serializes this DocumentHistory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentHistory&&const DeepCollectionEquality().equals(other.entries, entries)&&(identical(other.cursor, cursor) || other.cursor == cursor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(entries),cursor);

@override
String toString() {
  return 'DocumentHistory(entries: $entries, cursor: $cursor)';
}


}

/// @nodoc
abstract mixin class $DocumentHistoryCopyWith<$Res>  {
  factory $DocumentHistoryCopyWith(DocumentHistory value, $Res Function(DocumentHistory) _then) = _$DocumentHistoryCopyWithImpl;
@useResult
$Res call({
 List<HistoryEntry> entries, int cursor
});




}
/// @nodoc
class _$DocumentHistoryCopyWithImpl<$Res>
    implements $DocumentHistoryCopyWith<$Res> {
  _$DocumentHistoryCopyWithImpl(this._self, this._then);

  final DocumentHistory _self;
  final $Res Function(DocumentHistory) _then;

/// Create a copy of DocumentHistory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? entries = null,Object? cursor = null,}) {
  return _then(_self.copyWith(
entries: null == entries ? _self.entries : entries // ignore: cast_nullable_to_non_nullable
as List<HistoryEntry>,cursor: null == cursor ? _self.cursor : cursor // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DocumentHistory].
extension DocumentHistoryPatterns on DocumentHistory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DocumentHistory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DocumentHistory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DocumentHistory value)  $default,){
final _that = this;
switch (_that) {
case _DocumentHistory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DocumentHistory value)?  $default,){
final _that = this;
switch (_that) {
case _DocumentHistory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<HistoryEntry> entries,  int cursor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DocumentHistory() when $default != null:
return $default(_that.entries,_that.cursor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<HistoryEntry> entries,  int cursor)  $default,) {final _that = this;
switch (_that) {
case _DocumentHistory():
return $default(_that.entries,_that.cursor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<HistoryEntry> entries,  int cursor)?  $default,) {final _that = this;
switch (_that) {
case _DocumentHistory() when $default != null:
return $default(_that.entries,_that.cursor);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DocumentHistory extends DocumentHistory {
  const _DocumentHistory({final  List<HistoryEntry> entries = const <HistoryEntry>[], this.cursor = 0}): _entries = entries,super._();
  factory _DocumentHistory.fromJson(Map<String, dynamic> json) => _$DocumentHistoryFromJson(json);

 final  List<HistoryEntry> _entries;
@override@JsonKey() List<HistoryEntry> get entries {
  if (_entries is EqualUnmodifiableListView) return _entries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entries);
}

/// Number of entries currently applied; entries[cursor - 1] is the
/// next undo candidate.
@override@JsonKey() final  int cursor;

/// Create a copy of DocumentHistory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DocumentHistoryCopyWith<_DocumentHistory> get copyWith => __$DocumentHistoryCopyWithImpl<_DocumentHistory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DocumentHistoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DocumentHistory&&const DeepCollectionEquality().equals(other._entries, _entries)&&(identical(other.cursor, cursor) || other.cursor == cursor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_entries),cursor);

@override
String toString() {
  return 'DocumentHistory(entries: $entries, cursor: $cursor)';
}


}

/// @nodoc
abstract mixin class _$DocumentHistoryCopyWith<$Res> implements $DocumentHistoryCopyWith<$Res> {
  factory _$DocumentHistoryCopyWith(_DocumentHistory value, $Res Function(_DocumentHistory) _then) = __$DocumentHistoryCopyWithImpl;
@override @useResult
$Res call({
 List<HistoryEntry> entries, int cursor
});




}
/// @nodoc
class __$DocumentHistoryCopyWithImpl<$Res>
    implements _$DocumentHistoryCopyWith<$Res> {
  __$DocumentHistoryCopyWithImpl(this._self, this._then);

  final _DocumentHistory _self;
  final $Res Function(_DocumentHistory) _then;

/// Create a copy of DocumentHistory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? entries = null,Object? cursor = null,}) {
  return _then(_DocumentHistory(
entries: null == entries ? _self._entries : entries // ignore: cast_nullable_to_non_nullable
as List<HistoryEntry>,cursor: null == cursor ? _self.cursor : cursor // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
