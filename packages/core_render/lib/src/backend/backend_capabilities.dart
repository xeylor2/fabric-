import 'package:core_layer/core_layer.dart';
import 'package:core_render/src/vocabulary/render_vocabulary.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'backend_capabilities.freezed.dart';
part 'backend_capabilities.g.dart';

/// A backend's declared capabilities as pure data (Rendering Constitution
/// §B). The pipeline reads flags/limits and the supported blend/colour sets;
/// it never touches the device or downcasts the backend — no implementation
/// leakage. Flags absent from [features] are treated as unsupported.
@freezed
abstract class BackendCapabilities with _$BackendCapabilities {
  const factory BackendCapabilities({
    /// Feature flags the backend supports.
    @JsonKey(fromJson: _featuresFromJson, toJson: _featuresToJson)
    @Default(<BackendCapabilityKind>{})
    Set<BackendCapabilityKind> features,

    /// Blend modes implemented natively (subset of the frozen 16).
    @JsonKey(fromJson: _blendsFromJson, toJson: _blendsToJson)
    @Default(<FebricBlendMode>{})
    Set<FebricBlendMode> blendModes,

    /// Declared determinism level of this backend.
    @JsonKey(fromJson: _levelFromJson, toJson: _levelToJson)
    @Default(RenderDeterminismLevel.backendExact)
    RenderDeterminismLevel determinism,

    @Default(4096) int maxTextureSize,
    @Default(256) int maxTileSize,
    @Default(64) int maxTexturesInFlight,
    @Default(0) int maxDrawCallsPerFrame,
  }) = _BackendCapabilities;

  factory BackendCapabilities.fromJson(Map<String, Object?> json) =>
      _$BackendCapabilitiesFromJson(json);

  const BackendCapabilities._();

  /// Whether a feature is declared supported.
  bool supports(BackendCapabilityKind feature) => features.contains(feature);

  /// Whether a blend mode is natively supported.
  bool supportsBlend(FebricBlendMode mode) => blendModes.contains(mode);
}

Set<BackendCapabilityKind> _featuresFromJson(List<dynamic> json) =>
    json.map((e) => BackendCapabilityKind.fromWireName(e as String)).toSet();

List<String> _featuresToJson(Set<BackendCapabilityKind> features) =>
    features.map((f) => f.wireName).toList();

Set<FebricBlendMode> _blendsFromJson(List<dynamic> json) =>
    json.map((e) => FebricBlendMode.fromWireName(e as String)).toSet();

List<String> _blendsToJson(Set<FebricBlendMode> modes) =>
    modes.map((m) => m.wireName).toList();

RenderDeterminismLevel _levelFromJson(String wireName) =>
    RenderDeterminismLevel.fromWireName(wireName);

String _levelToJson(RenderDeterminismLevel level) => level.wireName;
