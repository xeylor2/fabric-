import 'package:core_document/core_document.dart';
import 'package:core_textile/core_textile.dart';
import 'package:test/test.dart';

import 'support/fixtures.dart';

/// M14 Slice 1 verification suite — Element Classification.
///
/// Binds the frozen element-classification metadata key **`object_type`**
/// (the approved M14 Q1 determination + amendment: the canonical editable
/// textile object is a `DesignNodeType.element` node "typed by
/// `TextileObjectType`" — design_node_type.dart) at its first frozen
/// consumer, per the approved Slice 1 specification under reading (a)+(i):
///
/// - **reading (a)** (approved SB1 determination): element creation and
///   classification are **command-shaped**, not tool-shaped — the frozen
///   `FebricTool` set has no element-creation identity and is permanently
///   closed (ADR-0002), so classification rides the existing frozen
///   `createDesignNode` / `setNodeMetadata` commands. No tool, no host
///   package, no dependency edge, no new artefact.
/// - **reading (i)**: the key is realised as a literal at its writer and
///   reader sites — the frozen M13F/M13G precedent (`garment_type`,
///   `part`, `zone_slot`, `schema_id`) — introducing no owned constant and
///   therefore no ownership decision.
///
/// The classification VALUE is always a frozen `TextileObjectType` wire
/// name. It is never a `MotifRole` value: role (AI inspection finding),
/// `role` metadata (SemanticPath addressing) and `object_type` (object
/// class) are three separate axes (approved M14 Q10).
void main() {
  group('binding — object_type carries the frozen TextileObjectType', () {
    test('an element created via createDesignNode carries its class', () {
      final e = engine();
      final result = e.apply(
        DocumentCommand.createDesignNode(
          artboardId: 'ab-1',
          node: DesignNode(
            id: 'el-1',
            name: 'Boteh',
            type: DesignNodeType.element,
            metadata: {'object_type': TextileObjectType.motif.wireName},
          ),
        ),
      );
      expect(result, isA<CommandApplied>());

      final node = _tree(e).children.single;
      expect(node.type, DesignNodeType.element);
      expect(node.metadata['object_type'], 'motif');
      // The value is the frozen wire name, never the Dart enum name.
      expect(node.metadata['object_type'], TextileObjectType.motif.wireName);
    });

    test('setNodeMetadata classifies an existing element and inverts '
        'exactly', () {
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
      // Unclassified is lawful: absence is not a deficiency.
      expect(_tree(e).children.single.metadata['object_type'], isNull);

      final applied = e.apply(
        DocumentCommand.setNodeMetadata(
          artboardId: 'ab-1',
          nodeId: 'el-1',
          key: 'object_type',
          value: TextileObjectType.border.wireName,
        ),
      );
      expect(applied, isA<CommandApplied>());
      expect(_tree(e).children.single.metadata['object_type'], 'border');

      // Exact inverse (ADR-0015 decision 3): undo restores the prior
      // absence, redo restores the classification.
      expect(e.undo(), isA<CommandApplied>());
      expect(_tree(e).children.single.metadata['object_type'], isNull);
      expect(e.redo(), isA<CommandApplied>());
      expect(_tree(e).children.single.metadata['object_type'], 'border');
    });

    test('every frozen TextileObjectType classifies an element', () {
      for (final type in TextileObjectType.values) {
        final e = engine();
        e.apply(
          DocumentCommand.createDesignNode(
            artboardId: 'ab-1',
            node: DesignNode(
              id: 'el-${type.wireName}',
              name: type.label,
              type: DesignNodeType.element,
              metadata: {'object_type': type.wireName},
            ),
          ),
        );
        final node = _tree(e).children.single;
        expect(node.metadata['object_type'], type.wireName);
        // The wire name round-trips back to the frozen vocabulary.
        expect(
          TextileObjectType.fromWireName(
            node.metadata['object_type']! as String,
          ),
          type,
        );
      }
    });

    test('groups compose classified elements and carry no object_type — '
        'a group is an ordered composition, not an object class', () {
      final e = engine();
      e.apply(
        DocumentCommand.createDesignNode(
          artboardId: 'ab-1',
          node: DesignNode(
            id: 'grp-1',
            name: 'Corner Cluster',
            type: DesignNodeType.group,
            children: [
              DesignNode(
                id: 'el-1',
                name: 'Boteh',
                type: DesignNodeType.element,
                metadata: {'object_type': TextileObjectType.motif.wireName},
              ),
              DesignNode(
                id: 'el-2',
                name: 'Fill',
                type: DesignNodeType.element,
                metadata: {'object_type': TextileObjectType.texture.wireName},
              ),
            ],
          ),
        ),
      );
      final group = _tree(e).children.single;
      expect(group.type, DesignNodeType.group);
      expect(group.metadata.containsKey('object_type'), isFalse);
      expect(group.children.map((n) => n.metadata['object_type']), [
        'motif',
        'texture',
      ]);
    });
  });

  group('persistence — the classification survives the frozen codec', () {
    test('object_type round-trips losslessly through .febric', () {
      final e = engine();
      e.apply(
        DocumentCommand.createDesignNode(
          artboardId: 'ab-1',
          node: DesignNode(
            id: 'el-1',
            name: 'Boteh',
            type: DesignNodeType.element,
            metadata: {'object_type': TextileObjectType.motif.wireName},
          ),
        ),
      );

      const codec = FebricCodec();
      final restored = codec.decode(codec.encode(e.document));
      final node = restored.artboards.single.designTreeRoot.children.single;
      expect(node.type, DesignNodeType.element);
      expect(node.metadata['object_type'], 'motif');
    });
  });

  group('boundaries — the classification axis stays separate', () {
    test('object_type is independent of the frozen SemanticPath keys: '
        'addressing still resolves by name/type, unchanged by this slice', () {
      final e = engine();
      e.apply(
        DocumentCommand.createDesignNode(
          artboardId: 'ab-1',
          node: DesignNode(
            id: 'el-1',
            name: 'Boteh',
            type: DesignNodeType.element,
            metadata: {'object_type': TextileObjectType.motif.wireName},
          ),
        ),
      );
      final tree = _tree(e);
      // The frozen resolver matches the node's slugged name and its type
      // wire name — element-class ADDRESSING (matching object_type) is a
      // separate binding, deliberately NOT introduced by this slice.
      expect(SemanticPath.parse('artwork.boteh').resolve(tree), hasLength(1));
      expect(SemanticPath.parse('artwork.element').resolve(tree), hasLength(1));
    });

    test('object_type coexists with a role annotation without collision — '
        'class and role are separate axes (M14 Q10)', () {
      final e = engine();
      e.apply(
        DocumentCommand.createDesignNode(
          artboardId: 'ab-1',
          node: DesignNode(
            id: 'el-1',
            name: 'Boteh',
            type: DesignNodeType.element,
            metadata: {
              'object_type': TextileObjectType.motif.wireName,
              'role': 'hero-motif',
            },
          ),
        ),
      );
      final node = _tree(e).children.single;
      expect(node.metadata['object_type'], 'motif');
      expect(node.metadata['role'], 'hero-motif');
      // The frozen @role selector reads `role`, never `object_type`.
      expect(
        SemanticPath.parse('artwork.boteh@hero-motif').resolve(_tree(e)),
        hasLength(1),
      );
    });

    test('classified elements support the full capability set; structural '
        'garment nodes are never object-classified', () {
      // Content-bearing rows carry all twelve capabilities (ADR-0015).
      for (final capability in NodeCapability.values) {
        expect(
          NodeCapabilityMatrix.supports(DesignNodeType.element, capability),
          isTrue,
          reason: 'element must support ${capability.wireName}',
        );
      }
      // Repeat is a content capability, never a structural one — the
      // boundary that keeps garments structural containers (M14 Q1).
      expect(
        NodeCapabilityMatrix.supports(
          DesignNodeType.garment,
          NodeCapability.repeat,
        ),
        isFalse,
      );
      expect(
        NodeCapabilityMatrix.supports(
          DesignNodeType.garmentPart,
          NodeCapability.repeat,
        ),
        isFalse,
      );
    });
  });
}

DesignNode _tree(DocumentEngine e) =>
    e.document.artboards.single.designTreeRoot;
