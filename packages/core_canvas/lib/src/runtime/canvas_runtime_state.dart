import 'package:core_canvas/src/overlay/overlay.dart';
import 'package:core_canvas/src/performance/canvas_performance_strategy.dart';
import 'package:core_canvas/src/print/print_regions.dart';
import 'package:core_canvas/src/reference/canvas_reference.dart';
import 'package:core_canvas/src/ruler/ruler_spec.dart';
import 'package:core_interaction/core_interaction.dart';
import 'package:core_tooling/core_tooling.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'canvas_runtime_state.freezed.dart';
part 'canvas_runtime_state.g.dart';

/// The immutable visual-runtime state of one canvas session (M5A, ADR-0018).
///
/// It **composes** frozen foundations — never redefines them:
/// - camera/viewport → `core_interaction.NavigationState` (the single shared
///   viewport lives here);
/// - coordinate system / grid / guides / snapping → `core_tooling`;
/// and adds the canvas-only state that did not exist: rulers, overlays,
/// references, print regions and the performance strategy.
///
/// It owns visual runtime state only. It holds *references* (ids) to
/// document/asset/layer data, never the data itself
/// (`CanvasConstitution.rendersReferencesOnly`).
@freezed
abstract class CanvasRuntimeState with _$CanvasRuntimeState {
  const factory CanvasRuntimeState({
    /// The camera and its bounded view history. `camera.viewport` is THE one
    /// shared viewport every tool uses.
    required NavigationState camera,

    /// Physical-unit coordinate system of the surface.
    @Default(CanvasCoordinateSystem.standard)
    CanvasCoordinateSystem coordinateSystem,

    @Default(GridSpec.standard) GridSpec grid,

    @Default(<GuideModel>[]) List<GuideModel> guides,

    @Default(RulerSpec.standard) RulerSpec ruler,

    @Default(SnappingConfig.standard) SnappingConfig snapping,

    /// Canvas-owned overlays (tools contribute; canvas paints — outside M5A).
    @Default(OverlayStack.empty) OverlayStack overlays,

    /// References the canvas visualises (ids only).
    @Default(<CanvasReference>[]) List<CanvasReference> references,

    /// Print-domain framing regions.
    @Default(PrintRegionSpec.standard) PrintRegionSpec printRegions,

    /// Performance strategy composing the frozen `core_performance` specs.
    @Default(CanvasPerformanceStrategy.standard)
    CanvasPerformanceStrategy performance,
  }) = _CanvasRuntimeState;

  factory CanvasRuntimeState.fromJson(Map<String, Object?> json) =>
      _$CanvasRuntimeStateFromJson(json);

  const CanvasRuntimeState._();

  /// The single shared viewport (delegates to [camera]; one source of truth).
  ViewportState get viewport => camera.viewport;
}
