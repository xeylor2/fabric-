// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'garment_template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GarmentTemplate _$GarmentTemplateFromJson(
  Map<String, dynamic> json,
) => _GarmentTemplate(
  id: json['id'] as String,
  schemaRef: json['schemaRef'] as String,
  structureOptions:
      json['structureOptions'] as Map<String, dynamic>? ??
      const <String, Object?>{},
  starterDesign: json['starterDesign'] == null
      ? null
      : DesignNode.fromJson(json['starterDesign'] as Map<String, dynamic>),
  taxonomy:
      (json['taxonomy'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ) ??
      const <String, List<String>>{},
  authorship:
      json['authorship'] as Map<String, dynamic>? ?? const <String, Object?>{},
  contentVersion: (json['contentVersion'] as num?)?.toInt() ?? 1,
  metadata:
      json['metadata'] as Map<String, dynamic>? ?? const <String, Object?>{},
);

Map<String, dynamic> _$GarmentTemplateToJson(_GarmentTemplate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'schemaRef': instance.schemaRef,
      'structureOptions': instance.structureOptions,
      'starterDesign': instance.starterDesign?.toJson(),
      'taxonomy': instance.taxonomy,
      'authorship': instance.authorship,
      'contentVersion': instance.contentVersion,
      'metadata': instance.metadata,
    };
