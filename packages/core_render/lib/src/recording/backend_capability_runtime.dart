import 'package:core_asset/core_asset.dart';
import 'package:core_layer/core_layer.dart';
import 'package:core_render/src/backend/backend_capabilities.dart';
import 'package:core_render/src/vocabulary/render_vocabulary.dart';

/// Reads [BackendCapabilities] as data and resolves capability-gated
/// fallbacks (§B) — never probes or downcasts the backend (M5B-3).
///
/// Pure policy: identical capabilities + inputs yield identical decisions.
final class BackendCapabilityRuntime {
  const BackendCapabilityRuntime(this.capabilities);

  final BackendCapabilities capabilities;

  /// Whether [feature] is declared.
  bool supports(BackendCapabilityKind feature) =>
      capabilities.features.contains(feature);

  /// Resolves the blend mode to record: the requested [blend] when the backend
  /// declares support (or declares no explicit set — permissive), else the
  /// safe fallback `normal`.
  FebricBlendMode resolveBlend(FebricBlendMode blend) {
    if (capabilities.blendModes.isEmpty) return blend;
    return capabilities.blendModes.contains(blend)
        ? blend
        : FebricBlendMode.normal;
  }

  /// Whether the backend can honour [space] for colour-managed recording;
  /// non-managed backends fall back to sRGB approximation at record time.
  bool supportsColourSpace(AssetColourSpace space) {
    if (space == AssetColourSpace.srgb) return true;
    return capabilities.features.contains(
      BackendCapabilityKind.colourManagedOutput,
    );
  }

  /// Whether [size] fits the backend's texture limit (else the caller tiles).
  bool fitsTexture(int size) => size <= capabilities.maxTextureSize;
}
