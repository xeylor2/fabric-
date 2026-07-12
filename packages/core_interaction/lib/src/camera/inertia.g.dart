// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inertia.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InertiaSpec _$InertiaSpecFromJson(Map<String, dynamic> json) => _InertiaSpec(
  initialVelocity: Point2D.fromJson(
    json['initialVelocity'] as Map<String, dynamic>,
  ),
  friction: (json['friction'] as num?)?.toDouble() ?? 4.5,
  restVelocity: (json['restVelocity'] as num?)?.toDouble() ?? 20.0,
);

Map<String, dynamic> _$InertiaSpecToJson(_InertiaSpec instance) =>
    <String, dynamic>{
      'initialVelocity': instance.initialVelocity.toJson(),
      'friction': instance.friction,
      'restVelocity': instance.restVelocity,
    };
