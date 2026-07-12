import 'dart:typed_data';

import 'package:core_asset/src/content/content_hasher.dart';

/// The content-addressed byte store of the Asset Engine (repository
/// pattern; ADR-0016). Nothing owns bitmap data directly — nodes,
/// documents and registries hold hashes; bytes live here exactly once.
///
/// Content addressing makes the store immutable and deduplicating by
/// construction: `put` of identical bytes yields the identical address;
/// existing entries are never overwritten.
abstract interface class AssetContentStore {
  /// Stores [bytes] and returns their content address (idempotent).
  Future<String> put(Uint8List bytes);

  /// The bytes at [hash], or null when absent.
  Future<Uint8List?> get(String hash);

  Future<bool> contains(String hash);

  /// Every stored address (unordered).
  Future<List<String>> hashes();

  /// Removes the bytes at [hash] (content garbage collection — callers
  /// are responsible for proving the hash is unreferenced first).
  Future<void> remove(String hash);
}

/// Real in-memory implementation (sessions, tests, previews — full
/// contract semantics, not a mock).
final class InMemoryAssetContentStore implements AssetContentStore {
  InMemoryAssetContentStore({this.hasher = const Sha256ContentHasher()});

  final ContentHasher hasher;
  final Map<String, Uint8List> _store = {};

  @override
  Future<String> put(Uint8List bytes) async {
    final hash = hasher.hashOf(bytes);
    // Content-addressed: identical bytes share one entry; existing
    // entries are never overwritten.
    _store.putIfAbsent(hash, () => Uint8List.fromList(bytes));
    return hash;
  }

  @override
  Future<Uint8List?> get(String hash) async {
    final bytes = _store[hash];
    return bytes == null ? null : Uint8List.fromList(bytes);
  }

  @override
  Future<bool> contains(String hash) async => _store.containsKey(hash);

  @override
  Future<List<String>> hashes() async => _store.keys.toList();

  @override
  Future<void> remove(String hash) async {
    _store.remove(hash);
  }
}
