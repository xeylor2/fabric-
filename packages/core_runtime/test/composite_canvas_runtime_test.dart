import 'package:core_canvas/core_canvas.dart';
import 'package:core_canvas_runtime/core_canvas_runtime.dart';
import 'package:core_document/core_document.dart';
import 'package:core_interaction/core_interaction.dart';
import 'package:core_layer/core_layer.dart';
import 'package:core_layer_runtime/core_layer_runtime.dart';
import 'package:core_runtime/core_runtime.dart';
import 'package:core_selection_runtime/core_selection_runtime.dart';
import 'package:core_tooling/core_tooling.dart';
import 'package:core_transform_runtime/core_transform_runtime.dart';
import 'package:test/test.dart';

// ---------------------------------------------------------------- fixtures
ViewportState _viewport() => const ViewportState(
  canvasSize: Size2D(width: 100, height: 100),
  screenSize: Size2D(width: 100, height: 100),
);

CanvasRuntimeState _state() =>
    CanvasRuntimeState(camera: NavigationState(viewport: _viewport()));

/// Deterministic hit-tester double (the renderer implements the real one,
/// M5B). Node hit inside a fixed rect; a miss elsewhere.
final class _StubHitTester implements HitTestContract {
  @override
  HitTestResult hitTest(HitTestQuery query) {
    final p = query.screenPoint;
    if (p.x >= 0 && p.x <= 50 && p.y >= 0 && p.y <= 50) {
      return HitTestResult(
        kind: HitTargetKind.node,
        documentPoint: p,
        semanticNodeId: 'node-1',
      );
    }
    return HitTestResult.miss(p);
  }

  @override
  List<String> hitTestRegion(Rect2D region) => const ['node-1'];
}

/// Records commands forwarded to the layer sink, and returns a canned result —
/// lets us assert verbatim forwarding without a real engine.
class _SpySink {
  final List<DocumentCommand> commands = [];
  CommandResult result = const CommandResult.applied(revision: 7);

  CommandResult call(
    DocumentCommand command, {
    CommandSource source = CommandSource.user,
    String author = 'local',
    AiProvenanceRecord? provenance,
  }) {
    commands.add(command);
    return result;
  }
}

CompositeCanvasRuntime _composite({
  InteractionSession? interaction,
  SelectionRuntime? selection,
  TransformRuntime? transform,
  LayerRuntime? layer,
}) => CompositeCanvasRuntime(
  interaction:
      interaction ??
      InteractionSession(state: _state(), hitTester: _StubHitTester()),
  selection: selection ?? SelectionRuntime(),
  transform: transform ?? TransformRuntime(),
  layer: layer ?? LayerRuntime(sink: _SpySink().call),
);

void main() {
  group('V5 — implements the frozen CanvasRuntimeContract', () {
    test('is usable anywhere a CanvasRuntimeContract is expected', () {
      final CanvasRuntimeContract runtime = _composite();
      // Contract members resolve by delegation, no throw.
      expect(runtime.viewport, isA<ViewportState>());
      expect(runtime.state, isA<CanvasRuntimeState>());
      expect(runtime.coordinateSystem, isA<CanvasCoordinateSystem>());
      expect(runtime.references, isA<List<CanvasReference>>());
      expect(runtime.overlays, isA<OverlayStack>());
    });

    test('hit testing delegates to the injected session/hit-tester', () {
      final r = _composite();
      final hit = r.hitTest(
        const HitTestQuery(screenPoint: Point2D(x: 10, y: 10)),
      );
      expect(hit.semanticNodeId, 'node-1');
      expect(
        r.hitTestRegion(const Rect2D(left: 0, top: 0, width: 1, height: 1)),
        ['node-1'],
      );
    });
  });

  group('V6 — selection routing (hit → SelectionRuntime, frozen policy)', () {
    test('content tap on a node selects it through the frozen state', () {
      final r = _composite();
      r.handleInput(
        const InteractionEvent.tap(position: Point2D(x: 10, y: 10)),
      );
      expect(r.selection.selectedIds, contains('node-1'));
    });

    test('tap on empty canvas with no modifier clears the selection', () {
      final r = _composite();
      r.handleInput(
        const InteractionEvent.tap(position: Point2D(x: 10, y: 10)),
      );
      expect(r.selection.isEmpty, isFalse);
      r.handleInput(
        const InteractionEvent.tap(position: Point2D(x: 90, y: 90)),
      );
      expect(r.selection.isEmpty, isTrue);
    });

    test('camera gesture leaves the selection untouched', () {
      final r = _composite();
      r.handleInput(
        const InteractionEvent.tap(position: Point2D(x: 10, y: 10)),
      );
      final before = r.selection;
      r.handleInput(
        const InteractionEvent.pan(
          phase: GesturePhase.update,
          delta: Point2D(x: 5, y: 5),
        ),
      );
      expect(r.selection, before);
    });
  });

  group('V7 — the frozen selection stub is replaced by live state', () {
    test(
      'composite.selection is live where raw session.selection is empty',
      () {
        final session = InteractionSession(
          state: _state(),
          hitTester: _StubHitTester(),
        );
        final r = _composite(interaction: session);
        r.handleInput(
          const InteractionEvent.tap(position: Point2D(x: 10, y: 10)),
        );
        // M6 session deliberately stubs selection to empty...
        expect(session.selection.isEmpty, isTrue);
        // ...the composition routes the live selection instead.
        expect(r.selection.isEmpty, isFalse);
      },
    );
  });

  group('V8 — raw input never mutates transform or emits layer commands', () {
    test('handleInput leaves transform at identity and emits nothing', () {
      final spy = _SpySink();
      final r = _composite(layer: LayerRuntime(sink: spy.call));
      r.handleInput(
        const InteractionEvent.tap(position: Point2D(x: 10, y: 10)),
      );
      expect(r.activeTransform.isIdentity, isTrue);
      expect(spy.commands, isEmpty);
    });
  });

  group('V9 — verbatim forwarding of transform/layer results', () {
    test('setTransform / resetTransform return the M8 value verbatim', () {
      final t = TransformRuntime();
      final r = _composite(transform: t);
      const shifted = Transform2D(translation: Point2D(x: 5, y: 9));
      expect(r.setTransform(shifted), t.activeTransform);
      expect(r.activeTransform, shifted);
      expect(r.resetTransform(), Transform2D.identity);
      expect(r.activeTransform.isIdentity, isTrue);
    });

    test(
      'layer emit forwards the built command and returns result verbatim',
      () {
        final spy = _SpySink();
        final r = _composite(layer: LayerRuntime(sink: spy.call));
        const layer = LayerModel(id: 'l', name: 'L', kind: LayerKind.vector);
        final result = r.createLayer(artboardId: 'ab', layer: layer);
        expect(spy.commands.single, isA<CreateLayerCommand>());
        expect(result, spy.result);
      },
    );

    test('setActiveLayer/activeLayerId route through the M9 runtime', () {
      final r = _composite();
      r.setActiveLayer('layer-x');
      expect(r.activeLayerId, 'layer-x');
    });
  });

  group('V10 — real stack wiring to a real DocumentEngine', () {
    test('end-to-end handleInput + emit runs and returns a real result', () {
      final engine = DocumentEngine(document: _emptyDoc());
      final r = CompositeCanvasRuntime(
        interaction: InteractionSession(
          state: _state(),
          hitTester: _StubHitTester(),
        ),
        selection: SelectionRuntime(),
        transform: TransformRuntime(),
        layer: LayerRuntime(sink: engine.apply),
      );
      // input path
      r.handleInput(
        const InteractionEvent.tap(position: Point2D(x: 10, y: 10)),
      );
      expect(r.selection.selectedIds, contains('node-1'));
      // command path — non-existent artboard is rejected by the frozen reducer,
      // proving the composition forwards without reducing itself.
      const layer = LayerModel(id: 'l', name: 'L', kind: LayerKind.vector);
      final result = r.createLayer(artboardId: 'nope', layer: layer);
      expect(result, isA<CommandRejected>());
    });
  });

  // Every remaining public member of CompositeCanvasRuntime delegates to the
  // wrapped runtime. These assert the delegation happens (state observed or
  // command forwarded), completing public-API coverage without adding logic.
  group('Delegation coverage — remaining contract surface', () {
    test('applyZoomCommand drives the wrapped session viewport', () {
      final session = InteractionSession(
        state: _state(),
        hitTester: _StubHitTester(),
      );
      final r = _composite(interaction: session);
      r.applyZoomCommand(ZoomCommand.zoomIn);
      // Delegates to the same session: the composition and session agree.
      expect(r.viewport, session.viewport);
      expect(r.viewport.zoom, greaterThan(1.0));
    });

    test('contribute / withdraw route overlays through the session', () {
      final r = _composite();
      const overlay = OverlayModel(id: 'ov-1', kind: OverlayKind.selection);
      r.contribute(overlay);
      expect(r.overlays.entries.map((e) => e.id), contains('ov-1'));
      r.withdraw('ov-1');
      expect(r.overlays.entries.map((e) => e.id), isNot(contains('ov-1')));
    });
  });

  group('Delegation coverage — layer traversal & remaining emits', () {
    const tree = LayerModel(
      id: 'root',
      name: 'Root',
      kind: LayerKind.group,
      children: [
        LayerModel(id: 'child', name: 'Child', kind: LayerKind.vector),
      ],
    );

    test('findLayerById delegates to the M9 traversal', () {
      final r = _composite();
      expect(r.findLayerById(tree, 'child')?.id, 'child');
      expect(r.findLayerById(tree, 'missing'), isNull);
    });

    test('activeLayer resolves the active id within the tree', () {
      final r = _composite();
      r.setActiveLayer('child');
      expect(r.activeLayer(tree)?.id, 'child');
    });

    test('deleteLayer forwards a frozen DeleteLayerCommand verbatim', () {
      final spy = _SpySink();
      final r = _composite(layer: LayerRuntime(sink: spy.call));
      final result = r.deleteLayer(artboardId: 'ab', layerId: 'l');
      expect(spy.commands.single, isA<DeleteLayerCommand>());
      expect(result, spy.result);
    });

    test('moveLayer forwards a frozen MoveLayerCommand verbatim', () {
      final spy = _SpySink();
      final r = _composite(layer: LayerRuntime(sink: spy.call));
      final result = r.moveLayer(
        artboardId: 'ab',
        layerId: 'l',
        newParentId: 'p',
        index: 0,
      );
      expect(spy.commands.single, isA<MoveLayerCommand>());
      expect(result, spy.result);
    });

    test('renameLayer forwards a frozen RenameLayerCommand verbatim', () {
      final spy = _SpySink();
      final r = _composite(layer: LayerRuntime(sink: spy.call));
      final result = r.renameLayer(artboardId: 'ab', layerId: 'l', name: 'New');
      expect(spy.commands.single, isA<RenameLayerCommand>());
      expect(result, spy.result);
    });

    test('setLayerMetadata forwards a frozen SetLayerMetadataCommand', () {
      final spy = _SpySink();
      final r = _composite(layer: LayerRuntime(sink: spy.call));
      final result = r.setLayerMetadata(
        artboardId: 'ab',
        layerId: 'l',
        key: 'k',
        value: 'v',
      );
      expect(spy.commands.single, isA<SetLayerMetadataCommand>());
      expect(result, spy.result);
    });
  });
}

FebricDocument _emptyDoc() => FebricDocument(
  id: const DocumentId('doc-1'),
  projectId: const ProjectId('project-1'),
  manifest: const DocumentManifest(
    version: DocumentVersion(
      schema: DocumentVersion.currentSchema,
      generator: 'febric-test',
    ),
  ),
  metadata: DocumentMetadata(
    title: 'T',
    author: 'a',
    createdAt: DateTime.utc(2026, 7, 7),
    modifiedAt: DateTime.utc(2026, 7, 7),
  ),
);
