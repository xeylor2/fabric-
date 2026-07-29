import 'package:core_common/core_common.dart';
import 'package:core_document/core_document.dart';
import 'package:core_interaction/core_interaction.dart';
import 'package:core_layer/core_layer.dart';
import 'package:core_lock/core_lock.dart';
import 'package:core_textile/core_textile.dart';
import 'package:core_tooling/core_tooling.dart';
import 'package:core_tools/core_tools.dart';
import 'package:test/test.dart';

import 'support/fixtures.dart' as fx;

/// M15 S3 verification suite — ColourShiftTool.
///
/// Drives the tool against a REAL DocumentEngine (sink/undo/redo are
/// engine tear-offs — the approved D2/D5 injection seams) and proves it
/// is the production front-end of the frozen ChangeColourCommand (D3):
/// layer-tier only, hex-only persistence under the frozen 'colour' key
/// with the operation riding the journal (the D3 refinement note), both
/// verified lock layers (tool-side LockSet, engine-side preflight), and
/// the S2-established all-or-nothing policy. Foreign-head coherence is
/// NOT asserted (D5-d#1 open); tier co-existence is NOT asserted (Q3-d
/// open).
void main() {
  group('lifecycle and identity', () {
    test('contract-order lifecycle; frozen colourShift identity; '
        'aiBacked false; context echoed verbatim', () async {
      final h = await _Harness.create();
      expect(h.tool.isInitialized, isTrue);
      expect(h.tool.isActive, isTrue);

      final meta = h.tool.metadata();
      expect(meta.tool, FebricTool.colourShift);
      expect(meta.aiBacked, isFalse);

      expect(h.tool.selection(), h.context.selection);
      expect(h.tool.viewport(), h.context.viewport);
      expect(h.tool.lock(), h.context.locks);

      await h.tool.deactivate();
      expect(h.tool.isActive, isFalse);
      await h.tool.dispose();
      expect(h.tool.isInitialized, isFalse);
    });
  });

  group('preview — D2: the ToolPreview value IS the staged proposal', () {
    test('valid request: described, minted id, bound payload — and '
        'NOTHING applies (document unchanged, engine history '
        'empty)', () async {
      final h = await _Harness.create(layerIds: ['ly-1']);
      final before = h.engine.document;

      final preview = await h.tool.preview(
        _request(['ly-1'], ColourOperation.shiftBaseColour, '#AA3322'),
      );
      expect(preview.previewId, isNotEmpty);
      expect(preview.description, contains('shift_base_colour'));
      expect(preview.description, contains('#AA3322'));
      expect(preview.payload['targets'], ['ly-1']);
      final colour = preview.payload['colour']! as Map;
      expect(colour['operation'], 'shift_base_colour');
      expect(colour['colour'], '#AA3322');

      expect(h.engine.document, before); // nothing applied
      expect(h.engine.canUndo, isFalse); // no engine history entry
      expect(h.tool.history().entries, isEmpty); // no tool entry either
    });

    test('invalid request: preview is total — describes the rejection, '
        'never throws', () async {
      final h = await _Harness.create(layerIds: ['ly-1']);
      final preview = await h.tool.preview(
        const ToolRequest(
          targetIds: ['ly-1'],
          parameters: {'operation': 'bogus', 'colour': '#000000'},
        ),
      );
      expect(preview.description, contains('rejected'));
      expect(preview.payload['rejects'], contains('bogus'));
    });
  });

  group('execute — D3 front-end of the frozen ChangeColourCommand', () {
    test('single layer: hex lands under the frozen colour key; engine '
        'undo restores absence exactly; one history entry; previewId '
        'linkage', () async {
      final h = await _Harness.create(layerIds: ['ly-1']);
      final preview = await h.tool.preview(
        _request(['ly-1'], ColourOperation.globalColourShift, '#112233'),
      );
      final result = await h.tool.execute(
        _request(['ly-1'], ColourOperation.globalColourShift, '#112233'),
      );
      expect(result.status, ToolResultStatus.success);
      expect(result.previewId, preview.previewId);

      expect(h.layer('ly-1').metadata['colour'], '#112233');
      expect(h.tool.history().entries, hasLength(1));
      expect(h.tool.history().canUndo, isTrue);

      // The frozen exact inverse: engine undo restores prior absence.
      expect(h.engine.undo(), isA<CommandApplied>());
      expect(h.layer('ly-1').metadata.containsKey('colour'), isFalse);
    });

    test('D3 refinement note: the reducer persists the HEX ONLY — the '
        'operation rides the journaled command, never metadata; '
        'undo→redo round-trips it', () async {
      final h = await _Harness.create(layerIds: ['ly-1']);
      await h.tool.execute(
        _request(['ly-1'], ColourOperation.paletteSwap, '#0F0F0F'),
      );
      final metadata = h.layer('ly-1').metadata;
      expect(metadata['colour'], '#0F0F0F');
      // No operation residue anywhere in the persisted metadata.
      expect(metadata.length, 1);
      expect(
        metadata.values.any((v) => v.toString().contains('palette_swap')),
        isFalse,
      );
      // The journaled command still functions: undo removes, redo relands.
      expect(h.engine.undo(), isA<CommandApplied>());
      expect(h.layer('ly-1').metadata.containsKey('colour'), isFalse);
      expect(h.engine.redo(), isA<CommandApplied>());
      expect(h.layer('ly-1').metadata['colour'], '#0F0F0F');
    });

    test('all four frozen ColourOperations front and land', () async {
      for (final operation in ColourOperation.values) {
        final h = await _Harness.create(layerIds: ['ly-1']);
        final result = await h.tool.execute(
          _request(['ly-1'], operation, '#123456'),
        );
        expect(
          result.status,
          ToolResultStatus.success,
          reason: operation.wireName,
        );
        expect(h.layer('ly-1').metadata['colour'], '#123456');
      }
    });

    test('multi-layer: N layers → N commands → N entries, stepwise '
        'engine undo peels only the last layer', () async {
      final h = await _Harness.create(layerIds: ['ly-1', 'ly-2', 'ly-3']);
      final result = await h.tool.execute(
        _request(
          ['ly-1', 'ly-2', 'ly-3'],
          ColourOperation.shiftMotifColour,
          '#ABCDEF',
        ),
      );
      expect(result.status, ToolResultStatus.success);
      expect(h.tool.history().entries, hasLength(3));
      for (final id in ['ly-1', 'ly-2', 'ly-3']) {
        expect(h.layer(id).metadata['colour'], '#ABCDEF');
      }
      expect(h.engine.undo(), isA<CommandApplied>());
      expect(h.layer('ly-3').metadata.containsKey('colour'), isFalse);
      expect(h.layer('ly-2').metadata['colour'], '#ABCDEF');
    });
  });

  group('gating — all-or-nothing validation and both lock layers', () {
    test('unknown operation, missing colour, and empty targets are '
        'rejected results with zero emissions — never throws', () async {
      final h = await _Harness.create(layerIds: ['ly-1']);
      final unknown = await h.tool.execute(
        const ToolRequest(
          targetIds: ['ly-1'],
          parameters: {'operation': 'bogus', 'colour': '#000000'},
        ),
      );
      expect(unknown.status, ToolResultStatus.rejected);

      final missingColour = await h.tool.execute(
        const ToolRequest(
          targetIds: ['ly-1'],
          parameters: {'operation': 'palette_swap'},
        ),
      );
      expect(missingColour.status, ToolResultStatus.rejected);
      expect(missingColour.message, contains('Missing colour value'));

      final empty = await h.tool.execute(
        const ToolRequest(
          parameters: {'operation': 'palette_swap', 'colour': '#000000'},
        ),
      );
      expect(empty.status, ToolResultStatus.rejected);

      expect(h.layer('ly-1').metadata.containsKey('colour'), isFalse);
      expect(h.engine.canUndo, isFalse);
    });

    test('tool-side LockSet gating (I4): a blocking layer lock in the '
        'injected context rejects before any emission', () async {
      final h = await _Harness.create(
        layerIds: ['ly-1'],
        locks: const LockSet(
          locks: [LockState(scope: LockScope.layer, targetId: 'ly-1')],
        ),
      );
      final result = await h.tool.execute(
        _request(['ly-1'], ColourOperation.shiftBaseColour, '#00FF00'),
      );
      expect(result.status, ToolResultStatus.rejected);
      expect(result.message, contains('locked'));
      expect(h.engine.canUndo, isFalse);
    });

    test('engine-preflight lock gate (verified frozen behaviour): a lock '
        'held by the DOCUMENT — invisible to the tool context — is '
        'rejected by the sink and surfaces as failed', () async {
      final h = await _Harness.create(layerIds: ['ly-1']);
      // The lock lives in the document's own LockSet; the tool context
      // carries none, so tool-side validation passes and the frozen
      // apply preflight is what rejects.
      expect(
        h.engine.apply(
          const DocumentCommand.setLock(
            lock: LockState(scope: LockScope.layer, targetId: 'ly-1'),
          ),
        ),
        isA<CommandApplied>(),
      );
      final result = await h.tool.execute(
        _request(['ly-1'], ColourOperation.shiftBaseColour, '#00FF00'),
      );
      expect(result.status, ToolResultStatus.failed);
      expect(result.message, contains('locked'));
      expect(h.layer('ly-1').metadata.containsKey('colour'), isFalse);
    });

    test('missing layer id: engine notFound → failed; mid-sequence stop '
        'leaves earlier applications in place (stepwise, no invented '
        'rollback)', () async {
      final h = await _Harness.create(layerIds: ['ly-1']);
      final result = await h.tool.execute(
        _request(
          ['ly-1', 'ly-absent'],
          ColourOperation.globalColourShift,
          '#445566',
        ),
      );
      expect(result.status, ToolResultStatus.failed);
      expect(result.message, contains('ly-absent'));
      expect(result.message, contains('not_found'));
      // ly-1 was applied before the stop and remains, individually
      // undoable — the frozen stepwise reality.
      expect(h.layer('ly-1').metadata['colour'], '#445566');
      expect(h.tool.history().entries, hasLength(1));
      expect(h.engine.undo(), isA<CommandApplied>());
      expect(h.layer('ly-1').metadata.containsKey('colour'), isFalse);
    });
  });

  group('tier separation — the design tree is unreachable', () {
    test('after tool use the designTreeRoot is byte-identical and no '
        'node acquires a colour key', () async {
      final h = await _Harness.create(layerIds: ['ly-1'], nodeIds: ['el-1']);
      final treeBefore = h.engine.document.artboards.single.designTreeRoot;
      await h.tool.execute(
        _request(['ly-1'], ColourOperation.shiftMotifColour, '#665544'),
      );
      expect(h.engine.document.artboards.single.designTreeRoot, treeBefore);
      expect(
        h.engine.document.artboards.single.designTreeRoot
            .findById('el-1')!
            .metadata
            .containsKey('colour'),
        isFalse,
      );
    });
  });

  group('history — D5: descriptive projection, one step per call', () {
    test('undo/redo delegate exactly one engine step; cursor honours '
        'the frozen canUndo/canRedo', () async {
      final h = await _Harness.create(layerIds: ['ly-1', 'ly-2']);
      await h.tool.execute(
        _request(['ly-1', 'ly-2'], ColourOperation.paletteSwap, '#909090'),
      );
      expect(h.tool.history().entries, hasLength(2));
      expect(h.tool.history().cursor, 1);

      expect((await h.tool.undo()).status, ToolResultStatus.success);
      expect(h.layer('ly-2').metadata.containsKey('colour'), isFalse);
      expect(h.layer('ly-1').metadata['colour'], '#909090');
      expect(h.tool.history().cursor, 0);

      expect((await h.tool.redo()).status, ToolResultStatus.success);
      expect(h.layer('ly-2').metadata['colour'], '#909090');
      expect(h.tool.history().cursor, 1);
    });

    test('undo/redo beyond the projection bounds are rejected without a '
        'delegate call', () async {
      final h = await _Harness.create(layerIds: ['ly-1']);
      expect((await h.tool.undo()).status, ToolResultStatus.rejected);
      expect((await h.tool.redo()).status, ToolResultStatus.rejected);
      expect(h.engine.canUndo, isFalse); // layers seeded structurally
    });

    test('entries carry no commands — a descriptive projection '
        'only', () async {
      final h = await _Harness.create(layerIds: ['ly-1']);
      await h.tool.execute(
        _request(['ly-1'], ColourOperation.shiftBaseColour, '#221100'),
      );
      final entry = h.tool.history().entries.single;
      expect(entry.description, contains('shift_base_colour'));
      expect(entry.description, contains('#221100'));
      expect(entry.metadata['layerId'], 'ly-1');
      expect(entry.metadata.containsKey('command'), isFalse);
    });
  });

  group('cancel — always safe', () {
    test('clears only the pending preview; engine untouched', () async {
      final h = await _Harness.create(layerIds: ['ly-1']);
      await h.tool.preview(
        _request(['ly-1'], ColourOperation.paletteSwap, '#111111'),
      );
      await h.tool.cancel();
      final result = await h.tool.execute(
        _request(['ly-1'], ColourOperation.paletteSwap, '#111111'),
      );
      expect(result.previewId, isNull); // no pending preview linked
      expect(result.status, ToolResultStatus.success);
    });
  });
}

ToolRequest _request(
  List<String> ids,
  ColourOperation operation,
  String colourHex,
) => ToolRequest(
  targetIds: ids,
  parameters: {'operation': operation.wireName, 'colour': colourHex},
);

/// Harness: a real engine with structurally pre-seeded layers (and
/// optionally nodes), and the tool wired through the D2/D5 injection
/// seams (engine tear-offs).
final class _Harness {
  _Harness._(this.engine, this.tool, this.context);

  final DocumentEngine engine;
  final ColourShiftTool tool;
  final ToolContext context;

  static Future<_Harness> create({
    List<String> layerIds = const [],
    List<String> nodeIds = const [],
    LockSet locks = LockSet.none,
  }) async {
    final seeded = fx.engine(
      document: fx.documentWithArtboard(
        layers: [
          for (final id in layerIds)
            LayerModel(id: id, name: id, kind: LayerKind.layer),
        ],
        nodes: [
          for (final id in nodeIds)
            DesignNode(id: id, name: id, type: DesignNodeType.element),
        ],
      ),
    );
    final tool = ColourShiftTool(
      sink: seeded.apply,
      undoDelegate: seeded.undo,
      redoDelegate: seeded.redo,
      ids: SequentialIdGenerator(prefix: 'p'),
      artboardId: 'ab-1',
    );
    final context = ToolContext(
      viewport: const ViewportState(
        canvasSize: Size2D(width: 1200, height: 1800),
        screenSize: Size2D(width: 1200, height: 800),
      ),
      selection: SelectionState(selectedIds: layerIds.toSet()),
      locks: locks,
    );
    await tool.initialize(context);
    await tool.activate();
    return _Harness._(seeded, tool, context);
  }

  LayerModel layer(String id) =>
      engine.document.artboards.single.layerRoot.findById(id)!;
}
