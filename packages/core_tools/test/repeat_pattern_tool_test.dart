import 'package:core_common/core_common.dart';
import 'package:core_document/core_document.dart';
import 'package:core_interaction/core_interaction.dart';
import 'package:core_lock/core_lock.dart';
import 'package:core_textile/core_textile.dart';
import 'package:core_tooling/core_tooling.dart';
import 'package:core_tools/core_tools.dart';
import 'package:test/test.dart';

import 'support/fixtures.dart' as fx;

/// M15 S2 verification suite — RepeatPatternTool.
///
/// Drives the tool against a REAL DocumentEngine (sink/undo/redo are
/// engine tear-offs — the approved D2/D5 injection seams) and proves it
/// is the first PRODUCTION writer of the M14 S3 node-repeat
/// representation, under D4's gating and the approved S2 all-or-nothing
/// policy. Foreign-head history coherence is NOT asserted (D5-d#1 open);
/// tier precedence is NOT asserted (Q3-d open).
void main() {
  group('lifecycle and identity', () {
    test('contract-order lifecycle; frozen repeatPattern identity; '
        'aiBacked false; context echoed verbatim', () async {
      final h = await _Harness.create();
      expect(h.tool.isInitialized, isTrue);
      expect(h.tool.isActive, isTrue);

      final meta = h.tool.metadata();
      expect(meta.tool, FebricTool.repeatPattern);
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
        'NOTHING applies (document unchanged, engine history empty)', () async {
      final h = await _Harness.create(nodeIds: ['el-1']);
      final before = h.engine.document;

      final preview = await h.tool.preview(
        _request(['el-1'], RepeatType.halfDrop),
      );
      expect(preview.previewId, isNotEmpty);
      expect(preview.description, contains('half_drop'));
      expect(preview.payload['targets'], ['el-1']);
      expect((preview.payload['repeat']! as Map)['type'], 'half_drop');

      expect(h.engine.document, before); // nothing applied
      expect(h.engine.canUndo, isFalse); // no history entry
      expect(h.tool.history().entries, isEmpty); // no tool entry either
    });

    test('invalid request: preview is total — describes the rejection, '
        'never throws', () async {
      final h = await _Harness.create(nodeIds: ['el-1']);
      final preview = await h.tool.preview(
        const ToolRequest(targetIds: ['el-1'], parameters: {'type': 'bogus'}),
      );
      expect(preview.description, contains('rejected'));
      expect(preview.payload['rejects'], contains('bogus'));
    });
  });

  group('execute — D4 emission of the S3 representation', () {
    test('single node: one setNodeMetadata lands the S3 payload; engine '
        'undo restores absence exactly; one history entry; previewId '
        'linkage', () async {
      final h = await _Harness.create(nodeIds: ['el-1']);
      final preview = await h.tool.preview(
        _request(['el-1'], RepeatType.mirror),
      );
      final result = await h.tool.execute(
        _request(['el-1'], RepeatType.mirror),
      );
      expect(result.status, ToolResultStatus.success);
      expect(result.previewId, preview.previewId);

      final spec = h.node('el-1').metadata['repeat']! as Map<String, Object?>;
      expect(
        RepeatType.fromWireName(spec['type']! as String),
        RepeatType.mirror,
      );

      expect(h.tool.history().entries, hasLength(1));
      expect(h.tool.history().canUndo, isTrue);

      // The frozen exact inverse: engine undo restores prior absence.
      expect(h.engine.undo(), isA<CommandApplied>());
      expect(h.node('el-1').metadata['repeat'], isNull);
    });

    test('parameters ride into the payload (the S3 shape verbatim)', () async {
      final h = await _Harness.create(nodeIds: ['el-1']);
      await h.tool.execute(
        ToolRequest(
          targetIds: const ['el-1'],
          parameters: {
            'type': RepeatType.toss.wireName,
            'parameters': {'seed': 42, 'density': 0.35},
            'target_types': const {'el-1': 'element'},
          },
        ),
      );
      final spec = h.node('el-1').metadata['repeat']! as Map<String, Object?>;
      expect(spec['type'], 'toss');
      expect(spec['seed'], 42);
      expect(spec['density'], 0.35);
    });

    test('multi-select: N nodes → N commands → N entries, each '
        'individually invertible (stepwise; no grouping)', () async {
      final h = await _Harness.create(nodeIds: ['el-1', 'el-2', 'el-3']);
      final result = await h.tool.execute(
        _request(['el-1', 'el-2', 'el-3'], RepeatType.straight),
      );
      expect(result.status, ToolResultStatus.success);
      expect(h.tool.history().entries, hasLength(3));
      for (final id in ['el-1', 'el-2', 'el-3']) {
        expect((h.node(id).metadata['repeat']! as Map)['type'], 'straight');
      }
      // Stepwise: one engine undo removes only the LAST node's spec.
      expect(h.engine.undo(), isA<CommandApplied>());
      expect(h.node('el-3').metadata['repeat'], isNull);
      expect(h.node('el-2').metadata['repeat'], isNotNull);
    });

    test('all eight frozen RepeatTypes front and land', () async {
      for (final type in RepeatType.values) {
        final h = await _Harness.create(nodeIds: ['el-1']);
        final result = await h.tool.execute(_request(['el-1'], type));
        expect(result.status, ToolResultStatus.success, reason: type.wireName);
        expect(
          (h.node('el-1').metadata['repeat']! as Map)['type'],
          type.wireName,
        );
      }
    });
  });

  group('gating — D4: capability and locks, all-or-nothing', () {
    test('an incapable target (garment, caller-typed) rejects the WHOLE '
        'request with zero emissions', () async {
      final h = await _Harness.create(nodeIds: ['el-1']);
      final result = await h.tool.execute(
        ToolRequest(
          targetIds: const ['el-1', 'g-1'],
          parameters: {
            'type': RepeatType.mirror.wireName,
            'target_types': const {'el-1': 'element', 'g-1': 'garment'},
          },
        ),
      );
      expect(result.status, ToolResultStatus.rejected);
      expect(result.message, contains('garment'));
      // Zero emissions: the capable node gained nothing either.
      expect(h.node('el-1').metadata['repeat'], isNull);
      expect(h.engine.canUndo, isFalse);
    });

    test('a target without a supplied type is rejected (the M12E '
        'caller-supplied-types requirement)', () async {
      final h = await _Harness.create(nodeIds: ['el-1']);
      final result = await h.tool.execute(
        ToolRequest(
          targetIds: const ['el-1'],
          parameters: {'type': RepeatType.mirror.wireName},
        ),
      );
      expect(result.status, ToolResultStatus.rejected);
      expect(result.message, contains('No node type supplied'));
    });

    test('tool-side LockSet gating (I4): a blocking object lock rejects '
        'before any emission', () async {
      final h = await _Harness.create(
        nodeIds: ['el-1'],
        locks: const LockSet(
          locks: [LockState(scope: LockScope.object, targetId: 'el-1')],
        ),
      );
      final result = await h.tool.execute(
        _request(['el-1'], RepeatType.mirror),
      );
      expect(result.status, ToolResultStatus.rejected);
      expect(result.message, contains('locked'));
      expect(h.engine.canUndo, isFalse);
    });

    test('reducer-side node-flag lock (verified frozen behaviour): the '
        'sink rejects locked and the tool surfaces failed', () async {
      final h = await _Harness.create();
      h.engine.apply(
        const DocumentCommand.createDesignNode(
          artboardId: 'ab-1',
          node: DesignNode(
            id: 'el-locked',
            name: 'Protected',
            type: DesignNodeType.element,
            locked: true,
          ),
        ),
      );
      final result = await h.tool.execute(
        _request(['el-locked'], RepeatType.mirror),
      );
      expect(result.status, ToolResultStatus.failed);
      expect(result.message, contains('locked'));
      expect(h.node('el-locked').metadata['repeat'], isNull);
    });

    test('never throws: unknown wire name and empty targets are rejected '
        'results', () async {
      final h = await _Harness.create(nodeIds: ['el-1']);
      final unknown = await h.tool.execute(
        const ToolRequest(
          targetIds: ['el-1'],
          parameters: {
            'type': 'bogus',
            'target_types': {'el-1': 'element'},
          },
        ),
      );
      expect(unknown.status, ToolResultStatus.rejected);
      final empty = await h.tool.execute(
        const ToolRequest(parameters: {'type': 'mirror'}),
      );
      expect(empty.status, ToolResultStatus.rejected);
    });
  });

  group('tier separation — D4: the layer tier is unreachable', () {
    test('after tool use the layerRoot is byte-identical and carries no '
        'repeat key', () async {
      final h = await _Harness.create(nodeIds: ['el-1']);
      final layersBefore = h.engine.document.artboards.single.layerRoot;
      await h.tool.execute(_request(['el-1'], RepeatType.diamond));
      expect(h.engine.document.artboards.single.layerRoot, layersBefore);
      expect(
        h.engine.document.artboards.single.layerRoot.metadata.containsKey(
          'repeat',
        ),
        isFalse,
      );
    });
  });

  group('history — D5: descriptive projection, one step per call', () {
    test('undo/redo delegate exactly one engine step; cursor honours the '
        'frozen canUndo/canRedo', () async {
      final h = await _Harness.create(nodeIds: ['el-1', 'el-2']);
      await h.tool.execute(_request(['el-1', 'el-2'], RepeatType.seamless));
      expect(h.tool.history().entries, hasLength(2));
      expect(h.tool.history().cursor, 1);

      // One tool.undo == exactly one engine step (el-2's command).
      expect((await h.tool.undo()).status, ToolResultStatus.success);
      expect(h.node('el-2').metadata['repeat'], isNull);
      expect(h.node('el-1').metadata['repeat'], isNotNull);
      expect(h.tool.history().cursor, 0);

      expect((await h.tool.redo()).status, ToolResultStatus.success);
      expect(h.node('el-2').metadata['repeat'], isNotNull);
      expect(h.tool.history().cursor, 1);
    });

    test('undo/redo beyond the projection bounds are rejected without a '
        'delegate call', () async {
      final h = await _Harness.create(nodeIds: ['el-1']);
      expect((await h.tool.undo()).status, ToolResultStatus.rejected);
      expect((await h.tool.redo()).status, ToolResultStatus.rejected);
      expect(h.engine.canUndo, isFalse); // fixture nodes are pre-seeded
    });

    test('entries carry no commands — a descriptive projection only', () async {
      final h = await _Harness.create(nodeIds: ['el-1']);
      await h.tool.execute(_request(['el-1'], RepeatType.mirror));
      final entry = h.tool.history().entries.single;
      expect(entry.description, contains('mirror'));
      expect(entry.metadata['nodeId'], 'el-1');
      // No command, no inverse — structurally incapable of replay (D5).
      expect(entry.metadata.containsKey('command'), isFalse);
    });
  });

  group('cancel — always safe', () {
    test('clears only the pending preview; engine untouched', () async {
      final h = await _Harness.create(nodeIds: ['el-1']);
      await h.tool.preview(_request(['el-1'], RepeatType.mirror));
      await h.tool.cancel();
      final result = await h.tool.execute(_request(['el-1'], RepeatType.toss));
      expect(result.previewId, isNull); // no pending preview linked
      expect(result.status, ToolResultStatus.success);
    });
  });
}

ToolRequest _request(List<String> ids, RepeatType type) => ToolRequest(
  targetIds: ids,
  parameters: {
    'type': type.wireName,
    'target_types': {for (final id in ids) id: 'element'},
  },
);

/// Harness: a real engine with pre-seeded element nodes, and the tool
/// wired through the D2/D5 injection seams (engine tear-offs).
final class _Harness {
  _Harness._(this.engine, this.tool, this.context);

  final DocumentEngine engine;
  final RepeatPatternTool tool;
  final ToolContext context;

  static Future<_Harness> create({
    List<String> nodeIds = const [],
    LockSet locks = LockSet.none,
  }) async {
    // Nodes are seeded structurally (fixture data, not commands), so the
    // engine baseline starts with an EMPTY document history.
    final seeded = fx.engine(
      document: fx.documentWithArtboard(
        nodes: [
          for (final id in nodeIds)
            DesignNode(id: id, name: id, type: DesignNodeType.element),
        ],
      ),
    );
    final tool = RepeatPatternTool(
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
      selection: SelectionState(selectedIds: nodeIds.toSet()),
      locks: locks,
    );
    await tool.initialize(context);
    await tool.activate();
    return _Harness._(seeded, tool, context);
  }

  DesignNode node(String id) =>
      engine.document.artboards.single.designTreeRoot.findById(id)!;
}
