// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prompt_pipeline.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConversationInput {

 String get utterance;/// Session identifiers binding the utterance to its workspace context.
 String? get projectId; String? get documentId; Map<String, Object?> get metadata;
/// Create a copy of ConversationInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConversationInputCopyWith<ConversationInput> get copyWith => _$ConversationInputCopyWithImpl<ConversationInput>(this as ConversationInput, _$identity);

  /// Serializes this ConversationInput to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConversationInput&&(identical(other.utterance, utterance) || other.utterance == utterance)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.documentId, documentId) || other.documentId == documentId)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,utterance,projectId,documentId,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'ConversationInput(utterance: $utterance, projectId: $projectId, documentId: $documentId, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $ConversationInputCopyWith<$Res>  {
  factory $ConversationInputCopyWith(ConversationInput value, $Res Function(ConversationInput) _then) = _$ConversationInputCopyWithImpl;
@useResult
$Res call({
 String utterance, String? projectId, String? documentId, Map<String, Object?> metadata
});




}
/// @nodoc
class _$ConversationInputCopyWithImpl<$Res>
    implements $ConversationInputCopyWith<$Res> {
  _$ConversationInputCopyWithImpl(this._self, this._then);

  final ConversationInput _self;
  final $Res Function(ConversationInput) _then;

/// Create a copy of ConversationInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? utterance = null,Object? projectId = freezed,Object? documentId = freezed,Object? metadata = null,}) {
  return _then(_self.copyWith(
utterance: null == utterance ? _self.utterance : utterance // ignore: cast_nullable_to_non_nullable
as String,projectId: freezed == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String?,documentId: freezed == documentId ? _self.documentId : documentId // ignore: cast_nullable_to_non_nullable
as String?,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

}


/// Adds pattern-matching-related methods to [ConversationInput].
extension ConversationInputPatterns on ConversationInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConversationInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConversationInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConversationInput value)  $default,){
final _that = this;
switch (_that) {
case _ConversationInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConversationInput value)?  $default,){
final _that = this;
switch (_that) {
case _ConversationInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String utterance,  String? projectId,  String? documentId,  Map<String, Object?> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConversationInput() when $default != null:
return $default(_that.utterance,_that.projectId,_that.documentId,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String utterance,  String? projectId,  String? documentId,  Map<String, Object?> metadata)  $default,) {final _that = this;
switch (_that) {
case _ConversationInput():
return $default(_that.utterance,_that.projectId,_that.documentId,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String utterance,  String? projectId,  String? documentId,  Map<String, Object?> metadata)?  $default,) {final _that = this;
switch (_that) {
case _ConversationInput() when $default != null:
return $default(_that.utterance,_that.projectId,_that.documentId,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConversationInput implements ConversationInput {
  const _ConversationInput({required this.utterance, this.projectId, this.documentId, final  Map<String, Object?> metadata = const <String, Object?>{}}): _metadata = metadata;
  factory _ConversationInput.fromJson(Map<String, dynamic> json) => _$ConversationInputFromJson(json);

@override final  String utterance;
/// Session identifiers binding the utterance to its workspace context.
@override final  String? projectId;
@override final  String? documentId;
 final  Map<String, Object?> _metadata;
@override@JsonKey() Map<String, Object?> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of ConversationInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConversationInputCopyWith<_ConversationInput> get copyWith => __$ConversationInputCopyWithImpl<_ConversationInput>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConversationInputToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConversationInput&&(identical(other.utterance, utterance) || other.utterance == utterance)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.documentId, documentId) || other.documentId == documentId)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,utterance,projectId,documentId,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'ConversationInput(utterance: $utterance, projectId: $projectId, documentId: $documentId, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$ConversationInputCopyWith<$Res> implements $ConversationInputCopyWith<$Res> {
  factory _$ConversationInputCopyWith(_ConversationInput value, $Res Function(_ConversationInput) _then) = __$ConversationInputCopyWithImpl;
@override @useResult
$Res call({
 String utterance, String? projectId, String? documentId, Map<String, Object?> metadata
});




}
/// @nodoc
class __$ConversationInputCopyWithImpl<$Res>
    implements _$ConversationInputCopyWith<$Res> {
  __$ConversationInputCopyWithImpl(this._self, this._then);

  final _ConversationInput _self;
  final $Res Function(_ConversationInput) _then;

/// Create a copy of ConversationInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? utterance = null,Object? projectId = freezed,Object? documentId = freezed,Object? metadata = null,}) {
  return _then(_ConversationInput(
utterance: null == utterance ? _self.utterance : utterance // ignore: cast_nullable_to_non_nullable
as String,projectId: freezed == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String?,documentId: freezed == documentId ? _self.documentId : documentId // ignore: cast_nullable_to_non_nullable
as String?,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}


/// @nodoc
mixin _$PromptIntent {

 ConversationIntentKind get kind;/// The frozen textile operation this intent maps to, when AI-backed.
@JsonKey(fromJson: _operationFromJson, toJson: _operationToJson) AiOperation? get operation;/// Resolved semantic target ids (Design Tree nodes, layers).
 List<String> get targetIds;/// Parser confidence 0..1 (low confidence triggers clarification).
 double get confidence; Map<String, Object?> get metadata;
/// Create a copy of PromptIntent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PromptIntentCopyWith<PromptIntent> get copyWith => _$PromptIntentCopyWithImpl<PromptIntent>(this as PromptIntent, _$identity);

  /// Serializes this PromptIntent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PromptIntent&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.operation, operation) || other.operation == operation)&&const DeepCollectionEquality().equals(other.targetIds, targetIds)&&(identical(other.confidence, confidence) || other.confidence == confidence)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,operation,const DeepCollectionEquality().hash(targetIds),confidence,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'PromptIntent(kind: $kind, operation: $operation, targetIds: $targetIds, confidence: $confidence, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $PromptIntentCopyWith<$Res>  {
  factory $PromptIntentCopyWith(PromptIntent value, $Res Function(PromptIntent) _then) = _$PromptIntentCopyWithImpl;
@useResult
$Res call({
 ConversationIntentKind kind,@JsonKey(fromJson: _operationFromJson, toJson: _operationToJson) AiOperation? operation, List<String> targetIds, double confidence, Map<String, Object?> metadata
});




}
/// @nodoc
class _$PromptIntentCopyWithImpl<$Res>
    implements $PromptIntentCopyWith<$Res> {
  _$PromptIntentCopyWithImpl(this._self, this._then);

  final PromptIntent _self;
  final $Res Function(PromptIntent) _then;

/// Create a copy of PromptIntent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? operation = freezed,Object? targetIds = null,Object? confidence = null,Object? metadata = null,}) {
  return _then(_self.copyWith(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as ConversationIntentKind,operation: freezed == operation ? _self.operation : operation // ignore: cast_nullable_to_non_nullable
as AiOperation?,targetIds: null == targetIds ? _self.targetIds : targetIds // ignore: cast_nullable_to_non_nullable
as List<String>,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

}


/// Adds pattern-matching-related methods to [PromptIntent].
extension PromptIntentPatterns on PromptIntent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PromptIntent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PromptIntent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PromptIntent value)  $default,){
final _that = this;
switch (_that) {
case _PromptIntent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PromptIntent value)?  $default,){
final _that = this;
switch (_that) {
case _PromptIntent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ConversationIntentKind kind, @JsonKey(fromJson: _operationFromJson, toJson: _operationToJson)  AiOperation? operation,  List<String> targetIds,  double confidence,  Map<String, Object?> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PromptIntent() when $default != null:
return $default(_that.kind,_that.operation,_that.targetIds,_that.confidence,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ConversationIntentKind kind, @JsonKey(fromJson: _operationFromJson, toJson: _operationToJson)  AiOperation? operation,  List<String> targetIds,  double confidence,  Map<String, Object?> metadata)  $default,) {final _that = this;
switch (_that) {
case _PromptIntent():
return $default(_that.kind,_that.operation,_that.targetIds,_that.confidence,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ConversationIntentKind kind, @JsonKey(fromJson: _operationFromJson, toJson: _operationToJson)  AiOperation? operation,  List<String> targetIds,  double confidence,  Map<String, Object?> metadata)?  $default,) {final _that = this;
switch (_that) {
case _PromptIntent() when $default != null:
return $default(_that.kind,_that.operation,_that.targetIds,_that.confidence,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PromptIntent implements PromptIntent {
  const _PromptIntent({required this.kind, @JsonKey(fromJson: _operationFromJson, toJson: _operationToJson) this.operation, final  List<String> targetIds = const <String>[], this.confidence = 1.0, final  Map<String, Object?> metadata = const <String, Object?>{}}): _targetIds = targetIds,_metadata = metadata;
  factory _PromptIntent.fromJson(Map<String, dynamic> json) => _$PromptIntentFromJson(json);

@override final  ConversationIntentKind kind;
/// The frozen textile operation this intent maps to, when AI-backed.
@override@JsonKey(fromJson: _operationFromJson, toJson: _operationToJson) final  AiOperation? operation;
/// Resolved semantic target ids (Design Tree nodes, layers).
 final  List<String> _targetIds;
/// Resolved semantic target ids (Design Tree nodes, layers).
@override@JsonKey() List<String> get targetIds {
  if (_targetIds is EqualUnmodifiableListView) return _targetIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_targetIds);
}

/// Parser confidence 0..1 (low confidence triggers clarification).
@override@JsonKey() final  double confidence;
 final  Map<String, Object?> _metadata;
@override@JsonKey() Map<String, Object?> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of PromptIntent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PromptIntentCopyWith<_PromptIntent> get copyWith => __$PromptIntentCopyWithImpl<_PromptIntent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PromptIntentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PromptIntent&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.operation, operation) || other.operation == operation)&&const DeepCollectionEquality().equals(other._targetIds, _targetIds)&&(identical(other.confidence, confidence) || other.confidence == confidence)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,operation,const DeepCollectionEquality().hash(_targetIds),confidence,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'PromptIntent(kind: $kind, operation: $operation, targetIds: $targetIds, confidence: $confidence, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$PromptIntentCopyWith<$Res> implements $PromptIntentCopyWith<$Res> {
  factory _$PromptIntentCopyWith(_PromptIntent value, $Res Function(_PromptIntent) _then) = __$PromptIntentCopyWithImpl;
@override @useResult
$Res call({
 ConversationIntentKind kind,@JsonKey(fromJson: _operationFromJson, toJson: _operationToJson) AiOperation? operation, List<String> targetIds, double confidence, Map<String, Object?> metadata
});




}
/// @nodoc
class __$PromptIntentCopyWithImpl<$Res>
    implements _$PromptIntentCopyWith<$Res> {
  __$PromptIntentCopyWithImpl(this._self, this._then);

  final _PromptIntent _self;
  final $Res Function(_PromptIntent) _then;

/// Create a copy of PromptIntent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? operation = freezed,Object? targetIds = null,Object? confidence = null,Object? metadata = null,}) {
  return _then(_PromptIntent(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as ConversationIntentKind,operation: freezed == operation ? _self.operation : operation // ignore: cast_nullable_to_non_nullable
as AiOperation?,targetIds: null == targetIds ? _self._targetIds : targetIds // ignore: cast_nullable_to_non_nullable
as List<String>,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}


/// @nodoc
mixin _$PromptContext {

/// Serialized summary of the relevant document/tree region.
 String? get documentSummary;/// Serialized summary of the current selection.
 String? get selectionSummary;/// Active locks — the constraint engine turns these into hard
/// constraints (invariant I4 pre-compute enforcement).
 LockSet get locks;/// Working palette (#RRGGBB), when palette-locked.
 List<String> get paletteHex; Map<String, Object?> get metadata;
/// Create a copy of PromptContext
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PromptContextCopyWith<PromptContext> get copyWith => _$PromptContextCopyWithImpl<PromptContext>(this as PromptContext, _$identity);

  /// Serializes this PromptContext to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PromptContext&&(identical(other.documentSummary, documentSummary) || other.documentSummary == documentSummary)&&(identical(other.selectionSummary, selectionSummary) || other.selectionSummary == selectionSummary)&&(identical(other.locks, locks) || other.locks == locks)&&const DeepCollectionEquality().equals(other.paletteHex, paletteHex)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,documentSummary,selectionSummary,locks,const DeepCollectionEquality().hash(paletteHex),const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'PromptContext(documentSummary: $documentSummary, selectionSummary: $selectionSummary, locks: $locks, paletteHex: $paletteHex, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $PromptContextCopyWith<$Res>  {
  factory $PromptContextCopyWith(PromptContext value, $Res Function(PromptContext) _then) = _$PromptContextCopyWithImpl;
@useResult
$Res call({
 String? documentSummary, String? selectionSummary, LockSet locks, List<String> paletteHex, Map<String, Object?> metadata
});


$LockSetCopyWith<$Res> get locks;

}
/// @nodoc
class _$PromptContextCopyWithImpl<$Res>
    implements $PromptContextCopyWith<$Res> {
  _$PromptContextCopyWithImpl(this._self, this._then);

  final PromptContext _self;
  final $Res Function(PromptContext) _then;

/// Create a copy of PromptContext
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? documentSummary = freezed,Object? selectionSummary = freezed,Object? locks = null,Object? paletteHex = null,Object? metadata = null,}) {
  return _then(_self.copyWith(
documentSummary: freezed == documentSummary ? _self.documentSummary : documentSummary // ignore: cast_nullable_to_non_nullable
as String?,selectionSummary: freezed == selectionSummary ? _self.selectionSummary : selectionSummary // ignore: cast_nullable_to_non_nullable
as String?,locks: null == locks ? _self.locks : locks // ignore: cast_nullable_to_non_nullable
as LockSet,paletteHex: null == paletteHex ? _self.paletteHex : paletteHex // ignore: cast_nullable_to_non_nullable
as List<String>,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}
/// Create a copy of PromptContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LockSetCopyWith<$Res> get locks {
  
  return $LockSetCopyWith<$Res>(_self.locks, (value) {
    return _then(_self.copyWith(locks: value));
  });
}
}


/// Adds pattern-matching-related methods to [PromptContext].
extension PromptContextPatterns on PromptContext {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PromptContext value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PromptContext() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PromptContext value)  $default,){
final _that = this;
switch (_that) {
case _PromptContext():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PromptContext value)?  $default,){
final _that = this;
switch (_that) {
case _PromptContext() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? documentSummary,  String? selectionSummary,  LockSet locks,  List<String> paletteHex,  Map<String, Object?> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PromptContext() when $default != null:
return $default(_that.documentSummary,_that.selectionSummary,_that.locks,_that.paletteHex,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? documentSummary,  String? selectionSummary,  LockSet locks,  List<String> paletteHex,  Map<String, Object?> metadata)  $default,) {final _that = this;
switch (_that) {
case _PromptContext():
return $default(_that.documentSummary,_that.selectionSummary,_that.locks,_that.paletteHex,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? documentSummary,  String? selectionSummary,  LockSet locks,  List<String> paletteHex,  Map<String, Object?> metadata)?  $default,) {final _that = this;
switch (_that) {
case _PromptContext() when $default != null:
return $default(_that.documentSummary,_that.selectionSummary,_that.locks,_that.paletteHex,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PromptContext implements PromptContext {
  const _PromptContext({this.documentSummary, this.selectionSummary, this.locks = LockSet.none, final  List<String> paletteHex = const <String>[], final  Map<String, Object?> metadata = const <String, Object?>{}}): _paletteHex = paletteHex,_metadata = metadata;
  factory _PromptContext.fromJson(Map<String, dynamic> json) => _$PromptContextFromJson(json);

/// Serialized summary of the relevant document/tree region.
@override final  String? documentSummary;
/// Serialized summary of the current selection.
@override final  String? selectionSummary;
/// Active locks — the constraint engine turns these into hard
/// constraints (invariant I4 pre-compute enforcement).
@override@JsonKey() final  LockSet locks;
/// Working palette (#RRGGBB), when palette-locked.
 final  List<String> _paletteHex;
/// Working palette (#RRGGBB), when palette-locked.
@override@JsonKey() List<String> get paletteHex {
  if (_paletteHex is EqualUnmodifiableListView) return _paletteHex;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_paletteHex);
}

 final  Map<String, Object?> _metadata;
@override@JsonKey() Map<String, Object?> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of PromptContext
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PromptContextCopyWith<_PromptContext> get copyWith => __$PromptContextCopyWithImpl<_PromptContext>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PromptContextToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PromptContext&&(identical(other.documentSummary, documentSummary) || other.documentSummary == documentSummary)&&(identical(other.selectionSummary, selectionSummary) || other.selectionSummary == selectionSummary)&&(identical(other.locks, locks) || other.locks == locks)&&const DeepCollectionEquality().equals(other._paletteHex, _paletteHex)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,documentSummary,selectionSummary,locks,const DeepCollectionEquality().hash(_paletteHex),const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'PromptContext(documentSummary: $documentSummary, selectionSummary: $selectionSummary, locks: $locks, paletteHex: $paletteHex, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$PromptContextCopyWith<$Res> implements $PromptContextCopyWith<$Res> {
  factory _$PromptContextCopyWith(_PromptContext value, $Res Function(_PromptContext) _then) = __$PromptContextCopyWithImpl;
@override @useResult
$Res call({
 String? documentSummary, String? selectionSummary, LockSet locks, List<String> paletteHex, Map<String, Object?> metadata
});


@override $LockSetCopyWith<$Res> get locks;

}
/// @nodoc
class __$PromptContextCopyWithImpl<$Res>
    implements _$PromptContextCopyWith<$Res> {
  __$PromptContextCopyWithImpl(this._self, this._then);

  final _PromptContext _self;
  final $Res Function(_PromptContext) _then;

/// Create a copy of PromptContext
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? documentSummary = freezed,Object? selectionSummary = freezed,Object? locks = null,Object? paletteHex = null,Object? metadata = null,}) {
  return _then(_PromptContext(
documentSummary: freezed == documentSummary ? _self.documentSummary : documentSummary // ignore: cast_nullable_to_non_nullable
as String?,selectionSummary: freezed == selectionSummary ? _self.selectionSummary : selectionSummary // ignore: cast_nullable_to_non_nullable
as String?,locks: null == locks ? _self.locks : locks // ignore: cast_nullable_to_non_nullable
as LockSet,paletteHex: null == paletteHex ? _self._paletteHex : paletteHex // ignore: cast_nullable_to_non_nullable
as List<String>,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

/// Create a copy of PromptContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LockSetCopyWith<$Res> get locks {
  
  return $LockSetCopyWith<$Res>(_self.locks, (value) {
    return _then(_self.copyWith(locks: value));
  });
}
}


/// @nodoc
mixin _$PromptConstraint {

 PromptConstraintKind get kind; String get description; Map<String, Object?> get payload;
/// Create a copy of PromptConstraint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PromptConstraintCopyWith<PromptConstraint> get copyWith => _$PromptConstraintCopyWithImpl<PromptConstraint>(this as PromptConstraint, _$identity);

  /// Serializes this PromptConstraint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PromptConstraint&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.payload, payload));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,description,const DeepCollectionEquality().hash(payload));

@override
String toString() {
  return 'PromptConstraint(kind: $kind, description: $description, payload: $payload)';
}


}

/// @nodoc
abstract mixin class $PromptConstraintCopyWith<$Res>  {
  factory $PromptConstraintCopyWith(PromptConstraint value, $Res Function(PromptConstraint) _then) = _$PromptConstraintCopyWithImpl;
@useResult
$Res call({
 PromptConstraintKind kind, String description, Map<String, Object?> payload
});




}
/// @nodoc
class _$PromptConstraintCopyWithImpl<$Res>
    implements $PromptConstraintCopyWith<$Res> {
  _$PromptConstraintCopyWithImpl(this._self, this._then);

  final PromptConstraint _self;
  final $Res Function(PromptConstraint) _then;

/// Create a copy of PromptConstraint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? description = null,Object? payload = null,}) {
  return _then(_self.copyWith(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as PromptConstraintKind,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,payload: null == payload ? _self.payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

}


/// Adds pattern-matching-related methods to [PromptConstraint].
extension PromptConstraintPatterns on PromptConstraint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PromptConstraint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PromptConstraint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PromptConstraint value)  $default,){
final _that = this;
switch (_that) {
case _PromptConstraint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PromptConstraint value)?  $default,){
final _that = this;
switch (_that) {
case _PromptConstraint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PromptConstraintKind kind,  String description,  Map<String, Object?> payload)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PromptConstraint() when $default != null:
return $default(_that.kind,_that.description,_that.payload);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PromptConstraintKind kind,  String description,  Map<String, Object?> payload)  $default,) {final _that = this;
switch (_that) {
case _PromptConstraint():
return $default(_that.kind,_that.description,_that.payload);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PromptConstraintKind kind,  String description,  Map<String, Object?> payload)?  $default,) {final _that = this;
switch (_that) {
case _PromptConstraint() when $default != null:
return $default(_that.kind,_that.description,_that.payload);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PromptConstraint implements PromptConstraint {
  const _PromptConstraint({required this.kind, required this.description, final  Map<String, Object?> payload = const <String, Object?>{}}): _payload = payload;
  factory _PromptConstraint.fromJson(Map<String, dynamic> json) => _$PromptConstraintFromJson(json);

@override final  PromptConstraintKind kind;
@override final  String description;
 final  Map<String, Object?> _payload;
@override@JsonKey() Map<String, Object?> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of PromptConstraint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PromptConstraintCopyWith<_PromptConstraint> get copyWith => __$PromptConstraintCopyWithImpl<_PromptConstraint>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PromptConstraintToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PromptConstraint&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._payload, _payload));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,description,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'PromptConstraint(kind: $kind, description: $description, payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$PromptConstraintCopyWith<$Res> implements $PromptConstraintCopyWith<$Res> {
  factory _$PromptConstraintCopyWith(_PromptConstraint value, $Res Function(_PromptConstraint) _then) = __$PromptConstraintCopyWithImpl;
@override @useResult
$Res call({
 PromptConstraintKind kind, String description, Map<String, Object?> payload
});




}
/// @nodoc
class __$PromptConstraintCopyWithImpl<$Res>
    implements _$PromptConstraintCopyWith<$Res> {
  __$PromptConstraintCopyWithImpl(this._self, this._then);

  final _PromptConstraint _self;
  final $Res Function(_PromptConstraint) _then;

/// Create a copy of PromptConstraint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? description = null,Object? payload = null,}) {
  return _then(_PromptConstraint(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as PromptConstraintKind,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}


/// @nodoc
mixin _$PromptSegment {

 PromptSegmentRole get role; String get content;
/// Create a copy of PromptSegment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PromptSegmentCopyWith<PromptSegment> get copyWith => _$PromptSegmentCopyWithImpl<PromptSegment>(this as PromptSegment, _$identity);

  /// Serializes this PromptSegment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PromptSegment&&(identical(other.role, role) || other.role == role)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,role,content);

@override
String toString() {
  return 'PromptSegment(role: $role, content: $content)';
}


}

/// @nodoc
abstract mixin class $PromptSegmentCopyWith<$Res>  {
  factory $PromptSegmentCopyWith(PromptSegment value, $Res Function(PromptSegment) _then) = _$PromptSegmentCopyWithImpl;
@useResult
$Res call({
 PromptSegmentRole role, String content
});




}
/// @nodoc
class _$PromptSegmentCopyWithImpl<$Res>
    implements $PromptSegmentCopyWith<$Res> {
  _$PromptSegmentCopyWithImpl(this._self, this._then);

  final PromptSegment _self;
  final $Res Function(PromptSegment) _then;

/// Create a copy of PromptSegment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? role = null,Object? content = null,}) {
  return _then(_self.copyWith(
role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as PromptSegmentRole,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PromptSegment].
extension PromptSegmentPatterns on PromptSegment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PromptSegment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PromptSegment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PromptSegment value)  $default,){
final _that = this;
switch (_that) {
case _PromptSegment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PromptSegment value)?  $default,){
final _that = this;
switch (_that) {
case _PromptSegment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PromptSegmentRole role,  String content)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PromptSegment() when $default != null:
return $default(_that.role,_that.content);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PromptSegmentRole role,  String content)  $default,) {final _that = this;
switch (_that) {
case _PromptSegment():
return $default(_that.role,_that.content);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PromptSegmentRole role,  String content)?  $default,) {final _that = this;
switch (_that) {
case _PromptSegment() when $default != null:
return $default(_that.role,_that.content);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PromptSegment implements PromptSegment {
  const _PromptSegment({required this.role, required this.content});
  factory _PromptSegment.fromJson(Map<String, dynamic> json) => _$PromptSegmentFromJson(json);

@override final  PromptSegmentRole role;
@override final  String content;

/// Create a copy of PromptSegment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PromptSegmentCopyWith<_PromptSegment> get copyWith => __$PromptSegmentCopyWithImpl<_PromptSegment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PromptSegmentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PromptSegment&&(identical(other.role, role) || other.role == role)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,role,content);

@override
String toString() {
  return 'PromptSegment(role: $role, content: $content)';
}


}

/// @nodoc
abstract mixin class _$PromptSegmentCopyWith<$Res> implements $PromptSegmentCopyWith<$Res> {
  factory _$PromptSegmentCopyWith(_PromptSegment value, $Res Function(_PromptSegment) _then) = __$PromptSegmentCopyWithImpl;
@override @useResult
$Res call({
 PromptSegmentRole role, String content
});




}
/// @nodoc
class __$PromptSegmentCopyWithImpl<$Res>
    implements _$PromptSegmentCopyWith<$Res> {
  __$PromptSegmentCopyWithImpl(this._self, this._then);

  final _PromptSegment _self;
  final $Res Function(_PromptSegment) _then;

/// Create a copy of PromptSegment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? role = null,Object? content = null,}) {
  return _then(_PromptSegment(
role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as PromptSegmentRole,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CompiledPrompt {

/// The frozen textile operation being executed.
@JsonKey(fromJson: _requiredOperationFromJson, toJson: _operationToJson) AiOperation get operation;/// Template applied by the template engine.
 String get templateId;/// Ordered, role-tagged segments.
 List<PromptSegment> get segments;/// Hard constraints (validated again post-execution).
 List<PromptConstraint> get constraints;/// Reproducibility seed.
 int? get seed; Map<String, Object?> get metadata;
/// Create a copy of CompiledPrompt
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompiledPromptCopyWith<CompiledPrompt> get copyWith => _$CompiledPromptCopyWithImpl<CompiledPrompt>(this as CompiledPrompt, _$identity);

  /// Serializes this CompiledPrompt to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompiledPrompt&&(identical(other.operation, operation) || other.operation == operation)&&(identical(other.templateId, templateId) || other.templateId == templateId)&&const DeepCollectionEquality().equals(other.segments, segments)&&const DeepCollectionEquality().equals(other.constraints, constraints)&&(identical(other.seed, seed) || other.seed == seed)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,operation,templateId,const DeepCollectionEquality().hash(segments),const DeepCollectionEquality().hash(constraints),seed,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'CompiledPrompt(operation: $operation, templateId: $templateId, segments: $segments, constraints: $constraints, seed: $seed, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $CompiledPromptCopyWith<$Res>  {
  factory $CompiledPromptCopyWith(CompiledPrompt value, $Res Function(CompiledPrompt) _then) = _$CompiledPromptCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _requiredOperationFromJson, toJson: _operationToJson) AiOperation operation, String templateId, List<PromptSegment> segments, List<PromptConstraint> constraints, int? seed, Map<String, Object?> metadata
});




}
/// @nodoc
class _$CompiledPromptCopyWithImpl<$Res>
    implements $CompiledPromptCopyWith<$Res> {
  _$CompiledPromptCopyWithImpl(this._self, this._then);

  final CompiledPrompt _self;
  final $Res Function(CompiledPrompt) _then;

/// Create a copy of CompiledPrompt
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? operation = null,Object? templateId = null,Object? segments = null,Object? constraints = null,Object? seed = freezed,Object? metadata = null,}) {
  return _then(_self.copyWith(
operation: null == operation ? _self.operation : operation // ignore: cast_nullable_to_non_nullable
as AiOperation,templateId: null == templateId ? _self.templateId : templateId // ignore: cast_nullable_to_non_nullable
as String,segments: null == segments ? _self.segments : segments // ignore: cast_nullable_to_non_nullable
as List<PromptSegment>,constraints: null == constraints ? _self.constraints : constraints // ignore: cast_nullable_to_non_nullable
as List<PromptConstraint>,seed: freezed == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
as int?,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

}


/// Adds pattern-matching-related methods to [CompiledPrompt].
extension CompiledPromptPatterns on CompiledPrompt {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CompiledPrompt value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CompiledPrompt() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CompiledPrompt value)  $default,){
final _that = this;
switch (_that) {
case _CompiledPrompt():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CompiledPrompt value)?  $default,){
final _that = this;
switch (_that) {
case _CompiledPrompt() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _requiredOperationFromJson, toJson: _operationToJson)  AiOperation operation,  String templateId,  List<PromptSegment> segments,  List<PromptConstraint> constraints,  int? seed,  Map<String, Object?> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CompiledPrompt() when $default != null:
return $default(_that.operation,_that.templateId,_that.segments,_that.constraints,_that.seed,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _requiredOperationFromJson, toJson: _operationToJson)  AiOperation operation,  String templateId,  List<PromptSegment> segments,  List<PromptConstraint> constraints,  int? seed,  Map<String, Object?> metadata)  $default,) {final _that = this;
switch (_that) {
case _CompiledPrompt():
return $default(_that.operation,_that.templateId,_that.segments,_that.constraints,_that.seed,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _requiredOperationFromJson, toJson: _operationToJson)  AiOperation operation,  String templateId,  List<PromptSegment> segments,  List<PromptConstraint> constraints,  int? seed,  Map<String, Object?> metadata)?  $default,) {final _that = this;
switch (_that) {
case _CompiledPrompt() when $default != null:
return $default(_that.operation,_that.templateId,_that.segments,_that.constraints,_that.seed,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CompiledPrompt implements CompiledPrompt {
  const _CompiledPrompt({@JsonKey(fromJson: _requiredOperationFromJson, toJson: _operationToJson) required this.operation, required this.templateId, final  List<PromptSegment> segments = const <PromptSegment>[], final  List<PromptConstraint> constraints = const <PromptConstraint>[], this.seed, final  Map<String, Object?> metadata = const <String, Object?>{}}): _segments = segments,_constraints = constraints,_metadata = metadata;
  factory _CompiledPrompt.fromJson(Map<String, dynamic> json) => _$CompiledPromptFromJson(json);

/// The frozen textile operation being executed.
@override@JsonKey(fromJson: _requiredOperationFromJson, toJson: _operationToJson) final  AiOperation operation;
/// Template applied by the template engine.
@override final  String templateId;
/// Ordered, role-tagged segments.
 final  List<PromptSegment> _segments;
/// Ordered, role-tagged segments.
@override@JsonKey() List<PromptSegment> get segments {
  if (_segments is EqualUnmodifiableListView) return _segments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_segments);
}

/// Hard constraints (validated again post-execution).
 final  List<PromptConstraint> _constraints;
/// Hard constraints (validated again post-execution).
@override@JsonKey() List<PromptConstraint> get constraints {
  if (_constraints is EqualUnmodifiableListView) return _constraints;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_constraints);
}

/// Reproducibility seed.
@override final  int? seed;
 final  Map<String, Object?> _metadata;
@override@JsonKey() Map<String, Object?> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of CompiledPrompt
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompiledPromptCopyWith<_CompiledPrompt> get copyWith => __$CompiledPromptCopyWithImpl<_CompiledPrompt>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompiledPromptToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompiledPrompt&&(identical(other.operation, operation) || other.operation == operation)&&(identical(other.templateId, templateId) || other.templateId == templateId)&&const DeepCollectionEquality().equals(other._segments, _segments)&&const DeepCollectionEquality().equals(other._constraints, _constraints)&&(identical(other.seed, seed) || other.seed == seed)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,operation,templateId,const DeepCollectionEquality().hash(_segments),const DeepCollectionEquality().hash(_constraints),seed,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'CompiledPrompt(operation: $operation, templateId: $templateId, segments: $segments, constraints: $constraints, seed: $seed, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$CompiledPromptCopyWith<$Res> implements $CompiledPromptCopyWith<$Res> {
  factory _$CompiledPromptCopyWith(_CompiledPrompt value, $Res Function(_CompiledPrompt) _then) = __$CompiledPromptCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _requiredOperationFromJson, toJson: _operationToJson) AiOperation operation, String templateId, List<PromptSegment> segments, List<PromptConstraint> constraints, int? seed, Map<String, Object?> metadata
});




}
/// @nodoc
class __$CompiledPromptCopyWithImpl<$Res>
    implements _$CompiledPromptCopyWith<$Res> {
  __$CompiledPromptCopyWithImpl(this._self, this._then);

  final _CompiledPrompt _self;
  final $Res Function(_CompiledPrompt) _then;

/// Create a copy of CompiledPrompt
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? operation = null,Object? templateId = null,Object? segments = null,Object? constraints = null,Object? seed = freezed,Object? metadata = null,}) {
  return _then(_CompiledPrompt(
operation: null == operation ? _self.operation : operation // ignore: cast_nullable_to_non_nullable
as AiOperation,templateId: null == templateId ? _self.templateId : templateId // ignore: cast_nullable_to_non_nullable
as String,segments: null == segments ? _self._segments : segments // ignore: cast_nullable_to_non_nullable
as List<PromptSegment>,constraints: null == constraints ? _self._constraints : constraints // ignore: cast_nullable_to_non_nullable
as List<PromptConstraint>,seed: freezed == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
as int?,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}


/// @nodoc
mixin _$PromptValidation {

 bool get valid; List<String> get violations;
/// Create a copy of PromptValidation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PromptValidationCopyWith<PromptValidation> get copyWith => _$PromptValidationCopyWithImpl<PromptValidation>(this as PromptValidation, _$identity);

  /// Serializes this PromptValidation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PromptValidation&&(identical(other.valid, valid) || other.valid == valid)&&const DeepCollectionEquality().equals(other.violations, violations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,valid,const DeepCollectionEquality().hash(violations));

@override
String toString() {
  return 'PromptValidation(valid: $valid, violations: $violations)';
}


}

/// @nodoc
abstract mixin class $PromptValidationCopyWith<$Res>  {
  factory $PromptValidationCopyWith(PromptValidation value, $Res Function(PromptValidation) _then) = _$PromptValidationCopyWithImpl;
@useResult
$Res call({
 bool valid, List<String> violations
});




}
/// @nodoc
class _$PromptValidationCopyWithImpl<$Res>
    implements $PromptValidationCopyWith<$Res> {
  _$PromptValidationCopyWithImpl(this._self, this._then);

  final PromptValidation _self;
  final $Res Function(PromptValidation) _then;

/// Create a copy of PromptValidation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? valid = null,Object? violations = null,}) {
  return _then(_self.copyWith(
valid: null == valid ? _self.valid : valid // ignore: cast_nullable_to_non_nullable
as bool,violations: null == violations ? _self.violations : violations // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [PromptValidation].
extension PromptValidationPatterns on PromptValidation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PromptValidation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PromptValidation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PromptValidation value)  $default,){
final _that = this;
switch (_that) {
case _PromptValidation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PromptValidation value)?  $default,){
final _that = this;
switch (_that) {
case _PromptValidation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool valid,  List<String> violations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PromptValidation() when $default != null:
return $default(_that.valid,_that.violations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool valid,  List<String> violations)  $default,) {final _that = this;
switch (_that) {
case _PromptValidation():
return $default(_that.valid,_that.violations);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool valid,  List<String> violations)?  $default,) {final _that = this;
switch (_that) {
case _PromptValidation() when $default != null:
return $default(_that.valid,_that.violations);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PromptValidation extends PromptValidation {
  const _PromptValidation({required this.valid, final  List<String> violations = const <String>[]}): _violations = violations,super._();
  factory _PromptValidation.fromJson(Map<String, dynamic> json) => _$PromptValidationFromJson(json);

@override final  bool valid;
 final  List<String> _violations;
@override@JsonKey() List<String> get violations {
  if (_violations is EqualUnmodifiableListView) return _violations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_violations);
}


/// Create a copy of PromptValidation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PromptValidationCopyWith<_PromptValidation> get copyWith => __$PromptValidationCopyWithImpl<_PromptValidation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PromptValidationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PromptValidation&&(identical(other.valid, valid) || other.valid == valid)&&const DeepCollectionEquality().equals(other._violations, _violations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,valid,const DeepCollectionEquality().hash(_violations));

@override
String toString() {
  return 'PromptValidation(valid: $valid, violations: $violations)';
}


}

/// @nodoc
abstract mixin class _$PromptValidationCopyWith<$Res> implements $PromptValidationCopyWith<$Res> {
  factory _$PromptValidationCopyWith(_PromptValidation value, $Res Function(_PromptValidation) _then) = __$PromptValidationCopyWithImpl;
@override @useResult
$Res call({
 bool valid, List<String> violations
});




}
/// @nodoc
class __$PromptValidationCopyWithImpl<$Res>
    implements _$PromptValidationCopyWith<$Res> {
  __$PromptValidationCopyWithImpl(this._self, this._then);

  final _PromptValidation _self;
  final $Res Function(_PromptValidation) _then;

/// Create a copy of PromptValidation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? valid = null,Object? violations = null,}) {
  return _then(_PromptValidation(
valid: null == valid ? _self.valid : valid // ignore: cast_nullable_to_non_nullable
as bool,violations: null == violations ? _self._violations : violations // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$ProviderResponse {

 AiProviderId get provider; bool get succeeded;/// Provider-neutral payload (parsed downstream).
 Map<String, Object?> get payload; String? get error;
/// Create a copy of ProviderResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProviderResponseCopyWith<ProviderResponse> get copyWith => _$ProviderResponseCopyWithImpl<ProviderResponse>(this as ProviderResponse, _$identity);

  /// Serializes this ProviderResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProviderResponse&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.succeeded, succeeded) || other.succeeded == succeeded)&&const DeepCollectionEquality().equals(other.payload, payload)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,provider,succeeded,const DeepCollectionEquality().hash(payload),error);

@override
String toString() {
  return 'ProviderResponse(provider: $provider, succeeded: $succeeded, payload: $payload, error: $error)';
}


}

/// @nodoc
abstract mixin class $ProviderResponseCopyWith<$Res>  {
  factory $ProviderResponseCopyWith(ProviderResponse value, $Res Function(ProviderResponse) _then) = _$ProviderResponseCopyWithImpl;
@useResult
$Res call({
 AiProviderId provider, bool succeeded, Map<String, Object?> payload, String? error
});




}
/// @nodoc
class _$ProviderResponseCopyWithImpl<$Res>
    implements $ProviderResponseCopyWith<$Res> {
  _$ProviderResponseCopyWithImpl(this._self, this._then);

  final ProviderResponse _self;
  final $Res Function(ProviderResponse) _then;

/// Create a copy of ProviderResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? provider = null,Object? succeeded = null,Object? payload = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as AiProviderId,succeeded: null == succeeded ? _self.succeeded : succeeded // ignore: cast_nullable_to_non_nullable
as bool,payload: null == payload ? _self.payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProviderResponse].
extension ProviderResponsePatterns on ProviderResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProviderResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProviderResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProviderResponse value)  $default,){
final _that = this;
switch (_that) {
case _ProviderResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProviderResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ProviderResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AiProviderId provider,  bool succeeded,  Map<String, Object?> payload,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProviderResponse() when $default != null:
return $default(_that.provider,_that.succeeded,_that.payload,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AiProviderId provider,  bool succeeded,  Map<String, Object?> payload,  String? error)  $default,) {final _that = this;
switch (_that) {
case _ProviderResponse():
return $default(_that.provider,_that.succeeded,_that.payload,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AiProviderId provider,  bool succeeded,  Map<String, Object?> payload,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _ProviderResponse() when $default != null:
return $default(_that.provider,_that.succeeded,_that.payload,_that.error);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProviderResponse implements ProviderResponse {
  const _ProviderResponse({required this.provider, required this.succeeded, final  Map<String, Object?> payload = const <String, Object?>{}, this.error}): _payload = payload;
  factory _ProviderResponse.fromJson(Map<String, dynamic> json) => _$ProviderResponseFromJson(json);

@override final  AiProviderId provider;
@override final  bool succeeded;
/// Provider-neutral payload (parsed downstream).
 final  Map<String, Object?> _payload;
/// Provider-neutral payload (parsed downstream).
@override@JsonKey() Map<String, Object?> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}

@override final  String? error;

/// Create a copy of ProviderResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProviderResponseCopyWith<_ProviderResponse> get copyWith => __$ProviderResponseCopyWithImpl<_ProviderResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProviderResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProviderResponse&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.succeeded, succeeded) || other.succeeded == succeeded)&&const DeepCollectionEquality().equals(other._payload, _payload)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,provider,succeeded,const DeepCollectionEquality().hash(_payload),error);

@override
String toString() {
  return 'ProviderResponse(provider: $provider, succeeded: $succeeded, payload: $payload, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ProviderResponseCopyWith<$Res> implements $ProviderResponseCopyWith<$Res> {
  factory _$ProviderResponseCopyWith(_ProviderResponse value, $Res Function(_ProviderResponse) _then) = __$ProviderResponseCopyWithImpl;
@override @useResult
$Res call({
 AiProviderId provider, bool succeeded, Map<String, Object?> payload, String? error
});




}
/// @nodoc
class __$ProviderResponseCopyWithImpl<$Res>
    implements _$ProviderResponseCopyWith<$Res> {
  __$ProviderResponseCopyWithImpl(this._self, this._then);

  final _ProviderResponse _self;
  final $Res Function(_ProviderResponse) _then;

/// Create a copy of ProviderResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? provider = null,Object? succeeded = null,Object? payload = null,Object? error = freezed,}) {
  return _then(_ProviderResponse(
provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as AiProviderId,succeeded: null == succeeded ? _self.succeeded : succeeded // ignore: cast_nullable_to_non_nullable
as bool,payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
