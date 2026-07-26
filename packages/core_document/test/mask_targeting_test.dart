import 'package:core_document/core_document.dart';
import 'package:core_geometry/core_geometry.dart';
import 'package:core_mask/core_mask.dart';
import 'package:core_textile/core_textile.dart';
import 'package:test/test.dart';

import 'support/fixtures.dart';

/// M14 Slice 4 verification suite — Mask Targeting.
///
/// This slice binds NO deferred representation: the approved M14 Q6
/// determination concluded the mask-targeting representation is already
/// frozen — `ApplyMaskCommand.targetId` is an opaque id spanning both
/// tiers, `FebricDocument.masks` is a flat target-agnostic
/// `Map<String, MaskStack>`, and the document engine resolves the id.
/// Slice 4 delivers engine-level VERIFICATION of that determination:
/// no prior test drives `applyMask`/`removeMask` through a real
/// `DocumentEngine` or exercises both tiers.
///
/// DQ-S4-1 (recorded at specification, deferred, NOT resolved here):
/// `ApplyMaskCommand.targetId` and `MaskStack.targetId` are independent
/// fields; the frozen reducer keys the store by the COMMAND's id and
/// stores the stack wholesale, with no consistency validation. Tests in
/// this suite document that frozen behaviour exactly — they assert no
/// consistency rule, because none exists.
void main() {
  group('both tiers — one frozen command targets nodes AND layers (Q6)', () {
    test('applyMask with a design-node targetId stores the stack under '
        'that node id', () {
      final e = engine();
      e.apply(
        const DocumentCommand.createDesignNode(
          artboardId: 'ab-1',
          node: DesignNode(
            id: 'el-1',
            name: 'Boteh',
            type: DesignNodeType.element,
          ),
        ),
      );
      final applied = e.apply(
        DocumentCommand.applyMask(targetId: 'el-1', stack: _stack('el-1')),
      );
      expect(applied, isA<CommandApplied>());
      expect(e.document.masks['el-1'], _stack('el-1'));
    });

    test('applyMask with a layer targetId stores the stack under that '
        'layer id — same command, other tier', () {
      final e = engine();
      final applied = e.apply(
        DocumentCommand.applyMask(
          targetId: 'ab-1-hero',
          stack: _stack('ab-1-hero'),
        ),
      );
      expect(applied, isA<CommandApplied>());
      expect(e.document.masks['ab-1-hero'], _stack('ab-1-hero'));
    });

    test('node-targeted and layer-targeted stacks coexist in the one flat '
        'map without interference', () {
      final e = engine();
      e.apply(
        const DocumentCommand.createDesignNode(
          artboardId: 'ab-1',
          node: DesignNode(
            id: 'el-1',
            name: 'Boteh',
            type: DesignNodeType.element,
          ),
        ),
      );
      e.apply(
        DocumentCommand.applyMask(targetId: 'el-1', stack: _stack('el-1')),
      );
      e.apply(
        DocumentCommand.applyMask(
          targetId: 'ab-1-hero',
          stack: _stack('ab-1-hero'),
        ),
      );
      expect(e.document.masks, hasLength(2));
      expect(e.document.masks.keys, containsAll(['el-1', 'ab-1-hero']));
    });
  });

  group('exact inverses — apply, replace, remove (ADR-0015 I1)', () {
    test('first apply inverts to removeMask: undo clears, redo restores', () {
      final e = engine();
      e.apply(DocumentCommand.applyMask(targetId: 't-1', stack: _stack('t-1')));
      expect(e.document.masks.containsKey('t-1'), isTrue);

      expect(e.undo(), isA<CommandApplied>());
      expect(e.document.masks.containsKey('t-1'), isFalse);
      expect(e.redo(), isA<CommandApplied>());
      expect(e.document.masks['t-1'], _stack('t-1'));
    });

    test('applying over an existing stack inverts to the PREVIOUS stack '
        'verbatim', () {
      final e = engine();
      final first = _stack('t-1');
      final second = _stack('t-1').withEntry(
        const MaskStackEntry(
          mask: MaskModel(
            id: 'mask-2',
            name: 'Subtract Band',
            kind: MaskKind.vectorMask,
          ),
          op: MaskBooleanOp.subtract,
        ),
      );
      e.apply(DocumentCommand.applyMask(targetId: 't-1', stack: first));
      e.apply(DocumentCommand.applyMask(targetId: 't-1', stack: second));
      expect(e.document.masks['t-1'], second);

      // Undo restores the FIRST stack, not absence.
      expect(e.undo(), isA<CommandApplied>());
      expect(e.document.masks['t-1'], first);
    });

    test('removeMask removes and inverts to applyMask with the removed '
        'stack', () {
      final e = engine();
      e.apply(DocumentCommand.applyMask(targetId: 't-1', stack: _stack('t-1')));
      final removed = e.apply(
        const DocumentCommand.removeMask(targetId: 't-1'),
      );
      expect(removed, isA<CommandApplied>());
      expect(e.document.masks.containsKey('t-1'), isFalse);

      expect(e.undo(), isA<CommandApplied>());
      expect(e.document.masks['t-1'], _stack('t-1'));
    });

    test('removeMask on an absent target is rejected notFound — the '
        'frozen behaviour, asserted as such', () {
      final e = engine();
      final result = e.apply(
        const DocumentCommand.removeMask(targetId: 'absent'),
      );
      expect(result, isA<CommandRejected>());
      expect(
        (result as CommandRejected).reason,
        CommandRejectionReason.notFound,
      );
    });
  });

  group('DQ-S4-1 — dual targetId, documented as frozen behaviour', () {
    test('the store is keyed by the COMMAND targetId; the stack\'s own '
        'targetId is preserved verbatim; NO consistency validation exists '
        '(open question DQ-S4-1 — no rule asserted)', () {
      final e = engine();
      // A stack whose own targetId ('inner') differs from the command's
      // ('outer'). The frozen reducer accepts this silently.
      final applied = e.apply(
        DocumentCommand.applyMask(targetId: 'outer', stack: _stack('inner')),
      );
      expect(applied, isA<CommandApplied>());
      // Keyed by the command's id...
      expect(e.document.masks.containsKey('outer'), isTrue);
      expect(e.document.masks.containsKey('inner'), isFalse);
      // ...while the stack's own id is stored verbatim, unreconciled.
      expect(e.document.masks['outer']!.targetId, 'inner');
    });
  });

  group('persistence — masks survive the frozen codec', () {
    test('a mask stack with kind, op, refinements and bounds round-trips '
        'losslessly through .febric', () {
      final e = engine();
      const stack = MaskStack(
        targetId: 'el-1',
        entries: [
          MaskStackEntry(
            mask: MaskModel(
              id: 'mask-1',
              name: 'Sleeve Reveal',
              kind: MaskKind.brushMask,
              inverted: true,
              density: 0.8,
              refinements: [
                MaskRefinement(kind: MaskRefinementKind.feather, amount: 2.5),
                MaskRefinement(kind: MaskRefinementKind.expand, amount: 1.0),
              ],
              bounds: Rect2D(left: 0, top: 0, width: 100, height: 50),
            ),
            op: MaskBooleanOp.intersect,
          ),
        ],
      );
      e.apply(const DocumentCommand.applyMask(targetId: 'el-1', stack: stack));

      const codec = FebricCodec();
      final restored = codec.decode(codec.encode(e.document));
      expect(restored.masks['el-1'], stack);
    });
  });

  group('frozen vocabulary integrity', () {
    test('the six MaskKinds and four MaskBooleanOps round-trip via wire '
        'names', () {
      expect(MaskKind.values, hasLength(6));
      for (final kind in MaskKind.values) {
        expect(MaskKind.fromWireName(kind.wireName), kind);
      }
      expect(MaskBooleanOp.values, hasLength(4));
      for (final op in MaskBooleanOp.values) {
        expect(MaskBooleanOp.fromWireName(op.wireName), op);
      }
    });
  });

  group('boundaries — S1–S3 bindings are independent of masking', () {
    test('a node carrying object_type/transform/repeat is untouched by a '
        'mask stack targeting it', () {
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
              'repeat': {'type': RepeatType.straight.wireName},
            },
          ),
        ),
      );
      e.apply(
        DocumentCommand.applyMask(targetId: 'el-1', stack: _stack('el-1')),
      );

      final node = e.document.artboards.single.designTreeRoot.children.single;
      expect(node.metadata['object_type'], 'motif');
      expect(
        Transform2D.fromJson(
          node.metadata['transform']! as Map<String, Object?>,
        ),
        t,
      );
      expect((node.metadata['repeat']! as Map)['type'], 'straight');
      // The mask lives in the document's flat store, not on the node.
      expect(node.metadata.containsKey('mask'), isFalse);
      expect(e.document.masks['el-1'], isNotNull);
    });
  });
}

/// Minimal single-entry stack fixture (test-supplied content).
MaskStack _stack(String targetId) => MaskStack(
  targetId: targetId,
  entries: const [
    MaskStackEntry(
      mask: MaskModel(id: 'mask-1', name: 'Reveal', kind: MaskKind.layerMask),
    ),
  ],
);
