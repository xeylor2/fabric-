// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_version.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AssetVersionRecord _$AssetVersionRecordFromJson(Map<String, dynamic> json) =>
    _AssetVersionRecord(
      version: (json['version'] as num).toInt(),
      hash: json['hash'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      author: json['author'] as String? ?? 'local',
      operation: json['operation'] as String?,
      provenanceId: json['provenanceId'] as String?,
      comment: json['comment'] as String?,
      parameters:
          json['parameters'] as Map<String, dynamic>? ??
          const <String, Object?>{},
    );

Map<String, dynamic> _$AssetVersionRecordToJson(_AssetVersionRecord instance) =>
    <String, dynamic>{
      'version': instance.version,
      'hash': instance.hash,
      'createdAt': instance.createdAt.toIso8601String(),
      'author': instance.author,
      'operation': instance.operation,
      'provenanceId': instance.provenanceId,
      'comment': instance.comment,
      'parameters': instance.parameters,
    };
