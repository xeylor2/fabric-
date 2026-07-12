import 'package:freezed_annotation/freezed_annotation.dart';

part 'canvas_reference.freezed.dart';
part 'canvas_reference.g.dart';

/// What kind of engine-owned resource a [CanvasReference] points at. The
/// canvas visualises the target by id and never owns its data
/// (`CanvasConstitution.rendersReferencesOnly`).
///
/// Wire names are frozen (append-only) and pinned by the freeze test.
enum CanvasReferenceKind {
  /// A semantic node in the Design Tree (`core_document`/`core_textile`),
  /// identified by its `DesignNode.id`.
  designNode('design_node', 'Design Node'),

  /// An asset in the Asset Engine (`core_asset`), identified by
  /// `FebricAsset.id`.
  asset('asset', 'Asset'),

  /// A compositing layer (`core_layer`), identified by its layer id.
  layer('layer', 'Layer');

  const CanvasReferenceKind(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static CanvasReferenceKind fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown CanvasReferenceKind wire name',
      ),
    );
  }
}

/// A reference the canvas visualises without owning its data. The canvas
/// holds only [kind] + [refId]; resolving the reference to concrete data is
/// the owning engine's responsibility, outside the canvas runtime.
@freezed
abstract class CanvasReference with _$CanvasReference {
  const factory CanvasReference({
    required CanvasReferenceKind kind,

    /// The owning engine's identifier for the referenced resource.
    required String refId,
  }) = _CanvasReference;

  factory CanvasReference.fromJson(Map<String, Object?> json) =>
      _$CanvasReferenceFromJson(json);
}
