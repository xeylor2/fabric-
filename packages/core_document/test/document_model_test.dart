import 'package:core_document/core_document.dart';
import 'package:core_interaction/core_interaction.dart';
import 'package:core_lock/core_lock.dart';
import 'package:core_mask/core_mask.dart';
import 'package:test/test.dart';
import 'support/fixtures.dart';

void main() {
  group('identifiers', () {
    test('serialize as bare values and stay typed', () {
      expect(const DocumentId('d1').toJson(), 'd1');
      expect(DocumentId.fromJson('d1'), const DocumentId('d1'));
      expect(const RevisionId(4).next, const RevisionId(5));
      expect(RevisionId.initial.value, 0);
    });
  });

  group('FebricDocument', () {
    test('a fully loaded document JSON round-trips losslessly', () {
      final doc = documentWithArtboard().copyWith(
        assets: AssetRegistry.empty.withAsset(
          const AssetRecord(
            id: 'a-1',
            name: 'Boteh',
            kind: AssetKind.motif,
            source: AssetSource.library,
            hash: 'sha256:9',
            tags: ['paisley'],
            usageRefs: ['ab-1-hero'],
          ),
        ),
        masks: {
          'ab-1-hero': const MaskStack(
            targetId: 'ab-1-hero',
            entries: [
              MaskStackEntry(
                mask: MaskModel(
                  id: 'm-1',
                  name: 'Neck cutout',
                  kind: MaskKind.vectorMask,
                ),
              ),
            ],
          ),
        },
        locks: const LockSet(
          locks: [LockState(scope: LockScope.ai, origin: LockOrigin.policy)],
        ),
        toolStates: const {
          'repeat_pattern': ToolStateExtension(
            toolId: 'repeat_pattern',
            data: {'lastRepeat': 'half_drop'},
          ),
        },
        viewports: {
          'canvas': const WorkspaceViewportState(
            workspaceId: 'canvas',
            artboardId: 'ab-1',
            viewport: ViewportState(
              canvasSize: Size2D(width: 1200, height: 1800),
              screenSize: Size2D(width: 1440, height: 900),
              zoom: 0.5,
            ),
          ),
        },
        aiProvenance: [provenance()],
        pluginData: const {
          'com.studio.notes': {
            'annotation': {'note': 'check hem'},
          },
        },
        exportProfiles: const [
          ExportProfile(
            id: 'x-1',
            name: 'Production TIFF',
            format: ExportFormat.tiff,
            dpi: 300,
          ),
        ],
        colourProfiles: const [
          ColourProfile(id: 'c-1', name: 'FOGRA39', space: 'cmyk_fogra39'),
        ],
      );

      final restored = FebricDocument.fromJson(doc.toJson());
      expect(restored, doc);
      expect(restored.toJson(), doc.toJson());
    });

    test('layerRegistry indexes every layer across artboards', () {
      final doc = documentWithArtboard().copyWith(
        artboards: [
          artboard(),
          artboard(id: 'ab-2'),
        ],
      );
      final registry = doc.layerRegistry;
      expect(registry.length, 6);
      expect(registry['ab-2-hero']!.name, 'Hero Paisley');
    });

    test('statistics are derived from live content', () {
      final doc = documentWithArtboard();
      final stats = doc.statistics;
      expect(stats.artboards, 1);
      expect(stats.layers, 3);
      expect(stats.designNodes, 1);
      expect(stats.assets, 0);
      expect(stats.revision, 0);
    });
  });

  group('history model', () {
    test('undo/redo stacks derive from the cursor', () {
      final entryA = HistoryEntry(
        id: 'h1',
        command: const DocumentCommand.removeMask(targetId: 't'),
        inverse: const DocumentCommand.removeMask(targetId: 't'),
        timestamp: t0,
        author: 'a',
        source: CommandSource.user,
        revision: 1,
      );
      var history = DocumentHistory.empty.append(entryA, maxEntries: 10);
      expect(history.undoStack.length, 1);
      expect(history.redoStack, isEmpty);
      history = history.undone();
      expect(history.undoStack, isEmpty);
      expect(history.redoStack.length, 1);
    });

    test('history is bounded by maxEntries', () {
      var history = DocumentHistory.empty;
      for (var i = 0; i < 20; i++) {
        history = history.append(
          HistoryEntry(
            id: 'h$i',
            command: DocumentCommand.removeMask(targetId: 't$i'),
            inverse: DocumentCommand.removeMask(targetId: 't$i'),
            timestamp: t0,
            author: 'a',
            source: CommandSource.user,
            revision: i,
          ),
          maxEntries: 5,
        );
      }
      expect(history.entries.length, 5);
      expect(history.entries.first.id, 'h15');
    });
  });
}
