import 'package:core_interaction/core_interaction.dart';
import 'package:core_layer/core_layer.dart';
import 'package:core_textile/core_textile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'artboard.freezed.dart';
part 'artboard.g.dart';

/// One artboard: a physical design surface with its own size, units, DPI,
/// background, camera, layer tree and design tree (ADR-0014). Documents
/// own any number of artboards.
@freezed
abstract class Artboard with _$Artboard {
  const factory Artboard({
    /// Stable UUID.
    required String id,

    required String name,

    /// Canvas size in canvas units.
    required Size2D size,

    @JsonKey(fromJson: _unitFromJson, toJson: _unitToJson)
    @Default(MeasurementUnit.millimetre)
    MeasurementUnit unit,

    @Default(300.0) double dpi,

    /// Background colour (#RRGGBB); null = transparent.
    String? backgroundColourHex,

    /// Compositing structure (frozen Layer Engine, ADR-0006).
    required LayerModel layerRoot,

    /// Semantic textile structure (frozen Design Tree vocabulary,
    /// ADR-0002). The Design Tree *Engine* arrives in M3; the document
    /// owns the root now.
    required DesignNode designTreeRoot,

    /// Last camera for this artboard, if any.
    ViewportState? viewport,
  }) = _Artboard;

  factory Artboard.fromJson(Map<String, Object?> json) =>
      _$ArtboardFromJson(json);
}

MeasurementUnit _unitFromJson(String wireName) =>
    MeasurementUnit.fromWireName(wireName);

String _unitToJson(MeasurementUnit unit) => unit.wireName;
