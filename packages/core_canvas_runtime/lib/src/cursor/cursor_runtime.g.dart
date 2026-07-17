// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cursor_runtime.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CursorState _$CursorStateFromJson(Map<String, dynamic> json) => _CursorState(
  kind: json['kind'] == null
      ? CursorKind.arrow
      : _kindFromJson(json['kind'] as String),
  screenPosition: json['screenPosition'] == null
      ? null
      : Point2D.fromJson(json['screenPosition'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CursorStateToJson(_CursorState instance) =>
    <String, dynamic>{
      'kind': _kindToJson(instance.kind),
      'screenPosition': instance.screenPosition?.toJson(),
    };
