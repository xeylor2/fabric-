import 'package:core_interaction/core_interaction.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cursor_runtime.freezed.dart';
part 'cursor_runtime.g.dart';

/// The visual cursor shape the interaction runtime requests for the surface
/// (M6). This is a platform-neutral *intent* — the shell maps it to a real
/// OS cursor later. It is not an overlay (overlays are owned by the canvas
/// runtime, `OverlayKind`); it is the pointer shape itself. Wire names are
/// frozen (append-only) and pinned by the freeze test.
enum CursorKind {
  /// The default arrow — idle over empty canvas.
  arrow('arrow', 'Arrow'),

  /// Over a hittable semantic node (selectable content).
  pointer('pointer', 'Pointer'),

  /// A pan/hand grab is available or active (space-drag, two-finger pan).
  grab('grab', 'Grab'),

  /// A pan is in progress (pointer held while panning).
  grabbing('grabbing', 'Grabbing'),

  /// A zoom interaction is active (marquee zoom, zoom tool).
  zoom('zoom', 'Zoom'),

  /// Input is temporarily blocked (busy).
  busy('busy', 'Busy');

  const CursorKind(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static CursorKind fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown CursorKind wire name',
      ),
    );
  }
}

/// The immutable cursor state of the surface (M6): the requested [kind] and
/// the last known pointer position in screen space.
@freezed
abstract class CursorState with _$CursorState {
  const factory CursorState({
    @JsonKey(fromJson: _kindFromJson, toJson: _kindToJson)
    @Default(CursorKind.arrow)
    CursorKind kind,

    /// Last pointer position in screen space (device-independent logical
    /// pixels), or null before the first pointer event.
    Point2D? screenPosition,
  }) = _CursorState;

  factory CursorState.fromJson(Map<String, Object?> json) =>
      _$CursorStateFromJson(json);

  const CursorState._();

  /// The initial cursor state (arrow, no known position).
  static const CursorState initial = CursorState();
}

/// The **Cursor Runtime** (M6): a pure, deterministic resolver that maps an
/// interaction situation to a [CursorState]. It holds no rendering and no
/// platform cursor — only the platform-neutral intent. Pure functions;
/// identical inputs yield an identical cursor.
final class CursorRuntime {
  const CursorRuntime();

  /// The cursor over [screenPosition] given whether content is under the
  /// pointer ([overNode]) and whether a pan is active ([panning]).
  CursorState resolve({
    required Point2D screenPosition,
    bool overNode = false,
    bool panning = false,
  }) {
    final kind = panning
        ? CursorKind.grabbing
        : overNode
        ? CursorKind.pointer
        : CursorKind.arrow;
    return CursorState(kind: kind, screenPosition: screenPosition);
  }
}

CursorKind _kindFromJson(String wireName) => CursorKind.fromWireName(wireName);

String _kindToJson(CursorKind kind) => kind.wireName;
