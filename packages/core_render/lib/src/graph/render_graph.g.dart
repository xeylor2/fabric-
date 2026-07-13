// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'render_graph.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RenderGraph _$RenderGraphFromJson(Map<String, dynamic> json) => _RenderGraph(
  revision: RevisionId.fromJson((json['revision'] as num).toInt()),
  target: RenderTarget.fromJson(json['target'] as Map<String, dynamic>),
  objects:
      (json['objects'] as List<dynamic>?)
          ?.map((e) => RenderObject.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <RenderObject>[],
);

Map<String, dynamic> _$RenderGraphToJson(_RenderGraph instance) =>
    <String, dynamic>{
      'revision': instance.revision.toJson(),
      'target': instance.target.toJson(),
      'objects': instance.objects.map((e) => e.toJson()).toList(),
    };
