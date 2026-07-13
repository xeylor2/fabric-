import 'package:core_render/src/determinism/reproducibility_record.dart';
import 'package:core_render/src/resource/resource.dart';

/// Persistence seam for the renderer's derived, disposable state (Rendering
/// Constitution §6 of the M5B spec): the disk-tier tile cache (by resource
/// key) and export reproducibility records. Rendering owns no document data;
/// this holds only content-addressed, recomputable artefacts.
///
/// This is a pure contract (dependency inversion). A real in-memory
/// implementation ships in M5B-2 — never a mock. No `.febric` schema change.
abstract interface class RenderCacheRepository {
  /// Records a reproducibility provenance entry for a completed export.
  Future<void> putReproducibility(ReproducibilityRecord record);

  /// Reads a reproducibility record by revision id, or null if absent.
  Future<ReproducibilityRecord?> reproducibilityForRevision(int revision);

  /// Records that a resource is cached at the disk tier (by logical key).
  Future<void> putCachedResource(ResourceKey key);

  /// Whether a resource is present in the disk-tier cache.
  Future<bool> hasCachedResource(ResourceKey key);

  /// Removes a cached resource entry (eviction / invalidation).
  Future<void> evictCachedResource(ResourceKey key);
}
