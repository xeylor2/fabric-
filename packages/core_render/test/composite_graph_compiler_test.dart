import 'package:core_canvas/core_canvas.dart';
import 'package:core_document/core_document.dart';
import 'package:core_interaction/core_interaction.dart';
import 'package:core_layer/core_layer.dart';
import 'package:core_render/core_render.dart';
import 'package:core_textile/core_textile.dart';
import 'package:test/test.dart';

/// M17 verification suite — CompositeGraphCompiler (ADR-0019).
///
/// Proves the layer-tier render entry against the FROZEN inner compiler
/// and a REAL DocumentEngine: E1 delegation fidelity, E2 partition
/// totality, E3 layer-tier incremental == full with cross-tier
/// independence, E4 purity/totality, E5 R1/R2, E6 the both-tiers
/// composition witness (the M17-D4 adjudication in structural form),
/// E7 the widening gate, and E8 the derivation freeze. All assertions
/// are compile-level (the D3-review note) — no visual output asserted.
/// Masks deferred (D2-d#1): every layer object's maskId is null.
void main() {
  DesignNode element(String id, [Map<String, Object?> metadata = const {}]) =>
      DesignNode(
        id: id,
        name: id,
        type: DesignNodeType.element,
        metadata: metadata,
      );

  LayerModel layer(
    String id, {
    Map<String, Object?> metadata = const {},
    List<LayerModel> children = const [],
    bool hidden = false,
    FebricBlendMode blendMode = FebricBlendMode.normal,
    double opacity = 1.0,
    bool locked = false,
    bool pinned = false,
    bool favourite = false,
    List<String> tags = const [],
  }) => LayerModel(
    id: id,
    name: id,
    kind: LayerKind.layer,
    metadata: metadata,
    children: children,
    hidden: hidden,
    blendMode: blendMode,
    opacity: opacity,
    locked: locked,
    pinned: pinned,
    favourite: favourite,
    tags: tags,
  );

  FebricDocument doc({
    List<DesignNode> nodes = const [],
    List<LayerModel> layers = const [],
    int revision = 1,
  }) => FebricDocument(
    id: const DocumentId('doc-1'),
    projectId: const ProjectId('proj-1'),
    revision: RevisionId(revision),
    manifest: const DocumentManifest(
      version: DocumentVersion(schema: 1, generator: 'test'),
    ),
    metadata: DocumentMetadata(
      title: 'M17',
      createdAt: DateTime.utc(2026),
      modifiedAt: DateTime.utc(2026),
    ),
    artboards: [
      Artboard(
        id: 'ab-1',
        name: 'AB',
        size: const Size2D(width: 1000, height: 1000),
        layerRoot: LayerModel(
          id: 'lroot',
          name: 'root',
          kind: LayerKind.artboard,
          children: layers,
        ),
        designTreeRoot: DesignNode(
          id: 'root',
          name: 'Artwork',
          type: DesignNodeType.artwork,
          children: nodes,
        ),
      ),
    ],
  );

  const target = RenderTarget(kind: RenderTargetKind.editor);

  List<RenderObject> nodeSubset(RenderGraph g) => [
    for (final o in g.objects)
      if (o.source.kind == CanvasReferenceKind.designNode) o,
  ];

  List<RenderObject> layerSubset(RenderGraph g) => [
    for (final o in g.objects)
      if (o.source.kind == CanvasReferenceKind.layer) o,
  ];

  group('E1 — delegation fidelity', () {
    test('compile: the designNode subset — including order — equals the '
        'frozen compiler\'s full output', () {
      final document = doc(
        nodes: [
          element('el-1', const {'object_type': 'motif'}),
          element('el-2', const {
            'transform': {
              'translation': {'x': 3.0, 'y': 4.0},
              'rotation': 0.0,
              'scale': 2.0,
            },
          }),
        ],
        layers: [
          layer('ly-1', metadata: const {'colour': '#112233'}),
        ],
      );
      final frozen = RenderGraphCompiler(
        producers: textileProducerRegistry(),
      ).compile(document, target);
      final composite = CompositeGraphCompiler(
        inner: RenderGraphCompiler(producers: textileProducerRegistry()),
      ).compile(document, target);
      expect(nodeSubset(composite), frozen.objects);
    });

    test('recompile: same equality on the incremental path', () {
      final document = doc(
        nodes: [
          element('el-1', const {'object_type': 'border'}),
        ],
        layers: [layer('ly-1')],
      );
      final frozenC = RenderGraphCompiler(producers: textileProducerRegistry());
      final compositeC = CompositeGraphCompiler(
        inner: RenderGraphCompiler(producers: textileProducerRegistry()),
      );
      final f0 = frozenC.compile(document, target);
      final c0 = compositeC.compile(document, target);
      final f1 = frozenC.recompile(f0, document, {'el-1'});
      final c1 = compositeC.recompile(c0, document, {'el-1'});
      expect(nodeSubset(c1), f1.objects);
    });
  });

  group('D2 — layer participation shape', () {
    test('every non-hidden layer (root included) emits exactly one '
        'object; hidden prunes its subtree', () {
      final graph = CompositeGraphCompiler().compile(
        doc(
          layers: [
            layer('ly-a'),
            layer(
              'ly-hidden',
              hidden: true,
              children: [layer('ly-under-hidden')],
            ),
            layer('ly-b', children: [layer('ly-b-child')]),
          ],
        ),
        target,
      );
      final layers = layerSubset(graph);
      expect(layers.map((o) => o.source.refId), [
        'lroot',
        'ly-a',
        'ly-b',
        'ly-b-child',
      ]);
      expect(layers.map((o) => o.source.refId), isNot(contains('ly-hidden')));
      expect(
        layers.map((o) => o.source.refId),
        isNot(contains('ly-under-hidden')),
      );
    });

    test('compositing attributes: blend/opacity verbatim; surface-rect '
        'bounds; layer reference; rl: identity', () {
      final graph = CompositeGraphCompiler().compile(
        doc(
          layers: [
            layer('ly-1', blendMode: FebricBlendMode.multiply, opacity: 0.5),
          ],
        ),
        target,
      );
      final o = layerSubset(graph).firstWhere((o) => o.source.refId == 'ly-1');
      expect(o.id, 'rl:ly-1');
      expect(o.blend, FebricBlendMode.multiply);
      expect(o.opacity, 0.5);
      expect(
        o.bounds,
        const Rect2D(left: 0, top: 0, width: 1000, height: 1000),
      );
      expect(o.source.kind, CanvasReferenceKind.layer);
      expect(o.transform, Transform2D.identity);
    });

    test('panel fields (locked/pinned/favourite/tags) are provably '
        'unconsumed', () {
      RenderObject produce(LayerModel l) => layerSubset(
        CompositeGraphCompiler().compile(doc(layers: [l]), target),
      ).firstWhere((o) => o.source.refId == 'ly-1');
      final plain = produce(layer('ly-1'));
      final decorated = produce(
        layer(
          'ly-1',
          locked: true,
          pinned: true,
          favourite: true,
          tags: const ['a', 'b'],
        ),
      );
      expect(decorated, plain);
    });
  });

  group('D3 — layer per-key consumption', () {
    RenderObjectKind kindOf(Map<String, Object?> metadata) => layerSubset(
      CompositeGraphCompiler().compile(
        doc(layers: [layer('ly-1', metadata: metadata)]),
        target,
      ),
    ).firstWhere((o) => o.source.refId == 'ly-1').kind;

    test('coloured layer → colourFill; repeat-only → group; both keys → '
        'colourFill; non-String colour → group (treat-as-absent)', () {
      expect(kindOf(const {'colour': '#AA3322'}), RenderObjectKind.colourFill);
      expect(
        kindOf(const {
          'repeat': {'type': 'half_drop'},
        }),
        RenderObjectKind.group,
      );
      expect(
        kindOf(const {
          'colour': '#AA3322',
          'repeat': {'type': 'mirror'},
        }),
        RenderObjectKind.colourFill,
      );
      expect(kindOf(const {'colour': 42}), RenderObjectKind.group);
      expect(kindOf(const {}), RenderObjectKind.group);
    });
  });

  group('D2(d) — z-relation', () {
    test('all layer objects strictly after all node objects, ascending '
        'order; children bottom-to-top through pre-order', () {
      final graph =
          CompositeGraphCompiler(
            inner: RenderGraphCompiler(producers: textileProducerRegistry()),
          ).compile(
            doc(
              nodes: [element('el-1'), element('el-2')],
              layers: [
                layer('ly-1', children: [layer('ly-1a'), layer('ly-1b')]),
              ],
            ),
            target,
          );
      final orders = [for (final o in graph.objects) o.order];
      expect(orders, List.generate(graph.objects.length, (i) => i));
      final maxNodeOrder = nodeSubset(
        graph,
      ).map((o) => o.order).reduce((a, b) => a > b ? a : b);
      final minLayerOrder = layerSubset(
        graph,
      ).map((o) => o.order).reduce((a, b) => a < b ? a : b);
      expect(minLayerOrder, greaterThan(maxNodeOrder));
      final layerIds = [for (final o in layerSubset(graph)) o.source.refId];
      expect(layerIds, ['lroot', 'ly-1', 'ly-1a', 'ly-1b']);
    });
  });

  group('E6 — the both-tiers composition witness (M17-D4)', () {
    test('one graph: repeated element + coloured layer + repeat-only '
        'layer — disciplined kinds, z-relation, and repeat parameters in '
        'NO object of either tier', () {
      final graph =
          CompositeGraphCompiler(
            inner: RenderGraphCompiler(producers: textileProducerRegistry()),
          ).compile(
            doc(
              nodes: [
                element('el-r', const {
                  'object_type': 'motif',
                  'repeat': {'type': 'half_drop', 'seed': 7},
                }),
              ],
              layers: [
                layer('ly-c', metadata: const {'colour': '#0F0F0F'}),
                layer(
                  'ly-r',
                  metadata: const {
                    'repeat': {'type': 'toss', 'density': 0.5},
                  },
                ),
              ],
            ),
            target,
          );
      final elObject = graph.objects.firstWhere(
        (o) => o.source.refId == 'el-r',
      );
      final lyC = graph.objects.firstWhere((o) => o.source.refId == 'ly-c');
      final lyR = graph.objects.firstWhere((o) => o.source.refId == 'ly-r');
      expect(elObject.kind, RenderObjectKind.motif);
      expect(lyC.kind, RenderObjectKind.colourFill);
      expect(lyR.kind, RenderObjectKind.group);
      expect(lyC.order, greaterThan(elObject.order));
      expect(lyR.order, greaterThan(lyC.order));
      // No repeat parameters in ANY serialized object of either tier.
      for (final o in graph.objects) {
        final json = o.toJson().toString();
        expect(json.contains('half_drop'), isFalse, reason: o.id);
        expect(json.contains('toss'), isFalse, reason: o.id);
        expect(json.contains('#0F0F0F'), isFalse, reason: o.id);
      }
    });
  });

  group('E3 — layer-tier incremental == full, cross-tier independence', () {
    test('changeColour and layer-repeat mutations via the real engine: '
        'recompile with CommandApplied.affectedIds byte-equals fresh '
        'compile', () {
      final mutations = <DocumentCommand>[
        const DocumentCommand.changeColour(
          artboardId: 'ab-1',
          layerId: 'ly-1',
          operation: ColourOperation.globalColourShift,
          colourHex: '#445566',
        ),
        const DocumentCommand.setLayerMetadata(
          artboardId: 'ab-1',
          layerId: 'ly-2',
          key: 'repeat',
          value: {'type': 'mirror'},
        ),
      ];
      for (final command in mutations) {
        final engine = DocumentEngine(
          document: doc(
            nodes: [element('el-1')],
            layers: [layer('ly-1'), layer('ly-2')],
          ),
        );
        final compiler = CompositeGraphCompiler(
          inner: RenderGraphCompiler(producers: textileProducerRegistry()),
        );
        final before = compiler.compile(engine.document, target);
        final result = engine.apply(command);
        expect(result, isA<CommandApplied>());
        final damage = (result as CommandApplied).affectedIds.toSet();
        final incremental = compiler.recompile(before, engine.document, damage);
        final full = CompositeGraphCompiler(
          inner: RenderGraphCompiler(producers: textileProducerRegistry()),
        ).compile(engine.document, target);
        expect(incremental.objects, full.objects);
      }
    });

    test('undamaged layer objects reused; node-only damage re-emits no '
        'layer object; layer-only damage leaves inner.lastProduceCount '
        'at zero', () {
      final engine = DocumentEngine(
        document: doc(
          nodes: [element('el-1'), element('el-2')],
          layers: [layer('ly-1'), layer('ly-2')],
        ),
      );
      final compiler = CompositeGraphCompiler(
        inner: RenderGraphCompiler(producers: textileProducerRegistry()),
      );
      final before = compiler.compile(engine.document, target);

      // Layer-only damage: the node tier is fully reused.
      final colour = engine.apply(
        const DocumentCommand.changeColour(
          artboardId: 'ab-1',
          layerId: 'ly-1',
          operation: ColourOperation.shiftBaseColour,
          colourHex: '#111111',
        ),
      );
      final layerDamage = (colour as CommandApplied).affectedIds.toSet();
      final afterLayer = compiler.recompile(
        before,
        engine.document,
        layerDamage,
      );
      expect(compiler.inner.lastProduceCount, 0);
      // Only the damaged layer re-emitted; the other three reused.
      expect(compiler.lastLayerEmitCount, 1);

      // Node-only damage: no layer object re-emitted.
      final node = engine.apply(
        const DocumentCommand.setNodeMetadata(
          artboardId: 'ab-1',
          nodeId: 'el-1',
          key: 'object_type',
          value: 'motif',
        ),
      );
      final nodeDamage = (node as CommandApplied).affectedIds.toSet();
      compiler.recompile(afterLayer, engine.document, nodeDamage);
      expect(compiler.lastLayerEmitCount, 0);
      expect(compiler.inner.lastProduceCount, greaterThan(0));
    });
  });

  group('E2 — partition totality over all three reference kinds', () {
    test('a synthetic previous containing all three kinds: the inner '
        'receives only the designNode partition; the asset partition is '
        'discarded with output equal to a full compile', () {
      final document = doc(nodes: [element('el-1')], layers: [layer('ly-1')]);
      final compiler = CompositeGraphCompiler(
        inner: RenderGraphCompiler(producers: textileProducerRegistry()),
      );
      final clean = compiler.compile(document, target);
      // Inject a synthetic asset-sourced object into the previous graph.
      const assetObject = RenderObject(
        id: 'ra:asset-1',
        kind: RenderObjectKind.image,
        source: CanvasReference(
          kind: CanvasReferenceKind.asset,
          refId: 'asset-1',
        ),
        bounds: Rect2D(left: 0, top: 0, width: 10, height: 10),
      );
      final polluted = clean.copyWith(objects: [...clean.objects, assetObject]);
      final recompiled = compiler.recompile(polluted, document, const {});
      final full = CompositeGraphCompiler(
        inner: RenderGraphCompiler(producers: textileProducerRegistry()),
      ).compile(document, target);
      expect(recompiled.objects, full.objects);
      expect(
        recompiled.objects.any(
          (o) => o.source.kind == CanvasReferenceKind.asset,
        ),
        isFalse,
      );
    });
  });

  group('E4 — purity and totality', () {
    test('identical layer values → byte-identical objects across calls '
        'and instances', () {
      final document = doc(
        layers: [
          layer(
            'ly-1',
            metadata: const {'colour': '#ABCDEF'},
            blendMode: FebricBlendMode.screen,
            opacity: 0.7,
          ),
        ],
      );
      final a = CompositeGraphCompiler().compile(document, target);
      final b = CompositeGraphCompiler().compile(document, target);
      final c = CompositeGraphCompiler().compile(document, target);
      expect(a.objects, b.objects);
      expect(b.objects, c.objects);
    });

    test('malformed layer metadata never throws', () {
      final malformed = <Map<String, Object?>>[
        {'colour': 42},
        {'colour': null},
        {
          'colour': ['#000000'],
        },
        {'repeat': 'not-a-map'},
        {'repeat': 7},
        {'colour': true, 'repeat': false},
      ];
      for (final metadata in malformed) {
        final graph = CompositeGraphCompiler().compile(
          doc(layers: [layer('ly-1', metadata: metadata)]),
          target,
        );
        expect(layerSubset(graph), isNotEmpty, reason: '$metadata');
      }
    });
  });

  group('E5 — R1/R2', () {
    test('document identity-equal after both paths; serialized objects '
        'payload-free', () {
      final document = doc(
        nodes: [
          element('el-1', const {
            'repeat': {'type': 'diamond'},
          }),
        ],
        layers: [
          layer('ly-1', metadata: const {'colour': '#332211'}),
        ],
      );
      final before = document;
      final compiler = CompositeGraphCompiler(
        inner: RenderGraphCompiler(producers: textileProducerRegistry()),
      );
      final graph = compiler.compile(document, target);
      compiler.recompile(graph, document, const {});
      expect(document, before);
      for (final o in graph.objects) {
        final json = o.toJson().toString();
        expect(json.contains('#332211'), isFalse, reason: o.id);
        expect(json.contains('diamond'), isFalse, reason: o.id);
      }
    });
  });

  group('E7 — the widening gate', () {
    test('a default-constructed HeadlessRenderer behaves identically '
        '(frozen inner default); the successor is injectable through the '
        'widened seam', () {
      final document = doc(nodes: [element('el-1')]);
      const context = RenderContext(
        viewport: ViewportState(
          canvasSize: Size2D(width: 1000, height: 1000),
          screenSize: Size2D(width: 1000, height: 1000),
        ),
      );
      // Default: the frozen concrete compiler — behaviour unchanged.
      final defaultRenderer = HeadlessRenderer();
      final defaultFrame = defaultRenderer.renderFrame(
        document,
        target,
        context,
      );
      final frozenGraph = RenderGraphCompiler().compile(document, target);
      expect(defaultFrame.graph.objects, frozenGraph.objects);
      // The successor injects through the widened contract-typed seam.
      final compositeRenderer = HeadlessRenderer(
        compiler: CompositeGraphCompiler(),
      );
      final compositeFrame = compositeRenderer.renderFrame(
        document,
        target,
        context,
      );
      expect(
        layerSubset(compositeFrame.graph),
        isNotEmpty, // The artboard layer root emits.
      );
    });
  });

  group('E8 — derivation freeze', () {
    test('the layer kind-derivation chain is pinned by wire name', () {
      RenderObjectKind kindOf(Map<String, Object?> metadata) => layerSubset(
        CompositeGraphCompiler().compile(
          doc(layers: [layer('ly-1', metadata: metadata)]),
          target,
        ),
      ).firstWhere((o) => o.source.refId == 'ly-1').kind;
      expect(kindOf(const {'colour': '#000000'}).wireName, 'colour_fill');
      expect(kindOf(const {}).wireName, 'group');
      expect(
        kindOf(const {
          'repeat': {'type': 'seamless'},
        }).wireName,
        'group',
      );
    });
  });

  group('D2-d#1 — mask deferral', () {
    test('every layer object\'s maskId is null', () {
      final graph = CompositeGraphCompiler().compile(
        doc(
          layers: [
            layer('ly-1', metadata: const {'colour': '#123456'}),
            layer('ly-2'),
          ],
        ),
        target,
      );
      for (final o in layerSubset(graph)) {
        expect(o.maskId, isNull, reason: o.id);
      }
    });
  });
}
