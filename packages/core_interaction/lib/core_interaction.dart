/// FEBRIC Universal Workspace Interaction Foundation.
///
/// Viewport, camera, gesture and selection contracts shared by **every**
/// editing surface of the FEBRIC OS — Canvas, Repeat Pattern, all AI tools,
/// Design Tree preview. No tool implements its own zoom, pan or gesture
/// logic (ADR-0003).
///
/// Pure Dart: no rendering, no widgets, no Flutter UI.
library;

export 'package:core_geometry/core_geometry.dart';

export 'src/camera/inertia.dart';
export 'src/camera/viewport_animation.dart';
export 'src/gestures/gesture_kind.dart';
export 'src/gestures/gesture_phase.dart';
export 'src/gestures/input_device.dart';
export 'src/gestures/interaction_event.dart';
export 'src/gestures/interaction_shortcut.dart';
export 'src/gestures/key_modifiers.dart';
export 'src/navigation/navigation_state.dart';
export 'src/policy/interaction_config.dart';
export 'src/policy/viewport_interaction_mapper.dart';
export 'src/selection/selection_state.dart';
export 'src/viewport/viewport_ops.dart';
export 'src/viewport/viewport_state.dart';
export 'src/viewport/zoom_command.dart';
export 'src/viewport/zoom_constraints.dart';
