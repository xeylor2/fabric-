import 'package:core_geometry/core_geometry.dart';

/// The **Transform Runtime** (Scope A): the stateful wiring that holds the
/// active [Transform2D] for the runtime chain.
///
/// Scope A behaviour — unchanged:
/// - holds the live, active [Transform2D] (the frozen similarity transform of
///   the Universal Canvas Contract, `core_geometry` / ADR-0012);
/// - accepts an already-created [Transform2D] value from a caller and makes it
///   the active transform (`setTransform`);
/// - resets the active transform to the frozen [Transform2D.identity];
/// - exposes the active transform to downstream runtimes (toward
///   `UniversalCanvasContract.activeTransform`).
///
/// **B-2, authorized for canvas motif movement only** — this runtime is the
/// host of the EPHEMERAL in-flight transform of one canvas move
/// ([beginMove] / [moveBy] / [endMove] / [cancelMove]). Within that narrow
/// scope it composes an anchor transform with a document-space gesture delta.
/// It still interprets no gesture (the surface supplies an already-converted
/// document-space delta through the frozen coordinate pipeline), defines no
/// transform algebra, adds no geometry type and introduces no new transform
/// representation: the composition is a translation carried by the frozen
/// `Transform2D.copyWith` and the frozen `Point2D +`, and rotation/scale pass
/// through untouched — resize, rotate, scale and flip remain out of scope.
///
/// The in-flight transform is **never document state**. Persisting a settled
/// move is the caller's separate act through the frozen
/// `DocumentCommand.setNodeMetadata`; this runtime holds no sink and reaches no
/// document. State changes only by feeding a value or a delta in (invariant I1).
final class TransformRuntime {
  /// Creates a runtime seeded with an optional starting [transform]
  /// (the frozen [Transform2D.identity] by default).
  TransformRuntime({Transform2D transform = Transform2D.identity})
    : _transform = transform; // ignore: prefer_initializing_formals

  Transform2D _transform;

  /// The transform an in-flight move is anchored on — the move target's own
  /// persisted transform. Null when no move is in flight.
  Transform2D? _anchor;

  /// The active transform, for downstream runtimes to read (wires toward
  /// `UniversalCanvasContract.activeTransform`).
  Transform2D get activeTransform => _transform;

  /// Whether the active transform is the frozen identity (delegates to the
  /// frozen `Transform2D.isIdentity`).
  bool get isIdentity => _transform.isIdentity;

  /// Whether a move is currently in flight.
  bool get isMoving => _anchor != null;

  /// Makes [transform] the active transform. The value must already be built
  /// by the caller — the runtime performs no mapping here. Returns the new
  /// active transform.
  Transform2D setTransform(Transform2D transform) {
    _transform = transform;
    return _transform;
  }

  /// Resets the active transform to the frozen [Transform2D.identity].
  /// Returns the new active transform.
  Transform2D reset() {
    _transform = Transform2D.identity;
    return _transform;
  }

  // -------------------------------------------- in-flight move (B-2 scope)

  /// Begins an in-flight move anchored on [base] — the move target's own
  /// persisted transform. The active transform starts equal to [base], so a
  /// move that never receives a delta is visually a no-op.
  Transform2D beginMove(Transform2D base) {
    _anchor = base;
    return setTransform(base);
  }

  /// Composes the anchor with [documentDelta] — the gesture's **total**
  /// displacement in document space — and makes the result active.
  ///
  /// Translation only: the anchor's rotation and scale are carried through
  /// unchanged. Composing from the anchor (never from the previous in-flight
  /// value) makes the result a pure function of `(base, totalDelta)`: no
  /// accumulation, no drift, and identical gestures yield identical transforms.
  /// With no move in flight this is a no-op returning the active transform.
  Transform2D moveBy(Point2D documentDelta) {
    final anchor = _anchor;
    if (anchor == null) {
      return _transform;
    }
    return setTransform(
      anchor.copyWith(translation: anchor.translation + documentDelta),
    );
  }

  /// Settles the in-flight move: returns the composed final transform for the
  /// caller to persist, drops the anchor and clears the ephemeral transform.
  Transform2D endMove() {
    final settled = _transform;
    _anchor = null;
    reset();
    return settled;
  }

  /// Abandons the in-flight move: drops the anchor and clears the ephemeral
  /// transform. Nothing was ever written, so nothing is rolled back.
  Transform2D cancelMove() {
    _anchor = null;
    return reset();
  }
}
