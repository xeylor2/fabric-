import 'package:core_render/src/contracts/render_contracts.dart';
import 'package:core_render/src/resource/resource.dart';

/// The headless Resource Registry (M5B-2), implementing the frozen
/// `ResourceRegistry`. Owns logical resource keys and ref-counts only — the
/// backend owns device objects (§C). Content-addressed dedup: the same key
/// resolves to the same handle, ref-count incremented. Handle ids are derived
/// deterministically from the key (no clock, no random — §F).
final class ResourceRegistryImpl implements ResourceRegistry {
  final Map<String, ResourceHandle> _handles = {};

  @override
  ResourceHandle acquire(ResourceKey key) {
    final existing = _handles[key.key];
    if (existing != null) {
      final next = existing.copyWith(refCount: existing.refCount + 1);
      _handles[key.key] = next;
      return next;
    }
    final handle = ResourceHandle(
      resourceKey: key,
      handleId: 'h:${key.key}', // deterministic, content-addressed
      refCount: 1,
    );
    _handles[key.key] = handle;
    return handle;
  }

  @override
  void release(ResourceKey key) {
    final existing = _handles[key.key];
    if (existing == null) {
      return;
    }
    if (existing.refCount <= 1) {
      _handles.remove(key.key);
    } else {
      _handles[key.key] = existing.copyWith(refCount: existing.refCount - 1);
    }
  }

  @override
  int refCountOf(ResourceKey key) => _handles[key.key]?.refCount ?? 0;

  /// The number of distinct resident resources (for metrics).
  int get residentCount => _handles.length;
}
