// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'canvas_reference.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CanvasReference _$CanvasReferenceFromJson(Map<String, dynamic> json) =>
    _CanvasReference(
      kind: $enumDecode(_$CanvasReferenceKindEnumMap, json['kind']),
      refId: json['refId'] as String,
    );

Map<String, dynamic> _$CanvasReferenceToJson(_CanvasReference instance) =>
    <String, dynamic>{
      'kind': _$CanvasReferenceKindEnumMap[instance.kind]!,
      'refId': instance.refId,
    };

const _$CanvasReferenceKindEnumMap = {
  CanvasReferenceKind.designNode: 'designNode',
  CanvasReferenceKind.asset: 'asset',
  CanvasReferenceKind.layer: 'layer',
};
