// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'frame_budget.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FrameBudget _$FrameBudgetFromJson(Map<String, dynamic> json) => _FrameBudget(
  updateMicros: (json['updateMicros'] as num?)?.toInt() ?? 4000,
  renderMicros: (json['renderMicros'] as num?)?.toInt() ?? 8000,
  presentMicros: (json['presentMicros'] as num?)?.toInt() ?? 4000,
  frameMicros: (json['frameMicros'] as num?)?.toInt() ?? 16667,
  updateOverrun: json['updateOverrun'] == null
      ? OverrunPolicy.defer
      : _policyFromJson(json['updateOverrun'] as String),
  renderOverrun: json['renderOverrun'] == null
      ? OverrunPolicy.degradeLod
      : _policyFromJson(json['renderOverrun'] as String),
  presentOverrun: json['presentOverrun'] == null
      ? OverrunPolicy.presentLast
      : _policyFromJson(json['presentOverrun'] as String),
);

Map<String, dynamic> _$FrameBudgetToJson(_FrameBudget instance) =>
    <String, dynamic>{
      'updateMicros': instance.updateMicros,
      'renderMicros': instance.renderMicros,
      'presentMicros': instance.presentMicros,
      'frameMicros': instance.frameMicros,
      'updateOverrun': _policyToJson(instance.updateOverrun),
      'renderOverrun': _policyToJson(instance.renderOverrun),
      'presentOverrun': _policyToJson(instance.presentOverrun),
    };
