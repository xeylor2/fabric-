// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prompt_template.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PromptTemplate {

/// Stable template id — the value stamped into
/// `CompiledPrompt.templateId` and, downstream, the frozen
/// `AiProvenanceRecord.templateId`.
 String get id;/// The ordered skeleton (frozen [PromptSegment] role vocabulary).
/// Segment content may contain `{{key}}` placeholders.
 List<PromptSegment> get segments; Map<String, Object?> get metadata;
/// Create a copy of PromptTemplate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PromptTemplateCopyWith<PromptTemplate> get copyWith => _$PromptTemplateCopyWithImpl<PromptTemplate>(this as PromptTemplate, _$identity);

  /// Serializes this PromptTemplate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PromptTemplate&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.segments, segments)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(segments),const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'PromptTemplate(id: $id, segments: $segments, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $PromptTemplateCopyWith<$Res>  {
  factory $PromptTemplateCopyWith(PromptTemplate value, $Res Function(PromptTemplate) _then) = _$PromptTemplateCopyWithImpl;
@useResult
$Res call({
 String id, List<PromptSegment> segments, Map<String, Object?> metadata
});




}
/// @nodoc
class _$PromptTemplateCopyWithImpl<$Res>
    implements $PromptTemplateCopyWith<$Res> {
  _$PromptTemplateCopyWithImpl(this._self, this._then);

  final PromptTemplate _self;
  final $Res Function(PromptTemplate) _then;

/// Create a copy of PromptTemplate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? segments = null,Object? metadata = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,segments: null == segments ? _self.segments : segments // ignore: cast_nullable_to_non_nullable
as List<PromptSegment>,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

}


/// Adds pattern-matching-related methods to [PromptTemplate].
extension PromptTemplatePatterns on PromptTemplate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PromptTemplate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PromptTemplate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PromptTemplate value)  $default,){
final _that = this;
switch (_that) {
case _PromptTemplate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PromptTemplate value)?  $default,){
final _that = this;
switch (_that) {
case _PromptTemplate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  List<PromptSegment> segments,  Map<String, Object?> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PromptTemplate() when $default != null:
return $default(_that.id,_that.segments,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  List<PromptSegment> segments,  Map<String, Object?> metadata)  $default,) {final _that = this;
switch (_that) {
case _PromptTemplate():
return $default(_that.id,_that.segments,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  List<PromptSegment> segments,  Map<String, Object?> metadata)?  $default,) {final _that = this;
switch (_that) {
case _PromptTemplate() when $default != null:
return $default(_that.id,_that.segments,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PromptTemplate implements PromptTemplate {
  const _PromptTemplate({required this.id, final  List<PromptSegment> segments = const <PromptSegment>[], final  Map<String, Object?> metadata = const <String, Object?>{}}): _segments = segments,_metadata = metadata;
  factory _PromptTemplate.fromJson(Map<String, dynamic> json) => _$PromptTemplateFromJson(json);

/// Stable template id — the value stamped into
/// `CompiledPrompt.templateId` and, downstream, the frozen
/// `AiProvenanceRecord.templateId`.
@override final  String id;
/// The ordered skeleton (frozen [PromptSegment] role vocabulary).
/// Segment content may contain `{{key}}` placeholders.
 final  List<PromptSegment> _segments;
/// The ordered skeleton (frozen [PromptSegment] role vocabulary).
/// Segment content may contain `{{key}}` placeholders.
@override@JsonKey() List<PromptSegment> get segments {
  if (_segments is EqualUnmodifiableListView) return _segments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_segments);
}

 final  Map<String, Object?> _metadata;
@override@JsonKey() Map<String, Object?> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of PromptTemplate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PromptTemplateCopyWith<_PromptTemplate> get copyWith => __$PromptTemplateCopyWithImpl<_PromptTemplate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PromptTemplateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PromptTemplate&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._segments, _segments)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_segments),const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'PromptTemplate(id: $id, segments: $segments, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$PromptTemplateCopyWith<$Res> implements $PromptTemplateCopyWith<$Res> {
  factory _$PromptTemplateCopyWith(_PromptTemplate value, $Res Function(_PromptTemplate) _then) = __$PromptTemplateCopyWithImpl;
@override @useResult
$Res call({
 String id, List<PromptSegment> segments, Map<String, Object?> metadata
});




}
/// @nodoc
class __$PromptTemplateCopyWithImpl<$Res>
    implements _$PromptTemplateCopyWith<$Res> {
  __$PromptTemplateCopyWithImpl(this._self, this._then);

  final _PromptTemplate _self;
  final $Res Function(_PromptTemplate) _then;

/// Create a copy of PromptTemplate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? segments = null,Object? metadata = null,}) {
  return _then(_PromptTemplate(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,segments: null == segments ? _self._segments : segments // ignore: cast_nullable_to_non_nullable
as List<PromptSegment>,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}

// dart format on
