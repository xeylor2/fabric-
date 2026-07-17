import 'package:core_geometry/core_geometry.dart';

/// The **Transform Runtime** (Scope A): the stateful wiring that holds the
/// active [Transform2D] for the runtime chain.
///
/// This runtime introduces **no new transform mathematics or behavior**. It
/// is a thin stateful shell that:
/// - holds the live, active [Transform2D] (the frozen similarity transform of
///   the Universal Canvas Contract, `core_geometry` / ADR-0012);
/// - accepts an already-created [Transform2D] value from a caller and makes it
///   the active transform (`setTransform`);
/// - resets the active transform to the frozen [Transform2D.identity];
/// - exposes the active transform to downstream runtimes (toward
///   `UniversalCanvasContract.activeTransform`).
///
/// It does **not** interpret gestures, compose transforms, or perform any
/// transform arithmetic — those are explicitly out of scope. The only
/// transform vocabulary it touches is the frozen [Transform2D], reused
/// exactly and never redefined. State changes only by feeding an already-built
/// transform in (invariant I1).
final class TransformRuntime {
  /// Creates a runtime seeded with an optional starting [transform]
  /// (the frozen [Transform2D.identity] by default).
  TransformRuntime({Transform2D transform = Transform2D.identity})
    : _transform = transform; // ignore: prefer_initializing_formals

  Transform2D _transform;

  /// The active transform, for downstream runtimes to read (wires toward
  /// `UniversalCanvasContract.activeTransform`).
  Transform2D get activeTransform => _transform;

  /// Whether the active transform is the frozen identity (delegates to the
  /// frozen `Transform2D.isIdentity`).
  bool get isIdentity => _transform.isIdentity;

  /// Makes [transform] the active transform. The value must already be built
  /// by the caller — the runtime performs no mapping or composition. Returns
  /// the new active transform.
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
}
