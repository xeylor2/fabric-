// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interaction_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InteractionConfig _$InteractionConfigFromJson(
  Map<String, dynamic> json,
) => _InteractionConfig(
  constraints: json['constraints'] == null
      ? ZoomConstraints.standard
      : ZoomConstraints.fromJson(json['constraints'] as Map<String, dynamic>),
  wheelZoomRequiresModifier: json['wheelZoomRequiresModifier'] as bool? ?? true,
  wheelZoomSensitivity:
      (json['wheelZoomSensitivity'] as num?)?.toDouble() ?? 0.002,
  inertiaFriction: (json['inertiaFriction'] as num?)?.toDouble() ?? 4.0,
);

Map<String, dynamic> _$InteractionConfigToJson(_InteractionConfig instance) =>
    <String, dynamic>{
      'constraints': instance.constraints.toJson(),
      'wheelZoomRequiresModifier': instance.wheelZoomRequiresModifier,
      'wheelZoomSensitivity': instance.wheelZoomSensitivity,
      'inertiaFriction': instance.inertiaFriction,
    };
