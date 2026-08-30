import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:core_render/core_render.dart';

/// One artwork binding the document declares, handed to the canvas surface by
/// the composition root.
///
/// It carries nothing the frozen asset architecture does not already own
/// (ADR-0016): [nodeId] is the design node that *references* the artwork
/// through the frozen `NodeAssetBinding.assetIdKey`, [contentHash] is the
/// frozen `.febric` content address recorded on that node's `AssetRecord`, and
/// [bytes] are the bytes the frozen `AssetContentStore` holds at that address.
/// Resolving node → asset → hash → bytes is the composition root's job; the
/// canvas only ever receives the resolved result, so no second asset system,
/// catalogue or identity exists here.
final class CanvasArtworkSource {
  const CanvasArtworkSource({
    required this.nodeId,
    required this.contentHash,
    required this.bytes,
  });

  /// The design node that references this artwork (`DesignNode.id`) — the same
  /// id the compiled `RenderObject.source` `CanvasReference` carries.
  final String nodeId;

  /// The frozen content address of the bytes (`sha256:<hex>`).
  final String contentHash;

  /// The artwork bytes, exactly as the frozen content store returned them.
  final Uint8List bytes;

  /// The frozen render-resource key of this artwork. Textures key by content
  /// hash — the Rendering Constitution §C rule, not a new key scheme.
  ResourceKey get resourceKey =>
      ResourceKey(kind: ResourceKind.texture, key: contentHash);
}

/// Artwork whose bytes decoded into a real image the driver can draw.
final class ResolvedCanvasArtwork {
  const ResolvedCanvasArtwork({required this.resourceKey, required this.image});

  /// The frozen logical key this image is registered under.
  final ResourceKey resourceKey;

  /// The decoded artwork. The backend owns no device object; this handle is
  /// held by the surface that decoded it and released with it.
  final ui.Image image;
}

/// Decodes [sources] into drawable artwork, keyed by the referencing design
/// node id (the same key `RenderObject.source.refId` carries).
///
/// A payload the platform image decoder cannot read — a vector artwork, a
/// truncated upload — is skipped rather than thrown: the node then renders from
/// its own frozen classification, and no upload can break a frame. Decoding
/// reads bytes and produces images; it touches no document and emits no
/// command.
Future<Map<String, ResolvedCanvasArtwork>> resolveCanvasArtwork(
  Iterable<CanvasArtworkSource> sources,
) async {
  final resolved = <String, ResolvedCanvasArtwork>{};
  for (final source in sources) {
    final image = await _decode(source.bytes);
    if (image == null) {
      continue;
    }
    resolved[source.nodeId] = ResolvedCanvasArtwork(
      resourceKey: source.resourceKey,
      image: image,
    );
  }
  return resolved;
}

Future<ui.Image?> _decode(Uint8List bytes) async {
  if (bytes.isEmpty) {
    return null;
  }
  try {
    final buffer = await ui.ImmutableBuffer.fromUint8List(bytes);
    final descriptor = await ui.ImageDescriptor.encoded(buffer);
    final codec = await descriptor.instantiateCodec();
    final frame = await codec.getNextFrame();
    codec.dispose();
    descriptor.dispose();
    return frame.image;
  } on Object {
    // Not a raster payload this platform decodes (vector artwork, corrupt
    // bytes). The node still renders — from its classification, not artwork.
    return null;
  }
}
