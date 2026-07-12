import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset_registry.freezed.dart';
part 'asset_registry.g.dart';

/// Asset classes the central registry accepts (frozen, append-only).
enum AssetKind {
  image('image', 'Image'),
  motif('motif', 'Motif'),
  pattern('pattern', 'Pattern'),
  texture('texture', 'Texture'),
  referencePhoto('reference_photo', 'Reference Photo'),
  generated('generated', 'Generated'),
  imported('imported', 'Imported'),
  vector('vector', 'Vector');

  const AssetKind(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static AssetKind fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () =>
          throw ArgumentError.value(name, 'name', 'Unknown AssetKind'),
    );
  }
}

/// Where an asset came from (frozen, append-only).
enum AssetSource {
  imported('imported', 'Imported'),
  generated('generated', 'Generated'),
  library('library', 'Library'),
  capture('capture', 'Capture');

  const AssetSource(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static AssetSource fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () =>
          throw ArgumentError.value(name, 'name', 'Unknown AssetSource'),
    );
  }
}

/// One registered asset. Pixel/vector payloads live in content-addressed
/// storage outside the document JSON; the registry holds identity,
/// integrity ([hash]) and usage.
@freezed
abstract class AssetRecord with _$AssetRecord {
  const factory AssetRecord({
    /// Stable UUID.
    required String id,

    required String name,
    required AssetKind kind,
    required AssetSource source,

    /// Content hash (integrity + dedup key into the asset store).
    required String hash,

    String? mimeType,

    @Default(<String>[]) List<String> tags,

    /// Ids of layers/nodes that reference this asset.
    @Default(<String>[]) List<String> usageRefs,

    @Default(<String, Object?>{}) Map<String, Object?> metadata,
  }) = _AssetRecord;

  factory AssetRecord.fromJson(Map<String, Object?> json) =>
      _$AssetRecordFromJson(json);
}

/// The central asset registry of a document.
@freezed
abstract class AssetRegistry with _$AssetRegistry {
  const factory AssetRegistry({
    @Default(<String, AssetRecord>{}) Map<String, AssetRecord> assets,
  }) = _AssetRegistry;

  factory AssetRegistry.fromJson(Map<String, Object?> json) =>
      _$AssetRegistryFromJson(json);

  const AssetRegistry._();

  static const AssetRegistry empty = AssetRegistry();

  int get count => assets.length;

  AssetRecord? byId(String id) => assets[id];

  /// Registry with [record] added/replaced.
  AssetRegistry withAsset(AssetRecord record) =>
      AssetRegistry(assets: {...assets, record.id: record});

  /// Registry with [id] removed.
  AssetRegistry withoutAsset(String id) =>
      AssetRegistry(assets: {...assets}..remove(id));
}
