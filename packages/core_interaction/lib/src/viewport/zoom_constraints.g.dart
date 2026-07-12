// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zoom_constraints.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ZoomConstraints _$ZoomConstraintsFromJson(Map<String, dynamic> json) =>
    _ZoomConstraints(
      minZoom: (json['minZoom'] as num?)?.toDouble() ?? 0.02,
      maxZoom: (json['maxZoom'] as num?)?.toDouble() ?? 64.0,
      stepFactor: (json['stepFactor'] as num?)?.toDouble() ?? 1.25,
      defaultZoom: (json['defaultZoom'] as num?)?.toDouble() ?? 1.0,
      fitPadding: (json['fitPadding'] as num?)?.toDouble() ?? 0.08,
    );

Map<String, dynamic> _$ZoomConstraintsToJson(_ZoomConstraints instance) =>
    <String, dynamic>{
      'minZoom': instance.minZoom,
      'maxZoom': instance.maxZoom,
      'stepFactor': instance.stepFactor,
      'defaultZoom': instance.defaultZoom,
      'fitPadding': instance.fitPadding,
    };
