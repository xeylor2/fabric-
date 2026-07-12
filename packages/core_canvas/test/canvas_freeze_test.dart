import 'package:core_canvas/core_canvas.dart';
import 'package:test/test.dart';

void main() {
  group('Canvas Constitution (frozen)', () {
    test('CanvasNeverOwns wire names are frozen — the nine forbidden', () {
      expect(CanvasNeverOwns.values.map((v) => v.wireName), [
        'document',
        'assets',
        'layers',
        'history',
        'selection',
        'patterns',
        'motifs',
        'ai',
        'plugins',
      ]);
    });

    test('fromWireName resolves and rejects unknown names', () {
      expect(CanvasNeverOwns.fromWireName('assets'), CanvasNeverOwns.assets);
      expect(() => CanvasNeverOwns.fromWireName('canvas'), throwsArgumentError);
    });

    test('constitutional principles are frozen and ordered', () {
      expect(CanvasConstitution.principles, [
        'The Canvas is not the source of truth.',
        'The Document owns data.',
        'The Semantic Tree owns semantics.',
        'The Asset Engine owns resources.',
        'The Canvas visualises references only.',
        'Tools interact through the Canvas Runtime.',
        'AI never edits the Canvas directly.',
        'Nothing bypasses the Canvas Runtime.',
      ]);
    });

    test(
      'canvas owns only visual runtime state and renders references only',
      () {
        expect(CanvasConstitution.ownsOnlyVisualRuntimeState, isTrue);
        expect(CanvasConstitution.rendersReferencesOnly, isTrue);
        expect(CanvasConstitution.singleInputPipeline, isTrue);
        expect(CanvasConstitution.singleSharedViewport, isTrue);
        expect(CanvasConstitution.aiNeverEditsCanvasDirectly, isTrue);
        for (final forbidden in CanvasNeverOwns.values) {
          expect(CanvasConstitution.forbidsOwnershipOf(forbidden), isTrue);
        }
      },
    );
  });

  group('Coordinate & transform pipeline (frozen)', () {
    test('CoordinateSpace order is document → world → viewport → screen', () {
      expect(CoordinatePipeline.spaceOrder.map((s) => s.wireName), [
        'document',
        'world',
        'viewport',
        'screen',
      ]);
    });

    test(
      'TransformStage order is local → parent → world → viewport → screen',
      () {
        expect(CoordinatePipeline.transformOrder.map((s) => s.wireName), [
          'local',
          'parent',
          'world',
          'viewport',
          'screen',
        ]);
      },
    );

    test('forward/backward traverse the pipeline and clamp at the ends', () {
      expect(
        CoordinatePipeline.forward(CoordinateSpace.document),
        CoordinateSpace.world,
      );
      expect(CoordinatePipeline.forward(CoordinateSpace.screen), isNull);
      expect(
        CoordinatePipeline.backward(CoordinateSpace.screen),
        CoordinateSpace.viewport,
      );
      expect(CoordinatePipeline.backward(CoordinateSpace.document), isNull);
    });
  });

  group('Overlay runtime (frozen vocabulary)', () {
    test('OverlayKind wire names are frozen', () {
      expect(OverlayKind.values.map((v) => v.wireName), [
        'selection',
        'hover',
        'brush_cursor',
        'polygon_preview',
        'magic_wand_preview',
        'ai_preview',
        'measurement',
        'grid',
        'snap_guide',
        'alignment_guide',
        'ruler',
        'tool_overlay',
      ]);
    });
  });

  group('Reference / hit-test / print vocabularies (frozen)', () {
    test('CanvasReferenceKind wire names are frozen', () {
      expect(CanvasReferenceKind.values.map((v) => v.wireName), [
        'design_node',
        'asset',
        'layer',
      ]);
    });

    test('HitTargetKind wire names are frozen', () {
      expect(HitTargetKind.values.map((v) => v.wireName), [
        'node',
        'guide',
        'handle',
        'empty',
      ]);
    });

    test('PrintRegionKind wire names are frozen', () {
      expect(PrintRegionKind.values.map((v) => v.wireName), [
        'safe_area',
        'bleed',
        'print_margin',
      ]);
    });
  });
}
