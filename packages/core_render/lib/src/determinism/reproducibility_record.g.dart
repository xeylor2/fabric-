// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reproducibility_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReproducibilityRecord _$ReproducibilityRecordFromJson(
  Map<String, dynamic> json,
) => _ReproducibilityRecord(
  revision: RevisionId.fromJson((json['revision'] as num).toInt()),
  target: RenderTarget.fromJson(json['target'] as Map<String, dynamic>),
  backendId: json['backendId'] as String,
  determinismLevel: json['determinismLevel'] as String,
  colourSpace: json['colourSpace'] == null
      ? AssetColourSpace.cmyk
      : _colourFromJson(json['colourSpace'] as String),
);

Map<String, dynamic> _$ReproducibilityRecordToJson(
  _ReproducibilityRecord instance,
) => <String, dynamic>{
  'revision': instance.revision.toJson(),
  'target': instance.target.toJson(),
  'backendId': instance.backendId,
  'determinismLevel': instance.determinismLevel,
  'colourSpace': _colourToJson(instance.colourSpace),
};
