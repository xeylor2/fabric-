// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transform2d.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Transform2D _$Transform2DFromJson(Map<String, dynamic> json) => _Transform2D(
  translation: json['translation'] == null
      ? Point2D.zero
      : Point2D.fromJson(json['translation'] as Map<String, dynamic>),
  rotation: (json['rotation'] as num?)?.toDouble() ?? 0.0,
  scale: (json['scale'] as num?)?.toDouble() ?? 1.0,
);

Map<String, dynamic> _$Transform2DToJson(_Transform2D instance) =>
    <String, dynamic>{
      'translation': instance.translation.toJson(),
      'rotation': instance.rotation,
      'scale': instance.scale,
    };
