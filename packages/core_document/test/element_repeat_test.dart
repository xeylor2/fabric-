import 'package:core_document/core_document.dart';
import 'package:core_geometry/core_geometry.dart';
import 'package:core_layer/core_layer.dart';
import 'package:core_textile/core_textile.dart';
import 'package:test/test.dart';

import 'support/fixtures.dart';

/// M14 Slice 3 verification suite — Node-Scoped Repeat Representation.
///
/// Binds the node-side repeat metadata key **`repeat`** (the approved M14 Q3
/// determination: node-scoped repeat rides the frozen `setNodeMetadata`
/// command, whose frozen contract names repeat among its carriers —
/// `document_command.dart:217-218`) at its first frozen consumer, per the
/// approved Slice 3 specification under reading (α)+(i).
///
/// TIER SEPARATION (approved Q3). Two `repeat` keys exist on different
/// carriers and are architecturally distinct:
/// - **content tier** — `DesignNode.metadata['repeat']`, written by the
///   frozen `setNodeMetadata` (this slice's binding);
/// - **compositing tier** — `LayerModel.metadata['repeat']`, written by the
///   frozen `RepeatPatternCommand`, which this slice leaves UNCHANGED.
///
/// This slice binds the write only. It asserts NO precedence or merge
/// semantics between the tiers — that remains a Q3 discovered question for
/// the render/binding consumer.
void main() {
  group('binding — repeat carries a RepeatType spec on the node', () {
    test('a node created via createDesignNode carries its repeat spec', () {
      final e = engine();
      e.apply(
        DocumentCommand.createDesignNode(
          artboardId: 'ab-1',
          node: DesignNode(
            id: 'el-1',
            name: 'Boteh',
            type: DesignNodeType.element,
            metadata: {
              'repeat': {'type': RepeatType.halfDrop.wireName},
            },
          ),
        ),
      );

      final raw = _tree(e).children.single.metadata['repeat'];
      expect(raw, isA<Map<String, Object?>>());
      final spec = raw! as Map<String, Object?>;
      expect(
        RepeatType.fromWireName(spec['type']! as String),
        RepeatType.halfDrop,
      );
    });

    test('setNodeMetadata writes a repeat spec and inverts exactly', () {
      final e = engine();
      e.apply(
        const DocumentCommand.createDesignNode(
          artboardId: 'ab-1',
          node: DesignNode(
            id: 'el-1',
            name: 'Border Band',
            type: DesignNodeType.element,
          ),
        ),
      );
      // Absence is lawful — an unrepeated node carries no key.
      expect(_tree(e).children.single.metadata['repeat'], isNull);

      final applied = e.apply(
        DocumentCommand.setNodeMetadata(
          artboardId: 'ab-1',
          nodeId: 'el-1',
          key: 'repeat',
          value: {'type': RepeatType.mirror.wireName},
        ),
      );
      expect(applied, isA<CommandApplied>());
      expect(
        (_tree(e).children.single.metadata['repeat']! as Map)['type'],
        'mirror',
      );

      // Exact inverse (ADR-0015 I1): undo restores absence, redo the spec.
      expect(e.undo(), isA<CommandApplied>());
      expect(_tree(e).children.single.metadata['repeat'], isNull);
      expect(e.redo(), isA<CommandApplied>());
      expect(
        (_tree(e).children.single.metadata['repeat']! as Map)['type'],
        'mirror',
      );
    });

    test('a null value clears the repeat spec and inverts to the prior '
        'spec (the frozen remove-branch of _setNodeMetadata)', () {
      final e = engine();
      e.apply(
        DocumentCommand.createDesignNode(
          artboardId: 'ab-1',
          node: DesignNode(
            id: 'el-1',
            name: 'Boteh',
            type: DesignNodeType.element,
            metadata: {
              'repeat': {'type': RepeatType.seamless.wireName},
            },
          ),
        ),
      );

      final cleared = e.apply(
        const DocumentCommand.setNodeMetadata(
          artboardId: 'ab-1',
          nodeId: 'el-1',
          key: 'repeat',
        ),
      );
      expect(cleared, isA<CommandApplied>());
      expect(_tree(e).children.single.metadata.containsKey('repeat'), isFalse);

      // The inverse restores the prior spec verbatim.
      expect(e.undo(), isA<CommandApplied>());
      expect(
        (_tree(e).children.single.metadata['repeat']! as Map)['type'],
        'seamless',
      );
    });

    test('all eight frozen RepeatType values bind and round-trip', () {
      expect(RepeatType.values, hasLength(8));
      for (final type in RepeatType.values) {
        final e = engine();
        e.apply(
          DocumentCommand.createDesignNode(
            artboardId: 'ab-1',
            node: DesignNode(
              id: 'el-${type.wireName}',
              name: type.label,
              type: DesignNodeType.element,
              metadata: {
                'repeat': {'type': type.wireName},
              },
            ),
          ),
        );
        final spec =
            _tree(e).children.single.metadata['repeat']!
                as Map<String, Object?>;
        expect(RepeatType.fromWireName(spec['type']! as String), type);
      }
    });

    test('parameters ride alongside the type — the same payload shape the '
        'frozen layer-tier command produces', () {
      final e = engine();
      e.apply(
        DocumentCommand.createDesignNode(
          artboardId: 'ab-1',
          node: DesignNode(
            id: 'el-1',
            name: 'Tossed Sprigs',
            type: DesignNodeType.element,
            metadata: {
              'repeat': {
                'type': RepeatType.toss.wireName,
                'seed': 42,
                'density': 0.35,
              },
            },
          ),
        ),
      );
      final spec =
          _tree(e).children.single.metadata['repeat']! as Map<String, Object?>;
      expect(spec['type'], 'toss');
      expect(spec['seed'], 42);
      expect(spec['density'], 0.35);
    });
  });

  group('persistence — the repeat spec survives the frozen codec', () {
    test('repeat round-trips losslessly through .febric', () {
      final e = engine();
      e.apply(
        DocumentCommand.createDesignNode(
          artboardId: 'ab-1',
          node: DesignNode(
            id: 'el-1',
            name: 'Boteh',
            type: DesignNodeType.element,
            metadata: {
              'repeat': {'type': RepeatType.diamond.wireName, 'scale': 2},
            },
          ),
        ),
      );

      const codec = FebricCodec();
      final restored = codec.decode(codec.encode(e.document));
      final spec =
          restored
                  .artboards
                  .single
                  .designTreeRoot
                  .children
                  .single
                  .metadata['repeat']!
              as Map<String, Object?>;
      expect(
        RepeatType.fromWireName(spec['type']! as String),
        RepeatType.diamond,
      );
      expect(spec['scale'], 2);
    });
  });

  group('tier separation — the frozen layer command is untouched', () {
    test('RepeatPatternCommand still writes the LAYER metadata, '
        'independently of any node repeat', () {
      final e = engine();
      // Content tier: a node repeat.
      e.apply(
        DocumentCommand.createDesignNode(
          artboardId: 'ab-1',
          node: DesignNode(
            id: 'el-1',
            name: 'Boteh',
            type: DesignNodeType.element,
            metadata: {
              'repeat': {'type': RepeatType.straight.wireName},
            },
          ),
        ),
      );
      // Compositing tier: the frozen layer-scoped command, unchanged.
      final applied = e.apply(
        const DocumentCommand.repeatPattern(
          artboardId: 'ab-1',
          layerId: 'ab-1-hero',
          repeat: RepeatType.halfBrick,
        ),
      );
      expect(applied, isA<CommandApplied>());

      final layer = _layer(e, 'ab-1-hero');
      expect((layer.metadata['repeat']! as Map)['type'], 'half_brick');
      // The node's own repeat is untouched by the layer-tier write.
      expect(
        (_tree(e).children.single.metadata['repeat']! as Map)['type'],
        'straight',
      );
    });
  });

  group('boundaries — capability alignment and key coexistence', () {
    test('the capability MATRIX places repeat on content-bearing rows only '
        '(the reducer does not gate setNodeMetadata — only duplicate)', () {
      for (final type in [
        DesignNodeType.zone,
        DesignNodeType.element,
        DesignNodeType.group,
      ]) {
        expect(
          NodeCapabilityMatrix.supports(type, NodeCapability.repeat),
          isTrue,
          reason: '${type.wireName} must support repeat',
        );
      }
      for (final type in [DesignNodeType.garment, DesignNodeType.garmentPart]) {
        expect(
          NodeCapabilityMatrix.supports(type, NodeCapability.repeat),
          isFalse,
          reason: '${type.wireName} must not support repeat',
        );
      }
    });

    test('object_type (S1), transform (S2) and repeat (S3) coexist on one '
        'node without collision', () {
      final e = engine();
      const t = Transform2D(translation: Point2D(x: 4, y: 8));
      e.apply(
        DocumentCommand.createDesignNode(
          artboardId: 'ab-1',
          node: DesignNode(
            id: 'el-1',
            name: 'Boteh',
            type: DesignNodeType.element,
            metadata: {
              'object_type': TextileObjectType.motif.wireName,
              'transform': t.toJson(),
              'repeat': {'type': RepeatType.customOffset.wireName},
            },
          ),
        ),
      );
      final node = _tree(e).children.single;
      expect(node.metadata['object_type'], 'motif');
      expect(
        Transform2D.fromJson(
          node.metadata['transform']! as Map<String, Object?>,
        ),
        t,
      );
      expect((node.metadata['repeat']! as Map)['type'], 'custom_offset');
    });
  });
}

DesignNode _tree(DocumentEngine e) =>
    e.document.artboards.single.designTreeRoot;

LayerModel _layer(DocumentEngine e, String id) =>
    e.document.artboards.single.layerRoot.findById(id)!;
