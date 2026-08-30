import 'dart:io';
import 'dart:typed_data';

import 'package:core_asset/core_asset.dart';
import 'package:core_document/core_document.dart';
import 'package:core_textile/core_textile.dart';

/// Textile artwork **content** for the artwork upload & replacement stages,
/// declared at the composition root — the same tier that already holds
/// `seedDocument()` and the launch garment schemas.
///
/// Nothing about the asset system is invented here; every piece is a frozen
/// seam used for its documented purpose:
///
/// - bytes are addressed by the frozen [Sha256ContentHasher] — `sha256:<hex>`,
///   "the `.febric` content-address algorithm";
/// - bytes live in the frozen [AssetContentStore] and nowhere else (ADR-0016
///   rule 2: "nothing owns bitmap data directly … bytes live once in the
///   content-addressed store; everything else holds hashes");
/// - document-tier identity is the frozen [AssetRecord] inside the document's
///   own [AssetRegistry], written by the frozen `DocumentCommand.importAsset`;
/// - the content↔asset binding is the frozen [NodeAssetBinding.assetIdKey] node
///   metadata key, written by the frozen `DocumentCommand.setNodeMetadata`
///   (ADR-0016 rule 4 — "no new commands, no schema change");
/// - which asset the artwork *is* follows the node's own frozen `object_type`
///   classification through the frozen [DocumentAssetBinding] mapping — the
///   coarse document vocabulary is derived, never hardcoded.
///
/// No `AssetEngine` and no `AssetCatalogue` is instantiated. ADR-0016 rule 1
/// is that identity is single (`FebricAsset.id` == `AssetRecord.id`), so the
/// document's registry is THE document-tier asset authority; a second
/// catalogue would be a second authority.

/// One artwork payload the user uploaded: its display name, its mime type and
/// the bytes themselves. Bytes never enter the document — they are hashed into
/// the frozen content store and the document carries identity + hash.
final class TextileArtwork {
  const TextileArtwork({
    required this.name,
    required this.mimeType,
    required this.bytes,
  });

  final String name;
  final String mimeType;
  final Uint8List bytes;
}

/// The frozen Asset Engine type an uploaded artwork takes when it is applied to
/// a content node of textile class [type], or null when that class is not one
/// the product creates as artwork-bearing content.
///
/// Only the two classes the product actually seeds and offers exist here
/// (`garment_content.dart` creates exactly these): the substrate cloth and the
/// printed motif. No new category is introduced — both values are frozen
/// [AssetType] members of the Asset Engine's own vocabulary.
AssetType? artworkAssetTypeFor(TextileObjectType type) => switch (type) {
  TextileObjectType.fabric => AssetType.fabric,
  TextileObjectType.motif => AssetType.motif,
  _ => null,
};

/// Artwork mime types a textile content node accepts, keyed by file extension.
const Map<String, String> artworkMimeTypes = {
  '.png': 'image/png',
  '.jpg': 'image/jpeg',
  '.jpeg': 'image/jpeg',
  '.webp': 'image/webp',
  '.tif': 'image/tiff',
  '.tiff': 'image/tiff',
  '.svg': 'image/svg+xml',
};

/// The artwork mime type of [path] by extension, or null when [path] does not
/// name textile artwork at all.
String? artworkMimeTypeOf(String path) {
  final dot = path.lastIndexOf('.');
  if (dot < 0) {
    return null;
  }
  return artworkMimeTypes[path.substring(dot).toLowerCase()];
}

/// Whether [artwork] is a payload a content node can carry: real bytes under a
/// known artwork mime type. Both entry points check this, so no caller can
/// register an empty or non-artwork payload.
bool isArtworkPayload(TextileArtwork artwork) =>
    artwork.bytes.isNotEmpty &&
    artworkMimeTypes.containsValue(artwork.mimeType);

/// Reads the artwork file at [path], or returns null when it is not artwork,
/// does not exist, holds no bytes, or cannot be read.
///
/// Every null is a caller-side refusal that reaches no command and therefore
/// touches no document: the upload is rejected before the frozen pipeline is
/// ever entered. The filesystem work is guarded because `existsSync` proves
/// only that the path is a file — a file held open by another process, or
/// deleted between the check and the read, still fails, and an upload must
/// refuse rather than throw out of the intent callback.
TextileArtwork? readArtworkFile(String path) {
  final source = path.trim();
  final mimeType = artworkMimeTypeOf(source);
  if (mimeType == null) {
    return null;
  }
  final Uint8List bytes;
  try {
    final file = File(source);
    if (!file.existsSync()) {
      return null;
    }
    bytes = file.readAsBytesSync();
  } on FileSystemException {
    return null;
  }
  if (bytes.isEmpty) {
    return null;
  }
  return TextileArtwork(
    name: _fileName(source),
    mimeType: mimeType,
    bytes: bytes,
  );
}

String _fileName(String path) {
  final separator = path.lastIndexOf(RegExp(r'[\\/]'));
  return separator < 0 ? path : path.substring(separator + 1);
}

/// The frozen `.febric` content address of [artwork] (`sha256:<hex>`).
///
/// Pure: hashing decides the asset's identity and its dedup key without
/// touching the store or the document, so it can run before any command is
/// emitted and a refusal leaves nothing behind.
String artworkContentHash(TextileArtwork artwork) =>
    const Sha256ContentHasher().hashOf(artwork.bytes);

/// The frozen document-manifest record for uploaded [artwork] under [id],
/// content-addressed by [hash] and typed by [assetType] — the frozen
/// [AssetType] the target node's own `object_type` classification resolves to.
///
/// `kind`/`source` are the document registry's own frozen coarse vocabularies
/// and are **derived**, never hardcoded: the frozen [DocumentAssetBinding]
/// mapping supplies both wire names (a motif lands as `motif`, a fabric as
/// `texture`, an import as `imported`). The Asset Engine's precise vocabularies
/// travel losslessly in the record's open metadata under that binding's own
/// frozen keys, so the record reconciles with the Asset Engine without a second
/// identity — and two different classes of artwork with byte-identical content
/// stay distinguishable.
AssetRecord textileArtworkRecord({
  required String id,
  required TextileArtwork artwork,
  required String hash,
  required AssetType assetType,
}) => AssetRecord(
  id: id,
  name: artwork.name,
  kind: AssetKind.fromWireName(
    DocumentAssetBinding.documentKindWireName(assetType),
  ),
  source: AssetSource.fromWireName(
    DocumentAssetBinding.documentSourceWireName(AssetOrigin.imported),
  ),
  hash: hash,
  mimeType: artwork.mimeType,
  metadata: {
    DocumentAssetBinding.assetTypeMetadataKey: assetType.wireName,
    DocumentAssetBinding.assetOriginMetadataKey: AssetOrigin.imported.wireName,
  },
);
