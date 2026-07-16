import 'package:core_render/src/backend/backend_capabilities.dart';
import 'package:core_render/src/platform/render_platform.dart';
import 'package:core_render/src/vocabulary/render_vocabulary.dart';

/// **Platform Capability Detection** (M5B-4).
///
/// Resolves the [BackendCapabilities] a given [RenderPlatform] is expected to
/// expose — as **data** (§B), never by probing a device. This is the pure-Dart
/// architecture of capability detection: the real Flutter/Impeller driver will
/// override these with device-queried values in the later presentation
/// milestone, but the *shape* and the routing/fallback contract are frozen
/// here. Deterministic: the same platform always yields the same profile.
///
/// It introduces no new capability vocabulary — it composes the frozen
/// `BackendCapabilityKind` / `FebricBlendMode` / `RenderDeterminismLevel` sets.
abstract final class PlatformCapabilityDetector {
  /// The capability profile expected for [platform]. All three supported
  /// platforms declare the same feature set here (the engine is
  /// platform-independent, R5); real drivers refine limits per device later.
  static BackendCapabilities detect(RenderPlatform platform) {
    // Common baseline every FEBRIC target must satisfy.
    const features = {
      BackendCapabilityKind.offscreenTargets,
      BackendCapabilityKind.colourManagedOutput,
      BackendCapabilityKind.maskRasterization,
      BackendCapabilityKind.tileCaching,
      BackendCapabilityKind.multithreadedRecording,
    };
    return switch (platform) {
      RenderPlatform.android => const BackendCapabilities(
        features: features,
        determinism: RenderDeterminismLevel.backendExact,
      ),
      RenderPlatform.ios => const BackendCapabilities(
        features: features,
        determinism: RenderDeterminismLevel.backendExact,
      ),
      RenderPlatform.windows => const BackendCapabilities(
        features: features,
        determinism: RenderDeterminismLevel.backendExact,
      ),
    };
  }
}
