import 'dart:async';

import 'package:core_interaction/core_interaction.dart';
import 'package:feature_canvas_editor/feature_canvas_editor.dart';
import 'package:febric/di/design_tree_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Composition-root adapter (M5/M5A + M6–M11 selection wiring, plus the
/// B-2/NDH-2 individual motif free move): binds the [DesignTreeSession] to the
/// Canvas visual surface.
///
/// It hands over the read-only things the surface projects: the `RenderGraph`
/// the frozen `GraphCompiler` produced from the real document, the artwork those
/// nodes reference — resolved node → asset record → content address → bytes
/// through the frozen ADR-0016 chain, with the frozen `AssetContentStore` as
/// the only place bytes ever live — the session's own one
/// `CompositeCanvasRuntime`, which is the frozen `CanvasRuntimeContract` and
/// therefore the one selection owner, and a reader for the session's live
/// EPHEMERAL in-flight transform. In return it forwards the surface's
/// move-gesture reports, one frozen `GesturePhase` at a time.
///
/// It constructs no `DocumentCommand`, holds no document state, owns no
/// selection, writes no transform and decides nothing about what may move.
/// Canvas selection and the in-flight transform are both ephemeral runtime
/// state; only a settled move reaches the document, and only through the
/// session's already-authorized emission owner.
class CanvasPanel extends ConsumerStatefulWidget {
  const CanvasPanel({super.key});

  @override
  ConsumerState<CanvasPanel> createState() => _CanvasPanelState();
}

class _CanvasPanelState extends ConsumerState<CanvasPanel> {
  /// Artwork bytes resolved out of the frozen content store for the revision in
  /// [_resolvedRevision]. Empty until a revision that declares artwork resolves.
  List<CanvasArtworkSource> _artwork = const <CanvasArtworkSource>[];

  /// The session revision [_artwork] was resolved for. Reading bytes is the one
  /// asynchronous step, so it is keyed by revision and a stale result is
  /// discarded rather than shown.
  int _resolvedRevision = -1;

  @override
  Widget build(BuildContext context) {
    final session = ref.watch(designTreeSessionProvider);
    return ValueListenableBuilder<int>(
      valueListenable: session.revision,
      builder: (context, revision, _) {
        if (revision != _resolvedRevision) {
          _resolvedRevision = revision;
          final bindings = session.canvasArtworkBindings;
          if (bindings.isEmpty) {
            _artwork = const <CanvasArtworkSource>[];
          } else {
            unawaited(_resolveArtwork(session, revision));
          }
        }
        return CanvasEditorPage(
          graph: session.canvasRenderGraph,
          artwork: _artwork,
          runtimeBuilder: session.canvasRuntime,
          movePreview: () => session.canvasMovePreview,
          onMoveGesture: (gesture) => _onMoveGesture(session, gesture),
        );
      },
    );
  }

  /// Presentation intent → the composition root, one frozen phase at a time.
  ///
  /// The panel decides nothing here: whether the grabbed node is a movable
  /// individual printed motif, what it is anchored on, and whether the settled
  /// move is persisted all belong to the session and the frozen runtimes behind
  /// it. Begin, update and cancel touch no document; only [GesturePhase.end]
  /// can, and even then the frozen engine has the last word.
  void _onMoveGesture(DesignTreeSession session, CanvasMoveGesture gesture) {
    switch (gesture.phase) {
      case GesturePhase.start:
        session.beginCanvasMove(gesture.nodeId);
      case GesturePhase.update:
        session.updateCanvasMove(gesture.documentDelta);
      case GesturePhase.end:
        session.endCanvasMove();
      case GesturePhase.cancel:
        session.cancelCanvasMove();
    }
  }

  Future<void> _resolveArtwork(DesignTreeSession session, int revision) async {
    final resolved = <CanvasArtworkSource>[];
    for (final binding in session.canvasArtworkBindings) {
      final bytes = await session.artworkStore.get(binding.contentHash);
      if (bytes == null) {
        // The reference outlives its bytes only if the store was pruned; the
        // node then renders from its own classification.
        continue;
      }
      resolved.add(
        CanvasArtworkSource(
          nodeId: binding.nodeId,
          contentHash: binding.contentHash,
          bytes: bytes,
        ),
      );
    }
    if (!mounted || revision != _resolvedRevision) {
      return;
    }
    setState(() => _artwork = resolved);
  }
}
