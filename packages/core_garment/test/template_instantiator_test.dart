import 'package:core_common/core_common.dart';
import 'package:core_document/core_document.dart';
import 'package:core_garment/core_garment.dart';
import 'package:core_geometry/core_geometry.dart';
import 'package:core_layer/core_layer.dart';
import 'package:core_textile/core_textile.dart';
import 'package:test/test.dart';

import 'garment_schema_test.dart' show kurtaSchema;
import 'garment_template_test.dart' show kurtaTemplate;

/// M13G verification suite — RegistryTemplateInstantiator (the approved
/// Q2/Q4/Q7 rulings): a pure binder emitting one existing frozen
/// `createDesignNode` command per instantiation. The final group lands a
/// command on a real DocumentEngine (undo round-trip included).
void main() {
  group('resolution — frozen null-returning lookup shape', () {
    test('unregistered template → null', () {
      final h = _Harness();
      expect(h.instantiate('absent'), isNull);
    });

    test('registered template with unregistered schemaRef → null', () {
      final h = _Harness(registerSchema: false);
      expect(h.instantiate('kurta-classic-test'), isNull);
    });
  });

  group('fragment selection — starter whole OR schema skeleton, '
      'never both', () {
    test('a template without starterDesign derives the M13F skeleton', () {
      final h = _Harness(starter: false);
      final command = h.instantiate('kurta-bare-test')!;
      final root = command.node;
      expect(root.type, DesignNodeType.garment);
      expect(root.metadata['garment_type'], 'kurta');
      // The kurta fixture: 2 sleeves + 1 base — exactly one structure.
      expect(root.children, hasLength(3));
      expect(root.children.map((n) => n.metadata['part']), [
        'sleeve',
        'sleeve',
        'base',
      ]);
    });

    test('a template with starterDesign instantiates the starter whole — '
        'no skeleton parts are added', () {
      final h = _Harness();
      final command = h.instantiate('kurta-classic-test')!;
      final root = command.node;
      expect(root.name, 'Classic Kurta');
      // The starter carries ONE part; the schema declares three instances.
      // Whole-fragment use means the starter structure only.
      expect(root.children, hasLength(1));
      expect(root.children.single.metadata['part'], 'base');
      // Authored content survives re-identification verbatim.
      final zone = root.children.single.children.single;
      expect(zone.metadata['zone_slot'], 'field');
      expect(zone.metadata['asset_refs'], ['asset-motif-1']);
    });
  });

  group('re-identification — the frozen cloneWithIds/IdGenerator seam '
      '(Q4 deep copy)', () {
    test('every emitted id is freshly minted; authoring-time ids '
        'never land', () {
      final h = _Harness();
      final command = h.instantiate('kurta-classic-test')!;
      final ids = command.node.descendantsAndSelf.map((n) => n.id).toList();
      expect(ids, everyElement(startsWith('n-')));
      expect(ids, isNot(contains('starter-root')));
      expect(ids.toSet(), hasLength(ids.length)); // all unique
    });

    test('double instantiation of one template through one session '
        'generator yields disjoint id sets (collision-free under the '
        'reducer freshness check)', () {
      final h = _Harness();
      final session = SequentialIdGenerator(prefix: 'n');
      final first = h.instantiator.instantiate(
        'kurta-classic-test',
        artboardId: 'ab-1',
        ids: session,
      )!;
      final second = h.instantiator.instantiate(
        'kurta-classic-test',
        artboardId: 'ab-1',
        ids: session,
      )!;
      final firstIds = first.node.descendantsAndSelf.map((n) => n.id).toSet();
      final secondIds = second.node.descendantsAndSelf.map((n) => n.id).toSet();
      expect(firstIds.intersection(secondIds), isEmpty);
    });

    test('deterministic: same registry content + fresh generators → '
        'identical commands', () {
      final a = _Harness().instantiate('kurta-classic-test');
      final b = _Harness().instantiate('kurta-classic-test');
      expect(a, b);
    });
  });

  group('the Q7 linkage stamp — schema_id/schema_version on the root '
      'only', () {
    test('both fragment sources are stamped identically', () {
      final starter = _Harness().instantiate('kurta-classic-test')!;
      final skeleton = _Harness(starter: false).instantiate('kurta-bare-test')!;
      for (final root in [starter.node, skeleton.node]) {
        expect(root.metadata['schema_id'], 'kurta-test-v1');
        expect(root.metadata['schema_version'], 1);
      }
      // Root only — no descendant carries the stamp.
      for (final node in starter.node.descendantsAndSelf.skip(1)) {
        expect(node.metadata.containsKey('schema_id'), isFalse);
      }
    });

    test('no template_id is stamped (the approved minimality)', () {
      final command = _Harness().instantiate('kurta-classic-test')!;
      for (final node in command.node.descendantsAndSelf) {
        expect(node.metadata.containsKey('template_id'), isFalse);
      }
    });
  });

  group('emission — Q2: one existing frozen command, applied by the '
      'caller on the frozen paths', () {
    test('the command targets the caller-supplied artboard/parent/index', () {
      final h = _Harness();
      final command = h.instantiator.instantiate(
        'kurta-classic-test',
        artboardId: 'ab-1',
        parentNodeId: 'ab-1-tree',
        index: 0,
        ids: SequentialIdGenerator(prefix: 'n'),
      )!;
      expect(command.artboardId, 'ab-1');
      expect(command.parentNodeId, 'ab-1-tree');
      expect(command.index, 0);
    });

    test('landing proof: a real DocumentEngine applies the command as ONE '
        'undoable step; SemanticPath resolves the instance; undo removes '
        'the whole subtree', () {
      final h = _Harness(starter: false);
      final engine = DocumentEngine(
        document: _docWithArtboard(),
        clock: FixedClock(_t0),
        historyIds: SequentialIdGenerator(prefix: 'h'),
      );
      final command = h.instantiate('kurta-bare-test')!;

      final result = engine.apply(command);
      expect(result, isA<CommandApplied>());

      // The instance lives under the artboard's design root.
      final tree = engine.document.artboards.single.designTreeRoot;
      final garment = tree.children.single;
      expect(garment.type, DesignNodeType.garment);
      expect(garment.metadata['schema_id'], 'kurta-test-v1');

      // The frozen resolver reads what the binder landed — the blueprint's
      // canonical grammar from the artboard root (the first segment
      // matches the root itself).
      final left = SemanticPath.parse(
        'artwork.kurta.sleeve[left]',
      ).resolve(tree);
      expect(left, hasLength(1));

      // One history entry: a single undo removes the WHOLE subtree.
      expect(engine.undo(), isA<CommandApplied>());
      expect(engine.document.artboards.single.designTreeRoot.children, isEmpty);
      // And a single redo restores it.
      expect(engine.redo(), isA<CommandApplied>());
      expect(
        engine
            .document
            .artboards
            .single
            .designTreeRoot
            .children
            .single
            .metadata['garment_type'],
        'kurta',
      );
    });
  });
}

// ---------------------------------------------------------------------------
// Fixtures (real frozen contracts; all content test-supplied).
// ---------------------------------------------------------------------------

final DateTime _t0 = DateTime.utc(2026, 7, 22, 9);

final class _Harness {
  _Harness({bool starter = true, bool registerSchema = true}) {
    if (registerSchema) {
      registry.registerSchema(kurtaSchema());
    }
    registry.registerTemplate(
      starter
          ? kurtaTemplate()
          : const GarmentTemplate(
              id: 'kurta-bare-test',
              schemaRef: 'kurta-test-v1',
            ),
    );
    instantiator = RegistryTemplateInstantiator(registry: registry);
  }

  final registry = GarmentTemplateRegistryImpl();
  late final RegistryTemplateInstantiator instantiator;

  CreateDesignNodeCommand? instantiate(String templateId) {
    return instantiator.instantiate(
      templateId,
      artboardId: 'ab-1',
      ids: SequentialIdGenerator(prefix: 'n'),
    );
  }
}

FebricDocument _docWithArtboard() => FebricDocument(
  id: const DocumentId('doc-1'),
  projectId: const ProjectId('project-1'),
  manifest: const DocumentManifest(
    version: DocumentVersion(
      schema: DocumentVersion.currentSchema,
      generator: 'febric-test',
    ),
  ),
  metadata: DocumentMetadata(
    title: 'M13G Library',
    author: 'designer-1',
    createdAt: _t0,
    modifiedAt: _t0,
  ),
  artboards: [
    const Artboard(
      id: 'ab-1',
      name: 'Front Panel',
      size: Size2D(width: 1200, height: 1800),
      dpi: 300,
      backgroundColourHex: '#F0EADD',
      layerRoot: LayerModel(
        id: 'ab-1-layers',
        name: 'Layers',
        kind: LayerKind.artboard,
      ),
      designTreeRoot: DesignNode(
        id: 'ab-1-tree',
        name: 'Artwork Root',
        type: DesignNodeType.artwork,
      ),
    ),
  ],
);
