// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'command_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommandApplied _$CommandAppliedFromJson(Map<String, dynamic> json) =>
    CommandApplied(
      revision: (json['revision'] as num).toInt(),
      affectedIds:
          (json['affectedIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$CommandAppliedToJson(CommandApplied instance) =>
    <String, dynamic>{
      'revision': instance.revision,
      'affectedIds': instance.affectedIds,
      'runtimeType': instance.$type,
    };

CommandRejected _$CommandRejectedFromJson(Map<String, dynamic> json) =>
    CommandRejected(
      reason: $enumDecode(_$CommandRejectionReasonEnumMap, json['reason']),
      blockedBy: json['blockedBy'] == null
          ? null
          : LockState.fromJson(json['blockedBy'] as Map<String, dynamic>),
      detail: json['detail'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$CommandRejectedToJson(CommandRejected instance) =>
    <String, dynamic>{
      'reason': _$CommandRejectionReasonEnumMap[instance.reason]!,
      'blockedBy': instance.blockedBy?.toJson(),
      'detail': instance.detail,
      'runtimeType': instance.$type,
    };

const _$CommandRejectionReasonEnumMap = {
  CommandRejectionReason.locked: 'locked',
  CommandRejectionReason.notFound: 'notFound',
  CommandRejectionReason.invalid: 'invalid',
  CommandRejectionReason.statusRefusesMutation: 'statusRefusesMutation',
  CommandRejectionReason.missingProvenance: 'missingProvenance',
};
