// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'key_modifiers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_KeyModifiers _$KeyModifiersFromJson(Map<String, dynamic> json) =>
    _KeyModifiers(
      control: json['control'] as bool? ?? false,
      shift: json['shift'] as bool? ?? false,
      alt: json['alt'] as bool? ?? false,
      meta: json['meta'] as bool? ?? false,
    );

Map<String, dynamic> _$KeyModifiersToJson(_KeyModifiers instance) =>
    <String, dynamic>{
      'control': instance.control,
      'shift': instance.shift,
      'alt': instance.alt,
      'meta': instance.meta,
    };
