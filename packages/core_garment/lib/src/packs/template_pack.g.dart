// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_pack.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TemplatePack _$TemplatePackFromJson(Map<String, dynamic> json) =>
    _TemplatePack(
      id: json['id'] as String,
      name: json['name'] as String,
      packVersion: (json['packVersion'] as num?)?.toInt() ?? 1,
      templates:
          (json['templates'] as List<dynamic>?)
              ?.map((e) => GarmentTemplate.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <GarmentTemplate>[],
      schemas:
          (json['schemas'] as List<dynamic>?)
              ?.map((e) => GarmentSchema.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <GarmentSchema>[],
      metadata:
          json['metadata'] as Map<String, dynamic>? ??
          const <String, Object?>{},
    );

Map<String, dynamic> _$TemplatePackToJson(_TemplatePack instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'packVersion': instance.packVersion,
      'templates': instance.templates.map((e) => e.toJson()).toList(),
      'schemas': instance.schemas.map((e) => e.toJson()).toList(),
      'metadata': instance.metadata,
    };
