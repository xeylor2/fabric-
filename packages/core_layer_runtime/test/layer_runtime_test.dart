import 'package:core_document/core_document.dart';
import 'package:core_layer/core_layer.dart';
import 'package:core_layer_runtime/core_layer_runtime.dart';
import 'package:test/test.dart';

// -------------------------------------------------------------------- spy
/// Records the commands forwarded to it and returns a canned result — proves
/// the runtime emits the right frozen command and forwards it verbatim
/// without reducing anything itself.
class _SpySink {
  final List<DocumentCommand> commands = [];
  final List<CommandSource> sources = [];
  final List<String> authors = [];
  CommandResult result = const CommandResult.applied(revision: 1);

  CommandResult call(
    DocumentCommand command, {
    CommandSource source = CommandSource.user,
    String author = 'local',
    AiProvenanceRecord? provenance,
  }) {
    commands.add(command);
    sources.add(source);
    authors.add(author);
    return result;
  }
}

// A small real layer tree (frozen LayerModel, no mocks).
const _root = LayerModel(
  id: 'root',
  name: 'Layers',
  kind: LayerKind.artboard,
  children: [
    LayerModel(
      id: 'grp',
      name: 'Group',
      kind: LayerKind.group,
      children: [LayerModel(id: 'leaf', name: 'Leaf', kind: LayerKind.vector)],
    ),
  ],
);

void main() {
  group('active layer reference — pure reference, no document state', () {
    test('holds and updates the active layer id without emitting commands', () {
      final spy = _SpySink();
      final r = LayerRuntime(sink: spy.call, activeLayerId: 'grp');
      expect(r.activeLayerId, 'grp');
      r.setActiveLayer('leaf');
      expect(r.activeLayerId, 'leaf');
      r.setActiveLayer(null);
      expect(r.activeLayerId, isNull);
      expect(spy.commands, isEmpty); // reference changes emit nothing
    });
  });

  group('traversal — delegates to the frozen LayerModel helpers', () {
    test('findById matches LayerModel.findById exactly', () {
      final r = LayerRuntime(sink: _SpySink().call);
      expect(r.findById(_root, 'leaf'), same(_root.findById('leaf')));
      expect(r.findById(_root, 'absent'), isNull);
    });

    test('activeLayer resolves the active id via the frozen helper', () {
      final r = LayerRuntime(sink: _SpySink().call, activeLayerId: 'grp');
      expect(r.activeLayer(_root), same(_root.findById('grp')));
      r.setActiveLayer(null);
      expect(r.activeLayer(_root), isNull);
    });

    test('descendantsAndSelf matches LayerModel.descendantsAndSelf', () {
      final r = LayerRuntime(sink: _SpySink().call);
      expect(
        r.descendantsAndSelf(_root).map((l) => l.id),
        _root.descendantsAndSelf.map((l) => l.id),
      );
    });
  });

  group('emit + forward — builds frozen commands, forwards verbatim', () {
    test('createLayer emits a CreateLayerCommand and forwards it', () {
      final spy = _SpySink();
      final r = LayerRuntime(sink: spy.call);
      const layer = LayerModel(id: 'new', name: 'New', kind: LayerKind.vector);
      final result = r.createLayer(
        artboardId: 'ab-1',
        layer: layer,
        parentLayerId: 'grp',
        index: 0,
      );
      expect(spy.commands.single, isA<CreateLayerCommand>());
      final cmd = spy.commands.single as CreateLayerCommand;
      expect(cmd.artboardId, 'ab-1');
      expect(cmd.parentLayerId, 'grp');
      expect(cmd.layer, layer);
      expect(cmd.index, 0);
      expect(result, spy.result); // CommandResult returned verbatim
    });

    test('deleteLayer emits a DeleteLayerCommand', () {
      final spy = _SpySink();
      LayerRuntime(sink: spy.call).deleteLayer(artboardId: 'ab', layerId: 'x');
      final cmd = spy.commands.single as DeleteLayerCommand;
      expect(cmd.artboardId, 'ab');
      expect(cmd.layerId, 'x');
    });

    test('moveLayer emits a MoveLayerCommand with the given position', () {
      final spy = _SpySink();
      LayerRuntime(sink: spy.call).moveLayer(
        artboardId: 'ab',
        layerId: 'leaf',
        newParentId: 'root',
        index: 2,
      );
      final cmd = spy.commands.single as MoveLayerCommand;
      expect(cmd.layerId, 'leaf');
      expect(cmd.newParentId, 'root');
      expect(cmd.index, 2);
    });

    test('renameLayer emits a RenameLayerCommand', () {
      final spy = _SpySink();
      LayerRuntime(
        sink: spy.call,
      ).renameLayer(artboardId: 'ab', layerId: 'leaf', name: 'Renamed');
      final cmd = spy.commands.single as RenameLayerCommand;
      expect(cmd.name, 'Renamed');
    });

    test('setLayerMetadata emits a SetLayerMetadataCommand (null clears)', () {
      final spy = _SpySink();
      final r = LayerRuntime(sink: spy.call);
      r.setLayerMetadata(artboardId: 'ab', layerId: 'leaf', key: 'k', value: 1);
      r.setLayerMetadata(artboardId: 'ab', layerId: 'leaf', key: 'k');
      final set = spy.commands[0] as SetLayerMetadataCommand;
      final clear = spy.commands[1] as SetLayerMetadataCommand;
      expect(set.value, 1);
      expect(clear.value, isNull);
    });

    test('forwards the caller-provided CommandSource', () {
      final spy = _SpySink();
      LayerRuntime(sink: spy.call).renameLayer(
        artboardId: 'ab',
        layerId: 'leaf',
        name: 'N',
        source: CommandSource.tool,
      );
      expect(spy.sources.single, CommandSource.tool);
    });
  });

  group('wiring — the sink matches the frozen DocumentEngine.apply', () {
    test('DocumentEngine.apply satisfies DocumentCommandSink', () {
      final engine = DocumentEngine(document: _emptyDoc());
      // Compile-time proof the runtime forwards to the real document runtime:
      // binding engine.apply to the sink type must type-check.
      final sink = engine.apply;
      final r = LayerRuntime(sink: sink);
      // A command against a non-existent artboard is rejected by the frozen
      // reducer — proving the runtime forwards without reducing itself.
      const layer = LayerModel(id: 'l', name: 'L', kind: LayerKind.vector);
      final result = r.createLayer(artboardId: 'nope', layer: layer);
      expect(result, isA<CommandRejected>());
    });
  });

  // ------------------------------------------------------------------- M19
  // Design-node structural movement (NDH-1, Form A): this runtime is the
  // single authorized construction and emission site. It builds the frozen
  // value and forwards it — the frozen engine owns every semantic.
  group('design-node movement — the single authorized emission site', () {
    test('emits one frozen MoveDesignNodeCommand with the given operands', () {
      final spy = _SpySink();
      final result = LayerRuntime(sink: spy.call).moveDesignNode(
        artboardId: 'ab-1',
        nodeId: 'node-9',
        newParentId: 'parent-2',
        index: 3,
      );
      expect(spy.commands, hasLength(1)); // one construction, one forward
      final cmd = spy.commands.single as MoveDesignNodeCommand;
      expect(cmd.artboardId, 'ab-1');
      expect(cmd.nodeId, 'node-9');
      expect(cmd.newParentId, 'parent-2');
      expect(cmd.index, 3);
      expect(result, spy.result); // CommandResult returned verbatim
    });

    test('sibling-list reorder keeps the parent and carries the new index', () {
      final spy = _SpySink();
      final r = LayerRuntime(sink: spy.call);
      r.moveDesignNode(
        artboardId: 'ab',
        nodeId: 'n',
        newParentId: 'p',
        index: 0,
      );
      r.moveDesignNode(
        artboardId: 'ab',
        nodeId: 'n',
        newParentId: 'p',
        index: 2,
      );
      final first = spy.commands[0] as MoveDesignNodeCommand;
      final second = spy.commands[1] as MoveDesignNodeCommand;
      expect(first.newParentId, second.newParentId);
      expect(first.index, 0);
      expect(second.index, 2);
    });

    test('parent-changing movement carries the new parent', () {
      final spy = _SpySink();
      LayerRuntime(sink: spy.call).moveDesignNode(
        artboardId: 'ab',
        nodeId: 'leaf',
        newParentId: 'other',
        index: 1,
      );
      final cmd = spy.commands.single as MoveDesignNodeCommand;
      expect(cmd.nodeId, 'leaf');
      expect(cmd.newParentId, 'other');
      expect(cmd.index, 1);
    });

    test('forwards the caller-provided source and author', () {
      final spy = _SpySink();
      LayerRuntime(sink: spy.call).moveDesignNode(
        artboardId: 'ab',
        nodeId: 'n',
        newParentId: 'p',
        index: 0,
        source: CommandSource.tool,
        author: 'panel',
      );
      expect(spy.sources.single, CommandSource.tool);
      expect(spy.authors.single, 'panel');
    });
    test('identical intent builds an identical frozen command value', () {
      final a = _SpySink();
      final b = _SpySink();
      LayerRuntime(sink: a.call).moveDesignNode(
        artboardId: 'ab',
        nodeId: 'n',
        newParentId: 'p',
        index: 4,
      );
      LayerRuntime(sink: b.call).moveDesignNode(
        artboardId: 'ab',
        nodeId: 'n',
        newParentId: 'p',
        index: 4,
      );
      expect(a.commands.single, b.commands.single); // deterministic value
    });

    test('emission holds no state and leaves layer emission intact', () {
      final spy = _SpySink();
      final r = LayerRuntime(sink: spy.call, activeLayerId: 'grp');
      r.moveDesignNode(
        artboardId: 'ab',
        nodeId: 'n',
        newParentId: 'p',
        index: 0,
      );
      expect(r.activeLayerId, 'grp'); // no runtime state touched
      r.moveLayer(
        artboardId: 'ab',
        layerId: 'leaf',
        newParentId: 'root',
        index: 0,
      );
      expect(spy.commands[1], isA<MoveLayerCommand>()); // layer family intact
      expect(spy.commands, hasLength(2)); // no extra emission
    });
  });

  group('design-node movement — forwarded to the real frozen pipeline', () {
    test('rejection leaves document, history and dirty state inert', () {
      final engine = DocumentEngine(document: _emptyDoc());
      final before = engine.document;
      final result = LayerRuntime(sink: engine.apply).moveDesignNode(
        artboardId: 'no-such-artboard',
        nodeId: 'n',
        newParentId: 'p',
        index: 0,
      );
      expect(result, isA<CommandRejected>()); // the frozen reducer decided
      expect(engine.document, same(before)); // no mutation at all
      expect(engine.document.history.entries, isEmpty); // no history entry
      expect(engine.isDirty, isFalse);
      expect(engine.canUndo, isFalse);
      expect(engine.canRedo, isFalse);
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
