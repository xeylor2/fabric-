import 'package:core_asset/core_asset.dart';
import 'package:core_document/core_document.dart';
import 'package:core_render/src/target/render_target.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reproducibility_record.freezed.dart';
part 'reproducibility_record.g.dart';

/// Provenance that makes a Production Export re-renderable (Rendering
/// Constitution §F). Records the exact inputs so the same frame can be
/// reproduced later — mirroring invariant I5. Data only.
@freezed
abstract class ReproducibilityRecord with _$ReproducibilityRecord {
  const factory ReproducibilityRecord({
    /// The document revision rendered (immutable, hash-pinnable).
    required RevisionId revision,

    /// The target rendered.
    required RenderTarget target,

    /// The backend identity that produced the frame.
    required String backendId,

    /// The backend's declared determinism level (wire name).
    required String determinismLevel,

    /// Output colour space (frozen `core_asset`).
    @JsonKey(fromJson: _colourFromJson, toJson: _colourToJson)
    @Default(AssetColourSpace.cmyk)
    AssetColourSpace colourSpace,
  }) = _ReproducibilityRecord;

  factory ReproducibilityRecord.fromJson(Map<String, Object?> json) =>
      _$ReproducibilityRecordFromJson(json);
}

AssetColourSpace _colourFromJson(String wireName) =>
    AssetColourSpace.fromWireName(wireName);

String _colourToJson(AssetColourSpace space) => space.wireName;
