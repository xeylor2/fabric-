import 'package:core_common/core_common.dart';
import 'package:core_document/core_document.dart';
import 'package:core_interaction/core_interaction.dart';
import 'package:core_layer/core_layer.dart';
import 'package:core_lock/core_lock.dart';
import 'package:core_textile/core_textile.dart';
import 'package:core_tool_runtime/core_tool_runtime.dart';
import 'package:core_tooling/core_tooling.dart';
import 'package:core_tools/core_tools.dart';
import 'package:test/test.dart';

import 'support/fixtures.dart' as fx;

/// M15 S4 verification suite — Hosting Verification.
///
/// Proves the two approved M15 tools (RepeatPatternTool S2,
/// ColourShiftTool S3) host correctly under the FROZEN M11 ToolRuntime:
/// wire-name-keyed registration, contract-order lifecycle
/// (initialize-once, single-active switching), verbatim request routing,
/// verbatim state exposure, and structural sink independence (the runtime
/// is constructed bare — the path to the engine exists ONLY inside each
/// tool, per ADR-0012/0014 and D2).
///
/// The two-tools-one-engine group asserts ENGINE-LEVEL interleaving only:
/// cross-tool local-cursor coherence is deliberately NOT asserted — that
/// is the open D5 discovered question (D5-d#1). Tier precedence is NOT
/// asserted (Q3-d open).
void main() {
  const viewport = ViewportState(
    canvasSize: Size2D(width: 1200, height: 1800),
    screenSize: Size2D(width: 1200, height: 800),
  );

  group('registration — frozen wire-name keys, replace semantics', () {
    test('both tools register under their frozen FebricTool wire names', () {
      final h = _Harness();
      expect(
        h.runtime.registerTool(h.repeat),
        FebricTool.repeatPattern.wireName,
      );
      expect(h.runtime.registerTool(h.colour), FebricTool.colourShift.wireName);
      expect(h.runtime.isRegistered(FebricTool.repeatPattern.wireName), isTrue);
      expect(h.runtime.isRegistered(FebricTool.colourShift.wireName), isTrue);
      expect(h.runtime.registeredToolIds, [
        FebricTool.repeatPattern.wireName,
        FebricTool.colourShift.wireName,
      ]);
    });

    test('re-registering the same wire name replaces the instance and '
        'runs no lifecycle (frozen replace semantics)', () {
      final h = _Harness();
      h.runtime.registerTool(h.repeat);
      final replacement = h.newRepeatTool();
      expect(
        h.runtime.registerTool(replacement),
        FebricTool.repeatPattern.wireName,
      );
      expect(h.runtime.registeredToolIds, hasLength(1));
      // Pure registry update: neither instance saw a lifecycle call.
      expect(h.repeat.isInitialized, isFalse);
      expect(replacement.isInitialized, isFalse);
    });

    test('activating an unregistered id throws ArgumentError and nothing '
        'reaches the document', () async {
      final h = _Harness();
      await expectLater(
        h.runtime.activate('unregistered', viewport: viewport),
        throwsArgumentError,
      );
      expect(h.engine.canUndo, isFalse);
    });
  });

  group('lifecycle — contract order through the frozen host', () {
    test('activate initializes once then activates; switching '
        'deactivates the previous tool; re-activation does NOT '
        're-initialize', () async {
      final h = _Harness()..registerBoth();

      await h.runtime.activate(
        FebricTool.repeatPattern.wireName,
        viewport: viewport,
      );
      expect(h.repeat.isInitialized, isTrue);
      expect(h.repeat.isActive, isTrue);
      expect(h.runtime.activeToolId, FebricTool.repeatPattern.wireName);

      // Single-active invariant: activating colour deactivates repeat.
      await h.runtime.activate(
        FebricTool.colourShift.wireName,
        viewport: viewport,
      );
      expect(h.repeat.isActive, isFalse);
      expect(h.repeat.isInitialized, isTrue); // lifetime not ended
      expect(h.colour.isActive, isTrue);
      expect(h.runtime.activeToolId, FebricTool.colourShift.wireName);

      // Switching back re-activates without re-initializing.
      await h.runtime.activate(
        FebricTool.repeatPattern.wireName,
        viewport: viewport,
      );
      expect(h.repeat.isActive, isTrue);
      expect(h.colour.isActive, isFalse);
    });

    test('deactivate is safe with no active tool; disposeTool ends the '
        'lifetime and forgets initialization', () async {
      final h = _Harness()..registerBoth();
      await h.runtime.deactivate(); // no active tool — must not throw

      await h.runtime.activate(
        FebricTool.repeatPattern.wireName,
        viewport: viewport,
      );
      await h.runtime.disposeTool(FebricTool.repeatPattern.wireName);
      expect(h.repeat.isInitialized, isFalse);
      expect(h.repeat.isActive, isFalse);
      expect(h.runtime.activeToolId, isNull);

      await h.runtime.disposeTool('unknown'); // no-op — must not throw
    });

    test('context assembly: the runtime-assembled ToolContext reaches '
        'the tool verbatim', () async {
      final h = _Harness();
      h.runtime.registerTool(h.repeat);
      const selection = SelectionState(selectedIds: {'el-1'});
      const locks = LockSet(
        locks: [LockState(scope: LockScope.object, targetId: 'el-9')],
      );
      await h.runtime.activate(
        FebricTool.repeatPattern.wireName,
        viewport: viewport,
        selection: selection,
        locks: locks,
      );
      expect(h.repeat.selection(), selection);
      expect(h.repeat.viewport(), viewport);
      expect(h.repeat.lock(), locks);
    });
  });

  group('request routing — verbatim forwarding (D2 through the host)', () {
    test('preview routes verbatim and NOTHING reaches the document; '
        'null with no active tool', () async {
      final h = _Harness()..registerBoth();
      expect(await h.runtime.preview(h.repeatRequest(['el-1'])), isNull);

      await h.runtime.activate(
        FebricTool.repeatPattern.wireName,
        viewport: viewport,
      );
      final before = h.engine.document;
      final preview = await h.runtime.preview(h.repeatRequest(['el-1']));
      expect(preview, isNotNull);
      expect(preview!.payload['targets'], ['el-1']);
      expect((preview.payload['repeat']! as Map)['type'], 'mirror');
      expect(h.engine.document, before);
      expect(h.engine.canUndo, isFalse);
    });

    test('execute routes to the active tool and lands its approved '
        'effect through the TOOL-OWNED sink (the bare runtime holds '
        'none)', () async {
      final h = _Harness()..registerBoth();
      await h.runtime.activate(
        FebricTool.repeatPattern.wireName,
        viewport: viewport,
      );
      final result = await h.runtime.execute(h.repeatRequest(['el-1']));
      expect(result.status, ToolResultStatus.success);
      expect((h.node('el-1').metadata['repeat']! as Map)['type'], 'mirror');
    });

    test('execute/undo/redo with no active tool return the frozen '
        'rejected result; the document is untouched; cancel is a '
        'no-op', () async {
      final h = _Harness()..registerBoth();
      expect(
        (await h.runtime.execute(h.repeatRequest(['el-1']))).status,
        ToolResultStatus.rejected,
      );
      expect((await h.runtime.undo()).status, ToolResultStatus.rejected);
      expect((await h.runtime.redo()).status, ToolResultStatus.rejected);
      await h.runtime.cancel();
      expect(h.engine.canUndo, isFalse);
      expect(h.node('el-1').metadata.containsKey('repeat'), isFalse);
    });

    test('undo/redo route to the active tool: exactly one engine step '
        'per call (single-tool scenario, mirroring S2/S3)', () async {
      final h = _Harness()..registerBoth();
      await h.runtime.activate(
        FebricTool.colourShift.wireName,
        viewport: viewport,
      );
      await h.runtime.execute(h.colourRequest(['ly-1', 'ly-2']));
      expect(h.layer('ly-1').metadata['colour'], '#112233');
      expect(h.layer('ly-2').metadata['colour'], '#112233');

      expect((await h.runtime.undo()).status, ToolResultStatus.success);
      expect(h.layer('ly-2').metadata.containsKey('colour'), isFalse);
      expect(h.layer('ly-1').metadata['colour'], '#112233');

      expect((await h.runtime.redo()).status, ToolResultStatus.success);
      expect(h.layer('ly-2').metadata['colour'], '#112233');
    });
  });

  group('state exposure — verbatim, null when none active', () {
    test('active* getters equal the active tool\'s own frozen state; all '
        'null with no active tool', () async {
      final h = _Harness()..registerBoth();
      expect(h.runtime.activeMetadata, isNull);
      expect(h.runtime.activeHistory, isNull);
      expect(h.runtime.activeSelection, isNull);
      expect(h.runtime.activeViewport, isNull);
      expect(h.runtime.activeLock, isNull);

      await h.runtime.activate(
        FebricTool.colourShift.wireName,
        viewport: viewport,
      );
      await h.runtime.execute(h.colourRequest(['ly-1']));
      expect(h.runtime.activeMetadata, h.colour.metadata());
      expect(h.runtime.activeMetadata!.tool, FebricTool.colourShift);
      expect(h.runtime.activeHistory!.entries, h.colour.history().entries);
      expect(h.runtime.activeSelection, h.colour.selection());
      expect(h.runtime.activeViewport, h.colour.viewport());
      expect(h.runtime.activeLock, h.colour.lock());
    });
  });

  group('two tools, one engine — D5 one-timeline through the host', () {
    test('interleaved executes land both tiers; ENGINE-LEVEL undo peels '
        'global steps in reverse order (cross-tool cursor coherence NOT '
        'asserted — D5-d#1 open)', () async {
      final h = _Harness()..registerBoth();

      await h.runtime.activate(
        FebricTool.repeatPattern.wireName,
        viewport: viewport,
      );
      final r1 = await h.runtime.execute(h.repeatRequest(['el-1']));
      expect(r1.status, ToolResultStatus.success);

      await h.runtime.activate(
        FebricTool.colourShift.wireName,
        viewport: viewport,
      );
      final r2 = await h.runtime.execute(h.colourRequest(['ly-1']));
      expect(r2.status, ToolResultStatus.success);

      // Both tiers landed on the ONE shared document.
      expect((h.node('el-1').metadata['repeat']! as Map)['type'], 'mirror');
      expect(h.layer('ly-1').metadata['colour'], '#112233');

      // One timeline: engine-level undo peels in reverse interleaved
      // order — colour first, then repeat.
      expect(h.engine.undo(), isA<CommandApplied>());
      expect(h.layer('ly-1').metadata.containsKey('colour'), isFalse);
      expect((h.node('el-1').metadata['repeat']! as Map)['type'], 'mirror');

      expect(h.engine.undo(), isA<CommandApplied>());
      expect(h.node('el-1').metadata.containsKey('repeat'), isFalse);
      expect(h.engine.canUndo, isFalse);
    });
  });
}

/// Harness: ONE real engine; both approved tools constructed over its
/// tear-offs (each tool owns its sink — ADR-0012/0014); a BARE frozen
/// ToolRuntime hosting them (it holds no engine reference at all).
final class _Harness {
  _Harness()
    : engine = fx.engine(
        document: fx.documentWithArtboard(
          nodes: const [
            DesignNode(id: 'el-1', name: 'el-1', type: DesignNodeType.element),
          ],
          layers: const [
            LayerModel(id: 'ly-1', name: 'ly-1', kind: LayerKind.layer),
            LayerModel(id: 'ly-2', name: 'ly-2', kind: LayerKind.layer),
          ],
        ),
      ) {
    repeat = newRepeatTool();
    colour = ColourShiftTool(
      sink: engine.apply,
      undoDelegate: engine.undo,
      redoDelegate: engine.redo,
      ids: SequentialIdGenerator(prefix: 'c'),
      artboardId: 'ab-1',
    );
  }

  final DocumentEngine engine;
  final ToolRuntime runtime = ToolRuntime();
  late final RepeatPatternTool repeat;
  late final ColourShiftTool colour;

  RepeatPatternTool newRepeatTool() => RepeatPatternTool(
    sink: engine.apply,
    undoDelegate: engine.undo,
    redoDelegate: engine.redo,
    ids: SequentialIdGenerator(prefix: 'r'),
    artboardId: 'ab-1',
  );

  void registerBoth() {
    runtime
      ..registerTool(repeat)
      ..registerTool(colour);
  }

  ToolRequest repeatRequest(List<String> ids) => ToolRequest(
    targetIds: ids,
    parameters: {
      'type': RepeatType.mirror.wireName,
      'target_types': {for (final id in ids) id: 'element'},
    },
  );

  ToolRequest colourRequest(List<String> ids) => ToolRequest(
    targetIds: ids,
    parameters: {
      'operation': ColourOperation.globalColourShift.wireName,
      'colour': '#112233',
    },
  );

  DesignNode node(String id) =>
      engine.document.artboards.single.designTreeRoot.findById(id)!;

  LayerModel layer(String id) =>
      engine.document.artboards.single.layerRoot.findById(id)!;
}
