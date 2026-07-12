import 'package:core_ai/core_ai.dart';
import 'package:core_document/core_document.dart';
import 'package:core_interaction/core_interaction.dart';
import 'package:core_layer/core_layer.dart';
import 'package:core_lock/core_lock.dart';
import 'package:core_textile/core_textile.dart';
import 'package:test/test.dart';
import 'support/fixtures.dart';

void main() {
  group('frozen pipeline: Lock → Validation → History → Document', () {
    test('applied commands increment revision and record full history', () {
      final e = engine();
      final result = e.apply(
        const DocumentCommand.createLayer(
          artboardId: 'ab-1',
          parentLayerId: 'ab-1-motifs',
          layer: LayerModel(
            id: 'l-new',
            name: 'Border',
            kind: LayerKind.pattern,
          ),
        ),
        author: 'designer-1',
        source: CommandSource.tool,
      );

      expect(result, isA<CommandApplied>());
      expect(e.document.revision.value, 1);
      final entry = e.document.history.entries.single;
      expect(entry.author, 'designer-1');
      expect(entry.source, CommandSource.tool);
      expect(entry.timestamp, t0);
      expect(entry.revision, 1);
      expect(entry.affectedIds, contains('l-new'));
      expect(entry.inverse, isA<DeleteLayerCommand>());
      expect(e.document.layerRegistry.containsKey('l-new'), isTrue);
      expect(e.status, DocumentStatus.modified);
      expect(e.isDirty, isTrue);
    });

    test('validation failures leave the document untouched', () {
      final e = engine();
      final before = e.document;
      final result = e.apply(
        const DocumentCommand.deleteLayer(artboardId: 'ab-1', layerId: 'ghost'),
      );
      expect(
        result,
        const CommandResult.rejected(reason: CommandRejectionReason.notFound),
      );
      expect(e.document, same(before));
      expect(e.document.history.entries, isEmpty);
    });

    test('the layer root is not deletable', () {
      final e = engine();
      final result = e.apply(
        const DocumentCommand.deleteLayer(
          artboardId: 'ab-1',
          layerId: 'ab-1-layers',
        ),
      );
      expect(result, isA<CommandRejected>());
    });
  });

  group('lock engine gating (invariant I4 — no bypass)', () {
    test('a targeted layer lock blocks mutation and surfaces the reason', () {
      final e = engine();
      e.apply(
        const DocumentCommand.setLock(
          lock: LockState(
            scope: LockScope.layer,
            targetId: 'ab-1-hero',
            origin: LockOrigin.review,
            reason: 'Approved by merchandiser',
          ),
        ),
      );

      final result = e.apply(
        const DocumentCommand.renameLayer(
          artboardId: 'ab-1',
          layerId: 'ab-1-hero',
          name: 'Renamed',
        ),
      );
      expect(result, isA<CommandRejected>());
      final rejected = result as CommandRejected;
      expect(rejected.reason, CommandRejectionReason.locked);
      expect(rejected.blockedBy!.reason, 'Approved by merchandiser');

      // Sibling layers stay editable.
      expect(
        e.apply(
          const DocumentCommand.renameLayer(
            artboardId: 'ab-1',
            layerId: 'ab-1-motifs',
            name: 'Motif Group',
          ),
        ),
        isA<CommandApplied>(),
      );
    });

    test('a global document lock blocks content, asset and layer commands', () {
      final e = engine();
      e.apply(
        const DocumentCommand.setLock(
          lock: LockState(scope: LockScope.document),
        ),
      );
      expect(
        e.apply(
          const DocumentCommand.importAsset(
            asset: AssetRecord(
              id: 'a-1',
              name: 'Paisley',
              kind: AssetKind.motif,
              source: AssetSource.imported,
              hash: 'sha256:1',
            ),
          ),
        ),
        isA<CommandRejected>(),
      );
      expect(
        e.apply(
          const DocumentCommand.renameLayer(
            artboardId: 'ab-1',
            layerId: 'ab-1-hero',
            name: 'X',
          ),
        ),
        isA<CommandRejected>(),
        reason: 'document lock implies layer scope via the frozen hierarchy',
      );
    });

    test('history lock refuses every new command', () {
      final e = engine();
      e.apply(
        const DocumentCommand.setLock(
          lock: LockState(scope: LockScope.history),
        ),
      );
      final result = e.apply(
        const DocumentCommand.renameLayer(
          artboardId: 'ab-1',
          layerId: 'ab-1-hero',
          name: 'X',
        ),
      );
      expect((result as CommandRejected).reason, CommandRejectionReason.locked);
    });

    test('undo lock freezes traversal but not new work', () {
      final e = engine();
      e.apply(
        const DocumentCommand.renameLayer(
          artboardId: 'ab-1',
          layerId: 'ab-1-hero',
          name: 'A',
        ),
      );
      e.apply(
        const DocumentCommand.setLock(lock: LockState(scope: LockScope.undo)),
      );
      expect(
        (e.undo() as CommandRejected).reason,
        CommandRejectionReason.locked,
      );
      expect(
        e.apply(
          const DocumentCommand.renameLayer(
            artboardId: 'ab-1',
            layerId: 'ab-1-hero',
            name: 'B',
          ),
        ),
        isA<CommandApplied>(),
      );
    });

    test('locks themselves are commands: auditable and undoable', () {
      final e = engine();
      e.apply(
        const DocumentCommand.setLock(lock: LockState(scope: LockScope.ai)),
      );
      expect(e.document.locks.isLocked(LockScope.ai), isTrue);
      e.undo();
      expect(e.document.locks.isLocked(LockScope.ai), isFalse);
      e.redo();
      expect(e.document.locks.isLocked(LockScope.ai), isTrue);
    });
  });

  group('command-based undo/redo (no snapshots)', () {
    test('inverses restore structure exactly across command kinds', () {
      final e = engine();
      final original = e.document;

      e.apply(
        const DocumentCommand.createLayer(
          artboardId: 'ab-1',
          parentLayerId: 'ab-1-motifs',
          layer: LayerModel(id: 'l-2', name: 'Filler', kind: LayerKind.pattern),
          index: 0,
        ),
      );
      e.apply(
        const DocumentCommand.moveLayer(
          artboardId: 'ab-1',
          layerId: 'ab-1-hero',
          newParentId: 'ab-1-layers',
          index: 0,
        ),
      );
      e.apply(
        const DocumentCommand.renameLayer(
          artboardId: 'ab-1',
          layerId: 'l-2',
          name: 'Filler Motif',
        ),
      );

      e.undo();
      e.undo();
      e.undo();

      expect(
        e.document.artboards.single.layerRoot,
        original.artboards.single.layerRoot,
        reason: 'three inverses restore the exact original tree',
      );
      expect(e.canUndo, isFalse);
      expect(e.canRedo, isTrue);

      e.redo();
      e.redo();
      e.redo();
      expect(e.document.layerRegistry['l-2']!.name, 'Filler Motif');
      expect(e.canRedo, isFalse);
    });

    test('a new command truncates the redo branch', () {
      final e = engine();
      e.apply(
        const DocumentCommand.renameLayer(
          artboardId: 'ab-1',
          layerId: 'ab-1-hero',
          name: 'A',
        ),
      );
      e.undo();
      e.apply(
        const DocumentCommand.renameLayer(
          artboardId: 'ab-1',
          layerId: 'ab-1-hero',
          name: 'B',
        ),
      );
      expect(e.canRedo, isFalse);
      expect(e.document.layerRegistry['ab-1-hero']!.name, 'B');
    });

    test('deleting a subtree restores children on undo', () {
      final e = engine();
      e.apply(
        const DocumentCommand.deleteLayer(
          artboardId: 'ab-1',
          layerId: 'ab-1-motifs',
        ),
      );
      expect(e.document.layerRegistry.containsKey('ab-1-hero'), isFalse);
      e.undo();
      expect(e.document.layerRegistry.containsKey('ab-1-hero'), isTrue);
      expect(
        e.document.artboards.single.layerRoot.children.single.id,
        'ab-1-motifs',
      );
    });
  });

  group('textile operation commands record onto layers', () {
    test(
      'changeColour and repeatPattern write metadata and invert exactly',
      () {
        final e = engine();
        e.apply(
          const DocumentCommand.changeColour(
            artboardId: 'ab-1',
            layerId: 'ab-1-hero',
            operation: ColourOperation.shiftMotifColour,
            colourHex: '#8C2B4A',
          ),
        );
        e.apply(
          const DocumentCommand.repeatPattern(
            artboardId: 'ab-1',
            layerId: 'ab-1-hero',
            repeat: RepeatType.halfDrop,
            parameters: {'offset': 0.5},
          ),
        );
        final hero = e.document.layerRegistry['ab-1-hero']!;
        expect(hero.metadata['colour'], '#8C2B4A');
        expect(hero.metadata['repeat'], {'type': 'half_drop', 'offset': 0.5});

        e.undo();
        e.undo();
        final restored = e.document.layerRegistry['ab-1-hero']!;
        expect(restored.metadata.containsKey('colour'), isFalse);
        expect(restored.metadata.containsKey('repeat'), isFalse);
      },
    );
  });

  group('AI discipline (frozen rules 4 + I5)', () {
    test('AI-sourced commands without provenance are refused', () {
      final e = engine();
      final result = e.apply(
        const DocumentCommand.renameLayer(
          artboardId: 'ab-1',
          layerId: 'ab-1-hero',
          name: 'AI Rename',
        ),
        source: CommandSource.ai,
      );
      expect(
        (result as CommandRejected).reason,
        CommandRejectionReason.missingProvenance,
      );
      expect(e.document.revision.value, 0);
    });

    test('AI commands with provenance land with revision and targets', () {
      final e = engine();
      final result = e.apply(
        const DocumentCommand.renameLayer(
          artboardId: 'ab-1',
          layerId: 'ab-1-hero',
          name: 'Refined Paisley',
        ),
        source: CommandSource.ai,
        provenance: provenance(),
      );
      expect(result, isA<CommandApplied>());
      final record = e.document.aiProvenance.single;
      expect(record.provider, AiProviderId.claude);
      expect(record.revision, 1);
      expect(record.affectedIds, contains('ab-1-hero'));
      expect(record.promptHash, 'sha256:abc123');
    });
  });

  group('tool-agnostic tool state (frozen rules 3 + 6)', () {
    test('tools persist through envelopes; unknown tools need no schema', () {
      final e = engine();
      e.apply(
        DocumentCommand.updateToolState(
          state: ToolStateExtension(
            toolId: FebricTool.repeatPattern.wireName,
            data: const {'lastRepeat': 'half_drop'},
          ),
        ),
      );
      e.apply(
        const DocumentCommand.updateToolState(
          state: ToolStateExtension(
            toolId: 'com.future.tool-that-does-not-exist-yet',
            version: 3,
            data: {'anything': true},
          ),
        ),
      );
      expect(e.document.toolStates.length, 2);
      expect(
        e.document.toolStates['repeat_pattern']!.data['lastRepeat'],
        'half_drop',
      );
    });

    test('custom commands isolate into their namespace and invert', () {
      final e = engine();
      e.apply(
        const DocumentCommand.custom(
          namespace: 'com.studio.plugin',
          kind: 'annotation',
          payload: {'note': 'check hem scale'},
          affectedIds: ['ab-1-hero'],
        ),
        source: CommandSource.plugin,
      );
      expect(e.document.pluginData['com.studio.plugin']!['annotation'], {
        'note': 'check hem scale',
      });
      e.undo();
      expect(
        e.document.pluginData['com.studio.plugin']!['annotation'],
        anyOf(isNull, isEmpty),
      );
    });
  });

  group('runtime status', () {
    test('read-only refuses mutations; saved clears dirty', () {
      final e = engine();
      e.apply(
        const DocumentCommand.renameLayer(
          artboardId: 'ab-1',
          layerId: 'ab-1-hero',
          name: 'X',
        ),
      );
      expect(e.isDirty, isTrue);
      e.markSaving();
      expect(e.status, DocumentStatus.saving);
      e.markSaved();
      expect(e.status, DocumentStatus.clean);
      expect(e.isDirty, isFalse);

      e.setReadOnly(readOnly: true);
      final result = e.apply(
        const DocumentCommand.renameLayer(
          artboardId: 'ab-1',
          layerId: 'ab-1-hero',
          name: 'Y',
        ),
      );
      expect(
        (result as CommandRejected).reason,
        CommandRejectionReason.statusRefusesMutation,
      );
      e.setReadOnly(readOnly: false);
      expect(e.status, DocumentStatus.clean);
    });

    test('viewport persistence round-trips through a command', () {
      final e = engine();
      final viewport = WorkspaceViewportState(
        workspaceId: WorkspaceCategory.canvas.wireName,
        artboardId: 'ab-1',
        viewport: ViewportState(
          canvasSize: e.document.artboards.single.size,
          screenSize: const Size2D(width: 1440, height: 900),
          zoom: 1.5,
        ),
        activeTool: FebricTool.repeatPattern,
      );
      e.apply(DocumentCommand.updateViewport(viewport: viewport));
      expect(e.document.viewports['canvas']!.viewport.zoom, 1.5);
      expect(
        e.document.viewports['canvas']!.activeTool,
        FebricTool.repeatPattern,
      );
    });
  });
}
