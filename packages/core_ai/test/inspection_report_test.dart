import 'package:core_ai/core_ai.dart';
import 'package:core_textile/core_textile.dart';
import 'package:test/test.dart';

/// M12G-1 verification suite — InspectionReport model family.
void main() {
  group('freeze — vocabularies', () {
    test('MotifRole wire names are frozen — hero, secondary, filler (§7)', () {
      expect(MotifRole.values.map((v) => v.wireName), [
        'hero',
        'secondary',
        'filler',
      ]);
      for (final v in MotifRole.values) {
        expect(MotifRole.fromWireName(v.wireName), v);
      }
      expect(() => MotifRole.fromWireName('accent'), throwsArgumentError);
    });

    test(
      'InspectionRegionKind wire names are frozen — printable, editable',
      () {
        expect(InspectionRegionKind.values.map((v) => v.wireName), [
          'printable',
          'editable',
        ]);
        for (final v in InspectionRegionKind.values) {
          expect(InspectionRegionKind.fromWireName(v.wireName), v);
        }
        expect(
          () => InspectionRegionKind.fromWireName('locked'),
          throwsArgumentError,
        );
      },
    );
  });

  group(
    'freeze — model JSON round-trips (frozen vocabularies on the wire)',
    () {
      test('full report round-trips; every frozen vocabulary serializes by '
          'wire name', () {
        final report = _report();
        expect(InspectionReport.fromJson(report.toJson()), report);
        final json = report.toJson();
        expect(json['operation'], 'fabric_restoration');
        expect(json['garment'], 'kurta');
        expect(json['pattern'], 'straight');
        expect(json['provider'], 'claude');
        final structure = json['structure']! as List;
        expect((structure[0] as Map)['part'], 'sleeve');
        final motifs = json['motifs']! as List;
        expect((motifs[0] as Map)['role'], 'hero');
        final regions = json['regions']! as List;
        expect((regions[0] as Map)['kind'], 'printable');
      });

      test('minimal report: undetermined garment/pattern/tree serialize as '
          'null and restore', () {
        const minimal = InspectionReport(
          id: 'rep-min',
          operation: AiOperation.fabricRestoration,
          promptHash: 'sha256:m12g',
          provider: AiProviderId.claude,
          model: 'claude-fable-5',
          constraintVersion: '1.0.0',
          toolVersion: '0.1.0',
        );
        final restored = InspectionReport.fromJson(minimal.toJson());
        expect(restored, minimal);
        expect(restored.garment, isNull);
        expect(restored.pattern, isNull);
        expect(restored.treeProposal, isNull);
        expect(restored.structure, isEmpty);
        expect(restored.regions, isEmpty);
      });

      test('treeProposal round-trips as a frozen DesignNode subtree', () {
        final restored = InspectionReport.fromJson(_report().toJson());
        final tree = restored.treeProposal!;
        expect(tree.type, DesignNodeType.artwork);
        expect(tree.children.single.type, DesignNodeType.element);
      });
    },
  );

  group('identifier-based references only (the approved determination)', () {
    test('regions/motifs/structure reference nodes and masks by id — the '
        'models carry no geometry', () {
      final report = _report();
      expect(report.regions.single.targetNodeIds, ['node-field']);
      expect(report.regions.single.maskIds, ['mask-print']);
      expect(report.motifs.single.maskIds, ['mask-hero']);
      expect(report.structure.single.nodeId, 'node-sleeve');
      // Type-level proof: these are List<String>/String? fields; nothing
      // else spatial exists on the models (compile-time guarantee).
    });
  });

  group('confidence bounds (§7 per-finding confidence, @Assert)', () {
    test('out-of-range confidence is rejected on every finding type', () {
      expect(
        () => InspectionRegion(
          id: 'r',
          kind: InspectionRegionKind.printable,
          confidence: 1.5,
        ),
        throwsA(isA<AssertionError>()),
      );
      expect(
        () => StructureFinding(part: GarmentPart.sleeve, confidence: -0.1),
        throwsA(isA<AssertionError>()),
      );
      expect(
        () => MotifFinding(id: 'm', role: MotifRole.hero, confidence: 2),
        throwsA(isA<AssertionError>()),
      );
      expect(
        () => BorderFinding(id: 'b', confidence: -1),
        throwsA(isA<AssertionError>()),
      );
      expect(
        () => _report(garmentConfidence: 1.01),
        throwsA(isA<AssertionError>()),
      );
    });

    test('boundary values 0 and 1 pass', () {
      expect(
        const MotifFinding(
          id: 'm',
          role: MotifRole.filler,
          confidence: 0,
        ).confidence,
        0,
      );
      expect(
        const InspectionRegion(
          id: 'r',
          kind: InspectionRegionKind.editable,
          confidence: 1,
        ).confidence,
        1,
      );
    });
  });
}

InspectionReport _report({double garmentConfidence = 0.92}) {
  return InspectionReport(
    id: 'rep-1',
    operation: AiOperation.fabricRestoration,
    garment: GarmentType.kurta,
    garmentConfidence: garmentConfidence,
    fabricGuess: 'lawn',
    structure: const [
      StructureFinding(
        part: GarmentPart.sleeve,
        nodeId: 'node-sleeve',
        confidence: 0.88,
      ),
    ],
    pattern: RepeatType.straight,
    motifs: const [
      MotifFinding(
        id: 'motif-1',
        role: MotifRole.hero,
        nodeId: 'node-hero',
        maskIds: ['mask-hero'],
        confidence: 0.95,
      ),
    ],
    borders: const [
      BorderFinding(id: 'border-1', nodeId: 'node-border', confidence: 0.8),
    ],
    palette: const ['#AA0000', '#F0EADD'],
    regions: const [
      InspectionRegion(
        id: 'region-1',
        kind: InspectionRegionKind.printable,
        targetNodeIds: ['node-field'],
        maskIds: ['mask-print'],
        confidence: 0.9,
      ),
    ],
    treeProposal: const DesignNode(
      id: 'node-artwork',
      name: 'Artwork',
      type: DesignNodeType.artwork,
      children: [
        DesignNode(
          id: 'node-hero',
          name: 'Hero Motif',
          type: DesignNodeType.element,
        ),
      ],
    ),
    promptHash: 'sha256:m12g',
    templateId: 'inspect-v1',
    provider: AiProviderId.claude,
    model: 'claude-fable-5',
    constraintVersion: '1.0.0',
    toolVersion: '0.1.0',
  );
}
