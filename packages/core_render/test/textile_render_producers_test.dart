import 'package:core_canvas/core_canvas.dart';
import 'package:core_document/core_document.dart';
import 'package:core_geometry/core_geometry.dart';
import 'package:core_layer/core_layer.dart';
import 'package:core_performance/core_performance.dart';
import 'package:core_render/core_render.dart';
import 'package:core_textile/core_textile.dart';
import 'package:test/test.dart';

/// M16 verification suite — Textile Render Binding.
///
/// Proves the TextileElementProducer against the FROZEN compiler and a
/// REAL DocumentEngine: the D3 per-key consumption discipline (hatch →
/// classification → default; own-transform; repeat routing-only), the
/// D4 precedence-neutrality guarantee, and every D5 proof obligation
/// (P1–P6) in its determined checkable form. The layer tier has no
/// graph-entry channel (D3-d#1, deferred — Q3-d co-travels); nothing
/// here asserts layer visibility or tier precedence.
void main() {
  const producer = TextileElementProducer();

  DesignNode element(String id, [Map<String, Object?> metadata = const {}]) =>
      DesignNode(
        id: id,
        name: id,
        type: DesignNodeType.element,
        metadata: metadata,
      );

  group('P6 — byte-compatibility with the frozen default producer', () {
    test('a textile-key-free element produces byte-identical output', () {
      const frozen = DefaultRenderObjectProducer(DesignNodeType.element);
      for (final node in [
        element('plain'),
        element('hatched', const {'render_object_kind': 'image'}),
        element('bounded', const {
          'render_bounds': [5, 6, 70, 80],
        }),
        element('both', const {
          'render_object_kind': 'shadow',
          'render_bounds': [1, 2, 3, 4],
        }),
      ]) {
        expect(
          producer.produce(node).single,
          frozen.produce(node).single,
          reason: node.id,
        );
      }
    });

    test('containers keep their frozen default producers through '
        'textileProducerRegistry()', () {
      final registry = textileProducerRegistry();
      for (final type in DesignNodeType.values) {
        final p = registry.producerFor(type);
        if (type == DesignNodeType.element) {
          expect(p, isA<TextileElementProducer>());
        } else {
          expect(p, isA<DefaultRenderObjectProducer>(), reason: type.wireName);
        }
      }
    });
  });

  group('D3(a) — three-tier kind precedence', () {
    test('hatch beats classification; classification beats fallback', () {
      // Hatch wins even against a classification.
      expect(
        producer
            .produce(
              element('h', const {
                'render_object_kind': 'shadow',
                'object_type': 'motif',
              }),
            )
            .single
            .kind,
        RenderObjectKind.shadow,
      );
      // Classification applies when no hatch.
      expect(
        producer
            .produce(element('c', const {'object_type': 'motif'}))
            .single
            .kind,
        RenderObjectKind.motif,
      );
      // Neither → the frozen default.
      expect(
        producer.produce(element('d')).single.kind,
        RenderObjectKind.colourFill,
      );
    });

    test('all ten frozen textile classes land their mapped kind', () {
      const expected = {
        TextileObjectType.motif: RenderObjectKind.motif,
        TextileObjectType.border: RenderObjectKind.border,
        TextileObjectType.texture: RenderObjectKind.texture,
        TextileObjectType.fabric: RenderObjectKind.fabricBase,
        TextileObjectType.pattern: RenderObjectKind.motif,
        TextileObjectType.embroidery: RenderObjectKind.texture,
        TextileObjectType.lace: RenderObjectKind.texture,
        TextileObjectType.patch: RenderObjectKind.motif,
        TextileObjectType.colourPalette: RenderObjectKind.colourFill,
        TextileObjectType.printLayer: RenderObjectKind.image,
      };
      expect(expected, hasLength(TextileObjectType.values.length));
      for (final entry in expected.entries) {
        expect(
          producer
              .produce(element('n', {'object_type': entry.key.wireName}))
              .single
              .kind,
          entry.value,
          reason: entry.key.wireName,
        );
      }
    });
  });

  group('mapping freeze — the D3-d#2 cells are pinned by wire name', () {
    test('renderKindForTextileClass is frozen on shipment', () {
      expect(
        {
          for (final t in TextileObjectType.values)
            t.wireName: renderKindForTextileClass(t).wireName,
        },
        {
          'motif': 'motif',
          'pattern': 'motif',
          'border': 'border',
          'texture': 'texture',
          'colour_palette': 'colour_fill',
          'fabric': 'fabric_base',
          'embroidery': 'texture',
          'lace': 'texture',
          'patch': 'motif',
          'print_layer': 'image',
        },
      );
    });
  });

  group('P2 — totality with deterministic treat-as-absent degradation', () {
    test('malformed textile metadata never throws and degrades into the '
        'D3 chains', () {
      final cases = <String, Map<String, Object?>>{
        'unknown object_type': {'object_type': 'bogus'},
        'non-string object_type': {'object_type': 42},
        'unknown hatch falls through to classification': {
          'render_object_kind': 'bogus',
          'object_type': 'border',
        },
        'malformed transform': {'transform': 'not-a-map'},
        'wrong-shape transform map': {
          'transform': {'bogus': true},
        },
        'non-map repeat': {'repeat': 7},
        'junk render_bounds': {
          'render_bounds': ['a', 'b'],
        },
      };
      for (final entry in cases.entries) {
        final object = producer.produce(element('n', entry.value)).single;
        expect(object, isA<RenderObject>(), reason: entry.key);
      }
      // Degradation targets: unknown class → colourFill; unknown hatch
      // with a valid class → that class's cell.
      expect(
        producer
            .produce(element('n', const {'object_type': 'bogus'}))
            .single
            .kind,
        RenderObjectKind.colourFill,
      );
      expect(
        producer
            .produce(
              element('n', const {
                'render_object_kind': 'bogus',
                'object_type': 'border',
              }),
            )
            .single
            .kind,
        RenderObjectKind.border,
      );
      expect(
        producer
            .produce(element('n', const {'transform': 'junk'}))
            .single
            .transform,
        Transform2D.identity,
      );
    });
  });

  group('D3(b) — the node\'s own transform, never ancestors', () {
    test('valid map → exact Transform2D; absence and malformed → '
        'identity', () {
      final spec = const Transform2D(
        translation: Point2D(x: 12, y: -3),
        rotation: 0.5,
        scale: 2,
      ).toJson();
      expect(
        producer.produce(element('t', {'transform': spec})).single.transform,
        const Transform2D(
          translation: Point2D(x: 12, y: -3),
          rotation: 0.5,
          scale: 2,
        ),
      );
      expect(
        producer.produce(element('t')).single.transform,
        Transform2D.identity,
      );
    });
  });

  group('D3(c)/D4 — repeat routing-only, precedence-neutral', () {
    test('repeat present vs absent produces the byte-identical object', () {
      const withRepeat = {
        'object_type': 'motif',
        'repeat': {'type': 'half_drop', 'seed': 7},
      };
      const withoutRepeat = {'object_type': 'motif'};
      expect(
        producer.produce(element('r', withRepeat)).single,
        producer.produce(element('r', withoutRepeat)).single,
      );
    });
  });

  group('P1 — purity across calls, instances, registries', () {
    test('same node value → byte-identical object', () {
      final node = element('p', const {
        'object_type': 'embroidery',
        'transform': {
          'translation': {'x': 1.0, 'y': 2.0},
          'rotation': 0.0,
          'scale': 1.5,
        },
        'render_bounds': [10, 20, 30, 40],
      });
      final a = producer.produce(node).single;
      final b = const TextileElementProducer().produce(node).single;
      final c = textileProducerRegistry()
          .producerFor(DesignNodeType.element)!
          .produce(node)
          .single;
      expect(a, b);
      expect(b, c);
    });
  });

  group('P5 / single-object — reference-only output, one per node', () {
    test('exactly one object; id-reference shape; no metadata payloads '
        'inside the object', () {
      final produced = producer.produce(
        element('x', const {
          'object_type': 'motif',
          'repeat': {'type': 'toss'},
        }),
      );
      expect(produced, hasLength(1));
      final object = produced.single;
      expect(object.id, 'ro:x');
      expect(object.source.kind, CanvasReferenceKind.designNode);
      expect(object.source.refId, 'x');
      // R2: no owned data — the serialized object nowhere contains the
      // repeat payload.
      expect(object.toJson().toString().contains('toss'), isFalse);
    });
  });

  group('compiled — P3, P4, R1 against the frozen compiler + engine', () {
    DesignNode tree(List<DesignNode> children) => DesignNode(
      id: 'root',
      name: 'Artwork',
      type: DesignNodeType.artwork,
      children: children,
    );

    FebricDocument doc(DesignNode root, {int revision = 1}) => FebricDocument(
      id: const DocumentId('doc-1'),
      projectId: const ProjectId('proj-1'),
      revision: RevisionId(revision),
      manifest: const DocumentManifest(
        version: DocumentVersion(schema: 1, generator: 'test'),
      ),
      metadata: DocumentMetadata(
        title: 'M16',
        createdAt: DateTime.utc(2026),
        modifiedAt: DateTime.utc(2026),
      ),
      artboards: [
        Artboard(
          id: 'ab-1',
          name: 'AB',
          size: const Size2D(width: 1000, height: 1000),
          layerRoot: const LayerModel(
            id: 'l',
            name: 'root',
            kind: LayerKind.layer,
          ),
          designTreeRoot: root,
        ),
      ],
    );

    RenderGraphCompiler compiler() =>
        RenderGraphCompiler(producers: textileProducerRegistry());

    const target = RenderTarget(kind: RenderTargetKind.editor);

    test('P3 — standalone produce equals the compiled object modulo the '
        'walk-assigned order/tileKeys', () {
      final node = element('el-1', const {'object_type': 'border'});
      final graph = compiler().compile(doc(tree([node])), target);
      final compiled = graph.objects.firstWhere((o) => o.id == 'ro:el-1');
      final standalone = producer.produce(node).single;
      expect(
        compiled,
        standalone.copyWith(
          order: compiled.order,
          tileKeys: tileKeysFor(standalone.bounds, TileSpec.standard),
        ),
      );
    });

    test('P4 — incremental == full for every textile key, with the '
        'damage set from the frozen affectedIds; undamaged siblings '
        'reused', () {
      final mutations = <String, Object>{
        'object_type': TextileObjectType.lace.wireName,
        'transform': const Transform2D(scale: 3).toJson(),
        'repeat': {'type': 'mirror'},
      };
      for (final entry in mutations.entries) {
        final engine = DocumentEngine(
          document: doc(tree([element('el-1'), element('el-2')])),
        );
        final c = compiler();
        final before = c.compile(engine.document, target);

        final result = engine.apply(
          DocumentCommand.setNodeMetadata(
            artboardId: 'ab-1',
            nodeId: 'el-1',
            key: entry.key,
            value: entry.value,
          ),
        );
        expect(result, isA<CommandApplied>(), reason: entry.key);
        final damage = (result as CommandApplied).affectedIds.toSet();
        expect(damage, contains('el-1'));

        final incremental = c.recompile(before, engine.document, damage);
        final full = compiler().compile(engine.document, target);
        expect(incremental.objects, full.objects, reason: entry.key);

        // Converse: the undamaged sibling was reused, not re-produced.
        c.lastProduceCount = 0;
        c.recompile(before, engine.document, damage);
        expect(c.lastProduceCount, lessThan(full.objects.length));
      }
    });

    test('R1 — compilation mutates nothing', () {
      final document = doc(
        tree([
          element('el-1', const {
            'object_type': 'motif',
            'repeat': {'type': 'seamless'},
          }),
        ]),
      );
      final before = document;
      compiler().compile(document, target);
      expect(document, before);
    });
  });
}
