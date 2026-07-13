// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backend_capabilities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BackendCapabilities _$BackendCapabilitiesFromJson(Map<String, dynamic> json) =>
    _BackendCapabilities(
      features: json['features'] == null
          ? const <BackendCapabilityKind>{}
          : _featuresFromJson(json['features'] as List),
      blendModes: json['blendModes'] == null
          ? const <FebricBlendMode>{}
          : _blendsFromJson(json['blendModes'] as List),
      determinism: json['determinism'] == null
          ? RenderDeterminismLevel.backendExact
          : _levelFromJson(json['determinism'] as String),
      maxTextureSize: (json['maxTextureSize'] as num?)?.toInt() ?? 4096,
      maxTileSize: (json['maxTileSize'] as num?)?.toInt() ?? 256,
      maxTexturesInFlight: (json['maxTexturesInFlight'] as num?)?.toInt() ?? 64,
      maxDrawCallsPerFrame:
          (json['maxDrawCallsPerFrame'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$BackendCapabilitiesToJson(
  _BackendCapabilities instance,
) => <String, dynamic>{
  'features': _featuresToJson(instance.features),
  'blendModes': _blendsToJson(instance.blendModes),
  'determinism': _levelToJson(instance.determinism),
  'maxTextureSize': instance.maxTextureSize,
  'maxTileSize': instance.maxTileSize,
  'maxTexturesInFlight': instance.maxTexturesInFlight,
  'maxDrawCallsPerFrame': instance.maxDrawCallsPerFrame,
};
