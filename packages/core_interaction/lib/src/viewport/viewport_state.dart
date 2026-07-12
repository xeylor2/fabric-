import 'package:core_geometry/core_geometry.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'viewport_state.freezed.dart';
part 'viewport_state.g.dart';

/// The immutable camera of every FEBRIC editing surface.
///
/// Transform convention (the single source of truth for all surfaces):
///
/// ```
/// screen = offset + zoom · R(rotation) · canvas
/// ```
///
/// where `R` rotates counter-clockwise. [visibleRect] is *derived* from the
/// transform rather than stored, so it can never drift out of sync.
///
/// Coordinate spaces:
/// - **canvas** — artwork units (the design's own pixels/mm as defined by
///   the document layer).
/// - **screen** — logical pixels of the hosting surface.
/// - [devicePixelRatio] carries the logical→physical factor for surfaces
///   that need pixel-exact rendering decisions.
@freezed
abstract class ViewportState with _$ViewportState {
  const factory ViewportState({
    /// Size of the artwork being viewed, in canvas units.
    required Size2D canvasSize,

    /// Size of the hosting surface, in logical pixels.
    required Size2D screenSize,

    /// Scale factor: canvas units → logical pixels. 1.0 = 100%.
    @Default(1.0) double zoom,

    /// Translation applied after scale/rotation, in logical pixels.
    @Default(Point2D.zero) Point2D offset,

    /// View rotation in radians (counter-clockwise).
    @Default(0.0) double rotation,

    /// Logical → physical pixel factor of the display.
    @Default(1.0) double devicePixelRatio,
  }) = _ViewportState;

  factory ViewportState.fromJson(Map<String, Object?> json) =>
      _$ViewportStateFromJson(json);

  const ViewportState._();

  /// Center of the hosting surface in screen coordinates.
  Point2D get screenCenter => screenSize.center;

  /// Center of the artwork in canvas coordinates.
  Point2D get canvasCenter => canvasSize.center;

  /// Maps a canvas-space point to screen space.
  Point2D canvasToScreen(Point2D canvasPoint) {
    return offset + canvasPoint.rotated(rotation) * zoom;
  }

  /// Maps a screen-space point to canvas space (inverse of
  /// [canvasToScreen]).
  Point2D screenToCanvas(Point2D screenPoint) {
    return ((screenPoint - offset) / zoom).rotated(-rotation);
  }

  /// The canvas-space region currently visible on screen: the axis-aligned
  /// bounds of the inverse-transformed screen rectangle (exact when
  /// [rotation] is zero; the bounding box of the rotated view otherwise).
  Rect2D get visibleRect {
    return Rect2D.boundingPoints([
      screenToCanvas(Point2D.zero),
      screenToCanvas(Point2D(x: screenSize.width, y: 0)),
      screenToCanvas(Point2D(x: 0, y: screenSize.height)),
      screenToCanvas(Point2D(x: screenSize.width, y: screenSize.height)),
    ]);
  }
}
