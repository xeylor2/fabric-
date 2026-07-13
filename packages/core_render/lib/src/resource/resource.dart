import 'package:core_render/src/vocabulary/render_vocabulary.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'resource.freezed.dart';
part 'resource.g.dart';

/// The single-owner logical key of a render resource (Rendering Constitution
/// §C). Textures key by content [hash]; tiles key by
/// (target, coord, revision, lod) folded into [key]. The registry resolves a
/// key to an opaque [ResourceHandle]; the backend owns the device object.
@freezed
abstract class ResourceKey with _$ResourceKey {
  const factory ResourceKey({
    @JsonKey(fromJson: _kindFromJson, toJson: _kindToJson)
    required ResourceKind kind,

    /// The logical key: `sha256:…` for textures; a composite string for
    /// tiles; a stable id for device resources.
    required String key,
  }) = _ResourceKey;

  factory ResourceKey.fromJson(Map<String, Object?> json) =>
      _$ResourceKeyFromJson(json);
}

/// An opaque handle to an allocated resource. The concrete device object is
/// owned by the backend and never exposed here (no implementation leakage);
/// `handleId` is a backend-issued reference the registry ref-counts.
@freezed
abstract class ResourceHandle with _$ResourceHandle {
  const factory ResourceHandle({
    required ResourceKey resourceKey,

    /// Backend-issued opaque reference (never a device object).
    required String handleId,

    /// Reference count across render objects (content-addressed dedup).
    @Default(1) int refCount,
  }) = _ResourceHandle;

  factory ResourceHandle.fromJson(Map<String, Object?> json) =>
      _$ResourceHandleFromJson(json);
}

ResourceKind _kindFromJson(String wireName) =>
    ResourceKind.fromWireName(wireName);

String _kindToJson(ResourceKind kind) => kind.wireName;
