// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selection_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SelectionState _$SelectionStateFromJson(Map<String, dynamic> json) =>
    _SelectionState(
      selectedIds:
          (json['selectedIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toSet() ??
          const <String>{},
    );

Map<String, dynamic> _$SelectionStateToJson(_SelectionState instance) =>
    <String, dynamic>{'selectedIds': instance.selectedIds.toList()};
