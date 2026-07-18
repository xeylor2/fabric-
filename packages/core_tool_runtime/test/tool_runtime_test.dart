import 'package:core_document/core_document.dart';
import 'package:core_interaction/core_interaction.dart';
import 'package:core_layer/core_layer.dart';
import 'package:core_lock/core_lock.dart';
import 'package:core_textile/core_textile.dart';
import 'package:core_tool_runtime/core_tool_runtime.dart';
import 'package:core_tooling/core_tooling.dart';
import 'package:test/test.dart';

// --------------------------------------------------------------- fixtures

ViewportState _viewport() => const ViewportState(
  canvasSize: Size2D(width: 100, height: 100),
  screenSize: Size2D(width: 100, height: 100),
);

/// A sink shaped exactly like `DocumentEngine.apply`, recording what a tool
/// forwards. Proves the command-bus binding lives in the *tool*, never in the
/// runtime.
class _SpySink {
  final List<DocumentCommand> commands = [];
  CommandResult result = const CommandResult.applied(revision: 1);

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

/// A fake `UniversalToolContract` that records its lifecycle calls and returns
/// frozen results. It optionally holds a command sink it was *constructed*
/// with — modelling the resolved ownership: a tool carries its own bus
/// binding; the runtime never provides one.
final class _FakeTool implements UniversalToolContract {
  _FakeTool({
    required this.tool,
    this.aiBacked = false,
    CommandResult Function(
      DocumentCommand command, {
      CommandSource source,
      String author,
      AiProvenanceRecord? provenance,
    })?
    sink,
  }) : _sink = sink; // ignore: prefer_initializing_formals

  final FebricTool tool;
  final bool aiBacked;
  final CommandResult Function(
    DocumentCommand command, {
    CommandSource source,
    String author,
    AiProvenanceRecord? provenance,
  })?
  _sink;

  final List<String> calls = <String>[];
  ToolContext? initializedWith;
  bool active = false;

  @override
  Future<void> initialize(ToolContext context) async {
    calls.add('initialize');
    initializedWith = context;
  }

  @override
  Future<void> dispose() async => calls.add('dispose');

  @override
  Future<void> activate() async {
    calls.add('activate');
    active = true;
  }

  @override
  Future<void> deactivate() async {
    calls.add('deactivate');
    active = false;
  }

  @override
  Future<ToolPreview> preview(ToolRequest request) async {
    calls.add('preview');
    return ToolPreview(
      previewId: 'pv-${tool.wireName}',
      description: 'preview of ${request.targetIds.length} target(s)',
    );
  }

  @override
  Future<ToolResult> execute(ToolRequest request) async {
    calls.add('execute');
    // A real tool applies through the bus it was constructed with.
    _sink?.call(
      const DocumentCommand.createLayer(
        artboardId: 'ab',
        layer: LayerModel(id: 'l', name: 'L', kind: LayerKind.vector),
      ),
      source: aiBacked ? CommandSource.ai : CommandSource.user,
    );
    return const ToolResult(
      status: ToolResultStatus.success,
      previewId: 'pv-exec',
    );
  }

  @override
  Future<void> cancel() async => calls.add('cancel');

  @override
  Future<ToolResult> undo() async {
    calls.add('undo');
    return const ToolResult(status: ToolResultStatus.success, message: 'undo');
  }

  @override
  Future<ToolResult> redo() async {
    calls.add('redo');
    return const ToolResult(status: ToolResultStatus.success, message: 'redo');
  }

  @override
  SelectionState selection() => SelectionState.empty;

  @override
  ViewportState viewport() => _viewport();

  @override
  ToolHistory history() => const ToolHistory(
    entries: [ToolHistoryEntry(id: 'h', description: 'd')],
  );

  @override
  LockSet lock() => LockSet.none;

  @override
  ToolMetadata metadata() => ToolMetadata(tool: tool, version: '1.0.0');
}

void main() {
  group('registry', () {
    test('registerTool keys by the frozen wire name and reports it', () {
      final r = ToolRuntime();
      final id = r.registerTool(_FakeTool(tool: FebricTool.repeatPattern));
      expect(id, FebricTool.repeatPattern.wireName);
      expect(r.isRegistered(id), isTrue);
      expect(r.registeredToolIds, [id]);
      expect(r.activeToolId, isNull);
    });

    test('re-registering the same id replaces the instance', () {
      final r = ToolRuntime();
      r.registerTool(_FakeTool(tool: FebricTool.colourShift));
      r.registerTool(_FakeTool(tool: FebricTool.colourShift));
      expect(r.registeredToolIds, [FebricTool.colourShift.wireName]);
    });
  });

  group('lifecycle ordering', () {
    test('activate initializes then activates on first use', () async {
      final r = ToolRuntime();
      final tool = _FakeTool(tool: FebricTool.repeatPattern);
      final id = r.registerTool(tool);
      await r.activate(id, viewport: _viewport());
      expect(tool.calls, ['initialize', 'activate']);
      expect(r.activeToolId, id);
    });

    test(
      're-activating an already-initialized tool does not re-initialize',
      () async {
        final r = ToolRuntime();
        final tool = _FakeTool(tool: FebricTool.repeatPattern);
        final id = r.registerTool(tool);
        await r.activate(id, viewport: _viewport());
        await r.deactivate();
        await r.activate(id, viewport: _viewport());
        expect(tool.calls, [
          'initialize',
          'activate',
          'deactivate',
          'activate',
        ]);
      },
    );

    test('switching active tool deactivates the previous one', () async {
      final r = ToolRuntime();
      final a = _FakeTool(tool: FebricTool.repeatPattern);
      final b = _FakeTool(tool: FebricTool.colourShift);
      final idA = r.registerTool(a);
      final idB = r.registerTool(b);
      await r.activate(idA, viewport: _viewport());
      await r.activate(idB, viewport: _viewport());
      expect(a.calls, ['initialize', 'activate', 'deactivate']);
      expect(b.calls, ['initialize', 'activate']);
      expect(r.activeToolId, idB);
    });

    test(
      'activate throws for an unregistered id and touches nothing',
      () async {
        final r = ToolRuntime();
        await expectLater(
          r.activate('nope', viewport: _viewport()),
          throwsArgumentError,
        );
        expect(r.activeToolId, isNull);
      },
    );

    test('deactivate is safe with no active tool', () async {
      final r = ToolRuntime();
      await r.deactivate();
      expect(r.activeToolId, isNull);
    });

    test(
      'disposeTool deactivates if active, disposes, and forgets init',
      () async {
        final r = ToolRuntime();
        final tool = _FakeTool(tool: FebricTool.motifRefinement);
        final id = r.registerTool(tool);
        await r.activate(id, viewport: _viewport());
        await r.disposeTool(id);
        expect(tool.calls, ['initialize', 'activate', 'deactivate', 'dispose']);
        expect(r.activeToolId, isNull);
        // Re-activation initializes again (init state was forgotten).
        await r.activate(id, viewport: _viewport());
        expect(tool.calls.where((c) => c == 'initialize').length, 2);
      },
    );

    test('disposeTool is a no-op for an unknown id', () async {
      final r = ToolRuntime();
      await r.disposeTool('unknown');
      expect(r.activeToolId, isNull);
    });
  });

  group('context assembly', () {
    test(
      'the ToolContext handed to the tool carries the supplied state',
      () async {
        final r = ToolRuntime();
        final tool = _FakeTool(tool: FebricTool.repeatPattern);
        final id = r.registerTool(tool);
        final vp = _viewport();
        await r.activate(
          id,
          viewport: vp,
          locks: LockSet.none,
          config: const {'k': 'v'},
        );
        expect(tool.initializedWith!.viewport, vp);
        expect(tool.initializedWith!.selection, SelectionState.empty);
        expect(tool.initializedWith!.locks, LockSet.none);
        expect(tool.initializedWith!.config, {'k': 'v'});
      },
    );
  });

  group('request routing — verbatim pass-through', () {
    late ToolRuntime r;
    late _FakeTool tool;

    setUp(() async {
      r = ToolRuntime();
      tool = _FakeTool(tool: FebricTool.repeatPattern);
      final id = r.registerTool(tool);
      await r.activate(id, viewport: _viewport());
    });

    test('preview returns the tool preview verbatim', () async {
      final pv = await r.preview(const ToolRequest(targetIds: ['n1', 'n2']));
      expect(pv!.previewId, 'pv-repeat_pattern');
      expect(pv.description, 'preview of 2 target(s)');
    });

    test('execute returns the tool result verbatim', () async {
      final res = await r.execute(const ToolRequest());
      expect(res.status, ToolResultStatus.success);
      expect(res.previewId, 'pv-exec');
    });

    test('undo / redo return the tool results verbatim', () async {
      expect((await r.undo()).message, 'undo');
      expect((await r.redo()).message, 'redo');
    });

    test('cancel forwards to the active tool', () async {
      await r.cancel();
      expect(tool.calls, contains('cancel'));
    });
  });

  group('no-active-tool guards', () {
    test('preview returns null and never touches a tool', () async {
      final r = ToolRuntime();
      expect(await r.preview(const ToolRequest()), isNull);
    });

    test('execute returns a frozen rejected result', () async {
      final r = ToolRuntime();
      final res = await r.execute(const ToolRequest());
      expect(res.status, ToolResultStatus.rejected);
      expect(res.message, 'No active tool');
    });

    test('undo / redo return frozen rejected results', () async {
      final r = ToolRuntime();
      expect((await r.undo()).status, ToolResultStatus.rejected);
      expect((await r.redo()).status, ToolResultStatus.rejected);
    });

    test('cancel is safe with no active tool', () async {
      final r = ToolRuntime();
      await r.cancel();
    });
  });

  group('command-bus ownership — the runtime holds no sink', () {
    test('preview performs zero sink calls (invariant I2)', () async {
      final spy = _SpySink();
      final r = ToolRuntime();
      final id = r.registerTool(
        _FakeTool(tool: FebricTool.repeatPattern, sink: spy.call),
      );
      await r.activate(id, viewport: _viewport());
      await r.preview(const ToolRequest());
      expect(spy.commands, isEmpty);
    });

    test('execute reaches the sink the TOOL was constructed with', () async {
      final spy = _SpySink();
      final r = ToolRuntime();
      final id = r.registerTool(
        _FakeTool(tool: FebricTool.repeatPattern, sink: spy.call),
      );
      await r.activate(id, viewport: _viewport());
      await r.execute(const ToolRequest());
      // The command reached the bus — via the tool, not the runtime.
      expect(spy.commands.single, isA<CreateLayerCommand>());
    });

    test('an aiBacked tool forwards with CommandSource.ai', () async {
      var seenSource = CommandSource.user;
      final r = ToolRuntime();
      final id = r.registerTool(
        _FakeTool(
          tool: FebricTool.redesignTextilePrint,
          aiBacked: true,
          sink:
              (
                command, {
                CommandSource source = CommandSource.user,
                String author = 'local',
                AiProvenanceRecord? provenance,
              }) {
                seenSource = source;
                return const CommandResult.applied(revision: 1);
              },
        ),
      );
      await r.activate(id, viewport: _viewport());
      await r.execute(const ToolRequest());
      expect(seenSource, CommandSource.ai);
    });
  });

  group('state exposure — verbatim from the active tool', () {
    late ToolRuntime r;

    setUp(() async {
      r = ToolRuntime();
      final id = r.registerTool(_FakeTool(tool: FebricTool.repeatPattern));
      await r.activate(id, viewport: _viewport());
    });

    test('selection / viewport / lock delegate to the active tool', () {
      expect(r.activeSelection, SelectionState.empty);
      expect(r.activeViewport, _viewport());
      expect(r.activeLock, LockSet.none);
    });

    test('history / metadata delegate to the active tool', () {
      expect(r.activeHistory!.entries.single.id, 'h');
      expect(r.activeMetadata!.tool, FebricTool.repeatPattern);
    });

    test('state getters are null when no tool is active', () {
      final empty = ToolRuntime();
      expect(empty.activeSelection, isNull);
      expect(empty.activeViewport, isNull);
      expect(empty.activeHistory, isNull);
      expect(empty.activeLock, isNull);
      expect(empty.activeMetadata, isNull);
    });
  });

  group('tool-state seam — frozen envelope, opaque payload', () {
    test('saveToolState / toolState round-trip keyed by toolId', () {
      final r = ToolRuntime();
      const state = ToolStateExtension(
        toolId: 'repeat_pattern',
        version: 2,
        data: {'tiles': 4},
      );
      r.saveToolState(state);
      expect(r.toolState('repeat_pattern'), state);
      expect(r.toolState('repeat_pattern')!.data, {'tiles': 4});
    });

    test('toolState is null for an unknown id', () {
      expect(ToolRuntime().toolState('nope'), isNull);
    });
  });
}
