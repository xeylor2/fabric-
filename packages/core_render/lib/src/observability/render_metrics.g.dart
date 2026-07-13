// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'render_metrics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RenderMetrics _$RenderMetricsFromJson(Map<String, dynamic> json) =>
    _RenderMetrics(
      frameId: (json['frameId'] as num?)?.toInt() ?? 0,
      values:
          (json['values'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as num),
          ) ??
          const <String, num>{},
    );

Map<String, dynamic> _$RenderMetricsToJson(_RenderMetrics instance) =>
    <String, dynamic>{'frameId': instance.frameId, 'values': instance.values};
