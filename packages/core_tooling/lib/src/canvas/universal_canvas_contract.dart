import 'package:core_interaction/core_interaction.dart';
import 'package:core_lock/core_lock.dart';
import 'package:core_tooling/src/canvas/canvas_models.dart';
import 'package:core_tooling/src/tool/tool_models.dart';

/// THE Universal Canvas Contract of the FEBRIC OS (ADR-0012).
///
/// Every editing surface — the Canvas Editor, every tool preview surface,
/// the Design Tree preview — implements this contract. It composes the
/// frozen foundations rather than redefining them:
///
/// - viewport / camera / zoom / pan / rotation → `core_interaction`
///   (ViewportState, NavigationState, ViewportInteractionMapper);
/// - selection → `core_interaction.SelectionState` (+ region selection);
/// - locks → `core_lock`; history/undo/redo → the document timeline (M2);
/// - coordinate system, snapping, guides, grid, transform, measurement →
///   the models in `canvas_models.dart` and `core_geometry.Transform2D`.
///
/// A surface exposes state via getters and accepts *events and commands*;
/// direct state mutation is impossible by construction (invariant I1).
abstract interface class UniversalCanvasContract {
  // ------------------------------------------------------------- viewport
  ViewportState get viewport;

  /// Camera history (previous views navigation).
  NavigationState get camera;

  /// Physical-unit coordinate system of this surface.
  CanvasCoordinateSystem get coordinateSystem;

  /// Routes an interaction event through the universal mapper
  /// (zoom / pan / rotation — ADR-0004/0012: never reimplemented).
  void handleInteraction(InteractionEvent event);

  /// Executes a frozen zoom command.
  void applyZoomCommand(ZoomCommand command);

  // ------------------------------------------------------------ selection
  SelectionState get selection;

  // ---------------------------------------------------------------- locks
  LockSet get locks;

  // -------------------------------------------------------------- history
  ToolHistory get history;

  bool get canUndo;
  bool get canRedo;
  void undo();
  void redo();

  // ------------------------------------------------- snapping/guides/grid
  SnappingConfig get snapping;
  List<GuideModel> get guides;
  GridSpec get grid;

  // ----------------------------------------------- transform & measurement
  /// Active canvas transform of the edited content (selection transform).
  Transform2D get activeTransform;

  /// Measures between two canvas points in the surface's units.
  Measurement measure(Point2D from, Point2D to);
}
