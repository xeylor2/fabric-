import 'package:core_document/core_document.dart';
import 'package:core_geometry/core_geometry.dart';
import 'package:core_layer/core_layer.dart';
import 'package:core_production/core_production.dart';
import 'package:core_textile/core_textile.dart';
import 'package:test/test.dart';

/// M13A verification suite — Preflight rule engine.
///
/// All thresholds below are TEST-SUPPLIED mill policy: the package ships
/// no threshold values (the approved injected-policy doctrine).
void main() {
  group('freeze — vocabularies', () {
    test('PreflightRuleKind wire names are frozen — the §12 rule classes '
        '+ structure', () {
      expect(PreflightRuleKind.values.map((v) => v.wireName), [
        'effective_dpi',
        'seam_continuity',
        'colour_count',
        'gamut_delta_e',
        'min_feature_size',
        'bleed_allowance',
        'structure',
      ]);
      for (final v in PreflightRuleKind.values) {
        expect(PreflightRuleKind.fromWireName(v.wireName), v);
      }
      expect(
        () => PreflightRuleKind.fromWireName('watermark'),
        throwsArgumentError,
      );
    });

    test('PreflightSeverity wire names are frozen', () {
      expect(PreflightSeverity.values.map((v) => v.wireName), [
        'blocker',
        'warning',
        'info',
      ]);
      for (final v in PreflightSeverity.values) {
        expect(PreflightSeverity.fromWireName(v.wireName), v);
      }
      expect(
        () => PreflightSeverity.fromWireName('fatal'),
        throwsArgumentError,
      );
    });
  });

  group('freeze — model JSON round-trips', () {
    test('finding, thresholds and report round-trip; passed is derived '
        'from blockers only', () {
      const finding = PreflightFinding(
        rule: PreflightRuleKind.effectiveDpi,
        severity: PreflightSeverity.blocker,
        description: 'too low',
        artboardId: 'ab-1',
        targetIds: ['node-1'],
        measurements: {'effectiveDpi': 120.5, 'requiredDpi': 300},
      );
      expect(PreflightFinding.fromJson(finding.toJson()), finding);
      const thresholds = PreflightThresholds(
        minEffectiveDpi: 300,
        maxColours: 8,
        minBleed: 3,
      );
      expect(PreflightThresholds.fromJson(thresholds.toJson()), thresholds);
      const report = PreflightReport(
        jobId: 'pj-1',
        findings: [finding],
        engineVersion: 'static-preflight-1',
      );
      expect(PreflightReport.fromJson(report.toJson()), report);
      expect(report.passed, isFalse);
      const warningsOnly = PreflightReport(
        jobId: 'pj-2',
        findings: [
          PreflightFinding(
            rule: PreflightRuleKind.bleedAllowance,
            severity: PreflightSeverity.warning,
            description: 'no bleed',
          ),
        ],
        engineVersion: 'static-preflight-1',
      );
      expect(warningsOnly.passed, isTrue);
    });
  });

  group('StaticPreflightEngine — the mechanically computable checks', () {
    const engine = StaticPreflightEngine();

    test('a producible document under permissive thresholds passes with '
        'zero findings; version is stamped', () {
      final report = engine.run(_job(), _document());
      expect(report.findings, isEmpty);
      expect(report.passed, isTrue);
      expect(report.jobId, 'pj-1');
      expect(report.engineVersion, 'static-preflight-1');
    });

    test('structure — a missing artboard and a non-positive physical '
        'size are blockers', () {
      final report = engine.run(
        _job(artboardIds: const ['ab-ghost'], width: 0),
        _document(),
      );
      expect(report.passed, isFalse);
      expect(report.findings.map((f) => f.rule), [
        PreflightRuleKind.structure, // size
        PreflightRuleKind.structure, // missing artboard
      ]);
      expect(report.findings[1].artboardId, 'ab-ghost');
    });

    test('structure — an empty design tree is a blocker with the root id '
        'referenced', () {
      final report = engine.run(_job(), _document(emptyTree: true));
      final finding = report.findings.single;
      expect(finding.rule, PreflightRuleKind.structure);
      expect(finding.severity, PreflightSeverity.blocker);
      expect(finding.targetIds, ['ab-1-tree']);
    });

    test('effective_dpi — delegates to the frozen UnitConverter: a '
        '30×45 cm artboard at 300dpi stretched to 64 cm wide falls below '
        '300 effective dpi and blocks; measurements ride the finding', () {
      final report = engine.run(
        _job(), // 64 cm wide
        _document(), // 30 cm wide @ 300dpi
        thresholds: const PreflightThresholds(minEffectiveDpi: 300),
      );
      final finding = report.findings.single;
      expect(finding.rule, PreflightRuleKind.effectiveDpi);
      expect(finding.severity, PreflightSeverity.blocker);
      final effective = finding.measurements['effectiveDpi']! as double;
      // 30cm @300dpi = 3543.3px over 64cm (25.197in) ≈ 140.6 dpi —
      // exactly (30/64)*300 since both convert through the same frozen
      // maths.
      expect(effective, closeTo(300 * 30 / 64, 0.01));
      expect(finding.measurements['requiredDpi'], 300);
    });

    test('effective_dpi — a matching physical size passes at exactly the '
        'threshold', () {
      final report = engine.run(
        _job(width: 30, height: 45), // identical to the artboard
        _document(),
        thresholds: const PreflightThresholds(minEffectiveDpi: 300),
      );
      expect(report.findings, isEmpty);
    });

    test('colour_count — distinct colours from background + the frozen '
        "'colour' metadata key vs the injected limit", () {
      final report = engine.run(
        _job(),
        _document(
          layerColours: const ['#AA0000', '#00AA00', '#0000AA', '#AA0000'],
        ),
        thresholds: const PreflightThresholds(maxColours: 3),
      );
      final finding = report.findings.single;
      expect(finding.rule, PreflightRuleKind.colourCount);
      // 3 distinct layer colours + background = 4 > 3.
      expect(finding.measurements['colourCount'], 4);
      expect(finding.measurements['maxColours'], 3);
      // At the limit: 4 allowed → passes.
      final atLimit = engine.run(
        _job(),
        _document(
          layerColours: const ['#AA0000', '#00AA00', '#0000AA', '#AA0000'],
        ),
        thresholds: const PreflightThresholds(maxColours: 4),
      );
      expect(atLimit.findings, isEmpty);
    });

    test('bleed_allowance — presence check: threshold with no declared '
        'bleed is a warning (report still passes); declared bleed '
        'silences it', () {
      final report = engine.run(
        _job(),
        _document(),
        thresholds: const PreflightThresholds(minBleed: 3),
      );
      final finding = report.findings.single;
      expect(finding.rule, PreflightRuleKind.bleedAllowance);
      expect(finding.severity, PreflightSeverity.warning);
      expect(report.passed, isTrue);
      final declared = engine.run(
        _job(metadata: const {'bleedMm': 3.0}),
        _document(),
        thresholds: const PreflightThresholds(minBleed: 3),
      );
      expect(declared.findings, isEmpty);
    });

    test('null thresholds disable their checks (injected policy — the '
        'package ships no values)', () {
      // Deliberately hostile document; no thresholds → only structural
      // checks run, and this document is structurally fine.
      final report = engine.run(
        _job(),
        _document(layerColours: List.filled(40, '#123456')),
      );
      expect(report.findings, isEmpty);
    });

    test('findings accumulate across artboards and rules; determinism: '
        'same inputs → same report', () {
      final job = _job(artboardIds: const ['ab-1', 'ab-ghost']);
      final doc = _document(emptyTree: true);
      const thresholds = PreflightThresholds(minEffectiveDpi: 300, minBleed: 3);
      final a = engine.run(job, doc, thresholds: thresholds);
      final b = engine.run(job, doc, thresholds: thresholds);
      expect(a, b);
      expect(a.findings.map((f) => f.rule), [
        PreflightRuleKind.structure, // ab-1 empty tree
        PreflightRuleKind.effectiveDpi, // ab-1 under-resolved
        PreflightRuleKind.structure, // ab-ghost missing
        PreflightRuleKind.bleedAllowance, // no bleed declared
      ]);
      expect(a.passed, isFalse);
    });
  });

  group('frozen write-path — the read side matches the bus by '
      'construction', () {
    test('colours applied through the REAL frozen bus '
        "(DocumentCommand.changeColour → reducer key 'colour') are "
        'counted by preflight', () {
      // Real engine; colours land only through frozen commands (I1).
      final engine = DocumentEngine(document: _document());
      for (final (i, hex) in const ['#AA0000', '#00AA00', '#0000AA'].indexed) {
        final result = engine.apply(
          DocumentCommand.createLayer(
            artboardId: 'ab-1',
            layer: LayerModel(
              id: 'bus-l-$i',
              name: 'Bus Layer $i',
              kind: LayerKind.pattern,
            ),
          ),
        );
        expect(result, isA<CommandApplied>());
        expect(
          engine.apply(
            DocumentCommand.changeColour(
              artboardId: 'ab-1',
              layerId: 'bus-l-$i',
              operation: ColourOperation.shiftMotifColour,
              colourHex: hex,
            ),
          ),
          isA<CommandApplied>(),
        );
      }
      final report = const StaticPreflightEngine().run(
        _job(),
        engine.document,
        thresholds: const PreflightThresholds(maxColours: 3),
      );
      final finding = report.findings.single;
      expect(finding.rule, PreflightRuleKind.colourCount);
      // 3 bus-written colours + background = 4 > 3.
      expect(finding.measurements['colourCount'], 4);
    });
  });

  group('end-to-end — preflight gates the §12 stage machine', () {
    test('a passed report advances the job into preflight-complete; a '
        'blocked one leaves the caller holding a planned job', () {
      const engine = StaticPreflightEngine();
      final job = _job();
      final report = engine.run(job, _document());
      expect(report.passed, isTrue);
      final advanced = job.advanceTo(ProductionStage.preflight);
      expect(advanced.currentStage, ProductionStage.preflight);
      expect(advanced.nextStage, ProductionStage.render);

      final blocked = engine.run(
        _job(artboardIds: const ['ab-ghost']),
        _document(),
      );
      expect(blocked.passed, isFalse);
      // The stage machine is values: the caller simply does not advance.
      expect(job.completed, isEmpty);
    });
  });
}

// ---------------------------------------------------------------------------
// Fixtures (real frozen models; thresholds are test-supplied policy).
// ---------------------------------------------------------------------------

ProductionJob _job({
  List<String> artboardIds = const ['ab-1'],
  double width = 64,
  double height = 64,
  Map<String, Object?> metadata = const {},
}) => ProductionJob(
  id: 'pj-1',
  documentId: 'doc-1',
  artboardIds: artboardIds,
  deliverable: ProductionDeliverable.repeatTile,
  physicalSize: Size2D(width: width, height: height),
  unit: MeasurementUnit.centimetre,
  metadata: metadata,
);

FebricDocument _document({
  bool emptyTree = false,
  List<String> layerColours = const [],
}) {
  final t0 = DateTime.utc(2026, 7, 20, 18);
  return FebricDocument(
    id: const DocumentId('doc-1'),
    projectId: const ProjectId('project-1'),
    manifest: const DocumentManifest(
      version: DocumentVersion(
        schema: DocumentVersion.currentSchema,
        generator: 'febric-test',
      ),
    ),
    metadata: DocumentMetadata(
      title: 'M13A Preflight',
      author: 'designer-1',
      createdAt: t0,
      modifiedAt: t0,
    ),
    artboards: [
      Artboard(
        id: 'ab-1',
        name: 'Front Panel',
        size: const Size2D(width: 30, height: 45),
        unit: MeasurementUnit.centimetre,
        dpi: 300,
        backgroundColourHex: '#F0EADD',
        layerRoot: LayerModel(
          id: 'ab-1-layers',
          name: 'Layers',
          kind: LayerKind.artboard,
          children: [
            for (final (i, hex) in layerColours.indexed)
              LayerModel(
                id: 'l-$i',
                name: 'Layer $i',
                kind: LayerKind.pattern,
                // The frozen key the bus writes (changeColour → reducer
                // `_delegateLayerMetadata(key: 'colour')`).
                metadata: {'colour': hex},
              ),
          ],
        ),
        designTreeRoot: DesignNode(
          id: 'ab-1-tree',
          name: 'Artwork',
          type: DesignNodeType.artwork,
          children: emptyTree
              ? const []
              : const [
                  DesignNode(
                    id: 'node-hero',
                    name: 'Hero Motif',
                    type: DesignNodeType.element,
                  ),
                ],
        ),
      ),
    ],
  );
}
