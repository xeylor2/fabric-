// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viewport_animation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ViewportAnimation _$ViewportAnimationFromJson(Map<String, dynamic> json) =>
    _ViewportAnimation(
      from: ViewportState.fromJson(json['from'] as Map<String, dynamic>),
      to: ViewportState.fromJson(json['to'] as Map<String, dynamic>),
      duration: json['duration'] == null
          ? const Duration(milliseconds: 240)
          : Duration(microseconds: (json['duration'] as num).toInt()),
      curve:
          $enumDecodeNullable(_$ViewportCurveEnumMap, json['curve']) ??
          ViewportCurve.easeOut,
    );

Map<String, dynamic> _$ViewportAnimationToJson(_ViewportAnimation instance) =>
    <String, dynamic>{
      'from': instance.from.toJson(),
      'to': instance.to.toJson(),
      'duration': instance.duration.inMicroseconds,
      'curve': _$ViewportCurveEnumMap[instance.curve]!,
    };

const _$ViewportCurveEnumMap = {
  ViewportCurve.linear: 'linear',
  ViewportCurve.easeOut: 'easeOut',
  ViewportCurve.easeInOut: 'easeInOut',
};
