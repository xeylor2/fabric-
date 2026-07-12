import 'dart:typed_data';

import 'package:crypto/crypto.dart' as crypto;

/// Content hashing seam of the Asset Engine (dependency inversion):
/// engines never hash inline, so the algorithm is swappable and tests are
/// deterministic.
abstract interface class ContentHasher {
  /// The content address of [bytes] (`<algorithm>:<hex>`).
  String hashOf(Uint8List bytes);
}

/// Production hasher: SHA-256, the `.febric` content-address algorithm
/// (`sha256:<hex>`).
final class Sha256ContentHasher implements ContentHasher {
  const Sha256ContentHasher();

  @override
  String hashOf(Uint8List bytes) => 'sha256:${crypto.sha256.convert(bytes)}';
}
