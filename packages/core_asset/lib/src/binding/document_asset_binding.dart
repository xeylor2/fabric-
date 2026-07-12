import 'package:core_asset/src/model/asset_origin.dart';
import 'package:core_asset/src/model/asset_type.dart';

/// Identity reconciliation with the frozen document manifest (ADR-0016).
///
/// A `.febric` document embeds the assets it uses as `AssetRecord`
/// entries (core_document, M2 — schema frozen). The Asset Engine never
/// duplicates that identity:
///
/// - `AssetRecord.id`   == `FebricAsset.id` (the ONE uuid),
/// - `AssetRecord.hash` == the asset's content hash,
/// - the record's coarse `kind`/`source` wire names derive from the
///   engine's precise vocabularies by the total mappings below, and
/// - the precise type/origin travel losslessly inside the record's open
///   `metadata` map under the frozen keys below.
///
/// Everything here is pure wire-name arithmetic: the Asset Engine stays
/// foundation-tier (no core_document dependency); the integration test
/// suite proves compatibility against the real document vocabularies.
abstract final class DocumentAssetBinding {
  /// Frozen `AssetRecord.metadata` key carrying the precise
  /// [AssetType] wire name.
  static const String assetTypeMetadataKey = 'asset_type';

  /// Frozen `AssetRecord.metadata` key carrying the precise
  /// [AssetOrigin] wire name.
  static const String assetOriginMetadataKey = 'asset_origin';

  /// The document manifest's coarse `AssetKind` wire name for [type]
  /// (total; frozen mapping — changes require an ADR).
  static String documentKindWireName(AssetType type) {
    return switch (type) {
      AssetType.image => 'image',
      AssetType.referenceImage => 'reference_photo',
      AssetType.fabric => 'texture',
      AssetType.motif => 'motif',
      AssetType.pattern => 'pattern',
      AssetType.texture => 'texture',
      AssetType.mask => 'image',
      AssetType.brush => 'image',
      AssetType.palette => 'imported',
      AssetType.font => 'imported',
      AssetType.template => 'imported',
      AssetType.pluginAsset => 'imported',
      AssetType.aiGenerated => 'generated',
    };
  }

  /// The document manifest's coarse `AssetSource` wire name for [origin]
  /// (total; frozen mapping — changes require an ADR).
  static String documentSourceWireName(AssetOrigin origin) {
    return switch (origin) {
      AssetOrigin.imported => 'imported',
      AssetOrigin.generated => 'generated',
      AssetOrigin.library => 'library',
      AssetOrigin.capture => 'capture',
      AssetOrigin.created => 'library',
      AssetOrigin.plugin => 'imported',
    };
  }

  /// Recovers the precise [AssetType] from an embedded record: the
  /// lossless metadata key when present, else a total coarse inference
  /// from the record's `kind` wire name.
  static AssetType typeFromRecord({
    required String kindWireName,
    Map<String, Object?> metadata = const {},
  }) {
    final precise = metadata[assetTypeMetadataKey];
    if (precise is String) {
      return AssetType.fromWireName(precise);
    }
    return switch (kindWireName) {
      'image' => AssetType.image,
      'motif' => AssetType.motif,
      'pattern' => AssetType.pattern,
      'texture' => AssetType.texture,
      'reference_photo' => AssetType.referenceImage,
      'generated' => AssetType.aiGenerated,
      'imported' || 'vector' => AssetType.image,
      _ => throw ArgumentError.value(
        kindWireName,
        'kindWireName',
        'Unknown document AssetKind wire name',
      ),
    };
  }

  /// Recovers the precise [AssetOrigin] from an embedded record: the
  /// lossless metadata key when present, else the shared wire name
  /// (the document's four sources are all valid origins).
  static AssetOrigin originFromRecord({
    required String sourceWireName,
    Map<String, Object?> metadata = const {},
  }) {
    final precise = metadata[assetOriginMetadataKey];
    if (precise is String) {
      return AssetOrigin.fromWireName(precise);
    }
    return AssetOrigin.fromWireName(sourceWireName);
  }
}
