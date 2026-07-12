import 'package:core_document/core_document.dart';
import 'package:core_layer/core_layer.dart';
import 'package:core_lock/core_lock.dart';
import 'package:core_mask/core_mask.dart';
import 'package:core_textile/core_textile.dart';
import 'package:test/test.dart';
import 'support/fixtures.dart';

/// Wire freezes (ADR-0014): append-only; changes require an ADR.
void main() {
  test('DocumentStatus wire names are frozen — the nine states', () {
    expect(DocumentStatus.values.map((v) => v.wireName), [
      'clean',
      'dirty',
      'modified',
      'saving',
      'loading',
      'recovered',
      'read_only',
      'locked',
      'archived',
    ]);
  });

  test('CommandSource, rejection reasons, asset and export vocabularies', () {
    expect(CommandSource.values.map((v) => v.wireName), [
      'user',
      'tool',
      'ai',
      'plugin',
      'system',
    ]);
    expect(CommandRejectionReason.values.map((v) => v.wireName), [
      'locked',
      'not_found',
      'invalid',
      'status_refuses_mutation',
      'missing_provenance',
    ]);
    expect(AssetKind.values.map((v) => v.wireName), [
      'image',
      'motif',
      'pattern',
      'texture',
      'reference_photo',
      'generated',
      'imported',
      'vector',
    ]);
    expect(AssetSource.values.map((v) => v.wireName), [
      'imported',
      'generated',
      'library',
      'capture',
    ]);
    expect(ExportFormat.values.map((v) => v.wireName), [
      'png',
      'jpg',
      'pdf',
      'tiff',
      'svg',
      'psd_bridge',
      'print_package',
    ]);
  });

  test('the frozen format name and schema constants', () {
    expect(DocumentManifest.formatName, 'febric');
    expect(DocumentVersion.currentSchema, 1);
    expect(DocumentVersion.minReadableSchema, 1);
  });

  test('NodeCapability wire names are frozen — the twelve capabilities', () {
    expect(NodeCapability.values.map((v) => v.wireName), [
      'lock',
      'hide',
      'rename',
      'duplicate',
      'import',
      'export',
      'ai_generate',
      'ai_modify',
      'ai_replace',
      'ai_recolour',
      'repeat',
      'version_history',
    ]);
    expect(
      () => NodeCapability.fromWireName('unknown'),
      throwsArgumentError,
    );
  });

  test('the capability matrix rows are frozen (Architecture V2 §4.2)', () {
    Set<String> row(DesignNodeType type) => NodeCapabilityMatrix.capabilitiesOf(
      type,
    ).map((c) => c.wireName).toSet();

    expect(row(DesignNodeType.project), {
      'lock',
      'rename',
      'duplicate',
      'import',
      'export',
      'version_history',
    });
    expect(row(DesignNodeType.artwork), {
      'lock',
      'rename',
      'duplicate',
      'import',
      'export',
      'ai_recolour',
      'version_history',
    });
    for (final type in [DesignNodeType.garment, DesignNodeType.garmentPart]) {
      expect(
        row(type),
        NodeCapability.values.map((c) => c.wireName).toSet()..remove('repeat'),
        reason: 'structural nodes: everything except repeat',
      );
    }
    for (final type in [
      DesignNodeType.zone,
      DesignNodeType.element,
      DesignNodeType.group,
    ]) {
      expect(row(type), NodeCapability.values.map((c) => c.wireName).toSet());
    }
  });

  test('every DocumentCommand variant JSON round-trips', () {
    final commands = <DocumentCommand>[
      DocumentCommand.createArtboard(artboard: artboard()),
      const DocumentCommand.deleteArtboard(artboardId: 'ab-1'),
      const DocumentCommand.createLayer(
        artboardId: 'ab-1',
        parentLayerId: 'p',
        layer: LayerModel(id: 'l', name: 'L', kind: LayerKind.pattern),
        index: 0,
      ),
      const DocumentCommand.deleteLayer(artboardId: 'ab-1', layerId: 'l'),
      const DocumentCommand.moveLayer(
        artboardId: 'ab-1',
        layerId: 'l',
        newParentId: 'p2',
        index: 1,
      ),
      const DocumentCommand.renameLayer(
        artboardId: 'ab-1',
        layerId: 'l',
        name: 'New',
      ),
      const DocumentCommand.setLayerMetadata(
        artboardId: 'ab-1',
        layerId: 'l',
        key: 'colour',
        value: '#8C2B4A',
      ),
      const DocumentCommand.importAsset(
        asset: AssetRecord(
          id: 'a',
          name: 'A',
          kind: AssetKind.motif,
          source: AssetSource.generated,
          hash: 'h',
        ),
      ),
      const DocumentCommand.removeAsset(assetId: 'a'),
      const DocumentCommand.applyMask(
        targetId: 't',
        stack: MaskStack(targetId: 't'),
      ),
      const DocumentCommand.removeMask(targetId: 't'),
      DocumentCommand.updateMetadata(metadata: emptyDocument().metadata),
      const DocumentCommand.updateSettings(settings: DocumentSettings()),
      const DocumentCommand.updateToolState(
        state: ToolStateExtension(toolId: 'repeat_pattern'),
      ),
      const DocumentCommand.changeColour(
        artboardId: 'ab-1',
        layerId: 'l',
        operation: ColourOperation.paletteSwap,
        colourHex: '#000000',
      ),
      const DocumentCommand.repeatPattern(
        artboardId: 'ab-1',
        layerId: 'l',
        repeat: RepeatType.mirror,
      ),
      const DocumentCommand.setLock(
        lock: LockState(scope: LockScope.export, targetId: 'ab-1'),
      ),
      const DocumentCommand.releaseLock(
        scope: LockScope.export,
        targetId: 'ab-1',
      ),
      const DocumentCommand.updatePluginData(
        pluginId: 'com.studio.plugin',
        data: {'k': 'v'},
      ),
      const DocumentCommand.custom(
        namespace: 'com.studio.plugin',
        kind: 'annotation',
        payload: {'note': 'n'},
        affectedIds: ['x'],
      ),
      const DocumentCommand.createDesignNode(
        artboardId: 'ab-1',
        parentNodeId: 'p',
        node: DesignNode(id: 'n', name: 'N', type: DesignNodeType.zone),
        index: 0,
      ),
      const DocumentCommand.deleteDesignNode(artboardId: 'ab-1', nodeId: 'n'),
      const DocumentCommand.moveDesignNode(
        artboardId: 'ab-1',
        nodeId: 'n',
        newParentId: 'p2',
        index: 1,
      ),
      const DocumentCommand.renameDesignNode(
        artboardId: 'ab-1',
        nodeId: 'n',
        name: 'New',
      ),
      const DocumentCommand.setNodeVisibility(
        artboardId: 'ab-1',
        nodeId: 'n',
        visible: false,
      ),
      const DocumentCommand.setNodeLocked(
        artboardId: 'ab-1',
        nodeId: 'n',
        locked: true,
      ),
      const DocumentCommand.setNodeMetadata(
        artboardId: 'ab-1',
        nodeId: 'n',
        key: 'instance',
        value: 'left',
      ),
      const DocumentCommand.duplicateDesignNode(
        artboardId: 'ab-1',
        sourceNodeId: 'n',
        duplicate: DesignNode(id: 'n2', name: 'N', type: DesignNodeType.zone),
      ),
    ];

    for (final command in commands) {
      expect(
        DocumentCommand.fromJson(command.toJson()),
        command,
        reason: command.runtimeType.toString(),
      );
    }
    // Textile enums travel by frozen wire name.
    expect(
      const DocumentCommand.repeatPattern(
        artboardId: 'a',
        layerId: 'l',
        repeat: RepeatType.customOffset,
      ).toJson()['repeat'],
      'custom_offset',
    );
  });
}
