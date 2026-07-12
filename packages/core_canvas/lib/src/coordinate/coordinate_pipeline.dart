/// The frozen coordinate & transform pipeline of the Canvas Runtime
/// (M5A, ADR-0018).
///
/// The canvas defines the *named ordering* of coordinate spaces and transform
/// stages; the transforms themselves are already frozen in `core_geometry`
/// (`Transform2D`) and `core_interaction` (`ViewportState.canvasToScreen` /
/// `screenToCanvas`). This file adds only the pipeline *contract*, never a new
/// transform implementation.
library;

/// The ordered coordinate spaces every on-canvas point passes through.
///
/// `document → world → viewport → screen`. No object may bypass this
/// pipeline. Wire names are frozen and pinned by the freeze test.
enum CoordinateSpace {
  /// Physical-unit space of the document/artboard (fabric dimensions).
  document('document', 'Document Space'),

  /// Shared scene space after document placement (composition space).
  world('world', 'World Space'),

  /// Camera space after the viewport transform (zoom/pan/rotation).
  viewport('viewport', 'Viewport Space'),

  /// Device pixels on the output surface.
  screen('screen', 'Screen Space');

  const CoordinateSpace(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static CoordinateSpace fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown CoordinateSpace wire name',
      ),
    );
  }
}

/// The ordered transform stages composing a point from local to screen.
///
/// `local → parent → world → viewport → screen`. Immutable ordering; pinned
/// by the freeze test.
enum TransformStage {
  local('local', 'Local'),
  parent('parent', 'Parent'),
  world('world', 'World'),
  viewport('viewport', 'Viewport'),
  screen('screen', 'Screen');

  const TransformStage(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static TransformStage fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown TransformStage wire name',
      ),
    );
  }
}

/// The frozen ordering rules of the coordinate/transform pipeline. Pure,
/// const, dependency-free.
final class CoordinatePipeline {
  const CoordinatePipeline._();

  /// Coordinate spaces in forward (document → screen) order.
  static const List<CoordinateSpace> spaceOrder = <CoordinateSpace>[
    CoordinateSpace.document,
    CoordinateSpace.world,
    CoordinateSpace.viewport,
    CoordinateSpace.screen,
  ];

  /// Transform stages in forward (local → screen) order.
  static const List<TransformStage> transformOrder = <TransformStage>[
    TransformStage.local,
    TransformStage.parent,
    TransformStage.world,
    TransformStage.viewport,
    TransformStage.screen,
  ];

  /// The next space toward screen, or null if [space] is already screen.
  static CoordinateSpace? forward(CoordinateSpace space) {
    final i = spaceOrder.indexOf(space);
    return i >= 0 && i < spaceOrder.length - 1 ? spaceOrder[i + 1] : null;
  }

  /// The previous space toward document, or null if [space] is document.
  static CoordinateSpace? backward(CoordinateSpace space) {
    final i = spaceOrder.indexOf(space);
    return i > 0 ? spaceOrder[i - 1] : null;
  }
}
