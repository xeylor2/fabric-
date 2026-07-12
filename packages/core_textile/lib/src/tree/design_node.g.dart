// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'design_node.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DesignNode _$DesignNodeFromJson(Map<String, dynamic> json) => _DesignNode(
  id: json['id'] as String,
  name: json['name'] as String,
  type: _typeFromJson(json['type'] as String),
  children:
      (json['children'] as List<dynamic>?)
          ?.map((e) => DesignNode.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <DesignNode>[],
  metadata:
      json['metadata'] as Map<String, dynamic>? ?? const <String, Object?>{},
  visible: json['visible'] as bool? ?? true,
  locked: json['locked'] as bool? ?? false,
  selected: json['selected'] as bool? ?? false,
);

Map<String, dynamic> _$DesignNodeToJson(_DesignNode instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _typeToJson(instance.type),
      'children': instance.children.map((e) => e.toJson()).toList(),
      'metadata': instance.metadata,
      'visible': instance.visible,
      'locked': instance.locked,
      'selected': instance.selected,
    };
