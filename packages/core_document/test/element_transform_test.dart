import 'package:core_document/core_document.dart';
import 'package:core_geometry/core_geometry.dart';
import 'package:core_textile/core_textile.dart';
import 'package:test/test.dart';

import 'support/fixtures.dart';

/// M14 Slice 2 verification suite — Persisted Transform Representation.
///
/// Binds the frozen persisted-transform metadata key **`transform`**
/// (the approved M14 Q4 determination: tree-owned, per-node, `Transform2D`-
/// valued document state) at its first frozen consumer, per the approved
/// Slice 2 specification under reading (α)+(i):
///
/// - **reading (α)** (architecturally implied): the transform is stored as a
///   metadata map entry — key `'transform'`, value `Transform2D.toJson()` —
///   written via the existing frozen `setNodeMetadata` command. No typed
///   field on `DesignNode`, no `core_textile → core_geometry` edge.
///   The `DesignNode` doc comment names this the intended path
///   (`design_node.dart:17`).
/// - **reading (i)**: the key is realised as a literal at its writer and
///   reader sites — the M13F/M13G/Slice-1 precedent — introducing no owned
///   constant and therefore no ownership decision.
///
/// The persisted transform is DISTINCT from the ephemeral canvas-surface
/// `activeTransform` (approved M14 Q4 constraint). Absence means identity:
/// a node with no `'transform'` key is implicitly at `Transform2D.identity`.
void main() {
  group('binding — transform carries a Transform2D via metadata', () {
    test('a node created via createDesignNode carries its transform', () {
      final e = engine();
      const t = Transform2D(
        translation: Point2D(x: 10, y: 20),
        rotation: 0.5,
        scale: 2.0,
      );
      final result = e.apply(
        DocumentCommand.createDesignNode(
          artboardId: 'ab-1',
          node: DesignNode(
            id: 'el-1',
            name: 'Boteh',
            type: DesignNodeType.element,
            metadata: {'transform': t.toJson()},
          ),
        ),
      );
      expect(result, isA<CommandApplied>());

      final raw = _tree(e).children.single.metadata['transform'];
      expect(raw, isA<Map<String, Object?>>());
      final recovered = Transform2D.fromJson(raw! as Map<String, Object?>);
      expect(recovered, t);
    });

    test('setNodeMetadata writes a transform and inverts exactly', () {
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
      // Absence is lawful — no transform key means identity.
      expect(_tree(e).children.single.metadata['transform'], isNull);

      const t = Transform2D(
        translation: Point2D(x: 5, y: 15),
        rotation: 0.25,
        scale: 1.5,
      );
      final applied = e.apply(
        DocumentCommand.setNodeMetadata(
          artboardId: 'ab-1',
          nodeId: 'el-1',
          key: 'transform',
          value: t.toJson(),
        ),
      );
      expect(applied, isA<CommandApplied>());
      final raw = _tree(e).children.single.metadata['transform'];
      expect(Transform2D.fromJson(raw! as Map<String, Object?>), t);

      // Exact inverse (ADR-0015 I1): undo restores absence, redo restores t.
      expect(e.undo(), isA<CommandApplied>());
      expect(_tree(e).children.single.metadata['transform'], isNull);
      expect(e.redo(), isA<CommandApplied>());
      final raw2 = _tree(e).children.single.metadata['transform'];
      expect(Transform2D.fromJson(raw2! as Map<String, Object?>), t);
    });

    test(
      'absence means identity — no key is implicitly Transform2D.identity',
      () {
        final e = engine();
        e.apply(
          const DocumentCommand.createDesignNode(
            artboardId: 'ab-1',
            node: DesignNode(
              id: 'el-1',
              name: 'Unpositioned',
              type: DesignNodeType.element,
            ),
          ),
        );
        final raw = _tree(e).children.single.metadata['transform'];
        expect(raw, isNull);
        // The reader convention: null → identity.
        final effective = raw == null
            ? Transform2D.identity
            : Transform2D.fromJson(raw as Map<String, Object?>);
        expect(effective, Transform2D.identity);
      },
    );

    test('identity transform stored explicitly equals identity', () {
      final recovered = Transform2D.fromJson(Transform2D.identity.toJson());
      expect(recovered, Transform2D.identity);
      expect(recovered.isIdentity, isTrue);
    });

    test('transform and object_type coexist without collision — '
        'Slice 1 and Slice 2 bindings are independent metadata keys', () {
      final e = engine();
      const t = Transform2D(translation: Point2D(x: 3, y: 7));
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
            },
          ),
        ),
      );
      final node = _tree(e).children.single;
      expect(node.metadata['object_type'], 'motif');
      final raw = node.metadata['transform'];
      expect(Transform2D.fromJson(raw! as Map<String, Object?>), t);
    });
  });

  group('persistence — the transform survives the frozen codec', () {
    test('transform round-trips losslessly through .febric', () {
      final e = engine();
      const t = Transform2D(
        translation: Point2D(x: 42, y: 99),
        rotation: 1.57,
        scale: 0.75,
      );
      e.apply(
        DocumentCommand.createDesignNode(
          artboardId: 'ab-1',
          node: DesignNode(
            id: 'el-1',
            name: 'Boteh',
            type: DesignNodeType.element,
            metadata: {'transform': t.toJson()},
          ),
        ),
      );

      const codec = FebricCodec();
      final restored = codec.decode(codec.encode(e.document));
      final raw = restored
          .artboards
          .single
          .designTreeRoot
          .children
          .single
          .metadata['transform'];
      expect(raw, isA<Map<String, Object?>>());
      expect(Transform2D.fromJson(raw! as Map<String, Object?>), t);
    });
  });

  group('boundaries — the transform axis stays separate', () {
    test('non-element nodes may carry a transform — the metadata map is '
        'type-agnostic; no capability gate restricts the key', () {
      final e = engine();
      const t = Transform2D(translation: Point2D(x: 1, y: 2));
      e.apply(
        DocumentCommand.createDesignNode(
          artboardId: 'ab-1',
          node: DesignNode(
            id: 'grp-1',
            name: 'Cluster',
            type: DesignNodeType.group,
            metadata: {'transform': t.toJson()},
          ),
        ),
      );
      final raw = _tree(e).children.single.metadata['transform'];
      expect(Transform2D.fromJson(raw! as Map<String, Object?>), t);
    });

    test('transform key carries only a Map — never a scalar or wire name', () {
      final e = engine();
      const t = Transform2D(scale: 3.0);
      e.apply(
        DocumentCommand.createDesignNode(
          artboardId: 'ab-1',
          node: DesignNode(
            id: 'el-1',
            name: 'Scaled',
            type: DesignNodeType.element,
            metadata: {'transform': t.toJson()},
          ),
        ),
      );
      final raw = _tree(e).children.single.metadata['transform'];
      // The value is always a Map, never a String or num.
      expect(raw, isA<Map<String, Object?>>());
      expect(raw, isNot(isA<String>()));
    });
  });
}

DesignNode _tree(DocumentEngine e) =>
    e.document.artboards.single.designTreeRoot;
