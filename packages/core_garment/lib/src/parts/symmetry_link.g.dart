// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'symmetry_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SymmetryLink _$SymmetryLinkFromJson(Map<String, dynamic> json) =>
    _SymmetryLink(
      group: json['group'] as String,
      instances:
          (json['instances'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      linked: json['linked'] as bool? ?? true,
    );

Map<String, dynamic> _$SymmetryLinkToJson(_SymmetryLink instance) =>
    <String, dynamic>{
      'group': instance.group,
      'instances': instance.instances,
      'linked': instance.linked,
    };
