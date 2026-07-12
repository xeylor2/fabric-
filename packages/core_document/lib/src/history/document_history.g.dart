// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HistoryEntry _$HistoryEntryFromJson(
  Map<String, dynamic> json,
) => _HistoryEntry(
  id: json['id'] as String,
  command: DocumentCommand.fromJson(json['command'] as Map<String, dynamic>),
  inverse: DocumentCommand.fromJson(json['inverse'] as Map<String, dynamic>),
  timestamp: DateTime.parse(json['timestamp'] as String),
  author: json['author'] as String,
  source: _sourceFromJson(json['source'] as String),
  affectedIds:
      (json['affectedIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  revision: (json['revision'] as num).toInt(),
);

Map<String, dynamic> _$HistoryEntryToJson(_HistoryEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'command': instance.command.toJson(),
      'inverse': instance.inverse.toJson(),
      'timestamp': instance.timestamp.toIso8601String(),
      'author': instance.author,
      'source': _sourceToJson(instance.source),
      'affectedIds': instance.affectedIds,
      'revision': instance.revision,
    };

_DocumentHistory _$DocumentHistoryFromJson(Map<String, dynamic> json) =>
    _DocumentHistory(
      entries:
          (json['entries'] as List<dynamic>?)
              ?.map((e) => HistoryEntry.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <HistoryEntry>[],
      cursor: (json['cursor'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$DocumentHistoryToJson(_DocumentHistory instance) =>
    <String, dynamic>{
      'entries': instance.entries.map((e) => e.toJson()).toList(),
      'cursor': instance.cursor,
    };
