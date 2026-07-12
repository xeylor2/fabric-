// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NavigationState _$NavigationStateFromJson(Map<String, dynamic> json) =>
    _NavigationState(
      viewport: ViewportState.fromJson(
        json['viewport'] as Map<String, dynamic>,
      ),
      history:
          (json['history'] as List<dynamic>?)
              ?.map((e) => ViewportState.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ViewportState>[],
      maxHistory: (json['maxHistory'] as num?)?.toInt() ?? 32,
    );

Map<String, dynamic> _$NavigationStateToJson(_NavigationState instance) =>
    <String, dynamic>{
      'viewport': instance.viewport.toJson(),
      'history': instance.history.map((e) => e.toJson()).toList(),
      'maxHistory': instance.maxHistory,
    };
