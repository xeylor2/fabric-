import 'dart:math' as math;

import 'package:core_geometry/core_geometry.dart';
import 'package:core_interaction/src/viewport/viewport_state.dart';
import 'package:core_interaction/src/viewport/zoom_command.dart';
import 'package:core_interaction/src/viewport/zoom_constraints.dart';

/// The universal viewport behaviour of the FEBRIC OS.
///
/// Pure functions: every operation maps a [ViewportState] to a new
/// [ViewportState]. **No tool implements its own zoom or pan** — all
/// surfaces call these (ADR-0003, mandatory inheritance).
extension ViewportOps on ViewportState {
  /// Zoom factor at which the whole artwork fits on screen (before
  /// padding). Returns the constraints' default zoom for degenerate sizes.
  double fitZoomFor(ZoomConstraints constraints) {
    if (canvasSize.isEmpty || screenSize.isEmpty) {
      return constraints.clampZoom(constraints.defaultZoom);
    }
    final fit = math.min(
      screenSize.width / canvasSize.width,
      screenSize.height / canvasSize.height,
    );
    return constraints.clampZoom(fit * (1 - constraints.fitPadding));
  }

  /// Translates the view by [delta] logical pixels.
  ViewportState panned(Point2D delta) => copyWith(offset: offset + delta);

  /// Positions the artwork center at the screen center, preserving zoom
  /// and rotation.
  ViewportState centered() {
    return copyWith(
      offset: screenCenter - canvasCenter.rotated(rotation) * zoom,
    );
  }

  /// Sets an absolute [zoom] while keeping the canvas point under
  /// [screenAnchor] fixed — the invariant behind every anchored zoom
  /// (cursor, pinch focal point, double tap).
  ViewportState zoomedTo(
    double newZoom, {
    required Point2D screenAnchor,
    ZoomConstraints constraints = ZoomConstraints.standard,
  }) {
    final clamped = constraints.clampZoom(newZoom);
    final anchorCanvas = screenToCanvas(screenAnchor);
    return copyWith(
      zoom: clamped,
      offset: screenAnchor - anchorCanvas.rotated(rotation) * clamped,
    );
  }

  /// Multiplies zoom by [factor], anchored at [screenAnchor]
  /// (defaults to screen center).
  ViewportState zoomedBy(
    double factor, {
    Point2D? screenAnchor,
    ZoomConstraints constraints = ZoomConstraints.standard,
  }) {
    return zoomedTo(
      zoom * factor,
      screenAnchor: screenAnchor ?? screenCenter,
      constraints: constraints,
    );
  }

  /// Fits the whole artwork on screen: fit zoom, centered, rotation
  /// cleared. The canonical "Fit Screen".
  ViewportState fittedToScreen({
    ZoomConstraints constraints = ZoomConstraints.standard,
  }) {
    return copyWith(rotation: 0, zoom: fitZoomFor(constraints)).centered();
  }

  /// 100%: one canvas unit per logical pixel, anchored at [screenAnchor]
  /// (defaults to screen center).
  ViewportState actualSized({
    Point2D? screenAnchor,
    ZoomConstraints constraints = ZoomConstraints.standard,
  }) {
    return zoomedTo(
      1.0,
      screenAnchor: screenAnchor ?? screenCenter,
      constraints: constraints,
    );
  }

  /// Fits [canvasRect] (a selection or object bounds) on screen, preserving
  /// rotation. Fit is computed on the rect's axis-aligned bounds.
  ViewportState zoomedToRect(
    Rect2D canvasRect, {
    ZoomConstraints constraints = ZoomConstraints.standard,
  }) {
    if (canvasRect.size.isEmpty || screenSize.isEmpty) {
      return this;
    }
    final fit = math.min(
      screenSize.width / canvasRect.width,
      screenSize.height / canvasRect.height,
    );
    final newZoom = constraints.clampZoom(fit * (1 - constraints.fitPadding));
    return copyWith(
      zoom: newZoom,
      offset: screenCenter - canvasRect.center.rotated(rotation) * newZoom,
    );
  }

  /// Rotates the view by [radians], keeping the canvas point under
  /// [screenAnchor] (defaults to screen center) fixed.
  ViewportState rotatedBy(double radians, {Point2D? screenAnchor}) {
    final anchor = screenAnchor ?? screenCenter;
    final anchorCanvas = screenToCanvas(anchor);
    final newRotation = rotation + radians;
    return copyWith(
      rotation: newRotation,
      offset: anchor - anchorCanvas.rotated(newRotation) * zoom,
    );
  }

  /// Executes a frozen [ZoomCommand]. [cursor] anchors [ZoomCommand
  /// .zoomToCursor]; [selectionBounds]/[objectBounds] feed their commands
  /// (a command whose input is absent is a defined no-op, never an error).
  ViewportState applyZoomCommand(
    ZoomCommand command, {
    ZoomConstraints constraints = ZoomConstraints.standard,
    Point2D? cursor,
    Rect2D? selectionBounds,
    Rect2D? objectBounds,
  }) {
    switch (command) {
      case ZoomCommand.defaultZoom:
        return zoomedTo(
          constraints.defaultZoom,
          screenAnchor: screenCenter,
          constraints: constraints,
        ).centered();
      case ZoomCommand.fitScreen:
        return fittedToScreen(constraints: constraints);
      case ZoomCommand.actualSize:
        return actualSized(constraints: constraints);
      case ZoomCommand.zoomToSelection:
        return selectionBounds == null
            ? this
            : zoomedToRect(selectionBounds, constraints: constraints);
      case ZoomCommand.zoomToObject:
        return objectBounds == null
            ? this
            : zoomedToRect(objectBounds, constraints: constraints);
      case ZoomCommand.zoomToCursor:
        return cursor == null
            ? this
            : zoomedBy(
                constraints.stepFactor,
                screenAnchor: cursor,
                constraints: constraints,
              );
      case ZoomCommand.zoomIn:
        return zoomedBy(constraints.stepFactor, constraints: constraints);
      case ZoomCommand.zoomOut:
        return zoomedBy(1 / constraints.stepFactor, constraints: constraints);
      case ZoomCommand.resetView:
        return fittedToScreen(constraints: constraints);
    }
  }
}
