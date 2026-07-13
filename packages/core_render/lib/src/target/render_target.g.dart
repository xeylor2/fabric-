// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'render_target.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RenderTarget _$RenderTargetFromJson(Map<String, dynamic> json) =>
    _RenderTarget(
      kind: _kindFromJson(json['kind'] as String),
      coordinateSystem: json['coordinateSystem'] == null
          ? CanvasCoordinateSystem.standard
          : CanvasCoordinateSystem.fromJson(
              json['coordinateSystem'] as Map<String, dynamic>,
            ),
      colourSpace: json['colourSpace'] == null
          ? AssetColourSpace.srgb
          : _colourFromJson(json['colourSpace'] as String),
      passes: json['passes'] == null
          ? const <RenderPassKind>[]
          : _passesFromJson(json['passes'] as List),
      budget: json['budget'] == null
          ? FrameBudget.interactive
          : FrameBudget.fromJson(json['budget'] as Map<String, dynamic>),
      onScreen: json['onScreen'] as bool? ?? true,
      fullResolution: json['fullResolution'] as bool? ?? false,
    );

Map<String, dynamic> _$RenderTargetToJson(_RenderTarget instance) =>
    <String, dynamic>{
      'kind': _kindToJson(instance.kind),
      'coordinateSystem': instance.coordinateSystem.toJson(),
      'colourSpace': _colourToJson(instance.colourSpace),
      'passes': _passesToJson(instance.passes),
      'budget': instance.budget.toJson(),
      'onScreen': instance.onScreen,
      'fullResolution': instance.fullResolution,
    };
